xquery version "3.1";

let $db := doc("/db/hr_db/data/hr_db.xml")/hr_database

for $emp in $db/employees/employee
(: Hacemos el JOIN uniendo el department_id del empleado con el atributo id del departamento :)
let $dept := $db/departments/department[@id = $emp/department_id]

order by $emp/last_name

return
    <asignacion_empleado>
        <nombre_completo>{concat($emp/first_name, ' ', $emp/last_name)}</nombre_completo>
        <email>{$emp/email/text()}</email>
        <departamento>{$dept/department_name/text()}</departamento>
    </asignacion_empleado>