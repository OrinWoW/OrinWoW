-- Update Soulstones to remove Bind on Pickup
UPDATE `item_template` SET `bonding` = 0 WHERE `entry` IN (
    -- Minor Soulstone
    5232,
    -- Lesser Soulstone
    16892,
    -- Soulstone
    16893,
    -- Greater Soulstone
    16895,
    -- Major Soulstone,
    16896,
    -- Master Soulstone
    22116,
    -- Demonic Soulstone
    36895
);
