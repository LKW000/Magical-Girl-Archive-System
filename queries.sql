
USE magical_girl_archive;

-- 1. Show all characters
SELECT *
FROM characters;

-- 2. Find characters with low stability
SELECT name, current_status, stability_level
FROM characters
WHERE stability_level < 70
ORDER BY stability_level ASC;

-- 3. Show each character with their contract information
SELECT c.name, co.wish, co.contract_cost, co.contract_status
FROM characters c
JOIN contracts co ON c.character_id = co.character_id;

-- 4. Show each character and their weapon
SELECT c.name, w.weapon_name, w.weapon_type, w.rarity
FROM characters c
JOIN weapons w ON c.character_id = w.character_id
ORDER BY c.name;

-- 5. Show abilities for each character
SELECT c.name, a.ability_name, a.ability_type, ca.mastery_level
FROM characters c
JOIN character_abilities ca ON c.character_id = ca.character_id
JOIN abilities a ON ca.ability_id = a.ability_id
ORDER BY c.name;

-- 6. Find transformations with high risk levels
SELECT c.name, t.form_name, t.trigger_condition, t.risk_level
FROM characters c
JOIN transformations t ON c.character_id = t.character_id
WHERE t.risk_level >= 8
ORDER BY t.risk_level DESC;

-- 7. Show character condition logs
SELECT c.name, s.stability_level, s.corruption_level, s.emotional_state, s.recorded_date
FROM characters c
JOIN state_log s ON c.character_id = s.character_id
ORDER BY s.recorded_date;

-- 8. Full character profile summary
SELECT 
    c.name,
    c.age,
    c.origin,
    c.current_status,
    co.wish,
    w.weapon_name,
    t.form_name,
    s.stability_level,
    s.corruption_level,
    s.emotional_state
FROM characters c
JOIN contracts co ON c.character_id = co.character_id
JOIN weapons w ON c.character_id = w.character_id
JOIN transformations t ON c.character_id = t.character_id
JOIN state_log s ON c.character_id = s.character_id
ORDER BY c.name;