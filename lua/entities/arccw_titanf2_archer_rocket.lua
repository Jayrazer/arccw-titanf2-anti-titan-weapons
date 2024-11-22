AddCSLuaFile()

ENT.Type 				= "anim"
ENT.Base 				= "arccw_titanf2_projectile_base"
ENT.PrintName 			= "Archer Rocket"
ENT.Author 				= ""
ENT.Information 		= ""

ENT.Spawnable = false
ENT.AdminSpawnable = false


ENT.Model = "models/weapons/w_missile_closed.mdl"
ENT.BoxSize = Vector(8, 4, 1)

ENT.Damage = 650
ENT.Radius = 300
ENT.ImpactDamage = 3000

ENT.FuseTime = 0.1
ENT.Boost = 900
ENT.Lift = 120
ENT.DragCoefficient = 0.1

ENT.Force = 12000 -- for LVS support. fuckhuge because this thing is meant to take down titans

if CLIENT then
    killicon.Add("arccw_titanf2_archer_rocket", "vgui/killicon_archer_at", Color(251, 85, 25, 255))
end