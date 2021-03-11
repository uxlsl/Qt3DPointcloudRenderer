import QtQuick 2.15

import Qt3D.Core 2.15
import Qt3D.Render 2.15
import Qt3D.Input 2.15

Entity {
    id: inputEntity

    property alias transform: transform
    property alias keyboardHandler: keyboardHandler
    property alias objectPicker: objectPicker

    components: [
        Transform {
            id: transform
        },
        KeyboardHandler {
            id: keyboardHandler

      //      sourceDevice: keyboardDevice // There must always be top KeyboardDevice with id "keyboardDevice"
        },
        ObjectPicker {
            id: objectPicker

            hoverEnabled: true
        }
    ]
}
