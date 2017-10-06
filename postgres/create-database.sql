-- Mattermost
-- https://github.com/mattermost/mattermost-docker
CREATE USER mattermost PASSWORD #PASS#;
CREATE DATABASE mattermost;
GRANT ALL PRIVILEGES ON DATABASE mattermost TO mattermost;

-- ownCloud
CREATE USER owncloud PASSWORD #PASS#;
CREATE DATABASE owncloud;
GRANT ALL PRIVILEGES ON DATABASE owncloud TO owncloud;

CREATE ROLE gitlab with LOGIN CREATEDB PASSWORD #PASS#; 
CREATE DATABASE gitlab;
GRANT ALL PRIVILEGES ON DATABASE gitlab to gitlab;
