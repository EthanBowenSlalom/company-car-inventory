# Regen JAR file

echo "
###################################################
#######                                     #######
#######  | '_ \` _ \ / _\` \ \ / / _ \ '_ \   #######
#######  | | | | | | (_| |\ V /  __/ | | |  #######
#######  |_| |_| |_|\__,_| \_/ \___|_| |_   #######
#######                                     #######
###################################################
"

cd ../
mvn clean -f "/Users/ethan.bowen/Documents/Git/hertz/company-car-inventory-service/pom.xml"
mvn package -f "/Users/ethan.bowen/Documents/Git/hertz/company-car-inventory-service/pom.xml"

echo "
##################################################
#######       _            _               #######
#######    __| | ___   ___| | _____ _ __   #######
#######   / _\` |/ _ \ / __| |/ / _ \ '__|  #######
#######  | (_| | (_) | (__|   <  __/ |     #######
#######   \__,_|\___/ \___|_|\_\___|_|     #######
#######                                    #######
##################################################
"

# Update Image with new JAR
cd docker/
sh ./docker-cli-build.sh

echo "
#################################
#######                   #######
#######  | | _( _ ) ___   #######
#######  | |/ / _ \/ __|  #######
#######  |   < (_) \__ \  #######
#######  |_|\_\___/|___/  #######
#######                   #######
#################################
"
               
# Down and Up K8s (maybe should be a better way to do this)
cd ../kubernetes/
sh destroy.sh
sh apply.sh