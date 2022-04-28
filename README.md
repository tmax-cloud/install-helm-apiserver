# helm api server 설치 가이드

## Prerequisites
  - HyperCloud console 설치 후 실행

## Step1. install-helm.config 설정
- 목적 : `helm api server 설치 진행을 위한 config 설정`
- 순서 : 
  - 환경에 맞는 config 내용을 작성합니다.
     - imageRegistry={IP}:{PORT}
       - ex : imageRegistry=172.22.11.2:30500
     - helmApiServerVersion={helm api server version}
       - ex : helmApiServerVersion=0.0.0

## Step2. install-template
- 목적 : `helm api server 설치 진행을 위한 shell script 실행`
- 순서 : 
	```bash
    sudo ./install.sh
	```
