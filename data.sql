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