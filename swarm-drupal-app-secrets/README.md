# Assignment: Deploy Drupal in swarm with secrets

## Goal: create secrets, volumes, and services for a web-based "drupal".

- This empty directory is where you should create a docker-compose.yml 
- Use the `drupal:8.2` image along with the `postgres:12.1` image
- Set the version to 2
- Use `ports` to expose Drupal on 8080
- Be sure to setup POSTGRES_PASSWORD on postgres image
- Walk though Drupal config in browser at http://localhost:8080
- Tip: Drupal assumes DB is localhost, but it will actually be on the compose service name you give it
- Use Docker Hub documentation to figure out the right environment and volume settings
- Extra Credit: Use volumes to store Drupal unique data
- Use Swarm
- Passwords and user names must be secrets