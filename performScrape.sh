timestamp=$(date +%c)
readonly IP_ADDRESS="192.168.0.1"
readonly SITE_NAME="site-name"
rm -r ${IP_ADDRESS}
wget --recursive --no-parent http://${IP_ADDRESS}
find $1 -type f -name "*.html?*" -delete
find . -name "*.html" | xargs sed -i "s/http:\/\/${IP_ADDRESS}\/\/${SITE_NAME}/g"
for i in `find $1 -type f`
do
   mv $i `echo $i | cut -d? -f1`
done