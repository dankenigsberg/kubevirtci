#!/usr/bin/env bash

set -e

declare -A IMAGES
IMAGES[gocli]="gocli@sha256:e48c7285ac9e4e61fe0f89f35ac5f9090497ea7c8165deeadb61e464c88d8afd"
if [ -z $KUBEVIRTCI_PROVISION_CHECK ]; then
    IMAGES[k8s-1.17.0]="k8s-1.17.0@sha256:7ec5504f84983dc1dd3dd2dfdcaf2aeeb4314de021c6636e099e616be76f73a0"
    IMAGES[k8s-1.16.2]="k8s-1.16.2@sha256:5bae6a5f3b996952c5ceb4ba12ac635146425909801df89d34a592f3d3502b0c"
    IMAGES[k8s-1.15.1]="k8s-1.15.1@sha256:14d7b1806f24e527167d2913deafd910ea46e69b830bf0b094dde35ba961b159"
    IMAGES[k8s-1.14.6]="k8s-1.14.6@sha256:ec29c07c94fce22f37a448cb85ca1fb9215d1854f52573316752d19a1c88bcb3"
    IMAGES[k8s-1.13.3]="k8s-1.13.3@sha256:afbdd9b4208e5ce2ec327f302c336cea3ed3c22488603eab63b92c3bfd36d6cd"
    IMAGES[k8s-1.11.0]="k8s-1.11.0@sha256:696ba7860fc635628e36713a2181ef72568d825f816911cf857b2555ea80a98a"
    IMAGES[k8s-genie-1.11.1]="k8s-genie-1.11.1@sha256:19af1961fdf92c08612d113a3cf7db40f02fd213113a111a0b007a4bf0f3f7e7"
    IMAGES[k8s-multus-1.13.3]="k8s-multus-1.13.3@sha256:c0bcf0d2e992e5b4d96a7bcbf988b98b64c4f5aef2f2c4d1c291e90b85529738"
    IMAGES[okd-4.1]="okd-4.1@sha256:e7e3a03bb144eb8c0be4dcd700592934856fb623d51a2b53871d69267ca51c86"
    IMAGES[okd-4.2]="okd-4.2@sha256:a830064ca7bf5c5c2f15df180f816534e669a9a038fef4919116d61eb33e84c5"
    IMAGES[okd-4.3]="okd-4.3@sha256:63abc3884002a615712dfac5f42785be864ea62006892bf8a086ccdbca8b3d38"
    IMAGES[ocp-4.3]="ocp-4.3@sha256:4f537cbf6cf068eec9eadf2e340a642f2fda97d1b59b0aeebd615c19ce8e4ca6"
fi
export IMAGES

IMAGE_SUFFIX=""
if [[ $KUBEVIRT_PROVIDER =~ (ocp|okd).* ]]; then
    IMAGE_SUFFIX="-provision"
fi

image="${IMAGES[$KUBEVIRT_PROVIDER]:-${KUBEVIRT_PROVIDER}${IMAGE_SUFFIX}:latest}"
export image
