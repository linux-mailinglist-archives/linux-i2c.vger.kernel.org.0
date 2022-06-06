Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 835AA53EB46
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 19:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241989AbiFFQrK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 12:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbiFFQrJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 12:47:09 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C91D460D0;
        Mon,  6 Jun 2022 09:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654534027; x=1686070027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zMDaFErYdosBw6t1cOtbrQIJ7oAPIRfoeWKglruaukA=;
  b=ngSGUCoP+53yBtO2vvAp2hb7nOD7i83VLg/OoCw/YBEByJLBucLBQreE
   lLsGeH8LZgaOINL8hpYN24CeaGzT1TrzK8BAtzIZy2oZsJTwaiPEUagX7
   JcCZmeasAi0OXgmKzvUf731H+fN7oV5pzo2hmtbEh0EuUrvEnHm5u2iqy
   qtC2QbBEbpIDfNhl6vshRRLYZLXIDC2UFe3lWJW2C/fVEpCULDDtNcEa0
   U3EI/ME/kCYITlI6v4riaIPsyLd1kdVRjZB6mTl+leVgYyYWd9CD+nW12
   j4QQPcg+se/yrPSgMUTH3QvU+IeZiaD40gKMO+UNblJDTtU9z6yPIIZQQ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="276760031"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="276760031"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 09:42:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="758640349"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 06 Jun 2022 09:41:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CE26E10C1; Mon,  6 Jun 2022 19:41:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Henning Schild <henning.schild@siemens.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: [PATCH v6 09/12] watchdog: simatic-ipc-wdt: convert to use P2SB accessor
Date:   Mon,  6 Jun 2022 19:41:35 +0300
Message-Id: <20220606164138.66535-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Henning Schild <henning.schild@siemens.com>

Since we have a common P2SB accessor in tree we may use it instead of
open coded variants.

Replace custom code by p2sb_bar() call.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/watchdog/Kconfig           |  1 +
 drivers/watchdog/simatic-ipc-wdt.c | 15 ++++++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 32fd37698932..0796f6a9e8ff 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1647,6 +1647,7 @@ config SIEMENS_SIMATIC_IPC_WDT
 	tristate "Siemens Simatic IPC Watchdog"
 	depends on SIEMENS_SIMATIC_IPC
 	select WATCHDOG_CORE
+	select P2SB
 	help
 	  This driver adds support for several watchdogs found in Industrial
 	  PCs from Siemens.
diff --git a/drivers/watchdog/simatic-ipc-wdt.c b/drivers/watchdog/simatic-ipc-wdt.c
index 8bac793c63fb..6599695dc672 100644
--- a/drivers/watchdog/simatic-ipc-wdt.c
+++ b/drivers/watchdog/simatic-ipc-wdt.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/platform_data/x86/p2sb.h>
 #include <linux/platform_data/x86/simatic-ipc-base.h>
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
@@ -54,9 +55,9 @@ static struct resource io_resource_trigger =
 	DEFINE_RES_IO_NAMED(WD_TRIGGER_IOADR, SZ_1,
 			    KBUILD_MODNAME " WD_TRIGGER_IOADR");
 
-/* the actual start will be discovered with pci, 0 is a placeholder */
+/* the actual start will be discovered with p2sb, 0 is a placeholder */
 static struct resource mem_resource =
-	DEFINE_RES_MEM_NAMED(0, SZ_4, "WD_RESET_BASE_ADR");
+	DEFINE_RES_MEM_NAMED(0, 0, "WD_RESET_BASE_ADR");
 
 static u32 wd_timeout_table[] = {2, 4, 6, 8, 16, 32, 48, 64 };
 static void __iomem *wd_reset_base_addr;
@@ -150,6 +151,7 @@ static int simatic_ipc_wdt_probe(struct platform_device *pdev)
 	struct simatic_ipc_platform *plat = pdev->dev.platform_data;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
+	int ret;
 
 	switch (plat->devmode) {
 	case SIMATIC_IPC_DEVICE_227E:
@@ -190,15 +192,14 @@ static int simatic_ipc_wdt_probe(struct platform_device *pdev)
 	if (plat->devmode == SIMATIC_IPC_DEVICE_427E) {
 		res = &mem_resource;
 
-		/* get GPIO base from PCI */
-		res->start = simatic_ipc_get_membase0(PCI_DEVFN(0x1f, 1));
-		if (res->start == 0)
-			return -ENODEV;
+		ret = p2sb_bar(NULL, 0, res);
+		if (ret)
+			return ret;
 
 		/* do the final address calculation */
 		res->start = res->start + (GPIO_COMMUNITY0_PORT_ID << 16) +
 			     PAD_CFG_DW0_GPP_A_23;
-		res->end += res->start;
+		res->end = res->start + SZ_4 - 1;
 
 		wd_reset_base_addr = devm_ioremap_resource(dev, res);
 		if (IS_ERR(wd_reset_base_addr))
-- 
2.35.1

