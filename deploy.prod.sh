#!/bin/bash
echo "Exceuting deploy.prod.sh for workfinder-frontend"
echo "Preparing for deploy Sanjiwani_backend BACKEND to api.codolyte.com"
ssh instance-2.us-central1-a.learned-mind-281610  << 'ENDSSH'
cd ~/apecto
echo "directory changed......"
sudo rm -Rv workfinderfrontend
git clone git remote add origin git@github.com:vdshinde36/workfinderfrontend.git
echo "cloning staered from git repository......."
cd workfinderfrontend
echo "directory changed......"
ls -ls
npm install
npm run build
sudo mv ~/apecto/workfinderfrontend/build/* /var/www/workfinder/
sudo service nginx restart
sudo service nginx status
exit
ENDSSH
