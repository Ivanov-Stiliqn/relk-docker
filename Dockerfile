FROM logstash:7.5.1

COPY ./logstash.conf /etc/logstash/conf.d/

FROM docker.elastic.co/beats/metricbeat:7.5.1

COPY ./metricbeat.yml /etc/metricbeat/

FROM rabbitmq:3.5.7-management

COPY rabbitmq.config /etc/rabbitmq/
COPY custom_definitions.json /etc/rabbitmq/

CMD ["rabbitmq-server"]