<p align="center">
    <img src=https://github.com/PokeMate/deployment/blob/master/documentation/images/PokeMate.png?raw=true" alt="Ticketing dApp" align="center">
</p>

<h3 align="center">Advanced Software Engineering</h3>
<div align="center">Alex Wolf 12-526-216</div>
<div align="center">Simon Bachmann 14-709-893</div>
<div align="center"><code >University of Zurich</code></div>

---

## Table of Contents

- [Installtion Instructions](#installtion-instructions)
- [Source Code](#source-code)
- [Documentation](#documentation)
- [Architecture](#architecture)
- [CI/CD](#ci-cd)
- [Implementation Organisation](#implementation-organisation)
- [Design Decisions](#design-decisions)
- [Scalablility Plans](#scalablility-plans)
- [Demo](#demo)

## Installtion Instructions

1. Clone deployment repository:

```bash
git clone https://github.com/PokeMate/deployment.git
cd deployment
```

2. Pull docker containers from Dockerhub and start all images with:

```bash
docker-compose up # use -d option for detached mode
```

3. The PokéMate application can be now opened in your browser on [http://localhost:8080/](http://localhost:8080/)

## Source Code

For this project a new Github organization was created. It can be found on this [link](https://github.com/PokeMate).

## Documentation

Each repository in the Github organization has its own README for more details on how to run the micro-service on its own.

Furthermore, a [wiki](https://github.com/PokeMate/deployment/wiki) is used to get a better insight into the project such as the architecture, CI/CD, design descisions etc. It has many similarities to this document.

Also we used swagger to document all the endpoints of the backend. If the applicaiton is running you can check it out on [http://localhost:5100/swagger-ui](http://localhost:5100/swagger-ui).

The slides for the presentation are available [here](https://github.com/PokeMate/deployment/tree/master/documentation/presentations).

We also generated a video that illustrates the progress of the development. It is available for download on [this link on Github](https://github.com/PokeMate/deployment/blob/master/documentation/presentations/pokeMate_small.mp4). Click `view raw` to download the file.

## Architecture

The follwing image illustrates how the containers a communicating with each other. Each of images is available on Dockerhub. Thus, there is no need to clone any other repositories.

![architecture](https://github.com/PokeMate/deployment/blob/master/documentation/images/pokemate-architecture.png?raw=true)

**name-generator**
As the name suggests this micro-service is responsible for generating new Pokemon names. How this service is implemented and trained is explained in more in the [repo](https://github.com/PokeMate/name-generator) directly.

**image-generator**
As the name suggests this micro-service is responsible for generating new Pokemon images. How this service is implemented and trained is explained in more in the [repo](https://github.com/PokeMate/image-generator) directly.

**frontend**
The frontend is built with React and MaterialUI. How the repository looks and a demo is shown in the [repo](https://github.com/PokeMate/frontend).

**backend**
The backend is a Spring Boot application and uses a MongoDB to persist the data. Detailed information can directly found in the [repo](https://github.com/PokeMate/backend).

## CI/CD

The workflow for continues integration and deployment we use the following technology stack:

- Github Actions for triggering the build, tests, SonarQube
- SonarQube for static code analysis such as code coverage and code smells
- Dockerhub hosting docker images (can be triggered on specified settings depending on the branch or release from Github)
- Docker Compose to manage the micro-services
- (Potentially) Cloud provider such as AWS for hosting all the images

![cicd](https://github.com/PokeMate/deployment/blob/master/documentation/images/ci-cd.png?raw=true)

## Project Organisation

**Kanban Board**
One reason for using a Github organization was due to the fact that we can make a unified Kanban board accross all repositories. The columns in the Kanban board can be configured such that issues are aututomatically assigned to column given some events. The board can be found with this [link](https://github.com/orgs/PokeMate/projects/1).

**Git Flow**
A simplified version of Git Flow was used for the versioning and branching.

![GitFlow](https://github.com/PokeMate/deployment/blob/master/documentation/images/gitflow.png?raw=true)

**Git Tags**
For the naming of the versioning and releases, semantic versioning was used: Given a version number MAJOR.MINOR.PATCH, increment the:

1. MAJOR version when you make incompatible API changes, or releases,
2. MINOR version when you add functionality in a backwards compatible manner, and
3. PATCH version when you make backwards compatible bug fixes.

**Pull Requests**
All commits into the develop and master branch need to be reviewed through a pull request. We setup a branch protection in Github for these two branches, meaning that it is not possible to simply push into these branches. It is only possible through a pull request. Pull requests also triggered Github actions as well as SonarQube. The result of the analysis was then directly pushed into the pull request and thus, letting the review know if the tests still pass.

![SonarQube](https://github.com/PokeMate/deployment/blob/master/sonarquebe.png?raw=true)

**Timeline**

![Timeline](https://github.com/PokeMate/deployment/blob/master/documentation/images/issue-tracking.png?raw=true)
![Timeline2](https://github.com/PokeMate/deployment/blob/master/documentation/images/issue-tracking2.png?raw=true)

## Design Decisions

**Github Actions**
The reason for choosing Github Action instead of Travis was to expand our know-how in CI/CD.

**No User Accounts**
We decided to drop any user login due to the fact that the application should be targeted towards crowd-sourced machine learning.

**Frontend: React.js**
We decided to use React.js as the web framework due to the fact that we were already some what familiar with it. And the focus of the project was mainly to learn how to build micro-services and improve our CI/CD skills.

**Backend: SpringBoot**
SpringBoot was chosen due to the fact that Alex uses this framework in his job.

**MongoDB**
We initially thought there is the would be the need for an additional repository that manages the db. But an image was already available on Dockerhub. We decided to use MongoDB to deepen our knowledge in different kind of DB technologies. Also an advantage of MongoDB is that clustering is free which is great for scalability plans.

## Testing and Continuous Integration

For Python microservices we used [pytest](https://docs.pytest.org/en/latest/) for testing. A Github Action was configured such that the tests are run on certain branches. [This Github Action](https://github.com/SonarSource/sonarcloud-github-action) was then used to trigger SonarCloud to analyze the code. The analysis can be found [here](https://sonarcloud.io/dashboard?id=PokeMate_name-generator).

![SonarQube](https://github.com/PokeMate/deployment/blob/master/documentation/images/sonarqube.png?raw=true)

For the frontend application no tests were written up to this point.

## Scalablility Plans

As part of the objective of this project is to think about how the application can be scaled in the future. Thus, we came up with the following architecture.

![scalablility-plans](https://github.com/PokeMate/deployment/blob/master/documentation/images/scalablility-plans.png?raw=true)

The following technologies would be used to achieve this goal:

- Eureka (service registry/discovery)
- Zuul (load balancer/reverse proxy)
- Hystrix (latency and fault tolerance)
- Kubernetes or Swarm (orchestrator)
- mongoDB cluster/replica (database replicas)
- RabbitMQ (messaging)

## Demo

**Pokedex 🐛**

The Pokedex can be filtered with the the generation and the type. Newly generated Pokemons are of generation X.

![pokedex](https://github.com/PokeMate/frontend/raw/master/demo/pokedex.png)

The following parameters influence the chances of a successful mating date:

- Attractivity
- Fertility
- Fitness
- Attracted Types
- No-Go Types

**Pokemon Details 🐛**

The fetishes section is used as an entertainment parameter and is currently not evaluated in the dating success rate.

![details](https://github.com/PokeMate/frontend/raw/master/demo/details.png)

**Mating 🔥**

![mating](https://github.com/PokeMate/frontend/raw/master/demo/mating.png)

**Incubator 🥚🐣🐓**

![incubator](https://github.com/PokeMate/frontend/raw/master/demo/incubator.png)
![incubator](https://github.com/PokeMate/frontend/raw/master/demo/generated.png)

**Mobile**

The application was designed in a way that it scales properly for mobile too.

<p float="middle">
  <img src="https://github.com/PokeMate/frontend/raw/master/demo/mobile-pokedex.png" width="300" /> 
  <img src="https://github.com/PokeMate/frontend/raw/master/demo/mobile-details.png" width="300" />
  <img src="https://github.com/PokeMate/frontend/raw/master/demo/mobile-rating.png" width="300" />
</p>
