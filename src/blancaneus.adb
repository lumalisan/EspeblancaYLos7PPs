with Ada.Text_IO;
use Ada.Text_IO;
with def_monitor;
use def_monitor;
with Ada.Strings.Unbounded;

procedure BlancaNeus is

   MAX_NANS : constant Integer := 7;

   mon : Monitor;

   -- ** Especificacio **
   -- Blanca Neus
   task type Blanca is
      entry Start (Idx: in Integer);
   end Blanca;

   -- Nan
   task type Nan is
      entry Start (Idx: in Integer);
   end Nan;

   -- ** Variables **
   type a_nans is array (1..MAX_NANS) of Nan;
   type a_noms is array (1..MAX_NANS) of Ada.Strings.Unbounded.Unbounded_String;
   noms : a_noms;
   n : a_nans;
   b: Blanca;

   -- ** Cos **
   -- Blanca Neus
   task body Blanca is
      My_Idx: Integer;
   begin
      accept Start (Idx : in Integer) do
         My_Idx := Idx;
         Put_Line ("BON DIA som na Blancaneus");
      end Start;

      Put_Line("Blancaneus sen va a fer una passejada");


   end Blanca;

   -- Nan
   task body Nan is
      My_Idx : Integer;
      -- max : Integer := 10;
   begin
      accept Start (Idx : in Integer) do
         My_Idx := Idx;
         Put_Line ("BON DIA som en " & Ada.Strings.Unbounded.To_String(noms(Idx)));
      end Start;

      Put_Line (Ada.Strings.Unbounded.To_String(noms(My_Idx)) & " treballa a la mina");


   end Nan;

begin
   noms(1) := Ada.Strings.Unbounded.To_Unbounded_String("Mudet");
   noms(2) := Ada.Strings.Unbounded.To_Unbounded_String("Esternuts");
   noms(3) := Ada.Strings.Unbounded.To_Unbounded_String("Dormilega");
   noms(4) := Ada.Strings.Unbounded.To_Unbounded_String("Vergonyos");
   noms(5) := Ada.Strings.Unbounded.To_Unbounded_String("Felis");
   noms(6) := Ada.Strings.Unbounded.To_Unbounded_String("Rondinaire");
   noms(7) := Ada.Strings.Unbounded.To_Unbounded_String("Savi");
   b.Start(0);
   for Idx in 1..MAX_NANS loop
      n(Idx).Start(Idx);
   end loop;
end BlancaNeus;
