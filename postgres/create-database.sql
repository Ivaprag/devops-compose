-- Mattermost
-- https://github.com/mattermost/mattermost-docker
CREATE USER mattermost PASSWORD 'mattermost';
CREATE DATABASE mattermost;
GRANT ALL PRIVILEGES ON DATABASE mattermost TO mattermost;

-- ownCloud
CREATE USER owncloud PASSWORD 'owncloud';
CREATE DATABASE owncloud;
GRANT ALL PRIVILEGES ON DATABASE owncloud TO owncloud;
