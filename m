Return-Path: <linux-i2c+bounces-3120-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 400BC8B17FE
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 02:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3EE71C23128
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 00:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F2C8F5A;
	Thu, 25 Apr 2024 00:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FiZ124UI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58D981F;
	Thu, 25 Apr 2024 00:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714004813; cv=none; b=nikhsowRW6jWKUOgBfqxngqW9FwdVb8RVhSeck1zi6YQuG/UBW9OgpwO36dQBxLf7XSso3rKv3qhS6K4Vj+qeseol/s1M0PTNfW5cyC7IPcDqsB3rfXwZiFWt8bpfKwoL3vbyhXbFvW60VAjSDcrPMoRxS/5Cx3nRiFXm8dvTCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714004813; c=relaxed/simple;
	bh=F1S87CksO9YcMorfhmRvrNBLU5zsOwiltZkftyOz8f0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kDe+pZKZTtFiDc+XG7DSPgPzNTrMWzoZl8aw+hR5YLHgso2gPGRg2RJE41SL6MLl7qY6yK3YnI9w37ZYItvdujzWfWtikqCoFJQDi4B12CuKpz4X6oVgpGJCIjpfiI8aaDxjFhvj5aRY+EshdJaKgdaiqrEGZcEpk44VuL2FHeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FiZ124UI; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id AF56FC000C85;
	Wed, 24 Apr 2024 17:26:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com AF56FC000C85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1714004804;
	bh=F1S87CksO9YcMorfhmRvrNBLU5zsOwiltZkftyOz8f0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FiZ124UIT6v8GQZ6pbi0LVPT++DjpeKtPSETWqf7Af18UC9POLdwVidzRDKSx6kXP
	 l2JcRbfyVR8vN4fTdkmZiP6qwWFfHZT8f6r5nCFAjK5V5e7bKMyInGd4M5FQOFeh0o
	 VkKOX+g2mgOfPJI++33OwzQIWqYeCXCIGfZzEaV0=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id B80CB18041CAC6;
	Wed, 24 Apr 2024 17:26:42 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	linux-i2c@vger.kernel.org (open list:SYNOPSYS DESIGNWARE I2C DRIVER),
	netdev@vger.kernel.org (open list:WANGXUN ETHERNET DRIVER)
Subject: [PATCH v2 1/4] i2c: designware: Create shared header hosting driver name
Date: Wed, 24 Apr 2024 17:26:39 -0700
Message-Id: <20240425002642.2053657-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425002642.2053657-1-florian.fainelli@broadcom.com>
References: <20240425002642.2053657-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have a number of drivers that reference the string "i2c_designware"
towards two goals:

- ensure their device gets bound to the i2c_designware platform_driver
- create a clock lookup reference that matches the i2c_designware
  instance number for the i2c-designware-platdrv.c driver to be able to
  lookup the input reference clock

Since this string is copied in a bunch of different places and since it
is possible to get this named wrong (see [1] and [2]) with unintended
consequences, create a header file that hosts that define for other
drivers to use and all agree on the correct name to use.

[1]:
https://lore.kernel.org/all/20240422084109.3201-1-duanqiangwen@net-swift.com/
[2]:
https://lore.kernel.org/all/20240422084109.3201-2-duanqiangwen@net-swift.com/

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 MAINTAINERS                                  |  1 +
 drivers/i2c/busses/i2c-designware-pcidrv.c   |  3 ++-
 drivers/i2c/busses/i2c-designware-platdrv.c  |  5 +++--
 include/linux/platform_data/i2c-designware.h | 11 +++++++++++
 4 files changed, 17 insertions(+), 3 deletions(-)
 create mode 100644 include/linux/platform_data/i2c-designware.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2d5acd6d98c4..da1b39df2b94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21438,6 +21438,7 @@ R:	Jan Dabros <jsd@semihalf.com>
 L:	linux-i2c@vger.kernel.org
 S:	Supported
 F:	drivers/i2c/busses/i2c-designware-*
+F:	include/linux/platform_data/i2c-designware.h
 
 SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER
 M:	Jaehoon Chung <jh80.chung@samsung.com>
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 9be9a2658e1f..32d6f338a1ea 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -19,6 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/platform_data/i2c-designware.h>
 #include <linux/pm_runtime.h>
 #include <linux/power_supply.h>
 #include <linux/sched.h>
@@ -425,7 +426,7 @@ static struct pci_driver dw_i2c_driver = {
 module_pci_driver(dw_i2c_driver);
 
 /* Work with hotplug and coldplug */
-MODULE_ALIAS("i2c_designware-pci");
+MODULE_ALIAS(I2C_DESIGNWARE_NAME "-pci");
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
 MODULE_DESCRIPTION("Synopsys DesignWare PCI I2C bus adapter");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 4ab41ba39d55..8aa2bf274d78 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -22,6 +22,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/platform_data/i2c-designware.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
@@ -480,13 +481,13 @@ static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
 };
 
 /* Work with hotplug and coldplug */
-MODULE_ALIAS("platform:i2c_designware");
+MODULE_ALIAS("platform:" I2C_DESIGNWARE_NAME);
 
 static struct platform_driver dw_i2c_driver = {
 	.probe = dw_i2c_plat_probe,
 	.remove_new = dw_i2c_plat_remove,
 	.driver		= {
-		.name	= "i2c_designware",
+		.name	= I2C_DESIGNWARE_NAME,
 		.of_match_table = of_match_ptr(dw_i2c_of_match),
 		.acpi_match_table = ACPI_PTR(dw_i2c_acpi_match),
 		.pm	= pm_ptr(&dw_i2c_dev_pm_ops),
diff --git a/include/linux/platform_data/i2c-designware.h b/include/linux/platform_data/i2c-designware.h
new file mode 100644
index 000000000000..e385b6d70a04
--- /dev/null
+++ b/include/linux/platform_data/i2c-designware.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __I2C_DESIGNWARE_PDATA_H__
+#define __I2C_DESIGNWARE_PDATA_H__
+
+/* This is the i2c-designware-platdrv.c platform driver name. This name is used
+ * to bind the device to the driver, as well as by the driver itself to request
+ * the input reference clock
+ */
+#define I2C_DESIGNWARE_NAME	"i2c_designware"
+
+#endif /* __I2C_DESIGNWARE_PDATA_H__ */
-- 
2.34.1


