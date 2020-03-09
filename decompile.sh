function Usage {
   echo "Usage: <src.apk> <dst_folder>" 
   exit $1
}

if [ -z "$1" ] || [ -z "$2" ]; then
    Usage 1
fi

DOCKER_TAG="galtashma/dex-android-project-creator"
APK=$1
PROJECT=$2

[ ! -f $APK ]     && Usage 2
[ ! -d $PROJECT ] && Usage 3 

docker run -v $PWD/$APK:/app.apk -v $PWD/$PROJECT:/project $DOCKER_TAG 
