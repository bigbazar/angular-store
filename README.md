# angular-kekhts

[Edit on StackBlitz ⚡️](https://stackblitz.com/edit/angular-kekhts)

Pré requis :

npm install

sudo apt upgrade
sudo apt update

sudo apt install nodejs
sudo apt install maven
mvn install 20

npm update node
sudo npm install -g @angular/cli

Commandes de build et run du container :
ng build --configuration production
sudo podman build -t docker.io/library/angular-store .
sudo podman run -d -p 8080:80 docker.io/library/angular-store

Commandes utiles :
sudo podman container list   --> permet de récupérer le nom du container, nifty_tu dans cet exemple
sudo podman rm nifty_tu --force
sudo podman logs nifty_tu
sudo podman exec -it nifty_tu sh
