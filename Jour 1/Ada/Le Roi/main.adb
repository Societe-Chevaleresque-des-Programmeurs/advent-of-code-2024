with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Exceptions; use Ada.Exceptions;



procedure Main is
   Length : constant Integer := 1000;
   type Long_Array is array (1..Length) of Long_Integer;

   procedure Bubble_Sort(Numbers : in out Long_Array) is
      Temp : Long_Integer;
   begin
      for I in 1..Length loop
         for J in 1..Length - I loop
            if Numbers(J) > Numbers(J + 1) then
               Temp := Numbers(J);
               Numbers(J) := Numbers(J + 1);
               Numbers(J + 1) := Temp;
            end if;
         end loop;
      end loop;
   end Bubble_Sort;

   procedure P1(Left, Right : Long_Array) is
      Distance : Long_Integer := 0;
      Sub : Long_Integer;
   begin
      for I in 1..Length loop
         Sub := Left(I) - Right(I);
         if Sub < 0 then
            Distance := Distance - Sub;
         else
            Distance := Distance + Sub;
         end if;
      end loop;
      Put_Line("Distance : " & Long_Integer'Image(Distance));
      -- result : 2264607
   end P1;

   procedure P2(Left, Right : Long_Array) is
      Similarity : Long_Integer := 0;
      Count : Natural;
   begin
      for I in 1..Length loop
         Count := 0;
         for J in 1 .. Length loop
            if Left(I) = Right(J) then
               Count := Count + 1;
            end if;
         end loop;
         Similarity := Similarity + (Left(I) * Long_Integer(Count));
      end loop;
      Put_Line("Similarity : " & Long_Integer'Image(Similarity));
      -- result : 19457120
   end P2;

   Left, Right : Long_Array;
   Line : String(1..13);
   Left_Number, Right_Number : String(1..5);
   F : File_Type;
begin
   begin
      Open(F, In_File, "input.txt");
   exception
      when Name_Error =>
         Put_Line("File not found: input.txt");
         return;
      when Use_Error =>
         Put_Line("File cannot be opened: input.txt");
         return;
   end;

   for I in 1..Length loop
      begin
         Get(F, Line);
         Left_Number := Line(Line'First..Line'First + 4);
         Right_Number := Line(Line'First + 8..Line'First + 12);
         Put_Line(Left_Number);
         Put_Line(Right_Number);
         Left(I) := Long_Integer'Value(Left_Number);
         Right(I) := Long_Integer'Value(Right_Number);
      exception
         when others =>
            Put_Line("Error reading file");
            Close(F);
            return;
      end;
   end loop;

   Close(F);
   Bubble_Sort(Left);
   Bubble_Sort(Right);

   Print_Array(Left, Right);

   P1(Left, Right);
   P2(Left, Right);

exception
   when E : others =>
      Put_Line("An unexpected error occurred: " & Exception_Message(E));
end Main;
