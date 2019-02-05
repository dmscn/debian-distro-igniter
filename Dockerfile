FROM ubuntu:18.04
	ENV APPDIR /app
	ENV PORT 80
	EXPOSE $PORT
	WORKDIR $APPDIR
	ADD . $APPDIR
	RUN apt-get update && apt-get install `cat test/requirements.apt` -y
