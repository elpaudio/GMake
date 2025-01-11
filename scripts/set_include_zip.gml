if !argument0 exit
set_working_directory(program_directory)
if argument_count==2 {
file_delete(argument[1])
execute_program(mydir+'\bin\7z.exe','a "'+argument[1]+'" "'+project_dir+name+'\"',1)
}
else if argument_count==1 {
file_delete(project_dir+name+'.zip')
execute_program(mydir+'\bin\7z.exe','a "'+project_dir+name+'.zip" "'+project_dir+name+'\"',1)
}
else {show_error('Wrong arguments to set_include_zip().',1) game_end() exit}
set_working_directory(mydir)
