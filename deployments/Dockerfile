FROM centos:7

ENV APP gotest
ARG VERSION
ARG PORT

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN localedef -i en_US -f UTF-8 en_US.UTF-8

WORKDIR /${APP}
COPY ./_build/prod/rel/${APP}/releases/${VERSION}/${APP}.tar.gz ./
RUN tar xfz ${APP}.tar.gz
RUN rm ${APP}.tar.gz

EXPOSE ${PORT}
ENTRYPOINT ["/gotest/bin/gotest"]
CMD ["foreground"]
