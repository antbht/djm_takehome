
check_exec() {
    if [ $1 != '0' ]; then
        echo "... ko"
        exit $1
    fi;
    echo "... ok"

}

echo "Initialize virtualenv ..."
echo
virtualenv .
check_exec $?
source bin/activate


echo "Install backend ..."
echo
pip install -e djm-back/
check_exec $?

echo "Install sdk ..."
echo
pip install -e djm_sdk/
check_exec $?

echo "Install client ..."
echo
pip install -e djm_client/
check_exec $?


djm-back --host 127.0.0.1 --port 8000 &

BACK_PID=$!

sleep 2

djm-client --host 127.0.0.1 --port 8000

kill -9 $BACK_PID

sleep 2