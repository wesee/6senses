# device 3
url="http://api-m2x.att.com/v2/devices"
deviceid="0d9258c455419b48a10617ae728b4f12"
streamid="tilt"
contenttype="Content-Type: application/json"
header=""
key="X-M2X-KEY: 187dcd1ee47767555b552a564ef45406"


for i in {1..50}
do
echo $i

tilt=$((RANDOM % 20 + 35))
echo $tilt

eval `echo curl -i -X PUT -H \"Content-Type: application/json\" -H \"X-M2X-KEY: 187dcd1ee47767555b552a564ef45406\" --data \''{"value": '$tilt'}'\' $url/$deviceid/streams/$streamid/value`


sleep 7
done