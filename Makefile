clean:
	@find -name mine.log -exec rm -f {} \;
	@find -name "*.pyc" -exec rm -f {} \;
	@find -name __pycache__ | xargs rm -rf
	@find -name .pytest_cache | xargs rm -rf
	@find -name .cache | xargs rm -rf

tar:
	@tar cf $(CURDIR)/../test.tar.gz *

mine.eth:
	@nohup python mine.py >> mine.log  2>&1  &

stop.all:
	@pkill -9 python

# Ethereum Operations
genkey.eth:
	@read -p "Type Key String: " seed; \
	 python -c "from eth.key import privkeyfromstring; print privkeyfromstring('$$seed')"	

chkacc.eth:
	@read -p "Type Address: " address; \
	 python -c "from eth.req import getbalance; print getbalance('$$address')"	

chknonce.eth:
	@read -p "Type Address: " address; \
	 python -c "from eth.req import getnonce; print getnonce('$$address')"	

priv2addr.eth:
	@read -p "Type Private Key: " privkey; \
	 python -c "from eth.key import priv2addr; print priv2addr('$$privkey')"

create.eth:
	@read -p "Type From Address: " fromaddr; \
     read -p "Type To Address: " toaddr; \
	 read -p "Type Value: " value; \
	 python -c "from eth.tx import createEx; print createEx('$$fromaddr','$$toaddr',$$value)"

sign.eth:
	@read -p "Type Unsigned Transaction: " unsigned; \
     read -p "Type Private Key: " privkey; \
	 python -c "from eth.tx import sign; print sign('$$privkey','$$unsigned')"

broadcast.eth:
	@read -p "Type Signed Transaction: " signed; \
	 python -c "from eth.tx import broadcast; print broadcast('$$signed')"
