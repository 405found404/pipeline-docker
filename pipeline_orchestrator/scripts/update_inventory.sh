SLAVE_IP=$(terraform -chdir=terraform output -raw slave_ip)
cat > ansible/inventory.ini <<EOF
[slave]
$SLAVE_IP ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/deployer.pem
EOF

echo "Ansible inventory updated with slave IP: $SLAVE_IP"