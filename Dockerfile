FROM rhel6.5

RUN subscription-manager register --username=[your RHN user name] --password=[your RHN password]

RUN subscription-manager attach --auto

RUN yum clean all

RUN yum install -y sudo openssh-server openssh-clients which curl \
    gcc git libselinux-python tar wget rhn-client-tools rhn-setup \
    nfs-utils

RUN wget https://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

RUN rpm -ivh epel-release-6-8.noarch.rpm

RUN echo "[saltstack-repo]" >> /etc/yum.repos.d/saltstack.repo
RUN echo "name=SaltStack repo for RHEL/CentOS 6" >> /etc/yum.repos.d/saltstack.repo
RUN echo "baseurl=https://repo.saltstack.com/yum/rhel6" >> /etc/yum.repos.d/saltstack.repo
RUN echo "enabled=1" >> /etc/yum.repos.d/saltstack.repo 
RUN echo "gpgcheck=1" >> /etc/yum.repos.d/saltstack.repo
RUN echo "gpgkey=https://repo.saltstack.com/yum/rhel6/SALTSTACK-GPG-KEY.pub" >> /etc/yum.repos.d/saltstack.repo

RUN yum install -y python-simplejson python-setuptools python-paramiko \
    python-keyczar python-httplib2 python-crypto2.6 PyYAML python-jinja2

RUN yum install -y ansible

#RUN subscription-manager unregister

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''

RUN if ! getent passwd kitchen; then \
      useradd -d /home/kitchen -m -s /bin/bash kitchen; \
    fi

RUN echo kitchen:kitchen | chpasswd

RUN wget https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p647.tar.gz

RUN tar zxvf ruby-2.0.0-p647.tar.gz

RUN cd ruby* && ./configure --prefix=/usr && make && make install

RUN echo 'kitchen ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN mkdir -p /etc/sudoers.d
RUN echo 'kitchen ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/kitchen
RUN chmod 0440 /etc/sudoers.d/kitchen
RUN mkdir -p /home/kitchen/.ssh
RUN chown -R kitchen /home/kitchen/.ssh
RUN chmod 0700 /home/kitchen/.ssh
RUN touch /home/kitchen/.ssh/authorized_keys
RUN chown kitchen /home/kitchen/.ssh/authorized_keys
RUN chmod 0600 /home/kitchen/.ssh/authorized_keys

RUN echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCoQNARsEnBgDfEJxJHYGxi8qR+fs9GAvIpfiSWRLseoiuJ3QbNyrzsIUe/N3Es9eZd97wvUp1DWMRBicpzZVdz5LcDFfpw711RN296EiHoZmluJBotZM+OwP/iSEyUn3rklneI7HhvSpLs5V2Qe52DZ7VrIiyeWt2fJuD7UnTPllZcFRhGCGnmEirvRH5UzttYWkMUQrdvEJv1S7o5DrlwhiJBTeB4A3xZzkPkb5OZ0SVBXtIMO0zxgqeSKXFeeWKkLxURKi1V7EG4aVNy6PaTzpDWckb733u4dNnWis0E2BwTxngZ/m1QzJW+0mJ5c1fVmc2xa5J8/atCwkiWW1A5 jwang@jwang-mbpro.local' >> /home/kitchen/.ssh/authorized_keys
