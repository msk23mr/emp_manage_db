select
E.emp_id as id,
E.emp_password as password,
E.emp_name as name,
E.emp_gender as gender,
E.emp_birth as birth,
F.prefecture_name as `form`,
D.division_name as division
from employees as E

join prefectures as F
on E.emp_from = F.prefecture_id

join divisions as D
on E.emp_division = D.division_id
