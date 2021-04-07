minikube delete
minikube start --vm-driver=virtualbox

eval $(minikube docker-env)
docker build -t nginx srcs/nginx
docker build -t mysql srcs/mysql
docker build -t influxdb srcs/influxdb
# docker build -t wordpress srcs/wordpress
# docker build -t phpmyadmin srcs/phpmyadmin
docker build -t grafana srcs/grafana
# docker build -t ftps srcs/ftps


# docker build -t wordpress srcs/wordpress

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/yaml/metallb.yaml
# kubectl apply -f ./srcs/yaml/nginx.yaml
kubectl apply -f ./srcs/yaml/mysql.yaml
kubectl apply -f ./srcs/yaml/influxdb.yaml
kubectl apply -f ./srcs/yaml/wordpress.yaml
kubectl apply -f ./srcs/yaml/phpmyadmin.yaml
# kubectl apply -f ./srcs/yaml/grafana.yaml

minikube dashboard
