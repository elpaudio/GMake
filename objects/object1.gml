#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mydir=program_directory
if debug_mode mydir=working_directory

gmakerdir=directory_appdata+'\Roaming\GameMaker8.2\GameMaker.exe'
if !file_exists(mydir+'\gmaker.txt') {show_message("I don't know where is your GameMaker located. Where is it located?") gmakerdir=get_open_filename('GameMaker Executable|*.exe','GameMaker.exe') file_text_write_all(mydir+'\gmaker.txt',gmakerdir)}
else {var g;g=file_text_open_read(mydir+'\gmaker.txt') gmakerdir=file_text_read_string(g) file_text_close(g)}
if !file_exists(gmakerdir) {
show_message('No GameMaker installed at AppData\Roaming dir! Please set the new GameMaker directory.')
gmakerdir=get_open_filename('GameMaker Executable|*.exe','GameMaker.exe')
}
if gmakerdir='' or !file_exists(mydir+'\gmaker.txt') {show_error("Sorry, but i didn't find GameMaker executable. Please change 'gmakerdir.txt' file in GMake directory to change GameMaker directory.",1) game_end() exit}

message_size(640,240)

argc=parameter_count()
argv=parameter_string(1)
if debug_mode and argc=0 and argv='' {argc=1 argv='GMakeLists.txt'}
if argc=0 and argv='' {argv=get_open_filename('GMake list|GMakeLists.txt','GMakeLists.txt') if argv='' {show_error('no commandline arguments!',1)game_end()exit}else argc=1}
if !argc {show_error('No commandline arguments!',1)game_end()exit}
if !file_exists(argv) {show_error('File does not exists: '+argv,1)}

set_working_directory(filename_dir(argv))

var f;f=file_text_open_read(argv)
if f {
while !file_text_eof(f) {
str=file_text_read_string(f)
file_text_readln(f)
execute_string(str)
}
}

show_message('Compiled game.')
game_end()
