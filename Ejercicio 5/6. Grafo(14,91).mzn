% -----------------seed( 0 )-------------------
int: NUM_NODOS = 14 ;
int: NUM_ARISTAS = 91 ;
array[1..NUM_ARISTAS,1..2] of int: aristas =[|13 , 6 |1 , 4 |12 , 4 |8 , 10 |4 , 6 |3 , 5 |8 , 7 |9 , 13 |11 , 2 |7 , 8 |8 , 9 |2 , 6 |10 , 14 |9 , 10 |5 , 4 |1 , 4 |6 , 1 |3 , 4 |9 , 2 |4 , 14 |4 , 8 |1 , 2 |10 , 1 |11 , 5 |8 , 4 |12 , 3 |8 , 13 |3 , 1 |1 , 5 |6 , 7 |9 , 5 |2 , 5 |10 , 11 |11 , 9 |2 , 8 |10 , 4 |7 , 8 |12 , 3 |12 , 1 |4 , 6 |13 , 10 |11 , 5 |12 , 5 |7 , 5 |5 , 4 |13 , 5 |5 , 9 |5 , 4 |11 , 8 |14 , 6 |6 , 1 |2 , 6 |10 , 4 |1 , 6 |1 , 2 |3 , 5 |3 , 1 |14 , 4 |3 , 11 |14 , 1 |8 , 6 |10 , 1 |11 , 3 |12 , 11 |8 , 12 |3 , 10 |3 , 4 |12 , 4 |3 , 4 |5 , 2 |3 , 12 |10 , 11 |2 , 5 |11 , 7 |12 , 9 |12 , 3 |4 , 1 |1 , 7 |1 , 7 |4 , 11 |4 , 9 |13 , 9 |14 , 9 |14 , 3 |4 , 3 |12 , 14 |1 , 9 |9 , 4 |9 , 11 |3 , 9 |5 , 4 |];

% % -----------------seed( 1 )-------------------
% int: NUM_NODOS = 14 ;
% int: NUM_ARISTAS = 91 ;
% array[1..NUM_ARISTAS,1..2] of int: aristas =[|6 , 12 |13 , 9 |10 , 12 |6 , 1 |1 , 2 |13 , 8 |14 , 13 |7 , 10 |3 , 5 |6 , 3 |5 , 12 |13 , 11 |13 , 14 |3 , 5 |8 , 10 |2 , 8 |1 , 7 |14 , 10 |10 , 8 |14 , 7 |10 , 2 |1 , 13 |2 , 9 |9 , 14 |4 , 11 |10 , 9 |8 , 4 |7 , 6 |2 , 10 |4 , 5 |9 , 2 |12 , 13 |11 , 5 |1 , 14 |4 , 10 |3 , 1 |5 , 10 |3 , 8 |8 , 11 |10 , 9 |7 , 10 |4 , 8 |8 , 14 |5 , 12 |6 , 10 |4 , 7 |9 , 1 |3 , 11 |8 , 10 |8 , 4 |13 , 11 |1 , 9 |8 , 2 |2 , 14 |4 , 1 |9 , 14 |14 , 7 |5 , 6 |7 , 3 |13 , 12 |6 , 12 |8 , 14 |9 , 12 |13 , 12 |5 , 8 |8 , 14 |5 , 10 |1 , 13 |3 , 1 |14 , 11 |8 , 13 |2 , 8 |10 , 9 |11 , 13 |5 , 1 |13 , 2 |13 , 10 |9 , 3 |4 , 2 |3 , 13 |13 , 8 |3 , 11 |7 , 1 |10 , 3 |7 , 3 |8 , 1 |7 , 6 |2 , 11 |5 , 7 |1 , 7 |6 , 14 |];

% % -----------------seed( 2 )-------------------
% int: NUM_NODOS = 14 ;
% int: NUM_ARISTAS = 91 ;
% array[1..NUM_ARISTAS,1..2] of int: aristas =[|9 , 14 |9 , 7 |12 , 3 |12 , 9 |8 , 3 |2 , 12 |6 , 11 |5 , 13 |5 , 6 |8 , 4 |7 , 5 |11 , 12 |4 , 8 |7 , 11 |2 , 11 |13 , 4 |6 , 9 |5 , 7 |4 , 10 |3 , 1 |5 , 13 |3 , 5 |11 , 2 |8 , 9 |3 , 14 |11 , 10 |14 , 9 |8 , 2 |7 , 9 |11 , 6 |10 , 13 |11 , 4 |1 , 12 |1 , 11 |3 , 9 |13 , 11 |9 , 3 |13 , 10 |7 , 6 |7 , 4 |9 , 3 |2 , 5 |9 , 2 |14 , 7 |10 , 14 |6 , 2 |3 , 5 |11 , 8 |7 , 12 |5 , 6 |11 , 9 |11 , 4 |12 , 1 |1 , 6 |8 , 12 |6 , 12 |14 , 1 |9 , 7 |11 , 6 |12 , 2 |14 , 11 |8 , 12 |5 , 4 |7 , 12 |2 , 5 |11 , 12 |1 , 9 |11 , 6 |13 , 5 |12 , 3 |10 , 8 |2 , 10 |3 , 2 |12 , 1 |8 , 2 |9 , 13 |12 , 10 |12 , 1 |8 , 1 |6 , 12 |11 , 3 |6 , 11 |2 , 4 |14 , 13 |4 , 2 |9 , 12 |7 , 9 |12 , 2 |12 , 6 |12 , 8 |1 , 10 |];

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
       
output["colores={"];
output[show(colores[i])++"," | i in 1..NUM_ARISTAS];
output["}"];
output["\n" ++ "Cantidad de colores: " ++ show(max(colores))];
 