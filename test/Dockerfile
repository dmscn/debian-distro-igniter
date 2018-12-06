FROM ubuntu:18.04
	ENV APPDIR /app
	ENV PORT 80
	EXPOSE $PORT
	WORKDIR $APPDIR
	COPY . $APPDIR
	RUN apt-get update && apt-get install make python -y
