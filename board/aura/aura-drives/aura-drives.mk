AURA_DRIVES_VERSION = 1.0
AURA_DRIVES_SITE = $(BR2_EXTERNAL_AURA_OS_PATH)/board/aura/aura-drives
AURA_DRIVES_SITE_METHOD = local
AURA_DRIVES_DEPENDENCIES = host-rustc

define AURA_DRIVES_BUILD_CMDS
	$(TARGET_MAKE_ENV) cargo build --release --manifest-path $(@D)/Cargo.toml
endef

define AURA_DRIVES_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/target/release/aura-drives $(TARGET_DIR)/usr/bin/aura-drives
endef

$(eval $(generic-package))
