AddCSLuaFile()

ENT.Base 				= "arccw_titanf2_projectile_base"
ENT.PrintName 			= "MGL Grenade"
ENT.Spawnable                = false

ENT.Model                    = "models/items/ar2_grenade.mdl"

ENT.IsRocket = false // projectile has a booster and will not drop.

ENT.InstantFuse = true // projectile is armed immediately after firing.
ENT.RemoteFuse = false // allow this projectile to be triggered by remote detonator.
ENT.ImpactFuse = true // projectile explodes on impact.

ENT.ExplodeOnDamage = false // projectile explodes when it takes damage.
ENT.ExplodeUnderwater = true

ENT.Delay = 2

function ENT:Detonate(ent)
    local attacker = self.Attacker or self:GetOwner() or self
    local mult = 1
    local dmg = 150

    util.BlastDamage(self, attacker, self:GetPos(), 300, dmg * mult)
    self:ImpactTraceAttack(ent, dmg * mult, 100)

    local fx = EffectData()
    fx:SetOrigin(self:GetPos())

    if self:WaterLevel() > 0 then
        util.Effect("WaterSurfaceExplosion", fx)
    else
        util.Effect("Explosion", fx)
    end

    self:EmitSound("weapons/mgl/explo_mgl_close_2ch_v1_01.wav", 125, 100, 1, CHAN_AUTO)

    self:Remove()
end