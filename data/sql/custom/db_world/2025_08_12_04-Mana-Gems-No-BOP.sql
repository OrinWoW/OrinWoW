-- Update Mana Gems to remove Bind on Pickup
UPDATE `item_template` SET `bonding` = 0 WHERE `entry` IN (
    -- Mana Agate
    5514,
    -- Mana Jade
    5513,
    -- Mana Citrine
    8007,
    -- Mana Ruby
    8008,
    -- Mana Emerald
    22044,
    -- Mana Sapphire
    33312
);
