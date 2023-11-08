# CREAR UN NUEVO SCHEMA
CREATE SCHEMA IF NOT EXISTS RunningApp;
# USE DATABASE
USE RunningApp;
# DROP ALL TABLES
DROP TABLE IF EXISTS USER_ACHIEVEMENTS;
DROP TABLE IF EXISTS ACHIEVEMENTS;
DROP TABLE IF EXISTS WEATHER;
DROP TABLE IF EXISTS WORKOUT_INSTRUMENTS;
DROP TABLE IF EXISTS INSTRUMENTS;
DROP TABLE IF EXISTS DATE;
DROP TABLE IF EXISTS WORKOUT;
DROP TABLE IF EXISTS RUN_PLAN;
DROP TABLE IF EXISTS USER;

# CREAR LA TABLA USER
CREATE TABLE USER(
    UserID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    PRIMARY KEY(UserID)
);
# CREAR LA TABLA ACHIEVEMENTS
CREATE TABLE ACHIEVEMENTS(
    AchievementID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(300) NOT NULL,
    PRIMARY KEY(AchievementID)
);

# CREAR LA TABLA USER_ACHIEVEMENTS
CREATE TABLE USER_ACHIEVEMENTS(
    UserID INT NOT NULL,
    AchievementID INT NOT NULL,
    PRIMARY KEY(UserID, AchievementID),
    FOREIGN KEY(UserID) REFERENCES USER(UserID),
    FOREIGN KEY(AchievementID) REFERENCES ACHIEVEMENTS(AchievementID)
);

# CREAR LA TABLA RUN_PLAN
CREATE TABLE RUN_PLAN(
    PlanID INT NOT NULL AUTO_INCREMENT,
    UserID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Description VARCHAR(300) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES USER(UserID),
    PRIMARY KEY(PlanID)

);

# CREAR LA TABLA WORKOUT
CREATE TABLE WORKOUT(
    WorkoutID INT NOT NULL AUTO_INCREMENT,
    PlanID INT NOT NULL,
    Type VARCHAR(100) NOT NULL,
    Distance FLOAT,
    Duration TIME,
    HeartZone INT,
    FOREIGN KEY (PlanID) REFERENCES RUN_PLAN(PlanID),
    PRIMARY KEY(WorkoutID)
);

# CREAR LA TABLA DATE
CREATE TABLE DATE(
    DateID INT NOT NULL AUTO_INCREMENT,
    WorkoutID INT NOT NULL,
    Year INT NOT NULL,
    Month INT NOT NULL,
    Day INT NOT NULL,
    InitHour TIME NOT NULL,
    EndHour TIME NOT NULL,
    FOREIGN KEY (WorkoutID) REFERENCES WORKOUT(WorkoutID),
    PRIMARY KEY(DateID)
);

#CREAR LA TABLA WEAHTER
CREATE TABLE WEATHER(
    WeatherID INT NOT NULL AUTO_INCREMENT,
    DateID INT NOT NULL,
    Temperature FLOAT,
    Conditions VARCHAR(50),
    WindSpeed FLOAT,
    Clouds BOOLEAN,
    FOREIGN KEY (DateID) REFERENCES DATE(DateID),
    PRIMARY KEY(WeatherID)
);

# CREAR LA TABLA INSTRUMENTS
CREATE TABLE INSTRUMENTS(
    InstrumentID INT NOT NULL AUTO_INCREMENT,
    Type VARCHAR(100) NOT NULL,
    PRIMARY KEY(InstrumentID)
);

# CREAR LA TABLA WORKOUT_INSTRUMENTS
CREATE TABLE WORKOUT_INSTRUMENTS(
    WorkoutID INT NOT NULL,
    InstrumentID INT NOT NULL,
    FOREIGN KEY (WorkoutID) REFERENCES WORKOUT(WorkoutID),
    FOREIGN KEY (InstrumentID) REFERENCES INSTRUMENTS(InstrumentID),
    PRIMARY KEY(WorkoutID, InstrumentID)
);

# INSERTAR DATOS EN LAS TABLAS
# TABLA USER
-- Insert 0
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Juan', 'Cisneros', '2002-01-06',
                                                                      'juanfrancistm2011@icloud.com', '06012002jF_');
-- Insert 1
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Elena', 'Ramirez', '1990-03-15',
                                                                      'elena.ramirez@gmail.com', '15031990_ER');


-- Insert 2

INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Carlos', 'Perez', '1985-07-20',
                                                                      'carlos.perez@hotmail.com', '20071985_CP');


-- Insert 3

INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Sofia', 'Garcia', '1998-11-02',
                                                                      'sofia.garcia@yahoo.com', '02111998_SG');

-- Insert 4
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Luisa', 'Fernandez', '1982-06-10',
                                                                      'luisa.fernandez@gmail.com', '10061982_LF');

-- Insert 5
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Pedro', 'Lopez', '2005-04-25',
                                                                      'pedro.lopez@gmail.com', '25042005_PL');

-- Insert 6
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Miguel', 'Torres', '1993-12-08',
                                                                      'miguel.torres@yahoo.com', '08121993_MT');

-- Insert 7
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Isabel', 'Sanchez', '1987-09-17',
                                                                      'isabel.sanchez@hotmail.com', '17091987_IS');

-- Insert 8
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Javier', 'Morales', '2000-01-30',
                                                                      'javier.morales@gmail.com', '30012000_JM');

-- Insert 9
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Carmen', 'Diaz', '1984-08-12',
                                                                      'carmen.diaz@yahoo.com', '12081984_CD');

-- Insert 10
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Raul', 'Hernandez', '1991-05-27',
                                                                      'raul.hernandez@gmail.com', '27051991_RH');

-- Insert 11
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Laura', 'Castro', '2001-03-19',
                                                                      'laura.castro@hotmail.com', '19032001_LC');

-- Insert 12
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Diego', 'Gomez', '1996-10-14',
                                                                      'diego.gomez@yahoo.com', '14101996_DG');

-- Insert 13
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Natalia', 'Vargas', '1989-07-03',
                                                                      'natalia.vargas@gmail.com', '03071989_NV');

-- Insert 14
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Manuel', 'Martinez', '1994-02-28',
                                                                      'manuel.martinez@yahoo.com', '28021994_MM');

-- Insert 15
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Paula', 'Santos', '2004-09-05',
                                                                      'paula.santos@hotmail.com', '05092004_PS');

-- Insert 16
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Alejandro', 'Ortega', '1997-06-22',
                                                                      'alejandro.ortega@gmail.com', '22061997_AO');

-- Insert 17
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Rosa', 'Reyes', '1983-04-18',
                                                                      'rosa.reyes@yahoo.com', '18041983_RR');

-- Insert 18
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Hector', 'Cabrera', '2003-12-11',
                                                                      'hector.cabrera@hotmail.com', '11122003_HC');

-- Insert 19
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Adriana', 'Fuentes', '1992-08-07',
                                                                      'adriana.fuentes@gmail.com', '07081992_AF');

-- Insert 20
INSERT INTO USER (Name, LastName, BirthDate, Email, Password) VALUES ('Julio', 'Silva', '1986-01-24',
                                                                      'julio.silva@yahoo.com', '24011986_JS');
# TABLA ACHIEVEMENTS
-- Insert 0
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Maratón en un Lugar Exótico',
                                                     'Completar un maratón en un lugar exótico o en el extranjero.');


-- Insert 1
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Medalla de Oro en Carrera de 5K',
                                                     'Ganar una medalla de oro en una carrera de 5 kilómetros.');

-- Insert 2
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Maratón Completo',
                                                     'Completar un maratón de 42.195 kilómetros.');

-- Insert 3
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Correr 1000 Kilómetros en un Año',
                                                     'Alcanzar la marca de correr 1000 kilómetros en un año.');

-- Insert 4
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Medalla de Oro en Carrera de 10K',
                                                     'Ganar una medalla de oro en una carrera de 10 kilómetros.');

-- Insert 5
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Logro de Velocidad', 'Correr 1 kilómetro en menos de 4 minutos.');

-- Insert 6
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Medalla de Finisher en Ultra Maratón',
                                                     'Completar una ultra maratón de 50 kilómetros o más.');

-- Insert 7
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Consecución de Maratón en Ciudad',
                                                     'Correr un maratón en una ciudad reconocida.');

-- Insert 8
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Récord Personal en Media Maratón',
                                                     'Establecer un nuevo récord personal en una media maratón.');

-- Insert 9
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Desafío de Elevación',
                                                     'Correr una ruta con elevación significativa.');

-- Insert 10
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Medalla de Oro en Carrera de 21K',
                                                     'Ganar una medalla de oro en una media maratón.');

-- Insert 11
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Cross-Country Runner',
                                                     'Participar en una carrera de cross-country y completarla.');

-- Insert 12
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Correr 10 Kilómetros en Menos de 40 Minutos',
                                                     'Lograr correr 10 kilómetros en menos de 40 minutos.');

-- Insert 13
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Logro de Resistencia',
                                                     'Correr 20 kilómetros sin detenerse.');

-- Insert 14
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Consecución de Ruta Escénica',
                                                     'Correr en una ruta con vistas panorámicas impresionantes.');

-- Insert 15
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Medalla de Oro en Carrera de 42K',
                                                     'Ganar una medalla de oro en un maratón.');

-- Insert 16
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Carrera Nocturna Completada',
                                                     'Completar una carrera nocturna de 10 kilómetros o más.');

-- Insert 17
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Consecución de Trail Running',
                                                     'Correr en una carrera de trail running y completarla.');

-- Insert 18
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Medalla de Finisher en Carrera de Montaña',
                                                     'Completar una carrera de montaña de alta dificultad.');

-- Insert 19
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Correr una Media Maratón en Menos de 1.30H',
                                                     'Lograr correr una media maratón en menos de 1.30 Horas.');

-- Insert 20
INSERT INTO ACHIEVEMENTS (Name, Description) VALUES ('Entrenamiento Diario por 30 Días',
                                                     'Correr todos los días durante un mes consecutivo.');


# TABLA USER_ACHIEVEMENTS
-- Insert 0
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (1, 5);
-- Insert 1
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (1, 1);
-- Insert 2
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (2, 4);
-- Insert 3
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (3, 7);
-- Insert 4
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (4, 10);
-- Insert 5
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (5, 13);
-- Insert 6
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (6, 16);
-- Insert 7
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (7, 2);
-- Insert 8
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (8, 5);
-- Insert 9
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (9, 8);
-- Insert 10
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (10, 11);
-- Insert 11
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (11, 14);
-- Insert 12
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (12, 17);
-- Insert 13
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (13, 3);
-- Insert 14
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (14, 6);
-- Insert 15
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (15, 9);
-- Insert 16
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (16, 12);
-- Insert 17
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (17, 15);
-- Insert 18
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (18, 18);
-- Insert 19
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (19, 20);
-- Insert 20
INSERT INTO USER_ACHIEVEMENTS (UserID, AchievementID) VALUES (20, 19);

# TABLA RUN_PLAN
-- Insert 0
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (1, '5K', 'Plan de entrenamiento para 5K');
-- Insert 1
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (2, '10K', 'Plan de entrenamiento para 10K');
-- Insert 2
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (3, 'Medio Maraton', 'Plan de entrenamiento para medio maratón');
-- Insert 3
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (4, 'Maraton', 'Plan de entrenamiento para maratón');
-- Insert 4
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (5, 'Trail', 'Plan de entrenamiento para trail running');
-- Insert 5
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (6, 'Sprint', 'Plan de entrenamiento para sprint');
-- Insert 6
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (7, 'Triatlon', 'Plan de entrenamiento para triatlón');
-- Insert 7
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (8, 'Resistencia', 'Plan de entrenamiento para resistencia');
-- Insert 8
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (9, 'Velocidad', 'Plan de entrenamiento para velocidad');
-- Insert 9
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (10, 'Agilidad', 'Plan de entrenamiento para agilidad');
-- Insert 10
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (11, 'Fuerza', 'Plan de entrenamiento para fuerza');
-- Insert 11
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (12, 'Resistencia Cardiovascular', 'Plan de entrenamiento para resistencia cardio');
-- Insert 12
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (13, 'Velocidad y Agilidad', 'Plan de entrenamiento para velocidad y agilidad');
-- Insert 13
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (14, 'Fuerza y Flexibilidad', 'Plan de entrenamiento para fuerza y flexibilidad');
-- Insert 14
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (15, 'Carrera en Montaña', 'Plan de entrenamiento para carrera en montaña');
-- Insert 15
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (16, 'Maratón y Triatlón', 'Plan de entrenamiento para maratón y triatlón');
-- Insert 16
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (17, 'Velocidad y Resistencia', 'Plan de entrenamiento para velocidad y resistencia');
-- Insert 17
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (18, 'Medio Maratón y Sprint', 'Plan de entrenamiento para medio maratón y sprint');
-- Insert 18
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (19, 'Trail Running y Escalada', 'Plan de entrenamiento para trail runn y hill');
-- Insert 19
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (20, 'Resistencia y Natación', 'Plan de entrenamiento para resistencia y natación');
-- Insert 20
INSERT INTO RUN_PLAN (UserID, Name, Description) VALUES (21, 'Velocidad y Agilidad', 'Plan de entrenamiento para velocidad y agilidad');

# TABLA WORKOUT

-- Insert 0
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (1, 'Carrera 5K', 5, '00:30:00', 3);

-- Insert 1
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (1, 'Carrera 10K', 10, '01:00:00', 4);

-- Insert 2
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (13, 'Carrera Media Distancia', 15, '01:30:00', 4);

-- Insert 3
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (14, 'Carrera Maratón', 20, '02:00:00', 5);

-- Insert 4
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (8, 'Sprint', 5, '00:15:00', 5);

-- Insert 5
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (18, 'Carrera 5K', 5, '00:30:00', 3);

-- Insert 6
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (17, 'Carrera 10K', 10, '01:00:00', 4);

-- Insert 7
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (8, 'Carrera Media Distancia', 15, '01:30:00', 4);

-- Insert 8
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (9, 'Carrera Maratón', 20, '02:00:00', 5);

-- Insert 9
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (11, 'Sprint', 5, '00:15:00', 5);

-- Insert 10
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (8, 'Carrera 5K', 5, '00:30:00', 3);

-- Insert 11
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (9, 'Carrera 10K', 10, '01:00:00', 4);

-- Insert 12
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (13, 'Carrera Media Distancia', 15, '01:30:00', 4);

-- Insert 13
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (14, 'Carrera Maratón', 20, '02:00:00', 5);

-- Insert 14
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (14, 'Sprint', 5, '00:15:00', 5);

-- Insert 15
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (14, 'Carrera 5K', 5, '00:30:00', 3);

-- Insert 16
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (15, 'Carrera 10K', 10, '01:00:00', 4);

-- Insert 17
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (15, 'Carrera Media Distancia', 15, '01:30:00', 4);

-- Insert 18
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (19, 'Carrera Maratón', 20, '02:00:00', 5);

-- Insert 19
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (21, 'Sprint', 5, '00:15:00', 5);

-- Insert 20
INSERT INTO WORKOUT (PlanID, Type, Distance, Duration, HeartZone) VALUES (21, 'Carrera 5K', 5, '00:30:00', 3);


# TABLA DATE
-- Insert 0
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (1, 2021, 5, 1, '17:00:00', '18:30:00');

-- Insert 1
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (2, 2021, 5, 2, '13:00:00', '18:00:00');

-- Insert 2
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (3, 2021, 5, 3, '14:00:00', '16:30:00');

-- Insert 3
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (4, 2021, 5, 4, '17:00:00', '19:00:00');

-- Insert 4
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (5, 2021, 5, 5, '17:00:00', '17:15:00');

-- Insert 5
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (6, 2021, 5, 6, '20:00:00', '22:30:00');

-- Insert 6
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (7, 2021, 5, 7, '22:00:00', '23:00:00');

-- Insert 7
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (8, 2021, 5, 8, '08:00:00', '08:30:00');

-- Insert 8
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (9, 2022, 6, 9, '06:30:00', '07:00:00');

-- Insert 9
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (10, 2022, 6, 10, '09:30:00', '12:30:00');

-- Insert 10
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (11, 2022, 6, 11, '05:30:00', '08:00:00');

-- Insert 11
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (12, 2022, 6, 12, '04:30:00', '09:00:00');

-- Insert 12
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (13, 2022, 6, 13, '07:30:00', '08:15:00');

-- Insert 13
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (14, 2022, 6, 14, '06:30:00', '07:30:00');

-- Insert 14
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (15, 2022, 6, 15, '06:30:00', '08:00:00');

-- Insert 15
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (16, 2022, 6, 16, '09:30:00', '11:30:00');

-- Insert 16
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (17, 2023, 7, 17, '09:00:00', '12:30:00');

-- Insert 17
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (18, 2023, 7, 18, '21:00:00', '22:00:00');

-- Insert 18
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (19, 2023, 7, 19, '20:00:00', '21:30:00');

-- Insert 19
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (20, 2023, 7, 20, '22:00:00', '23:00:00');

-- Insert 20
INSERT INTO DATE (WorkoutID, Year, Month, Day, InitHour, EndHour) VALUES (21, 2023, 7, 21, '23:00:00', '23:30:00');

# TABLA WEATHER
-- Insert 0
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (1, 22, 'Nublado', 10, 2);

-- Insert 1
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (2, 18, 'Lluvioso', 15, 3);

-- Insert 2
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (3, 26, 'Soleado', 12, 0);

-- Insert 3
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (4, 14, 'Nublado', 8, 2);

-- Insert 4
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (5, 20, 'Lluvioso', 18, 3);

-- Insert 5
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (6, 28, 'Soleado', 10, 0);

-- Insert 6
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (7, 16, 'Nublado', 12, 2);

-- Insert 7
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (8, 24, 'Lluvioso', 20, 3);

-- Insert 8
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (9, 30, 'Soleado', 8, 1);

-- Insert 9
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (10, 12, 'Nublado', 10, 2);

-- Insert 10
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (11, 18, 'Lluvioso', 15, 3);

-- Insert 11
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (12, 25, 'Soleado', 12, 0);

-- Insert 12
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (13, 10, 'Nublado', 8, 2);

-- Insert 13
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (14, 22, 'Lluvioso', 20, 3);

-- Insert 14
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (15, 29, 'Soleado', 10, 0);

-- Insert 15
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (16, 14, 'Nublado', 12, 2);

-- Insert 16
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (17, 21, 'Lluvioso', 15, 3);

-- Insert 17
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (18, 27, 'Soleado', 12, 0);

-- Insert 18
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (19, 16, 'Nublado', 10, 2);

-- Insert 19
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (20, 23, 'Lluvioso', 18, 3);

-- Insert 20
INSERT INTO WEATHER (DateID, Temperature, Conditions, WindSpeed, Clouds) VALUES (21, 32, 'Soleado', 10, 0);


# TABLA INSTRUMENTS
-- Insert 0
INSERT INTO INSTRUMENTS (Type) VALUES ('Reloj');

-- Insert 1
INSERT INTO INSTRUMENTS (Type) VALUES ('Pulsera');

-- Insert 2
INSERT INTO INSTRUMENTS (Type) VALUES ('Zapatillas');

-- Insert 3
INSERT INTO INSTRUMENTS (Type) VALUES ('Bloqueador');

-- Insert 4
INSERT INTO INSTRUMENTS (Type) VALUES ('Gorra');

-- Insert 5
INSERT INTO INSTRUMENTS (Type) VALUES ('Camiseta de Compresión');

-- Insert 6
INSERT INTO INSTRUMENTS (Type) VALUES ('Pantalón de Compresión');

-- Insert 7
INSERT INTO INSTRUMENTS (Type) VALUES ('Mochila');

-- Insert 8
INSERT INTO INSTRUMENTS (Type) VALUES ('Botella de Agua');

-- Insert 9
INSERT INTO INSTRUMENTS (Type) VALUES ('Gel Energético');

-- Insert 10
INSERT INTO INSTRUMENTS (Type) VALUES ('Barra Energética');

-- Insert 11
INSERT INTO INSTRUMENTS (Type) VALUES ('Banda de Resistencia');

# TABLA WORKOUT_INSTRUMENTS
-- Insert 0
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (1, 10);

-- Insert 1
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (2, 4);

-- Insert 2
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (3, 8);

-- Insert 3
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (4, 9);

-- Insert 4
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (5, 11);

-- Insert 5
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (5, 10);

-- Insert 6
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (7, 7);

-- Insert 7
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (4, 6);

-- Insert 8
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (2, 5);

-- Insert 9
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (11, 3);

-- Insert 10
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (12, 2);

-- Insert 11
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (12, 1);

-- Insert 12
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (13, 8);

-- Insert 13
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (14, 9);

-- Insert 14
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (14, 11);

-- Insert 15
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (20, 10);

-- Insert 16
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (20, 8);

-- Insert 17
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (21, 9);

-- Insert 18
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (21, 3);

-- Insert 19
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (21, 5);

-- Insert 20
INSERT INTO WORKOUT_INSTRUMENTS (WorkoutID, InstrumentID) VALUES (18, 6);









