resource "cloudflare_record" "example" {
  zone_id = var.zone_id
  comment = "${var.project}_${terraform.workspace}_cloudflare_dns_record"
  name    = "sample"
  value   = "This record is created by Terraform."
  type    = "TXT"
  ttl     = 3600
}
