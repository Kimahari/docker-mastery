# Creating Networks
echo "Initializing Networks"

docker network create -d overlay votingapp-front-end
docker network create -d overlay votingapp-back-end

# Creating Services

echo "Creating vote-app Redis Instance"

docker service create --name redis --network votingapp-front-end redis:3.2

echo "Creating service vote app"

docker service create --name vote -p 8080:80 --network votingapp-front-end --replicas 2 bretfisher/examplevotingapp_vote

echo "Creating vote-results database Instance"

docker service create --name db --network votingapp-back-end -e POSTGRES_HOST_AUTH_METHOD=trust --mount type=volume,source=db-data,target=/var/lib/postgresql/data postgres:9.4

echo "Creating vote-results App"

docker service create --name result -p 5001:80 --network votingapp-back-end bretfisher/examplevotingapp_result

echo "Creating vote-results Worker"

docker service create --name worker --network votingapp-front-end --network votingapp-back-end bretfisher/examplevotingapp_worker:java