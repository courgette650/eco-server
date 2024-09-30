FROM steamcmd/steamcmd debian-12 AS steamcmd 
VOLUME ["/Eco"]

RUN apt +force_install_dir /Eco +login anonymous +app_update 739590 validate +quit 
RUN apt update && apt install -y \
    libicu72 \
    libgdiplus

WORKDIR /Eco

RUN ./install.sh

EXPOSE 3001
EXPOSE 3000

ENTRYPOINT ["./Ecoserver"] 