Return-Path: <linux-i2c+bounces-3175-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8168B2B28
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 23:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA5411C227B8
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 21:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2E3155A4F;
	Thu, 25 Apr 2024 21:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FRqmzLRc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6C0155726;
	Thu, 25 Apr 2024 21:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081485; cv=none; b=XVc6xpEGnT54jcA/Tr560hgr9JKP5Jnq4o9j2zIfMnRdATv5BDlbFo9dowHba571JG2ZMlCgTuFvaXdc1g+JzNLJiFAuAO0xCbT1PEHoehoDtZJlxVlGnR31RCrjnjAbW9wOK0R0UdZdLIaSaSoZvg3fts1axhfBfRm+yGm27F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081485; c=relaxed/simple;
	bh=9mL/dj9SJENEHlN7H9ZQRKRS3vgcoRMl1JiH1RhpS0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=os+LFTB6Mp1VGVdhZYPuCTOuayYtj5bW61QMY3vEsfG41I+Qm7/kV8i03bD/U5yFt/nrT1B9B573WgafK0CwW1kygH//g0H3iBtQtbiKDndXtg1kgTPNb/iPBmw+BPCNi8fouHZBxU6Z20Q9vK6X+4I5tq7eBBBS+/UfwdWNF4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FRqmzLRc; arc=none smtp.client-ip=192.19.144.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 4813EC0005E5;
	Thu, 25 Apr 2024 14:44:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 4813EC0005E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1714081482;
	bh=9mL/dj9SJENEHlN7H9ZQRKRS3vgcoRMl1JiH1RhpS0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FRqmzLRcyzSfOxRf6V2y9d/ku6PZ4Jefrqx3EXIpa4pEOcEAv4W/Z4S0Uwc7NtWrA
	 Eit+GRi70AfnpxrZ6VMegSPdarPW8qLfhiw1hkcA/9PQosihFZQIKTTg4ZyFR6RZ4D
	 ohgaNNckJlQ1ZNoG4oOljRNdVUJ8ih1i0f2/d+cw=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 53DC418041CAC7;
	Thu, 25 Apr 2024 14:44:40 -0700 (PDT)
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
Subject: [PATCH v3 2/5] i2c: designware: Create shared header hosting driver name
Date: Thu, 25 Apr 2024 14:44:35 -0700
Message-Id: <20240425214438.2100534-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425214438.2100534-1-florian.fainelli@broadcom.com>
References: <20240425214438.2100534-1-florian.fainelli@broadcom.com>
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

Link: https://lore.kernel.org/all/20240422084109.3201-1-duanqiangwen@net-swift.com/ [1]
Link: https://lore.kernel.org/all/20240422084109.3201-2-duanqiangwen@net-swift.com/ [2]
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 MAINTAINERS                                  |  1 +
 drivers/i2c/busses/i2c-designware-platdrv.c  |  4 +++-
 include/linux/platform_data/i2c-designware.h | 12 ++++++++++++
 3 files changed, 16 insertions(+), 1 deletion(-)
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
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 0be7b0dc849b..107945d0337e 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -33,6 +33,8 @@
 #include <linux/suspend.h>
 #include <linux/units.h>
 
+#include <linux/platform_data/i2c-designware.h>
+
 #include "i2c-designware-core.h"
 
 static u32 i2c_dw_get_clk_rate_khz(struct dw_i2c_dev *dev)
@@ -489,7 +491,7 @@ static struct platform_driver dw_i2c_driver = {
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
index 000000000000..1196103df4f5
--- /dev/null
+++ b/include/linux/platform_data/i2c-designware.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __I2C_DESIGNWARE_PDATA_H__
+#define __I2C_DESIGNWARE_PDATA_H__
+
+/*
+ * This is the i2c-designware-platdrv.c platform driver name. This name is used
+ * to bind the device to the driver as well as by the driver itself to request
+ * the input reference clock.
+ */
+#define I2C_DESIGNWARE_NAME	"i2c_designware"
+
+#endif /* __I2C_DESIGNWARE_PDATA_H__ */
-- 
2.34.1


