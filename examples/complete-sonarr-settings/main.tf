module "settings" {
  source = "../.."

  preferred_protocol = "torrent"
  languages          = ["English", "Italian"]

  root_folder = "/tmp"

  indexers = {
    example = {
      implementation = "Newznab"
      protocol       = "usenet"
      url            = "https://lolo.sickbeard.com"
    }
  }

  download_clients = {
    example = {
      implementation = "Transmission"
      protocol       = "torrent"
      host           = "transmission"
      url_base       = "/transmission/"
      port           = 9091
    }
  }
}