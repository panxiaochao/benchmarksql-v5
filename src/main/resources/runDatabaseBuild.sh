#!/bin/sh

if [ $# -lt 1 ] ; then
    echo "usage: $(basename $0) PROPS [OPT VAL [...]]" >&2
    exit 2
fi

PROPS="$1"
shift
if [ ! -f "${PROPS}" ] ; then
    echo "${PROPS}: no such file or directory" >&2
    exit 1
fi
DB="$(grep '^db=' $PROPS | sed -e 's/^db=//')"

AFTER_LOAD="buildFinish"
BEFORE_LOAD="tableCreates indexCreates foreignKeys"

for step in ${BEFORE_LOAD} ; do
    ./runSQL.sh "${PROPS}" $step
done

./runLoader.sh "${PROPS}" $*

for step in ${AFTER_LOAD} ; do
    ./runSQL.sh "${PROPS}" $step
done
