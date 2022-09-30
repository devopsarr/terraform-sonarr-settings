## terraform-sonarr-settings

Terraform module which creates basic configuration for [Sonarr](https://sonarr.tv/)

## Usage
It is important to export the provider credentials for this module to work. Following are required.

1. SONARR_URL
2. SONARR_API_TOKEN

```
module "settings" {
  source = "../.."

  preferred_protocol = "torrent"
  languages          = ["English", "Italian"]

  root_folder = "/tmp"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_sonarr"></a> [sonarr](#requirement\_sonarr) | >= 2.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_sonarr"></a> [sonarr](#provider\_sonarr) | >= 2.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [sonarr_delay_profile.this](https://registry.terraform.io/providers/devopsarr/sonarr/latest/docs/resources/delay_profile) | resource |
| [sonarr_download_client.this](https://registry.terraform.io/providers/devopsarr/sonarr/latest/docs/resources/download_client) | resource |
| [sonarr_download_client_config.this](https://registry.terraform.io/providers/devopsarr/sonarr/latest/docs/resources/download_client_config) | resource |
| [sonarr_indexer.this](https://registry.terraform.io/providers/devopsarr/sonarr/latest/docs/resources/indexer) | resource |
| [sonarr_indexer_config.this](https://registry.terraform.io/providers/devopsarr/sonarr/latest/docs/resources/indexer_config) | resource |
| [sonarr_language_profile.this](https://registry.terraform.io/providers/devopsarr/sonarr/latest/docs/resources/language_profile) | resource |
| [sonarr_media_management.this](https://registry.terraform.io/providers/devopsarr/sonarr/latest/docs/resources/media_management) | resource |
| [sonarr_naming.this](https://registry.terraform.io/providers/devopsarr/sonarr/latest/docs/resources/naming) | resource |
| [sonarr_quality_profile.this](https://registry.terraform.io/providers/devopsarr/sonarr/latest/docs/resources/quality_profile) | resource |
| [sonarr_root_folder.this](https://registry.terraform.io/providers/devopsarr/sonarr/latest/docs/resources/root_folder) | resource |
| [sonarr_tag.this](https://registry.terraform.io/providers/devopsarr/sonarr/latest/docs/resources/tag) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_download_clients"></a> [download\_clients](#input\_download\_clients) | Download client list. | `map(any)` | `{}` | no |
| <a name="input_episode_format"></a> [episode\_format](#input\_episode\_format) | Standard episode format. | `string` | `"{Series Title} - S{season:00}E{episode:00} - {Episode Title} {Quality Full}"` | no |
| <a name="input_indexers"></a> [indexers](#input\_indexers) | Indexer list. | `map(any)` | `{}` | no |
| <a name="input_languages"></a> [languages](#input\_languages) | List of languages. First one will be the cutoff language. | `list(string)` | <pre>[<br>  "English"<br>]</pre> | no |
| <a name="input_preferred_protocol"></a> [preferred\_protocol](#input\_preferred\_protocol) | Delay profile preferred protocol. | `string` | `"torrent"` | no |
| <a name="input_root_folder"></a> [root\_folder](#input\_root\_folder) | Root folder. | `string` | n/a | yes |
| <a name="input_season_folder_format"></a> [season\_folder\_format](#input\_season\_folder\_format) | Series folder naming format. | `string` | `"Season {season}"` | no |
| <a name="input_series_folder_format"></a> [series\_folder\_format](#input\_series\_folder\_format) | Series folder naming format. | `string` | `"{Series Title}"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
