FROM centos:centos7.3.1611
MAINTAINER Samuel Bernard "samuel.bernard@s4m.io"

# Let's run stuff
RUN \

# Classic yum update
  yum -y update; \

# Basic chef install with useful package
  CHEFURL="https://packages.chef.io/stable"; \
  yum install -y ${CHEFURL}/el/7/chef-12.19.36-1.el7.x86_64.rpm; \
  yum install -y iproute sudo less vim tree; \

# Installing Busser
  GEM_HOME="/tmp/verifier/gems" \
  GEM_PATH="/tmp/verifier/gems" \
  GEM_CACHE="/tmp/verifier/gems/cache" \
  /opt/chef/embedded/bin/gem install busser --no-rdoc --no-ri \
    --no-format-executable -n /tmp/verifier/bin --no-user-install; \

# Busser plugins
  GEM_HOME="/tmp/verifier/gems" \
  GEM_PATH="/tmp/verifier/gems" \
  GEM_CACHE="/tmp/verifier/gems/cache" \
  /opt/chef/embedded/bin/gem install \
    busser-serverspec serverspec --no-rdoc --no-ri; \

# Bundler
  GEM_HOME="/tmp/verifier/gems" \
  GEM_PATH="/tmp/verifier/gems" \
  GEM_CACHE="/tmp/verifier/gems/cache" \
  /opt/chef/embedded/bin/gem install bundler --no-rdoc --no-ri; \

# Webmock can be very useful to test cookbooks
  GEM_HOME="/tmp/verifier/gems" \
  GEM_PATH="/tmp/verifier/gems" \
  GEM_CACHE="/tmp/verifier/gems/cache" \
  /opt/chef/embedded/bin/gem install \
    webmock --no-rdoc --no-ri; \

# Generate locale, remove a chef warning
  localedef -v -c -i en_US -f UTF-8 en_US.UTF-8; \

# Last command, we clean yum files everything
  yum clean all;

ENV LANG=en_US.UTF-8
CMD ["/bin/bash"]
