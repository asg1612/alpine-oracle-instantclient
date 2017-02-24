FROM frolvlad/alpine-glibc

RUN apk update && apk add libaio

COPY instantclient_12_1.zip ./
RUN unzip instantclient_12_1.zip && \
    mv instantclient_12_1/ /usr/lib/ && \
    rm instantclient_12_1.zip && \
    ln /usr/lib/instantclient_12_1/libclntsh.so.12.1 /usr/lib/libclntsh.so && \
    ln /usr/lib/instantclient_12_1/libocci.so.12.1 /usr/lib/libocci.so && \
    ln /usr/lib/instantclient_12_1/libociei.so /usr/lib/libociei.so && \
    ln /usr/lib/instantclient_12_1/libnnz12.so /usr/lib/libnnz12.so

ENV ORACLE_BASE /usr/lib/instantclient_12_1
ENV LD_LIBRARY_PATH /usr/lib/instantclient_12_1
ENV TNS_ADMIN /usr/lib/instantclient_12_1
ENV ORACLE_HOME /usr/lib/instantclient_12_1
