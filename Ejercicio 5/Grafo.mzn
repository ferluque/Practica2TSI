% Use this editor as a MiniZinc scratch book
int: NUM_NODOS = 6 ;
int: NUM_ARISTAS = 15 ;
array[1..NUM_ARISTAS,1..2] of int: aristas =[|5 , 6 |1 , 4 |4 , 2 |4 , 6 |3 , 5 |1 , 5 |3 , 2 |1 , 2 |6 , 2 |6 , 1 |2 , 5 |4 , 1 |4 , 6 |1 , 3 |4 , 1 |];

array[1..NUM_ARISTAS] of var int : colores;

constraint
  forall(i in 1..NUM_ARISTAS)(
    forall(j in 1..NUM_ARISTAS)(
      if not ((aristas[i,1]==aristas[j,1] /\ aristas[i,2]==aristas[j,2]) \/ 
      (aristas[i,1]==aristas[j,2] /\ aristas[i,2]==aristas[j,1])) then
        forall(k in 1..2) (
          if aristas[i,1]==aristas[j,k] \/ aristas[i,2]==aristas[j,k] then
            colores[i] != colores[j]
          endif
        )
      endif
    )
  ); 
  
constraint forall(i in colores)(colores[i]>0);
% Aristas repetidas (i,j)(i,j)
constraint
  forall(i in 1..NUM_ARISTAS)(
    forall(j in 1..NUM_ARISTAS)(
      if aristas[i,1]==aristas[j,1] /\ aristas[i,2]==aristas[j,2] then
        colores[i] == colores[j]
      endif
    )
  );
% Aristas repetidas (i,j) (j,i)
constraint
  forall(i in 1..NUM_ARISTAS)(
    forall(j in 1..NUM_ARISTAS)(
      if aristas[i,1]==aristas[j,2] /\ aristas[i,2]==aristas[j,1] then
        colores[i] == colores[j]
      endif
    )
  );

solve minimize max(colores); 
        