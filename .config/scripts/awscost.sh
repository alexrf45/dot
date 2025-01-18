aws ce get-cost-and-usage \
	--time-period 'Start=2024-01-01,End=2024-03-31' \
	--metrics 'UnblendedCost' \
	--granularity 'MONTHLY' \
	--query 'ResultsByTime[*].Total.[UnblendedCost]' \
	--output 'table'
