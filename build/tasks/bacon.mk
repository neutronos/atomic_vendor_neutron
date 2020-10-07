# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------
# PixysOS OTA update package

ifneq ($(BUILD_WITH_COLORS),0)
    include $(TOP_DIR)vendor/neutron/build/core/colors.mk
endif

NEUTRON_TARGET_PACKAGE := $(PRODUCT_OUT)/$(NEUTRON_VERSION).zip
NEUTRON_TARGET_PACKAGE_FOLDER := $(PRODUCT_OUT)
NEUTRON_BUILD_TIME := 

MD5 := prebuilts/build-tools/path/$(HOST_OS)-x86/md5sum

.PHONY: bacon pixys
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(NEUTRON_TARGET_PACKAGE)
	$(hide) $(MD5) $(NEUTRON_TARGET_PACKAGE) > $(NEUTRON_TARGET_PACKAGE).md5sum
	@echo -e ${CL_BLU}"                                                                                                                              "${CL_BLU}
	@echo -e ${CL_RED}"                                      Your Build Is Ready! Enjoy the NeutronOS                                                  "${CL_RED}
	@echo -e ${CL_CYN}"=============================-Package Details-============================"${CL_RST}
	@echo -e ${CL_CYN}"Folder Location: "${CL_MAG} $(NEUTRON_TARGET_PACKAGE_FOLDER)${CL_RST}
	@echo -e ${CL_CYN}"ZipName        : "${CL_MAG} $(NEUTRON_VERSION).zip${CL_RST}
	@echo -e ${CL_CYN}"MD5            : "${CL_MAG}" $(shell cat $(NEUTRON_TARGET_PACKAGE).md5sum | awk '{print $$1}')"${CL_RST}
	@echo -e ${CL_CYN}"Size           : "${CL_MAG}" $(shell du -hs $(NEUTRON_TARGET_PACKAGE) | awk '{print $$1}')"${CL_RST}
	@echo -e ${CL_CYN}"Size(in bytes) : "${CL_MAG}" $(shell wc -c $(NEUTRON_TARGET_PACKAGE) | awk '{print $$1}')"${CL_RST}
	@echo -e ${CL_CYN}"DateTime       : "${CL_MAG} $(NEUTRON_BUILD_DATETIME)${CL_RST}
	@echo -e ${CL_CYN}"Build Type     : "${CL_MAG} $(NEUTRON_BUILD_TYPE)${CL_RST}
	@echo -e ${CL_CYN}"==========================================================================="${CL_RST}
	@echo -e ""

pixys: bacon
