#!/usr/bin/env python2
import json

# import web3
# import web3.eth
from web3 import Web3, HTTPProvider
from web3.contract import Contract

signed_url = "https://mainnet.infura.io/v3/09af14756ba347898112f3b8259e9e6e"

w3 = Web3(HTTPProvider(signed_url))

# print(w3.eth.get_block('latest'))

def getblockHashByNumber(blknum):
    # from ethereum.pow.chain import get_blockhash_by_number
    # blkhash = get_blockhash_by_number(blknum)
    blk = w3.eth.get_block(blknum)
    print(blk)
    bhash = blk['hash']
    return bhash.hex()

if __name__ == "__main__":
    print(getblockHashByNumber('latest'))