#/bin/bash

# Delimiter
DELIM=" | "
function get_btc_price() {
    btc_price=$(curl -s "https://api.coincap.io/v2/rates/bitcoin" | jq -r '.data.rateUsd')
    btc_formatted=$(printf "%.2f" $btc_price)
    echo -e "󰠓 $btc_formatted"
}
LOW_BAT=false
function battery() {
    bat=$(< /sys/class/power_supply/BAT1/capacity)

    if (($bat < 25)); then
        if (( $bat <= 10 )) && [ "$LOW_BAT" = false ]; then
            LOW_BAT=true
            echo -e "\uf244 $bat%"
        else
            LOW_BAT=false
            echo -e "\uf243 $bat%"
        fi
    elif (($bat < 50)); then
        LOW_BAT=false
        echo -e "\uf242 $bat%"
    elif (($bat < 75)); then
        LOW_BAT=false
        echo -e "\uf241 $bat%"
    else
        LOW_BAT=false
        echo -e "\uf240 $bat%"
    fi
}
function disk() {
# Extract disk space values
    disk_space=$(df -h | awk '/\/dev\/nvme0n1p6/ {print $3, $2}')

# Split values into separate variables
    used_space=$(echo "$disk_space" | cut -d' ' -f1)
    total_space=$(echo "$disk_space" | cut -d' ' -f2)

    echo -e "󰋊 $used_space/$total_space GiB"
}
function status() {
    date "+ %a %d %b | 󰥔 %H:%M"
    echo $DELIM
    get_btc_price
    echo $DELIM
    disk
    echo $DELIM
    battery
    echo $DELIM
    echo -e ""
}

while :; do
    xsetroot -name "$(status | tr '\n' ' ')"

    # Sleep for 1 minute before updating the status bar
    sleep 30s
done
