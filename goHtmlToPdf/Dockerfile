FROM golang

RUN apt update &&\
    apt install -y git wkhtmltopdf &&\
    go get -d -v github.com/SebastiaanKlippert/go-wkhtmltopdf 
    # &&\
    # mkdir /tmp/test &&\
    # chmod 7700 /tmp/test
# ENV XDG_RUNTIME_DIR=/tmp/test

COPY . .

CMD [ "go", "run", "main.go" ]