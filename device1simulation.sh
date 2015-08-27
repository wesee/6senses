# device 1
url="http://api-m2x.att.com/v2/devices"
deviceid="f407f423eee4a9b440afb3e2bdeb7719"
streamid="tilt"
contenttype="Content-Type: application/json"
header=""
key="X-M2X-KEY: 25cb6717f51fc93c5f1cdffb41b6b206"


for i in {1..10}
do
echo $i

tilt=$((RANDOM % 20 + 30))
echo $tilt

eval `echo curl -i -X PUT -H \"Content-Type: application/json\" -H \"X-M2X-KEY: 25cb6717f51fc93c5f1cdffb41b6b206\" --data \''{"value": '$tilt'}'\' $url/$deviceid/streams/$streamid/value`


sleep 5
done