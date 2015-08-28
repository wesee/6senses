# device 6
url="http://api-m2x.att.com/v2/devices"
deviceid="8c9573b007db6ed17239b12b522f6e1d"
streamid="tilt"
contenttype="Content-Type: application/json"
header=""
key="X-M2X-KEY: 7bae4da2b610c3d844e4c38e777812b2"


for i in {1..100}
do
echo $i

tilt=$((RANDOM % 20 + 35))
echo $tilt

eval `echo curl -i -X PUT -H \"Content-Type: application/json\" -H \"X-M2X-KEY: 7bae4da2b610c3d844e4c38e777812b2\" --data \''{"value": '$tilt'}'\' $url/$deviceid/streams/$streamid/value`


sleep 6
done