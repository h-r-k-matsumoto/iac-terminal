# docker build . -t ioc-repository:0.0.1
# docker push ioc-repository:0.0.1
FROM mcr.microsoft.com/azure-cli:2.4.0

ENV ANSIBLE_VERSION 2.9.7
ENV TERRAFORM_VERSION 0.12.24

# PREPARED
RUN apk --update --no-cache add \
    python py-pip openssl ca-certificates git curl

# INSTALL ANSIBLE
RUN pip install ansible==2.9.7

# INSTALL RE
WORKDIR /usr/local/bin
RUN curl -s -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && chmod +x terraform
