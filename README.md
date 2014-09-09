
# hbase-shell

Dockerized standalone HBase shell is based on Ubuntu 14.04, Oracle Java 7 and HBase Trunk(currently 0.99).

## Usage

Run `docker run -i -t tobegit3hub/hbase-shell` to lauch hbase shell.

## Basic

* Create table

<pre>
hbase(main):001:0> create "table1", {NAME => "cf1"}, {NAME => "cf2"}
0 row(s) in 1.1200 seconds

=> Hbase::Table - table1
</pre>

* Check Schema

<pre>
hbase(main):002:0> describe "table1"
DESCRIPTION                                                                                                                              ENABLED
'table1', {NAME => 'cf1', DATA_BLOCK_ENCODING => 'NONE', BLOOMFILTER => 'ROW', REPLICATION_SCOPE => '0', VERSIONS => '1', COMPRESSION =  true
> 'NONE', MIN_VERSIONS => '0', TTL => 'FOREVER', KEEP_DELETED_CELLS => 'false', BLOCKSIZE => '65536', IN_MEMORY => 'false', BLOCKCACHE
=> 'true'}, {NAME => 'cf2', DATA_BLOCK_ENCODING => 'NONE', BLOOMFILTER => 'ROW', REPLICATION_SCOPE => '0', VERSIONS => '1', COMPRESSION
=> 'NONE', MIN_VERSIONS => '0', TTL => 'FOREVER', KEEP_DELETED_CELLS => 'false', BLOCKSIZE => '65536', IN_MEMORY => 'false', BLOCKCACH
E => 'true'}

1 row(s) in 0.0250 seconds
</pre>

* List tables

<pre>
hbase(main):003:0> list
TABLE
table1
1 row(s) in 0.0320 seconds

=> ["table1"]
</pre>

* Put data

<pre>
hbase(main):004:0> put "table1", "row1", "cf1:qulifier1", "value1"
0 row(s) in 0.0530 seconds
</pre>

* Get data

<pre>
hbase(main):005:0> get "table1", "row1", "cf1:qulifier1"
COLUMN                      CELL
cf1:qulifier1              timestamp=1410265311275, value=value1
1 row(s) in 0.0280 seconds
</pre>

* Scan data

<pre>
hbase(main):006:0> scan "table1"
ROW                         COLUMN+CELL
row1                       column=cf1:qulifier1, timestamp=1410265311275, value=value1
1 row(s) in 0.0260 seconds
</pre>

* Delete data

<pre>
hbase(main):007:0> delete "table1", "row1", "cf1:qulifier1"
0 row(s) in 0.0310 seconds
</pre>

* Help

<pre>
hbase(main):008:0> help
HBase Shell, version 2.0.0-SNAPSHOT, r5ad6098b52fe3b046ff11ffe518ca8a096b7343e, Wed Sep  3 09:10:17 UTC 2014
Type 'help "COMMAND"', (e.g. 'help "get"' -- the quotes are necessary) for help on a specific command.
Commands are grouped. Type 'help "COMMAND_GROUP"', (e.g. 'help "general"') for help on a command group.

COMMAND GROUPS:
  Group name: general
  Commands: status, table_help, version, whoami

  Group name: ddl
  Commands: alter, alter_async, alter_status, create, describe, disable, disable_all, drop, drop_all, enable, enable_all, exists, get_table, is_disabled, is_enabled, list, show_filters

  Group name: namespace
  Commands: alter_namespace, create_namespace, describe_namespace, drop_namespace, list_namespace, list_namespace_tables

  Group name: dml
  Commands: append, count, delete, deleteall, get, get_counter, incr, put, scan, truncate, truncate_preserve

  Group name: tools
  Commands: assign, balance_switch, balancer, catalogjanitor_enabled, catalogjanitor_run, catalogjanitor_switch, close_region, compact, flush, hlog_roll, major_compact, merge_region, move, split, trace, unassign, zk_dump

  Group name: replication
  Commands: add_peer, disable_peer, enable_peer, list_peers, list_replicated_tables, remove_peer, set_peer_tableCFs, show_peer_tableCFs

  Group name: snapshots
  Commands: clone_snapshot, delete_snapshot, list_snapshots, rename_snapshot, restore_snapshot, snapshot

  Group name: security
  Commands: grant, revoke, user_permission

  Group name: visibility labels
  Commands: add_labels, clear_auths, get_auths, set_auths, set_visibility

SHELL USAGE:
Quote all names in HBase Shell such as table and column names.  Commas delimit command parameters.  Type <RETURN> after entering a command to run it.
Dictionaries of configuration used in the creation and alteration of tables are
Ruby Hashes. They look like this:

  {'key1' => 'value1', 'key2' => 'value2', ...}

and are opened and closed with curley-braces.  Key/values are delimited by the '=>' character combination.  Usually keys are predefined constants such as NAME, VERSIONS, COMPRESSION, etc.  Constants do not need to be quoted.  Type 'Object.constants' to see a (messy) list of all constants in the environment.

If you are using binary keys or values and need to enter them in the shell, use double-quote'd hexadecimal representation. For example:

  hbase> get 't1', "key\x03\x3f\xcd"
  hbase> get 't1', "key\003\023\011"
  hbase> put 't1', "test\xef\xff", 'f1:', "\x01\x33\x40"

The HBase shell is the (J)Ruby IRB with the above HBase-specific commands added.
For more on the HBase Shell, see http://hbase.apache.org/docs/current/book.html
</pre>