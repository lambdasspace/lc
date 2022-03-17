module Prop where

-- Tipo de dato que representa el conjunto de fórmulas atómicas.
data ATOM = Var String
          | Cte Bool

-- Tipo de dato que representa al lenguaje de la lógica 
-- proposicional.
data PROP = FA ATOM
         | Neg PROP
         | Conj PROP PROP
         | Disy PROP PROP
         | Impl PROP PROP
         | Syss PROP PROP

-- Implementación de la función show para el tipo ATOM.
instance Show ATOM where
   show (Var p) = p
   show (Cte c) = show c

-- Implementación de la función show para el tipo PROP.
instance Show PROP where
   show (FA f)     = show f
   show (Neg p)    = "no " ++ show p
   show (Conj p q) = "(" ++ show p ++ " & "  ++ show q ++ ")"
   show (Disy p q) = "(" ++ show p ++ " | "  ++ show q ++ ")"
   show (Impl p q) = "(" ++ show p ++ " -> "  ++ show q ++ ")"
   show (Syss p q) = "(" ++ show p ++ " <-> " ++ show q ++ ")"

-- Número de conectivos de una fórmula proposocional.
con :: PROP -> Int
con (FA _)     = 0
con (Neg p)    = 1 + con p
con (Conj p q) = 1 + con p + con q
con (Disy p q) = 1 + con p + con q
con (Impl p q) = 1 + con p + con q
con (Syss p q) = 1 + con p + con q

-- Sustitución textual
sustTxt :: PROP -> (String, PROP) -> PROP
sustTxt (FA (Cte c)) _ = (FA (Cte c))
sustTxt (FA (Var v)) (x,y) = if v == x then y else (FA (Var v))
sustTxt (Neg p) st = Neg (sustTxt p st)
sustTxt (Conj p q) st = Conj (sustTxt p st) (sustTxt q st)
sustTxt (Disy p q) st = Disy (sustTxt p st) (sustTxt q st)
sustTxt (Impl p q) st = Impl (sustTxt p st) (sustTxt q st)
sustTxt (Syss p q) st = Syss (sustTxt p st) (sustTxt q st)

-- Función que obtiene la lista de variables que figuran en una fórmula proposicional (sin 
-- repeticiones).
vars :: PROP -> [ATOM]
vars p = {- Aquí va su código. -}

-- Función que realiza la sustitución simultánea de n variables proposcionales por n fórmulas.
sustSimult :: PROP -> [(String, PROP)] -> PROP
sustSimult p st = {- Aquí va su código. -}

-- Función que busca el valor de una variable en una lista de estados.     
busca :: String -> [Estado] -> Bool     
busca v [] = False     
busca v ((Var x):xs)         
   | v == x = True         
   | otherwise = busca v xs

-- Función que realiza la interpretación de fórmulas proposicionales.     
interp :: PROP -> [Estado] -> Bool     
interp (FA (Cte c)) _  = c     
interp (FA (Var v)) xs = busca v xs     
interp (Neg p) xs      = not (interp p xs)     
interp (Conj p q) xs   = interp p xs && interp q xs      
interp (Disy p q) xs   = interp p xs || interp q xs     
interp (Impl p q) xs   = not (interp p xs) || interp q xs     
interp (Syss p q) xs   = interp p xs == interp q xs

-- Función que obtiene las sublistas de una lista.
subconjuntos :: [a] -> [[a]]     
subconjuntos []     = [[]]     
subconjuntos (x:xs) = [x:ys | ys <- xss] ++ xss         
   where xss = subconjuntos xs  

-- Función que obtiene los posibles estados de las variables de una 
-- fórmula proposicional.
estados :: PROP -> [[Estado]]     
estados p = subconjuntos (vars p)

-- Lista de modelos de una fórmula proposicional.
modelos :: PROP -> [[Estado]]
modelos f = [i | i <- estados f, interp f i == True]

-- Indica si una fórmula proposocional es una tautología.
esTautologia :: PROP -> Bool
esTautologia p = {- Aquí va su código. -}

-- Indica si una fórmula proposocional es satisfacible.
esSatisfacible :: PROP -> Bool
esSatisfacible p = {- Aquí va su código. -}

-- Indica si una fórmula proposocional es una contradicción .
esContradiccion :: PROP -> Bool
esContradiccion p = {- Aquí va su código. -}

