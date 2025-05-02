# Remove Material MaxScript

A simple MaxScript tool for Autodesk 3ds Max that removes the assigned material from all selected objects. Useful for quick cleanup in scenes or preparing geometry for export or reassignment of materials.

## Features

- Removes material from all currently selected objects.
- Simple, user-friendly UI with a single-click button.
- Supports Undo (Ctrl+Z).
- Displays a message if no objects are selected.


## Installation

1. Open Autodesk 3ds Max.
2. Open the **Scripting > New Script** window.
3. Paste the script into the editor.
4. Press **Ctrl+E** to evaluate the script and open the UI.

Alternatively, save it as a `.ms` file and drag it into your scene.

## Usage

1. Select the objects in your scene that have materials you want to remove.
2. Click the **"Remove Material from Selection"** button.
3. Done! Materials will be removed. Use Undo (Ctrl+Z) to revert.

## Code

```maxscript
rollout RemoveMaterialRollout "Remove Material"
(
    button btnRemoveMat "Remove Material from Selection" width:200

    on btnRemoveMat pressed do
    (
        if selection.count > 0 then (
            undo "Remove Material" on (
                for obj in selection do (
                    obj.material = undefined
                )
            )
            format "Material removed from selected object(s).\n"
        ) else (
            messageBox "No object selected!" title:"Warning"
        )
    )
)

createDialog RemoveMaterialRollout width:220 height:80
