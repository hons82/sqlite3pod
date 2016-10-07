Pod::Spec.new do |s|
  s.name     = 'sqlite3'
  s.version  = '3.14.2'
  s.license  = { :type => 'Public Domain', :text => <<-LICENSE
All of the code and documentation in SQLite has been dedicated to the public domain by the authors.
All code authors, and representatives of the companies they work for, have signed affidavits dedicating their contributions to the public domain and originals of those signed affidavits are stored in a firesafe at the main offices of Hwaci.
Anyone is free to copy, modify, publish, use, compile, sell, or distribute the original SQLite code, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.
LICENSE
  }
  s.summary  = 'SQLite is an embedded SQL database engine'
  s.documentation_url = 'https://sqlite.org/docs.html'
  s.homepage = 'https://github.com/clemensg/sqlite3pod'
  s.authors  = { 'Clemens Gruber' => 'clemensgru@gmail.com' }

  v = s.version.to_s.split('.')
  archive_name = "sqlite-amalgamation-"+v[0]+v[1].rjust(2, '0')+v[2].rjust(2, '0')+"00"
  s.source   = { :http => "https://www.sqlite.org/#{Time.now.year}/#{archive_name}.zip" }
  s.requires_arc = false

  s.default_subspecs = 'common'

  s.subspec 'common' do |ss|
    ss.source_files = "#{archive_name}/sqlite*.{h,c}"
    ss.osx.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DHAVE_USLEEP=1' }
    # Disable OS X / AFP locking code on mobile platforms (iOS, tvOS, watchOS)
    sqlite_xcconfig_ios = { 'OTHER_CFLAGS' => '$(inherited) -DHAVE_USLEEP=1 -DSQLITE_ENABLE_LOCKING_STYLE=0' }
    ss.ios.pod_target_xcconfig = sqlite_xcconfig_ios
    ss.tvos.pod_target_xcconfig = sqlite_xcconfig_ios
    ss.watchos.pod_target_xcconfig = sqlite_xcconfig_ios
  end

  # Detect misuse of SQLite API
  s.subspec 'api_armor' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_API_ARMOR=1' }
  end

  # API for column meta-data access
  s.subspec 'coldata' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_COLUMN_METADATA=1' }
  end

  # FTS4 full-text-search
  s.subspec 'fts' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_FTS4=1 -DSQLITE_ENABLE_FTS3_PARENTHESIS=1' }
  end

  # FTS5 full-text-search (Experimental feature!)
  s.subspec 'fts5' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_FTS5=1' }
  end

  # enable support for icu - International Components for Unicode
  s.subspec 'icu' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_ICU=1' }
    ss.libraries = 'icucore'
  end

  # JSON1 extension for managing JSON content
  s.subspec 'json1' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_JSON1=1' }
  end

  # Resumable Bulk Update (Experimental feature!)
  s.subspec 'rbu' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_RBU=1' }
  end

  # R*Tree index for range queries
  s.subspec 'rtree' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_RTREE=1' }
  end

  # Session extension: Record and package changes to rowid tables into files that can be applied to other DBs
  s.subspec 'session' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_PREUPDATE_HOOK=1 -DSQLITE_ENABLE_SESSION=1' }
  end

  # Interface for historical database snapshots (Experimental!)
  s.subspec 'snapshot' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_SNAPSHOT=1' }
  end

  # Soundex phonetic string encoding function
  s.subspec 'soundex' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_SOUNDEX=1' }
  end

  # Enhanced ANALYZE and query planner: Collects histogram data for the left-most column of each index
  s.subspec 'stat3' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_STAT3=1' }
  end

  # Further enhanced ANALYZE and query planner: Collects histogram data for all columns of each index
  s.subspec 'stat4' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_STAT4=1' }
  end

  # Build unicode61 FTS tokenizer (Deprecated! The tokenizer is built by default)
  s.subspec 'unicode61' do |ss|
    ss.dependency 'sqlite3/common'
    ss.dependency 'sqlite3/fts'
  end

  # API to register unlock-notification callbacks
  s.subspec 'unlock_notify' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_UNLOCK_NOTIFY=1' }
  end
  
end
