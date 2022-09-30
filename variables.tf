variable "preferred_protocol" {
  type        = string
  description = "Delay profile preferred protocol."
  validation {
    condition     = contains(["torrent", "usenet"], var.preferred_protocol)
    error_message = "The preferred_protocol value must be either \"torrent\" or \"usenet\"."
  }

  default = "torrent"
}

variable "languages" {
  type        = list(string)
  description = "List of languages. First one will be the cutoff language."

  default = ["English"]
}

variable "series_folder_format" {
  type        = string
  description = "Series folder naming format."

  default = "{Series Title}"
}

variable "season_folder_format" {
  type        = string
  description = "Series folder naming format."

  default = "Season {season}"
}

variable "episode_format" {
  type        = string
  description = "Standard episode format."

  default = "{Series Title} - S{season:00}E{episode:00} - {Episode Title} {Quality Full}"
}

variable "root_folder" {
  type        = string
  description = "Root folder."
}

variable "indexers" {
  type        = map(any)
  description = "Indexer list."

  default = {}
}

variable "download_clients" {
  type        = map(any)
  description = "Download client list."

  default = {}
}