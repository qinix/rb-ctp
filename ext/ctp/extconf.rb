require "mkmf"

LIBDIR     = RbConfig::CONFIG['libdir']
LIB_DIRS = [LIBDIR, File.expand_path(File.dirname(__FILE__))]

dir_config '', __dir__, LIB_DIRS
have_library 'thosttraderapi'
have_library 'thostmduserapi'
create_makefile("ctp")
