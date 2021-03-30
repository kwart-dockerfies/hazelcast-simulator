FROM alpine:3.13

MAINTAINER Josef (kwart) Cacek <josef.cacek@gmail.com>

ENV SIMULATOR_HOME=/hazelcast-simulator \
    SIMULATOR_BRANCH=master

COPY bash.bashrc /root/.bashrc

WORKDIR /root

RUN apk update \
    && echo "Installing APK packages" \
    && apk add bash openjdk8 git openssh rsync dstat curl maven gnuplot aws-cli aws-cli-bash-completion \
    && echo "Installing Hazelcast Simulator" \
    && wget https://github.com/hazelcast/hazelcast-simulator/archive/${SIMULATOR_BRANCH}.zip \
    && unzip -q ${SIMULATOR_BRANCH}.zip \
    && mvn -f hazelcast-simulator-${SIMULATOR_BRANCH}/pom.xml install -DskipTests -Denforcer.skip -Dcheckstyle.skip \
    && unzip -q  hazelcast-simulator-${SIMULATOR_BRANCH}/dist/target/hazelcast-simulator-*-dist.zip -d / \
    && ln -s /hazelcast-simulator-* ${SIMULATOR_HOME} \
    && echo "Clean-up" \
    && rm -rf hazelcast-simulator-${SIMULATOR_BRANCH} \
    && rm -rf /root/.m2 \
    && rm -rf /var/cache/apk/*

CMD ["/bin/bash"]
