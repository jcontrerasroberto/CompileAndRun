#! /bin/bash
VERSION="--version"
HELP="--help"
if [ "$1" == "$VERSION" ]
	then
		echo "CompileAndRun.sh version 2.0 coded by RobertCB"
		exit 0
fi
if [ "$1" == "$HELP" ]
	then
		echo ""
		echo "Usage: CompileAndRun.sh [Adress And Name file with extension] [Name you want for the executable file (optional)]"
		echo ""
		echo "Works with c, c++ and java files"
		echo ""
		exit 0
fi
if test -z "$1"
	then
		echo "ERROR: First argument is empty"
		echo "Use CompileAndRun.sh --help to know how to use this script"
		exit 0
fi
if test -z "$2"
	then
		EXECUTABLENAME="executable_${1%.*}"
	else
		EXECUTABLENAME=$2
fi
if [[ $1 == *.c ]]
	then
		gcc $1 -o $EXECUTABLENAME && chmod 711 $EXECUTABLENAME && ./$EXECUTABLENAME
	elif [[ $1 == *.cpp ]] 
		then
			g++ $1 -o $EXECUTABLENAME && chmod 711 $EXECUTABLENAME && ./$EXECUTABLENAME
	elif [[ $1 == *.java ]]
		then
			javac $1 && java ${1%.*}
	else
		echo "File extension not valid. Don't forget to add the extension of the file ex: '${1%.*}.c, ${1%.*}.cpp or ${1%.*}.java'"
fi


