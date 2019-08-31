Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17AC2A44B9
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Aug 2019 16:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbfHaOYG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 31 Aug 2019 10:24:06 -0400
Received: from mga09.intel.com ([134.134.136.24]:51310 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727915AbfHaOYG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 31 Aug 2019 10:24:06 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Aug 2019 07:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,451,1559545200"; 
   d="scan'208";a="182913947"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 31 Aug 2019 07:24:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 6F0DA47; Sat, 31 Aug 2019 17:24:02 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@the-dreams.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v2 1/2] watchdog: iTCO: Add support for Cannon Lake PCH iTCO
Date:   Sat, 31 Aug 2019 17:24:01 +0300
Message-Id: <20190831142402.49736-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190831142402.49736-1-mika.westerberg@linux.intel.com>
References: <20190831142402.49736-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In Intel Cannon Lake PCH the NO_REBOOT bit was moved from the private
register space to be part of the TCO1_CNT register. For this reason
introduce another version (6) that uses this register to set and clear
NO_REBOOT bit.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/watchdog/iTCO_wdt.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index c559f706ae7e..156360e37714 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -48,6 +48,7 @@
 
 /* Includes */
 #include <linux/acpi.h>			/* For ACPI support */
+#include <linux/bits.h>			/* For BIT() */
 #include <linux/module.h>		/* For module specific items */
 #include <linux/moduleparam.h>		/* For new moduleparam's */
 #include <linux/types.h>		/* For standard types (like size_t) */
@@ -215,6 +216,23 @@ static int update_no_reboot_bit_mem(void *priv, bool set)
 	return 0;
 }
 
+static int update_no_reboot_bit_cnt(void *priv, bool set)
+{
+	struct iTCO_wdt_private *p = priv;
+	u16 val, newval;
+
+	val = inw(TCO1_CNT(p));
+	if (set)
+		val |= BIT(0);
+	else
+		val &= ~BIT(0);
+	outw(val, TCO1_CNT(p));
+	newval = inw(TCO1_CNT(p));
+
+	/* make sure the update is successful */
+	return val != newval ? -EIO : 0;
+}
+
 static void iTCO_wdt_no_reboot_bit_setup(struct iTCO_wdt_private *p,
 		struct itco_wdt_platform_data *pdata)
 {
@@ -224,7 +242,9 @@ static void iTCO_wdt_no_reboot_bit_setup(struct iTCO_wdt_private *p,
 		return;
 	}
 
-	if (p->iTCO_version >= 2)
+	if (p->iTCO_version >= 6)
+		p->update_no_reboot_bit = update_no_reboot_bit_cnt;
+	else if (p->iTCO_version >= 2)
 		p->update_no_reboot_bit = update_no_reboot_bit_mem;
 	else if (p->iTCO_version == 1)
 		p->update_no_reboot_bit = update_no_reboot_bit_pci;
@@ -452,7 +472,8 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	 * Get the Memory-Mapped GCS or PMC register, we need it for the
 	 * NO_REBOOT flag (TCO v2 and v3).
 	 */
-	if (p->iTCO_version >= 2 && !pdata->update_no_reboot_bit) {
+	if (p->iTCO_version >= 2 && p->iTCO_version < 6 &&
+	    !pdata->update_no_reboot_bit) {
 		p->gcs_pmc_res = platform_get_resource(pdev,
 						       IORESOURCE_MEM,
 						       ICH_RES_MEM_GCS_PMC);
@@ -502,6 +523,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 
 	/* Clear out the (probably old) status */
 	switch (p->iTCO_version) {
+	case 6:
 	case 5:
 	case 4:
 		outw(0x0008, TCO1_STS(p)); /* Clear the Time Out Status bit */
-- 
2.23.0.rc1

