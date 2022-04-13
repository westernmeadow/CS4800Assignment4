
CREATE TABLE forum.Instrument (
                Name VARCHAR NOT NULL,
                Pitch NUMERIC NOT NULL,
                CONSTRAINT instrument_id PRIMARY KEY (Name)
);


CREATE TABLE forum.Address (
                AddressID INTEGER NOT NULL,
                Number INTEGER NOT NULL,
                Street1 VARCHAR NOT NULL,
                Street2 VARCHAR,
                City VARCHAR NOT NULL,
                State VARCHAR NOT NULL,
                Zip_Code INTEGER NOT NULL,
                Telephone VARCHAR NOT NULL,
                CONSTRAINT address_id PRIMARY KEY (AddressID)
);


CREATE TABLE forum.Mucisian (
                SSN INTEGER NOT NULL,
                Name VARCHAR NOT NULL,
                AddressID INTEGER NOT NULL,
                CONSTRAINT musician_id PRIMARY KEY (SSN)
);


CREATE TABLE forum.Plays (
                SSN INTEGER NOT NULL,
                Name VARCHAR NOT NULL,
                CONSTRAINT plays_id PRIMARY KEY (SSN, Name)
);


CREATE TABLE forum.Album (
                AlbumID INTEGER NOT NULL,
                Title VARCHAR NOT NULL,
                Release_Date DATE NOT NULL,
                Format VARCHAR NOT NULL,
                Age INTEGER NOT NULL,
                SSN INTEGER NOT NULL,
                CONSTRAINT album_id PRIMARY KEY (AlbumID)
);


CREATE TABLE forum.Song (
                Title VARCHAR NOT NULL,
                Length TIME NOT NULL,
                SSN INTEGER NOT NULL,
                AlbumID INTEGER NOT NULL,
                CONSTRAINT song_id PRIMARY KEY (Title)
);


CREATE TABLE forum.Performer (
                SSN INTEGER NOT NULL,
                Title VARCHAR NOT NULL,
                CONSTRAINT performer_id PRIMARY KEY (SSN, Title)
);


CREATE TABLE forum.Uses (
                Name VARCHAR NOT NULL,
                Title VARCHAR NOT NULL,
                CONSTRAINT uses_id PRIMARY KEY (Name, Title)
);


ALTER TABLE forum.Plays ADD CONSTRAINT instrument_plays_fk
FOREIGN KEY (Name)
REFERENCES forum.Instrument (Name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE forum.Uses ADD CONSTRAINT instrument_uses_fk
FOREIGN KEY (Name)
REFERENCES forum.Instrument (Name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE forum.Mucisian ADD CONSTRAINT address_mucisian_fk
FOREIGN KEY (AddressID)
REFERENCES forum.Address (AddressID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE forum.Album ADD CONSTRAINT mucisian_album_fk
FOREIGN KEY (SSN)
REFERENCES forum.Mucisian (SSN)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE forum.Song ADD CONSTRAINT mucisian_song_fk
FOREIGN KEY (SSN)
REFERENCES forum.Mucisian (SSN)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE forum.Plays ADD CONSTRAINT mucisian_plays_fk
FOREIGN KEY (SSN)
REFERENCES forum.Mucisian (SSN)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE forum.Performer ADD CONSTRAINT mucisian_performer_fk
FOREIGN KEY (SSN)
REFERENCES forum.Mucisian (SSN)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE forum.Song ADD CONSTRAINT album_song_fk
FOREIGN KEY (AlbumID)
REFERENCES forum.Album (AlbumID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE forum.Uses ADD CONSTRAINT song_uses_fk
FOREIGN KEY (Title)
REFERENCES forum.Song (Title)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE forum.Performer ADD CONSTRAINT song_performer_fk
FOREIGN KEY (Title)
REFERENCES forum.Song (Title)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
