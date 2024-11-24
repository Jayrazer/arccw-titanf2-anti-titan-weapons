AddCSLuaFile()

ENT.Type 				= "anim"
ENT.Base 				= "arccw_titanf2_projectile_base"
ENT.PrintName 			= "MGL Grenade"
ENT.Author 				= ""
ENT.Information 		= ""

ENT.Spawnable = false
ENT.AdminSpawnable = false


ENT.Model = "models/items/ar2_grenade.mdl"
ENT.BoxSize = Vector(8, 4, 1)

ENT.Damage = 250
ENT.Radius = 275
ENT.ImpactDamage = 1000

ENT.FuseTime = 0.3
ENT.Boost = 0
ENT.Lift = 0
ENT.DragCoefficient = 0.2

ENT.Force = 6000 -- for LVS support.

if CLIENT then
    killicon.Add("arccw_titanf2_archer_rocket", "vgui/killicon_archer_at", Color(251, 85, 25, 255))
end

if SERVER then

	function ENT:Initialize()
        local pb_vert = self.BoxSize[1]
        local pb_hor = self.BoxSize[2]
        self:SetModel(self.Model)
        self:PhysicsInitBox( Vector(-pb_vert,-pb_hor,-pb_hor), Vector(pb_vert,pb_hor,pb_hor) )

        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
            phys:EnableDrag(self.Drag)
            phys:SetDragCoefficient(self.DragCoefficient)
            phys:EnableGravity(self.Gravity)
            phys:SetMass(5)
            phys:SetBuoyancyRatio(0.4)
        end

        self.SpawnTime = CurTime()

        if self.SmokeTrail then
            util.SpriteTrail(self, 0, Color( 255 , 255 , 255 ), false, 6, 8, 0.2, 1 / (6 + 6) * 0.5, "particle/particle_smokegrenade1")
        end
	end

	function ENT:Detonate()
        if !self:IsValid() then return end
        if self.Defused then return end
		local dmginfo = DamageInfo()
        local effectdata = EffectData()
            effectdata:SetOrigin( self:GetPos() )

        if self:WaterLevel() > 0 then
            util.Effect( "WaterSurfaceExplosion", effectdata )
            --self:EmitSound("weapons/underwater_explode3.wav", 125, 100, 1, CHAN_AUTO)
        else
            util.Effect( "Explosion", effectdata)
            self:EmitSound("weapons/mgl/explo_mgl_close_2ch_v1_01.wav", 125, 100, 1, CHAN_AUTO)
		end

        util.BlastDamage(self, IsValid(self:GetOwner()) and self:GetOwner() or self, self:GetPos(), self.Radius, self.DamageOverride or self.Damage)

        if SERVER then
            self:FireBullets({
                Attacker = self,
                Damage = 0,
                Tracer = 0,
                Distance = 256,
                Dir = self.HitVelocity or self:GetVelocity(),
                Src = self:GetPos(),
                Callback = function(att, tr, dmg)
					dmginfo:SetDamageType(DMG_AIRBOAT + DMG_SNIPER)
					dmginfo:SetDamageForce(self:GetForward() * self.Force)
                    util.Decal("Scorch", tr.StartPos, tr.HitPos - (tr.HitNormal * 16), self)
                end
            })
        end
        self.Defused = true
        self:Remove()
	end

end