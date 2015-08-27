# device 2
url="http://api-m2x.att.com/v2/devices"
deviceid="85cd26d1539e22c44ecd50794ad7a074"
streamid="tilt"
contenttype="Content-Type: application/json"
header=""
key="X-M2X-KEY: c41a6ca9a26a0531c130787ac749d444"


for i in {1..10}
do
echo $i

tilt=$((RANDOM % 20 + 30))
echo $tilt

eval `echo curl -i -X PUT -H \"Content-Type: application/json\" -H \"X-M2X-KEY: c41a6ca9a26a0531c130787ac749d444\" --data \''{"value": '$tilt'}'\' $url/$deviceid/streams/$streamid/value`


sleep 5
done