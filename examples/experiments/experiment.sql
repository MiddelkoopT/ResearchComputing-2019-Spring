-- Simple experimental control
-- Copyright 2018 by Timothy Middelkoop, Licensed under the Apache License 2.0

CREATE TABLE Campaign (
       id INTEGER PRIMARY KEY,
       repo TEXT,
       commitid TEXT,
       branch TEXT,
       dirty TEXT,     -- Repo is dirty
       name TEXT,      -- Human readable name of this campaign
       config TEXT,    -- JSON configuration used to create the campaign
       note TEXT,      -- Optional Notes
       started DATE,
       finshed DATE,
       closed BOOLEAN  -- Campaign is finished/aborted (True, False/NULL)
);

CREATE TABLE Experiment (
       id INTEGER PRIMARY KEY,
       campaign INTEGER,
       parameters TEXT, -- JSON parameters for the experiment
       started DATE,
       finished DATE
);

CREATE TABLE Run (
       id INTEGER PRIMARY KEY,
       campaign INTEGER,
       experiment INTEGER,
       cluster TEXT,   -- SLURM job information
       jobid INTEGER,
       stepid INTEGER,
       started DATE,
       finsihed DATE,
       state BOOLEAN,  -- SLRURM Job state, used for crash detection.
       result TEXT     -- JSON result for the experiment
);
