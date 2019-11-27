with Ada.Text_IO;
use Ada.Text_IO;

package body def_monitor is

   protected body Monitor is
      entry cadiraLock when (contCadires < 4) is
      begin
         contCadires := contCadires + 1;
      end cadiraLock;

      procedure cadiraUnlock is
      begin
         contCadires := contCadires - 1;
      end cadiraUnlock;

      entry menjarLock when (potsMenjar = False) is
      begin
         potsMenjar := True;
      end menjarLock;

      procedure menjarUnlock is
      begin
         potsMenjar := False;
      end menjarUnlock;

      function ferMenjar return Boolean is
      begin
         return contCadires > 0;
      end ferMenjar;

    end Monitor;

end def_monitor;
