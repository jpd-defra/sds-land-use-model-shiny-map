# created RDS of data used in the map

nca <- sf::st_read('/dbfs/mnt/base/unrestricted/source_defra_data_services_platform/dataset_national_character_areas/format_SHP_national_character_areas/LATEST_national_character_areas/National_Character_Areas___Natural_England.shp') %>%
  sf::st_transform(4326) %>%
  dplyr::select(Name = JCANAME)

saveRDS(nca,"data/nca.RDS")