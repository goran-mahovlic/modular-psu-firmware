/*
 * EEZ Modular Firmware
 * Copyright (C) 2015-present, Envox d.o.o.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#if OPTION_DISPLAY

#include <eez/gui/widgets/yt_graph.h>

#include <math.h>
#include <limits.h>

#include <eez/gui/draw.h>
#include <eez/gui/gui.h>
#include <eez/modules/mcu/display.h>
#include <eez/util.h>

using namespace eez::mcu;

#define CONF_GUI_YT_GRAPH_BLANK_PIXELS_AFTER_CURSOR 10

namespace eez {
namespace gui {

////////////////////////////////////////////////////////////////////////////////

struct YTGraphDrawHelper {
    const WidgetCursor &widgetCursor;
    const Widget *widget;

    float min[2];
    float max[2];

    uint16_t color16;
    uint16_t dataColor16[2];

    uint32_t numPositions;
    uint32_t position;

    int x;

    int yPrev[2];
    int y[2];

    Value::YtDataGetValueFunctionPointer ytDataGetValue;

    YTGraphDrawHelper(const WidgetCursor &widgetCursor_) : widgetCursor(widgetCursor_), widget(widgetCursor.widget) {
        min[0] = data::ytDataGetMin(widgetCursor.cursor, widget->data, 0).getFloat();
        max[0] = data::ytDataGetMax(widgetCursor.cursor, widget->data, 0).getFloat();

        min[1] = data::ytDataGetMin(widgetCursor.cursor, widget->data, 1).getFloat();
        max[1] = data::ytDataGetMax(widgetCursor.cursor, widget->data, 1).getFloat();

        const Style* y1Style = data::ytDataGetStyle(widgetCursor.cursor, widget->data, 0);
        const Style* y2Style = data::ytDataGetStyle(widgetCursor.cursor, widget->data, 1);
        dataColor16[0] = display::getColor16FromIndex(y1Style->color);
        dataColor16[1] = display::getColor16FromIndex(y2Style->color);

        ytDataGetValue = data::ytDataGetGetValueFunc(widgetCursor.cursor, widget->data);
    }

    int getYValue(int valueIndex, uint32_t position) {
        if (position >= numPositions) {
            return INT_MIN;
        }

        float value = ytDataGetValue(position, valueIndex, nullptr);

        if (isNaN(value)) {
            return INT_MIN;
        }

        int y = (int)round((widget->h - 1) * (value - min[valueIndex]) / (max[valueIndex] - min[valueIndex]));

        if (y < 0 || y >= widget->h) {
            return INT_MIN;
        }

        return widget->h - 1 - y;
    }

    void drawValue(int valueIndex) {
        if (y[valueIndex] == INT_MIN) {
            return;
        }

        display::setColor16(dataColor16[valueIndex]);

        if (yPrev[valueIndex] == INT_MIN || abs(yPrev[valueIndex] - y[valueIndex]) <= 1) {
            display::drawPixel(x, widgetCursor.y + y[valueIndex]);
        } else {
            if (yPrev[valueIndex] < y[valueIndex]) {
                display::drawVLine(x, widgetCursor.y + yPrev[valueIndex] + 1, y[valueIndex] - yPrev[valueIndex] - 1);
            } else {
                display::drawVLine(x, widgetCursor.y + y[valueIndex], yPrev[valueIndex] - y[valueIndex] - 1);
            }
        }
    }

    void drawStep() {
        if (y[0] != INT_MIN && y[1] != INT_MIN && abs(yPrev[0] - y[0]) <= 1 && abs(yPrev[1] - y[1]) <= 1 && y[0] == y[1]) {
            display::setColor16(position % 2 ? dataColor16[1] : dataColor16[0]);
            display::drawPixel(x, widgetCursor.y + y[0]);
        } else {
            drawValue(0);
            drawValue(1);
        }
    }

    void drawScanLine(uint32_t startPosition, uint32_t endPosition, uint16_t graphWidth) {
        numPositions = endPosition;

        int x1 = widgetCursor.x + startPosition % graphWidth;
        int x2 = widgetCursor.x + (endPosition - 1) % graphWidth;
        display::setColor16(color16);
        if (x1 <= x2) {
            display::fillRect(x1, widgetCursor.y, x2, widgetCursor.y + widget->h - 1);
        } else {
            display::fillRect(x1, widgetCursor.y, widgetCursor.x + widget->w - 1, widgetCursor.y + widget->h - 1);
            display::fillRect(widgetCursor.x, widgetCursor.y, x2, widgetCursor.y + widget->h - 1);
        }

        for (position = startPosition; position < endPosition; ++position) {
            x = widgetCursor.x + position % graphWidth;

            y[0] = getYValue(0, position);
            yPrev[0] = getYValue(0, position == 0 ? position : position - 1);

            y[1] = getYValue(1, position);
            yPrev[1] = getYValue(1, position == 0 ? position : position - 1);

            drawStep();
        }
    }

    void drawScrolling(uint32_t previousHistoryValuePosition, uint32_t currentHistoryValuePosition, uint32_t numPositions_, uint16_t graphWidth) {
        uint32_t numPointsToDraw = currentHistoryValuePosition - previousHistoryValuePosition;
        if (numPointsToDraw > graphWidth) {
            numPointsToDraw = graphWidth;
        }

        if (numPointsToDraw < graphWidth) {
            display::bitBlt(
                widgetCursor.x + numPointsToDraw,
                widgetCursor.y,
                widgetCursor.x + graphWidth - 1,
                widgetCursor.y + widgetCursor.widget->h - 1,
                widgetCursor.x,
                widgetCursor.y);
        }

        int endX = widgetCursor.x + graphWidth;
        int startX = endX - numPointsToDraw;

        position = previousHistoryValuePosition + 1;

        numPositions = position + numPointsToDraw;

        yPrev[0] = getYValue(0, previousHistoryValuePosition);
        yPrev[1] = getYValue(1, previousHistoryValuePosition);

        display::setColor16(color16);
        display::fillRect(startX, widgetCursor.y, endX - 1, widgetCursor.y + widget->h - 1);

        for (x = startX; x < endX; x++, position++) {
            y[0] = getYValue(0, position);
            y[1] = getYValue(1, position);

            drawStep();

            yPrev[0] = y[0];
            yPrev[1] = y[1];
        }
    }
};

////////////////////////////////////////////////////////////////////////////////

struct YTGraphStaticDrawHelper {
    const WidgetCursor &widgetCursor;
    const Widget *widget;

    Style* style;

    uint16_t dataColor16;

    uint32_t numPositions;
    uint32_t position;

    float offset;
    float scale;

    int m_valueIndex;

    int x;

    int yPrevMin;
    int yPrevMax;
    int yMin;
    int yMax;

    uint32_t cursorPosition;

    Value::YtDataGetValueFunctionPointer ytDataGetValue;

    YTGraphStaticDrawHelper(const WidgetCursor &widgetCursor_) : widgetCursor(widgetCursor_), widget(widgetCursor.widget) {
        ytDataGetValue = data::ytDataGetGetValueFunc(widgetCursor.cursor, widget->data);
    }

    void getYValue(uint32_t position, int &min, int &max) {
        if (position >= numPositions) {
            max = INT_MIN;
            min = INT_MIN;
        } else {
            float fMax;
            float fMin = ytDataGetValue(position, m_valueIndex, &fMax);

            if (isNaN(fMin)) {
                max = INT_MIN;
            } else {
                max = widget->h - 1 - (int)floor(widget->h / 2.0f + (fMin + offset) * scale);
            }

            if (isNaN(fMax)) {
                min = INT_MIN;
            } else {
                min = widget->h - 1 - (int)floor(widget->h / 2.0f + (fMax + offset) * scale);
            }
        }
    }

    void drawValue() {
        if (yMin == INT_MIN) {
            return;
        }

        display::setColor16(dataColor16);

        int yFrom;
        int yTo;

        if (yPrevMax == INT_MIN) {
            yFrom = yMin;
            yTo = yMax;
        } else {
            if (yPrevMax < yMin) {
                yFrom = yPrevMax + 1;
                yTo = yMax;
            } else if (yMax < yPrevMin) {
                yFrom = yMin;
                yTo = yPrevMin - 1;
            } else {
                yFrom = yMin;
                yTo = yMax;
            }
        }

        if ((yFrom < 0 && yTo < 0) || (yFrom >= widget->h && yTo >= widget->h)) {
            return;
        }

        if (yFrom < 0) {
            yFrom = 0;
        }

        if (yTo >= widget->h) {
            yTo = widget->h - 1;
        }

        if (yFrom == yTo) {
            display::drawPixel(x, widgetCursor.y + yFrom);
        } else {
            display::drawVLine(x, widgetCursor.y + yFrom, yTo - yFrom);
        }
    }

    void getMinMax(int *yLabels, int n, int &yMin, int &yMax) {
        yMin = INT_MAX;
        yMax = INT_MIN;
        for (int i = 0; i < n; i++) {
            if (yLabels[i] < yMin) {
                yMin = yLabels[i];
            }
            if (yLabels[i] > yMax) {
                yMax = yLabels[i];
            }
        }
    }

    void repositionLabels(int *yLabels, int n, int labelHeight) {
        for (int i = 0; i < n; i++) {
            yLabels[i] = yLabels[i] - labelHeight;
        }

        if (n <= 4) {
            int yMin = INT_MAX;
            int yMax = INT_MIN;
            getMinMax(yLabels, n, yMin, yMax);

            int center = (yMin + yMax) / 2;

            static const int MOVEMENT_FACTOR = 1;
            static const int MAX_ITERATIONS = 100;

            bool hasOverlaps = true;
            int iteration = 0;
            for (int iteration = 0; hasOverlaps && iteration < MAX_ITERATIONS; iteration++) {
                hasOverlaps = false;

                for (int i = 0; i < n; i++) {
                    int move = false;
                    int movement = 0;

                    for (int j = 0; j < n; j++) {
                        if (i == j) {
                            continue;
                        }
                        int diff = yLabels[i] - yLabels[j];
                        if (abs(diff) <= labelHeight) {
                            move = true;
                            movement += diff < 0 ? -MOVEMENT_FACTOR : MOVEMENT_FACTOR;
                        }
                    }

                    if (move) {
                        hasOverlaps = true;
                        int diff = yLabels[i] - center;
                        movement += diff < 0 ? -MOVEMENT_FACTOR : MOVEMENT_FACTOR;
                        yLabels[i] += movement;
                    }
                }
            }
        }

        for (int i = 0; i < n; i++) {
            if (yLabels[i] < widgetCursor.y) {
                yLabels[i] = widgetCursor.y;
            } else if (yLabels[i] > widgetCursor.y + widgetCursor.widget->h - labelHeight) {
                yLabels[i] = widgetCursor.y + widgetCursor.widget->h - labelHeight;
            }
        }
    }

    void drawStatic(uint32_t previousHistoryValuePosition, uint32_t currentHistoryValuePosition, uint32_t numPositions_, uint16_t graphWidth, bool showLabels) {
        // draw background
        const Style* style = getStyle(widget->style);
        display::setColor(style->background_color);
        display::fillRect(widgetCursor.x, widgetCursor.y, widgetCursor.x + (int)widget->w - 1, widgetCursor.y + (int)widget->h - 1);

        numPositions = numPositions_;

        int startX = widgetCursor.x;
        int endX = startX + graphWidth;

        int horzDivisions = data::ytDataGetHorzDivisions(widgetCursor.cursor, widget->data);
        int vertDivisions = data::ytDataGetVertDivisions(widgetCursor.cursor, widget->data);

        // draw grid
        display::setColor(style->border_color);
        for (int x = 1; x < horzDivisions; x++) {
            display::drawVLine(widgetCursor.x + x * widget->w / horzDivisions, widgetCursor.y, widget->h - 1);
        }
        for (int y = 1; y < vertDivisions; y++) {
            display::drawHLine(widgetCursor.x, widgetCursor.y + y * widget->h / vertDivisions, widget->w - 1);
        }

        // draw charts
        YTGraphWidgetState *currentState = (YTGraphWidgetState *)widgetCursor.currentState;

        int xLabels[MAX_NUM_OF_Y_VALUES];
        int yLabels[MAX_NUM_OF_Y_VALUES];
        int numVisibleValues = 0;

        for (m_valueIndex = 0; m_valueIndex < MAX_NUM_OF_Y_VALUES; m_valueIndex++) {
            if (data::ytDataDataValueIsVisible(widgetCursor.cursor, widget->data, m_valueIndex)) {
                position = currentHistoryValuePosition;

                scale = (widget->h - 1) / currentState->valueDiv[m_valueIndex] / vertDivisions;
                offset = currentState->valueOffset[m_valueIndex];

                const Style* style = data::ytDataGetStyle(widgetCursor.cursor, widget->data, numVisibleValues);
                dataColor16 = display::getColor16FromIndex(style->color);

                getYValue(position > 0 ? position - 1 : 0, yPrevMin, yPrevMax);

                for (x = startX; x < endX; x++, position++) {
                    getYValue(position, yMin, yMax);
                    drawValue();
                    yPrevMin = yMin;
                    yPrevMax = yMax;
                    if (yMin != INT_MIN) {
                        xLabels[numVisibleValues] = x;
                        yLabels[numVisibleValues] = widgetCursor.y + yMin;
                    }
                }

                numVisibleValues++;
            }
        }

        // draw cursor
        if (data::ytDataIsCursorVisible(widgetCursor.cursor, widgetCursor.widget->data)) {
            display::setColor(style->color);
            display::drawVLine(startX + cursorPosition - currentHistoryValuePosition, widgetCursor.y, widget->h - 1);

            int timeTextWidth = 75;
            int timeTextHeight = 22;
            const int PADDING = 0;
            int xTimeText = widgetCursor.x + cursorPosition - currentHistoryValuePosition - timeTextWidth / 2;
            if (xTimeText < widgetCursor.x + PADDING) {
                xTimeText = widgetCursor.x + PADDING;
            } else if (xTimeText + timeTextWidth > widgetCursor.x + widgetCursor.widget->w - PADDING) {
                xTimeText = widgetCursor.x + widgetCursor.widget->w - PADDING - timeTextWidth;
            }
            int yTimeText = widgetCursor.y + widgetCursor.widget->h - timeTextHeight - PADDING;

            char text[64];
            data::ytDataGetCursorXValue(widgetCursor.cursor, widgetCursor.widget->data).toText(text, sizeof(text));
            drawText(text, -1, xTimeText, yTimeText, timeTextWidth, timeTextHeight, style, false, false, false, nullptr, nullptr, nullptr, nullptr);
        }

        // draw labels
        if (showLabels) {
            font::Font font = styleGetFont(style);
            int labelHeight = font.getHeight();

            repositionLabels(yLabels, numVisibleValues, labelHeight);

            for (int i = 0; i < numVisibleValues; i++) {
                const Style *labelStyle = data::ytDataGetStyle(widgetCursor.cursor, widget->data, i);

                char labelText[64];
                data::ytDataGetLabel(widgetCursor.cursor, widget->data, i, labelText, sizeof(labelText));
                int labelWidth = display::measureStr(labelText, -1, font, widgetCursor.widget->w);

                int xLabel = xLabels[i];
                if (xLabel < widgetCursor.x) {
                    xLabel = widgetCursor.x;
                } else if (xLabel > widgetCursor.x + widgetCursor.widget->w - labelWidth) {
                    xLabel = widgetCursor.x + widgetCursor.widget->w - labelWidth;
                }

                drawText(labelText, -1, xLabel, yLabels[i], labelWidth, labelHeight, labelStyle, false, false, false, nullptr, nullptr, nullptr, nullptr);
            }
        }
    }
};

////////////////////////////////////////////////////////////////////////////////

void YTGraphWidget_draw(const WidgetCursor &widgetCursor) {
    const Widget *widget = widgetCursor.widget;

    YTGraphWidgetState *currentState = (YTGraphWidgetState *)widgetCursor.currentState;
    YTGraphWidgetState *previousState = (YTGraphWidgetState *)widgetCursor.previousState;

    widgetCursor.currentState->size = sizeof(YTGraphWidgetState);
    widgetCursor.currentState->data = data::get(widgetCursor.cursor, widget->data);

    currentState->refreshCounter = data::ytDataGetRefreshCounter(widgetCursor.cursor, widget->data);
    currentState->iChannel = widgetCursor.cursor.i;
    currentState->numHistoryValues = data::ytDataGetSize(widgetCursor.cursor, widget->data);
    currentState->historyValuePosition = data::ytDataGetPosition(widgetCursor.cursor, widget->data);
    currentState->ytGraphUpdateMethod = data::ytDataGetGraphUpdateMethod(widgetCursor.cursor, widget->data);
    currentState->cursorPosition = currentState->historyValuePosition + data::ytDataGetCursorOffset(widgetCursor.cursor, widget->data);

    bool visibleValuesChanged = false;

    currentState->showLabels = data::ytDataGetShowLabels(widgetCursor.cursor, widget->data);

    if (currentState->ytGraphUpdateMethod == YT_GRAPH_UPDATE_METHOD_STATIC) {
        for (int valueIndex = 0; valueIndex < MAX_NUM_OF_Y_VALUES; valueIndex++) {
            currentState->valueIsVisible[valueIndex] = data::ytDataDataValueIsVisible(widgetCursor.cursor, widget->data, valueIndex);
            currentState->valueDiv[valueIndex] = data::ytDataGetDiv(widgetCursor.cursor, widget->data, valueIndex);
            currentState->valueOffset[valueIndex] = data::ytDataGetOffset(widgetCursor.cursor, widget->data, valueIndex);
            if (previousState && (previousState->valueIsVisible[valueIndex] != currentState->valueIsVisible[valueIndex] || previousState->valueDiv[valueIndex] != currentState->valueDiv[valueIndex] || previousState->valueOffset[valueIndex] != currentState->valueOffset[valueIndex])) {
                visibleValuesChanged = true;
            }
        }
    }
    uint16_t graphWidth = (uint16_t)widget->w;

    uint32_t previousHistoryValuePosition;
    if (widgetCursor.previousState &&
        previousState->iChannel == currentState->iChannel &&
        previousState->ytGraphUpdateMethod == currentState->ytGraphUpdateMethod &&
        previousState->refreshCounter == currentState->refreshCounter)
    {
        previousHistoryValuePosition = previousState->historyValuePosition;
    } else {
        previousHistoryValuePosition = currentState->historyValuePosition - graphWidth;
    }

    bool refreshBackground = !widgetCursor.previousState;

    if (
        refreshBackground || 
        currentState->showLabels != previousState->showLabels ||
        visibleValuesChanged || 
        previousHistoryValuePosition != currentState->historyValuePosition || 
        (!previousState || previousState->numHistoryValues != currentState->numHistoryValues || previousState->cursorPosition != currentState->cursorPosition)
    ) {
        if (currentState->ytGraphUpdateMethod == YT_GRAPH_UPDATE_METHOD_STATIC) {
            YTGraphStaticDrawHelper drawHelper(widgetCursor);

            drawHelper.cursorPosition = currentState->cursorPosition;
            drawHelper.drawStatic(previousHistoryValuePosition, currentState->historyValuePosition, currentState->numHistoryValues, graphWidth, currentState->showLabels);
        } else {
            const Style* style = getStyle(widget->style);

            if (refreshBackground) {
                display::setColor(style->background_color);
                display::fillRect(widgetCursor.x, widgetCursor.y, widgetCursor.x + (int)widget->w - 1, widgetCursor.y + (int)widget->h - 1);
            }

            YTGraphDrawHelper drawHelper(widgetCursor);
            drawHelper.color16 = display::getColor16FromIndex(widgetCursor.currentState->flags.active ? style->color : style->background_color);
            if (currentState->ytGraphUpdateMethod == YT_GRAPH_UPDATE_METHOD_SCAN_LINE) {
                drawHelper.drawScanLine(previousHistoryValuePosition, currentState->historyValuePosition, graphWidth);

                int x = widgetCursor.x;

                // draw cursor
                display::setColor(style->color);
                display::drawVLine(x + currentState->historyValuePosition % graphWidth, widgetCursor.y, (int)widget->h - 1);

                // draw blank lines
                int x1 = x + (currentState->historyValuePosition + 1) % graphWidth;
                int x2 = x + (currentState->historyValuePosition + CONF_GUI_YT_GRAPH_BLANK_PIXELS_AFTER_CURSOR) % graphWidth;

                display::setColor(style->background_color);
                if (x1 < x2) {
                    display::fillRect(x1, widgetCursor.y, x2, widgetCursor.y + (int)widget->h - 1);
                } else {
                    display::fillRect(x1, widgetCursor.y, x + graphWidth - 1, widgetCursor.y + (int)widget->h - 1);
                    display::fillRect(x, widgetCursor.y, x2, widgetCursor.y + (int)widget->h - 1);
                }
            } else if (currentState->ytGraphUpdateMethod == YT_GRAPH_UPDATE_METHOD_SCROLL) {
                drawHelper.drawScrolling(previousHistoryValuePosition, currentState->historyValuePosition, currentState->numHistoryValues, graphWidth);
            }
        }
    }
}

void YTGraphWidget_onTouch(const WidgetCursor &widgetCursor, Event &touchEvent) {
    if (data::ytDataGetGraphUpdateMethod(widgetCursor.cursor, widgetCursor.widget->data) == YT_GRAPH_UPDATE_METHOD_STATIC) {
        if (touchEvent.type == EVENT_TYPE_TOUCH_DOWN || touchEvent.type == EVENT_TYPE_TOUCH_MOVE) {
            data::TouchDrag touchDrag;
            touchDrag.type = touchEvent.type;
            touchDrag.x = touchEvent.x - widgetCursor.x;
            touchDrag.y = touchEvent.y - widgetCursor.y;
            data::ytDataTouchDrag(widgetCursor.cursor, widgetCursor.widget->data, &touchDrag);
        }
    } else {
        if (touchEvent.type == EVENT_TYPE_TOUCH_DOWN) {
            if (widgetCursor.widget->action) {
                executeAction(widgetCursor.widget->action);
            }
        }
    }
}

} // namespace gui
} // namespace eez

#endif
