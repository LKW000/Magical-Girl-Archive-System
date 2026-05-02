
DROP DATABASE IF EXISTS magical_girl_archive;

-- Create database
CREATE DATABASE magical_girl_archive;
USE magical_girl_archive;


-- Characters table
CREATE TABLE characters (
    character_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    age INT CHECK (age >= 0),
    origin VARCHAR(100),
    current_status VARCHAR(50) DEFAULT 'Active',
    stability_level INT DEFAULT 100 CHECK (stability_level BETWEEN 0 AND 100),
    lore_summary TEXT
);

-- Contracts table
CREATE TABLE contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    character_id INT NOT NULL,
    wish TEXT NOT NULL,
    contract_cost VARCHAR(150) NOT NULL,
    contract_date DATE NOT NULL,
    contract_status VARCHAR(50) DEFAULT 'Active',

    FOREIGN KEY (character_id) REFERENCES characters(character_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- Abilities table
CREATE TABLE abilities (
    ability_id INT AUTO_INCREMENT PRIMARY KEY,
    ability_name VARCHAR(100) NOT NULL UNIQUE,
    ability_type VARCHAR(50) NOT NULL,
    description TEXT,
    power_level INT CHECK (power_level BETWEEN 1 AND 10)
);


-- Junction table for character/ability relationship
CREATE TABLE character_abilities (
    character_id INT NOT NULL,
    ability_id INT NOT NULL,
    mastery_level INT DEFAULT 1 CHECK (mastery_level BETWEEN 1 AND 10),

    PRIMARY KEY (character_id, ability_id),

    FOREIGN KEY (character_id) REFERENCES characters(character_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (ability_id) REFERENCES abilities(ability_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- Transformation forms
CREATE TABLE transformations (
    transformation_id INT AUTO_INCREMENT PRIMARY KEY,
    character_id INT NOT NULL,
    form_name VARCHAR(100) NOT NULL,
    trigger_condition VARCHAR(150),
    risk_level INT CHECK (risk_level BETWEEN 1 AND 10),

    FOREIGN KEY (character_id) REFERENCES characters(character_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- Weapons table
CREATE TABLE weapons (
    weapon_id INT AUTO_INCREMENT PRIMARY KEY,
    character_id INT NOT NULL,
    weapon_name VARCHAR(100) NOT NULL,
    weapon_type VARCHAR(50) NOT NULL,
    rarity VARCHAR(50) DEFAULT 'Common',

    FOREIGN KEY (character_id) REFERENCES characters(character_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- State/progression tracking log
CREATE TABLE state_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    character_id INT NOT NULL,
    stability_level INT DEFAULT 100 CHECK (stability_level BETWEEN 0 AND 100),
    corruption_level INT DEFAULT 0 CHECK (corruption_level BETWEEN 0 AND 100),
    emotional_state VARCHAR(50) NOT NULL,
    recorded_date DATE NOT NULL,
    notes TEXT,

    FOREIGN KEY (character_id) REFERENCES characters(character_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);