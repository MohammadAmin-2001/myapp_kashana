FROM python:3.10-slim-bookworm

ARG BUILD_ENVIRONMENT=dev
ARG APP_HOME=/app
ARG NAME=django 


WORKDIR ${APP_HOME}

RUN pip install --upgrade pip

COPY  ./requirements/${NAME} /requirements

RUN pip install -r /requirements/${BUILD_ENVIRONMENT}.txt

RUN apt-get update && apt-get install --no-install-recommends -y \
  sudo git bash-completion nano ssh

# Create devcontainer user and add it to sudoers
# RUN groupadd --gid 1000 dev-user \
#   && useradd --uid 1000 --gid dev-user --shell /bin/bash --create-home dev-user \
#   && echo dev-user ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/dev-user \
#   && chmod 0440 /etc/sudoers.d/dev-user

COPY  ./compose/${BUILD_ENVIRONMENT}/${NAME}/${BUILD_ENVIRONMENT}.sh ${APP_HOME}/${BUILD_ENVIRONMENT}.sh
RUN sed -i 's/\r$//g' ${APP_HOME}/${BUILD_ENVIRONMENT}.sh
RUN chmod +x  ${APP_HOME}/${BUILD_ENVIRONMENT}.sh
RUN chown root:root ${APP_HOME}/${BUILD_ENVIRONMENT}.sh


ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV BUILD_ENV ${BUILD_ENVIRONMENT}




COPY ./${NAME}  ${APP_HOME} 
