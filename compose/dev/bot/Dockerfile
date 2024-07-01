FROM python:3.11-alpine



ARG BUILD_ENVIRONMENT=dev
ARG APP_HOME=/bot
ARG NAME=bot 



ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV BUILD_ENV ${BUILD_ENVIRONMENT}

RUN apk update && apk add bash-completion

# change current directory to /bot
WORKDIR ${APP_HOME}
RUN mkdir /requirements
# copy all host files to current directory
COPY ./requirements/${NAME}/ /requirements/
RUN pip install -r /requirements/${BUILD_ENVIRONMENT}.txt

COPY  ./compose/${BUILD_ENVIRONMENT}/${NAME}/${BUILD_ENVIRONMENT}.sh ${APP_HOME}/${BUILD_ENVIRONMENT}.sh
RUN sed -i 's/\r$//g' ${APP_HOME}/${BUILD_ENVIRONMENT}.sh
RUN chmod +x  ${APP_HOME}/${BUILD_ENVIRONMENT}.sh
RUN chown root:root ${APP_HOME}/${BUILD_ENVIRONMENT}.sh


COPY  ./${NAME}  .









