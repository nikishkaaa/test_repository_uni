SELECT t.order_id,
       t.amount, 
       t.status, 
       psp.name, 
       c.iso_code, 
       pc.bin_country
FROM transactions AS t
JOIN (SELECT *
      FROM refunds
      UNION 
      SELECT *
      FROM chargebacks)
AS sub ON t.order_id = sub.order_id
LEFT JOIN psp ON t.order_id = psp.Id
LEFT JOIN Payment_credentials AS pc ON t.order_id = pc.id
LEFT JOIN Currencies AS c ON t.order_id = c.id
ORDER BY order_id;