echo "Creating image"
if [$# -ne 1];
	then echo "Illegal number of parameters"
	exit 1
fi

echo "Current Logged user: " $USER
BUILD_NUM=$1
echo "Running with BUILD NUM=" $BUILD_NUM
docker build -t klosrc/ti-is-cidemo:$BUILD_NUM .
echo "Docker Build successful"
docker stop ti-is-cidemo-dev
docker rm ti-is-cidemo-dev
docker run -d --name ti-is-cidemo-dev -p 8088:8080 klosrc/ti-is-cidemo:$BUILD_NUM
echo "Docker Container is running with Tomcat 8 on port 8888"
echo "APPLICATION RUNNING IN: http://localhost:8088/ti-is-cidemo"
