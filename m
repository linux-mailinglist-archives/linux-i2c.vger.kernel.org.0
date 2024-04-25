Return-Path: <linux-i2c+bounces-3178-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DA98B2B31
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 23:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 728CE1C22ECF
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 21:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8156815667C;
	Thu, 25 Apr 2024 21:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="u0NAEyL8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBA7153834;
	Thu, 25 Apr 2024 21:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081486; cv=none; b=ARPWe3qa7XAG8RhQn2jTSctPcnCctQHyt142PbKilFaYzcHq8I91vvN+ZrkPFFv4GtNp7B46Kv3/xXhVgW6rFrNRZDrreehHn9+OnxhxnTGIiF4LhR+uQMF10PkeV/rcprWZUWlWetMmNA64xQngd9rGjlI5fO5OaWhJIYEGZ3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081486; c=relaxed/simple;
	bh=XWtzJrSwSicDwJ6itlPAo63YEYNCPCp+5FvVdfwfwc8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qR9qnzH1eMXy13BROlpZy3+dB0oChr01WnM67A47iaUURucJwnOdf5HyFq8XNzKWaw8oZIpiEEXWFstXnYBinAbr/+57/3KnR8VxLb6RScrNy9poXYM4XTQZGThylBJ+8spXfTzCjtAjDNxM5oeOHfYyJdakUrtGkq9HQ8NOBhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=u0NAEyL8; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 1984FC002825;
	Thu, 25 Apr 2024 14:44:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 1984FC002825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1714081482;
	bh=XWtzJrSwSicDwJ6itlPAo63YEYNCPCp+5FvVdfwfwc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u0NAEyL8pRwRLU25wUUIBJiXuxfN6Z27cFNnJiypMuatqHijrxLYyy2Vr18QNCHnQ
	 Mi/luXIxXVlsbx2M4QsAHvrMusqMboLsCztYbPlODNZDn930lB/SnlO+Zr90LVg7Ih
	 mq+BUrR8b73DZ28tFHKJQ32GcACt4S/9AbnoU9g4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 183C718041CAC6;
	Thu, 25 Apr 2024 14:44:40 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
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
Subject: [PATCH v3 1/5] i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()
Date: Thu, 25 Apr 2024 14:44:34 -0700
Message-Id: <20240425214438.2100534-2-florian.fainelli@broadcom.com>
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

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

As Krzysztof Kozlowski pointed out the better is to use
MODULE_DEVICE_TABLE() as it will be consistent with the content
of the real ID table of the platform devices.

While at it, drop unneeded and unused module alias in PCI glue
driver as PCI already has its own ID table and automatic loading
should just work.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Link: https://lore.kernel.org/r/20231120144641.1660574-9-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 2 --
 drivers/i2c/busses/i2c-designware-platdrv.c | 8 ++++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 9be9a2658e1f..a1b379a1e904 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -424,8 +424,6 @@ static struct pci_driver dw_i2c_driver = {
 };
 module_pci_driver(dw_i2c_driver);
 
-/* Work with hotplug and coldplug */
-MODULE_ALIAS("i2c_designware-pci");
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
 MODULE_DESCRIPTION("Synopsys DesignWare PCI I2C bus adapter");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 4ab41ba39d55..0be7b0dc849b 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -479,8 +479,11 @@ static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
 	RUNTIME_PM_OPS(dw_i2c_plat_runtime_suspend, dw_i2c_plat_runtime_resume, NULL)
 };
 
-/* Work with hotplug and coldplug */
-MODULE_ALIAS("platform:i2c_designware");
+static const struct platform_device_id dw_i2c_platform_ids[] = {
+	{ "i2c_designware" },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, dw_i2c_platform_ids);
 
 static struct platform_driver dw_i2c_driver = {
 	.probe = dw_i2c_plat_probe,
@@ -491,6 +494,7 @@ static struct platform_driver dw_i2c_driver = {
 		.acpi_match_table = ACPI_PTR(dw_i2c_acpi_match),
 		.pm	= pm_ptr(&dw_i2c_dev_pm_ops),
 	},
+	.id_table = dw_i2c_platform_ids,
 };
 
 static int __init dw_i2c_init_driver(void)
-- 
2.34.1


