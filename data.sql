USE magical_girl_archive;

DELETE FROM character_abilities;
DELETE FROM state_log;
DELETE FROM weapons;
DELETE FROM transformations;
DELETE FROM contracts;
DELETE FROM abilities;
DELETE FROM characters;

ALTER TABLE characters AUTO_INCREMENT = 1;
ALTER TABLE abilities AUTO_INCREMENT = 1;
ALTER TABLE contracts AUTO_INCREMENT = 1;
ALTER TABLE transformations AUTO_INCREMENT = 1;
ALTER TABLE weapons AUTO_INCREMENT = 1;
ALTER TABLE state_log AUTO_INCREMENT = 1;


INSERT INTO characters (name, age, origin, current_status, stability_level) VALUES
('Madoka Kaname', 14, 'Mitakihara City', 'Active', 90),
('Homura Akemi', 14, 'Mitakihara City', 'Unstable', 65),
('Sayaka Miki', 14, 'Mitakihara City', 'Critical', 35),
('Mami Tomoe', 15, 'Mitakihara City', 'Active', 82),
('Kyoko Sakura', 15, 'Kazamino City', 'Active', 75),
('Nagisa Momoe', 12, 'Mitakihara City', 'Active', 70),
('Iroha Tamaki', 15, 'Takarazaki City', 'Active', 85),
('Yachiyo Nanami', 19, 'Kamihama City', 'Active', 78),
('Tsuruno Yui', 17, 'Kamihama City', 'Active', 88),
('Mifuyu Azusa', 18, 'Kamihama City', 'Unstable', 60);

INSERT INTO abilities (ability_name, ability_type, description, power_level) VALUES
('Reality Manipulation', 'Divine', 'Can alter the structure of reality itself.', 10),
('Time Manipulation', 'Temporal', 'Can stop, reverse, or loop time.', 10),
('Healing Magic', 'Support', 'Restores wounds and magical damage.', 7),
('Ribbon Binding', 'Control', 'Restrains enemies using magical ribbons.', 6),
('Spear Summoning', 'Weapon', 'Creates and controls magical spears.', 8),
('Illusion Creation', 'Mental', 'Produces deceptive visual constructs.', 7),
('Energy Projection', 'Offense', 'Launches concentrated magical blasts.', 8),
('Barrier Creation', 'Defense', 'Forms magical shields and barriers.', 7),
('Weapon Summoning', 'Weapon', 'Summons various magical weapons.', 8),
('Enhanced Agility', 'Physical', 'Boosts movement speed and reflexes.', 6);

INSERT INTO character_abilities (character_id, ability_id, mastery_level) VALUES
(1, 1, 10),
(1, 3, 8),
(2, 2, 10),
(2, 6, 8),
(3, 3, 7),
(3, 7, 7),
(4, 4, 9),
(4, 9, 8),
(5, 5, 9),
(5, 10, 8),
(6, 6, 7),
(7, 3, 8),
(8, 8, 8),
(9, 7, 9),
(10, 6, 8);

INSERT INTO contracts (character_id, wish, contract_cost, contract_date, contract_status) VALUES
(1, 'To save a loved one', 'Burden of cosmic responsibility', '2026-01-01', 'Active'),
(2, 'To redo the past', 'Endless temporal isolation', '2026-01-02', 'Active'),
(3, 'To heal another person', 'Emotional instability', '2026-01-03', 'Broken'),
(4, 'To survive an accident', 'Constant battle obligation', '2026-01-04', 'Completed'),
(5, 'To save family from poverty', 'Loss of innocence', '2026-01-05', 'Active'),
(6, 'To receive happiness', 'Identity distortion', '2026-01-06', 'Corrupted'),
(7, 'To protect her town', 'Mental strain', '2026-01-07', 'Active'),
(8, 'To find her sister', 'Emotional burden', '2026-01-08', 'Active'),
(9, 'To protect others', 'Isolation', '2026-01-09', 'Active'),
(10, 'To help a friend', 'Psychological fatigue', '2026-01-10', 'Active');