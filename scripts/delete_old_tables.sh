#!/bin/bash
# purge table

echo "set @tin = 'netflow_in_hour';" > /tmp/rotate.sql
echo "set @tout = 'netflow_out_hour';" >> /tmp/rotate.sql
echo "call rotate_partition(@tin);" >> /tmp/rotate.sql
echo "call rotate_partition(@tout);" >> /tmp/rotate.sql

mysql -u pmacct -h 127.0.0.1 --password='XXX' pmacct < /tmp/rotate.sql
