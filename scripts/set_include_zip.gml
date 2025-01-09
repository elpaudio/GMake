if !argument0 exit
set_working_directory(program_directory)
file_delete(project_dir+name+'.zip')
execute_program(mydir+'\bin\7z.exe','a "'+project_dir+name+'.zip" "'+project_dir+name+'\"',1)
set_working_directory(mydir)
