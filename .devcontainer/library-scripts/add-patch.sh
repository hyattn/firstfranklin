IMAGE_VARIANT=$1

if[["${IMAGE_VARIANT}" =~ "14"]] ; then
    cd /usr/local/lob/node_modules/npm
    npm update --save
fi