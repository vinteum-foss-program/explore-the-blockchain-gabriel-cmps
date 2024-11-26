# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`

tx_id="e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163"
tx_details=$(bitcoin-cli getrawtransaction $tx_id 1)
npubencodeed=$(echo $tx_details | jq -r '.vin[0].txinwitness[2]')
decode=$(bitcoin-cli decodescript $npubencodeed)
desc=$(echo $decode | jq -r '.desc')
public_key=${desc:8:66}
echo $public_key