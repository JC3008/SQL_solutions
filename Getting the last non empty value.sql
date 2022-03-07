

with CTE as (

SELECT 
ID,
[Product_line],
count([Product_line]) over (order by ID) as Count_Product_line,
[Unit_price],
[Quantity],
[Total],
[Date]

FROM getting_last_non_empty_row_example

)
select


first_value([Product_line]) 
over (partition by Count_Product_line 
order by ID) as [NEW_Product_line],

CTE.*

from CTE


