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
