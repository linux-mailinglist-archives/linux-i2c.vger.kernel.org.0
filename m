Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54F2778079
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jul 2019 18:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbfG1QnE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Jul 2019 12:43:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:49204 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726046AbfG1QnE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 28 Jul 2019 12:43:04 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 20CCAAD88;
        Sun, 28 Jul 2019 16:43:03 +0000 (UTC)
Date:   Sun, 28 Jul 2019 18:42:55 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Arnd Bergmann <arnd@arndb.de>,
        LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] nvmem: Use the same permissions for eeprom as for
 nvmem
Message-ID: <20190728184255.563332e6@endymion>
In-Reply-To: <20190728184138.78afc30f@endymion>
References: <20190728184138.78afc30f@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The compatibility "eeprom" attribute is currently root-only no
matter what the configuration says. The "nvmem" attribute does
respect the setting of the root_only configuration bit, so do the
same for "eeprom".

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Fixes: b6c217ab9be6 ("nvmem: Add backwards compatibility support for older EEPROM drivers.")
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@arndb.de>
---
Changes since V1:
 * Split into 2 patches, one to the at24 driver and one to the nvmem
   core. drivers/nvmem/nvmem-sysfs.c |   15 +++++++++++----

 1 file changed, 11 insertions(+), 4 deletions(-)

--- linux-5.2.orig/drivers/nvmem/nvmem-sysfs.c	2019-07-08 00:41:56.000000000 +0200
+++ linux-5.2/drivers/nvmem/nvmem-sysfs.c	2019-07-28 18:06:53.105140893 +0200
@@ -224,10 +224,17 @@ int nvmem_sysfs_setup_compat(struct nvme
 	if (!config->base_dev)
 		return -EINVAL;
 
-	if (nvmem->read_only)
-		nvmem->eeprom = bin_attr_ro_root_nvmem;
-	else
-		nvmem->eeprom = bin_attr_rw_root_nvmem;
+	if (nvmem->read_only) {
+		if (config->root_only)
+			nvmem->eeprom = bin_attr_ro_root_nvmem;
+		else
+			nvmem->eeprom = bin_attr_ro_nvmem;
+	} else {
+		if (config->root_only)
+			nvmem->eeprom = bin_attr_rw_root_nvmem;
+		else
+			nvmem->eeprom = bin_attr_rw_nvmem;
+	}
 	nvmem->eeprom.attr.name = "eeprom";
 	nvmem->eeprom.size = nvmem->size;
 #ifdef CONFIG_DEBUG_LOCK_ALLOC


-- 
Jean Delvare
SUSE L3 Support
