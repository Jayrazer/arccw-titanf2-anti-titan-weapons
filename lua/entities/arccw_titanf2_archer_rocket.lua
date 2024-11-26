AddCSLuaFile()

ENT.Base                     = "arccw_titanf2_projectile_base"
ENT.PrintName                = "Archer Rocket"
ENT.Spawnable                = false

ENT.Model                    = "models/weapons/w_missile_closed.mdl"

if CLIENT then
    killicon.Add("arccw_titanf2_archer_rocket", "vgui/killicon_archer_at", Color(251, 85, 25, 255))
end

ENT.IsRocket = true // projectile has a booster and will not drop.

ENT.InstantFuse = false // projectile is armed immediately after firing.
ENT.RemoteFuse = false // allow this projectile to be triggered by remote detonator.
ENT.ImpactFuse = true // projectile explodes on impact.

ENT.ExplodeOnDamage = true
ENT.ExplodeUnderwater = true

ENT.GunshipWorkaround = false

ENT.Delay = 0
ENT.SafetyFuse = 0.1
ENT.ImpactDamage = 150

ENT.SteerSpeed = 120
ENT.SeekerAngle = 180
ENT.SeekerExplodeRange = 32
ENT.SeekerExplodeSnapPosition = true

ENT.LeadTarget = true
ENT.SuperSteerTime = 1
ENT.SuperSteerSpeed = 180

ENT.MaxSpeed = 2500
ENT.Acceleration = 3000

ENT.SteerDelay = 0.25
ENT.FlareRedirectChance = 0.2

ENT.AudioLoop = ""

ENT.SmokeTrail = true

ENT.FlareColor = Color(255, 255, 255)

DEFINE_BASECLASS(ENT.Base)

function ENT:Detonate(ent)
    local attacker = self.Attacker or self:GetOwner()
    local dir = self:GetForward()
    local src = self:GetPos() - dir * 64

    local mult = 1
    local dmg = DamageInfo()
    dmg:SetAttacker(attacker)
    dmg:SetDamageType(DMG_BLAST + DMG_AIRBOAT)
    dmg:SetInflictor(self)
    dmg:SetDamageForce(self:GetVelocity() * 100)
    dmg:SetDamagePosition(src)
    dmg:SetDamage(100 * mult)
    util.BlastDamageInfo(dmg, self:GetPos(), 256)
    self:ImpactTraceAttack(ent, 500 * mult, 100)

    local fx = EffectData()
    fx:SetOrigin(self:GetPos())

    if self:WaterLevel() > 0 then
        util.Effect("WaterSurfaceExplosion", fx)
    else
        util.Effect("Explosion", fx)
    end

    self:EmitSound("weapons/archer/explo_archer_close_3.wav", 125, 100, 1, CHAN_AUTO)

    self:Remove()
end