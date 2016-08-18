test="piccadilly is a strange place no place is a strange place as piccadilly is "
counter=0
tokens=()
results=()

for word in $test; do 
    tokens[counter]=$word;
    ((counter++))

done

counter2=0

for (( i = 0; i < counter ; i++ )); do
    for (( j = 0; j < counter ; j++ )); do
    if [[ ! -z ${tokens[i+1]} ]]; then
        
        if [[ "${tokens[i]}" == "${tokens[j]}" ]] && [[ "${tokens[i+1]}" == "${tokens[j+1]}" ]]; then
        results[counter2]="${tokens[i]}+${tokens[i+1]}"
        ((counter2++))
        fi
    fi
    done
done

fool=$(for word1 in "${results[@]}"; do
    for word in "${results[@]}"; do
  echo $word
done | grep $word1  |uniq
done)
echo "fool" | uniq -c | uniq
