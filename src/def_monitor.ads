package def_monitor is

   protected type Monitor is
      entry menjar;
      entry fer_menjar;

   private
      cadires : Integer := 4;
      menjades : Integer := 2;
      assegut : Boolean := false;
      servit : Boolean := false;
   end Monitor;

end def_monitor;
