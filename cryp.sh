#!/bin/bash
source ~/scripts/.env
array=[]

curl --silent -H "X-CMC_PRO_API_KEY: $key" -H "Accept: application/json" -d "symbol=BAT,BTC,SHIB,DOGE,ZRX,XRP,DGB,ETH" -G https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest > crypto.json

timestamp=`jq '.status.timestamp' crypto.json | tr -d '"'`

echo "     "$timestamp

echo "        Current Prices"

for symbol in BAT BTC SHIB DOGE ZRX XRP DGB ETH
do
        SYM=`jq '.data.'$symbol'.symbol' crypto.json | tr -d '"'`
        PRICE=`jq '.data.'$symbol'.quote.USD.price' crypto.json`
        NAME=`jq '.data.'$symbol'.name' crypto.json | tr -d '"'`

        echo "     "$SYM "- $"`printf "%.4f" "$PRICE"`" - "$NAME
done

echo " "
echo "     All prices represented in USD"

curl
        --request GET \
        --url https://api.exchange.coinbase.com/coinbase-accounts \
        --header 'Accept: application/json'
