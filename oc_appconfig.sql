-- Adminer 4.7.7 PostgreSQL dump

DROP TABLE IF EXISTS "oc_accounts";
CREATE TABLE "public"."oc_accounts" (
    "uid" character varying(64) DEFAULT '' NOT NULL,
    "data" text DEFAULT '' NOT NULL,
    CONSTRAINT "oc_accounts_pkey" PRIMARY KEY ("uid")
) WITH (oids = false);

INSERT INTO "oc_accounts" ("uid", "data") VALUES
('admin',	'{"displayname":{"value":"admin","scope":"contacts","verified":"0"},"address":{"value":"","scope":"private","verified":"0"},"website":{"value":"","scope":"private","verified":"0"},"email":{"value":null,"scope":"contacts","verified":"0"},"avatar":{"scope":"contacts"},"phone":{"value":"","scope":"private","verified":"0"},"twitter":{"value":"","scope":"private","verified":"0"}}');

DROP TABLE IF EXISTS "oc_activity";
DROP SEQUENCE IF EXISTS oc_activity_activity_id_seq;
CREATE SEQUENCE oc_activity_activity_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_activity" (
    "activity_id" bigint DEFAULT nextval('oc_activity_activity_id_seq') NOT NULL,
    "timestamp" integer DEFAULT '0' NOT NULL,
    "priority" integer DEFAULT '0' NOT NULL,
    "type" character varying(255),
    "user" character varying(64),
    "affecteduser" character varying(64) NOT NULL,
    "app" character varying(32) NOT NULL,
    "subject" character varying(255) NOT NULL,
    "subjectparams" text NOT NULL,
    "message" character varying(255),
    "messageparams" text,
    "file" character varying(4000),
    "link" character varying(4000),
    "object_type" character varying(255),
    "object_id" bigint DEFAULT '0' NOT NULL,
    CONSTRAINT "oc_activity_pkey" PRIMARY KEY ("activity_id")
) WITH (oids = false);

CREATE INDEX "activity_filter" ON "public"."oc_activity" USING btree ("affecteduser", "type", "app", "timestamp");

CREATE INDEX "activity_filter_by" ON "public"."oc_activity" USING btree ("affecteduser", "user", "timestamp");

CREATE INDEX "activity_object" ON "public"."oc_activity" USING btree ("object_type", "object_id");

CREATE INDEX "activity_user_time" ON "public"."oc_activity" USING btree ("affecteduser", "timestamp");

INSERT INTO "oc_activity" ("activity_id", "timestamp", "priority", "type", "user", "affecteduser", "app", "subject", "subjectparams", "message", "messageparams", "file", "link", "object_type", "object_id") VALUES
(1,	1605281791,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"3":"\/Reasons to use Nextcloud.pdf"}]',	'',	'[]',	'/Reasons to use Nextcloud.pdf',	'http://localhost/index.php/apps/files/?dir=/',	'files',	3),
(2,	1605281791,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"4":"\/Nextcloud Manual.pdf"}]',	'',	'[]',	'/Nextcloud Manual.pdf',	'http://localhost/index.php/apps/files/?dir=/',	'files',	4),
(3,	1605281791,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"5":"\/Nextcloud.png"}]',	'',	'[]',	'/Nextcloud.png',	'http://localhost/index.php/apps/files/?dir=/',	'files',	5),
(4,	1605281791,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"6":"\/Documents"}]',	'',	'[]',	'/Documents',	'http://localhost/index.php/apps/files/?dir=/',	'files',	6),
(5,	1605281791,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"7":"\/Documents\/Nextcloud flyer.pdf"}]',	'',	'[]',	'/Documents/Nextcloud flyer.pdf',	'http://localhost/index.php/apps/files/?dir=/Documents',	'files',	7),
(6,	1605281791,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"8":"\/Documents\/Welcome to Nextcloud Hub.docx"}]',	'',	'[]',	'/Documents/Welcome to Nextcloud Hub.docx',	'http://localhost/index.php/apps/files/?dir=/Documents',	'files',	8),
(7,	1605281791,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"9":"\/Documents\/Example.md"}]',	'',	'[]',	'/Documents/Example.md',	'http://localhost/index.php/apps/files/?dir=/Documents',	'files',	9),
(8,	1605281791,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"10":"\/Documents\/Readme.md"}]',	'',	'[]',	'/Documents/Readme.md',	'http://localhost/index.php/apps/files/?dir=/Documents',	'files',	10),
(9,	1605281791,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"11":"\/Photos"}]',	'',	'[]',	'/Photos',	'http://localhost/index.php/apps/files/?dir=/',	'files',	11),
(10,	1605281791,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"12":"\/Photos\/Steps.jpg"}]',	'',	'[]',	'/Photos/Steps.jpg',	'http://localhost/index.php/apps/files/?dir=/Photos',	'files',	12),
(11,	1605281791,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"13":"\/Photos\/Nextcloud community.jpg"}]',	'',	'[]',	'/Photos/Nextcloud community.jpg',	'http://localhost/index.php/apps/files/?dir=/Photos',	'files',	13),
(12,	1605281791,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"14":"\/Photos\/Frog.jpg"}]',	'',	'[]',	'/Photos/Frog.jpg',	'http://localhost/index.php/apps/files/?dir=/Photos',	'files',	14),
(13,	1605281791,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"15":"\/Photos\/Gorilla.jpg"}]',	'',	'[]',	'/Photos/Gorilla.jpg',	'http://localhost/index.php/apps/files/?dir=/Photos',	'files',	15),
(14,	1605281791,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"16":"\/Photos\/Birdie.jpg"}]',	'',	'[]',	'/Photos/Birdie.jpg',	'http://localhost/index.php/apps/files/?dir=/Photos',	'files',	16),
(15,	1605281791,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"17":"\/Photos\/Vineyard.jpg"}]',	'',	'[]',	'/Photos/Vineyard.jpg',	'http://localhost/index.php/apps/files/?dir=/Photos',	'files',	17),
(16,	1605281791,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"18":"\/Photos\/Toucan.jpg"}]',	'',	'[]',	'/Photos/Toucan.jpg',	'http://localhost/index.php/apps/files/?dir=/Photos',	'files',	18),
(17,	1605281792,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"19":"\/Photos\/Readme.md"}]',	'',	'[]',	'/Photos/Readme.md',	'http://localhost/index.php/apps/files/?dir=/Photos',	'files',	19),
(18,	1605281792,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"20":"\/Photos\/Library.jpg"}]',	'',	'[]',	'/Photos/Library.jpg',	'http://localhost/index.php/apps/files/?dir=/Photos',	'files',	20),
(19,	1605281792,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"21":"\/Nextcloud intro.mp4"}]',	'',	'[]',	'/Nextcloud intro.mp4',	'http://localhost/index.php/apps/files/?dir=/',	'files',	21),
(20,	1605281792,	30,	'calendar',	'admin',	'admin',	'dav',	'calendar_add_self',	'{"actor":"admin","calendar":{"id":1,"uri":"personal","name":"Personal"}}',	'',	'[]',	'',	'',	'calendar',	1),
(21,	1605282294,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"152":"\/Spreadsheet.xlsx"}]',	'',	'[]',	'/Spreadsheet.xlsx',	'http://192.168.88.202/index.php/apps/files/?dir=/',	'files',	152),
(22,	1605282307,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"157":"\/Document.docx"}]',	'',	'[]',	'/Document.docx',	'http://192.168.88.202/index.php/apps/files/?dir=/',	'files',	157),
(23,	1605282318,	30,	'file_created',	'admin',	'admin',	'files',	'created_self',	'[{"159":"\/Presentation.pptx"}]',	'',	'[]',	'/Presentation.pptx',	'http://192.168.88.202/index.php/apps/files/?dir=/',	'files',	159);

DROP TABLE IF EXISTS "oc_activity_mq";
DROP SEQUENCE IF EXISTS oc_activity_mq_mail_id_seq;
CREATE SEQUENCE oc_activity_mq_mail_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_activity_mq" (
    "mail_id" bigint DEFAULT nextval('oc_activity_mq_mail_id_seq') NOT NULL,
    "amq_timestamp" integer DEFAULT '0' NOT NULL,
    "amq_latest_send" integer DEFAULT '0' NOT NULL,
    "amq_type" character varying(255) NOT NULL,
    "amq_affecteduser" character varying(64) NOT NULL,
    "amq_appid" character varying(32) NOT NULL,
    "amq_subject" character varying(255) NOT NULL,
    "amq_subjectparams" text NOT NULL,
    "object_type" character varying(255),
    "object_id" bigint DEFAULT '0' NOT NULL,
    CONSTRAINT "oc_activity_mq_pkey" PRIMARY KEY ("mail_id")
) WITH (oids = false);

CREATE INDEX "amp_latest_send_time" ON "public"."oc_activity_mq" USING btree ("amq_latest_send");

CREATE INDEX "amp_timestamp_time" ON "public"."oc_activity_mq" USING btree ("amq_timestamp");

CREATE INDEX "amp_user" ON "public"."oc_activity_mq" USING btree ("amq_affecteduser");


DROP TABLE IF EXISTS "oc_addressbookchanges";
DROP SEQUENCE IF EXISTS oc_addressbookchanges_id_seq;
CREATE SEQUENCE oc_addressbookchanges_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_addressbookchanges" (
    "id" bigint DEFAULT nextval('oc_addressbookchanges_id_seq') NOT NULL,
    "uri" character varying(255),
    "synctoken" integer DEFAULT '1' NOT NULL,
    "addressbookid" bigint NOT NULL,
    "operation" smallint NOT NULL,
    CONSTRAINT "oc_addressbookchanges_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "addressbookid_synctoken" ON "public"."oc_addressbookchanges" USING btree ("addressbookid", "synctoken");


DROP TABLE IF EXISTS "oc_addressbooks";
DROP SEQUENCE IF EXISTS oc_addressbooks_id_seq;
CREATE SEQUENCE oc_addressbooks_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_addressbooks" (
    "id" bigint DEFAULT nextval('oc_addressbooks_id_seq') NOT NULL,
    "principaluri" character varying(255),
    "displayname" character varying(255),
    "uri" character varying(255),
    "description" character varying(255),
    "synctoken" integer DEFAULT '1' NOT NULL,
    CONSTRAINT "addressbook_index" UNIQUE ("principaluri", "uri"),
    CONSTRAINT "oc_addressbooks_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "oc_addressbooks" ("id", "principaluri", "displayname", "uri", "description", "synctoken") VALUES
(1,	'principals/users/admin',	'Contacts',	'contacts',	NULL,	1);

DROP TABLE IF EXISTS "oc_appconfig";
CREATE TABLE "public"."oc_appconfig" (
    "appid" character varying(32) DEFAULT '' NOT NULL,
    "configkey" character varying(64) DEFAULT '' NOT NULL,
    "configvalue" text,
    CONSTRAINT "oc_appconfig_pkey" PRIMARY KEY ("appid", "configkey")
) WITH (oids = false);

CREATE INDEX "appconfig_appid_key" ON "public"."oc_appconfig" USING btree ("appid");

CREATE INDEX "appconfig_config_key_index" ON "public"."oc_appconfig" USING btree ("configkey");

INSERT INTO "oc_appconfig" ("appid", "configkey", "configvalue") VALUES
('core',	'installedat',	'1605281729.7015'),
('core',	'lastupdatedat',	'1605281729.7194'),
('core',	'vendor',	'nextcloud'),
('privacy',	'installed_version',	'1.4.0'),
('privacy',	'types',	''),
('privacy',	'enabled',	'yes'),
('files_sharing',	'installed_version',	'1.12.0'),
('core',	'public_files',	'files_sharing/public.php'),
('files_sharing',	'types',	'filesystem'),
('files_sharing',	'enabled',	'yes'),
('serverinfo',	'installed_version',	'1.10.0'),
('serverinfo',	'types',	''),
('serverinfo',	'enabled',	'yes'),
('comments',	'installed_version',	'1.10.0'),
('comments',	'types',	'logging'),
('photos',	'installed_version',	'1.2.0'),
('photos',	'types',	''),
('text',	'installed_version',	'3.1.0'),
('text',	'types',	'dav'),
('text',	'enabled',	'yes'),
('sharebymail',	'installed_version',	'1.10.0'),
('sharebymail',	'types',	'filesystem'),
('sharebymail',	'enabled',	'yes'),
('survey_client',	'installed_version',	'1.8.0'),
('survey_client',	'types',	''),
('recommendations',	'installed_version',	'0.8.0'),
('recommendations',	'types',	''),
('twofactor_backupcodes',	'installed_version',	'1.9.0'),
('twofactor_backupcodes',	'types',	''),
('twofactor_backupcodes',	'enabled',	'yes'),
('notifications',	'installed_version',	'2.8.0'),
('notifications',	'types',	'logging'),
('notifications',	'enabled',	'yes'),
('federation',	'installed_version',	'1.10.1'),
('federation',	'types',	'authentication'),
('files_videoplayer',	'installed_version',	'1.9.0'),
('files_videoplayer',	'types',	''),
('files_videoplayer',	'enabled',	'yes'),
('workflowengine',	'installed_version',	'2.2.0'),
('workflowengine',	'types',	'filesystem'),
('workflowengine',	'enabled',	'yes'),
('logreader',	'installed_version',	'2.5.0'),
('logreader',	'types',	''),
('logreader',	'enabled',	'yes'),
('updatenotification',	'installed_version',	'1.10.0'),
('updatenotification',	'types',	''),
('updatenotification',	'enabled',	'yes'),
('dav',	'installed_version',	'1.16.0'),
('core',	'public_webdav',	'dav/appinfo/v1/publicwebdav.php'),
('dav',	'types',	'filesystem'),
('dav',	'enabled',	'yes'),
('user_status',	'installed_version',	'1.0.0'),
('user_status',	'types',	''),
('support',	'installed_version',	'1.3.0'),
('support',	'types',	'session'),
('dashboard',	'installed_version',	'7.0.0'),
('dashboard',	'types',	''),
('files_pdfviewer',	'installed_version',	'2.0.1'),
('files_pdfviewer',	'types',	''),
('files_pdfviewer',	'enabled',	'yes'),
('weather_status',	'installed_version',	'1.0.0'),
('weather_status',	'types',	''),
('files_rightclick',	'installed_version',	'0.17.0'),
('files_rightclick',	'types',	''),
('files_rightclick',	'enabled',	'yes'),
('lookup_server_connector',	'installed_version',	'1.8.0'),
('lookup_server_connector',	'types',	'authentication'),
('lookup_server_connector',	'enabled',	'yes'),
('files_versions',	'installed_version',	'1.13.0'),
('files_versions',	'types',	'filesystem,dav'),
('files_versions',	'enabled',	'yes'),
('files_trashbin',	'installed_version',	'1.10.1'),
('files_trashbin',	'types',	'filesystem,dav'),
('files_trashbin',	'enabled',	'yes'),
('nextcloud_announcements',	'installed_version',	'1.9.0'),
('nextcloud_announcements',	'types',	'logging'),
('contactsinteraction',	'installed_version',	'1.1.0'),
('contactsinteraction',	'types',	'dav'),
('settings',	'installed_version',	'1.2.0'),
('settings',	'types',	''),
('settings',	'enabled',	'yes'),
('cloud_federation_api',	'installed_version',	'1.3.0'),
('cloud_federation_api',	'types',	'filesystem'),
('cloud_federation_api',	'enabled',	'yes'),
('activity',	'installed_version',	'2.13.2'),
('activity',	'types',	'filesystem'),
('provisioning_api',	'installed_version',	'1.10.0'),
('provisioning_api',	'types',	'prevent_group_restriction'),
('provisioning_api',	'enabled',	'yes'),
('viewer',	'installed_version',	'1.4.0'),
('viewer',	'types',	''),
('viewer',	'enabled',	'yes'),
('theming',	'installed_version',	'1.11.0'),
('theming',	'types',	'logging'),
('theming',	'enabled',	'yes'),
('systemtags',	'installed_version',	'1.10.0'),
('systemtags',	'types',	'logging'),
('files',	'installed_version',	'1.15.0'),
('files',	'types',	'filesystem'),
('files',	'enabled',	'yes'),
('federatedfilesharing',	'installed_version',	'1.10.1'),
('federatedfilesharing',	'types',	''),
('federatedfilesharing',	'enabled',	'yes'),
('oauth2',	'installed_version',	'1.8.0'),
('oauth2',	'types',	'authentication'),
('oauth2',	'enabled',	'yes'),
('password_policy',	'installed_version',	'1.10.1'),
('password_policy',	'types',	'authentication'),
('password_policy',	'enabled',	'yes'),
('firstrunwizard',	'installed_version',	'2.9.0'),
('firstrunwizard',	'types',	'logging'),
('accessibility',	'installed_version',	'1.6.0'),
('accessibility',	'types',	''),
('onlyoffice',	'installed_version',	'6.1.0'),
('onlyoffice',	'types',	'filesystem'),
('onlyoffice',	'enabled',	'yes'),
('accessibility',	'enabled',	'no'),
('activity',	'enabled',	'no'),
('systemtags',	'enabled',	'no'),
('comments',	'enabled',	'no'),
('contactsinteraction',	'enabled',	'no'),
('dashboard',	'enabled',	'no'),
('federation',	'enabled',	'no'),
('firstrunwizard',	'enabled',	'no'),
('nextcloud_announcements',	'enabled',	'no'),
('photos',	'enabled',	'no'),
('recommendations',	'enabled',	'no'),
('support',	'enabled',	'no'),
('survey_client',	'enabled',	'no'),
('user_status',	'enabled',	'no'),
('weather_status',	'enabled',	'no'),
('onlyoffice',	'DocumentServerUrl',	'http://192.168.88.203/'),
('core',	'theming.variables',	'b92d206521717ac032f8aa58d3c7ff2f'),
('nextcloud_announcements',	'pub_date',	'Thu, 24 Oct 2019 00:00:00 +0200'),
('files',	'cronjob_scan_files',	'500'),
('backgroundjob',	'lastjob',	'26'),
('core',	'lastcron',	'1605282833');

DROP TABLE IF EXISTS "oc_authtoken";
DROP SEQUENCE IF EXISTS oc_authtoken_id_seq;
CREATE SEQUENCE oc_authtoken_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_authtoken" (
    "id" bigint DEFAULT nextval('oc_authtoken_id_seq') NOT NULL,
    "uid" character varying(64) DEFAULT '' NOT NULL,
    "login_name" character varying(64) DEFAULT '' NOT NULL,
    "password" text,
    "name" text DEFAULT '' NOT NULL,
    "token" character varying(200) DEFAULT '' NOT NULL,
    "type" smallint DEFAULT '0' NOT NULL,
    "remember" smallint DEFAULT '0' NOT NULL,
    "last_activity" integer DEFAULT '0' NOT NULL,
    "last_check" integer DEFAULT '0' NOT NULL,
    "scope" text,
    "expires" integer,
    "private_key" text,
    "public_key" text,
    "version" smallint DEFAULT '1' NOT NULL,
    "password_invalid" boolean DEFAULT false NOT NULL,
    CONSTRAINT "authtoken_token_index" UNIQUE ("token"),
    CONSTRAINT "oc_authtoken_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "authtoken_last_activity_idx" ON "public"."oc_authtoken" USING btree ("last_activity");

CREATE INDEX "authtoken_uid_index" ON "public"."oc_authtoken" USING btree ("uid");

CREATE INDEX "authtoken_version_index" ON "public"."oc_authtoken" USING btree ("version");


DROP TABLE IF EXISTS "oc_bruteforce_attempts";
DROP SEQUENCE IF EXISTS oc_bruteforce_attempts_id_seq;
CREATE SEQUENCE oc_bruteforce_attempts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_bruteforce_attempts" (
    "id" bigint DEFAULT nextval('oc_bruteforce_attempts_id_seq') NOT NULL,
    "action" character varying(64) DEFAULT '' NOT NULL,
    "occurred" integer DEFAULT '0' NOT NULL,
    "ip" character varying(255) DEFAULT '' NOT NULL,
    "subnet" character varying(255) DEFAULT '' NOT NULL,
    "metadata" character varying(255) DEFAULT '' NOT NULL,
    CONSTRAINT "oc_bruteforce_attempts_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "bruteforce_attempts_ip" ON "public"."oc_bruteforce_attempts" USING btree ("ip");

CREATE INDEX "bruteforce_attempts_subnet" ON "public"."oc_bruteforce_attempts" USING btree ("subnet");


DROP TABLE IF EXISTS "oc_calendar_invitations";
DROP SEQUENCE IF EXISTS oc_calendar_invitations_id_seq;
CREATE SEQUENCE oc_calendar_invitations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_calendar_invitations" (
    "id" bigint DEFAULT nextval('oc_calendar_invitations_id_seq') NOT NULL,
    "uid" character varying(255) NOT NULL,
    "recurrenceid" character varying(255),
    "attendee" character varying(255) NOT NULL,
    "organizer" character varying(255) NOT NULL,
    "sequence" bigint,
    "token" character varying(60) NOT NULL,
    "expiration" bigint NOT NULL,
    CONSTRAINT "oc_calendar_invitations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "calendar_invitation_tokens" ON "public"."oc_calendar_invitations" USING btree ("token");


DROP TABLE IF EXISTS "oc_calendar_reminders";
DROP SEQUENCE IF EXISTS oc_calendar_reminders_id_seq;
CREATE SEQUENCE oc_calendar_reminders_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_calendar_reminders" (
    "id" bigint DEFAULT nextval('oc_calendar_reminders_id_seq') NOT NULL,
    "calendar_id" bigint NOT NULL,
    "object_id" bigint NOT NULL,
    "is_recurring" smallint NOT NULL,
    "uid" character varying(255) NOT NULL,
    "recurrence_id" bigint,
    "is_recurrence_exception" smallint NOT NULL,
    "event_hash" character varying(255) NOT NULL,
    "alarm_hash" character varying(255) NOT NULL,
    "type" character varying(255) NOT NULL,
    "is_relative" smallint NOT NULL,
    "notification_date" bigint NOT NULL,
    "is_repeat_based" smallint NOT NULL,
    CONSTRAINT "oc_calendar_reminders_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "calendar_reminder_objid" ON "public"."oc_calendar_reminders" USING btree ("object_id");

CREATE INDEX "calendar_reminder_uidrec" ON "public"."oc_calendar_reminders" USING btree ("uid", "recurrence_id");


DROP TABLE IF EXISTS "oc_calendar_resources";
DROP SEQUENCE IF EXISTS oc_calendar_resources_id_seq;
CREATE SEQUENCE oc_calendar_resources_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_calendar_resources" (
    "id" bigint DEFAULT nextval('oc_calendar_resources_id_seq') NOT NULL,
    "backend_id" character varying(64),
    "resource_id" character varying(64),
    "email" character varying(255),
    "displayname" character varying(255),
    "group_restrictions" character varying(4000),
    CONSTRAINT "oc_calendar_resources_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "calendar_resources_bkdrsc" ON "public"."oc_calendar_resources" USING btree ("backend_id", "resource_id");

CREATE INDEX "calendar_resources_email" ON "public"."oc_calendar_resources" USING btree ("email");

CREATE INDEX "calendar_resources_name" ON "public"."oc_calendar_resources" USING btree ("displayname");


DROP TABLE IF EXISTS "oc_calendar_resources_md";
DROP SEQUENCE IF EXISTS oc_calendar_resources_md_id_seq;
CREATE SEQUENCE oc_calendar_resources_md_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_calendar_resources_md" (
    "id" bigint DEFAULT nextval('oc_calendar_resources_md_id_seq') NOT NULL,
    "resource_id" bigint NOT NULL,
    "key" character varying(255) NOT NULL,
    "value" character varying(4000),
    CONSTRAINT "oc_calendar_resources_md_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "calendar_resources_md_idk" ON "public"."oc_calendar_resources_md" USING btree ("resource_id", "key");


DROP TABLE IF EXISTS "oc_calendar_rooms";
DROP SEQUENCE IF EXISTS oc_calendar_rooms_id_seq;
CREATE SEQUENCE oc_calendar_rooms_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_calendar_rooms" (
    "id" bigint DEFAULT nextval('oc_calendar_rooms_id_seq') NOT NULL,
    "backend_id" character varying(64),
    "resource_id" character varying(64),
    "email" character varying(255),
    "displayname" character varying(255),
    "group_restrictions" character varying(4000),
    CONSTRAINT "oc_calendar_rooms_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "calendar_rooms_bkdrsc" ON "public"."oc_calendar_rooms" USING btree ("backend_id", "resource_id");

CREATE INDEX "calendar_rooms_email" ON "public"."oc_calendar_rooms" USING btree ("email");

CREATE INDEX "calendar_rooms_name" ON "public"."oc_calendar_rooms" USING btree ("displayname");


DROP TABLE IF EXISTS "oc_calendar_rooms_md";
DROP SEQUENCE IF EXISTS oc_calendar_rooms_md_id_seq;
CREATE SEQUENCE oc_calendar_rooms_md_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_calendar_rooms_md" (
    "id" bigint DEFAULT nextval('oc_calendar_rooms_md_id_seq') NOT NULL,
    "room_id" bigint NOT NULL,
    "key" character varying(255) NOT NULL,
    "value" character varying(4000),
    CONSTRAINT "oc_calendar_rooms_md_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "calendar_rooms_md_idk" ON "public"."oc_calendar_rooms_md" USING btree ("room_id", "key");


DROP TABLE IF EXISTS "oc_calendarchanges";
DROP SEQUENCE IF EXISTS oc_calendarchanges_id_seq;
CREATE SEQUENCE oc_calendarchanges_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_calendarchanges" (
    "id" bigint DEFAULT nextval('oc_calendarchanges_id_seq') NOT NULL,
    "uri" character varying(255),
    "synctoken" integer DEFAULT '1' NOT NULL,
    "calendarid" bigint NOT NULL,
    "operation" smallint NOT NULL,
    "calendartype" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "oc_calendarchanges_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "calid_type_synctoken" ON "public"."oc_calendarchanges" USING btree ("calendarid", "calendartype", "synctoken");


DROP TABLE IF EXISTS "oc_calendarobjects";
DROP SEQUENCE IF EXISTS oc_calendarobjects_id_seq;
CREATE SEQUENCE oc_calendarobjects_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_calendarobjects" (
    "id" bigint DEFAULT nextval('oc_calendarobjects_id_seq') NOT NULL,
    "calendardata" bytea,
    "uri" character varying(255),
    "calendarid" bigint NOT NULL,
    "lastmodified" integer,
    "etag" character varying(32),
    "size" bigint NOT NULL,
    "componenttype" character varying(8),
    "firstoccurence" bigint,
    "lastoccurence" bigint,
    "uid" character varying(255),
    "classification" integer DEFAULT '0',
    "calendartype" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "calobjects_index" UNIQUE ("calendarid", "calendartype", "uri"),
    CONSTRAINT "oc_calendarobjects_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "oc_calendarobjects_props";
DROP SEQUENCE IF EXISTS oc_calendarobjects_props_id_seq;
CREATE SEQUENCE oc_calendarobjects_props_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_calendarobjects_props" (
    "id" bigint DEFAULT nextval('oc_calendarobjects_props_id_seq') NOT NULL,
    "calendarid" bigint DEFAULT '0' NOT NULL,
    "objectid" bigint DEFAULT '0' NOT NULL,
    "name" character varying(64),
    "parameter" character varying(64),
    "value" character varying(255),
    "calendartype" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "oc_calendarobjects_props_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "calendarobject_calid_index" ON "public"."oc_calendarobjects_props" USING btree ("calendarid", "calendartype");

CREATE INDEX "calendarobject_index" ON "public"."oc_calendarobjects_props" USING btree ("objectid", "calendartype");

CREATE INDEX "calendarobject_name_index" ON "public"."oc_calendarobjects_props" USING btree ("name", "calendartype");

CREATE INDEX "calendarobject_value_index" ON "public"."oc_calendarobjects_props" USING btree ("value", "calendartype");


DROP TABLE IF EXISTS "oc_calendars";
DROP SEQUENCE IF EXISTS oc_calendars_id_seq;
CREATE SEQUENCE oc_calendars_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_calendars" (
    "id" bigint DEFAULT nextval('oc_calendars_id_seq') NOT NULL,
    "principaluri" character varying(255),
    "displayname" character varying(255),
    "uri" character varying(255),
    "synctoken" integer DEFAULT '1' NOT NULL,
    "description" character varying(255),
    "calendarorder" integer DEFAULT '0' NOT NULL,
    "calendarcolor" character varying(255),
    "timezone" text,
    "components" character varying(64),
    "transparent" smallint DEFAULT '0' NOT NULL,
    CONSTRAINT "calendars_index" UNIQUE ("principaluri", "uri"),
    CONSTRAINT "oc_calendars_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "oc_calendars" ("id", "principaluri", "displayname", "uri", "synctoken", "description", "calendarorder", "calendarcolor", "timezone", "components", "transparent") VALUES
(1,	'principals/users/admin',	'Personal',	'personal',	1,	NULL,	0,	NULL,	NULL,	'VEVENT,VTODO',	0);

DROP TABLE IF EXISTS "oc_calendarsubscriptions";
DROP SEQUENCE IF EXISTS oc_calendarsubscriptions_id_seq;
CREATE SEQUENCE oc_calendarsubscriptions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_calendarsubscriptions" (
    "id" bigint DEFAULT nextval('oc_calendarsubscriptions_id_seq') NOT NULL,
    "uri" character varying(255),
    "principaluri" character varying(255),
    "displayname" character varying(100),
    "refreshrate" character varying(10),
    "calendarorder" integer DEFAULT '0' NOT NULL,
    "calendarcolor" character varying(255),
    "striptodos" smallint,
    "stripalarms" smallint,
    "stripattachments" smallint,
    "lastmodified" integer,
    "synctoken" integer DEFAULT '1' NOT NULL,
    "source" text,
    CONSTRAINT "calsub_index" UNIQUE ("principaluri", "uri"),
    CONSTRAINT "oc_calendarsubscriptions_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "oc_cards";
DROP SEQUENCE IF EXISTS oc_cards_id_seq;
CREATE SEQUENCE oc_cards_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_cards" (
    "id" bigint DEFAULT nextval('oc_cards_id_seq') NOT NULL,
    "addressbookid" bigint DEFAULT '0' NOT NULL,
    "carddata" bytea,
    "uri" character varying(255),
    "lastmodified" bigint,
    "etag" character varying(32),
    "size" bigint NOT NULL,
    "uid" character varying(255),
    CONSTRAINT "oc_cards_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "cards_abid" ON "public"."oc_cards" USING btree ("addressbookid");


DROP TABLE IF EXISTS "oc_cards_properties";
DROP SEQUENCE IF EXISTS oc_cards_properties_id_seq;
CREATE SEQUENCE oc_cards_properties_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_cards_properties" (
    "id" bigint DEFAULT nextval('oc_cards_properties_id_seq') NOT NULL,
    "addressbookid" bigint DEFAULT '0' NOT NULL,
    "cardid" bigint DEFAULT '0' NOT NULL,
    "name" character varying(64),
    "value" character varying(255),
    "preferred" integer DEFAULT '1' NOT NULL,
    CONSTRAINT "oc_cards_properties_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "card_contactid_index" ON "public"."oc_cards_properties" USING btree ("cardid");

CREATE INDEX "card_name_index" ON "public"."oc_cards_properties" USING btree ("name");

CREATE INDEX "card_value_index" ON "public"."oc_cards_properties" USING btree ("value");

CREATE INDEX "cards_prop_abid" ON "public"."oc_cards_properties" USING btree ("addressbookid");


DROP TABLE IF EXISTS "oc_collres_accesscache";
CREATE TABLE "public"."oc_collres_accesscache" (
    "user_id" character varying(64) NOT NULL,
    "collection_id" bigint DEFAULT '0',
    "resource_type" character varying(64) DEFAULT '',
    "resource_id" character varying(64) DEFAULT '',
    "access" boolean DEFAULT false NOT NULL,
    CONSTRAINT "collres_unique_user" UNIQUE ("user_id", "collection_id", "resource_type", "resource_id")
) WITH (oids = false);

CREATE INDEX "collres_user_coll" ON "public"."oc_collres_accesscache" USING btree ("user_id", "collection_id");

CREATE INDEX "collres_user_res" ON "public"."oc_collres_accesscache" USING btree ("user_id", "resource_type", "resource_id");

INSERT INTO "oc_collres_accesscache" ("user_id", "collection_id", "resource_type", "resource_id", "access") VALUES
('admin',	0,	'file',	'152',	't');

DROP TABLE IF EXISTS "oc_collres_collections";
DROP SEQUENCE IF EXISTS oc_collres_collections_id_seq;
CREATE SEQUENCE oc_collres_collections_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_collres_collections" (
    "id" bigint DEFAULT nextval('oc_collres_collections_id_seq') NOT NULL,
    "name" character varying(64) NOT NULL,
    CONSTRAINT "oc_collres_collections_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "oc_collres_resources";
CREATE TABLE "public"."oc_collres_resources" (
    "collection_id" bigint NOT NULL,
    "resource_type" character varying(64) NOT NULL,
    "resource_id" character varying(64) NOT NULL,
    CONSTRAINT "collres_unique_res" UNIQUE ("collection_id", "resource_type", "resource_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "oc_comments";
DROP SEQUENCE IF EXISTS oc_comments_id_seq;
CREATE SEQUENCE oc_comments_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_comments" (
    "id" bigint DEFAULT nextval('oc_comments_id_seq') NOT NULL,
    "parent_id" bigint DEFAULT '0' NOT NULL,
    "topmost_parent_id" bigint DEFAULT '0' NOT NULL,
    "children_count" integer DEFAULT '0' NOT NULL,
    "actor_type" character varying(64) DEFAULT '' NOT NULL,
    "actor_id" character varying(64) DEFAULT '' NOT NULL,
    "message" text,
    "verb" character varying(64),
    "creation_timestamp" timestamp(0),
    "latest_child_timestamp" timestamp(0),
    "object_type" character varying(64) DEFAULT '' NOT NULL,
    "object_id" character varying(64) DEFAULT '' NOT NULL,
    "reference_id" character varying(64),
    CONSTRAINT "oc_comments_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "comments_actor_index" ON "public"."oc_comments" USING btree ("actor_type", "actor_id");

CREATE INDEX "comments_object_index" ON "public"."oc_comments" USING btree ("object_type", "object_id", "creation_timestamp");

CREATE INDEX "comments_parent_id_index" ON "public"."oc_comments" USING btree ("parent_id");

CREATE INDEX "comments_topmost_parent_id_idx" ON "public"."oc_comments" USING btree ("topmost_parent_id");


DROP TABLE IF EXISTS "oc_comments_read_markers";
CREATE TABLE "public"."oc_comments_read_markers" (
    "user_id" character varying(64) DEFAULT '' NOT NULL,
    "marker_datetime" timestamp(0),
    "object_type" character varying(64) DEFAULT '' NOT NULL,
    "object_id" character varying(64) DEFAULT '' NOT NULL,
    CONSTRAINT "comments_marker_index" UNIQUE ("user_id", "object_type", "object_id")
) WITH (oids = false);

CREATE INDEX "comments_marker_object_index" ON "public"."oc_comments_read_markers" USING btree ("object_type", "object_id");


DROP TABLE IF EXISTS "oc_credentials";
CREATE TABLE "public"."oc_credentials" (
    "user" character varying(64) NOT NULL,
    "identifier" character varying(64) NOT NULL,
    "credentials" text,
    CONSTRAINT "oc_credentials_pkey" PRIMARY KEY ("user", "identifier")
) WITH (oids = false);

CREATE INDEX "credentials_user" ON "public"."oc_credentials" USING btree ("user");


DROP TABLE IF EXISTS "oc_dav_cal_proxy";
DROP SEQUENCE IF EXISTS oc_dav_cal_proxy_id_seq;
CREATE SEQUENCE oc_dav_cal_proxy_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_dav_cal_proxy" (
    "id" bigint DEFAULT nextval('oc_dav_cal_proxy_id_seq') NOT NULL,
    "owner_id" character varying(64) NOT NULL,
    "proxy_id" character varying(64) NOT NULL,
    "permissions" integer,
    CONSTRAINT "dav_cal_proxy_uidx" UNIQUE ("owner_id", "proxy_id", "permissions"),
    CONSTRAINT "oc_dav_cal_proxy_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "dav_cal_proxy_ioid" ON "public"."oc_dav_cal_proxy" USING btree ("owner_id");

CREATE INDEX "dav_cal_proxy_ipid" ON "public"."oc_dav_cal_proxy" USING btree ("proxy_id");


DROP TABLE IF EXISTS "oc_dav_shares";
DROP SEQUENCE IF EXISTS oc_dav_shares_id_seq;
CREATE SEQUENCE oc_dav_shares_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_dav_shares" (
    "id" bigint DEFAULT nextval('oc_dav_shares_id_seq') NOT NULL,
    "principaluri" character varying(255),
    "type" character varying(255),
    "access" smallint,
    "resourceid" bigint NOT NULL,
    "publicuri" character varying(255),
    CONSTRAINT "dav_shares_index" UNIQUE ("principaluri", "resourceid", "type", "publicuri"),
    CONSTRAINT "oc_dav_shares_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "oc_direct_edit";
DROP SEQUENCE IF EXISTS oc_direct_edit_id_seq;
CREATE SEQUENCE oc_direct_edit_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_direct_edit" (
    "id" bigint DEFAULT nextval('oc_direct_edit_id_seq') NOT NULL,
    "editor_id" character varying(64) NOT NULL,
    "token" character varying(64) NOT NULL,
    "file_id" bigint NOT NULL,
    "user_id" character varying(64),
    "share_id" bigint,
    "timestamp" bigint NOT NULL,
    "accessed" boolean DEFAULT false NOT NULL,
    "file_path" character varying(4000),
    CONSTRAINT "oc_direct_edit_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "idx_4d5afeca5f37a13b" ON "public"."oc_direct_edit" USING btree ("token");


DROP TABLE IF EXISTS "oc_directlink";
DROP SEQUENCE IF EXISTS oc_directlink_id_seq;
CREATE SEQUENCE oc_directlink_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_directlink" (
    "id" bigint DEFAULT nextval('oc_directlink_id_seq') NOT NULL,
    "user_id" character varying(64),
    "file_id" bigint NOT NULL,
    "token" character varying(60),
    "expiration" bigint NOT NULL,
    CONSTRAINT "oc_directlink_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "directlink_expiration_idx" ON "public"."oc_directlink" USING btree ("expiration");

CREATE INDEX "directlink_token_idx" ON "public"."oc_directlink" USING btree ("token");


DROP TABLE IF EXISTS "oc_federated_reshares";
CREATE TABLE "public"."oc_federated_reshares" (
    "share_id" integer NOT NULL,
    "remote_id" integer NOT NULL,
    CONSTRAINT "share_id_index" UNIQUE ("share_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "oc_file_locks";
DROP SEQUENCE IF EXISTS oc_file_locks_id_seq;
CREATE SEQUENCE oc_file_locks_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_file_locks" (
    "id" bigint DEFAULT nextval('oc_file_locks_id_seq') NOT NULL,
    "lock" integer DEFAULT '0' NOT NULL,
    "key" character varying(64) NOT NULL,
    "ttl" integer DEFAULT '-1' NOT NULL,
    CONSTRAINT "lock_key_index" UNIQUE ("key"),
    CONSTRAINT "oc_file_locks_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "lock_ttl_index" ON "public"."oc_file_locks" USING btree ("ttl");

INSERT INTO "oc_file_locks" ("id", "lock", "key", "ttl") VALUES
(87,	0,	'files/d0bed9054788a023babb5e467fe1ac3e',	1605286186),
(70,	0,	'files/d3176c235c068a12b483efeaa3f72de7',	1605286368),
(171,	0,	'files/eeaaf6b34294574686145e43d74e3482',	1605286368),
(191,	0,	'files/1e83ac551fbb32ce545dfe70a4a2e091',	1605286372),
(50,	0,	'files/5b29dd2e50695392d47daa4bc6441ce9',	1605286368),
(159,	0,	'files/62bb21bf7a8f1a0b9ece5129a41fdcb7',	1605286367),
(158,	0,	'files/2538107ce54aa6eabf33fa422ed3b54f',	1605286367),
(29,	0,	'files/3513aba8aa4305d3ad33fc7122d4af30',	1605286368),
(35,	0,	'files/2c7eaecb9090bd89cef1dcd4d0d5881a',	1605286368),
(155,	0,	'files/d9712b9716cc3bf1291505ee6348f1c3',	1605286368),
(64,	0,	'files/a9e2da4731b556626698d922a24cb8cb',	1605286368),
(163,	0,	'files/33ce480e41b26a1a6c5008e100f1dcef',	1605286368),
(89,	0,	'files/f3a89185a69a80b1de93894bd56a85ba',	1605286186),
(20,	0,	'files/444a6793b217a2bd2eb3bb76d83a301d',	1605286187),
(162,	0,	'files/3bf81792d8ce10562404153add132f75',	1605286368),
(107,	0,	'files/86ec77b5485bc2afbca0ccc98fb718ee',	1605286186),
(192,	0,	'files/9e568da86aa6c95e29fa6c5e3f9afe73',	1605286372),
(167,	0,	'files/4f50e8aa73e20f7403e0974807ee6a59',	1605286368),
(120,	0,	'files/7c33e8fb1d62e38ec2d02bf0400a4701',	1605286186),
(193,	0,	'files/0896feac6c9dd28e3a189ec0701be6a4',	1605286372),
(109,	0,	'files/0d13536ed542f8fe4d76441e1a465aed',	1605286186),
(111,	0,	'files/0af29ec69ec0c307d81f86a68b5560f5',	1605286186),
(178,	0,	'files/9efaf5104f6c205c26b3b87733913744',	1605286372),
(122,	0,	'files/168e19b324f447c198040d8c93c7efc3',	1605286186),
(179,	0,	'files/f776dfa0ed12154a1aa80909e7355fde',	1605286372),
(180,	0,	'files/7cfc3ad87840b295c9c5950161e231df',	1605286372),
(134,	0,	'files/a47091bb8a4de77aa8e9f65bc74e573f',	1605286187),
(181,	0,	'files/19c1b57d7f9270bb4c7aefa31cefa2f6',	1605286372),
(136,	0,	'files/e9a1e77903124cbcd7ea178385ba0f62',	1605286187),
(139,	0,	'files/88f546638ed724aed6457b8f3fa1b205',	1605286187),
(141,	0,	'files/1771e235c097f498359986c2989d862c',	1605286187),
(143,	0,	'files/3c46155831e83b04ebd681c4e7b505e1',	1605286187),
(145,	0,	'files/a0f3ebe088c66a2850b283d9b8e4da20',	1605286187),
(147,	0,	'files/6c50b3d838e235009daf46de6145582e',	1605286187),
(149,	0,	'files/1ebb36b576b7541546421dfc1033e559',	1605286187),
(25,	0,	'files/84fc6d08ed3bd071bcdab33a99d2d7d9',	1605285868),
(182,	0,	'files/f693bdbdf10a3d0d0a81352b4892b2d4',	1605286372),
(183,	0,	'files/a033f73d141d66a6218f54ce0db92fd3',	1605286372),
(31,	0,	'files/83f44a83c313ebf8afb1ece18b387c24',	1605285868),
(130,	0,	'files/67a5cb8b5e2a2c082b4851a68fe10a50',	1605286187),
(41,	0,	'files/bb0af1bc6137552e17d084d074157d05',	1605285883),
(42,	0,	'files/8e66b291f692a243d506f69b48e3e52e',	1605285883),
(91,	0,	'files/8785c5f6151fc362866409fb82fa5220',	1605286186),
(194,	0,	'files/d66468d2d3790f2a9bc0d72f75e2d00b',	1605286372),
(195,	0,	'files/f80be14a27bd0c975b68c87297c75a82',	1605286372),
(196,	0,	'files/261fc620f5c18da925a9d44b1e55e182',	1605286372),
(197,	0,	'files/2d003745ce0083b9d9b96523db58803b',	1605286372),
(205,	0,	'files/f1e1f97a8bb7ad1904edb5cbf9f76fb7',	1605286372),
(206,	0,	'files/0a2a5e1ca4174890a81400ee46f649b7',	1605286372),
(207,	0,	'files/c3c5eb1fde8d67aebf8af4f325c35960',	1605286372),
(208,	0,	'files/cca766b279c64cf1ac2e2460194e7b3d',	1605286372),
(209,	0,	'files/df01127a7dae3203c3e235b899c7e373',	1605286372),
(94,	0,	'files/873776d469540b9d9e5de6b312bbb493',	1605286186),
(210,	0,	'files/e63adc6e980b3855142660385f22c7f6',	1605286372),
(62,	0,	'files/fa55e208b04cf14d841aa742bdf0ed79',	1605285903),
(63,	0,	'files/6dd9c1897c77fffc70b01243cc85e635',	1605285903),
(218,	0,	'files/df7c774f57255b9ad8b3e47d94bc2e5d',	1605286395),
(151,	0,	'files/055f6269bd33dda7224f219738d50813',	1605286187),
(96,	0,	'files/e8ce51dea09b546bd40cdc555c0f4ef8',	1605286186),
(76,	0,	'files/1c19d64cbe84521af23dc7ee6d7f4ce0',	1605286186),
(219,	0,	'files/5bdf60a171e6c2f1f7f619f9099bfd3a',	1605286395),
(79,	0,	'files/c74cdf7ebf577a52763d259c6f7789b5',	1605286186),
(220,	0,	'files/f14dd02d71474a9c6dfad1c36b0f0c1b',	1605286395),
(81,	0,	'files/2f831b8fe1a0c3906b1df102d1e42e90',	1605286186),
(221,	0,	'files/9a76104046c87c41aff9b71111d6e7e6',	1605286395),
(83,	0,	'files/dc3f144f6501632d39810bd971603009',	1605286186),
(222,	0,	'files/f315c2c4f4e81bc7ecc680c0077e7e4e',	1605286395),
(85,	0,	'files/6a6991677a3c012d0184fbb235a5c2e7',	1605286186),
(28,	0,	'files/b6ef755cfc70b5eb94f5d3aad8ba833d',	1605286395),
(98,	0,	'files/c733dc1ff8158b351234e2c83025d786',	1605286186),
(223,	0,	'files/1fe019b23cac7b96fd104930e056dbb7',	1605286395),
(100,	0,	'files/3390c547a1e4f3542d9be04c05b73359',	1605286186),
(224,	0,	'files/2f4b185b435a6f1e9a7625201684f61c',	1605286395),
(102,	0,	'files/f6bfc668ad3311721fe8aa7ccd2ad8aa',	1605286186),
(104,	0,	'files/324568cfeff4ac4b2eabe115adf0c5a5',	1605286186),
(113,	0,	'files/b4c03b906763bbd0ca777a3127027edd',	1605286186),
(115,	0,	'files/2b3a137d902c5be2ec7377c90ff702a3',	1605286186),
(118,	0,	'files/0eb379863ccccaba017ebc20b3d5e0b7',	1605286186),
(124,	0,	'files/8585afd0898f4bf581f2ac103b5b72c0',	1605286187),
(132,	0,	'files/0d07a2aa7ad59430d0ecaee3cec6e4f2',	1605286187),
(49,	0,	'files/08a5cfaf6aa875b9d5d991b83605144c',	1605286186),
(33,	0,	'files/c69679fe5da7e47255da6493f3d1aae6',	1605286186),
(18,	0,	'files/cd5205158666680415a1dd4f5596727b',	1605286186),
(11,	0,	'files/0f956b129055e8efbeb8a039634ea460',	1605286186),
(19,	0,	'files/9175776808b80c8eb5185495cd294219',	1605286186),
(21,	0,	'files/996653a44308a3353144571e3b277e48',	1605286186),
(23,	0,	'files/3651a9b1e19d1bedec841611bfc523f5',	1605286186),
(13,	0,	'files/d8d75dc9ce9524891aba62a0a59a09db',	1605286187),
(17,	0,	'files/b1ee214d512726f2aad3b9d67d5ee23d',	1605286187),
(2,	0,	'files/89c94b219474c26b74bf951800c4efb4',	1605286187),
(93,	0,	'files/8b9eea7d15e4cda3a77e026dff51a8e6',	1605286186),
(36,	0,	'files/43009c0c3c23ae80ba3498ddf17cc95f',	1605286186),
(37,	0,	'files/6c0717d96fea2121ea2685b45372a093',	1605286186),
(38,	0,	'files/14ac9b107376a4d5ab55e0d72974721e',	1605286186),
(43,	0,	'files/8ee05a37644dc65c3ee1ab3d519a8235',	1605286186),
(78,	0,	'files/ddbe91771624b95caba617a1edc5af32',	1605286186),
(44,	0,	'files/78cee12a06912545dd141b26bde0c3c2',	1605286186),
(45,	0,	'files/cbb578f60ecd9f9851ae5fe06b3705ef',	1605286186),
(46,	0,	'files/850fee7c0e9d0fa9f8e4389f41248416',	1605286186),
(47,	0,	'files/287d77fd715eacc6ca5a28d512f482f5',	1605286186),
(48,	0,	'files/e9e99ae4fcded6a199e771480d5299bc',	1605286186),
(39,	0,	'files/47d8c44dda697227aca54f04432692ab',	1605286186),
(40,	0,	'files/169e15376b3a290a5f8a4893eb61cc47',	1605286186),
(14,	0,	'files/f6babdca16915cc70237db69e643f0bd',	1605286186),
(106,	0,	'files/cfe8e79a53b79c963b1b551b0e41b4ce',	1605286186),
(16,	0,	'files/4b5e777c0454dbe9325e811f617b25aa',	1605286186),
(9,	0,	'files/0f0b743d63290986df349cc0bcf3e9f0',	1605286186),
(117,	0,	'files/4d68869045bc5b797e096fcbb3b9dcad',	1605286186),
(10,	0,	'files/4e1c0071c6aab7581742601f4950a89e',	1605286186),
(12,	0,	'files/34506775013bf67d2bc138a4f48d166d',	1605286187),
(22,	0,	'files/0d7549db096b31dc35a00b135a50dfcb',	1605286187),
(128,	0,	'files/65bdb2e5e70f1346541d3c3207575426',	1605286187),
(129,	0,	'files/06bde6df5742f081d89eb3c6437e33e3',	1605286187),
(15,	0,	'files/b77b281b24fac0ccce66f07b0762ff4f',	1605286187),
(138,	0,	'files/7d338ddc450f1c81b5378bcb6706463e',	1605286187),
(3,	0,	'files/d1e3eb3d4722f2b84b364080196c8676',	1605286187),
(4,	0,	'files/8cf54fcf08cf350db5e35db7fa21b9db',	1605286187),
(5,	0,	'files/07fd3df11cd20746dbf55a118c34f74e',	1605286187),
(6,	0,	'files/16f1c01ea428c9b049a35a1c280901e7',	1605286187),
(7,	0,	'files/bc194a56b6c48d95c45a0151991cffdf',	1605286187),
(8,	0,	'files/0bea9ce0802409107dd4f384f7fcc1a5',	1605286187),
(153,	0,	'files/1650b2a7bd7090c8ec8f46c6aaa72314',	1605286187),
(157,	0,	'files/50cd5d3f44db82c91647352e6a9d7084',	1605286367),
(161,	0,	'files/59016f79ad891a89f500d86be45aa1ec',	1605286368),
(198,	0,	'files/4ec7d720b6423ff93701b6f33b7a801c',	1605286372),
(165,	0,	'files/8655f928d8bd0458f151e24a0d75c484',	1605286368),
(199,	0,	'files/58861b76f565c6a784cc68fc58e86e7c',	1605286372),
(200,	0,	'files/36c051ce3241e6e3927bfe69dddd2d57',	1605286372),
(164,	0,	'files/ffa8b01491fafe4496ddf6fc6eaaa8dc',	1605286368),
(169,	0,	'files/d0e66468f07ea5c483f8c074993040ae',	1605286368),
(201,	0,	'files/e61c3f2f8bd271486b57d2b2229d9bea',	1605286372),
(168,	0,	'files/26592869621775b437da2223f81b57ec',	1605286368),
(172,	0,	'files/db41e26a8fa03d758a4c49057d0f3041',	1605286371),
(173,	0,	'files/f0ee16a1cae450236d576c5c2173891a',	1605286371),
(174,	0,	'files/4fad832f6d653e08328d4bd0eaa244c0',	1605286371),
(175,	0,	'files/3035742012c2c58f3aa574c7c7adbe9a',	1605286372),
(176,	0,	'files/603cffac7988ad8af3a02f2632350c93',	1605286372),
(177,	0,	'files/927acc612267ca1131603ebe48cdbceb',	1605286372),
(184,	0,	'files/0ef6ed0bde32719ecaaf667779ce307a',	1605286372),
(185,	0,	'files/8526d3c5a1f837618b0617785d62c220',	1605286372),
(186,	0,	'files/b0331d30d5d631a04b9e7f0340e09d71',	1605286372),
(187,	0,	'files/4de0b31860918415ea2e43b278f2cb68',	1605286372),
(188,	0,	'files/ee3429ebb6afc429652cf7d056451095',	1605286372),
(189,	0,	'files/8aba89187a778a1d1058363a239daa07',	1605286372),
(190,	0,	'files/a5c53bcb3df3dd68d8aa783d2374abf4',	1605286372),
(202,	0,	'files/215598011f6c12d3707746939d9427d8',	1605286372),
(203,	0,	'files/e390170bee702bd732df1328a65ee5f9',	1605286372),
(204,	0,	'files/64e607c674d4b7046e580de2b12a8462',	1605286372),
(212,	0,	'files/72821ce1cba6b09a91ae020b9cbf15f3',	1605286395),
(213,	0,	'files/aef894266018a34f48c5bfd4a5c1de5a',	1605286395),
(214,	0,	'files/992d299d65c32f6c9045148c430ef1b9',	1605286395),
(1,	0,	'files/38d3fc13a505a341da34815c5ccc8b3d',	1605286395),
(229,	0,	'files/f40a4c2472536205281e478faa9304c7',	1605286412),
(211,	0,	'files/6b2de085d9b53fa93fa74433933ff37f',	1605286413);

DROP TABLE IF EXISTS "oc_filecache";
DROP SEQUENCE IF EXISTS oc_filecache_fileid_seq;
CREATE SEQUENCE oc_filecache_fileid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_filecache" (
    "fileid" bigint DEFAULT nextval('oc_filecache_fileid_seq') NOT NULL,
    "storage" bigint DEFAULT '0' NOT NULL,
    "path" character varying(4000),
    "path_hash" character varying(32) DEFAULT '' NOT NULL,
    "parent" bigint DEFAULT '0' NOT NULL,
    "name" character varying(250),
    "mimetype" bigint DEFAULT '0' NOT NULL,
    "mimepart" bigint DEFAULT '0' NOT NULL,
    "size" bigint DEFAULT '0' NOT NULL,
    "mtime" bigint DEFAULT '0' NOT NULL,
    "storage_mtime" bigint DEFAULT '0' NOT NULL,
    "encrypted" integer DEFAULT '0' NOT NULL,
    "unencrypted_size" bigint DEFAULT '0' NOT NULL,
    "etag" character varying(40),
    "permissions" integer DEFAULT '0',
    "checksum" character varying(255),
    CONSTRAINT "fs_storage_path_hash" UNIQUE ("storage", "path_hash"),
    CONSTRAINT "oc_filecache_pkey" PRIMARY KEY ("fileid")
) WITH (oids = false);

CREATE INDEX "fs_mtime" ON "public"."oc_filecache" USING btree ("mtime");

CREATE INDEX "fs_parent_name_hash" ON "public"."oc_filecache" USING btree ("parent", "name");

CREATE INDEX "fs_storage_mimepart" ON "public"."oc_filecache" USING btree ("storage", "mimepart");

CREATE INDEX "fs_storage_mimetype" ON "public"."oc_filecache" USING btree ("storage", "mimetype");

CREATE INDEX "fs_storage_size" ON "public"."oc_filecache" USING btree ("storage", "size", "fileid");

INSERT INTO "oc_filecache" ("fileid", "storage", "path", "path_hash", "parent", "name", "mimetype", "mimepart", "size", "mtime", "storage_mtime", "encrypted", "unencrypted_size", "etag", "permissions", "checksum") VALUES
(26,	2,	'appdata_ocypoqphtg36/js',	'3bc6232949e8e15a8256a47ad23bee45',	23,	'js',	2,	1,	0,	1605282283,	1605282283,	0,	0,	'5faea9cd61972',	31,	''),
(248,	1,	'files_trashbin/files',	'3014a771cbe30761f2e9ff3272110dbf',	247,	'files',	2,	1,	0,	1605282818,	1605282818,	0,	0,	'5faeac02f2d9a',	31,	''),
(247,	1,	'files_trashbin',	'fb66dca5f27af6f15c1d1d81e6f8d28b',	1,	'files_trashbin',	2,	1,	0,	1605282818,	1605282818,	0,	0,	'5faeac03036a9',	31,	''),
(31,	2,	'appdata_ocypoqphtg36/css',	'266224a181242ee882ab7f686e1c5b3a',	23,	'css',	2,	1,	0,	1605282581,	1605282581,	0,	0,	'5faea9cdd2582',	31,	''),
(23,	2,	'appdata_ocypoqphtg36',	'69ce4d4de1263b87c78c0630a699fe41',	22,	'appdata_ocypoqphtg36',	2,	1,	239426,	1605282308,	1605282308,	0,	0,	'5faea8036288c',	31,	''),
(22,	2,	'',	'd41d8cd98f00b204e9800998ecf8427e',	-1,	'',	2,	1,	239426,	1605281795,	1605281795,	0,	0,	'5faea80363fa5',	23,	''),
(2,	1,	'files',	'45b963397aa40d4a0063e0d85e4fe7a1',	1,	'files',	2,	1,	0,	1605282813,	1605282813,	0,	0,	'5faeabfd07a9c',	31,	''),
(25,	2,	'appdata_ocypoqphtg36/text/documents',	'16df0d736b80e491f1977f69cbb1fd0b',	24,	'documents',	2,	1,	0,	1605282805,	1605282805,	0,	0,	'5faea8036ff59',	31,	''),
(24,	2,	'appdata_ocypoqphtg36/text',	'dfdbc4008aca42d4b6311e0ecd957481',	23,	'text',	2,	1,	0,	1605281795,	1605281795,	0,	0,	'5faea8036b972',	31,	''),
(27,	2,	'appdata_ocypoqphtg36/js/core',	'a0e2a6bfc7a4ab1f411910cf28136ddb',	26,	'core',	2,	1,	0,	1605282253,	1605282253,	0,	0,	'5faea9cd6e428',	31,	''),
(28,	2,	'appdata_ocypoqphtg36/js/core/merged-template-prepend.js',	'69b35b4f08247811131fda2fdccb2465',	27,	'merged-template-prepend.js',	13,	3,	11396,	1605282253,	1605282253,	0,	0,	'c64c1d3eb4d17529c732f19d9c7ce217',	27,	''),
(29,	2,	'appdata_ocypoqphtg36/js/core/merged-template-prepend.js.deps',	'd14017528f67d8a39108f94196367e74',	27,	'merged-template-prepend.js.deps',	14,	3,	246,	1605282253,	1605282253,	0,	0,	'517d798bb67ab9080d7f6d41f5c3f2c1',	27,	''),
(30,	2,	'appdata_ocypoqphtg36/js/core/merged-template-prepend.js.gzip',	'fb86d9978b5938428a80291af82d73e8',	27,	'merged-template-prepend.js.gzip',	15,	3,	2982,	1605282253,	1605282253,	0,	0,	'5a318ad4fbc049cb0bf3b3659045e969',	27,	''),
(34,	2,	'appdata_ocypoqphtg36/css/theming/39b9-e71a-theming.css',	'463d948dffc7700b110ae521cd840c1d',	33,	'39b9-e71a-theming.css',	16,	8,	1275,	1605282254,	1605282254,	0,	0,	'225169734382784a9808a46063e8d30b',	27,	''),
(32,	2,	'appdata_ocypoqphtg36/css/icons',	'2a790ef55716c6c9a4cf1ff24007576e',	31,	'icons',	2,	1,	0,	1605282265,	1605282265,	0,	0,	'5faea9cdd81af',	31,	''),
(35,	2,	'appdata_ocypoqphtg36/css/theming/39b9-e71a-theming.css.deps',	'f94703fb705c149903d674e2cdae8c10',	33,	'39b9-e71a-theming.css.deps',	14,	3,	179,	1605282254,	1605282254,	0,	0,	'08bd95ede067b2c5ab7b0dfab30dc710',	27,	''),
(36,	2,	'appdata_ocypoqphtg36/css/theming/39b9-e71a-theming.css.gzip',	'd62d86c38af28e6f756b35e713ce6eec',	33,	'39b9-e71a-theming.css.gzip',	15,	3,	468,	1605282254,	1605282254,	0,	0,	'bc42a952f2a507f8d3e90699e22a01f2',	27,	''),
(125,	2,	'appdata_ocypoqphtg36/js/files',	'aca63b1c6f1b8550d962688267d95c80',	26,	'files',	2,	1,	0,	1605282283,	1605282283,	0,	0,	'5faea9eba4473',	31,	''),
(37,	1,	'cache',	'0fea6a13c52b4d4725368f24b045ca84',	1,	'cache',	2,	1,	0,	1605282263,	1605282263,	0,	0,	'5faea9d721793',	31,	''),
(38,	2,	'appdata_ocypoqphtg36/dashboard',	'35c7564f0dc21ff961230a5eecaf73ff',	23,	'dashboard',	2,	1,	0,	1605282263,	1605282263,	0,	0,	'5faea9d77cf07',	31,	''),
(39,	2,	'appdata_ocypoqphtg36/dashboard/admin',	'2db6d1c3fbb27027a30bacb63af8ff22',	38,	'admin',	2,	1,	0,	1605282263,	1605282263,	0,	0,	'5faea9d783066',	31,	''),
(33,	2,	'appdata_ocypoqphtg36/css/theming',	'610ce8cbbb19ee3e3a85955f7caa2b45',	31,	'theming',	2,	1,	0,	1605282516,	1605282516,	0,	0,	'5faea9cdedcd5',	31,	''),
(40,	2,	'appdata_ocypoqphtg36/avatar',	'92077cc9e15a1f8b9dbeead8ca760828',	23,	'avatar',	2,	1,	0,	1605282263,	1605282263,	0,	0,	'5faea9d7b02fe',	31,	''),
(41,	2,	'appdata_ocypoqphtg36/avatar/admin',	'a269376a6d9dd99691c3d00d2608a92c',	40,	'admin',	2,	1,	0,	1605282577,	1605282577,	0,	0,	'5faea9d7b51e9',	31,	''),
(42,	2,	'appdata_ocypoqphtg36/js/activity',	'66db8ef5eb694433fd542a4b27101161',	26,	'activity',	2,	1,	0,	1605282263,	1605282263,	0,	0,	'5faea9d7c0700',	31,	''),
(43,	2,	'appdata_ocypoqphtg36/js/activity/activity-sidebar.js',	'2999a004b3b373b81d6ee24c4b2af414',	42,	'activity-sidebar.js',	13,	3,	39092,	1605282263,	1605282263,	0,	0,	'd71a08834899bb1768bd04ffd59aa208',	27,	''),
(44,	2,	'appdata_ocypoqphtg36/js/activity/activity-sidebar.js.deps',	'3c0dbb0cb27360ff8a8ca8d88cbdcd56',	42,	'activity-sidebar.js.deps',	14,	3,	492,	1605282263,	1605282263,	0,	0,	'9530997cd6df09e437494c71b670f890',	27,	''),
(45,	2,	'appdata_ocypoqphtg36/js/activity/activity-sidebar.js.gzip',	'395406673f12521234971f4c2f64fce3',	42,	'activity-sidebar.js.gzip',	15,	3,	5776,	1605282263,	1605282263,	0,	0,	'6e593598916409c448ae90116115719e',	27,	''),
(49,	2,	'appdata_ocypoqphtg36/css/core/458e-e71a-server.css',	'4cab7aefed9a116e99cbf06bd778fe4d',	46,	'458e-e71a-server.css',	16,	8,	137147,	1605282265,	1605282265,	0,	0,	'd62b2872e273ef39908d7a54549dd7d4',	27,	''),
(46,	2,	'appdata_ocypoqphtg36/css/core',	'839076ade4630d3c5f05bdec23134831',	31,	'core',	2,	1,	0,	1605282265,	1605282265,	0,	0,	'5faea9d7df95a',	31,	''),
(50,	2,	'appdata_ocypoqphtg36/css/core/458e-e71a-server.css.deps',	'2f48a23c1cf4478acdec8ee5c14bfdce',	46,	'458e-e71a-server.css.deps',	14,	3,	759,	1605282265,	1605282265,	0,	0,	'96467d1e899162ad4af80c97901268a2',	27,	''),
(51,	2,	'appdata_ocypoqphtg36/css/core/458e-e71a-server.css.gzip',	'cca7e939745f95987e6f9b11e12d7df3',	46,	'458e-e71a-server.css.gzip',	15,	3,	19536,	1605282265,	1605282265,	0,	0,	'd552cb054da8f5ce7312735a6f5b5c03',	27,	''),
(52,	2,	'appdata_ocypoqphtg36/css/core/458e-e71a-css-variables.css',	'02ec99031e13231f1b766b39b6ecf5d3',	46,	'458e-e71a-css-variables.css',	16,	8,	1334,	1605282265,	1605282265,	0,	0,	'5934379b58a86e844d63e1a0f3980561',	27,	''),
(53,	2,	'appdata_ocypoqphtg36/css/core/458e-e71a-css-variables.css.deps',	'7cd471fe6058c326a7f04bb149118a39',	46,	'458e-e71a-css-variables.css.deps',	14,	3,	176,	1605282265,	1605282265,	0,	0,	'4b70c0a98d707a8e5eb925aac46cc563',	27,	''),
(54,	2,	'appdata_ocypoqphtg36/css/core/458e-e71a-css-variables.css.gzip',	'bde9598e4af823491b762abc3a48cb84',	46,	'458e-e71a-css-variables.css.gzip',	15,	3,	558,	1605282265,	1605282265,	0,	0,	'576b20212a8cb69fe2ed09e54ed19645',	27,	''),
(55,	2,	'appdata_ocypoqphtg36/css/notifications',	'8d02072e88382f9d555a35f912f00113',	31,	'notifications',	2,	1,	0,	1605282265,	1605282265,	0,	0,	'5faea9d981a0c',	31,	''),
(56,	2,	'appdata_ocypoqphtg36/css/notifications/0577-e71a-styles.css',	'af0e1b5644292ae4093d2990733b607a',	55,	'0577-e71a-styles.css',	16,	8,	3455,	1605282265,	1605282265,	0,	0,	'0cef628f2c7c62fb539284bb430be285',	27,	''),
(57,	2,	'appdata_ocypoqphtg36/css/notifications/0577-e71a-styles.css.deps',	'82bd893c9ed4db5773338d1caa6285c2',	55,	'0577-e71a-styles.css.deps',	14,	3,	184,	1605282265,	1605282265,	0,	0,	'a015cd284da82d0ec8da9285ed156ea9',	27,	''),
(58,	2,	'appdata_ocypoqphtg36/css/notifications/0577-e71a-styles.css.gzip',	'cab8cb27bf2deeacd391383f9258dfcd',	55,	'0577-e71a-styles.css.gzip',	15,	3,	846,	1605282265,	1605282265,	0,	0,	'8c701cb9b87aa263c283fedced59eb2f',	27,	''),
(59,	2,	'appdata_ocypoqphtg36/css/dashboard',	'4c88ad02ca1a1052965cc6b420984e2f',	31,	'dashboard',	2,	1,	0,	1605282265,	1605282265,	0,	0,	'5faea9d9a5525',	31,	''),
(60,	2,	'appdata_ocypoqphtg36/css/dashboard/d149-e71a-dashboard.css',	'aa94727d72b1b176d72e1712916836d2',	59,	'd149-e71a-dashboard.css',	16,	8,	2062,	1605282265,	1605282265,	0,	0,	'0c582ca69ffb996e5eaf60bd0c706a90',	27,	''),
(61,	2,	'appdata_ocypoqphtg36/css/dashboard/d149-e71a-dashboard.css.deps',	'68c22b0352a677408dd3ec4ed14408e1',	59,	'd149-e71a-dashboard.css.deps',	14,	3,	183,	1605282265,	1605282265,	0,	0,	'c3bd6be3f0a06fd3a9b07031b9690b2f',	27,	''),
(62,	2,	'appdata_ocypoqphtg36/css/dashboard/d149-e71a-dashboard.css.gzip',	'0798a1f681a24589de0a0137822c58a1',	59,	'd149-e71a-dashboard.css.gzip',	15,	3,	602,	1605282265,	1605282265,	0,	0,	'ba64c40f012d03fc77726d3b8b8dd24a',	27,	''),
(63,	2,	'appdata_ocypoqphtg36/css/activity',	'86d2236744d7f6191714f9feea0f8199',	31,	'activity',	2,	1,	0,	1605282265,	1605282265,	0,	0,	'5faea9d9c2c9a',	31,	''),
(64,	2,	'appdata_ocypoqphtg36/css/activity/c4f1-e71a-style.css',	'87332539207731164a4a301af4beaaf9',	63,	'c4f1-e71a-style.css',	16,	8,	3463,	1605282265,	1605282265,	0,	0,	'94c462d3b3d618e6ecff8e28b9484ec0',	27,	''),
(65,	2,	'appdata_ocypoqphtg36/css/activity/c4f1-e71a-style.css.deps',	'1c76b8734e1fc28a1be59bfdb610c899',	63,	'c4f1-e71a-style.css.deps',	14,	3,	178,	1605282265,	1605282265,	0,	0,	'c7fa5783aad7aa7dd45922a01e6197c6',	27,	''),
(66,	2,	'appdata_ocypoqphtg36/css/activity/c4f1-e71a-style.css.gzip',	'd9c83fdcca5438b6abecb2afc6bbbdca',	63,	'c4f1-e71a-style.css.gzip',	15,	3,	1108,	1605282265,	1605282265,	0,	0,	'cadbdc0e4218932915f063d91abb168c',	27,	''),
(68,	2,	'appdata_ocypoqphtg36/css/text/232d-e71a-icons.css',	'443e321ced30671add5a403d8e9e2a61',	67,	'232d-e71a-icons.css',	16,	8,	2710,	1605282266,	1605282266,	0,	0,	'1db0cff02aa7427479a8080c1db4aa93',	27,	''),
(67,	2,	'appdata_ocypoqphtg36/css/text',	'486694897afa79f82bbe2b28d89e0838',	31,	'text',	2,	1,	0,	1605282266,	1605282266,	0,	0,	'5faea9d9e78cb',	31,	''),
(69,	2,	'appdata_ocypoqphtg36/css/text/232d-e71a-icons.css.deps',	'9534af1a5db56df5b67ef3a275171287',	67,	'232d-e71a-icons.css.deps',	14,	3,	174,	1605282266,	1605282266,	0,	0,	'02377bfaf86e59b72aa231c6c6940a4b',	27,	''),
(70,	2,	'appdata_ocypoqphtg36/css/text/232d-e71a-icons.css.gzip',	'284c700cdfb0b2ac5bbf66fe411ae0e3',	67,	'232d-e71a-icons.css.gzip',	15,	3,	417,	1605282266,	1605282266,	0,	0,	'd836fad3f5621d48c4501fd7f2838d7c',	27,	''),
(76,	2,	'appdata_ocypoqphtg36/theming/0',	'06342bdac58d67acbd805904c20c971f',	75,	'0',	2,	1,	0,	1605282318,	1605282318,	0,	0,	'5faea9dc622ad',	31,	''),
(71,	2,	'appdata_ocypoqphtg36/css/user_status',	'229d6140617ce858597a4dccbe4bb089',	31,	'user_status',	2,	1,	0,	1605282266,	1605282266,	0,	0,	'5faea9da18336',	31,	''),
(72,	2,	'appdata_ocypoqphtg36/css/user_status/47cd-e71a-user-status-menu.css',	'811fbd48758265ac4387566321eb1852',	71,	'47cd-e71a-user-status-menu.css',	16,	8,	1039,	1605282266,	1605282266,	0,	0,	'235b2cd74fd6f5c9466c47a9ff2a92d4',	27,	''),
(73,	2,	'appdata_ocypoqphtg36/css/user_status/47cd-e71a-user-status-menu.css.deps',	'91505b52e281108e52b1780f8da71acc',	71,	'47cd-e71a-user-status-menu.css.deps',	14,	3,	192,	1605282266,	1605282266,	0,	0,	'ae7d4eaf9d889da34b5b969c8a617056',	27,	''),
(74,	2,	'appdata_ocypoqphtg36/css/user_status/47cd-e71a-user-status-menu.css.gzip',	'580be194316e5cc6798ab8e68ebddd67',	71,	'47cd-e71a-user-status-menu.css.gzip',	15,	3,	240,	1605282266,	1605282266,	0,	0,	'7be217ee2757a052b4555a1da9e834f0',	27,	''),
(97,	2,	'appdata_ocypoqphtg36/preview/c/5/1/c/e/4',	'8613ef8f35bd64e263c59bdc6b4e0e06',	95,	'4',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcb630b',	31,	''),
(75,	2,	'appdata_ocypoqphtg36/theming',	'8c5ea0d5b005ab72f296dbde919a9bb5',	23,	'theming',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dc5c746',	31,	''),
(95,	2,	'appdata_ocypoqphtg36/preview/c/5/1/c/e',	'd87359f8a7eb1b77d9ab78f17a6b8011',	93,	'e',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcb8234',	31,	''),
(77,	2,	'appdata_ocypoqphtg36/theming/0/icon-core-filetypes_text.svg',	'9f33e5340b79402266d451e8c1a82f50',	76,	'icon-core-filetypes_text.svg',	17,	5,	295,	1605282268,	1605282268,	0,	0,	'6bfc5413b14b92dd22d36075bacc5474',	27,	''),
(78,	2,	'appdata_ocypoqphtg36/theming/0/icon-core-filetypes_video.svg',	'4036e527a0e442be07d21062d492ffaa',	76,	'icon-core-filetypes_video.svg',	17,	5,	277,	1605282268,	1605282268,	0,	0,	'aab7be4f029293c86be6e607de86ec1f',	27,	''),
(94,	2,	'appdata_ocypoqphtg36/preview/9/8',	'0323ba63be042496795177bd7b178206',	92,	'8',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcca1ee',	31,	''),
(80,	2,	'appdata_ocypoqphtg36/theming/0/icon-core-filetypes_image.svg',	'bb2621290093c5ec5a95fe382f5e7681',	76,	'icon-core-filetypes_image.svg',	17,	5,	352,	1605282268,	1605282268,	0,	0,	'5e4134d1d06c47b56e62f6f849c38480',	27,	''),
(93,	2,	'appdata_ocypoqphtg36/preview/c/5/1/c',	'6e888994ae66604e1a3dc11c4c1098bc',	91,	'c',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcba8ed',	31,	''),
(91,	2,	'appdata_ocypoqphtg36/preview/c/5/1',	'61e3f0b67ebcae09825ef29b7b526c2d',	90,	'1',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcc04de',	31,	''),
(90,	2,	'appdata_ocypoqphtg36/preview/c/5',	'4222e7274ca0333efbe3420a0fb673ee',	88,	'5',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcc2ae1',	31,	''),
(88,	2,	'appdata_ocypoqphtg36/preview/c',	'b54367bd4a9a4a616a4a25ceca5775ca',	79,	'c',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcc3b0f',	31,	''),
(87,	2,	'appdata_ocypoqphtg36/preview/1/f/0/e/3/d/a',	'6f5187bed6aa33e64c933022f9e36c6c',	86,	'a',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dca1d37',	31,	''),
(117,	2,	'appdata_ocypoqphtg36/preview/1/f/0/e/3/d/a/19/4096-4096-max.png',	'0c87e1a9eb4cda13b79c7d3a9632eab6',	89,	'4096-4096-max.png',	6,	5,	33394,	1605282269,	1605282269,	0,	0,	'4a5f5d26ef949cf7065456ea6eddde20',	27,	''),
(120,	2,	'appdata_ocypoqphtg36/preview/9/4096-4096-max.png',	'aa155eee812b70a7430ac1c5304d018a',	92,	'4096-4096-max.png',	6,	5,	234803,	1605282269,	1605282269,	0,	0,	'd4266f2be7d4d17ace57fa96b48c3d23',	27,	''),
(86,	2,	'appdata_ocypoqphtg36/preview/1/f/0/e/3/d',	'8059a5a36ef3f456897f8ea8eb495135',	85,	'd',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dca5a3e',	31,	''),
(85,	2,	'appdata_ocypoqphtg36/preview/1/f/0/e/3',	'854f9a50450db74ab3504f3ed02ae024',	84,	'3',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dca823e',	31,	''),
(84,	2,	'appdata_ocypoqphtg36/preview/1/f/0/e',	'64b35280888ce0c4a931b86c8c0eabc5',	83,	'e',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcab372',	31,	''),
(83,	2,	'appdata_ocypoqphtg36/preview/1/f/0',	'641e2757bc93678266f4362806472b1e',	82,	'0',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcade25',	31,	''),
(82,	2,	'appdata_ocypoqphtg36/preview/1/f',	'618e8bff5f0e94dd27598bc6402d662b',	81,	'f',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcaf4c3',	31,	''),
(81,	2,	'appdata_ocypoqphtg36/preview/1',	'59c222ffde623b8c3ff05ff69cf32669',	79,	'1',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcb0563',	31,	''),
(79,	2,	'appdata_ocypoqphtg36/preview',	'857c9b053bfdbb0fccd93ec94cb96339',	23,	'preview',	2,	1,	239426,	1605282268,	1605282268,	0,	0,	'5faea9dc914b3',	31,	''),
(99,	2,	'appdata_ocypoqphtg36/theming/0/icon-core-filetypes_x-office-document.svg',	'baeb40eb6f6f870f3bc6237ea2963719',	76,	'icon-core-filetypes_x-office-document.svg',	17,	5,	295,	1605282268,	1605282268,	0,	0,	'4a7be17a0736ceeedb967f823460a8a3',	27,	''),
(126,	2,	'appdata_ocypoqphtg36/js/files/merged-index.js',	'd5d4545fa55b5d8cd04fc5313a096ef6',	125,	'merged-index.js',	13,	3,	409814,	1605282283,	1605282283,	0,	0,	'8a4e6e1b8b2cda41cd2c15ee5180431b',	27,	''),
(128,	2,	'appdata_ocypoqphtg36/js/files/merged-index.js.deps',	'035b8b8d2aa455535c76886dd1b12481',	125,	'merged-index.js.deps',	14,	3,	2024,	1605282283,	1605282283,	0,	0,	'e95b2b5f0fe4f52f340c943f456361f4',	27,	''),
(116,	2,	'appdata_ocypoqphtg36/preview/c/5/1/c/e/4/1/13/3000-2000-max.jpg',	'5e834e913e4253a446a500dc343b67c4',	100,	'3000-2000-max.jpg',	10,	5,	1374615,	1605282269,	1605282269,	0,	0,	'f8c9ea6c524d6fa39980cc815619b95f',	27,	''),
(100,	2,	'appdata_ocypoqphtg36/preview/c/5/1/c/e/4/1/13',	'0ec72396ebd6f13bca52503b612fac80',	98,	'13',	2,	1,	0,	1605282269,	1605282269,	0,	0,	'5faea9dcae819',	31,	''),
(122,	2,	'appdata_ocypoqphtg36/preview/c/5/1/c/e/4/1/13/64-64-crop.jpg',	'4749d1462c06e48553fab92c37347c8a',	100,	'64-64-crop.jpg',	10,	5,	3805,	1605282269,	1605282269,	0,	0,	'086a0cc86ec1882bda14489d245b6252',	27,	''),
(130,	2,	'appdata_ocypoqphtg36/js/files/merged-index.js.gzip',	'740716227c1b17c88be409421519536a',	125,	'merged-index.js.gzip',	15,	3,	92477,	1605282283,	1605282283,	0,	0,	'30283f8480e184cb7b6f02cdf3833915',	27,	''),
(149,	2,	'appdata_ocypoqphtg36/preview/e/4/d/a/3/b/7/5',	'850994fda8805159e50d773893f76e93',	148,	'5',	2,	1,	0,	1605282286,	1605282286,	0,	0,	'5faea9ee22d08',	31,	''),
(150,	2,	'appdata_ocypoqphtg36/preview/e/4/d/a/3/b/7/5/500-500-max.png',	'3b25675fc7c02f2470a4153d5d2fd1cd',	149,	'500-500-max.png',	6,	5,	50545,	1605282286,	1605282286,	0,	0,	'64954914fae08534fa443d7c7bd49238',	27,	''),
(151,	2,	'appdata_ocypoqphtg36/preview/e/4/d/a/3/b/7/5/256-256-crop.png',	'29c2acc9c2130c1ce1a332d293042f8d',	149,	'256-256-crop.png',	6,	5,	46474,	1605282286,	1605282286,	0,	0,	'6b5675838eebda624a41b8b782b2213b',	27,	''),
(161,	2,	'appdata_ocypoqphtg36/appstore/apps.json',	'fc365ef3dba5762af0fe8becc0d47700',	158,	'apps.json',	20,	3,	1718435,	1605282338,	1605282338,	0,	0,	'60d899487df1f420d1920c62894e0cb5',	27,	''),
(167,	2,	'appdata_ocypoqphtg36/css/theming/39b9-e71a-settings-admin.css',	'114270a84334c443702bd6cc7d1f7f88',	33,	'39b9-e71a-settings-admin.css',	16,	8,	2129,	1605282516,	1605282516,	0,	0,	'3820ad306ae8e40a03bc3233ff1886aa',	27,	''),
(168,	2,	'appdata_ocypoqphtg36/css/theming/39b9-e71a-settings-admin.css.deps',	'695f47fd6b1910fe37c3223af181bf10',	33,	'39b9-e71a-settings-admin.css.deps',	14,	3,	186,	1605282516,	1605282516,	0,	0,	'9edcd422db1f4c42de9a930b41030710',	27,	''),
(169,	2,	'appdata_ocypoqphtg36/css/theming/39b9-e71a-settings-admin.css.gzip',	'3d1b0ed3081511096bb45b63eeca3d07',	33,	'39b9-e71a-settings-admin.css.gzip',	15,	3,	666,	1605282516,	1605282516,	0,	0,	'073aa83adb5e4d6808a85b631846ad84',	27,	''),
(178,	2,	'appdata_ocypoqphtg36/avatar/admin/avatar.64.png',	'dc29fcbe2a7dd6a26d770f6efbc48ce5',	41,	'avatar.64.png',	6,	5,	810,	1605282577,	1605282577,	0,	0,	'bcba6acb7a7915c950c94f78d6d10584',	27,	''),
(47,	2,	'appdata_ocypoqphtg36/css/icons/icons-vars.css',	'b5b0ee84733bf944f5f281c3df74c3a4',	32,	'icons-vars.css',	16,	8,	163634,	1605282581,	1605282581,	0,	0,	'bd1dde96cfb0b036f083d7698ec0963f',	27,	''),
(148,	2,	'appdata_ocypoqphtg36/preview/e/4/d/a/3/b/7',	'd91dff2b3c77740180ed9971dd2e2f68',	147,	'7',	2,	1,	0,	1605282286,	1605282286,	0,	0,	'5faea9ee24d01',	31,	''),
(147,	2,	'appdata_ocypoqphtg36/preview/e/4/d/a/3/b',	'7fb184e0c515a0cafde4228a16b6a1d0',	146,	'b',	2,	1,	0,	1605282286,	1605282286,	0,	0,	'5faea9ee26395',	31,	''),
(146,	2,	'appdata_ocypoqphtg36/preview/e/4/d/a/3',	'd2447dfe636c08f0666835a5b67a71af',	145,	'3',	2,	1,	0,	1605282286,	1605282286,	0,	0,	'5faea9ee27770',	31,	''),
(145,	2,	'appdata_ocypoqphtg36/preview/e/4/d/a',	'1900b032701986a77aa9c7958d11a26a',	144,	'a',	2,	1,	0,	1605282286,	1605282286,	0,	0,	'5faea9ee29400',	31,	''),
(144,	2,	'appdata_ocypoqphtg36/preview/e/4/d',	'4cfda02a67d006e7c2fba4be2f2c4944',	143,	'd',	2,	1,	0,	1605282286,	1605282286,	0,	0,	'5faea9ee2a92c',	31,	''),
(143,	2,	'appdata_ocypoqphtg36/preview/e/4',	'fc9d4b7eef89bd12589e94dccc1e2ff0',	142,	'4',	2,	1,	0,	1605282286,	1605282286,	0,	0,	'5faea9ee2bb7f',	31,	''),
(142,	2,	'appdata_ocypoqphtg36/preview/e',	'0445befa760798d76a06813dd988f17a',	79,	'e',	2,	1,	0,	1605282286,	1605282286,	0,	0,	'5faea9ee2d472',	31,	''),
(98,	2,	'appdata_ocypoqphtg36/preview/c/5/1/c/e/4/1',	'a7f71e9e6999651d35f04b365e580d76',	97,	'1',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcb4a5e',	31,	''),
(115,	2,	'appdata_ocypoqphtg36/preview/9/8/f/1/3/7/0/20/1600-1066-max.jpg',	'280c6acb3dc33b189bb0defba5bdb304',	107,	'1600-1066-max.jpg',	10,	5,	613485,	1605282269,	1605282269,	0,	0,	'52f8eeaa8cfee11a4837e3bbdd300d6b',	27,	''),
(107,	2,	'appdata_ocypoqphtg36/preview/9/8/f/1/3/7/0/20',	'f39ef82e86529bc4916147b52470b4fb',	106,	'20',	2,	1,	0,	1605282269,	1605282269,	0,	0,	'5faea9dcbf6d7',	31,	''),
(118,	2,	'appdata_ocypoqphtg36/preview/c/2/0/a/d/4/d/12/1200-1800-max.jpg',	'dc25f8044d306362917e277103e486e2',	114,	'1200-1800-max.jpg',	10,	5,	496747,	1605282269,	1605282269,	0,	0,	'1ee59c1f98edd77d84b8978d4b86b958',	27,	''),
(114,	2,	'appdata_ocypoqphtg36/preview/c/2/0/a/d/4/d/12',	'6db05b910deb4910d777af0847790483',	113,	'12',	2,	1,	0,	1605282269,	1605282269,	0,	0,	'5faea9dcdb942',	31,	''),
(119,	2,	'appdata_ocypoqphtg36/preview/9/8/f/1/3/7/0/20/64-64-crop.jpg',	'de02f486ee847ee3f15f39964dd33b9a',	107,	'64-64-crop.jpg',	10,	5,	2913,	1605282269,	1605282269,	0,	0,	'c24ca2e24f28e628faf84d472b5bb976',	27,	''),
(121,	2,	'appdata_ocypoqphtg36/preview/c/2/0/a/d/4/d/12/64-64-crop.jpg',	'd48cb27df48080f7f26ad50bcd5349ca',	114,	'64-64-crop.jpg',	10,	5,	2234,	1605282269,	1605282269,	0,	0,	'2d057400d8d298a6481e961043df3cf7',	27,	''),
(133,	2,	'appdata_ocypoqphtg36/css/files/d71e-e71a-merged.css',	'f4c4842ab3102553bab5cfbcf1f57765',	132,	'd71e-e71a-merged.css',	16,	8,	28447,	1605282284,	1605282284,	0,	0,	'f9ae02c0db79820ebb5bc8589228a236',	27,	''),
(132,	2,	'appdata_ocypoqphtg36/css/files',	'3afdbca0874af00e6cd820446b31845c',	31,	'files',	2,	1,	0,	1605282284,	1605282284,	0,	0,	'5faea9ebd2808',	31,	''),
(134,	2,	'appdata_ocypoqphtg36/css/files/d71e-e71a-merged.css.deps',	'1ac9fc7b237b5edffd4be9062d65607c',	132,	'd71e-e71a-merged.css.deps',	14,	3,	480,	1605282284,	1605282284,	0,	0,	'9b633dc6d0e96d129fe99058215543cd',	27,	''),
(135,	2,	'appdata_ocypoqphtg36/css/files/d71e-e71a-merged.css.gzip',	'c1e1e64ec7a71db74138d6ef6d85d627',	132,	'd71e-e71a-merged.css.gzip',	15,	3,	5591,	1605282284,	1605282284,	0,	0,	'63cf72292a7a37408f1fc7e53af4041f',	27,	''),
(136,	2,	'appdata_ocypoqphtg36/css/files_sharing',	'ad110c8e693cebb7da1b06119794f42d',	31,	'files_sharing',	2,	1,	0,	1605282284,	1605282284,	0,	0,	'5faea9ec5625a',	31,	''),
(137,	2,	'appdata_ocypoqphtg36/css/files_sharing/4039-e71a-icons.css',	'ad102fd42c3a6de4bea97325c8d03464',	136,	'4039-e71a-icons.css',	16,	8,	174,	1605282284,	1605282284,	0,	0,	'61899c48d66c255ca4202d239f6f4a15',	27,	''),
(138,	2,	'appdata_ocypoqphtg36/css/files_sharing/4039-e71a-icons.css.deps',	'62850688594090b892f36781de16a781',	136,	'4039-e71a-icons.css.deps',	14,	3,	183,	1605282284,	1605282284,	0,	0,	'8fa391761ec927e879555da00d81fca5',	27,	''),
(139,	2,	'appdata_ocypoqphtg36/css/files_sharing/4039-e71a-icons.css.gzip',	'91730b0990bd7e422c5621533f1161ba',	136,	'4039-e71a-icons.css.gzip',	15,	3,	102,	1605282284,	1605282284,	0,	0,	'3a05681fb1c5fa0ab949ade09fb6ca7d',	27,	''),
(162,	2,	'appdata_ocypoqphtg36/css/settings',	'7100fa9d09aaeacc477fed206eac0121',	31,	'settings',	2,	1,	0,	1605282463,	1605282463,	0,	0,	'5faeaa9f1d382',	31,	''),
(163,	2,	'appdata_ocypoqphtg36/css/settings/62ab-e71a-settings.css',	'd764826d10cac20bac641d2f67f67630',	162,	'62ab-e71a-settings.css',	16,	8,	33003,	1605282463,	1605282463,	0,	0,	'a52dadac85805fe113dcb440cd9eaf80',	27,	''),
(164,	2,	'appdata_ocypoqphtg36/css/settings/62ab-e71a-settings.css.deps',	'701a631d63fd08a20fb9ba5121bc9331',	162,	'62ab-e71a-settings.css.deps',	14,	3,	181,	1605282463,	1605282463,	0,	0,	'973486d499cfa993608e84d2582df17a',	27,	''),
(48,	2,	'appdata_ocypoqphtg36/css/icons/icons-list.template',	'7ea7523030aa071722b5fd14a6905bc6',	32,	'icons-list.template',	14,	3,	19052,	1605282581,	1605282581,	0,	0,	'3e13cb7ca43d2db4180c33065c45a605',	27,	''),
(113,	2,	'appdata_ocypoqphtg36/preview/c/2/0/a/d/4/d',	'537ac391aef1a34103581ae62ee3703f',	112,	'd',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcde74a',	31,	''),
(112,	2,	'appdata_ocypoqphtg36/preview/c/2/0/a/d/4',	'8219ad671e97371ab538f491ec870556',	111,	'4',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dce158f',	31,	''),
(111,	2,	'appdata_ocypoqphtg36/preview/c/2/0/a/d',	'8fab7d05c8b7897b9b608739df0d24e4',	110,	'd',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dce3b9f',	31,	''),
(110,	2,	'appdata_ocypoqphtg36/preview/c/2/0/a',	'c35ea9a55918938988b19342728fdac3',	109,	'a',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dce83de',	31,	''),
(109,	2,	'appdata_ocypoqphtg36/preview/c/2/0',	'd7232e11d3ead8c26b5c200b842c7e60',	108,	'0',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dceac5e',	31,	''),
(108,	2,	'appdata_ocypoqphtg36/preview/c/2',	'b9b260a1658bc9d0052c6ce420ab9fe1',	88,	'2',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcee675',	31,	''),
(106,	2,	'appdata_ocypoqphtg36/preview/9/8/f/1/3/7/0',	'21a4536a467cf86bdffd7a60bf24d675',	105,	'0',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcc1b3a',	31,	''),
(105,	2,	'appdata_ocypoqphtg36/preview/9/8/f/1/3/7',	'28c3025ac1037b9d78aeb73be85d0c30',	104,	'7',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcc365d',	31,	''),
(104,	2,	'appdata_ocypoqphtg36/preview/9/8/f/1/3',	'81cf81b06fd1a9b9ac4b695e1b0162ed',	103,	'3',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcc52f8',	31,	''),
(103,	2,	'appdata_ocypoqphtg36/preview/9/8/f/1',	'ff843ad1b19ec2673027fe9fcbdeff20',	102,	'1',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcc6e90',	31,	''),
(102,	2,	'appdata_ocypoqphtg36/preview/9/8/f',	'dc33f4c937372af7fde46a316a18e285',	94,	'f',	2,	1,	0,	1605282268,	1605282268,	0,	0,	'5faea9dcc88f5',	31,	''),
(92,	2,	'appdata_ocypoqphtg36/preview/9',	'b3bc5e334d84e1ebf685dd724d66e84a',	79,	'9',	2,	1,	239426,	1605282270,	1605282270,	0,	0,	'5faea9dccc554',	31,	''),
(158,	2,	'appdata_ocypoqphtg36/appstore',	'6405be402b6c7dc10094a916cf4eca61',	23,	'appstore',	2,	1,	0,	1605282617,	1605282617,	0,	0,	'5faeaa0428469',	31,	''),
(140,	2,	'appdata_ocypoqphtg36/theming/0/icon-core-filetypes_application-pdf.svg',	'da7f01912ee6764653a29d2d33804354',	76,	'icon-core-filetypes_application-pdf.svg',	17,	5,	1054,	1605282286,	1605282286,	0,	0,	'9ffee44c37fb5c1d887b4e2492014b6b',	27,	''),
(123,	2,	'appdata_ocypoqphtg36/preview/1/f/0/e/3/d/a/19/64-64-crop.png',	'36f9b9009567c74ce0a90af225ee159d',	89,	'64-64-crop.png',	6,	5,	805,	1605282270,	1605282270,	0,	0,	'7b61d50d3291b0ca2eeca99bada10b7c',	27,	''),
(89,	2,	'appdata_ocypoqphtg36/preview/1/f/0/e/3/d/a/19',	'e94ff65925b7294eeb23a5cc8a9a7f77',	87,	'19',	2,	1,	0,	1605282270,	1605282270,	0,	0,	'5faea9dc9b70c',	31,	''),
(153,	2,	'appdata_ocypoqphtg36/theming/0/icon-core-filetypes_x-office-spreadsheet.svg',	'e2c58ef74a24f795833c7fb68b4db82a',	76,	'icon-core-filetypes_x-office-spreadsheet.svg',	17,	5,	327,	1605282294,	1605282294,	0,	0,	'8d2a161143e95e16b8b09079b09e7ef1',	27,	''),
(165,	2,	'appdata_ocypoqphtg36/css/settings/62ab-e71a-settings.css.gzip',	'a90606a99f4a792af320ed03ab70a03c',	162,	'62ab-e71a-settings.css.gzip',	15,	3,	6073,	1605282463,	1605282463,	0,	0,	'6d3863396e42a2a6d0a936eb088d9d97',	27,	''),
(171,	2,	'appdata_ocypoqphtg36/css/federatedfilesharing/c5f2-e71a-settings-personal.css',	'66826e31b0c7e638b157a28cc08c30cd',	170,	'c5f2-e71a-settings-personal.css',	16,	8,	680,	1605282545,	1605282545,	0,	0,	'91b7c0b63b6968cc1224d359a9e00d27',	27,	''),
(170,	2,	'appdata_ocypoqphtg36/css/federatedfilesharing',	'a55dfdce3a7b7c77ae70b4f4a1f540b0',	31,	'federatedfilesharing',	2,	1,	0,	1605282545,	1605282545,	0,	0,	'5faeaaf0ea684',	31,	''),
(172,	2,	'appdata_ocypoqphtg36/css/federatedfilesharing/c5f2-e71a-settings-personal.css.deps',	'27fded7851e60f7ab49de5a6152fa483',	170,	'c5f2-e71a-settings-personal.css.deps',	14,	3,	202,	1605282545,	1605282545,	0,	0,	'1b1937206c06d920c3112f9c9518bec1',	27,	''),
(173,	2,	'appdata_ocypoqphtg36/css/federatedfilesharing/c5f2-e71a-settings-personal.css.gzip',	'13386575ddfd13ef3202148a2d1d5e3a',	170,	'c5f2-e71a-settings-personal.css.gzip',	15,	3,	307,	1605282545,	1605282545,	0,	0,	'c0846c39e3dfb878b92642b8332ebe9e',	27,	''),
(179,	2,	'appdata_ocypoqphtg36/css/serverinfo',	'd434b3ff4a6e97f65bb4b181dd7f46a0',	31,	'serverinfo',	2,	1,	0,	1605282581,	1605282581,	0,	0,	'5faeab1592a8e',	31,	''),
(180,	2,	'appdata_ocypoqphtg36/css/serverinfo/e8ed-e71a-style.css',	'569d1c582baa66ed1de4c586cf7b1eb2',	179,	'e8ed-e71a-style.css',	16,	8,	2096,	1605282581,	1605282581,	0,	0,	'58ef5ff85186bea23fad6ba2cb887722',	27,	''),
(181,	2,	'appdata_ocypoqphtg36/css/serverinfo/e8ed-e71a-style.css.deps',	'616edb1c9cc2b6be8e065f117845594f',	179,	'e8ed-e71a-style.css.deps',	14,	3,	180,	1605282581,	1605282581,	0,	0,	'2e2dabf411f2781081ddbd411a697d0d',	27,	''),
(182,	2,	'appdata_ocypoqphtg36/css/serverinfo/e8ed-e71a-style.css.gzip',	'99f783e0b1ee5b2a67b76c5e818cf0b5',	179,	'e8ed-e71a-style.css.gzip',	15,	3,	764,	1605282581,	1605282581,	0,	0,	'7437d0b5f6dac5d6709144b31cd48521',	27,	''),
(188,	2,	'appdata_ocypoqphtg36/preview/1/4',	'9e46060dfb2d8874d6745f8e8bc06693',	81,	'4',	2,	1,	-1,	1605282771,	1605282771,	0,	0,	'5faeabd403a17',	31,	''),
(189,	2,	'appdata_ocypoqphtg36/preview/1/4/0',	'92abf93b98c89cf7161c1e3493baf0c4',	188,	'0',	2,	1,	-1,	1605282771,	1605282771,	0,	0,	'5faeabd402702',	31,	''),
(190,	2,	'appdata_ocypoqphtg36/preview/1/4/0/f',	'a8dd9dc660f511fa7b797d04b1d71701',	189,	'f',	2,	1,	-1,	1605282771,	1605282771,	0,	0,	'5faeabd40148d',	31,	''),
(191,	2,	'appdata_ocypoqphtg36/preview/1/4/0/f/6',	'd7e4bba110e3a0ed5dc91f188861ae82',	190,	'6',	2,	1,	-1,	1605282771,	1605282771,	0,	0,	'5faeabd3f4226',	31,	''),
(192,	2,	'appdata_ocypoqphtg36/preview/1/4/0/f/6/9',	'caa89282eb5fa9cafb2570708ddf5697',	191,	'9',	2,	1,	-1,	1605282771,	1605282771,	0,	0,	'5faeabd3f2a28',	31,	''),
(194,	2,	'appdata_ocypoqphtg36/preview/1/4/0/f/6/9/6',	'd0787019d272bbd254c6ae68a2a74c4f',	192,	'6',	2,	1,	-1,	1605282771,	1605282771,	0,	0,	'5faeabd3f152a',	31,	''),
(124,	2,	'appdata_ocypoqphtg36/preview/9/64-64-crop.png',	'edb134f041f054fb3cf8ac03dc3a72c3',	92,	'64-64-crop.png',	6,	5,	4623,	1605282270,	1605282270,	0,	0,	'fec8691fbe7119afc76709e47f43e08d',	27,	''),
(141,	2,	'appdata_ocypoqphtg36/theming/0/icon-core-filetypes_folder.svg',	'd2f48c72c3ab090468c22f06404169d8',	76,	'icon-core-filetypes_folder.svg',	17,	5,	255,	1605282286,	1605282286,	0,	0,	'9d4c0303dbc830d7803aadc9bf5dc411',	27,	''),
(154,	2,	'appdata_ocypoqphtg36/avatar/admin/avatar.png',	'964cf2ca9a68a63f83795af14e4b3c00',	41,	'avatar.png',	6,	5,	15691,	1605282303,	1605282303,	0,	0,	'baef325a95e17aba77d8bf19c4807bf3',	27,	''),
(155,	2,	'appdata_ocypoqphtg36/avatar/admin/generated',	'36c3532f9b3518b7294ee9c871dc3b44',	41,	'generated',	14,	3,	0,	1605282303,	1605282303,	0,	0,	'9cf18da6abb2596465c7098d87163281',	27,	''),
(156,	2,	'appdata_ocypoqphtg36/avatar/admin/avatar.32.png',	'd2ce7980332712318c8c84a13cfb45b5',	41,	'avatar.32.png',	6,	5,	386,	1605282303,	1605282303,	0,	0,	'926887d0366af53b57c8204a8314914b',	27,	''),
(160,	2,	'appdata_ocypoqphtg36/theming/0/icon-core-filetypes_x-office-presentation.svg',	'4a9f48a3c480b9397f66cc084ba6d5dc',	76,	'icon-core-filetypes_x-office-presentation.svg',	17,	5,	261,	1605282318,	1605282318,	0,	0,	'be937d3edb6991e2310089a8ff017f89',	27,	''),
(166,	2,	'appdata_ocypoqphtg36/avatar/admin/avatar.145.png',	'06e7ca285cc84d69418d5d5450083a44',	41,	'avatar.145.png',	6,	5,	1777,	1605282464,	1605282464,	0,	0,	'9d5964d6b31a89aa5df2c5eb9e950da5',	27,	''),
(174,	2,	'appdata_ocypoqphtg36/css/privacy',	'e3695fdceb71e32335f1fa4c51be7a49',	31,	'privacy',	2,	1,	0,	1605282572,	1605282572,	0,	0,	'5faeab0c4b382',	31,	''),
(175,	2,	'appdata_ocypoqphtg36/css/privacy/1bf6-e71a-privacy.css',	'97ba5f91b83243b8806db429aa3caaa7',	174,	'1bf6-e71a-privacy.css',	16,	8,	2444,	1605282572,	1605282572,	0,	0,	'28b7a10797fef27a0248c766bc71bb5a',	27,	''),
(176,	2,	'appdata_ocypoqphtg36/css/privacy/1bf6-e71a-privacy.css.deps',	'bbf32bb7f2c8a84aaca7878e1eaa66cb',	174,	'1bf6-e71a-privacy.css.deps',	14,	3,	179,	1605282572,	1605282572,	0,	0,	'e76aefa941c754790dd8926dd06c0f31',	27,	''),
(177,	2,	'appdata_ocypoqphtg36/css/privacy/1bf6-e71a-privacy.css.gzip',	'155f0b8e748cc50ce4d66f868ba3a662',	174,	'1bf6-e71a-privacy.css.gzip',	15,	3,	717,	1605282572,	1605282572,	0,	0,	'bb4b13478acf9d9161079e5f6a84e795',	27,	''),
(183,	2,	'appdata_ocypoqphtg36/appstore/categories.json',	'eb897142ee83c63c09643dc8d72986e4',	158,	'categories.json',	20,	3,	141511,	1605282617,	1605282617,	0,	0,	'1a424d90a26472fad8e18f4b843e2581',	27,	''),
(193,	2,	'appdata_ocypoqphtg36/preview/e/c',	'18e3eea3994eae2af56f7975234e07dd',	142,	'c',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd40be7d',	31,	''),
(195,	2,	'appdata_ocypoqphtg36/preview/e/c/c',	'c171dc058858a10305d3aab58f7c3a46',	193,	'c',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd409c71',	31,	''),
(1,	1,	'',	'd41d8cd98f00b204e9800998ecf8427e',	-1,	'',	2,	1,	0,	1605282818,	1605282818,	0,	0,	'5faeac03036a9',	23,	''),
(197,	2,	'appdata_ocypoqphtg36/preview/e/c/c/b',	'29178f1acc48253c965da104aaf80a2f',	195,	'b',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd40802a',	31,	''),
(196,	2,	'appdata_ocypoqphtg36/preview/1/4/0/f/6/9/6/159',	'408b5d2644bcc9cc2cee41e8fe84cc65',	194,	'159',	2,	1,	0,	1605282771,	1605282771,	0,	0,	'5faeabd3ee9e2',	31,	''),
(198,	2,	'appdata_ocypoqphtg36/preview/e/c/c/b/c',	'de4f35596331212e9de6dc9caec7b182',	197,	'c',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd40700b',	31,	''),
(199,	2,	'appdata_ocypoqphtg36/preview/e/c/c/b/c/8',	'f911b0b9a797412da332ca342aa92473',	198,	'8',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd405fb1',	31,	''),
(200,	2,	'appdata_ocypoqphtg36/preview/e/c/c/b/c/8/7',	'52e7d852612f9eb61adf95187dfa5b69',	199,	'7',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd404c50',	31,	''),
(201,	2,	'appdata_ocypoqphtg36/preview/e/c/c/b/c/8/7/3',	'1465dd4fce5f999c38af46412fdc14c2',	200,	'3',	2,	1,	0,	1605282772,	1605282772,	0,	0,	'5faeabd403684',	31,	''),
(202,	2,	'appdata_ocypoqphtg36/preview/6',	'972510950e1995148e325ab83f522e97',	79,	'6',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd421078',	31,	''),
(203,	2,	'appdata_ocypoqphtg36/preview/6/c',	'ad8132fd08ad53cd8c5b5ca8efa80084',	202,	'c',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd41fefc',	31,	''),
(204,	2,	'appdata_ocypoqphtg36/preview/6/c/4',	'cbb6dc0ae9a6836aa64452099409d081',	203,	'4',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd41eb34',	31,	''),
(205,	2,	'appdata_ocypoqphtg36/preview/6/c/4/b',	'3e1b54b149a48a2130d600fd6c5eb25a',	204,	'b',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd41d983',	31,	''),
(206,	2,	'appdata_ocypoqphtg36/preview/6/c/4/b/7',	'9be03276b6e7189e678929bd028cbb38',	205,	'7',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd41c560',	31,	''),
(207,	2,	'appdata_ocypoqphtg36/preview/6/c/4/b/7/6',	'075576e72bd0fffb942724b42555b3f3',	206,	'6',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd41af3f',	31,	''),
(208,	2,	'appdata_ocypoqphtg36/preview/6/c/4/b/7/6/1',	'd4e991b1172e89b7a3cc2858d3987f24',	207,	'1',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd419bff',	31,	''),
(209,	2,	'appdata_ocypoqphtg36/preview/a',	'38eacda6bcc44fe3d202e74e13df5b03',	79,	'a',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd42b122',	31,	''),
(211,	2,	'appdata_ocypoqphtg36/preview/a/8',	'db1f42489b89742f0b955506cabc20f6',	209,	'8',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd4295a3',	31,	''),
(210,	2,	'appdata_ocypoqphtg36/preview/6/c/4/b/7/6/1/157',	'837e8ef41a0d561a71d93378f9c5dd11',	208,	'157',	2,	1,	0,	1605282772,	1605282772,	0,	0,	'5faeabd4186cc',	31,	''),
(212,	2,	'appdata_ocypoqphtg36/preview/a/8/7',	'69239d868f9d1e9ab6b743606b6d1d21',	211,	'7',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd4276f9',	31,	''),
(213,	2,	'appdata_ocypoqphtg36/preview/a/8/7/f',	'037b6ebfbb39ec4d7f88ac54aad5dc4f',	212,	'f',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd4262cf',	31,	''),
(214,	2,	'appdata_ocypoqphtg36/preview/a/8/7/f/f',	'b442e29c2ae38f3adc16531f6be9a192',	213,	'f',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd424a12',	31,	''),
(215,	2,	'appdata_ocypoqphtg36/preview/a/8/7/f/f/6',	'fce173681c7aa46d0cd0c31a5dc1d965',	214,	'6',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd42325b',	31,	''),
(216,	2,	'appdata_ocypoqphtg36/preview/3',	'821f8b9413f8ce3fd4c4605eb359f4b1',	79,	'3',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd43555f',	31,	''),
(217,	2,	'appdata_ocypoqphtg36/preview/a/8/7/f/f/6/7',	'3d3ba8fceb3747264ab99bb846acfb49',	215,	'7',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd421689',	31,	''),
(218,	2,	'appdata_ocypoqphtg36/preview/3/c',	'0f711b9da3ec71c31c0e3d1ee4cd24c2',	216,	'c',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd4334c3',	31,	''),
(220,	2,	'appdata_ocypoqphtg36/preview/3/c/5',	'3f20cf5c10300adbcfd287630188c0d6',	218,	'5',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd432170',	31,	''),
(219,	2,	'appdata_ocypoqphtg36/preview/a/8/7/f/f/6/7/4',	'bca401596c63943671c5b17f5f1a4a56',	217,	'4',	2,	1,	0,	1605282772,	1605282772,	0,	0,	'5faeabd41fe75',	31,	''),
(221,	2,	'appdata_ocypoqphtg36/preview/3/c/5/9',	'8ef86ca508fbbe05ea7a30b7a9a84044',	220,	'9',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd42fef1',	31,	''),
(222,	2,	'appdata_ocypoqphtg36/preview/3/c/5/9/d',	'ced10368c4b44f8eeb909a3d5eb46aab',	221,	'd',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd42e73b',	31,	''),
(223,	2,	'appdata_ocypoqphtg36/preview/3/c/5/9/d/c',	'6b3240b86c9e309324c304c29f53cb81',	222,	'c',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd42d2f9',	31,	''),
(224,	2,	'appdata_ocypoqphtg36/preview/3/7',	'3e6ba7e0e7b190298cf46935987ecc97',	216,	'7',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd43e6ab',	31,	''),
(225,	2,	'appdata_ocypoqphtg36/preview/3/c/5/9/d/c/0',	'd76ea3304963137759a8825d0eb96a4b',	223,	'0',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd42c69d',	31,	''),
(226,	2,	'appdata_ocypoqphtg36/preview/3/7/a',	'1efb3f12775f48264df77afd8a1c5fa2',	224,	'a',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd43cc7d',	31,	''),
(228,	2,	'appdata_ocypoqphtg36/preview/3/7/a/7',	'68b557cbcb7a35656af2f764b641f46c',	226,	'7',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd43ad69',	31,	''),
(227,	2,	'appdata_ocypoqphtg36/preview/3/c/5/9/d/c/0/21',	'a31c44b28c0499ca908eb9e9d5258ef4',	225,	'21',	2,	1,	0,	1605282772,	1605282772,	0,	0,	'5faeabd429faf',	31,	''),
(229,	2,	'appdata_ocypoqphtg36/preview/3/7/a/7/4',	'a9a47980b3bfe461d268a02478d506b9',	228,	'4',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd439683',	31,	''),
(230,	2,	'appdata_ocypoqphtg36/preview/3/7/a/7/4/9',	'277e74192e9a77adfaaa0bbf3abf2726',	229,	'9',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd43825c',	31,	''),
(231,	2,	'appdata_ocypoqphtg36/preview/3/7/a/7/4/9/d',	'e19893d744e9e0644f02182f12ebdd83',	230,	'd',	2,	1,	-1,	1605282772,	1605282772,	0,	0,	'5faeabd436c25',	31,	''),
(232,	2,	'appdata_ocypoqphtg36/preview/3/7/a/7/4/9/d/152',	'327435ff654da94b6c9bc41e0eacb218',	231,	'152',	2,	1,	0,	1605282772,	1605282772,	0,	0,	'5faeabd4355af',	31,	''),
(237,	2,	'appdata_ocypoqphtg36/preview/5',	'5583f3a06188227f5ad7ffd8751c664c',	79,	'5',	2,	1,	-1,	1605282795,	1605282795,	0,	0,	'5faeabeb6aaac',	31,	''),
(238,	2,	'appdata_ocypoqphtg36/preview/5/7',	'b52e689f39c3f9fb0ce85f2163bf3acc',	237,	'7',	2,	1,	-1,	1605282795,	1605282795,	0,	0,	'5faeabeb6980e',	31,	''),
(239,	2,	'appdata_ocypoqphtg36/preview/5/7/7',	'6c0588e71c98e4b833a17206ceebe2d2',	238,	'7',	2,	1,	-1,	1605282795,	1605282795,	0,	0,	'5faeabeb67dc9',	31,	''),
(240,	2,	'appdata_ocypoqphtg36/preview/5/7/7/e',	'9fb9eb699338ac604e692dceac047f90',	239,	'e',	2,	1,	-1,	1605282795,	1605282795,	0,	0,	'5faeabeb66966',	31,	''),
(241,	2,	'appdata_ocypoqphtg36/preview/5/7/7/e/f',	'20c8192f91aaee8f79d7f6adeaf9629e',	240,	'f',	2,	1,	-1,	1605282795,	1605282795,	0,	0,	'5faeabeb64d12',	31,	''),
(242,	2,	'appdata_ocypoqphtg36/preview/5/7/7/e/f/1',	'60130404c691edd8dbbf2c7c1f168a16',	241,	'1',	2,	1,	-1,	1605282795,	1605282795,	0,	0,	'5faeabeb637a5',	31,	''),
(243,	2,	'appdata_ocypoqphtg36/preview/5/7/7/e/f/1/1',	'd2f92b529243a8f76d847da6d3fefbf9',	242,	'1',	2,	1,	-1,	1605282795,	1605282795,	0,	0,	'5faeabeb61ce6',	31,	''),
(244,	2,	'appdata_ocypoqphtg36/preview/5/7/7/e/f/1/1/235',	'f13d690f58351348c136771b4ce31c35',	243,	'235',	2,	1,	0,	1605282795,	1605282795,	0,	0,	'5faeabeb5fc24',	31,	'');

DROP TABLE IF EXISTS "oc_filecache_extended";
CREATE TABLE "public"."oc_filecache_extended" (
    "fileid" bigint NOT NULL,
    "metadata_etag" character varying(40),
    "creation_time" bigint DEFAULT '0' NOT NULL,
    "upload_time" bigint DEFAULT '0' NOT NULL,
    CONSTRAINT "fce_fileid_idx" UNIQUE ("fileid")
) WITH (oids = false);

CREATE INDEX "fce_ctime_idx" ON "public"."oc_filecache_extended" USING btree ("creation_time");

CREATE INDEX "fce_utime_idx" ON "public"."oc_filecache_extended" USING btree ("upload_time");


DROP TABLE IF EXISTS "oc_files_trash";
DROP SEQUENCE IF EXISTS oc_files_trash_auto_id_seq;
CREATE SEQUENCE oc_files_trash_auto_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_files_trash" (
    "auto_id" integer DEFAULT nextval('oc_files_trash_auto_id_seq') NOT NULL,
    "id" character varying(250) DEFAULT '' NOT NULL,
    "user" character varying(64) DEFAULT '' NOT NULL,
    "timestamp" character varying(12) DEFAULT '' NOT NULL,
    "location" character varying(512) DEFAULT '' NOT NULL,
    "type" character varying(4),
    "mime" character varying(255),
    CONSTRAINT "oc_files_trash_pkey" PRIMARY KEY ("auto_id")
) WITH (oids = false);

CREATE INDEX "id_index" ON "public"."oc_files_trash" USING btree ("id");

CREATE INDEX "timestamp_index" ON "public"."oc_files_trash" USING btree ("timestamp");

CREATE INDEX "user_index" ON "public"."oc_files_trash" USING btree ("user");


DROP TABLE IF EXISTS "oc_flow_checks";
DROP SEQUENCE IF EXISTS oc_flow_checks_id_seq;
CREATE SEQUENCE oc_flow_checks_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_flow_checks" (
    "id" integer DEFAULT nextval('oc_flow_checks_id_seq') NOT NULL,
    "class" character varying(256) DEFAULT '' NOT NULL,
    "operator" character varying(16) DEFAULT '' NOT NULL,
    "value" text,
    "hash" character varying(32) DEFAULT '' NOT NULL,
    CONSTRAINT "flow_unique_hash" UNIQUE ("hash"),
    CONSTRAINT "oc_flow_checks_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "oc_flow_operations";
DROP SEQUENCE IF EXISTS oc_flow_operations_id_seq;
CREATE SEQUENCE oc_flow_operations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_flow_operations" (
    "id" integer DEFAULT nextval('oc_flow_operations_id_seq') NOT NULL,
    "class" character varying(256) DEFAULT '' NOT NULL,
    "name" character varying(256) DEFAULT '' NOT NULL,
    "checks" text,
    "operation" text,
    "entity" character varying(256) DEFAULT '' NOT NULL,
    "events" text DEFAULT '[]' NOT NULL,
    CONSTRAINT "oc_flow_operations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "oc_flow_operations_scope";
DROP SEQUENCE IF EXISTS oc_flow_operations_scope_id_seq;
CREATE SEQUENCE oc_flow_operations_scope_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_flow_operations_scope" (
    "id" bigint DEFAULT nextval('oc_flow_operations_scope_id_seq') NOT NULL,
    "operation_id" integer DEFAULT '0' NOT NULL,
    "type" integer DEFAULT '0' NOT NULL,
    "value" character varying(64) DEFAULT '',
    CONSTRAINT "flow_unique_scope" UNIQUE ("operation_id", "type", "value"),
    CONSTRAINT "oc_flow_operations_scope_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "oc_group_admin";
CREATE TABLE "public"."oc_group_admin" (
    "gid" character varying(64) DEFAULT '' NOT NULL,
    "uid" character varying(64) DEFAULT '' NOT NULL,
    CONSTRAINT "oc_group_admin_pkey" PRIMARY KEY ("gid", "uid")
) WITH (oids = false);

CREATE INDEX "group_admin_uid" ON "public"."oc_group_admin" USING btree ("uid");


DROP TABLE IF EXISTS "oc_group_user";
CREATE TABLE "public"."oc_group_user" (
    "gid" character varying(64) DEFAULT '' NOT NULL,
    "uid" character varying(64) DEFAULT '' NOT NULL,
    CONSTRAINT "oc_group_user_pkey" PRIMARY KEY ("gid", "uid")
) WITH (oids = false);

CREATE INDEX "gu_uid_index" ON "public"."oc_group_user" USING btree ("uid");

INSERT INTO "oc_group_user" ("gid", "uid") VALUES
('admin',	'admin');

DROP TABLE IF EXISTS "oc_groups";
CREATE TABLE "public"."oc_groups" (
    "gid" character varying(64) DEFAULT '' NOT NULL,
    "displayname" character varying(255) DEFAULT 'name' NOT NULL,
    CONSTRAINT "oc_groups_pkey" PRIMARY KEY ("gid")
) WITH (oids = false);

INSERT INTO "oc_groups" ("gid", "displayname") VALUES
('admin',	'admin');

DROP TABLE IF EXISTS "oc_jobs";
DROP SEQUENCE IF EXISTS oc_jobs_id_seq;
CREATE SEQUENCE oc_jobs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_jobs" (
    "id" bigint DEFAULT nextval('oc_jobs_id_seq') NOT NULL,
    "class" character varying(255) DEFAULT '' NOT NULL,
    "argument" character varying(4000) DEFAULT '' NOT NULL,
    "last_run" integer DEFAULT '0',
    "last_checked" integer DEFAULT '0',
    "reserved_at" integer DEFAULT '0',
    "execution_duration" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "oc_jobs_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "job_class_index" ON "public"."oc_jobs" USING btree ("class");

INSERT INTO "oc_jobs" ("id", "class", "argument", "last_run", "last_checked", "reserved_at", "execution_duration") VALUES
(27,	'OC\Preview\BackgroundCleanupJob',	'null',	0,	1605281790,	0,	0),
(22,	'OCA\Files\BackgroundJob\DeleteOrphanedItems',	'null',	1605282615,	1605282615,	0,	0),
(1,	'OCA\Files_Sharing\DeleteOrphanedSharesJob',	'null',	1605282254,	1605282254,	0,	0),
(28,	'OCA\FirstRunWizard\Notification\BackgroundJob',	'{"uid":"admin"}',	0,	1605282263,	0,	0),
(12,	'OCA\UserStatus\BackgroundJob\ClearOldStatusesBackgroundJob',	'null',	1605282411,	1605282411,	0,	0),
(2,	'OCA\Files_Sharing\ExpireSharesJob',	'null',	1605282268,	1605282268,	0,	0),
(23,	'OCA\Files\BackgroundJob\CleanupFileLocks',	'null',	1605282701,	1605282701,	0,	0),
(13,	'OCA\Support\BackgroundJobs\CheckSubscription',	'null',	1605282464,	1605282464,	0,	0),
(3,	'OCA\Files_Sharing\BackgroundJob\FederatedSharesDiscoverJob',	'null',	1605282285,	1605282285,	0,	0),
(14,	'OCA\Files_Versions\BackgroundJob\ExpireVersions',	'null',	1605282476,	1605282476,	0,	0),
(4,	'OCA\Text\Cron\Cleanup',	'null',	1605282294,	1605282294,	0,	0),
(24,	'OCA\Files\BackgroundJob\CleanupDirectEditingTokens',	'null',	1605282762,	1605282762,	0,	0),
(29,	'OC\Command\CommandJob',	'"O:33:\"OCA\\Files_Trashbin\\Command\\Expire\":1:{s:39:\"\u0000OCA\\Files_Trashbin\\Command\\Expire\u0000user\";s:5:\"admin\";}"',	0,	1605282768,	0,	0),
(30,	'OC\Command\CommandJob',	'"O:33:\"OCA\\Files_Trashbin\\Command\\Expire\":1:{s:39:\"\u0000OCA\\Files_Trashbin\\Command\\Expire\u0000user\";s:5:\"admin\";}"',	0,	1605282768,	0,	0),
(5,	'OCA\Federation\SyncJob',	'null',	1605282295,	1605282295,	0,	0),
(15,	'OCA\Files_Trashbin\BackgroundJob\ExpireTrash',	'null',	1605282504,	1605282504,	0,	0),
(31,	'OC\Command\CommandJob',	'"O:33:\"OCA\\Files_Trashbin\\Command\\Expire\":1:{s:39:\"\u0000OCA\\Files_Trashbin\\Command\\Expire\u0000user\";s:5:\"admin\";}"',	0,	1605282768,	0,	0),
(6,	'OCA\WorkflowEngine\BackgroundJobs\Rotate',	'null',	1605282302,	1605282302,	0,	0),
(16,	'OCA\NextcloudAnnouncements\Cron\Crawler',	'null',	1605282517,	1605282517,	0,	1),
(25,	'OC\Authentication\Token\DefaultTokenCleanupJob',	'null',	1605282786,	1605282786,	0,	0),
(8,	'OCA\DAV\BackgroundJob\CleanupDirectLinksJob',	'null',	1605282308,	1605282308,	0,	0),
(17,	'OCA\ContactsInteraction\BackgroundJob\CleanupJob',	'null',	1605282540,	1605282540,	0,	0),
(9,	'OCA\DAV\BackgroundJob\UpdateCalendarResourcesRoomsBackgroundJob',	'null',	1605282318,	1605282318,	0,	0),
(26,	'OC\Log\Rotate',	'null',	1605282833,	1605282833,	0,	0),
(18,	'OCA\Activity\BackgroundJob\EmailNotification',	'null',	1605282545,	1605282545,	0,	0),
(10,	'OCA\DAV\BackgroundJob\CleanupInvitationTokenJob',	'null',	1605282319,	1605282319,	0,	0),
(7,	'OCA\UpdateNotification\Notification\BackgroundJob',	'null',	1605282308,	1605282308,	0,	30),
(19,	'OCA\Activity\BackgroundJob\ExpireActivities',	'null',	1605282569,	1605282569,	0,	0),
(11,	'OCA\DAV\BackgroundJob\EventReminderJob',	'null',	1605282408,	1605282408,	0,	0),
(20,	'OCA\Activity\BackgroundJob\DigestMail',	'null',	1605282574,	1605282574,	0,	0),
(21,	'OCA\Files\BackgroundJob\ScanFiles',	'null',	1605282586,	1605282586,	0,	1);

DROP TABLE IF EXISTS "oc_login_flow_v2";
DROP SEQUENCE IF EXISTS oc_login_flow_v2_id_seq;
CREATE SEQUENCE oc_login_flow_v2_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_login_flow_v2" (
    "id" bigint DEFAULT nextval('oc_login_flow_v2_id_seq') NOT NULL,
    "timestamp" bigint NOT NULL,
    "started" smallint DEFAULT '0' NOT NULL,
    "poll_token" character varying(255) NOT NULL,
    "login_token" character varying(255) NOT NULL,
    "public_key" text NOT NULL,
    "private_key" text NOT NULL,
    "client_name" character varying(255) NOT NULL,
    "login_name" character varying(255),
    "server" character varying(255),
    "app_password" character varying(1024),
    CONSTRAINT "login_token" UNIQUE ("login_token"),
    CONSTRAINT "oc_login_flow_v2_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "poll_token" UNIQUE ("poll_token")
) WITH (oids = false);

CREATE INDEX "timestamp" ON "public"."oc_login_flow_v2" USING btree ("timestamp");


DROP TABLE IF EXISTS "oc_migrations";
CREATE TABLE "public"."oc_migrations" (
    "app" character varying(255) NOT NULL,
    "version" character varying(255) NOT NULL,
    CONSTRAINT "oc_migrations_pkey" PRIMARY KEY ("app", "version")
) WITH (oids = false);

INSERT INTO "oc_migrations" ("app", "version") VALUES
('core',	'13000Date20170705121758'),
('core',	'13000Date20170718121200'),
('core',	'13000Date20170814074715'),
('core',	'13000Date20170919121250'),
('core',	'13000Date20170926101637'),
('core',	'14000Date20180129121024'),
('core',	'14000Date20180404140050'),
('core',	'14000Date20180516101403'),
('core',	'14000Date20180518120534'),
('core',	'14000Date20180522074438'),
('core',	'14000Date20180626223656'),
('core',	'14000Date20180710092004'),
('core',	'14000Date20180712153140'),
('core',	'15000Date20180926101451'),
('core',	'15000Date20181015062942'),
('core',	'15000Date20181029084625'),
('core',	'16000Date20190207141427'),
('core',	'16000Date20190212081545'),
('core',	'16000Date20190427105638'),
('core',	'16000Date20190428150708'),
('core',	'17000Date20190514105811'),
('core',	'18000Date20190920085628'),
('core',	'18000Date20191014105105'),
('core',	'18000Date20191204114856'),
('core',	'19000Date20200211083441'),
('privacy',	'100Date20190217131943'),
('text',	'010000Date20190617184535'),
('text',	'030001Date20200402075029'),
('twofactor_backupcodes',	'1002Date20170607104347'),
('twofactor_backupcodes',	'1002Date20170607113030'),
('twofactor_backupcodes',	'1002Date20170919123342'),
('twofactor_backupcodes',	'1002Date20170926101419'),
('twofactor_backupcodes',	'1002Date20180821043638'),
('notifications',	'2004Date20190107135757'),
('federation',	'1010Date20200630191302'),
('workflowengine',	'2000Date20190808074233'),
('dav',	'1004Date20170825134824'),
('dav',	'1004Date20170919104507'),
('dav',	'1004Date20170924124212'),
('dav',	'1004Date20170926103422'),
('dav',	'1005Date20180413093149'),
('dav',	'1005Date20180530124431'),
('dav',	'1006Date20180619154313'),
('dav',	'1006Date20180628111625'),
('dav',	'1008Date20181030113700'),
('dav',	'1008Date20181105104826'),
('dav',	'1008Date20181105104833'),
('dav',	'1008Date20181105110300'),
('dav',	'1008Date20181105112049'),
('dav',	'1008Date20181114084440'),
('dav',	'1011Date20190725113607'),
('dav',	'1011Date20190806104428'),
('dav',	'1012Date20190808122342'),
('user_status',	'0001Date20200602134824'),
('user_status',	'0002Date20200902144824'),
('files_trashbin',	'1010Date20200630192639'),
('contactsinteraction',	'010000Date20200304152605'),
('activity',	'2006Date20170808154933'),
('activity',	'2006Date20170808155040'),
('activity',	'2006Date20170919095939'),
('activity',	'2007Date20181107114613'),
('activity',	'2008Date20181011095117'),
('activity',	'2010Date20190416112817'),
('activity',	'2011Date20201006132544'),
('files',	'11301Date20191205150729'),
('federatedfilesharing',	'1010Date20200630191755'),
('oauth2',	'010401Date20181207190718'),
('oauth2',	'010402Date20190107124745');

DROP TABLE IF EXISTS "oc_mimetypes";
DROP SEQUENCE IF EXISTS oc_mimetypes_id_seq;
CREATE SEQUENCE oc_mimetypes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_mimetypes" (
    "id" bigint DEFAULT nextval('oc_mimetypes_id_seq') NOT NULL,
    "mimetype" character varying(255) DEFAULT '' NOT NULL,
    CONSTRAINT "mimetype_id_index" UNIQUE ("mimetype"),
    CONSTRAINT "oc_mimetypes_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "oc_mimetypes" ("id", "mimetype") VALUES
(1,	'httpd'),
(2,	'httpd/unix-directory'),
(3,	'application'),
(4,	'application/pdf'),
(5,	'image'),
(6,	'image/png'),
(7,	'application/vnd.openxmlformats-officedocument.wordprocessingml.document'),
(8,	'text'),
(9,	'text/markdown'),
(10,	'image/jpeg'),
(11,	'video'),
(12,	'video/mp4'),
(13,	'application/javascript'),
(14,	'application/octet-stream'),
(15,	'application/x-gzip'),
(16,	'text/css'),
(17,	'image/svg+xml'),
(18,	'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'),
(19,	'application/vnd.openxmlformats-officedocument.presentationml.presentation'),
(20,	'application/json');

DROP TABLE IF EXISTS "oc_mounts";
DROP SEQUENCE IF EXISTS oc_mounts_id_seq;
CREATE SEQUENCE oc_mounts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_mounts" (
    "id" bigint DEFAULT nextval('oc_mounts_id_seq') NOT NULL,
    "storage_id" bigint NOT NULL,
    "root_id" bigint NOT NULL,
    "user_id" character varying(64) NOT NULL,
    "mount_point" character varying(4000) NOT NULL,
    "mount_id" bigint,
    CONSTRAINT "mounts_user_root_index" UNIQUE ("user_id", "root_id"),
    CONSTRAINT "oc_mounts_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "mounts_mount_id_index" ON "public"."oc_mounts" USING btree ("mount_id");

CREATE INDEX "mounts_root_index" ON "public"."oc_mounts" USING btree ("root_id");

CREATE INDEX "mounts_storage_index" ON "public"."oc_mounts" USING btree ("storage_id");

CREATE INDEX "mounts_user_index" ON "public"."oc_mounts" USING btree ("user_id");

INSERT INTO "oc_mounts" ("id", "storage_id", "root_id", "user_id", "mount_point", "mount_id") VALUES
(1,	1,	1,	'admin',	'/admin/',	NULL);

DROP TABLE IF EXISTS "oc_notifications";
DROP SEQUENCE IF EXISTS oc_notifications_notification_id_seq;
CREATE SEQUENCE oc_notifications_notification_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_notifications" (
    "notification_id" integer DEFAULT nextval('oc_notifications_notification_id_seq') NOT NULL,
    "app" character varying(32) NOT NULL,
    "user" character varying(64) NOT NULL,
    "timestamp" integer DEFAULT '0' NOT NULL,
    "object_type" character varying(64) NOT NULL,
    "object_id" character varying(64) NOT NULL,
    "subject" character varying(64) NOT NULL,
    "subject_parameters" text,
    "message" character varying(64),
    "message_parameters" text,
    "link" character varying(4000),
    "icon" character varying(4000),
    "actions" text,
    CONSTRAINT "oc_notifications_pkey" PRIMARY KEY ("notification_id")
) WITH (oids = false);

CREATE INDEX "oc_notifications_app" ON "public"."oc_notifications" USING btree ("app");

CREATE INDEX "oc_notifications_object" ON "public"."oc_notifications" USING btree ("object_type", "object_id");

CREATE INDEX "oc_notifications_timestamp" ON "public"."oc_notifications" USING btree ("timestamp");

CREATE INDEX "oc_notifications_user" ON "public"."oc_notifications" USING btree ("user");


DROP TABLE IF EXISTS "oc_notifications_pushtokens";
CREATE TABLE "public"."oc_notifications_pushtokens" (
    "uid" character varying(64) NOT NULL,
    "token" integer DEFAULT '0' NOT NULL,
    "deviceidentifier" character varying(128) NOT NULL,
    "devicepublickey" character varying(512) NOT NULL,
    "devicepublickeyhash" character varying(128) NOT NULL,
    "pushtokenhash" character varying(128) NOT NULL,
    "proxyserver" character varying(256) NOT NULL,
    "apptype" character varying(32) DEFAULT 'unknown' NOT NULL,
    CONSTRAINT "oc_notifpushtoken" UNIQUE ("uid", "token")
) WITH (oids = false);


DROP TABLE IF EXISTS "oc_oauth2_access_tokens";
DROP SEQUENCE IF EXISTS oc_oauth2_access_tokens_id_seq;
CREATE SEQUENCE oc_oauth2_access_tokens_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_oauth2_access_tokens" (
    "id" integer DEFAULT nextval('oc_oauth2_access_tokens_id_seq') NOT NULL,
    "token_id" integer NOT NULL,
    "client_id" integer NOT NULL,
    "hashed_code" character varying(128) NOT NULL,
    "encrypted_token" character varying(786) NOT NULL,
    CONSTRAINT "oauth2_access_hash_idx" UNIQUE ("hashed_code"),
    CONSTRAINT "oc_oauth2_access_tokens_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "oauth2_access_client_id_idx" ON "public"."oc_oauth2_access_tokens" USING btree ("client_id");


DROP TABLE IF EXISTS "oc_oauth2_clients";
DROP SEQUENCE IF EXISTS oc_oauth2_clients_id_seq;
CREATE SEQUENCE oc_oauth2_clients_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_oauth2_clients" (
    "id" integer DEFAULT nextval('oc_oauth2_clients_id_seq') NOT NULL,
    "name" character varying(64) NOT NULL,
    "redirect_uri" character varying(2000) NOT NULL,
    "client_identifier" character varying(64) NOT NULL,
    "secret" character varying(64) NOT NULL,
    CONSTRAINT "oauth2_client_id_idx" UNIQUE ("client_identifier"),
    CONSTRAINT "oc_oauth2_clients_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "oc_onlyoffice_filekey";
DROP SEQUENCE IF EXISTS oc_onlyoffice_filekey_id_seq;
CREATE SEQUENCE oc_onlyoffice_filekey_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_onlyoffice_filekey" (
    "id" integer DEFAULT nextval('oc_onlyoffice_filekey_id_seq') NOT NULL,
    "file_id" bigint DEFAULT '-1',
    "key" character varying(128) NOT NULL,
    "lock" integer DEFAULT '0' NOT NULL,
    "fs" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "file_id_index" UNIQUE ("file_id"),
    CONSTRAINT "oc_onlyoffice_filekey_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."oc_onlyoffice_filekey"."file_id" IS 'internal file identifier';

COMMENT ON COLUMN "public"."oc_onlyoffice_filekey"."key" IS 'unique key for the docoment server';

COMMENT ON COLUMN "public"."oc_onlyoffice_filekey"."lock" IS 'do not delete on file change';

COMMENT ON COLUMN "public"."oc_onlyoffice_filekey"."fs" IS 'last forcesave done';


DROP TABLE IF EXISTS "oc_preferences";
CREATE TABLE "public"."oc_preferences" (
    "userid" character varying(64) DEFAULT '' NOT NULL,
    "appid" character varying(32) DEFAULT '' NOT NULL,
    "configkey" character varying(64) DEFAULT '' NOT NULL,
    "configvalue" text,
    CONSTRAINT "oc_preferences_pkey" PRIMARY KEY ("userid", "appid", "configkey")
) WITH (oids = false);

INSERT INTO "oc_preferences" ("userid", "appid", "configkey", "configvalue") VALUES
('admin',	'login',	'lastLogin',	'1605282263'),
('admin',	'activity',	'configured',	'yes'),
('admin',	'password_policy',	'failedLoginAttempts',	'0'),
('admin',	'core',	'timezone',	'America/Sao_Paulo'),
('admin',	'dashboard',	'firstRun',	'0'),
('admin',	'firstrunwizard',	'apphint',	'18'),
('admin',	'firstrunwizard',	'show',	'0'),
('admin',	'avatar',	'generated',	'true'),
('admin',	'dashboard',	'layout',	''),
('admin',	'dashboard',	'statuses',	'{"weather":false,"status":false}'),
('admin',	'dashboard',	'background',	'nasa-waxing-crescent-moon.jpg'),
('admin',	'dashboard',	'backgroundVersion',	'1'),
('admin',	'core',	'lang',	'pt_BR'),
('admin',	'core',	'locale',	'pt_BR'),
('admin',	'text',	'workspace_enabled',	'0');

DROP TABLE IF EXISTS "oc_privacy_admins";
DROP SEQUENCE IF EXISTS oc_privacy_admins_id_seq;
CREATE SEQUENCE oc_privacy_admins_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_privacy_admins" (
    "id" integer DEFAULT nextval('oc_privacy_admins_id_seq') NOT NULL,
    "displayname" character varying(64) DEFAULT '' NOT NULL,
    CONSTRAINT "oc_privacy_admins_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "oc_properties";
DROP SEQUENCE IF EXISTS oc_properties_id_seq;
CREATE SEQUENCE oc_properties_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_properties" (
    "id" bigint DEFAULT nextval('oc_properties_id_seq') NOT NULL,
    "userid" character varying(64) DEFAULT '' NOT NULL,
    "propertypath" character varying(255) DEFAULT '' NOT NULL,
    "propertyname" character varying(255) DEFAULT '' NOT NULL,
    "propertyvalue" text NOT NULL,
    CONSTRAINT "oc_properties_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "properties_path_index" ON "public"."oc_properties" USING btree ("userid", "propertypath");

CREATE INDEX "property_index" ON "public"."oc_properties" USING btree ("userid");


DROP TABLE IF EXISTS "oc_recent_contact";
DROP SEQUENCE IF EXISTS oc_recent_contact_id_seq;
CREATE SEQUENCE oc_recent_contact_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_recent_contact" (
    "id" integer DEFAULT nextval('oc_recent_contact_id_seq') NOT NULL,
    "actor_uid" character varying(64) NOT NULL,
    "uid" character varying(64),
    "email" character varying(255),
    "federated_cloud_id" character varying(255),
    "card" bytea NOT NULL,
    "last_contact" integer NOT NULL,
    CONSTRAINT "oc_recent_contact_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "recent_contact_actor_uid" ON "public"."oc_recent_contact" USING btree ("actor_uid");

CREATE INDEX "recent_contact_email" ON "public"."oc_recent_contact" USING btree ("email");

CREATE INDEX "recent_contact_fed_id" ON "public"."oc_recent_contact" USING btree ("federated_cloud_id");

CREATE INDEX "recent_contact_id_uid" ON "public"."oc_recent_contact" USING btree ("id", "actor_uid");

CREATE INDEX "recent_contact_last_contact" ON "public"."oc_recent_contact" USING btree ("last_contact");

CREATE INDEX "recent_contact_uid" ON "public"."oc_recent_contact" USING btree ("uid");


DROP TABLE IF EXISTS "oc_schedulingobjects";
DROP SEQUENCE IF EXISTS oc_schedulingobjects_id_seq;
CREATE SEQUENCE oc_schedulingobjects_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_schedulingobjects" (
    "id" bigint DEFAULT nextval('oc_schedulingobjects_id_seq') NOT NULL,
    "principaluri" character varying(255),
    "calendardata" bytea,
    "uri" character varying(255),
    "lastmodified" integer,
    "etag" character varying(32),
    "size" bigint NOT NULL,
    CONSTRAINT "oc_schedulingobjects_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "schedulobj_principuri_index" ON "public"."oc_schedulingobjects" USING btree ("principaluri");


DROP TABLE IF EXISTS "oc_share";
DROP SEQUENCE IF EXISTS oc_share_id_seq;
CREATE SEQUENCE oc_share_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_share" (
    "id" bigint DEFAULT nextval('oc_share_id_seq') NOT NULL,
    "share_type" smallint DEFAULT '0' NOT NULL,
    "share_with" character varying(255),
    "password" character varying(255),
    "uid_owner" character varying(64) DEFAULT '' NOT NULL,
    "uid_initiator" character varying(64),
    "parent" bigint,
    "item_type" character varying(64) DEFAULT '' NOT NULL,
    "item_source" character varying(255),
    "item_target" character varying(255),
    "file_source" bigint,
    "file_target" character varying(512),
    "permissions" smallint DEFAULT '0' NOT NULL,
    "stime" bigint DEFAULT '0' NOT NULL,
    "accepted" smallint DEFAULT '0' NOT NULL,
    "expiration" timestamp(0),
    "token" character varying(32),
    "mail_send" smallint DEFAULT '0' NOT NULL,
    "share_name" character varying(64),
    "password_by_talk" boolean DEFAULT false NOT NULL,
    "note" text,
    "hide_download" smallint DEFAULT '0' NOT NULL,
    "label" character varying(255),
    CONSTRAINT "oc_share_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "file_source_index" ON "public"."oc_share" USING btree ("file_source");

CREATE INDEX "initiator_index" ON "public"."oc_share" USING btree ("uid_initiator");

CREATE INDEX "item_share_type_index" ON "public"."oc_share" USING btree ("item_type", "share_type");

CREATE INDEX "owner_index" ON "public"."oc_share" USING btree ("uid_owner");

CREATE INDEX "parent_index" ON "public"."oc_share" USING btree ("parent");

CREATE INDEX "share_with_index" ON "public"."oc_share" USING btree ("share_with");

CREATE INDEX "token_index" ON "public"."oc_share" USING btree ("token");


DROP TABLE IF EXISTS "oc_share_external";
DROP SEQUENCE IF EXISTS oc_share_external_id_seq;
CREATE SEQUENCE oc_share_external_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_share_external" (
    "id" integer DEFAULT nextval('oc_share_external_id_seq') NOT NULL,
    "parent" integer DEFAULT '-1',
    "share_type" integer,
    "remote" character varying(512) NOT NULL,
    "remote_id" integer DEFAULT '-1' NOT NULL,
    "share_token" character varying(64) NOT NULL,
    "password" character varying(64),
    "name" character varying(64) NOT NULL,
    "owner" character varying(64) NOT NULL,
    "user" character varying(64) NOT NULL,
    "mountpoint" character varying(4000) NOT NULL,
    "mountpoint_hash" character varying(32) NOT NULL,
    "accepted" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "oc_share_external_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "sh_external_mp" UNIQUE ("user", "mountpoint_hash")
) WITH (oids = false);

CREATE INDEX "sh_external_user" ON "public"."oc_share_external" USING btree ("user");

COMMENT ON COLUMN "public"."oc_share_external"."remote" IS 'Url of the remove owncloud instance';

COMMENT ON COLUMN "public"."oc_share_external"."share_token" IS 'Public share token';

COMMENT ON COLUMN "public"."oc_share_external"."password" IS 'Optional password for the public share';

COMMENT ON COLUMN "public"."oc_share_external"."name" IS 'Original name on the remote server';

COMMENT ON COLUMN "public"."oc_share_external"."owner" IS 'User that owns the public share on the remote server';

COMMENT ON COLUMN "public"."oc_share_external"."user" IS 'Local user which added the external share';

COMMENT ON COLUMN "public"."oc_share_external"."mountpoint" IS 'Full path where the share is mounted';

COMMENT ON COLUMN "public"."oc_share_external"."mountpoint_hash" IS 'md5 hash of the mountpoint';


DROP TABLE IF EXISTS "oc_storages";
DROP SEQUENCE IF EXISTS oc_storages_numeric_id_seq;
CREATE SEQUENCE oc_storages_numeric_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_storages" (
    "numeric_id" bigint DEFAULT nextval('oc_storages_numeric_id_seq') NOT NULL,
    "id" character varying(64),
    "available" integer DEFAULT '1' NOT NULL,
    "last_checked" integer,
    CONSTRAINT "oc_storages_pkey" PRIMARY KEY ("numeric_id"),
    CONSTRAINT "storages_id_index" UNIQUE ("id")
) WITH (oids = false);

INSERT INTO "oc_storages" ("numeric_id", "id", "available", "last_checked") VALUES
(1,	'home::admin',	1,	NULL),
(2,	'local::/var/www/html/data/',	1,	NULL);

DROP TABLE IF EXISTS "oc_systemtag";
DROP SEQUENCE IF EXISTS oc_systemtag_id_seq;
CREATE SEQUENCE oc_systemtag_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_systemtag" (
    "id" bigint DEFAULT nextval('oc_systemtag_id_seq') NOT NULL,
    "name" character varying(64) DEFAULT '' NOT NULL,
    "visibility" smallint DEFAULT '1' NOT NULL,
    "editable" smallint DEFAULT '1' NOT NULL,
    CONSTRAINT "oc_systemtag_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "tag_ident" UNIQUE ("name", "visibility", "editable")
) WITH (oids = false);


DROP TABLE IF EXISTS "oc_systemtag_group";
CREATE TABLE "public"."oc_systemtag_group" (
    "systemtagid" bigint DEFAULT '0' NOT NULL,
    "gid" character varying(255) NOT NULL,
    CONSTRAINT "oc_systemtag_group_pkey" PRIMARY KEY ("gid", "systemtagid")
) WITH (oids = false);


DROP TABLE IF EXISTS "oc_systemtag_object_mapping";
CREATE TABLE "public"."oc_systemtag_object_mapping" (
    "objectid" character varying(64) DEFAULT '' NOT NULL,
    "objecttype" character varying(64) DEFAULT '' NOT NULL,
    "systemtagid" bigint DEFAULT '0' NOT NULL,
    CONSTRAINT "mapping" UNIQUE ("objecttype", "objectid", "systemtagid")
) WITH (oids = false);


DROP TABLE IF EXISTS "oc_text_documents";
DROP SEQUENCE IF EXISTS oc_text_documents_id_seq;
CREATE SEQUENCE oc_text_documents_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_text_documents" (
    "id" bigint DEFAULT nextval('oc_text_documents_id_seq') NOT NULL,
    "current_version" bigint DEFAULT '0' NOT NULL,
    "last_saved_version" bigint DEFAULT '0' NOT NULL,
    "last_saved_version_time" bigint NOT NULL,
    "last_saved_version_etag" character varying(64) DEFAULT '',
    "base_version_etag" character varying(64) DEFAULT '',
    CONSTRAINT "oc_text_documents_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "oc_text_sessions";
DROP SEQUENCE IF EXISTS oc_text_sessions_id_seq;
CREATE SEQUENCE oc_text_sessions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_text_sessions" (
    "id" bigint DEFAULT nextval('oc_text_sessions_id_seq') NOT NULL,
    "user_id" character varying(64),
    "guest_name" character varying(64),
    "color" character varying(7),
    "token" character varying(64) NOT NULL,
    "document_id" bigint NOT NULL,
    "last_contact" bigint NOT NULL,
    CONSTRAINT "oc_text_sessions_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "rd_session_token_idx" ON "public"."oc_text_sessions" USING btree ("token");

CREATE INDEX "ts_docid_lastcontact" ON "public"."oc_text_sessions" USING btree ("document_id", "last_contact");


DROP TABLE IF EXISTS "oc_text_steps";
DROP SEQUENCE IF EXISTS oc_text_steps_id_seq;
CREATE SEQUENCE oc_text_steps_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_text_steps" (
    "id" bigint DEFAULT nextval('oc_text_steps_id_seq') NOT NULL,
    "document_id" bigint NOT NULL,
    "session_id" bigint NOT NULL,
    "data" text NOT NULL,
    "version" bigint DEFAULT '0' NOT NULL,
    CONSTRAINT "oc_text_steps_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "rd_steps_did_idx" ON "public"."oc_text_steps" USING btree ("document_id");

CREATE INDEX "rd_steps_version_idx" ON "public"."oc_text_steps" USING btree ("version");


DROP TABLE IF EXISTS "oc_trusted_servers";
DROP SEQUENCE IF EXISTS oc_trusted_servers_id_seq;
CREATE SEQUENCE oc_trusted_servers_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_trusted_servers" (
    "id" integer DEFAULT nextval('oc_trusted_servers_id_seq') NOT NULL,
    "url" character varying(512) NOT NULL,
    "url_hash" character varying(255) DEFAULT '' NOT NULL,
    "token" character varying(128),
    "shared_secret" character varying(256),
    "status" integer DEFAULT '2' NOT NULL,
    "sync_token" character varying(512),
    CONSTRAINT "oc_trusted_servers_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "url_hash" UNIQUE ("url_hash")
) WITH (oids = false);


DROP TABLE IF EXISTS "oc_twofactor_backupcodes";
DROP SEQUENCE IF EXISTS oc_twofactor_backupcodes_id_seq;
CREATE SEQUENCE oc_twofactor_backupcodes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_twofactor_backupcodes" (
    "id" bigint DEFAULT nextval('oc_twofactor_backupcodes_id_seq') NOT NULL,
    "user_id" character varying(64) NOT NULL,
    "code" character varying(128) NOT NULL,
    "used" smallint DEFAULT '0' NOT NULL,
    CONSTRAINT "oc_twofactor_backupcodes_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "twofactor_backupcodes_uid" ON "public"."oc_twofactor_backupcodes" USING btree ("user_id");


DROP TABLE IF EXISTS "oc_twofactor_providers";
CREATE TABLE "public"."oc_twofactor_providers" (
    "provider_id" character varying(32) NOT NULL,
    "uid" character varying(64) NOT NULL,
    "enabled" smallint NOT NULL,
    CONSTRAINT "oc_twofactor_providers_pkey" PRIMARY KEY ("provider_id", "uid")
) WITH (oids = false);

CREATE INDEX "twofactor_providers_uid" ON "public"."oc_twofactor_providers" USING btree ("uid");

INSERT INTO "oc_twofactor_providers" ("provider_id", "uid", "enabled") VALUES
('backup_codes',	'admin',	0);

DROP TABLE IF EXISTS "oc_user_status";
DROP SEQUENCE IF EXISTS oc_user_status_id_seq;
CREATE SEQUENCE oc_user_status_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_user_status" (
    "id" bigint DEFAULT nextval('oc_user_status_id_seq') NOT NULL,
    "user_id" character varying(255) NOT NULL,
    "status" character varying(255) NOT NULL,
    "status_timestamp" integer NOT NULL,
    "is_user_defined" boolean NOT NULL,
    "message_id" character varying(255),
    "custom_icon" character varying(255),
    "custom_message" text,
    "clear_at" integer,
    CONSTRAINT "oc_user_status_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "user_status_uid_ix" UNIQUE ("user_id")
) WITH (oids = false);

CREATE INDEX "user_status_clr_ix" ON "public"."oc_user_status" USING btree ("clear_at");

CREATE INDEX "user_status_iud_ix" ON "public"."oc_user_status" USING btree ("is_user_defined", "status");

CREATE INDEX "user_status_tstmp_ix" ON "public"."oc_user_status" USING btree ("status_timestamp");

INSERT INTO "oc_user_status" ("id", "user_id", "status", "status_timestamp", "is_user_defined", "message_id", "custom_icon", "custom_message", "clear_at") VALUES
(1,	'admin',	'online',	1605282267,	'f',	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS "oc_user_transfer_owner";
DROP SEQUENCE IF EXISTS oc_user_transfer_owner_id_seq;
CREATE SEQUENCE oc_user_transfer_owner_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."oc_user_transfer_owner" (
    "id" bigint DEFAULT nextval('oc_user_transfer_owner_id_seq') NOT NULL,
    "source_user" character varying(64) NOT NULL,
    "target_user" character varying(64) NOT NULL,
    "file_id" bigint NOT NULL,
    "node_name" character varying(255) NOT NULL,
    CONSTRAINT "oc_user_transfer_owner_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "oc_users";
CREATE TABLE "public"."oc_users" (
    "uid" character varying(64) DEFAULT '' NOT NULL,
    "displayname" character varying(64),
    "password" character varying(255) DEFAULT '' NOT NULL,
    "uid_lower" character varying(64) DEFAULT '',
    CONSTRAINT "oc_users_pkey" PRIMARY KEY ("uid")
) WITH (oids = false);

CREATE INDEX "user_uid_lower" ON "public"."oc_users" USING btree ("uid_lower");

INSERT INTO "oc_users" ("uid", "displayname", "password", "uid_lower") VALUES
('admin',	NULL,	'3|$argon2id$v=19$m=65536,t=4,p=1$Mm1Rd0xwbTZhSFZRa2xLNw$RVbo7vP/a5RhsHOCUwwO2PCzCAP9hNIl5kGBk3rIdK4',	'admin');

DROP TABLE IF EXISTS "oc_vcategory";
DROP SEQUENCE IF EXISTS oc_vcategory_id_seq;
CREATE SEQUENCE oc_vcategory_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_vcategory" (
    "id" bigint DEFAULT nextval('oc_vcategory_id_seq') NOT NULL,
    "uid" character varying(64) DEFAULT '' NOT NULL,
    "type" character varying(64) DEFAULT '' NOT NULL,
    "category" character varying(255) DEFAULT '' NOT NULL,
    CONSTRAINT "oc_vcategory_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "category_index" ON "public"."oc_vcategory" USING btree ("category");

CREATE INDEX "type_index" ON "public"."oc_vcategory" USING btree ("type");

CREATE INDEX "uid_index" ON "public"."oc_vcategory" USING btree ("uid");


DROP TABLE IF EXISTS "oc_vcategory_to_object";
CREATE TABLE "public"."oc_vcategory_to_object" (
    "objid" bigint DEFAULT '0' NOT NULL,
    "categoryid" bigint DEFAULT '0' NOT NULL,
    "type" character varying(64) DEFAULT '' NOT NULL,
    CONSTRAINT "oc_vcategory_to_object_pkey" PRIMARY KEY ("categoryid", "objid", "type")
) WITH (oids = false);

CREATE INDEX "vcategory_objectd_index" ON "public"."oc_vcategory_to_object" USING btree ("objid", "type");


DROP TABLE IF EXISTS "oc_webauthn";
DROP SEQUENCE IF EXISTS oc_webauthn_id_seq;
CREATE SEQUENCE oc_webauthn_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_webauthn" (
    "id" integer DEFAULT nextval('oc_webauthn_id_seq') NOT NULL,
    "uid" character varying(64) NOT NULL,
    "name" character varying(64) NOT NULL,
    "public_key_credential_id" character varying(255) NOT NULL,
    "data" text NOT NULL,
    CONSTRAINT "oc_webauthn_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "webauthn_publickeycredentialid" ON "public"."oc_webauthn" USING btree ("public_key_credential_id");

CREATE INDEX "webauthn_uid" ON "public"."oc_webauthn" USING btree ("uid");


DROP TABLE IF EXISTS "oc_whats_new";
DROP SEQUENCE IF EXISTS oc_whats_new_id_seq;
CREATE SEQUENCE oc_whats_new_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."oc_whats_new" (
    "id" integer DEFAULT nextval('oc_whats_new_id_seq') NOT NULL,
    "version" character varying(64) DEFAULT '11' NOT NULL,
    "etag" character varying(64) DEFAULT '' NOT NULL,
    "last_check" integer DEFAULT '0' NOT NULL,
    "data" text DEFAULT '' NOT NULL,
    CONSTRAINT "oc_whats_new_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "version" UNIQUE ("version")
) WITH (oids = false);

CREATE INDEX "version_etag_idx" ON "public"."oc_whats_new" USING btree ("version", "etag");


-- 2020-11-13 12:57:58.558792-03
