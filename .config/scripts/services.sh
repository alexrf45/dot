aws ce get-cost-and-usage \
    --time-period Start=$(date "+%Y-%m-01" -d "-1 Month"),End=$(date --date="$(date +'%Y-%m-01') - 1 second" -I) \
    --granularity MONTHLY \
    --metrics UsageQuantity \
    --group-by Type=DIMENSION,Key=SERVICE | jq '.ResultsByTime[].Groups[] | select(.Metrics.UsageQuantity.Amount > 0) | .Keys[0]'