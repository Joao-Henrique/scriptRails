#!/bin/bash

function print(){

  echo ":"
  echo ":::"
  echo ":::::"
  echo ":::::::"

}



print
echo ":Adicionando Pacotes"
gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D39DC0E3
echo ":Instalando o Curl"

curl -sSL https://get.rvm.io | bash -s stable
print
source /usr/local/rvm/scripts/rvm

if [[ -f '/root/.bashrc' ]] && ! grep -q 'source /usr/local/rvm/scripts/rvm' /root/.bashrc; then
  echo 'source /usr/local/rvm/scripts/rvm' >> /root/.bashrc
fi

if [[ -f '/etc/profile' ]] && ! grep -q 'source /usr/local/rvm/scripts/rvm' /etc/profile; then
  echo 'source /usr/local/rvm/scripts/rvm' >> /etc/profile
fi

echo "gem: --no-ri --no-rdoc" >> ~/.gemrc

sudo npm uninstall npm -g

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.25.1/install.sh | bash

source ~/.profile

nvm install  node -g
npm install -g cordova ionic -g


echo "Instal��o Ruby 2.2.0 e Rails 4.2 e Rails 4.1"

echo "Instalando Ruby"
rvm install 2.2.0
echo "Criando a gemset"
rvm use ruby-2.2.0
rvm gemset create rails4.2
rvm gemset use rails4.2
echo "Instalando rails 4.2"
gem install rails -v 4.2
rvm gemset create rails4.1
rvm gemset use rails4.1
echo "Instalando rails 4.1"
gem install rails -v 4.1

print

echo "Instal��o Ruby 2.1.2 e Rails 4.1"

rvm install 2.1.2
echo "Criando a gemset"
rvm gemset create rails4.1
rvm gemset use rails4.1
echo "Instalando rails 4.1"
gem install rails -v 4.1
rvm gemset create rails4.2
rvm gemset use rails4.2
echo "Instalando rails 4.2"
gem install rails -v 4.2

echo "Utilize as gemset's instaladas rmv gemset list"
rvm  use ruby-2.1.2
rvm  use ruby-2.2.0
rvm  use ruby-2.1.2
rvm  use ruby-2.2.0
rvm gemset use rails4.1



exec $SHELL
