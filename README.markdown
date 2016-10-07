sqlite3pod
==========

The repository for the sqlite3 podspec in [CocoaPods](http://cocoapods.org).

Please refer to the [SQLite](https://www.sqlite.org) project if you encounter any problems related to SQLite itself: https://sqlite.org/support.html

Changelog: https://www.sqlite.org/news.html

Pull requests to improve this podspec are welcome.

## Usage

To use SQLite in your project, add `pod 'sqlite3'` to your Podfile. However, as clang reports many (mostly harmless) warnings, which need to be fixed upstream, you probably want to use `pod 'sqlite3', inhibit_warnings: true`. You do not have to add it to every subspec you use (e.g. `pod 'sqlite3/fts'`), adding the parameter to the main pod is sufficient.


## Subspecs

- [API Armor, detects API misuse during development](https://sqlite.org/compile.html#enable_api_armor): `pod 'sqlite3/api_armor'`
- [Column Metadata Access](https://sqlite.org/compile.html#enable_column_metadata): `pod 'sqlite3/coldata'`
- [Full-Text-Search (FTS3/4)](https://www.sqlite.org/fts3.html): `pod 'sqlite3/fts'`
- [Full-Text-Search (FTS5)](https://www.sqlite.org/fts5.html): `pod 'sqlite3/fts5'` *Experimental*
- [JSON Support](https://www.sqlite.org/json1.html): `pod 'sqlite3/json1'`
- [Resumable Bulk Update](https://www.sqlite.org/rbu.html): `pod 'sqlite3/rbu'` *Experimental*
- [R*-Tree index for range queries](https://www.sqlite.org/rtree.html): `pod 'sqlite3/rtree'`
- [Historical Snapshots](https://www.sqlite.org/c3ref/snapshot.html): `pod 'sqlite3/snapshot'` *Experimental*
- [Session Extension](https://www.sqlite.org/sessionintro.html): `pod 'sqlite3/session'`
- [Soundex](https://www.sqlite.org/lang_corefunc.html#soundex): `pod 'sqlite3/soundex'`
- [Enhanced ANALYZE and query planner (STAT3)](https://sqlite.org/compile.html#enable_stat3): `pod 'sqlite3/stat3'`
- [Further enhanced ANALYZE and query planner (STAT4)](https://sqlite.org/compile.html#enable_stat4): `pod 'sqlite3/stat4'`
- [Unlock-Notify API](https://www.sqlite.org/unlock_notify.html): `pod 'sqlite3/unlock_notify'`
- [ICU International Components for Unicode](https://www.sqlite.org/src/artifact?ci=trunk&filename=ext/icu/README.txt): `pod 'sqlite3/icu'`

## License

This podspec is licensed under the MIT License.

All of the code and documentation in SQLite itself has been dedicated to the public domain by the authors: https://www.sqlite.org/copyright.html
