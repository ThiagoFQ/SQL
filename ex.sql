-- 1
-- Imprimir o campo company_name. 
-- Encontrear o número de corridas de táxi para cada empresa de táxi de 15 a 16 de novembro de 2017, nomear o campo resultante como trips_amount e imprimí-lo. 
-- Classificar os resultados pelo campo trips_amount em ordem decrescente.

SELECT
    cabs.company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
    INNER JOIN 
    trips 
    ON 
    trips.cab_id = cabs.cab_id
WHERE 
    CAST(trips.start_ts AS date) BETWEEN '2017-11-15' AND '2017-11-16'
GROUP BY 
    company_name
ORDER BY 
    trips_amount DESC;
    

-- 2
-- Encontrar o número de corridas para cada empresa de táxi cujo nome contém as palavras "Yeloow" ou "Blue" de 1 a 7 de novembro de 2017. 
-- Nomear a variável resultante como trips_amount. 
-- Agrupar os resultados pelo campo company_name.

SELECT
    cabs.company_name as company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
INNER JOIN 
    trips 
ON 
    trips.cab_id = cabs.cab_id
WHERE 
    CAST(trips.start_ts AS date) BETWEEN '2017-11-01' AND '2017-11-07'
    AND cabs.company_name LIKE '%%Yellow%%'
GROUP BY company_name
UNION ALL
SELECT
    cabs.company_name as company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
INNER JOIN 
    trips 
ON 
    trips.cab_id = cabs.cab_id
WHERE 
    CAST(trips.start_ts AS date) BETWEEN '2017-11-01' AND '2017-11-07'
    AND cabs.company_name LIKE '%%Blue%%'
GROUP BY company_name;


-- 3
-- De 1 a 7 de novembro de 2017, as empresas de táxi mais populares foram Flash Cab e Taxi Affiliation Services. 
-- Encontrar o número de corridas para essas duas empresas e nomear a variável resultante como trips_amount. 
-- Juntar as corridas de todas as outras empresas no grupo "Other". 
-- Agrupar os dados por nomes de empresas de táxi. 
-- Nomear o campo com os nomes das empresas de táxi company. 
-- Ordenar o resultado em ordem decrescente por trips_amount.

SELECT
    CASE 
        WHEN company_name = 'Flash Cab' THEN 'Flash Cab' 
        WHEN company_name = 'Taxi Affiliation Services' THEN 'Taxi Affiliation Services' 
        ELSE 'Other' 
    END AS company,
    COUNT(trips.trip_id) as trips_amount                
FROM 


-- 4
-- Recuperar os identificadores dos bairros O'Hare e Loop da tabela neighborhoods.

SELECT
    neighborhood_id,
    name
FROM 
    neighborhoods
WHERE 
    name LIKE '%Hare' OR name LIKE 'Loop'
    
    
-- 5
-- Recuperar os registros de condições climáticas da tabela weather_records por hora. 
-- Usar o operador CASE, dividir todas as horas em dois grupos: Bad, se o campo descrição contiver as palavras rain ou storm e Good para outros. 
-- Nomear o campo resultante como weather_conditions. 
-- A tabela final deve incluir dois campos: data e hora (ts) e weather_conditions.

SELECT
    ts,
    CASE
        WHEN description LIKE '%rain%' OR description LIKE '%storm%' THEN 'Bad'
        ELSE 'Good'
    END AS weather_conditions
FROM 
    weather_records;
    

-- 6    
-- Recuperar da tabela trips todas as corridas que começaram no Loop (pickup_location_id: 50) em um sábado e terminaram em O'Hare (dropoff_location_id: 63). 
-- Obter as condições meteorológicas para cada corrida. 
-- Usar o método que você aplicou na tarefa anterior. 
-- Recuperar a duração de cada corrida. 
-- Ignorar corridas para as quais os dados sobre as condições meteorológicas não estão disponíveis.
-- As colunas da tabela devem estar na seguinte ordem:
-- * start_ts
-- * weather_conditions
-- * duration_seconds
-- Ordenar por trip_id.    

SELECT
    start_ts,
    T.weather_conditions,
    duration_seconds
FROM 
    trips
INNER JOIN (
    SELECT
        ts,
        CASE
            WHEN description LIKE '%rain%' OR description LIKE '%storm%' THEN 'Bad'
            ELSE 'Good'
        END AS weather_conditions
    FROM 
        weather_records          
) T on T.ts = trips.start_ts
WHERE 
    pickup_location_id = 50 AND dropoff_location_id = 63 AND EXTRACT (DOW from trips.start_ts) = 6
ORDER BY trip_id
