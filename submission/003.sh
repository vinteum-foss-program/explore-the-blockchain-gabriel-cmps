# How many new outputs were created by block 123,456?

block=$(bitcoin-cli getblock $(bitcoin-cli getblockhash 123456) 2)
txs=$(echo $block | jq '.tx')
outputs=$(echo $txs | jq '[.[] | .vout | length] | add')
echo $outputs