# Usage :
#	docker build --build-arg "OC_URL=${OC_URL}" -t submod/oc-3.6 -f Dockerfile .
#   all releases of oc tool are here https://github.com/openshift/origin/releases
#
FROM fedora:27

USER root
ARG OC_URL=https://github.com/openshift/origin/releases/download/v3.6.0/openshift-origin-client-tools-v3.6.0-c4dd4cf-linux-64bit.tar.gz

RUN dnf -y install wget vim unzip gzip which findutils file procps gcc \
	&& mkdir -p /origin \
	&& wget $OC_URL \
	&& tar -xvf openshift-origin-client-tools*.tar.gz  -C /origin \
	&& cp /origin/openshift-origin-client-tools*/oc /usr/local/bin/ \
	&& rm -fr openshift-origin-client-tools* \
	&& rm -fr origin

CMD ["/bin/bash"]

