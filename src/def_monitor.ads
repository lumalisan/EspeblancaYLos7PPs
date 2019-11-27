package def_monitor is

   protected type Monitor is
      entry cadiraLock;
      procedure cadiraUnlock;
      entry menjarLock;
      procedure menjarUnlock;
      function ferMenjar return Boolean;

   private
      contCadires : Integer := 0;
      potsMenjar : Boolean := False;
   end Monitor;

end def_monitor;
