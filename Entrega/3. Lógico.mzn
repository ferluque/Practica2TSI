include "globals.mzn";
% Use this editor as a MiniZinc scratch book
set of int : CASAS = 1..5;
array [CASAS] of var CASAS: region;
array [CASAS] of var CASAS: profesion;
array [CASAS] of var CASAS: animal;
array [CASAS] of var CASAS: bebida;
array [CASAS] of var CASAS: color;
% | Característica\Codificación | 1       | 2        | 3           | 4          | 5        |
% | --------------------------- | ------- | -------- | ----------- | ---------- | -------- |
% | Región                      | Andaluz | Vasco    | Catalán     | Gallego    | Navarro  |
% | Profesión                   | pintor  | escultor | diplomático | violinista | médico   |
% | Animal                      | perro   | zorro    | caballo     | caracoles  | CEBRA    |
% | Bebida                      | te      | café     | leche       | zumo       | AGUA     |
% | Color casa                  | rojo    | azul     | blanca      | verde      | amarilla |

% a. Vasco casa roja
constraint
  forall(i in CASAS)(
    if region[i]==2 then color[i]==1 endif
  );
  
% b. El catalán tiene un perro.
constraint
  forall(i in CASAS)(
    if region[i]==3 then animal[i]==1 endif
  );

% c. El gallego es un pintor.
constraint
  forall(i in CASAS)(
    if region[i]==4 then profesion[i]==1 endif
  );
  
% d. El navarro bebe te.
constraint
  forall(i in CASAS)(
    if region[i]==5 then bebida[i]==1 endif
  );
  
% e. El andaluz vive en la primera casa de la izquierda.
constraint region[1]=1;
% f. El de la casa verde bebe café.
constraint
  forall(i in CASAS)(
    if color[i]==4 then bebida[i]==2 endif
  );

% g. La casa verde está al lado de la blanca y a su derecha.
constraint
  forall(i in 1..4)(
    if color[i]==3 then color[i+1]==4 endif
  );

constraint color[5]!=3;

% h. El escultor cría caracoles.
constraint
  forall(i in CASAS)(
    if profesion[i]==2 then animal[i]==4 endif
  );

% i. El diplomático vive en la casa amarilla.
constraint
  forall(i in CASAS)(
    if profesion[i]==3 then color[i]==5 endif
  );

% j. En la casa central se bebe leche.
constraint bebida[3]=3;

% k. La casa del andaluz está al lado de la azul.
% Sería a la izq y la derecha pero por e sabemos que es la segunda
constraint color[2]==2;

% l. El violinista bebe zumo.
constraint
  forall(i in CASAS)(
    if profesion[i]==4 then bebida[i]==4 endif
  );

% m. El zorro está en una casa al lado de la del médico.
constraint
  forall(i in CASAS)(
    if profesion[i]==5 then 
      if i==1 then animal[i+1]=2
      else
        if i==5 then animal[i-1]=2
        else
          animal[i-1]=2 \/ animal[i+1]=2
        endif
      endif
    endif
  );


% n. El caballo está en una casa al lado de la del diplomático.
constraint
  forall(i in CASAS)(
    if profesion[i]==3 then 
      if i==1 then animal[i+1]=3
      else
        if i==5 then animal[i-1]=3
        else
          animal[i-1]=3 \/ animal[i+1]=3
        endif
      endif
    endif
  );
  
%% Obviamente todos diferentes
constraint alldifferent(region);
constraint alldifferent(profesion);
constraint alldifferent(animal);
constraint alldifferent(bebida);
constraint alldifferent(color);

solve satisfy;