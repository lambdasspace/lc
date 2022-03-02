module Ejercicios03 where

{- =================================================================================================
 
En los siguientes ejercicios se hace uso del tipo de dato definido para árboles binarios con valores
en las hojas. Se muestra a continuación la definición.

================================================================================================= -}

data ArbolB a = HojaB a
              | NodoB (ArbolB a) (ArbolB a)
              deriving Show

{- =================================================================================================
 
Por ejemplo, el siguiente árbol de número enteros (Int).

    ·
   / \
  /   \
 ·     ·
/ \   / \
1 4   6 9

se representa por

NodoB (NodoB (HojaB 1) (HojaB 4))
      (NodoB (HojaB 6) (HojaB 9))

================================================================================================= -}

{- =================================================================================================
 
Ejercicio 1. Completar el cuerpo de la función numeroHojas que obtiene el número de hojas del árbol a.

================================================================================================= -}

-- Función que obtiene el número de hojas de un árbol.
numeroHojas :: ArbolB a -> Int
numeroHojas a = {- Aquí va su código. -}

{- =================================================================================================
 
Ejercicio 2. Se dice que un árbol de este tipo es balanceado si es una hoja o bien si para cada nodo se
tiene que el número de hojas de cada uno de los subárboles difiere como máximo en uno y sus subárboles
son balanceados. Completar el cuerpo de la función esBalanceado que indica si un árbol es balanceado.

================================================================================================= -}

-- Función que indica si un árbol es balanceado.
esBalanceado :: ArbolB a -> Bool
esBalanceado a = {- Aquí va su código. -}

{- =================================================================================================
 
Ejercicio 3. Completar el cuerpo de la función aplana que dado un árbol de este tipo, genera una lista
cuyos elementos se encuentran ordenados en inorden.

================================================================================================= -}

-- Función que aplana un árbol.
aplana :: ArbolB a -> [a]
aplana a = {- Aquí va su código. -}
