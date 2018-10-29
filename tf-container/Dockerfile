FROM golang:alpine

RUN apk update && apk upgrade && \
    apk add --no-cache git bash openssh zip

ENV TERRAFORM_VERSION=0.11.10
ENV TERRAFORM_SHA256SUM=43543a0e56e31b0952ea3623521917e060f2718ab06fe2b2d506cfaa14d54527

RUN apk add --update git curl openssh && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN git clone --single-branch --branch v${TERRAFORM_VERSION} https://github.com/hashicorp/terraform.git /go/src/github.com/hashicorp/terraform

RUN cd $GOPATH/src/github.com/hashicorp/terraform && echo $GOPATH && \
    go install ./tools/terraform-bundle

ADD terraform-version.hcl /

RUN terraform-bundle package -os=linux -arch=amd64 /terraform-version.hcl && \
    unzip terraform_*.zip -d /plugins && \
    rm terraform_*.zip /plugins/terraform
