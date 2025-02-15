RegisterNetEvent('dt_jumpscare:show', function(imageUrl)
    SendNUIMessage({
        type = "show",
        image = imageUrl
    })

    TriggerServerEvent('InteractSound_CL:PlayOnOne', "scream", 0.5)

    Wait(5000)
    SendNUIMessage({
        type = "hide"
    })
end)
