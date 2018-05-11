FROM jrei/crystal-alpine as builder
COPY . /opt/app
WORKDIR /opt/app
RUN crystal build --release /opt/app/src/run.cr


FROM scratch
WORKDIR /opt/app
COPY --from=builder /opt/app/crystal-methrics /
CMD ["/crystal-methrics"]



