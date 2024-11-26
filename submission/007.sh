# Only one single output remains unspent from block 123,321. What address was it sent to?

hash123321=$(bitcoin-cli getblockhash "123321")
block_data=$(bitcoin-cli getblock $hash123321)
tx_ids=$(echo $block_data | jq -r '.tx[]')

for tx_id in $tx_ids; do
    tx_details=$(bitcoin-cli getrawtransaction $tx_id 1)
    vouts=$(echo "$tx_details" | jq -r '.vout[] | .n')

    for vout in $vouts; do
      unspent=$(bitcoin-cli gettxout $tx_id $vout)
        
      if [ -n "$unspent" ]; then
        address=$(echo "$unspent" | jq -r '.scriptPubKey.address')
        echo "$address"
      fi
    done
done

