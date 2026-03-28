VPC
│
├── Internet Gateway
│
├── Public Subnets
│     └── NAT Gateway
│
└── Private Subnets
      └── Route → NAT → Internet.



# Command to get the kube config file
aws eks update-kubeconfig \
            --region us-east-2 \
            --name teleios-jibike-staging-eks


kubectl logs -f external-dns-6447ddb499-bzmjc -n external-dns


kubectl get pod -A