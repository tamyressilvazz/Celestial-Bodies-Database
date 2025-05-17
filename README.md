## About this task

Nome da Tabela: universe.sql

salvar um dump do bd

pg_dump -cC --inserts -U freecodecamp universe > universe.sql

You can rebuild the database by entering `psql -U postgres < universe.sql` in a terminal where the `.sql` file is.

ideas for other column and table names: `description`, `has_life`, `is_spherical`, `age_in_millions_of_years`, `planet_types`, `galaxy_types`, `distance_from_earth`

1. ~~criar um banco de dados chamado universe~~
    
    ```sql
    CREATE DATABASE universe;
    ```
    
2. ~~Be sure to connect to your database with `\c universe`~~
3. ~~adicionar tabelas chamadas galaxy,~~ star, planet, e moon:
    
    ```sql
    CREATE TABLE table_name();
    
    -- Criando a tabela Galaxy
    CREATE TABLE galaxy (
        galaxy_id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL UNIQUE,
        age_in_millions_of_years NUMERIC  NOT NULL,
        galaxy_type TEXT,
        is_spherical BOOLEAN,
        average_diameter_in_light_years INT,
        category_number INT
    );
    
    -- Criando a tabela Star com chave estrangeira para Galaxy
    CREATE TABLE star (
        star_id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL UNIQUE,
        star_temperature NUMERIC NOT NULL,
        type_of_star TEXT,
        massive_star BOOLEAN,
        star_age INT,
        phases_of_star_life INT,
        galaxy_id INT NOT NULL,
        CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id) ON DELETE CASCADE
    );
    
    -- Criando a tabela Planet com chave estrangeira para Star
    CREATE TABLE planet (
        planet_id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL UNIQUE,
        age_in_millions_of_years NUMERIC NOT NULL,
        planet_type TEXT,
        has_life BOOLEAN,
        number_of_moons INT,
        one_year INT,
        star_id INT NOT NULL,
        CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES star(star_id) ON DELETE CASCADE
    );
    
    -- Criando a tabela Moon com chave estrangeira para Planet
    CREATE TABLE moon (
        moon_id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL UNIQUE,
        mass NUMERIC NOT NULL,
        lunar_composition TEXT,
        is_visible_from_earth BOOLEAN,
        lunar_phases INT,
        distance_from_earth INT,
        planet_id INT NOT NULL,
        CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES planet(planet_id) ON DELETE CASCADE
    );
    
    CREATE TABLE asteroid (
        asteroid_id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL UNIQUE,
        composition TEXT, 
        diameter_km NUMERIC NOT NULL, 
        orbital_period_days NUMERIC, 
        is_potentially_hazardous BOOLEAN, 
        planet_id INT, 
        CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
    );
    ```
    
    | galaxy |  |
    | --- | --- |
    | star |  |
    | planet |  |
    | moon |  |
4. ~~Cada **tabela** deve ter **uma** chave primária~~
    
    Atribuir **uma** chave PK para **cada tabela**:
    
    // Adicionar as colunas das primary keys
    
    ```sql
    ALTER TABLE table_name ADD COLUMN column_name DATATYPE;
    ```
    
    ```sql
    ALTER TABLE table_name ADD PRIMARY KEY(column_name);
    ```
    
    | Tabelas | PK - Primary key |
    | --- | --- |
    | **galaxy** | galaxy_id |
    | star | star_id |
    | planet | planet_id |
    | moon | moon_id |
5. ~~Cada **tabela** deve ter uma coluna de name~~
    
    ```sql
    ALTER TABLE table_name ADD COLUMN name DATATYPE;
    ```
    
    | Tabelas | PK - Primary key COLUMN | COLUMN |  |
    | --- | --- | --- | --- |
    | **galaxy** | galaxy_id SERIAL | name **VARCHAR** |  |
    | star | star_id SERIAL | name **VARCHAR** |  |
    | planet | planet_id SERIAL | name **VARCHAR** |  |
    | moon | moon_id SERIAL | name **VARCHAR** |  |
    | format | format_id SERIAL | name **VARCHAR** | `is_spherical` BOOLEAN |
6. ~~Cada chave primária deve **incrementar automaticamente**~~ 
    
    DATATYPE = SERIAL 
    
    ```sql
    ALTER TABLE table_name ADD PRIMARY KEY(column_name);
    ```
    
7. ~~Você deve usar o tipo de dados **INT** para pelo menos **duas** colunas que **não sejam** uma chave primária ou estrangeira~~
8. V~~ocê deve usar o tipo de dados **NUMERIC** **pelo menos uma vez**~~
9. ~~Você deve usar o tipo de dados **TEXT** **pelo menos uma vez~~** 
10. ~~Você deve usar o tipo de dados **BOOLEAN** **pelo menos uma vez**~~
11. ~~Cada "star" deve ter **uma** chave estrangeira que faça **referência a uma das linhas da galaxy**~~
    
    ```sql
    ALTER TABLE table_name ADD COLUMN column_name DATATYPE REFERENCES refrencial_table_name(referencial_column_name);
    
    ALTER TABLE galaxy ADD COLUMN planet_id INT REFERENCES planet(planet_id);
    ```
    
12. ~~Cada “planet” deve ter **uma** chave estrangeira que faça **referência a uma das linhas em star**~~
    
    ```sql
    ALTER TABLE table_name ADD COLUMN column_name DATATYPE REFERENCES refrencial_table_name(referencial_column_name);
    ```
    
13. ~~Cada "moon" deve ter **uma** chave estrangeira que faça **referência a uma das linhas do planet**~~
    
    ```sql
    ALTER TABLE table_name ADD COLUMN column_name DATATYPE REFERENCES refrencial_table_name(referencial_column_name);
    ```
    
14. ~~Seu banco de dados deve ter **pelo menos cinco tabelas**~~
    
    
    | Tabelas | PK - Primary key |
    | --- | --- |
    | asteroid | asteroid_id |
15. ~~Cada tabela deve ter **pelo menos três linhas**~~
    
    ok
    
16. ~~As tabelas de galaxy e star devem ter **pelo menos seis linhas cada uma**~~
    
    galaxy
    
    ```sql
    INSERT INTO galaxy (name, age_in_millions_of_years, galaxy_type, is_spherical, average_diameter_in_light_years, category_number)
    VALUES 
    ('Andromeda', 10000, 'Spiral', TRUE, 220000, 1),
    ('Milky Way', 13600, 'Barred Spiral', TRUE, 105700, 2),
    ('Triangulum', 4000, 'Spiral', TRUE, 60000, 3),
    ('Whirlpool', 400, 'Spiral', FALSE, 76000, 4),
    ('Messier 87', 6000, 'Elliptical', TRUE, 120000, 5),
    ('Sombrero', 9000, 'Spiral', TRUE, 50000, 6),
    ('Cartwheel', 500, 'Ring', FALSE, 150000, 7),
    ('IC 1101', 13000, 'Elliptical', TRUE, 600000, 8),
    ('Cigar Galaxy', 700, 'Irregular', FALSE, 50000, 9),
    ('Hoag’s Object', 8000, 'Ring', TRUE, 125000, 10),
    ('Centaurus A', 11000, 'Elliptical', TRUE, 65000, 11),
    ('Messier 81', 7000, 'Spiral', TRUE, 85000, 12),
    ('Tadpole Galaxy', 3000, 'Spiral', FALSE, 280000, 13),
    ('NGC 1300', 5000, 'Barred Spiral', TRUE, 110000, 14),
    ('NGC 6744', 10000, 'Spiral', TRUE, 175000, 15),
    ('Maffei 1', 12000, 'Elliptical', TRUE, 140000, 16),
    ('NGC 4414', 2000, 'Spiral', FALSE, 65000, 17),
    ('NGC 4622', 6000, 'Spiral', FALSE, 75000, 18),
    ('NGC 4889', 9000, 'Elliptical', TRUE, 200000, 19),
    ('Malin 1', 11000, 'Spiral', TRUE, 650000, 20);
    ```
    
    star
    
    ```sql
    INSERT INTO star (name, star_temperature, type_of_star, massive_star, star_age, phases_of_star_life, galaxy_id)
    VALUES 
    ('Alpha Centauri', 5700, 'Yellow Dwarf', FALSE, 6000, 3, 1),
    ('Betelgeuse', 3500, 'Red Supergiant', TRUE, 8000, 4, 2),
    ('Rigel', 11000, 'Blue Supergiant', TRUE, 9000, 4, 2),
    ('Vega', 9600, 'White Main Sequence', FALSE, 455, 2, 1),
    ('Sirius', 9940, 'White Main Sequence', FALSE, 300, 2, 3),
    ('Canopus', 7350, 'Yellow Giant', TRUE, 10000, 3, 5),
    ('Aldebaran', 3910, 'Red Giant', TRUE, 7000, 3, 6),
    ('Arcturus', 4290, 'Red Giant', TRUE, 8700, 3, 1),
    ('Capella', 5770, 'Yellow Giant', FALSE, 1000, 3, 4),
    ('Procyon', 6530, 'White Main Sequence', FALSE, 1500, 2, 3),
    ('Antares', 3300, 'Red Supergiant', TRUE, 12000, 4, 5),
    ('Altair', 7700, 'White Main Sequence', FALSE, 1100, 2, 6),
    ('Deneb', 8525, 'Blue Supergiant', TRUE, 15000, 4, 7),
    ('Fomalhaut', 8700, 'White Main Sequence', FALSE, 440, 2, 8),
    ('Bellatrix', 22000, 'Blue Giant', TRUE, 7000, 3, 9),
    ('Polaris', 7200, 'Yellow Supergiant', TRUE, 8000, 4, 10),
    ('Castor', 10100, 'White Main Sequence', FALSE, 600, 2, 11),
    ('Almach', 4500, 'Orange Giant', FALSE, 5000, 3, 12),
    ('Spica', 20000, 'Blue Giant', TRUE, 12000, 3, 13),
    ('Regulus', 10000, 'White Main Sequence', FALSE, 300, 2, 14);
    ```
    
17. ~~A tabela do planet deve ter **pelo menos 12 linhas**~~
    
    planet
    
    ```sql
    INSERT INTO planet (name, age_in_millions_of_years, planet_type, has_life, number_of_moons, one_year, star_id)
    VALUES 
    ('Mercury', 4500, 'Terrestrial', FALSE, 0, 88, 1),
    ('Venus', 4500, 'Terrestrial', FALSE, 0, 225, 1),
    ('Earth', 4500, 'Terrestrial', TRUE, 1, 365, 1),
    ('Mars', 4500, 'Terrestrial', FALSE, 2, 687, 1),
    ('Jupiter', 4500, 'Gas Giant', FALSE, 79, 4380, 1),
    ('Saturn', 4500, 'Gas Giant', FALSE, 83, 10756, 1),
    ('Uranus', 4500, 'Ice Giant', FALSE, 27, 30688, 1),
    ('Neptune', 4500, 'Ice Giant', FALSE, 14, 60225, 1),
    ('Kepler-22b', 2000, 'Exoplanet', TRUE, 3, 289, 5),
    ('Gliese 581g', 4500, 'Exoplanet', TRUE, 2, 38, 6),
    ('TrES-2b', 1000, 'Gas Giant', FALSE, 0, 2.5, 7),
    ('HD 209458 b', 500, 'Hot Jupiter', FALSE, 0, 3.5, 8),
    ('WASP-12b', 300, 'Hot Jupiter', FALSE, 0, 1, 9),
    ('HR 8799 b', 100, 'Gas Giant', FALSE, 4, 4590, 10),
    ('KOI-456.04', 4500, 'Exoplanet', TRUE, 1, 365, 11),
    ('LHS 1140b', 5000, 'Super Earth', FALSE, 0, 25, 12),
    ('Ross 128b', 4500, 'Exoplanet', TRUE, 0, 10, 13),
    ('Proxima b', 4500, 'Exoplanet', TRUE, 0, 11.2, 14),
    ('55 Cancri e', 1000, 'Super Earth', FALSE, 0, 18, 15),
    ('Kepler-442b', 5000, 'Super Earth', TRUE, 0, 112, 16);
    ```
    
18. ~~A tabela moon deve ter **pelo menos 20 linhas**~~
    
    moon
    
    ```sql
    INSERT INTO moon (name, mass, lunar_composition, is_visible_from_earth, lunar_phases, distance_from_earth, planet_id)
    VALUES 
    ('Luna', 7.35E22, 'Rocky, Silicaceous', TRUE, 8, 384400, 3),
    ('Phobos', 1.08E16, 'Rocky, Carbonaceous', TRUE, 4, 9378, 4),
    ('Deimos', 1.48E15, 'Rocky, Carbonaceous', TRUE, 4, 23460, 4),
    ('Io', 8.93E22, 'Volcanic, Sulfuric', FALSE, 8, 421700, 5),
    ('Europa', 4.80E22, 'Water Ice, Rocky Core', FALSE, 8, 670900, 5),
    ('Ganymede', 1.48E23, 'Water Ice, Silicates', FALSE, 8, 1070400, 5),
    ('Callisto', 1.08E23, 'Water Ice, Rocky Core', FALSE, 8, 1882700, 5),
    ('Titan', 1.35E23, 'Nitrogen-Rich, Hydrocarbon Lakes', FALSE, 8, 1221870, 6),
    ('Enceladus', 1.08E20, 'Water Ice, Silicates', FALSE, 8, 238042, 6),
    ('Mimas', 3.75E19, 'Water Ice, Silicates', FALSE, 8, 185539, 6),
    ('Triton', 2.14E22, 'Water Ice, Nitrogen Atmosphere', FALSE, 8, 354759, 8),
    ('Himalia', 9.56E18, 'Carbonaceous Rock', FALSE, 8, 11461000, 5),
    ('Oberon', 3.01E21, 'Water Ice, Rocky Core', FALSE, 8, 583520, 7),
    ('Titania', 3.49E21, 'Water Ice, Rocky Core', FALSE, 8, 435910, 7),
    ('Umbriel', 1.27E21, 'Water Ice, Carbonaceous', FALSE, 8, 266000, 7),
    ('Ariel', 1.35E21, 'Water Ice, Silicates', FALSE, 8, 191020, 7),
    ('Dione', 1.10E21, 'Water Ice, Rocky Core', FALSE, 8, 377400, 6),
    ('Rhea', 2.31E21, 'Water Ice, Rocky Core', FALSE, 8, 527000, 6),
    ('Hyperion', 1.08E19, 'Porous Water Ice', FALSE, 8, 1500000, 6),
    ('Iapetus', 1.81E21, 'Water Ice, Dark Carbon Compounds', FALSE, 8, 3561000, 6);
    ```
    
    asteroid
    
    ```bash
    INSERT INTO asteroid (name, composition, diameter_km, orbital_period_days, is_potentially_hazardous, planet_id)
    VALUES
    ('Ceres', 'Rock and Ice', 945, 1680, FALSE, NULL),
    ('Vesta', 'Rocky Metallic', 525, 1325, FALSE, NULL),
    ('Eros', 'Silicaceous', 17, 643, FALSE, NULL),
    ('Itokawa', 'Rubber-like Rocky', 0.3, 556, FALSE, NULL),
    ('Psyche', 'Metallic Iron-Nickel', 226, 1825, FALSE, NULL),
    ('Apophis', 'Silicaceous', 0.37, 323, TRUE, NULL),
    ('Bennu', 'Carbonaceous', 0.49, 436, TRUE, NULL),
    ('Ryugu', 'Carbonaceous', 0.88, 480, FALSE, NULL),
    ('Toutatis', 'Silicaceous', 4.5, 1467, FALSE, NULL),
    ('Ganymed', 'Silicaceous', 31, 1360, FALSE, NULL),
    ('Icarus', 'Silicaceous', 1.4, 409, FALSE, NULL),
    ('Daedalus', 'Rocky', 3.7, 828, FALSE, NULL),
    ('Pallas', 'Rocky', 510, 1685, FALSE, NULL),
    ('Hygiea', 'Carbonaceous', 431, 2038, FALSE, NULL),
    ('Davida', 'Carbonaceous', 326, 1860, FALSE, NULL),
    ('Hermes', 'Silicaceous', 1.1, 777, FALSE, NULL),
    ('Juno', 'Rocky', 258, 1593, FALSE, NULL),
    ('Astraea', 'Rocky', 120, 1546, FALSE, NULL),
    ('Interamnia', 'Carbonaceous', 350, 2001, FALSE, NULL),
    ('Hathor', 'Silicaceous', 0.29, 513, TRUE, NULL);
    ```
    
19. ~~Cada tabela deve ter **pelo menos três colunas**~~
    
    ```sql
    ALTER TABLE table_name ADD COLUMN column_name DATATYPE;
    ```
    
20. ~~As tabelas de galaxy, star, planet e moon devem ter, cada uma, **pelo menos cinco colunas**~~
    
    
    | **COLUMNS galaxy** | **COLUMNS star** | **COLUMNS planet** | **COLUMNS moon** |
    | --- | --- | --- | --- |
    | galaxy_id SERIAL PK | star_id SERIAL PK | planet_id SERIAL PK | moon_id SERIAL PK |
    | name VARCHAR UNIQUE | name VARCHAR UNIQUE | name VARCHAR UNIQUE | name VARCHAR UNIQUE |
    | `age_in_millions_of_years` NUMERIC NOT NULL | star_temperature NUMERIC NOT NULL | `age_in_millions_of_years` NUMERIC NOT NULL | mass NUMERIC NOT NULL |
    | `galaxy_type` TEXT | type_of_star TEXT | `planet_type` TEXT | lunar_composition TEXT |
    | `is_spherical` BOOLEAN | massive_star BOOLEAN | `has_life` BOOLEAN | is_visible_from_earth BOOLEAN |
    | average_diameter_in_light_years INT | star_age INT | number_of_moons INT | lunar_phase INT |
    | category_number INT | phases_of_star_life INT | one_year INT | `distance_from_earth` INT |
    | galaxy_name FK | galaxy_name FK | galaxy_name TEXT FK | galaxy_name FK |
21. ~~Pelo menos duas colunas por tabela **não devem aceitar valores NULL**~~
    
    
    | name  |
    | --- |
    | name  |
    | name |
    | name |
    
    ```sql
    ALTER TABLE table_name ADD COLUMN column_name DATATYPE NOT NULL;
    /*name column*/
    ALTER TABLE table_name ADD COLUMN column_name DATATYPE NOT NULL UNIQUE;
    ```
    
22. ~~Pelo menos **uma coluna** de cada tabela deve ser **UNIQUE**~~
    
    Coluna name
    
23. **~~Todas as colunas** nomeadas name devem ser do tipo **VARCHAR**~~
    
    > *RESOLVIDO NO ITEM 5*
    > 
24. ~~Cada coluna de chave primária deve seguir a convenção de nomenclatura **table_name_id**.~~ 
    
    ~~Por exemplo, a tabela moon deve ter **uma** coluna de chave primária chamada **moon_id**~~
    
    > *RESOLVIDO NO ITEM 4*
    > 
25. ~~Cada coluna de chave estrangeira deve ter o **mesmo nome da coluna** à qual está **referenciando**~~
    
    galaxy_id, star_id, planet_id, moon_id
