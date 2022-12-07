dir=./samples
make
for file in "$dir"/*.decaf
do
  filename=$(basename "$file" .decaf)
  vim "$file" -c "set ff=unix" -c ":wq"
  if [ -f "$dir"/"$filename".asm ]; then
      rm "$dir"/"$filename".asm
  fi
  if [ -f "$dir"/"$filename".out1 ]; then
      rm "$dir"/"$filename".out1
  fi
  ./dcc < "$file" >"$dir"/"$filename".asm 2>&1 # redirect stderr (& means 1 is a descriptor)

  if [ -f "$dir"/"$filename".in ]; then
      spim -file "$dir"/"$filename".asm < "$dir"/"$filename".in > "$dir"/"$filename".out1
  else
      spim -file "$dir"/"$filename".asm > "$dir"/"$filename".out1
  fi

  #vim "$dir"/"$filename".asm -c "set ff=unix" -c ":wq"
  #vim "$dir"/"$filename".out1 -c "set ff=unix" -c ":wq"
  diff "$dir"/"$filename".out "$dir"/"$filename".out1 >  "$dir"/"$filename".diff
done
make clean_junks