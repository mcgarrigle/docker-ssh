FROM centos:latest

RUN yum install -y openssh-server && \
    mkdir /var/run/sshd

RUN echo root:root | chpasswd
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
RUN ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
