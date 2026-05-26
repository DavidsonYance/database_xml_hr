xquery version "3.1";

(: Definimos la ruta del documento dentro de tu colección en eXist-db :)
let $db := doc("/db/hr_db/data/hr_db.xml")/hr_database

for $job in $db/jobs/job
where $job/max_salary >= 15000
order by $job/max_salary descending

return
    <puesto_top id="{$job/@id}">
        <titulo>{$job/job_title/text()}</titulo>
        <salario_maximo>{$job/max_salary/text()}</salario_maximo>
    </puesto_top>