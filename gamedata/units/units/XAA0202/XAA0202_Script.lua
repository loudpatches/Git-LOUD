
local AAirUnit = import('/lua/aeonunits.lua').AAirUnit
local AAAAutocannonQuantumWeapon = import('/lua/aeonweapons.lua').AAALightDisplacementAutocannonMissileWeapon

XAA0202 = Class(AAirUnit) {
    Weapons = {
        AutoCannon1 = AAAAutocannonQuantumWeapon,
    },
}

TypeClass = XAA0202