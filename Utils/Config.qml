pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root
    property QtObject radius
    property QtObject padding
    property QtObject spacing
    property QtObject easing
    property QtObject durations
    property QtObject colors
    property QtObject font
    Colors {
        id: matugen_colors
    }

    font: QtObject {
        property string family:         'Google Sans Flex'
    }

    colors: QtObject {
        property color bg:                      matugen_colors.surface
        property color bgAlt:                  matugen_colors.background
        property color onBgAlt:               matugen_colors.on_background
        property color containerLowest:        matugen_colors.surface_container_lowest
        property color containerLow:           matugen_colors.surface_container_low
        property color containerMed:           matugen_colors.surface_container
        property color containerHigh:          matugen_colors.surface_container_high
        property color containerHighest:       matugen_colors.surface_container_highest
        property color primaryContainer:       matugen_colors.primary_container
        property color onPrimaryContainer:    matugen_colors.on_primary_container
        property color secondaryContainer:      matugen_colors.secondary_container
        property color onSecondaryContainer:    matugen_colors.on_secondary_container
        property color tertiaryContainer:       matugen_colors.tertiary_container
        property color onTertiaryContainer:     matugen_colors.on_tertiary_container
        property color primary:                 matugen_colors.primary
        property color onPrimary:              matugen_colors.on_primary
        property color primaryFix:             matugen_colors.primary_fixed
        property color primaryFixDim:         matugen_colors.primary_fixed_dim
        property color secondary:               matugen_colors.secondary
        property color onSecondary:            matugen_colors.on_secondary
        property color secondaryFix:           matugen_colors.secondary_fixed
        property color secondaryFixDim:       matugen_colors.secondary_fixed_dim
        property color tertiary:                matugen_colors.tertiary
        property color onTertiary:             matugen_colors.on_tertiary
        property color tertiaryFix:            matugen_colors.tertiary_fixed
        property color tertiaryFixDim:        matugen_colors.tertiary_fixed_dim
        
    }
    easing: QtObject {
        property var standard: Easing.OutQuint
    }
    durations: QtObject {
        property int veryQuick:     100
        property int quick:         200
        property int standard:      400
        property int slow:          600
        property int verySlow:      800
    }
    radius: QtObject {
        property real scale:        1
        property int small:         4 * scale
        property int normal:        8 * scale
        property int large:         12 * scale
        property int xl:            16 * scale
        property int full:          1000 * scale
    }
    padding: QtObject {
        property real scale:        1
        property int tiny:          4 * scale
        property int small:         6 * scale
        property int normal:        10 * scale
        property int large:         12 * scale
        property int xl:            16 * scale
    }
    spacing: QtObject {
        property real scale:        1
        property int tiny:          4 * scale
        property int small:         8 * scale
        property int normal:        12 * scale
        property int large:         16 * scale
        property int xl:            20 * scale
    }

}