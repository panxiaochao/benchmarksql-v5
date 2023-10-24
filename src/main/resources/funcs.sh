# ----
# $1 is the properties file
# ----
PROPS="$1"
if [ ! -f ${PROPS} ] ; then
    echo "${PROPS}: no such file" >&2
    exit 1
fi

# ----
# getProp()
#
#   Get a config value from the properties file.
# ----
function getProp()
{
    grep "^${1}=" ${PROPS} | sed -e "s/^${1}=//"
}

# ----
# getCP()
#
#   Determine the CLASSPATH based on the database system.
# ----
function setCP()
{
    case "$(getProp db)" in
	oracle)
	    cp="../lib/*"
	    if [ ! -z "${ORACLE_HOME}" -a -d ${ORACLE_HOME}/lib ] ; then
		cp="${cp}:${ORACLE_HOME}/lib/*"
	    fi
	    cp="${cp}:../lib/*"
	    ;;
	postgres)
	    cp="../lib/*"
	    ;;
	mysql)
    	cp="../lib/*"
    	;;
	firebird)
	    cp="../lib/*"
	    ;;
	mariadb)
	    cp="../lib/*"
	    ;;
	transact-sql)
	    cp="../lib/*"
	    ;;
	ase)
	    cp="../lib/*"
	    ;;
	hana)
	    cp="../lib/*"
	    ;;
	hana-col)
	    cp="../lib/*"
	    ;;
	babelfish)
	    cp="../lib/*"
	    ;;
	db2)
	    cp="../lib/*"
	    ;;
	kingbase)
  	  cp="../lib/*"
  	  ;;
    esac
    myCP="./:../BenchmarkSQL-v5.jar:${cp}"
    export myCP
}

# ----
# Make sure that the properties file does have db= and the value
# is a database, we support.
# ----
case "$(getProp db)" in
    oracle|postgres|mysql|firebird|mariadb|transact-sql|babelfish|ase|hana|hana-col|babelfish|db2|kingbase)
	;;
    "")	echo "ERROR: missing db= config option in ${PROPS}" >&2
	exit 1
	;;
    *)	echo "ERROR: unsupported database type 'db=$(getProp db)' in ${PROPS}" >&2
	exit 1
	;;
esac

