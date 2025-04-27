
# Formazione Chef: primo esercizio svolto utilizzando Chef Automation Tool

### Descrizione esercizio:

Lo scopo di questo esercizio è quello di utilizzare Chef e Test Kitchen per automatizzare il deploy di un'applicazione containerizzata (nel nostro caso Jenkins) tramite una ricetta Chef che sfrutta la resource docker_image e docker_container. L'obiettivo è imparare a definire un'infrastruttura as-code con Chef e orchestrare l'installazione e la configurazione dell'ambiente Docker direttamente tramite le ricette.

### Tools utilizzati:

Chef (https://www.chef.io/)

Test Kitchen (https://kitchen.ci/)

Docker (https://docs.docker.com/)

Jenkins (https://www.jenkins.io/)

### Svolgimento:

Per lo svolgimento di questo esercizio è stato inizialmente predisposto un Docker_compose, affinché si potessero avviare tre container Linux, rispettivamente contenenti Chef Workstation, Chef Client e Chef Server.

Questa idea iniziale è stata poi modificata, in quanto si è deciso di utilizzare un Vagrantfile che tirasse su 3 macchine virtuali al posto dei 3 container precedenti.
Le 3 VM sono state configurate con la stessa subnet 192.168.1.0/24, rispettivamente:
Chef Server --> 192.168.1.10
Chef Client --> 192.168.1.11
Chef Workstation --> 192.168.1.12

Dopo aver eseguito il comando "Vagrant up" per creare ed accendere le 3 VM, sono stati aperti 3 terminali da cui ci siamo connessi ad ognuna di loro con il comando "vagrant ssh nome_macchina".

Per ogni VM è stato scaricato ed installato rispettivamente il pacchetto chefserver, chefclient e chefworkstation. 

Sul Server sono stati creati User ed Organization, andando a creare i file myuser.pem e myorg-validator.pem che ci serviranno nel corso dell' esercizio per far connettere le 3 macchine tra di loro. 

Sulla Workstation sono stati copiati nel path ~/chef-repo/.chef/questi 2 file appena generati sul server; è stato poi eseguito il comando "knife ssl fetch" per evitare che si effettuasse il controllo autenticità certificati, ed inoltre è stata aggiunta la riga “ssl_verify_mode          :verify_none” nel file config.rb per lo stesso motivo.

Sul Client è stato copiato dalla Workstation nel path /etc/chef il file myorg-validator-pem; è stato poi creato e modificato il file client.rb, aggiungendo anche qui la riga “ssl_verify_mode          :verify_none”.

Successivamente è stato copiato dalla Workstation al Client il file chserver.crt, generato con il precedente comando "knife ssl fetch" sulla Workstation. 

Per facilitare la connessione tra le 3 macchine, abbiamo inserito nel file etc/hosts delle VM Chef Client e Chef Workstation, l' indirizzo ip e il nome dello Chef Server.

Finalmente si può eseguire il comando chef-client dallo Chef Client, così da creare il file client.pem.
Spostandoci sulla Workstation possiamo creare il nostro cookbook, andandolo a modificare affinché si possa predisporre l' installazione e l' utilizzo di Docker come richiesto dall' esercizio.

Si andrà poi ad eseguire il comando "chef install" e successivamente "chef upload cookbook nome_cookbook", per far si che venga trasferito il nostro cookbook dalla Workstation al Server.
Per completare l' esercizio si andrà sulla macchina Client, la quale con il comando "chef-client" si connetterà al Server ed eseguirà il cookbook scritto.

### Extra:
è stato creato un file contenente la History delle 3 VM
