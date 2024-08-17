variable "bucket_prefix" {
  type        = string
  description = "A prefix applied to the S3 bucket created to ensure a unique name."
  default = "mybuck"
}

variable "index_config" {
  type = object({
    key_name = string
    source_name = string
    acl = string
    content_type = string 
  })
  description = "Configurations of index.html"
  default = {
    key_name = "index.html"
    source_name = "my_music_site/index.html"
    acl = "public-read"
    content_type = "text/html"
  }
}

variable "logo_config" {
  type = object({
    key_name = string
    source_name = string
    acl = string 
  })
  description = "Configurations of MyMusic Logo"
  default = {
    key_name = "LogoMyMusic.png"
    source_name = "my_music_site/LogoMyMusic.png"
    acl = "public-read"
  }
}

variable "qrCode_config" {
  type = object({
    key_name = string
    source_name = string
    acl = string 
  })
  description = "Configurations of MyMusic QR Code"
  default = {
    key_name = "qrCode.png"
    source_name = "my_music_site/qrCode.png"
    acl = "public-read"
  }
}

variable "website_document" {
  type = string
  description = "Suffix of index document"
  default = "index.html"
}