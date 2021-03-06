FROM java:8

ENV GRADLE_VERSION=4.6
ENV GRADLE_HOME=/opt/gradle
ENV GRADLE_FOLDER=/root/.gradle

# Change to tmp folder
WORKDIR /tmp

# Download and extract gradle to opt folder
RUN wget --no-check-certificate --no-cookies https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    && unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt \
    && ln -s /opt/gradle-${GRADLE_VERSION} /opt/gradle \
    && rm -f gradle-${GRADLE_VERSION}-bin.zip

# Add executables to path
RUN update-alternatives --install "/usr/bin/gradle" "gradle" "/opt/gradle/bin/gradle" 1 && \
    update-alternatives --set "gradle" "/opt/gradle/bin/gradle" 

# Create .gradle folder
RUN mkdir -p $GRADLE_FOLDER

# Create greenfox folder
RUN mkdir -p greenfox

# Mark as volume
VOLUME  $GRADLE_FOLDER

# Copy the files
COPY . /tmp/greenfox

# Change to root folder
WORKDIR /greenfox/