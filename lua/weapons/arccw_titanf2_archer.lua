if CLIENT then
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/archer_at")
end

SWEP.ProneMod_DisableTransitions = true

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Titanfall 2" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Archer AT"
SWEP.Trivia_Class = "Rocket Launcher"
SWEP.Trivia_Desc = "Heavy rocket launcher developed during the Frontier War that can fire a variety of different rocket payloads. Must be aimed to fire."
SWEP.Trivia_Manufacturer = "Brockhaurd Manufacturing"

SWEP.Slot = 4

SWEP.UseHands = true

SWEP.CamAttachment = 2

SWEP.ViewModel = "models/weapons/archer/v_archer_at.mdl"
SWEP.WorldModel = "models/weapons/archer/w_archer_at.mdl"
SWEP.WorldModelOffset = {
    pos = Vector(3, 1, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1.15
}

SWEP.MirrorVMWM = false

SWEP.ViewModelFOV = 70

SWEP.ShootEntity = "arccw_titanf2_archer_rocket"
SWEP.Damage = 650
SWEP.DamageMin = 650
SWEP.MuzzleVelocity = 3200

SWEP.Apex_Balance = {
    [1] = {
        Damage = 21,
        DamageMin = 12,
    },
    [2] = {
        Damage = 9, -- similar to TTT pistol but fires much faster. don't want to mess with rpm as that makes the gun feel less authentic
        DamageMin = 9,
    },
}

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 2,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
}

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 1

SWEP.PhysBulletMuzzleVelocity = 500

SWEP.Recoil = 0.225
SWEP.RecoilSide = 0.075
SWEP.RecoilRise = 0.15
SWEP.RecoilPunch = 3.5

SWEP.Delay = 60 / 600 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 1,
		PrintName = "Single Shot"
    }
}

SWEP.NPCWeaponType = "weapon_rpg"
SWEP.NPCWeight = 200

SWEP.AccuracyMOA = 5
SWEP.HipDispersion = 200 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 50
SWEP.JumpDispersion = 75

SWEP.SightedSpeedMult = 0.9

SWEP.Primary.Ammo = "rpg_round" -- what ammo type the gun uses

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound = {
	"weapons/archer/wpn_archer_1p_wpnfire_core_2ch_v1_01.wav",
	"weapons/archer/wpn_archer_1p_wpnfire_core_2ch_v1_02.wav",
	"weapons/archer/wpn_archer_1p_wpnfire_core_2ch_v1_03.wav",
	}
SWEP.ShootDrySound = "ArcCW_APEX.Pistol_Dry_D"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

local s = "weapons/fx/wpn_lowammo_pistol1_triggerf_2ch_v1_01.wav"
local p = {
    [2] = 80,
    [1] = 90,
    [0] = 100,
}
SWEP.Hook_AddShootSound = function(wep, data)
    local pitch = p[wep:Clip1()]
    if pitch then
        wep:MyEmitSound(s, 70, pitch, 0.5, CHAN_AUTO)
    end
end

SWEP.MuzzleEffect = "tfa_apex_muzzle_pistol"

SWEP.Tracer = "arccw_apex_tracer_pistol" -- override tracer (hitscan) effect
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 2

SWEP.ShellModel = "models/shells/shelleject_pistol.mdl"
SWEP.ShellPitch = 100
SWEP.ShellScale = 1.55
-- SWEP.ShellRotateAngle = Angle(0, 180, 0)

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

SWEP.IronSightStruct = {
    Pos = Vector(0.005, 0, -0.05),
    Ang = Angle(0, 0, 0),
    Magnification = 1.5,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
	 CrosshairInSights = false,
}


SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "rpg"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL

SWEP.CrouchPos = Vector(0, -3, 1.5)
SWEP.CrouchAng = Angle(2, -15, 0)

SWEP.SprintPos = Vector(0, -2, 1)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)
SWEP.BarrelOffsetCrouch = Vector(0, 0, -2)

SWEP.CustomizePos = Vector(0, -5, -4)
SWEP.CustomizeAng = Angle(40, 0, 0)

SWEP.BarrelLength = 8

SWEP.AttachmentElements = {
    ["skin"] = {
        VMSkin = 1,
        WMSkin = 1,
    },
}
-- SWEP.GuaranteeLaser = true

SWEP.Attachments = {
    -- {
        -- PrintName = "Hop-up",
        -- Slot = {"apex_hopup_qdraw", "apex_hopup_hp", "apex_hopup_selfire3"}
    -- },
    {
        PrintName = "Skin",
        Slot = {"skin_apex"},
        DefaultAttName = "Default",
        FreeSlot = true
    },
    {
        PrintName = "Charm",
        Slot = "charm",
        FreeSlot = true,
        Bone = "weapon_bone", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1.8, -9.88, 0.5), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -35),
            wpos = Vector(1.2, 3, -10.9),
            wang = Angle(-10, 0, 215)
        },
		VMScale = Vector(0.3, 0.3, 0.3),
		WMScale = Vector(0.3, 0.3, 0.3),
    },
    {
        PrintName = "Stats",
        Slot = {"killcounter2","killcounter"},
        FreeSlot = true,
        Bone = "weapon_bone", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(4.1, -8.5, 1.8), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -75),
            wpos = Vector(3, 5, -10.3),
            wang = Angle(-10, 0, 195)
        },
		VMScale = Vector(1, 1, 1),
		WMScale = Vector(1, 1, 1),
    },
}

-- function SWEP:Hook_TranslateAnimation(anim)
    -- if anim == "fire_iron" then
        -- if !self.Attachments[6].Installed then return "fire" end
    -- elseif anim == "fire_iron_empty" then
        -- if !self.Attachments[6].Installed then return "fire_empty" end
    -- end
-- end

SWEP.CanBash = false

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["idle_sprint"] = {
        Source = "sprint",
    },
    ["enter_sprint"] = {
        Source = "sprint_in",
    },
    ["exit_sprint"] = {
        Source = "sprint_out",
    },
    ["ready"] = {
        Source = "draw",
        SoundTable = {
            {p = 100, s = "weapons/archer/player_archer_raise1.wav", t = 1 / 30},
    },
    },
    ["draw"] = {
        Source = "draw",
		SoundTable = {
        {p = 100, s = "weapons/archer/player_archer_raise1.wav", t = 1 / 30},
    },
    },
    ["holster"] = {
        Source = "holster",
    },
    ["idle_sight"] = {
        Source = "idle_ads",
    },
    ["enter_sight"] = {
        Source = "ads_in",
		SoundTable = {
        {p = 100, s = "weapons/archer/player_archer_ads_up.wav", t = 1 / 30},
    },
    },
    ["fire_sight"] = {
        Source = "fire",
		Time = 0.15,
    },
    ["exit_sight"] = {
        Source = "ads_out",
		SoundTable = {
        {p = 100, s = "weapons/archer/player_archer_ads_down.wav", t = 1 / 30},
    },
    },
    -- ["bash"] = {
        -- Source = {"melee"},
        -- LHIK = true,
        -- LHIKIn = 0,
        -- LHIKOut = 0.6,
        -- LHIKEaseOut = 0.4,
        -- SoundTable = {
            -- {s = "ArcCW_APEX.Melee.Swing.Punch", t = 0 / 30},
    -- },
    -- },
    ["reload"] = {
        Source = "reload",
		Time = 4,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
		Framerate = 30,
        SoundTable = {
            {p = 100, s = "weapons/archer/Wpn_Archer_1p_Reload_CanisterOut_2ch_v2_01A.wav", t = 1 / 30},
            {p = 100, s = "weapons/archer/Wpn_Archer_1p_Reload_CanisterOut_2ch_v2_01B.wav", t = 12 / 30},
            {p = 100, s = "weapons/archer/wpn_archer_1p_reload_canisterin_2ch_v1_01.wav", t = 65 / 30},
    },
    },
}

SWEP.TTTWeaponType = "weapon_zm_pistol"
SWEP.TTTWeight = 100


SWEP.Hook_ShouldNotFire = function(wep)
    if (wep:GetState() != ArcCW.STATE_SIGHTS or wep:GetSightDelta() > 0) then
        return true
    end
end