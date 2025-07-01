FROM golang:1.22.5 as base

WORKDIR /app

copy go.mod .

Run go mod download

copy . .

Run go build -o main .

 # final stage - distroless image

 from gcr.io/distroless/base

 COPY --from=base /app/main .

 COPY --from=base /app/static ./static 

 EXPOSE 8081

 CMD [ "./main"   ]  