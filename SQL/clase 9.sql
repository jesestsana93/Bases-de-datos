--Clientes que tienen solo una cuenta en la sucursal PENJAMO
select distinct nombrecliente
from ctacliente t
where (select count(r.numcta)
       from ctacliente r join cuenta s on 
             r.numcta = s.numcta and
             nombresucursal = 'PENJAMO' and
             nombrecliente = t.nombrecliente) = 1;

--Join externo por la izquierda
select *
from ctacliente natural left outer join prestatario;

--Si solo quisiera clientes que tienen cuenta           
select *
from ctacliente natural left outer join prestatario
where numprestamo is null;

--Join externo por la derecha
select *
from ctacliente natural right outer join prestatario;

--Join externo completo
--Join externo por la derecha
select *
from ctacliente natural full outer join prestatario;

--
select nombrecliente,numcta,saldo,
case
	when saldo > 20000 and saldo <= 100000
		then 'T.C. Clasica'
	when saldo > 100000 and saldo <= 200000
		then 'T.C. Premium'
	when saldo > 200000 then 'T.C. Oro'
	else 'Cliente mortal'
end as tipo_tarjeta
from cuenta natural join ctacliente
order by tipo_tarjeta;	