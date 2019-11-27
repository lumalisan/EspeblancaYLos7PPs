with Ada.Text_IO;
use Ada.Text_IO;
with def_monitor;
use def_monitor;
with Ada.Strings.Unbounded;

procedure BlancaNeus is

   -- Constants
   MAX_NANS : constant Integer := 7;

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
   mon : Monitor;
   nansDormint : Integer := 0;

   -- ** Cos **
   -- Blanca Neus
   task body Blanca is
      My_Idx: Integer;
   begin
      -- En la creación del proceso "Blanca" se ejecuta su start
      accept Start (Idx : in Integer) do
         My_Idx := Idx;
         Put_Line ("BON DIA som na Blancaneus");
      end Start;

      -- Blancanieves no acaba hasta que todos los enanos esten durmiendo
      while nansDormint < MAX_NANS loop
         Put_Line("Blancaneus sen va a fer una passejada");
         delay 1.0;
         while mon.ferMenjar loop
            Put_Line("Blancaneus cuina per un nan");
            delay 1.0;
            mon.menjarUnlock;
         end loop;
      end loop;

      Put_Line("Blancaneus sen va a DORMIR " & nansDormint'Img);

   end Blanca;

   -- Nan
   task body Nan is
      My_Idx : Integer;
      -- max : Integer := 10;
      contMenjades : Integer := 0;
   begin
      accept Start (Idx : in Integer) do
         My_Idx := Idx;
         Put_Line ("BON DIA som en " & Ada.Strings.Unbounded.To_String(noms(My_Idx)));
      end Start;

      while contMenjades < 2 loop
         Put_Line (Ada.Strings.Unbounded.To_String(noms(My_Idx)) & " treballa a la mina");
         delay 1.0;
         Put_Line (Ada.Strings.Unbounded.To_String(noms(My_Idx)) & " espera per una cadira");
         mon.cadiraLock;
         Put_Line (Ada.Strings.Unbounded.To_String(noms(My_Idx)) & " ja seu");
         Put_Line (Ada.Strings.Unbounded.To_String(noms(My_Idx)) & " espera torn per menjar");
         mon.menjarLock;
         Put_Line ("----------------------> " & Ada.Strings.Unbounded.To_String(noms(My_Idx)) & " menja!!!");
         mon.cadiraUnlock;
         contMenjades := contMenjades + 1;
      end loop;

      -- Cuando el enano acaba suma uno al contador de enanos durmiendo
      nansDormint := nansDormint + 1;
      Put_Line (Ada.Strings.Unbounded.To_String(noms(My_Idx)) & " sen va a DORMIR " & nansDormint'Img & "/7");

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
