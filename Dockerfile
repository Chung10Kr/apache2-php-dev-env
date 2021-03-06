# Dockerfile
FROM ubuntu:18.04
MAINTAINER Chung10 <coohg93@hanmail.net>

# 업데이트
RUN apt update && apt-get update -y

# Git 설치==========Start
WORKDIR '/home/app'
ARG Git=None
RUN apt-get install git -y
RUN if [ "$Git" != "None" ] ; then git clone ${Git} ; fi

# Git==========End

# Apache,PHP==========Start
# 아파치 설치
RUN apt install apache2 -y
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE  /var/run/apache2/apache2.pid 
 
# 최신 버전의 패키지 설치를 위한 패키지 설치
RUN apt install software-properties-common -y
 
# PPA-php 설치 (php 7.3 버전 사용을 위해)
RUN add-apt-repository ppa:ondrej/php
 
# 아래의 설정으로 타임존 설정을 유예하는 것이기 때문에 차후에 따로 설정을 해주어야 합니다.
ENV DEBIAN_FRONTEND=noninteractive 
 
# php 코어 설치
RUN apt install php7.3 php7.3-common php7.3-cli -y
# php 보편적 모듈 설치
RUN apt install php7.3-bcmath php7.3-bz2 php7.3-curl php7.3-gd php7.3-intl php7.3-json php7.3-mbstring php7.3-readline php7.3-xml php7.3-zip -y
# php와 웹 서버(apache2)와 연결
RUN apt install libapache2-mod-php7.3

# Time Zone
#RUN echo "date.timezone=Asia/Seoul" > $PHP_INI_DIR/conf.d/date_timezone.ini

# 이미지에 소스 코드 카피
COPY app/ /home/app/
 
# 가상 호스트 설정 이미지에 카피
COPY ./config/vhost.conf /etc/apache2/sites-available/vhost.conf
 
# 카피한 가상 호스트 설정 파일 심볼 링크 설정
RUN ln -s /etc/apache2/sites-available/vhost.conf /etc/apache2/sites-enabled/
 
EXPOSE 80
 
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
# Apache,PHP==========End

# Node==========Start
# RUN apt-get install -y nodejs
# Node==========End
