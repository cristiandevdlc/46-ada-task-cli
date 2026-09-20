with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure Tasks is
   File : File_Type;
   Command : constant String := (if Argument_Count > 0 then Argument(1) else "help");
begin
   if Command = "add" and then Argument_Count > 1 then
      begin Open(File, Append_File, "tasks.txt"); exception when Name_Error => Create(File, Out_File, "tasks.txt"); end;
      Put_Line(File, Argument(2)); Close(File); Put_Line("Tarea guardada");
   elsif Command = "list" then
      begin
         Open(File, In_File, "tasks.txt");
         while not End_Of_File(File) loop Put_Line(Get_Line(File)); end loop;
         Close(File);
      exception when Name_Error => Put_Line("Sin tareas"); end;
   else Put_Line("Uso: tasks add texto | list");
   end if;
end Tasks;
