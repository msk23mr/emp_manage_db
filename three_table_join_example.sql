select * 
from (employees inner join prefectures as froms on employees.emp_from = froms.prefecture_id)
inner join (divisions inner join prefectures as locations on divisions.divition_location = locations.prefecture_id)
on employees.emp_division = divisions.division_id;