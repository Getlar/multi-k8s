docker build -t ranuon98/multi-client:latest -t ranuon98/multi-client:$SHA ./client/Dockerfile ./client
docker build -t ranuon98/multi-server:latest -t ranuon98/multi-server:$SHA ./server/Dockerfile ./server
docker build -t ranuon98/multi-worker:latest -t ranuon98/multi-worker:$SHA ./worker/Dockerfile ./worker

docker push ranuon98/multi-client:latest
docker push ranuon98/multi-server:latest
docker push ranuon98/multi-worker:latest

docker push ranuon98/multi-client:$SHA
docker push ranuon98/multi-server:$SHA
docker push ranuon98/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=ranuon98/multi-server:$SHA
kubectl set image deployments/client-deployment server=ranuon98/client-server:$SHA
kubectl set image deployments/worker-deployment server=ranuon98/worker-server:$SHA
