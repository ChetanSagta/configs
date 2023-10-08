require('telescope').load_extension('projects')
require('project_nvim').setup {
	manual_mode = false,
	silent_chdir = false,
  patterns = { ".git", "Makefile", "*.sln", "build/env.sh","CMakeLists.txt","init.lua","Cargo.toml"}
}
