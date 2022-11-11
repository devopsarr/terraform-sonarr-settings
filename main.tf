resource "sonarr_tag" "this" {
  label = "default"
}

resource "sonarr_delay_profile" "this" {
  enable_usenet             = true
  enable_torrent            = true
  bypass_if_highest_quality = true
  usenet_delay              = 0
  torrent_delay             = 0
  tags                      = [sonarr_tag.this.id]
  preferred_protocol        = var.preferred_protocol
}

resource "sonarr_language_profile" "this" {
  upgrade_allowed = true
  name            = "Default"
  cutoff_language = var.languages[0]
  languages       = var.languages
}

resource "sonarr_quality_profile" "this" {
  name            = "Default"
  upgrade_allowed = true
  cutoff          = 1100

  quality_groups = [
    {
      id   = 1100
      name = "4k"
      qualities = [
        {
          id         = 18
          name       = "WEBDL-2160p"
          source     = "web"
          resolution = 2160
        },
        {
          id         = 19
          name       = "Bluray-2160p"
          source     = "bluray"
          resolution = 2160
        }
      ]
    }
  ]
}

resource "sonarr_naming" "this" {
  rename_episodes            = true
  replace_illegal_characters = true
  multi_episode_style        = 0
  daily_episode_format       = "{Series Title} - {Air-Date} - {Episode Title} {Quality Full}"
  anime_episode_format       = var.episode_format
  series_folder_format       = var.series_folder_format
  season_folder_format       = var.season_folder_format
  specials_folder_format     = "Specials"
  standard_episode_format    = var.episode_format
}

resource "sonarr_root_folder" "this" {
  path = var.root_folder
}

resource "sonarr_media_management" "this" {
  unmonitor_previous_episodes = true
  hardlinks_copy              = true
  create_empty_folders        = true
  delete_empty_folders        = true
  enable_media_info           = true
  import_extra_files          = true
  set_permissions             = true
  skip_free_space_check       = true
  minimum_free_space          = 100
  recycle_bin_days            = 7
  chmod_folder                = "755"
  chown_group                 = "arrs"
  download_propers_repacks    = "preferAndUpgrade"
  episode_title_required      = "always"
  extra_file_extensions       = "srt,info"
  file_date                   = "none"
  recycle_bin_path            = "/bin"
  rescan_after_refresh        = "always"
}

resource "sonarr_indexer_config" "this" {
  depends_on        = [sonarr_media_management.this]
  maximum_size      = 0
  minimum_age       = 0
  retention         = 0
  rss_sync_interval = 25
}


resource "sonarr_indexer" "this" {
  for_each                = var.indexers
  enable_automatic_search = true
  name                    = each.key
  implementation          = each.value.implementation
  protocol                = each.value.protocol
  config_contract         = "${each.value.implementation}Settings"
  base_url                = each.value.url
  api_path                = "/api"
  categories              = [5030, 5040]
  tags                    = [sonarr_tag.this.id]
}

resource "sonarr_download_client_config" "this" {
  depends_on                         = [sonarr_indexer_config.this]
  enable_completed_download_handling = true
  auto_redownload_failed             = false
}

resource "sonarr_download_client" "this" {
  for_each        = var.download_clients
  enable          = true
  priority        = 1
  name            = each.key
  implementation  = each.value.implementation
  protocol        = each.value.protocol
  config_contract = "${each.value.implementation}Settings"
  host            = each.value.host
  url_base        = each.value.url_base
  port            = each.value.port
}
