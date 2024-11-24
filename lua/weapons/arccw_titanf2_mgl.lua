if CLIENT then
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/archer_at")
end

SWEP.ProneMod_DisableTransitions = true

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Titanfall 2" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "MGL Mag Launcher"
SWEP.Trivia_Class = "Grenade Launcher"
SWEP.Trivia_Desc = "Belt-fed grenade launcher that fires magnetic charges that can stick to armored targets."
SWEP.Trivia_Manufacturer = "Wonyeon Defense"

SWEP.Slot = 4

SWEP.UseHands = true

SWEP.CamAttachment = 2

SWEP.ViewModel = "models/weapons/mgl/v_mgl.mdl"
SWEP.WorldModel = "models/weapons/archer/w_archer_at.mdl"
SWEP.WorldModelOffset = {
    pos = Vector(3, 1, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1.15
}

SWEP.MirrorVMWM = false

SWEP.ViewModelFOV = 70

SWEP.ShootEntity = "arccw_titanf2_mgl_nade"
SWEP.Damage = 250
SWEP.DamageMin = 250
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
SWEP.Primary.ClipSize = 8

SWEP.DefaultBodygroups = "000800"

SWEP.BulletBones = {

	[1] = "def_ammo1",
	[2] = "def_ammo2",
	[3] = "def_ammo3",
	[4] = "def_ammo4",
	[5] = "def_ammo5",
	[6] = "def_ammo6",
	[7] = "def_ammo7",
	[8] = "def_ammo8",

}

SWEP.PhysBulletMuzzleVelocity = 500

SWEP.Recoil = 0.225
SWEP.RecoilSide = 0.075
SWEP.RecoilRise = 0.15
SWEP.RecoilPunch = 3.5

SWEP.Delay = 60 / 400 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = -2,
		RunawayBurst = true,
		PostBurstDelay = 0.5
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

local soundpath = "weapons/mgl/wpn_mgl"

SWEP.ShootSound = {
	soundpath .. "v2_1p_wpnfire_close_2ch_v2_01.wav",
	soundpath .. "v2_1p_wpnfire_close_2ch_v2_02.wav",
	soundpath .. "v2_1p_wpnfire_close_2ch_v2_03.wav",
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
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "ar2"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL

SWEP.CrouchPos = Vector(0, -3, 1.5)
SWEP.CrouchAng = Angle(2, -15, 0)

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
		VMBodygroups = {{ind = 5, bg = 1}}
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
            vpos = Vector(1.45, -3.5, 1.25), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -68),
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
            vpos = Vector(1.9, -3.3, 7.2), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(3, 5, -10.3),
            wang = Angle(-10, 0, 195)
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
    },
    ["exit_sprint"] = {
        Source = "sprint_out",
    },
    ["ready"] = {
        Source = "draw",
        SoundTable = {
            {p = 100, s = soundpath .. "_1p_pullout_2ch_v1_01.wav", t = 1 / 30},
    },
    },
    ["draw"] = {
        Source = "draw",
		SoundTable = {
        {p = 100, s = soundpath .. "_1p_pullout_2ch_v1_01.wav", t = 1 / 30},
    },
    },
    ["holster"] = {
        Source = "holster",
		SoundTable = {
        {p = 100, s = soundpath .. "_1p_putaway_2ch_v1_01.wav", t = 1 / 30},
    },
    },
    ["idle_sight"] = {
        Source = "idle_ads",
    },
    ["enter_sight"] = {
        Source = "ads_in",
		SoundTable = {
        {p = 100, s = "weapons/mgl/wpn_mgl_1p_ads_in_2ch_v1_02.wav", t = 0},
    },
    },
    ["fire"] = {
        Source = "fire",
        SoundTable = {
            {p = 100, soundpath .. "v2_1p_wpnfire_cyclemech_2ch_v1_01.wav", t = 0},
    },
    },
    ["fire_sight"] = {
        Source = "fire_iron",
        SoundTable = {
            {p = 100, s = soundpath .. "v2_1p_wpnfire_cyclemech_2ch_v1_01.wav", t = 0},
    },
    },
    ["exit_sight"] = {
        Source = "ads_out",
		SoundTable = {
        {p = 100, s = "weapons/mgl/wpn_mgl_1p_ads_out_2ch_v1_02.wav", t = 0 },
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
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
		Framerate = 30,
        SoundTable = {
            {p = 100, s = soundpath .. "v2_1p_reload_pt1_2ch_v1.wav", t = 5 / 30},
            {p = 100, s = soundpath .. "v2_1p_reload_pt2_2ch_v1.wav", t = 30 / 30},
            {p = 100, s = soundpath .. "v2_1p_reload_pt3_2ch_v1.wav", t = 62 / 30},
            {p = 100, s = soundpath .. "v2_1p_reload_pt4_2ch_v1.wav", t = 83 / 30},
            {p = 100, s = soundpath .. "v2_1p_reload_pt5_2ch_v1.wav", t = 108 / 30},
		},
		LastClip1OutTime = 2,
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
		Framerate = 30,
        SoundTable = {
            {p = 100, s = soundpath .. "v2_1p_reload_pt1_2ch_v1.wav", t = 5 / 30},
            {p = 100, s = soundpath .. "v2_1p_reload_pt2_2ch_v1.wav", t = 30 / 30},
            {p = 100, s = soundpath .. "v2_1p_reload_pt3_2ch_v1.wav", t = 62 / 30},
            {p = 100, s = soundpath .. "v2_1p_reload_pt4_2ch_v1.wav", t = 83 / 30},
            {p = 100, s = soundpath .. "v2_1p_reload_pt5_2ch_v1.wav", t = 108 / 30},
		},
		LastClip1OutTime = 2,
    },
}

SWEP.TTTWeaponType = "weapon_zm_pistol"
SWEP.TTTWeight = 100

-- SWEP.Hook_ModifyBodygroups = function(wep, data) -- my incredibly stupid bulletbgs hack since the actual bullet bgs function appears to be broken
    -- local vm = data.vm
	-- local clip = wep:Clip1()
	
	-- if clip == 0 then 
        -- vm:SetBodygroup(3, 0)
    -- end
	
	-- if clip == 1 then 
        -- vm:SetBodygroup(3, 1)
    -- end
	
	-- if clip == 2 then 
        -- vm:SetBodygroup(3, 2)
    -- end
	
	-- if clip == 3 then 
        -- vm:SetBodygroup(3, 3)
    -- end
	
	-- if clip == 4 then 
        -- vm:SetBodygroup(3, 4)
    -- end
	
	-- if clip == 5 then 
        -- vm:SetBodygroup(3, 5)
    -- end
	
	-- if clip == 6 then 
        -- vm:SetBodygroup(3, 6)
    -- end
	
	-- if clip == 7 then 
        -- vm:SetBodygroup(3, 7)
    -- end
	
	-- if clip == 8 then 
        -- vm:SetBodygroup(3, 8)
    -- end
	
	
-- end