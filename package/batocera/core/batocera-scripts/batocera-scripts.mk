################################################################################
#
# batocera scripts
#
################################################################################

BATOCERA_SCRIPTS_VERSION = 1.0
BATOCERA_SCRIPTS_LICENSE = GPL
BATOCERA_SCRIPTS_DEPENDENCIES = pciutils
BATOCERA_SCRIPTS_SOURCE=

define BATOCERA_SCRIPTS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/python2.7 $(TARGET_DIR)/usr/bin $(TARGET_DIR)/usr/share/sounds
	cp package/batocera/core/batocera-scripts/Mallet.wav           $(TARGET_DIR)/usr/share/sounds

	install -m 0755 package/batocera/core/batocera-scripts/scripts/bluetooth/bluezutils.py            $(TARGET_DIR)/usr/lib/python2.7/ # any variable ?
	install -m 0755 package/batocera/core/batocera-scripts/scripts/bluetooth/batocera-bluetooth       $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/bluetooth/batocera-bluetooth-agent $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-settings               $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-save-overlay           $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-es-theme               $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-retroachievements-info $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-kodilauncher           $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-usbmount               $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-encode                 $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-info                   $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-install                $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-mount                  $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-overclock              $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-part                   $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-support                $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-sync                   $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-upgrade                $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-systems                $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-config                 $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-moonlight              $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-es-thebezelproject     $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-cores                  $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-hybrid-nvidia          $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-wifi                   $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-brightness             $(TARGET_DIR)/usr/bin/
	install -m 0755 package/batocera/core/batocera-scripts/scripts/batocera-es-swissknife          $(TARGET_DIR)/usr/bin/

	# hooks
        mkdir -p $(TARGET_DIR)/usr/share/batocera/configgen/scripts
        install -m 0755 package/batocera/core/batocera-scripts/hooks/bluetooth-discovery-hook $(TARGET_DIR)/usr/share/batocera/configgen/scripts/
endef

define BATOCERA_SCRIPTS_INSTALL_XORG
	mkdir -p $(TARGET_DIR)/etc/X11/xorg.conf.d
	ln -fs /userdata/system/99-nvidia.conf $(TARGET_DIR)/etc/X11/xorg.conf.d/99-nvidia.conf
endef

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
  BATOCERA_SCRIPTS_POST_INSTALL_TARGET_HOOKS += BATOCERA_SCRIPTS_INSTALL_XORG
endif

$(eval $(generic-package))
