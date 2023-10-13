#!/bin/bash

#give permission for everything in the express-app directory
sudo chmod -R 777 /home/ec2-user/AwsDemo

#navigate into our working directory where we have all our github files
cd /home/ec2-user/AwsDemo

#add npm and node to path
export NVM_DIR="$HOME/.nvm"	
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # loads nvm	
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # loads nvm bash_completion (node is in path now)

#install node modules
#npm install

#build app
#npm run build
gradle clean build install

#copy folder build to www
cp -r /home/ec2-user/AwsDemo/build/* /var/www/html/react/

#start our node app in the background
# node /src/index.js > app.out.log 2> app.err.log < /dev/null & 
# npm run build > app.out.log 2> app.err.log < /dev/null &
npm start > app.out.log 2> app.err.log < /dev/null &