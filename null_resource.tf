resource "null_resource" "cluster" {
  count = local.new_environment == "dev" ? 3 : 1
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("shellscrptingkey.pem")
      host        = element(aws_instance.public.*.public_ip, count.index)
      # host = self.public_ip
    }
  }
  provisioner "file" {
    source      = "node_exporter.service"
    destination = "/tmp/node_exporter.service"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("shellscrptingkey.pem")
      #host     = "${aws_instance.web-1.public_ip}"
      host = element(aws_instance.public.*.public_ip, count.index)
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/script.sh",
      "sudo /tmp/script.sh",
      "sudo useradd --no-create-home --shell /bin/false node_exporter",
      #his creates a restricted system user solely for running the Node Exporter, following the principle of least privilege
      "wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz",
      "tar xvf node_exporter-1.3.1.linux-amd64.tar.gz",
      "sudo cp node_exporter-1.3.1.linux-amd64/node_exporter /usr/local/bin/",
      "sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter",
      "sudo cp /tmp/node_exporter.service /lib/systemd/system/node_exporter.service",
      #Prepares Node Exporter to be managed as a systemd service (start/stop automatically, run at boot, etc.).
      "sudo systemctl unmask node_exporter.service",
      "sudo systemctl daemon-reload",
      "sudo systemctl start node_exporter",
      "sudo systemctl restart node_exporter",
      "sudo systemctl enable node_exporter",
      "sudo systemctl status node_exporter --no-pager",
      "rm -rf node_exporter*"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("shellscrptingkey.pem")
      host        = element(aws_instance.public.*.public_ip, count.index)
      #   host = self.public_ip
    }
  }
}