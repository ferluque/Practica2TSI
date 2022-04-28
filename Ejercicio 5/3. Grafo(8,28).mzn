% % -----------------seed( 0 )-------------------
% int: NUM_NODOS = 8 ;
% int: NUM_ARISTAS = 28 ;
% array[1..NUM_ARISTAS,1..2] of int: aristas =[|5 , 8 |6 , 1 |4 , 8 |2 , 4 |6 , 3 |5 , 8 |7 , 1 |1 , 5 |3 , 2 |7 , 8 |8 , 7 |1 , 2 |6 , 2 |6 , 1 |2 , 5 |4 , 1 |4 , 6 |7 , 8 |8 , 1 |3 , 4 |1 , 2 |4 , 6 |4 , 7 |8 , 1 |2 , 8 |1 , 8 |3 , 5 |8 , 4 |];

%% -----------------seed( 1 )-------------------
% int: NUM_NODOS = 8 ;
% int: NUM_ARISTAS = 28 ;
% array[1..NUM_ARISTAS,1..2] of int: aristas =[|6 , 4 |5 , 1 |8 , 2 |4 , 6 |8 , 1 |1 , 2 |5 , 8 |6 , 5 |7 , 2 |3 , 5 |7 , 6 |3 , 5 |4 , 5 |3 , 5 |6 , 7 |3 , 5 |8 , 2 |2 , 8 |7 , 1 |7 , 6 |2 , 8 |8 , 6 |7 , 2 |2 , 1 |5 , 2 |1 , 6 |4 , 8 |3 , 2 |];

%% -----------------seed( 2 )-------------------
int: NUM_NODOS = 8 ;
int: NUM_ARISTAS = 28 ;
array[1..NUM_ARISTAS,1..2] of int: aristas =[|1 , 8 |6 , 1 |7 , 4 |3 , 4 |1 , 8 |3 , 2 |8 , 4 |6 , 8 |8 , 3 |5 , 6 |8 , 4 |7 , 5 |3 , 4 |4 , 8 |7 , 3 |2 , 3 |5 , 8 |4 , 6 |1 , 5 |7 , 8 |4 , 2 |8 , 3 |1 , 5 |7 , 5 |3 , 5 |3 , 8 |8 , 2 |8 , 7 |];

array[1..NUM_ARISTAS] of var int : colores;
var int : cantidad;

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

constraint 
  cantidad==max(colores);

solve minimize max(colores); 
       
output["colores={"];
output[show(colores[i])++"," | i in 1..NUM_ARISTAS];
output["}"];
output["\n" ++ "Cantidad de colores: " ++ show(max(colores))];
