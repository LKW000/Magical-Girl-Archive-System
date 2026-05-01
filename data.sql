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