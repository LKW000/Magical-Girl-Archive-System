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


INSERT INTO characters (name, age, origin, current_status, stability_level, lore_summary) VALUES
('Madoka Kaname', 14, 'Mitakihara City', 'Active', 90, 'A gentle and compassionate girl whose immense potential places her at the center of the magical girl system. Her selfless nature and fate make her one of the most important figures in the archive.'),
('Homura Akemi', 14, 'Mitakihara City', 'Unstable', 65, 'A time-looping magical girl who repeatedly rewinds events in an attempt to protect Madoka. Her isolation, obsession, and endurance make her one of the archive’s most psychologically strained figures.'),
('Sayaka Miki', 14, 'Mitakihara City', 'Critical', 35, 'An idealistic girl who makes a wish to heal someone she loves, only to face emotional conflict, jealousy, and despair. Her record reflects the tragic cost of hope under pressure.'),
('Mami Tomoe', 15, 'Mitakihara City', 'Active', 82, 'A veteran magical girl who acts as a poised mentor figure. Beneath her elegance and confidence is a deep loneliness shaped by survival and responsibility.'),
('Kyoko Sakura', 15, 'Kazamino City', 'Active', 75, 'A fierce and independent magical girl whose hardened attitude hides regret and grief. Her archive record reflects survival instincts shaped by loss and family collapse.'),
('Nagisa Momoe', 12, 'Mitakihara City', 'Active', 70, 'A younger magical girl associated with sweets and strange instability. Her presence in the archive blends innocence with unsettling supernatural symbolism.'),
('Iroha Tamaki', 15, 'Takarazaki City', 'Active', 85, 'A determined magical girl from Kamihama who becomes involved in rumors, mysteries, and hidden truths while searching for answers connected to her sister.'),
('Yachiyo Nanami', 19, 'Kamihama City', 'Active', 78, 'An experienced and guarded magical girl from Kamihama. Her leadership is shaped by guilt, loss, and the pressure of protecting those around her.'),
('Tsuruno Yui', 17, 'Kamihama City', 'Active', 88, 'An upbeat and energetic fighter whose cheerful persona masks emotional pressure and exhaustion. Her dossier reflects strength mixed with internal strain.'),
('Mifuyu Azusa', 18, 'Kamihama City', 'Unstable', 60, 'A former ally whose divided loyalties reflect fear, emotional fatigue, and disillusionment. Her record captures the tension between idealism and compromise.');

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

INSERT INTO transformations (character_id, form_name, trigger_condition, risk_level) VALUES
(1, 'Ultimate Form', 'Extreme emotional resonance', 10),
(2, 'Timebreaker Form', 'Temporal overload', 9),
(3, 'Knight Form', 'Protective desperation', 7),
(4, 'Veteran Form', 'Combat activation', 6),
(5, 'Crimson Assault Form', 'Aggressive impulse', 8),
(6, 'Dream Form', 'Identity fracture', 9),
(7, 'Guardian Form', 'Protective instinct', 6),
(8, 'Resolve Form', 'Hope surge', 7),
(9, 'Sentinel Form', 'Duty trigger', 8),
(10, 'Support Form', 'Ally distress', 5);

INSERT INTO weapons (character_id, weapon_name, weapon_type, rarity) VALUES
(1, 'Celestial Bow', 'Bow', 'Legendary'),
(2, 'Chrono Shield', 'Shield', 'Legendary'),
(3, 'Azure Saber', 'Sword', 'Rare'),
(4, 'Ribbon Muskets', 'Firearm', 'Epic'),
(5, 'Crimson Spear', 'Polearm', 'Epic'),
(6, 'Dream Horn', 'Instrument', 'Rare'),
(7, 'Guardian Lance', 'Lance', 'Rare'),
(8, 'Hope Crossbow', 'Crossbow', 'Rare'),
(9, 'Sentinel Blade', 'Sword', 'Epic'),
(10, 'Silver Staff', 'Staff', 'Common');

INSERT INTO state_log (character_id, stability_level, corruption_level, emotional_state, recorded_date, notes) VALUES
(1, 90, 10, 'Hopeful', '2026-04-01', 'Maintaining emotional balance.'),
(2, 65, 35, 'Obsessive', '2026-04-02', 'Temporal loops increasing strain.'),
(3, 35, 65, 'Despairing', '2026-04-03', 'Emotionally unstable after recent conflict.'),
(4, 82, 18, 'Focused', '2026-04-04', 'Stable veteran combat state.'),
(5, 75, 25, 'Aggressive', '2026-04-05', 'Combat effectiveness increased.'),
(6, 20, 80, 'Fragmented', '2026-04-06', 'Identity destabilization noted.'),
(7, 57, 43, 'Anxious', '2026-04-07', 'Experiencing increased stress.'),
(8, 95, 5, 'Determined', '2026-04-08', 'Exceptional morale.'),
(9, 28, 72, 'Withdrawn', '2026-04-09', 'Near critical condition.'),
(10, 84, 16, 'Calm', '2026-04-10', 'Stable support condition.');