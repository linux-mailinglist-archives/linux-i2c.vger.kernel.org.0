Return-Path: <linux-i2c+bounces-3078-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 228B38AFCB4
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 01:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB46E1F23746
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 23:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5680F3F8C7;
	Tue, 23 Apr 2024 23:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="pl4ccOUs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC002D047;
	Tue, 23 Apr 2024 23:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713915393; cv=none; b=aR84bCw/Dev2rfRAnlV5ehNfMhHfVs5+3kgf0gx3bY6dRkqmoFY9DbZZfXA471k3RpNC/JQDQ2QFsJcnrPNNsLqRsJtaSIIfXFfbZewpnFizx/zBNseYX3JW1YaIQQRBekapC83qDFgwMLUcr71uX974H/vbfDZf8c3kkC5zieA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713915393; c=relaxed/simple;
	bh=yUyzNylz3PSmIe/qPAuooBMrsNyvy/UTp32g/0i9WEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fyc0S4OAvXAybG9LPnOosqwH/JRqh5LwonvfzuBFGh4G1t6u6H+uHlUlE2uOTUBS4E/F91nbD5L3mp3QjURcT7JqB+2DpRxSB4L6r/omU3ViWfWcDnY11xiylF8iKP1Cnzd/1NklCLqtizPZc0R0SbgTX/dy4Putly0ovgg2G4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=pl4ccOUs; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 0B92DC003AB9;
	Tue, 23 Apr 2024 16:36:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 0B92DC003AB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1713915389;
	bh=yUyzNylz3PSmIe/qPAuooBMrsNyvy/UTp32g/0i9WEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pl4ccOUsQEP38NMNbod8XTzSPWx96JXcm4+r+fDZ5+Jjajl7IKrwgLEaYqA7DHfmN
	 DhO+LyQQ0JD6LBOx316xVBWRkE5SuEtyjxUqzYZFzG1N5jzyGQzQwdcc79DvIYKl1e
	 9ZB+xxOKiofC3g60cT22gzw8a2HOVREDn4MInQz0=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 1420518041CAC6;
	Tue, 23 Apr 2024 16:36:27 -0700 (PDT)
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
Subject: [PATCH 1/4] i2c: designware: Create shared header hosting driver name
Date: Tue, 23 Apr 2024 16:36:19 -0700
Message-Id: <20240423233622.1494708-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
References: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have a number of drivers that reference the string "i2c_designware"
yet this is copied all over the places with opportunities for this
string being mis-used. Create a shared header that defines this as a
constant that other drivers can reference.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 MAINTAINERS                                 | 1 +
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 5 +++--
 drivers/i2c/busses/i2c-designware-platdrv.c | 5 +++--
 include/linux/i2c-designware.h              | 7 +++++++
 4 files changed, 14 insertions(+), 4 deletions(-)
 create mode 100644 include/linux/i2c-designware.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2d5acd6d98c4..d5e10c747f65 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21438,6 +21438,7 @@ R:	Jan Dabros <jsd@semihalf.com>
 L:	linux-i2c@vger.kernel.org
 S:	Supported
 F:	drivers/i2c/busses/i2c-designware-*
+F:	include/linux/i2c-designware.h
 
 SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER
 M:	Jaehoon Chung <jh80.chung@samsung.com>
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 9be9a2658e1f..948669265375 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -14,6 +14,7 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
+#include <linux/i2c-designware.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -27,7 +28,7 @@
 #include "i2c-designware-core.h"
 #include "i2c-ccgx-ucsi.h"
 
-#define DRIVER_NAME "i2c-designware-pci"
+#define DRIVER_NAME I2C_DESIGNWARE_NAME "-pci"
 
 enum dw_pci_ctl_id_t {
 	medfield,
@@ -425,7 +426,7 @@ static struct pci_driver dw_i2c_driver = {
 module_pci_driver(dw_i2c_driver);
 
 /* Work with hotplug and coldplug */
-MODULE_ALIAS("i2c_designware-pci");
+MODULE_ALIAS(DRIVER_NAME);
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
 MODULE_DESCRIPTION("Synopsys DesignWare PCI I2C bus adapter");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 4ab41ba39d55..dc335a22546b 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -16,6 +16,7 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
+#include <linux/i2c-designware.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
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
diff --git a/include/linux/i2c-designware.h b/include/linux/i2c-designware.h
new file mode 100644
index 000000000000..f20240ac89c4
--- /dev/null
+++ b/include/linux/i2c-designware.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __I2C_DESIGNWARE_H__
+#define __I2C_DESIGNWARE_H__
+
+#define I2C_DESIGNWARE_NAME	"i2c_designware"
+
+#endif /* __I2C_DESIGNWARE_H__ */
-- 
2.34.1


