#!/user/bun/bash

function topadf() {
    FLAG=""
    OPS=""
    for I in "${@}"; do
        if [ -e $I ]; then
            TARGET=$I
        elif [ $I == "-n" ]; then
            FLAG="${FLAG}n"
        elif [ $I == "-t" ]; then
            FLAG="${FLAG}t"
        elif [ $I == "-d" ]; then
            FLAG="${FLAG}d"
        fi
    done

    if [[ -v TARGET ]]; then
        FILENAME=$(`basename $(TARGET)`)
        FNAME=$(`dirname $(TARGERT)`)
        DIRNAME=${TARGET%/*}

        if [[ ${FLAG} =~ .*n.* ]]; then
            cat ${TARGET} | iconv -f UTF-8 -t EUC-JP > .temp
        else
            cat -n ${TARGET} | iconv -f UTF-8 -t EUC-JP > .temp
        fi

        if [[ ${FLAG} =~ .*t.* ]]; then
            OPS="${OPS} -nh "
        else
            OPS="${OPS} -head ${FILENAME}"
        fi

        e2ps -p ${OPS} .temp > ${FNAME}.ps
        ps2pdf ${FNAME}.ps
        rm -f ${FNAME}.ps .temp
    else
        echo "convert error"
    fi
}
