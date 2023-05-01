FROM alpine:3.17 as builder

ARG MEDIAINFO_VERSION
WORKDIR /source

RUN apk add curl jq xz make gcc g++ musl-dev zlib-dev zlib-static
RUN URL="https://mediaarea.net/download/binary/mediainfo/${MEDIAINFO_VERSION}/MediaInfo_CLI_${MEDIAINFO_VERSION}_GNU_FromSource.tar.xz" \
    && curl -L $URL | tar -xJ --strip-components 1
RUN CXXFLAGS="-flto=auto" LDFLAGS="-static-libstdc++ -static-libgcc" ./CLI_Compile.sh
RUN mv MediaInfo/Project/GNU/CLI/mediainfo . && strip mediainfo


FROM scratch

WORKDIR /input
COPY --from=builder /lib/ld-musl-*.so.1 /lib/libz.so.1  /lib/
COPY --from=builder /source/mediainfo /usr/bin/mediainfo
ENTRYPOINT [ "/usr/bin/mediainfo" ]
