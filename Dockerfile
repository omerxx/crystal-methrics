FROM jrei/crystal-alpine as builder
COPY . /opt/app
WORKDIR /opt/app
RUN crystal build --static --release /opt/app/src/crystal-methrics.cr


FROM scratch
WORKDIR /opt/app
COPY --from=builder /opt/app/crystal-methrics /
CMD ["/crystal-methrics"]



