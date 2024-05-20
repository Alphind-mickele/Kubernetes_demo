#-----Lab preparation script for EKS---------------------------
#------By SaravanaGanesh Ulagamani-----------------------------
#-----this script will install docekr, AWSCLI, EKSCTL, KUBECTL---------
#-----This script created for amozon-linux-2-------------------
#---This can be also added in user-data in the aws insatnce----

#--------install Docker CE ------------------------------------
 sudo Yum update -y && yum install docker unzip -y 
 sudo systemctl enable docker
 sudo systemctl start docker 
 sudo usermod -aG docker $USER 
 sudo usermod -aG docker ec2-user

#--------install AWS CLI ------------------------------------
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version 

#--------install KUBECTL ------------------------------------
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
kubectl version --client

#--------install EKSCTL ------------------------------------

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/bin
eksctl version