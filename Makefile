TOP=$(CURDIR)
OUTPUT_DIR=$(TOP)/output
BR_DIR=$(TOP)/buildroot
BR2_DL_DIR=$(HOME)/.br2_download_cache

export BR2_EXTERNAL_GADGETOS_PATH=$(CURDIR)/gadget

all:
	@make -C $(BR_DIR) O=$(OUTPUT_DIR)

%_defconfig:
	@make -C $(BR_DIR) O=$(OUTPUT_DIR) $@

%:
	@make -C $(BR_DIR) O=$(OUTPUT_DIR) $@


nconfig:
	@make -C $(BR_DIR) O=$(OUTPUT_DIR) nconfig
help:
	@$(foreach b, $(sort $(notdir $(wildcard $(BR2_EXTERNAL_GADGETOS_PATH)/configs/*_defconfig))), \
	  printf "  %-29s - Build for %s\\n" $(b) $(b:_defconfig=);)
