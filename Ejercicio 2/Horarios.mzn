% Use this editor as a MiniZinc scratch book
% b. Existen 9 asignaturas con horas a la semana:
% COMO HAGO QUE NO SE ELIMINEN LOS REPETIDOS
set of int : HORAS_SEMANALES = {5,4,2,4,4,4,2,2,2,1};
set of int : HORAS_DIA = 1..6;
set of int : DIAS_SEMANA = 1..5;
set of int : UNAHORA = {2,6,7,9,0};
set of int : DOSHORAS = {1,3,4,5,8};
set of int : ASIGNATURAS = 0..9;

set of int : P1={1,3};
set of int : P2={4,5};
set of int : P3={6,9};
% a. existe un aula disponible en seis franjas consecutivas
array [HORAS_DIA,DIAS_SEMANA] of var ASIGNATURAS: horario;
% b. Número máximo de horas
% constraint forall(asig in ASIGNATURAS)(count(i in HORAS_DIA, j in DIAS_SEMANA)(horario[i,j]==1)==HORAS_SEMANALES[asig]);
constraint count(i in HORAS_DIA, j in DIAS_SEMANA)(horario[i,j]==1)==4;
constraint count(i in HORAS_DIA, j in DIAS_SEMANA)(horario[i,j]==2)==2;
constraint count(i in HORAS_DIA, j in DIAS_SEMANA)(horario[i,j]==3)==4;
constraint count(i in HORAS_DIA, j in DIAS_SEMANA)(horario[i,j]==4)==4;
constraint count(i in HORAS_DIA, j in DIAS_SEMANA)(horario[i,j]==5)==4;
constraint count(i in HORAS_DIA, j in DIAS_SEMANA)(horario[i,j]==6)==2;
constraint count(i in HORAS_DIA, j in DIAS_SEMANA)(horario[i,j]==7)==2;
constraint count(i in HORAS_DIA, j in DIAS_SEMANA)(horario[i,j]==8)==2;
constraint count(i in HORAS_DIA, j in DIAS_SEMANA)(horario[i,j]==9)==1;

% c. En solitario las de UNAHORA
constraint
  forall(dia in DIAS_SEMANA)(
    forall(hora in 2..5)(
      if horario[hora,dia] in UNAHORA then
        horario[hora-1,dia]!=horario[hora,dia] /\ horario[hora+1,dia]!=horario[hora,dia]
      endif
    )
  );
% De dos en dos las de DOSHORAS
constraint
  forall(dia in DIAS_SEMANA)(
    forall(hora in HORAS_DIA)(
      if horario[hora,dia] in DOSHORAS then
        if hora==1 then
          (horario[hora,dia]==horario[hora+1,dia]/\horario[hora,dia]!=horario[hora+2,dia])
        else      
          if hora==6 then
            (horario[hora,dia]==horario[hora-1,dia]/\horario[hora,dia]!=horario[hora-2,dia])
          else
            if hora==2 then
              horario[hora,dia]==horario[hora-1,dia]
            else
              if hora==5 then
                horario[hora,dia]==horario[hora+1,dia]
              else
                (horario[hora,dia]==horario[hora+1,dia]/\horario[hora,dia]!=horario[hora+2,dia])\/
                (horario[hora,dia]==horario[hora-1,dia]/\horario[hora,dia]!=horario[hora-2,dia])
              endif
            endif
          endif
        endif
      endif
    )
  );
% d. En cada día de la semana un bloque
% Los de una hora
constraint
  forall(dia in DIAS_SEMANA)(
    forall(hora in HORAS_DIA) (
      if horario[hora,dia] in UNAHORA then
        count(i in HORAS_DIA)(horario[i,dia]=horario[hora,dia])==1
      else
        count(i in HORAS_DIA)(horario[i,dia]=horario[hora,dia])==2
      endif
    )
  );
  
% e,f. Profesores  
constraint
  forall(dia in DIAS_SEMANA)(
    count(hora in HORAS_DIA)(horario[hora,dia] in P1)<=2
  );
  
constraint
  forall(dia in DIAS_SEMANA)(
    count(hora in HORAS_DIA)(horario[hora,dia] in P2)<=2
  );
 
 constraint
  forall(dia in DIAS_SEMANA)(
    count(hora in HORAS_DIA)(horario[hora,dia] in P3)<=1
  );
% g. recreo
constraint
  forall(dia in DIAS_SEMANA)(
    horario[4,dia]==0
   );
   
% h. P1 dos últimas horas
constraint 
  forall(dia in DIAS_SEMANA)(
    forall(hora in 1..4)(
      not (horario[hora,dia] in P1)
    )
  );
  
% P2 dos primeras horas
constraint
  forall(dia in DIAS_SEMANA)(
    forall(hora in 3..6)(
      not (horario[hora,dia] in P2)
    )
  );
% P3 solo antes del recreo
constraint
  forall(dia in DIAS_SEMANA)(
    forall(hora in {1,2,4,5,6})(
      not (horario[hora,dia] in P3)
    )
  );

%i.
% A1 lunes o martes
constraint
  forall(dia in 3..5)(
    forall(hora in HORAS_DIA)(
      horario[hora,dia]!=1
    )
  );
% A3 miercoles o jueves
constraint
  forall(dia in {1,2,5})(
    forall(hora in HORAS_DIA)(
      horario[hora,dia]!=3
    )
  );
  
% % A4 lunes o martes
constraint
  forall(dia in 3..5)(
    forall(hora in HORAS_DIA)(
      horario[hora,dia]!=4
    )
  );

% % A5 jueves o viernes
constraint
  forall(dia in 1..3)(
    forall(hora in HORAS_DIA)(
      horario[hora,dia]!=5
    )
  );
 
% %A6 miércoles o viernes
constraint
  forall(dia in {1,2,4})(
    forall(hora in HORAS_DIA)(
      horario[hora,dia]!=6
    )
  );
  
% %A7 martes o viernes
constraint
  forall(dia in {1,3,4})(
    forall(hora in HORAS_DIA)(
      horario[hora,dia]!=7
    )
  );
  
% % A8 miércoles
constraint
  forall(dia in {1,2,4,5})(
    forall(hora in HORAS_DIA)(
      horario[hora,dia]!=8
    )
  );
% % A9 lunes
constraint
  forall(dia in 2..5)(
    forall(hora in HORAS_DIA)(
      horario[hora,dia]!=9
    )
  );
solve satisfy;
