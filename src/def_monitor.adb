with Ada.Text_IO;
use Ada.Text_IO;

package body def_monitor is

   protected body Monitor is
      entry menjar when (assegut = true and servit = true) is
      begin
         Put_Line("--------------> {Nombre Enano} Menjant!!!");
         assegut := false;
         servit := false;
      end menjar;

      entry fer_menjar when True is
      begin
         null;
      end fer_menjar;

    end Monitor;

end def_monitor;
