FROM node:lts-buster
USER root
RUN apt-get update && \
    apt-get install -y ffmpeg webp git && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*
USER node
RUN git clone https://github.com/KHULEKANI702/XLICON-V2-MD.git /home/node/XLICON-V2-MD 
WORKDIR /home/node/XLICON-V2-MD 
RUN chmod -R 777 /home/node/XLICON-V2-MD/
RUN yarn install --network-concurrency 1
EXPOSE 9090
ENV NODE_ENV=production
CMD ["npm", "start"]
