# variables
ANS_USR='ansible'
PUB_KEY=' PEGAR CLAVE PÚBLICA AQUÍ'

# Crea usaurio local ansible (necesita password para que la conexión SSH entrante funcione incluso si está basada en claves)
echo "Creando a usuario ansible"
useradd -p $(openssl rand -base64 14) -b /home/ -m $ANS_USR

# Autorizar clave pública
echo "Authorize public key"
mkdir /home/$ANS_USR/.ssh
chmod 700 /home/$ANS_USR/.ssh
echo $PUB_KEY > /home/$ANS_USR/.ssh/authorized_keys
chmod 600 /home/$ANS_USR/.ssh/authorized_keys
chown -R $ANS_USR:$ANS_USR /home/$ANS_USR/.ssh

# añadir ansible a sudoers
echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
visudo -cf /etc/sudoers