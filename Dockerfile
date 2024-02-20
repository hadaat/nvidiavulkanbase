#FROM unityci/editor:2023.2.10f1-linux-il2cpp-3
#FROM ubuntu:22.04
FROM unityci/base:latest

# Labels
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date="2024-02-10"
LABEL org.label-schema.name="hadaat/nvidiavulkanbase"
LABEL org.label-schema.description="Nvidia Vulkan Base Image"
LABEL org.label-schema.url="http://hada.at/"
LABEL maintainer="daniel.habe@hada.at"

USER root

RUN rm -rf /opt/unity

RUN apt-get update && apt-get install -y dotnet-sdk-8.0

RUN apt-get install -y libvulkan-dev
RUN apt-get install -y vulkan-tools
#RUN apt-get install -y nvidia-utils-545

RUN apt-get install -y libdevil-dev
RUN apt-get install -y libjpeg-dev
RUN apt-get install -y libglfw3-dev


#CREATE FOLDERSTRUCTURE

RUN mkdir /opt/app
RUN mkdir /opt/volumes
RUN chmod 777 /opt/app
RUN chmod 777 /opt/volumes

#ADD /bin/Release/netcoreapp3.1 /opt/app

#COPY publish/WebViewer /home/$USER/app/VolumeBrowser
#COPY ././home/renderer/builds/demo/VolumeBrowser /
#ADD VolumeBrowser /home/renderer/builds/demo/VolumeBrowser

WORKDIR /opt/app

#ENTRYPOINT ["./VolumeBrowser", "/home/renderer/volumes", "--server"]
#ENTRYPOINT ["dotnet", "WebViewer.dll"]