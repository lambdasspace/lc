module Ejemplo where

import Prop

-- Variables

-- Las estrellas emiten luz.
p = (FA (Var "p"))
-- Los planetas reflejan luz.
q = (FA (Var "q"))
-- Los planetas giran al rededor de las estrellas.
r = (FA (Var "r"))

-- Especificación formal

-- Si las estrellas emiten luz, entonces los planetas la reflejan 
-- y giran alrededor de ellas.
expr1 = Impl p (Conj q r)

-- Las estrellas emiten luz o los planetas la reflejan y, por otra 
-- parte, los planetas giran al rededor de ellas.
expr2 = Conj (Disy p q) r

-- Los planetas reflejan luz si y sólo si las estrellas la emiten y 
-- los planetas giran al rededor de ellas.
expr3 = Syss q (Conj p r)

-- Si no es cierto que las estrellas emiten luz y que los planetas 
-- la reflejan, entonces éstos no giran al rededor de ellas.
expr4 = Impl (Neg (Conj p q)) (Neg r)
