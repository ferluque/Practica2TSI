% Use this editor as a MiniZinc scratch book
% b. Existen 9 asignaturas con horas a la semana:
set of int : HORAS_SEMANALES = {4,2,4,4,4,2,2,2,1};
set of int : HORAS_DIA = 1..6;
set of int : DIAS_SEMANA = 1..7;
% a. existe un aula disponible en seis franjas consecutivas
array [HORAS_DIA,DIAS_SEMANA] of var 0..9: horario;
% c.

% d. 
