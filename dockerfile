FROM amazonlinux:with-sources
LABEL description="DL Asset Track - Workflow Management Service"
RUN yum groupinstall -y "Development Tools"
RUN yum upgrade -y --setopt=nodocs
####Install node####
RUN curl --silent --location https://rpm.nodesource.com/setup_14.x | bash -
RUN yum -y install nodejs
RUN npm install -g apidoc
####################

# Installing fonts for pdf
RUN yum -y install fontconfig
RUN curl https://fonts.google.com/download?family=Noto%20Serif%20JP --output Noto_Serif_JP.zip  && \
      mkdir -p /usr/share/fonts/NotoSerifjp  && \
      unzip Noto_Serif_JP.zip -d /usr/share/fonts/NotoSerifjp/  && \
      chmod 644 /usr/share/fonts/NotoSerifjp/*.otf   && \
      rm Noto_Serif_JP.zip  && \
      fc-cache -fv \
      nodejs \
      yarn \
      npm

#----------Bundle app source--------
RUN mkdir -p /logs
RUN mkdir -p /usr/src/
WORKDIR /usr/src/
ADD . /usr/src/
RUN npm install --production

EXPOSE 3001
CMD ["npm", "start"]
