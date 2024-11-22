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

ENT.Force = 12000 -- for LVS support.

if CLIENT then
    killicon.Add("arccw_titanf2_archer_rocket", "vgui/killicon_archer_at", Color(251, 85, 25, 255))
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
			local explode = ents.Create( "info_particle_system" )
            explode:SetKeyValue( "effect_name", "grenade_final" )
            explode:SetOwner( self.Owner )
            explode:SetPos( self:GetPos() )
            explode:Spawn()
            explode:Activate()
            explode:Fire( "start", "", 0 )
            explode:Fire( "kill", "", 30 )
            --util.Effect( "Explosion", effectdata)
            --self:EmitSound("phx/kaboom.wav", 125, 100, 1, CHAN_AUTO)
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