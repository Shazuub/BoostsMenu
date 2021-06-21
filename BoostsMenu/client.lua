local open = false 
local Boosts = RageUI.CreateMenu('Boosts', 'Menu Boosts')
Boosts .Closed = function()
open = false
end
local boosts = {
IndexList = 1,
}
local boostsinfo = '~r~Aucun'
function OpenMenuBoosts()
if open then 
open = false
RageUI.Visible(Boosts, false)
return
else
open = true 
RageUI.Visible(Boosts, true)
CreateThread(function()
while open do 
RageUI.IsVisible(Boosts,function()
RageUI.Separator(' Boosts Actuelle : '..boostsinfo)
RageUI.Separator('')
RageUI.List('Multiplicateur', {'x2', 'x4', 'x8', 'x16', 'x32', 'x64', 'x128', 'x512', 'x1024'}, boosts.IndexList, nil, {}, true, {
onListChange = function(Index)
boosts.IndexList = Index
end,
onSelected = function(Index)
local ped = GetPlayerPed(-1)
local veh = GetVehiclePedIsIn(ped, true)
if Index == 1 then
SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(ped, false), 100.0)
boostsinfo = '~g~x2'
elseif Index == 2 then
SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(ped, false), 200.0)
boostsinfo = '~g~x4'
elseif Index == 3 then
SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(ped, false), 400.0)
boostsinfo = '~g~x8'
elseif Index == 4 then
SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(ped, false), 800.0)
boostsinfo = '~g~x16'
elseif Index == 5 then
SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(ped, false), 1600.0)
boostsinfo = '~g~x32'
elseif Index == 6 then
SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(ped, false), 3200.0)
boostsinfo = '~g~x64'
elseif Index == 7 then
SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(ped, false), 6400.0)
boostsinfo = '~g~x128'
elseif Index == 8 then
SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(ped, false), 25600.0) 
boostsinfo = '~g~x512'
elseif Index == 9 then
SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(ped, false), 51200.0)
boostsinfo = '~g~x1024'
end 
end
})
RageUI.Button("~r~Reset Boosts", nil, {}, true, {
onSelected = function()
local ped = GetPlayerPed(-1)
local veh = GetVehiclePedIsIn(ped, true)
SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(ped, false), 50.0)
boostsinfo = '~r~Aucun'
end
});
end)
Wait(0)
end
end)
end
end      
RegisterCommand('Boosts', OpenMenuBoosts)