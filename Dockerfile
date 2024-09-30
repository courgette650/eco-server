FROM steamcmd/steamcmd:debian-12 AS steamcmd 

RUN apt update && apt install -y \
    libicu72 \
    libgdiplus \
    lib32gcc-s1 \
    sudo

WORKDIR /Eco

USER 1000:1000

RUN steamcmd +force_install_dir /Eco +login anonymous +app_update 739590 validate +quit 

RUN ./install.sh

EXPOSE 3000
EXPOSE 3001
EXPOSE 3002
EXPOSE 3003

ENTRYPOINT ["./Ecoserver"] 

CMD ["-offline"]