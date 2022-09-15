# helm api server 설치 가이드

## 개요
HyperCloud에서 Kubernetes package manager인 Helm service를 쉽게 사용할 수 있도록 지원하는 API server. Helm Chart가 포함된 Helm Repository를 등록 후 차트 조회가 가능하며, 해당 차트를 사용하여 릴리즈를 생성함으로써 차트를 설치한다.

## Prerequisites
  - HyperCloud console 설치 후 실행

## Step1. install-helm.config 설정
- 목적 : `helm api server 설치 진행을 위한 config 설정`
- 순서 : 
  - 환경에 맞는 config 내용을 작성합니다.
     - imageRegistry: image registry 작성
       - default: docker.io
     - helmApiServerVersion: helm api server version
       - ex : helmApiServerVersion=0.0.1
     - consoleHost: HyperCloud domain host 작성
       - ex : tmaxcloud.org
     - storageClass: storage class 이름 작성
       - ex : storageClass=nfs

## Step2. install-template
- 목적 : `helm api server 설치 진행을 위한 shell script 실행`
- 순서 : 
	```bash
    sudo ./install.sh
	```
