#This command will dump everything in your logging database!!!!!!!!!!
#but it will get your openshift elsatic search back up and running 
curl -s -X DELETE --cacert /etc/elasticsearch/secret/admin-ca --cert /etc/elasticsearch/secret/admin-cert --key /etc/elasticsearch/secret/admin-key https://localhost:9200/_all
