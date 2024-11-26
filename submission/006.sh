# Which tx in block 257,343 spends the coinbase output of block 256,128?

# Which tx in block 257,343 spends the coinbase output of block 256,128?
hash_256128=$(bitcoin-cli getblockhash 256128)
hash_257343=$(bitcoin-cli getblockhash 257343)
block_data_256128=$(bitcoin-cli getblock $hash_256128 2)
block_data_257343=$(bitcoin-cli getblock $hash_257343 2)
coinbase256128_txid=$(echo $block_data_256128 | jq -r '.tx[0].txid')
spending_tx=$(echo $block_data_257343 | jq -r '.tx[] | select(.vin[].txid=="'$coinbase256128_txid'") | .txid' | head -n 1)
echo $spending_tx