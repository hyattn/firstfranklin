ARG VARIANT=19-bullseye
FROM node:${VARIANT}

ENV IMAGE_VARIANT="18-bullseye"

COPY library-scripts/add-patch.sh /tmp/library-scripts/
RUN bash /tmp/library-scripts/add-patch.sh "${IMAGE_VARIANT}}" && rm -rf /tmp/library-scripts

ARG USERNAME=node
ARG NPM_GLOBAL=/usr/local/share/npm-global 

ENV PATH=${NPM_GLOBAL}/bin:${PATH}

RUN \
    if ! cat /etc/group | grep -e "^npm:" > /dev/null 2>&1; then groupadd -r npm; fi \
    && usermod -a -G npm ${USERNAME} \
    && umask 0002 \
    && mkdir -p ${NPM_GLOBAL} \
    && touch /usr/local/etc/npmrc \
    && chown ${USERNAME}:npm ${NPM_GLOBAL} /usr/local/et/npmrc \
    && chomod g+s ${NPM_GLOBAL} \
    && npm config -g set prefix ${NPM_GLOBAL} \
    && su ${USERNAME} -c "npm config -g set prefix ${NPM_GLOBAL}" \

    && su ${USERNAME} -c "umask 0002 && npm install -g eslint" \
    && npm cache clean --force > /dev/null 2>&1


RUN su node -c "npm install -g @adobe/helix-cli"