export MINIKUBE_HOME=~/goinfre

minikube start --driver=virtualbox --cpus 2 --memory 4000mb --disk-size 7500mb --extra-config=apiserver.service-node-port-range=1-35000
eval $(minikube docker-env)

#--Setup_ip--
export MINIKUBE_IP=$(minikube ip)

sed "s/IP/$MINIKUBE_IP/g" srcs/metallb/sample > srcs/metallb/metallb-conf.yaml
sed "s/_IP_/$MINIKUBE_IP/g" srcs/ftps/sample > srcs/ftps/vsftpd.conf
sed "s/_IP_/$MINIKUBE_IP/g" srcs/nginx/sample > srcs/nginx/default.conf
sed "s/_IP_/$MINIKUBE_IP/g" srcs/phpMyAdmin/sample > srcs/phpMyAdmin/default.conf
sed "s/_IP_/$MINIKUBE_IP/g" srcs/wordpress/sample > srcs/wordpress/default.conf
sed "s/_IP_/$MINIKUBE_IP/g" srcs/wordpress/install > srcs/wordpress/install_wp.sh


#--metallb--
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl create -f srcs/metallb/metallb-conf.yaml

#--ftps--
docker build srcs/ftps -t ft_ftps
kubectl apply -f srcs/ftps/ftps.yaml

#--Nginx--
docker build srcs/nginx -t ft_nginx
kubectl apply -f srcs/nginx/nginx.yaml

#--MySQL-server--
docker build srcs/mysql/ -t ft_mysql
kubectl apply -f srcs/mysql/mysql.yaml

#--InfluxDB--

