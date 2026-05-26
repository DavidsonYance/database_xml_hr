xquery version "3.1";

let $db := doc("/db/hr_db/data/hr_db.xml")/hr_database

for $dept in $db/departments/department
(: Contamos cuántos empleados tienen un department_id que coincida con el id del departamento actual :)
let $lista_empleados := $db/employees/employee[department_id = $dept/@id]
let $total := count($lista_empleados)

where $total > 0
order by $total descending

return
    <estadistica_departamento id="{$dept/@id}">
        <nombre>{$dept/department_name/text()}</nombre>
        <total_empleados>{$total}</total_empleados>
    </estadistica_departamento>