module "cloudflare_dns_record" {
  source  = "./modules/dns_record"
  project = var.project
  zone_id = var.cloudflare_zone_id
}
