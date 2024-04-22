EXISTS co, ty, pr, mo, t,
co1, ty1, pr1, mo1, t1,
mo2, t2, co2, t2, ty2, pr2,
mo3, co3, ty3, pr3.
(Product (ma, mo, t)
AND
Printer(mo, co, ty, pr))
AND
(Product (ma, mo1, t)
AND
Printer(mo1, co1, ty1, pr1))
AND
(Product (ma, mo2, t)
AND
Printer(mo2, co2, ty2, pr2))
AND NOT
ty = ty1 AND NOT ty1 = ty2 AND NOT ty2 = ty
