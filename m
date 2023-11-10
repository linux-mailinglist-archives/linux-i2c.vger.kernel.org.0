Return-Path: <linux-i2c+bounces-15-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F807E813E
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2701FB20FA9
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74EDF3A295;
	Fri, 10 Nov 2023 18:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWln275s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA6E38DE9
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 18:26:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C5BC293E3;
	Fri, 10 Nov 2023 10:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699640789; x=1731176789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fA4wI6REMt5xrvlGqZW7ug+64blc2EEl5FTiwCmCoEA=;
  b=kWln275sYwY6XZHSIKU+u8znkJPYlcZNh+mXpoq8IBOq3k5FvJnASdg+
   TAPkEScjOBqlAeWKUKGmlYO5GlS2PqwO8P/W8Q5FmAQ3LqctqqtOSaPMG
   EGe0l+p+BGz95rvbptdUSzw9X9t0/mmRj9M6ouXW03QQr+uPzC9WwQr1I
   gi6hu4N3ln10UqN5vJDNaoiDRCli6yvDsXlutiwYBJX5vAFi3mhB9VBid
   NAahQmMLhl3C/cLfwLedMOd4N4FyHaNrom0AU+rV9iZV+ISpIfad9+NO5
   lUyjJj2hvPm8nge7NN8C8SiI5lgTiUbudVF45scfnmJbB3Zio6cd0FeGJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="375251968"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="375251968"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:23:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="798663772"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="798663772"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 10 Nov 2023 10:23:25 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4593F8D1; Fri, 10 Nov 2023 20:23:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 21/25] i2c: designware: Propagate firmware node
Date: Fri, 10 Nov 2023 20:11:41 +0200
Message-ID: <20231110182304.3894319-22-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate firmware node by using a specific API call, i.e. device_set_node().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c  | 2 ++
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 2 --
 drivers/i2c/busses/i2c-designware-platdrv.c | 3 ---
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 68d6a1c642a0..45b5c910b8db 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -715,6 +715,8 @@ void i2c_dw_disable(struct dw_i2c_dev *dev)
 
 int i2c_dw_probe(struct dw_i2c_dev *dev)
 {
+	device_set_node(&dev->adapter.dev, dev_fwnode(dev->dev));
+
 	switch (dev->mode) {
 	case DW_IC_SLAVE:
 		return i2c_dw_probe_slave(dev);
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index c9eb01a16048..f9fbd41c188d 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -9,7 +9,6 @@
  * Copyright (C) 2009 Provigent Ltd.
  * Copyright (C) 2011, 2015, 2016 Intel Corporation.
  */
-#include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -273,7 +272,6 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	adap = &dev->adapter;
 	adap->owner = THIS_MODULE;
 	adap->class = 0;
-	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
 	adap->nr = controller->bus_num;
 
 	r = i2c_dw_probe(dev);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index d9a64006a3d6..1b76f721bf81 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -8,7 +8,6 @@
  * Copyright (C) 2007 MontaVista Software Inc.
  * Copyright (C) 2009 Provigent Ltd.
  */
-#include <linux/acpi.h>
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -305,8 +304,6 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	adap->owner = THIS_MODULE;
 	adap->class = dmi_check_system(dw_i2c_hwmon_class_dmi) ?
 					I2C_CLASS_HWMON : I2C_CLASS_DEPRECATED;
-	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
-	adap->dev.of_node = pdev->dev.of_node;
 	adap->nr = -1;
 
 	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
-- 
2.43.0.rc1.1.gbec44491f096


