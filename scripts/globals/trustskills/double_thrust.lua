-----------------------------------
-- Double Thrust
-- Polearm weapon skill
-- Skill Level: 5
-- Delivers a two-hit attack. Damage varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Light Gorget.
-- Aligned with the Light Belt.
-- Element: None
-- Modifiers: STR:30%
-- 100%TP    200%TP    300%TP
-- 1.00      1.50      2.00
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onTrustWeaponSkill(target, trust, skill, action)
    local numhits = 2
    local accmod = 1
    local dmgmod = 1
    local info = MobPhysicalMove(trust,target,skill,numhits,accmod,dmgmod,TP_CRIT_VARIES,1,1.5,2)
    local dmg = MobFinalAdjustments(info.dmg,trust,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.PIERCING,info.hitslanded)

    target:takeDamage(dmg, trust, dsp.attackType.PHYSICAL, dsp.damageType.PIERCING)
    return dmg
end