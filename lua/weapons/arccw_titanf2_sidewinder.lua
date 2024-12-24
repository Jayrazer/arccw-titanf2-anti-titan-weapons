if CLIENT then
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/archer_at")
end

SWEP.ProneMod_DisableTransitions = true

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Titanfall 2" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Sidewinder SMR"
SWEP.Trivia_Class = "Automatic Rocket Launcher"
SWEP.Trivia_Desc = "Fully automatic rocket launcher that fires a barrage of micro missiles. The missiles are quick but have low damage and splash radius."
SWEP.Trivia_Manufacturer = "Wonyeon Interstellar"

SWEP.Slot = 4

SWEP.UseHands = true

SWEP.CamAttachment = 2

SWEP.ViewModel = "models/weapons/sidewinder/v_sidewinder_arl.mdl"
SWEP.WorldModel = "models/weapons/mgl/w_mgl.mdl"
SWEP.WorldModelOffset = {
    pos = Vector(3.5, 1, 0.4),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1.15
}

SWEP.MirrorVMWM = false

SWEP.ViewModelFOV = 70

SWEP.ShootEntity = "arccw_titanf2_sidewinder_missile"
SWEP.Damage = 70
SWEP.DamageMin = 50
SWEP.MuzzleVelocity = 1500

-- SWEP.Apex_Balance = {
    -- [1] = {
        -- Damage = 21,
        -- DamageMin = 12,
    -- },
    -- [2] = {
        -- Damage = 9, -- similar to TTT pistol but fires much faster. don't want to mess with rpm as that makes the gun feel less authentic
        -- DamageMin = 9,
    -- },
-- }

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
SWEP.Primary.ClipSize = 20

SWEP.DefaultBodygroups = "000600"

SWEP.BulletBones = {

	[1] = "def_c_round1",
	[2] = "def_c_round2",
	[3] = "def_c_round3",
	[4] = "def_c_round4",
	[5] = "def_c_round5",
	[6] = "def_c_round6",

}

SWEP.PhysBulletMuzzleVelocity = 500

SWEP.Recoil = 0.225
SWEP.RecoilSide = 0.075
SWEP.RecoilRise = 0.15
SWEP.RecoilPunch = 3.5

SWEP.Delay = 60 / 525 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 2
    }
}

SWEP.NPCWeaponType = "weapon_rpg"
SWEP.NPCWeight = 200

SWEP.AccuracyMOA = 5
SWEP.HipDispersion = 200 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 50
SWEP.JumpDispersion = 75

SWEP.SightedSpeedMult = 0.9

SWEP.Primary.Ammo = "smg1_grenade" -- what ammo type the gun uses

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

local soundpath = "weapons/sidewinder/arl_"
local soundpathreload = "weapons/sidewinder/wpn_arl_1p_reload_"

SWEP.ShootSound = {
	soundpath .. "1p_atkmechwarbletailcomp_01.wav",
	soundpath .. "1p_atkmechwarbletailcomp_02.wav",
	soundpath .. "1p_atkmechwarbletailcomp_04.wav",
	soundpath .. "1p_atkmechwarbletailcomp_05.wav",
	soundpath .. "1p_atkmechwarbletailcomp_06.wav",
	soundpath .. "1p_atkmechwarbletailcomp_09.wav",
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

SWEP.MuzzleEffect = false
SWEP.MuzzleLight = false

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
    Pos = Vector(0, 0, 0),
    Ang = Angle(0, 0, 0),
    Magnification = 1.25,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
	 CrosshairInSights = true,
}


SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "smg"
SWEP.HoldtypeSights = "smg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.CrouchPos = Vector(-1.5, -3, 1)
SWEP.CrouchAng = Angle(0, 0, -10)

SWEP.SprintPos = Vector(0, -2, 1)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0.5, -2, 2.25)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)
SWEP.BarrelOffsetCrouch = Vector(0, 0, -2)

SWEP.CustomizePos = Vector(5, -3, -2)
SWEP.CustomizeAng = Angle(10, 30, 0)

SWEP.BarrelLength = 8

SWEP.AttachmentElements = {
    ["skin"] = {
        VMSkin = 1,
        WMSkin = 1,
    },
	
	["tactical"] = {
		VMBodygroups = {{ind = 5, bg = 1}},
		WMBodygroups = {{ind = 2, bg = 1}}
	}
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
            vpos = Vector(1.21, -4.35, 7.5), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(11.5, 2.9, -5.8),
            wang = Angle(-10, 0, 200)
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
            vpos = Vector(1.6, -0.3, 14.2), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(11.5, 2.9, -5.8),
            wang = Angle(-10, 0, 180)
        },
		VMScale = Vector(1, 1, 1),
		WMScale = Vector(1, 1, 1),
		InstalledEles = {"tactical"}
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
		mult = 0.5
    },
    ["exit_sprint"] = {
        Source = "sprint_out",
		mult = 0.5
    },
    ["ready"] = {
        Source = "draw",
        SoundTable = {
            {p = 100, s = soundpath .. "pullout_02.wav", t = 1 / 30},
    },
    },
    ["draw"] = {
        Source = "draw",
		SoundTable = {
        {p = 100, s = soundpath .. "pullout_02.wav", t = 1 / 30},
    },
    },
    ["holster"] = {
        Source = "holster",
		SoundTable = {
        {p = 100, s = soundpath .. "putaway_01.wav", t = 1 / 30},
    },
    },
    ["idle_sight"] = {
        Source = "idle",
    },
    ["enter_sight"] = {
        Source = "ads_in",
		SoundTable = {
        {p = 100, s = "weapons/mgl/wpn_mgl_1p_ads_in_2ch_v1_02.wav", t = 1 / 30},
    },
    },
    ["fire"] = {
        Source = "fire",
        -- SoundTable = {
            -- {p = 150, soundpath .. "ignite_3.wav", t = 2 / 30},
    -- },
    },
    ["fire_sight"] = {
        Source = "fire",
        -- SoundTable = {
            -- {p = 150, s = soundpath .. "ignite_3.wav", t = 1 / 30},
    -- },
    },
    ["exit_sight"] = {
        Source = "ads_out",
		SoundTable = {
        {p = 100, s = "weapons/mgl/wpn_mgl_1p_ads_out_2ch_v1_02.wav", t = 1 / 30},
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
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
		Framerate = 30,
		Mult = 0.7,
        SoundTable = {
            {p = 100, s = soundpathreload .. "pt1_2ch_v1.wav", t = 1 / 30},
            {p = 100, s = soundpathreload .. "pt2_2ch_v1.wav", t = 13 / 30},
            {p = 100, s = "weapons/sidewinder/wpn_arl_reload_beeps_2ch_v1.wav", t = 17 / 30},
            {p = 100, s = soundpathreload .. "pt3_2ch_v2_A.wav", t = 45 / 30},
            {p = 100, s = soundpathreload .. "pt3_2ch_v2_B.wav", t = 53 / 30},
            {p = 100, s = soundpathreload .. "pt4_2ch_v2.wav", t = 65 / 30},
            {p = 100, s = soundpathreload .. "pt5_2ch_v1.wav", t = 78 / 30},
            {p = 100, s = "weapons/sidewinder/coldwar_boltforward_whyareyoulikethisrespawn.wav", t = 85 / 30},
		},
		LastClip1OutTime = 0.7,
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
		Framerate = 30,
		Mult = 0.7,
        SoundTable = {
            {p = 100, s = soundpathreload .. "pt1_2ch_v1.wav", t = 1 / 30},
            {p = 100, s = soundpathreload .. "pt2_2ch_v1.wav", t = 13 / 30},
			{p = 100, s = "weapons/sidewinder/wpn_arl_reload_beeps_2ch_v1.wav", t = 17 / 30},
            {p = 100, s = soundpathreload .. "pt3_2ch_v2_A.wav", t = 45 / 30},
            {p = 100, s = soundpathreload .. "pt3_2ch_v2_B.wav", t = 53 / 30},
            {p = 100, s = soundpathreload .. "pt4_2ch_v2.wav", t = 65 / 30},
            {p = 100, s = soundpathreload .. "pt5_2ch_v1.wav", t = 78 / 30},
            {p = 100, s = "weapons/sidewinder/coldwar_boltforward_whyareyoulikethisrespawn.wav", t = 85 / 30},
		},
		LastClip1OutTime = 0.7,
    },
}

SWEP.TTTWeaponType = "weapon_zm_pistol"
SWEP.TTTWeight = 100