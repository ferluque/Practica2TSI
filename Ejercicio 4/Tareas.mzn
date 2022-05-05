% Use this editor as a MiniZinc scratch book
% Matriz de duraciones de cada tarea [tarea, trabajador]
%% ELEMENTOS REALES
set of int : TAREAS = 1..9;
set of int : TRABAJADORES = 1..3;
% array [TAREAS, TRABAJADORES] of int : DURACIONES = 
% [|4,7,10 ,2,4,5
%  | 3,5,7 ,2,3,4
%  | 3,1,4 ,2,1,2
%  | 2,5,8 ,1,3,4
%  | 4,2,6 ,2,1,3
%  | 3,2,1 ,2,1,1
%  | 1,2,3 ,1,1,2
%  | 1,3,5 ,1,2,3
%  | 2,3,4 ,1,2,2|];
array [TAREAS,TRABAJADORES] of int : DURACIONES = 
[|4,7,10
 |3,5,7
 |3,1,4
 |2,5,8
 |4,2,6
 |3,2,1
 |1,2,3
 |1,3,5
 |2,3,4
 |];
% La solución vendrá dada por un diagrama de Gantt en el que el inicio de la tarea viene marcado por el carácter del número del trabajador y los siguientes DURACIONES[tarea, trabajador]-1 casillas se marcarán como ocupadas por -1
int : MAXIMO = 10+7+4+8+6+3+3+5+4;
set of int : DIAS = 1..MAXIMO;
array[TAREAS,DIAS] of var 0..3 : diagrama;
var int : end;

% % ELEMENTOS DE PRUEBA
% set of int : TAREAS = 1..4;
% set of int : TRABAJADORES =  1..3;
% array [TAREAS, TRABAJADORES] of int : DURACIONES = 
% [|4,3,5 | 
%   3,5,4 | 
%   3,1,4 | 
%   2,5,4|];
% int : MAXIMO = 5+5+4+5;
% set of int : DIAS = 1..MAXIMO;
% array [TAREAS, DIAS] of var 0..3 : diagrama; %0 trabajando el que marque la última casilla, -1 libre, 1..3 el dia de comienzo del trabajador
  
% siempre que un trabajador empiece está trabajando en esa tarea hasta que termine (no empieza ningún otro trabajo):
constraint
  forall(tarea in TAREAS)(
    forall(dia in DIAS)(
      forall(trabajador in TRABAJADORES)(
        if diagrama[tarea,dia]==trabajador then
          forall(siguientes in 1..(DURACIONES[tarea,trabajador]-1))(
            if (dia+siguientes)<=MAXIMO then
              diagrama[tarea,dia+siguientes]==0
            endif
          )
        endif
      )
    )
  );
      
%% Un trabajador no trabaja en dos sitios a la vez     
constraint
  forall(tarea in TAREAS, dia in DIAS)(
    forall(trabajador in TRABAJADORES)(
      if diagrama[tarea,dia]==trabajador then
        forall(tarea2 in TAREAS)(
          if tarea2!=tarea then
            forall(siguientes in 0..(DURACIONES[tarea,trabajador]-1))(
              if (dia+siguientes)<=MAXIMO then
                diagrama[tarea2,dia+siguientes]!=trabajador
              endif
            )
          endif
        )
      endif
    )
  );
% Todas las tareas deben ser realizadas
constraint
  forall(tarea in TAREAS)((count(row(diagrama,tarea),1)+count(row(diagrama,tarea),2)+count(row(diagrama,tarea),3))+count(row(diagrama,tarea),3)==1);

% Requisitos previos
% Cuenta las apariciones de las veces que se ha realizado el trabajo w en los días anteriores a day
predicate worked (array [int,int] of var int : d, var int : w, int : day) =
% tiene que haber empezado el trabajo algún trabajador y que ya haya terminado
  exists(i in 1..day)((d[w,i]!=0)/\(day-i)>=DURACIONES[w,d[w,i]]);
  
% % B necesita A
constraint forall(dia in DIAS)(if diagrama[2, dia]!=0 then worked(diagrama,1,dia)endif);
      
% % C necesita B
constraint forall(dia in DIAS)(if diagrama[3, dia]!=0 then worked(diagrama,2,dia)endif);  

% % D necesita A, 4 necesita 1
constraint forall(dia in DIAS)(if diagrama[4, dia]!=0 then worked(diagrama,1,dia)endif); 

% % E necesita C y D, 5 necesita 3 y 4
constraint forall(dia in DIAS)(
    if diagrama[5, dia]!=0 then 
      worked(diagrama,3,dia)/\worked(diagrama,4,dia)
    endif
  );  
constraint forall(dia in DIAS)(
    if diagrama[6, dia]!=0 then 
      worked(diagrama,3,dia)/\worked(diagrama,4,dia)
    endif
  ); 
constraint forall(dia in DIAS)(
    if diagrama[7, dia]!=0 then 
      worked(diagrama,3,dia)/\worked(diagrama,4,dia)
    endif
  );       

% % H necesita A, 8 necesita 1
constraint forall(dia in DIAS)(if diagrama[8, dia]!=0 then worked(diagrama,1,dia)endif);

% % I necesita F y H, 9 necesita 6 y 8
constraint forall(dia in DIAS)(if diagrama[9, dia]!=0 then worked(diagrama,6,dia) /\ worked(diagrama,8,dia) endif);

constraint
  forall(tarea in TAREAS,dia in DIAS)(
    if diagrama[tarea,dia]!=0 then
      end >= dia+DURACIONES[tarea,diagrama[tarea,dia]]-1
    endif
  );
  
% Trabajador de apoyo: La codificación pasa a ser:
% * 4: Trabajador 1 con apoyo
% * 5: Trabajador 2 con apoyo
% * 6: Trabajador 3 con apoyo
  
solve minimize end;