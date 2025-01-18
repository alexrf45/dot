(                                                              \
    START_DATE=$(date +"%Y-%m-01");                            \
    END_DATE=$(date +"%Y-%m-01" -d "$DATE + 1 month");         \
    aws ce get-cost-and-usage                                  \
        --time-period "Start=$START_DATE,End=$END_DATE"        \
        --metrics     'UnblendedCost'                          \
       --granularity 'MONTHLY'                                \
        --query       'ResultsByTime[*].Total.[UnblendedCost]' \
        --output      'table'                                  \
)
