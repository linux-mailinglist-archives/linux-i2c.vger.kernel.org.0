Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7C2076726
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jul 2019 15:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbfGZNST (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Jul 2019 09:18:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:47740 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726001AbfGZNST (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Jul 2019 09:18:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 7950AAC8C;
        Fri, 26 Jul 2019 13:18:18 +0000 (UTC)
Date:   Fri, 26 Jul 2019 15:18:16 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] eeprom: at24: make spd world-readable again
Message-ID: <20190726151816.66f2ff2f@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The integration of the at24 driver into the nvmem framework broke the
world-readability of spd EEPROMs. Fix it.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Fixes: 57d155506dd5 ("eeprom: at24: extend driver to plug into the NVMEM framework")
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 drivers/misc/eeprom/at24.c |    2 +-
 drivers/nvmem/core.c       |   15 +++++++++++----
 2 files changed, 12 insertions(+), 5 deletions(-)

--- linux-5.1.orig/drivers/misc/eeprom/at24.c	2019-05-06 02:42:58.000000000 +0200
+++ linux-5.1/drivers/misc/eeprom/at24.c	2019-07-26 13:56:37.612197390 +0200
@@ -719,7 +719,7 @@ static int at24_probe(struct i2c_client
 	nvmem_config.name = dev_name(dev);
 	nvmem_config.dev = dev;
 	nvmem_config.read_only = !writable;
-	nvmem_config.root_only = true;
+	nvmem_config.root_only = !(flags & AT24_FLAG_IRUGO);
 	nvmem_config.owner = THIS_MODULE;
 	nvmem_config.compat = true;
 	nvmem_config.base_dev = dev;
--- linux-5.1.orig/drivers/nvmem/core.c	2019-07-23 19:30:27.630099103 +0200
+++ linux-5.1/drivers/nvmem/core.c	2019-07-26 14:21:31.002908472 +0200
@@ -435,10 +435,17 @@ static int nvmem_setup_compat(struct nvm
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
