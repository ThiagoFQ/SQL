# Análise Exploratória de Dados
## Descrição dos dados

Um banco de dados com informações sobre corridas de táxi em Chicago:

Tabela `neighborhoods`: dados sobre os bairros da cidade
* nome: nome do bairro
* neighborhood_id: código do bairro

Tabela `cabs`: dados sobre os táxis
* cab_id: código do veículo
* vehicle_id: a identificação técnica do veículo
* company_name: a empresa proprietária do veículo

Tabela `trips`: dados sobre corridas
* trip_id: código da corrida
* cab_id: código do veículo que opera a corrida
* start_ts: data e hora do início da corrida (tempo arredondado para a hora)
* end_ts: data e hora do fim da corrida (tempo arredondado para a hora)
* duration_seconds: duração da corrida em segundos
* distance_miles: distância do percurso em milhas
* pickup_location_id: código do bairro de retirada
* dropoff_location_id: código do bairro de entrega

Tabela `weather_records`: dados sobre o clima
* record_id: código de registro meteorológico
* ts: gravar data e hora (tempo arredondado para a hora)
* temperatura: temperatura quando o registro foi feito
* descrição: breve descrição das condições meteorológicas, ex. "chuva leve" ou "nuvens esparsas"

## Esquema de tabela

![This is a alt text.](https://pictures.s3.yandex.net/resources/Untitled_1_1585510727.png)
