start=$(date +%s%N)
clipstore list
end=$(date +%s%N)
echo "Time: $(( (end - start) / 1000000 )) ms"