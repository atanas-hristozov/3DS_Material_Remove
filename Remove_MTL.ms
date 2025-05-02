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
