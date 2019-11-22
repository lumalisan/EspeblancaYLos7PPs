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

		entry put_honey when (jar < MAX) is
		begin
			jar := jar + 1;
			Put_Line("jar "&jar'Img&"/"&MAX'Img);
		end put_honey;
	end Monitor;

end def_monitor;