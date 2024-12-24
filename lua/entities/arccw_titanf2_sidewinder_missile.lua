AddCSLuaFile()

ENT.Base                     = "arccw_titanf2_projectile_base"
ENT.PrintName                = "Sidewinder Missile"
ENT.Spawnable                = false

ENT.Model                    = "models/items/ar2_grenade.mdl"

if CLIENT then
    killicon.Add("arccw_titanf2_sidewinder_missile", "vgui/killicon_archer_at", Color(251, 85, 25, 255))
end

ENT.IsRocket = true // projectile has a booster and will not drop.

ENT.InstantFuse = false // projectile is armed immediately after firing.
ENT.RemoteFuse = false // allow this projectile to be triggered by remote detonator.
ENT.ImpactFuse = true // projectile explodes on impact.

ENT.ExplodeOnDamage = true
ENT.ExplodeUnderwater = true

ENT.GunshipWorkaround = false

ENT.Delay = 0
ENT.SafetyFuse = 0.08
ENT.ImpactDamage = 20

-- ENT.SteerSpeed = 120
-- ENT.SeekerAngle = 180
-- ENT.SeekerExplodeRange = 32
-- ENT.SeekerExplodeSnapPosition = true

-- ENT.LeadTarget = true
-- ENT.SuperSteerTime = 1
-- ENT.SuperSteerSpeed = 180

ENT.MinSpeed = 3099
ENT.MaxSpeed = 3100
ENT.Acceleration = 3000

-- ENT.SteerDelay = 0.25
-- ENT.FlareRedirectChance = 0.2

ENT.AudioLoop = ""

ENT.SmokeTrail = true

ENT.FlareColor = Color(128, 128, 128)
ENT.FlareSizeMin = 50
ENT.FlareSizeMax = 75

DEFINE_BASECLASS(ENT.Base)

function ENT:Initialize()
    if SERVER then
        self:SetModel(self.Model)
        self:SetMaterial(self.Material or "")
        if self.CollisionSphere then
            self:PhysicsInitSphere(self.CollisionSphere)
        else
            self:PhysicsInit(SOLID_VPHYSICS)
        end
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)

        self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
        if self.Defusable then
            self:SetUseType(SIMPLE_USE)
        end

        local phys = self:GetPhysicsObject()
        if !phys:IsValid() then
            self:Remove()
            return
        end

        phys:EnableDrag(false)
        phys:SetDragCoefficient(0)
        phys:SetBuoyancyRatio(0)
        phys:Wake()

        if self.IsRocket then
            phys:EnableGravity(false)
        end

        self:SwitchTarget(self.LockOnEntity)
    end

    self.SpawnTime = CurTime()
    self.NextFlareRedirectTime = 0

    self.NPCDamage = IsValid(self:GetOwner()) and self:GetOwner():IsNPC()

    if self.AudioLoop then
        self.LoopSound = CreateSound(self, self.AudioLoop)
        self.LoopSound:Play()
    end

    if self.InstantFuse then
        self.ArmTime = CurTime()
        self.Armed = true
    end
	
	self:EmitSound("weapons/sidewinder/arl_ignite_3.wav", 125, 100, 1, CHAN_AUTO)

    self:OnInitialize()
end

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
    dmg:SetDamage(40 * mult)
    util.BlastDamageInfo(dmg, self:GetPos(), 180)
    self:ImpactTraceAttack(ent, 500 * mult, 100)

    local fx = EffectData()
    fx:SetOrigin(self:GetPos())

    if self:WaterLevel() > 0 then
        util.Effect("WaterSurfaceExplosion", fx)
    else
        util.Effect("HelicopterMegaBomb", fx)
    end

    self:EmitSound("weapons/sidewinder/missile_impact.wav", 125, 100, 1, CHAN_AUTO)

    self:Remove()
end

local smokeimages = {"particle/smokesprites_0001", "particle/smokesprites_0002", "particle/smokesprites_0003", "particle/smokesprites_0004", "particle/smokesprites_0005", "particle/smokesprites_0006", "particle/smokesprites_0007", "particle/smokesprites_0008", "particle/smokesprites_0009", "particle/smokesprites_0010", "particle/smokesprites_0011", "particle/smokesprites_0012", "particle/smokesprites_0013", "particle/smokesprites_0014", "particle/smokesprites_0015", "particle/smokesprites_0016"}
local function GetSmokeImage()
    return smokeimages[math.random(#smokeimages)]
end

function ENT:DoSmokeTrail()
    if CLIENT and self.SmokeTrail then
        local emitter = ParticleEmitter(self:GetPos())

        local smoke = emitter:Add(GetSmokeImage(), self:GetPos())

        smoke:SetStartAlpha(40)
        smoke:SetEndAlpha(0)

        smoke:SetStartSize(2)
        smoke:SetEndSize(math.Rand(10, 15))

        smoke:SetRoll(math.Rand(-180, 180))
        smoke:SetRollDelta(math.Rand(-1, 1))

        smoke:SetPos(self:GetPos())
        smoke:SetVelocity(-self:GetAngles():Forward() * 400 + (VectorRand() * 10))

        smoke:SetColor(255, 255, 255)
        smoke:SetLighting(true)

        smoke:SetDieTime(math.Rand(0.25, 0.6))

        smoke:SetGravity(Vector(0, 0, 0))

        emitter:Finish()
    end
end