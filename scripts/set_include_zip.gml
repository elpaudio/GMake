if !argument0 exit
set_working_directory(program_directory)
if argument_count==2 {
file_delete(argument[1])
execute_program(mydir+'\bin\7z.exe','a "'+argument[1]+'" "'+project_dir+name+'\"',1)
}
file_delete(project_dir+name+'.zip')
execute_program(mydir+'\bin\7z.exe','a "'+project_dir+name+'.zip" "'+project_dir+name+'\"',1)
set_working_directory(mydir)
