wget https://bitcoincore.org/bin/bitcoin-core-28.0/bitcoin-28.0-x86_64-linux-gnu.tar.gz
tar -xzvf bitcoin-28.0-x86_64-linux-gnu.tar.gz
ln -s $PWD/bitcoin-28.0/bin/* /usr/local/bin/
mkdir -p ~/.bitcoin
echo "rpcconnect=84.247.182.145" >> ~/.bitcoin/bitcoin.conf
echo "rpcuser=user_158" >> ~/.bitcoin/bitcoin.conf
echo "rpcpassword=1kAiA8AsNEXn" >> ~/.bitcoin/bitcoin.conf
