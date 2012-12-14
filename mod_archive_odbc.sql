CREATE TABLE archive_collections ( id INT default autoincrement,
                                 prev_id INTEGER,
                                 next_id INTEGER,
                                 us VARCHAR(2047) NOT NULL,
                                 with_user VARCHAR(1023) NOT NULL,
                                 with_server VARCHAR(1023) NOT NULL,
                                 with_resource VARCHAR(1023) NOT NULL,
                                 utc timestamp NOT NULL,
                                 change_by VARCHAR(3071),
                                 change_utc timestamp,
                                 deleted INTEGER,
                                 subject VARCHAR(1023),
                                 thread VARCHAR(1023),
                                 crypt INTEGER,
                                 extra VARCHAR(32767),
                                 PRIMARY KEY(id));
CREATE TABLE archive_messages(id INTEGER default autoincrement,
                              coll_id INTEGER NOT NULL,
                              utc DATETIME NOT NULL,
                              dir INTEGER,
                              body NVARCHAR,
                              name VARCHAR(1023),
                              PRIMARY KEY(id));
CREATE TABLE archive_jid_prefs(us VARCHAR(2047) NOT NULL,
                               with_user VARCHAR(1023) NOT NULL,
                               with_server VARCHAR(1023) NOT NULL,
                               with_resource VARCHAR(1023) NOT NULL,
                               "save" INTEGER,
                               expire INTEGER,
                               otr INTEGER,
                               PRIMARY KEY(us, with_user, with_server, with_resource));
CREATE TABLE archive_global_prefs(us VARCHAR(2047) NOT NULL,
                                  "save" INTEGER,
                                  expire INTEGER,
                                  otr INTEGER,
                                  method_auto INTEGER,
                                  method_local INTEGER,
                                  method_manual INTEGER,
                                  auto_save INTEGER,
                                  PRIMARY KEY(us));
//CREATE OR REPLACE TRIGGER archive_collections_update BEFORE UPDATE ON archive_collections
//referencing new as "new"
//FOR EACH ROW
//BEGIN
//  DELETE FROM archive_messages WHERE coll_id = [NEW].id;
//  UPDATE archive_collections SET prev_id = null WHERE prev_id = [NEW].id;
//  UPDATE archive_collections SET next_id = null WHERE next_id = [NEW].id;
//END;

//CREATE OR REPLACE TRIGGER archive_collections_delete BEFORE DELETE ON archive_collections
//referencing old as "old"
//FOR EACH ROW
//BEGIN
//  DELETE FROM archive_messages WHERE coll_id = [OLD].id;
//  UPDATE archive_collections SET prev_id = null WHERE prev_id = [OLD].id;
//  UPDATE archive_collections SET next_id = null WHERE next_id = [OLD].id;
//END;
