--use devolper console to turn this on and off
-- you would type for example "health_hud 0" to turn off that hud function
CreateConVar("health_hud", "1", { FCVAR_ARCHIVE, FCVAR_USERINFO }, "Hide Health HUD")
CreateConVar("battery_hud", "1", { FCVAR_ARCHIVE, FCVAR_USERINFO }, "Hide Battery HUD")
CreateConVar("ammo_hud", "1", { FCVAR_ARCHIVE, FCVAR_USERINFO }, "Hide Ammo HUD")
CreateConVar("secondary_ammo_hud", "1", { FCVAR_ARCHIVE, FCVAR_USERINFO }, "Hide Secondary Ammo HUD")

local function ShouldHideHUD(name)
    if name == "CHudHealth" then
        return GetConVar("health_hud"):GetInt() == 0
    elseif name == "CHudBattery" then
        return GetConVar("battery_hud"):GetInt() == 0
    elseif name == "CHudAmmo" then
        return GetConVar("ammo_hud"):GetInt() == 0
    elseif name == "CHudSecondaryAmmo" then
        return GetConVar("secondary_ammo_hud"):GetInt() == 0
    end

    return false
end

hook.Add("HUDShouldDraw", "HideHUDElements", function(name)
    if ShouldHideHUD(name) then
        return false
    end
end)

concommand.Add("update_hud_elements", function(ply, cmd, args)
    local healthHUD = tonumber(args[1]) or 1
    local batteryHUD = tonumber(args[2]) or 1
    local ammoHUD = tonumber(args[3]) or 1
    local secondaryAmmoHUD = tonumber(args[4]) or 1

    RunConsoleCommand("health_hud", healthHUD)
    RunConsoleCommand("battery_hud", batteryHUD)
    RunConsoleCommand("ammo_hud", ammoHUD)
    RunConsoleCommand("secondary_ammo_hud", secondaryAmmoHUD)
end)
