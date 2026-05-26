xquery version "3.1";

let $db := doc("/db/hr_db/data/hr_db.xml")/hr_database

for $emp in $db/employees/employee
let $dept := $db/departments/department[@id = $emp/department_id]
let $loc := $db/locations/location[@id = $dept/location_id]
let $country := $db/countries/country[@id = $loc/country_id]

order by $country/country_name, $emp/last_name

return
    <localizacion_laboral>
        <empleado>{concat($emp/first_name, ' ', $emp/last_name)}</empleado>
        <departamento>{$dept/department_name/text()}</departamento>
        <ciudad>{$loc/city/text()}</ciudad>
        <pais>{$country/country_name/text()}</pais>
    </localizacion_laboral>