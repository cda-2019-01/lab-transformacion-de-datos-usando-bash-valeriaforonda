# Escriba su código aquí
## Cambiar espacios (tabulaciones) por comas y quitar líneas en blanco
for a in $(seq 1 3)
do (sed 's/\t/,/g' data${a}.csv | sed 's/   /,/g' | sed '/^[[:space:]]*$/d') > dataN${a}.csv
done
### asignar nombre de archivo, contador por archivo, se excluye las que son
### letras mayúsculas que son la primera "columna" ya que está va siempre y no itera
### dentro del ciclo for. Se imprime el nombre del archivo, el contador, esa letra mayúscula
### y el valor que va iterando en el resto de filas.
for a in $(seq 1 3)
do  cont=0
    for row in $(cat dataN${a}.csv)
    do cont=$((cont+1))
        fila=($( echo ${row[*]} | sed 's/,/\t/g'))
        for x in $( echo ${fila[*]} | sed 's/[A-Z]//' )
        do  echo data${a}.csv','$cont','${fila[0]}','$x >> out.3
        done
    done
done
cat out.3
rm out.3
rm dataN*.csv
