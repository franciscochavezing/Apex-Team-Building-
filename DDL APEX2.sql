#DROP DATABASE APEX;
#CREATE DATABASE IF NOT EXISTS APEX;
USE APEX;
create table Sponsor
	(SponsorID		varchar(8) NOT NULL PRIMARY KEY,
	 Name		varchar(40) NOT NULL,
	 Sponsor_Region		varchar(20),
	 Amount  numeric(12,2) check (Amount>0)
	);
create table Team
	(TeamID		varchar(8) NOT NULL PRIMARY KEY,
	 Team_Name		varchar(40) NOT NULL,
	 Achievements		varchar(40),
	 Team_Region  varchar(20)
	);
create table Tournament
	(TournamentID		varchar(10) NOT NULL PRIMARY KEY,
	 Tournament_Name varchar(40) NOT NULL,
     Fee numeric(12,2) check (Fee>0) NOT NULL,
	 Tournament_Region  varchar(20),
     Reward numeric(12,2) check (Reward>0) NOT NULL
     );
create table Sponsorships_Team
	(SponsorID		varchar(8) NOT NULL,
    TeamID		varchar(8) NOT NULL,
    primary key (SponsorID,TeamID),
    foreign key (SponsorID) references Sponsor(SponsorID) on delete cascade on update cascade,
    foreign key (TeamID) references Team(TeamID) on delete cascade on update cascade
    ); 
create table Sponsorships_Tournament
	(SponsorID		varchar(8) NOT NULL,
    TournamentID		varchar(10) NOT NULL,
    primary key (SponsorID,TournamentID),
    foreign key (SponsorID) references Sponsor(SponsorID) on delete cascade on update cascade,
    foreign key (TournamentID) references Tournament(TournamentID) on delete cascade on update cascade
    ); 
create table Participates
	(TeamID		varchar(8) NOT NULL,
    TournamentID		varchar(10) NOT NULL,
    primary key (TeamID,TournamentID),
    foreign key (TeamID) references Team(TeamID) on delete cascade on update cascade,
    foreign key (TournamentID) references Tournament(TournamentID) on delete cascade on update cascade
    ); 
#OK
create table Squad
	( SquadID varchar(8) NOT NULL PRIMARY KEY,
    SquadName varchar(40) NOT NULL,
    TeamID		varchar(8) NOT NULL,
    foreign key (TeamID) references Team(TeamID) on delete cascade on update cascade
    );
#OK
DROP table Enrollment;
create table Enrollment
	( SquadID varchar(8) NOT NULL,
    TournamentID		varchar(10) NOT NULL,
    primary key (SquadID ,TournamentID),
    foreign key (SquadID) references Squad(SquadID) on delete cascade on update cascade,
    foreign key (TournamentID) references Tournament(TournamentID) on delete cascade on update cascade
    );
#OK
create table Legend 
	(LegendID varchar(8) NOT NULL PRIMARY KEY,
    Playstyle varchar(40) NOT NULL,
    Tactical_ability varchar(40) NOT NULL,
    Passive_ability varchar(40) NOT NULL,
    Ultimate_ability varchar(40) NOT NULL,
    Name varchar(40) NOT NULL
    );
#OK
create table Equipment
	( WeaponID varchar(8) NOT NULL PRIMARY KEY,
    Range_ numeric(12,2) check (Range_>0), 
    Type_ varchar(20),
    AmmoType varchar(20));
#OK
DROP table Player;
create table Player
	( SquadID varchar(8) NOT NULL,
    PlayerID varchar(8) NOT NULL,
    Country		varchar(20),
    Age int check (Age>12) NOT NULL,
    Player_Name varchar(40),
    Role_ varchar(40),
    LegendID varchar(8) NOT NULL,
    WeaponID varchar(8) NOT NULL,
    primary key(SquadID,PlayerID),
    foreign key (SquadID) references Squad(SquadID) on delete cascade on update cascade,
    foreign key (LegendID) references Legend(LegendID) on delete cascade on update cascade,
    foreign key (WeaponID) references Equipment(WeaponID) on delete cascade on update cascade
    );
#OK 
create table Coach
	(SquadID varchar(8) NOT NULL,
    CoachID varchar(8) NOT NULL,
    Coach_Name varchar(40),
    Career_Time numeric(3,2) check (Career_Time>0) NOT NULL,
    Coach_Role varchar(40),
    primary key( SquadID,CoachID),
    foreign key (SquadID) references Squad(SquadID) on delete cascade on update cascade
    );
 #OK 
 ALTER TABLE Player ADD INDEX idx_PlayerID (PlayerID);
 ALTER TABLE Squad ADD INDEX idx_SquadID (SquadID);
create table Metrics
	(MetricsID varchar(8) NOT NULL PRIMARY KEY,
    Headshot numeric(5,2)  ,
    IG_Rank int,
    Win numeric(5,2) ,
    Damage_per_game numeric(5,2) check (Damage_per_game>0),
    Kill_Death numeric(5,2) check (Kill_Death>0),
    PlayerID varchar(8)NOT NULL ,
    SquadID varchar(8)NOT NULL,
    foreign key (PlayerID) references Player(PlayerID) on delete cascade on update cascade,
    foreign key (SquadID) references Squad(SquadID) on delete cascade on update cascade
    );
#ok
create table Map
	( MapID varchar(8) NOT NULL PRIMARY KEY,
    Area numeric(10,2) check (Area>10),
    Conditions varchar(20)
    );
#ok
create table Game
	(GameSerial varchar(8) NOT NULL PRIMARY KEY,
    MapID varchar(8) NOT NULL,
    TournamentID		varchar(10) NOT NULL,
    Start_time_h numeric (2)check (Start_time_h >= 0 and Start_time_h < 24),
    Start_time_m numeric (2)check (Start_time_m >= 0 and Start_time_m < 60),
    Finish_time_h numeric (2)check (Finish_time_h >= 0 and Finish_time_h < 24),
    Finish_time_m numeric (2)check (Finish_time_m >= 0 and Finish_time_m < 60),
    foreign key (MapID) references Map(MapID) on delete cascade on update cascade,
    foreign key (TournamentID) references Tournament(TournamentID) on delete cascade on update cascade
    );
#ok
create table Play
	(GameSerial varchar(8) NOT NULL,
    SquadID varchar(8) NOT NULL ,
    primary key (SquadID,GameSerial),
    foreign key (SquadID) references Squad(SquadID) on delete cascade on update cascade,
    foreign key (GameSerial) references Game(GameSerial) on delete cascade on update cascade
    );
#ok
