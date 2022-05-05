set of int : TRABAJADORES = 1..3;
set of int : TAREAS = 1..9;

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
int : MAXIMO = 10+7+4+8+6+3+3+5+4;
  
set of int : DIAS = 1..MAXIMO;
array[TAREAS] of var DIAS: inicios;
array[TAREAS] of var DIAS: fines;
array[TAREAS] of var 1..3: trabajadores;

% Trabajador extra
array[TAREAS] of var 0..1 : extra;

% establecer duraciones
constraint
  forall(tarea in TAREAS)(
    % Se incluye el trabajador extra que resta 2 si extra[tarea]==1
    % La restricción siguiente se encarga de que no se asigne trabajador extra a las que duren menos de 3
    fines[tarea] = inicios[tarea]+DURACIONES[tarea,trabajadores[tarea]]- 2*extra[tarea]-1
  );

% Establece que las tareas que duren menos de 3 dias no se les asigna trabajador extra
constraint
  forall(tarea in TAREAS)(
    if (DURACIONES[tarea,trabajadores[tarea]])<3 then
      extra[tarea]=0
    endif
  );

% el trabajador extra no trabaja en dos sitios a al vez
constraint
  forall(tarea in TAREAS)(
    if extra[tarea]==1 then
      forall(tarea2 in TAREAS)(
        if (tarea!=tarea2)/\(extra[tarea2]==1) then
          (inicios[tarea]>fines[tarea2])\/
          (inicios[tarea2]>fines[tarea])
        endif
      )
    endif
  );

% No empezar una tarea si no da tiempo ode acabarla
constraint 
  forall(tarea in TAREAS)(
    inicios[tarea]<=(MAXIMO-DURACIONES[tarea,trabajadores[tarea]]));
  
% NO se pisan los trabajos
constraint
  forall(tarea in TAREAS)(
    forall(tarea2 in TAREAS)(
      if (tarea!=tarea2)/\(trabajadores[tarea]==trabajadores[tarea2]) then
        (inicios[tarea]>fines[tarea2])\/
        (inicios[tarea2]>fines[tarea])
      endif
    )
  );
  
% Restricciones
% B, D y H necesitan A
constraint 
  forall(i in {2,4,8})(
    inicios[i]>fines[1]
  );
% % C necesita B
constraint inicios[3]>fines[2];

% % E,F,G necesitan C y D
constraint
  forall(i in {5,6,7})(
    inicios[i]>fines[3] /\ inicios[i]>fines[4]
  );
  
% % I necesita F y H
constraint 
  inicios[9]>fines[6] /\ inicios[9]>fines[8];

solve minimize max(i in TAREAS)(fines[i]);