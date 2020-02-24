Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8718216A993
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbgBXPPf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:35 -0500
Received: from mga06.intel.com ([134.134.136.31]:59397 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727822AbgBXPPf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="255604723"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 24 Feb 2020 07:15:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5C09F2FB; Mon, 24 Feb 2020 17:15:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Elie Morisse <syniurge@gmail.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>
Subject: [PATCH v1 05/40] i2c: amd-mp2: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:14:55 +0200
Message-Id: <20200224151530.31713-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since we have generic definitions for bus frequencies, let's use them.

Cc: Elie Morisse <syniurge@gmail.com>
Cc: Nehal Shah <nehal-bakulchandra.shah@amd.com>
Cc: Shyam Sundar S K <shyam-sundar.s-k@amd.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-amd-mp2-plat.c | 27 ++++++++++++++++-----------
 include/linux/i2c.h                   |  2 ++
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-plat.c b/drivers/i2c/busses/i2c-amd-mp2-plat.c
index f5b3f00c6559..9b9d90b98a05 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-plat.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-plat.c
@@ -201,32 +201,37 @@ static int i2c_amd_resume(struct amd_i2c_common *i2c_common)
 }
 #endif
 
+static const u32 supported_speeds[] = {
+	I2C_HIGH_SPEED_MODE_FREQ,
+	I2C_TURBO_MODE_FREQ,
+	I2C_FAST_MODE_PLUS_FREQ,
+	I2C_FAST_MODE_FREQ,
+	I2C_STANDARD_MODE_FREQ,
+};
+
 static enum speed_enum i2c_amd_get_bus_speed(struct platform_device *pdev)
 {
 	u32 acpi_speed;
 	int i;
-	static const u32 supported_speeds[] = {
-		0, 100000, 400000, 1000000, 1400000, 3400000
-	};
 
 	acpi_speed = i2c_acpi_find_bus_speed(&pdev->dev);
 	/* round down to the lowest standard speed */
-	for (i = 1; i < ARRAY_SIZE(supported_speeds); i++) {
-		if (acpi_speed < supported_speeds[i])
+	for (i = 0; i < ARRAY_SIZE(supported_speeds); i++) {
+		if (acpi_speed >= supported_speeds[i])
 			break;
 	}
-	acpi_speed = supported_speeds[i - 1];
+	acpi_speed = i < ARRAY_SIZE(supported_speeds) ? supported_speeds[i] : 0;
 
 	switch (acpi_speed) {
-	case 100000:
+	case I2C_STANDARD_MODE_FREQ:
 		return speed100k;
-	case 400000:
+	case I2C_FAST_MODE_FREQ:
 		return speed400k;
-	case 1000000:
+	case I2C_FAST_MODE_PLUS_FREQ:
 		return speed1000k;
-	case 1400000:
+	case I2C_TURBO_MODE_FREQ:
 		return speed1400k;
-	case 3400000:
+	case I2C_HIGH_SPEED_MODE_FREQ:
 		return speed3400k;
 	default:
 		return speed400k;
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 1b9c483bd9f5..d3022a014227 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -46,6 +46,8 @@ typedef int (*i2c_slave_cb_t)(struct i2c_client *client,
 #define I2C_STANDARD_MODE_FREQ		(100 * HZ_PER_KHZ)
 #define I2C_FAST_MODE_FREQ		(400 * HZ_PER_KHZ)
 #define I2C_FAST_MODE_PLUS_FREQ		(1000 * HZ_PER_KHZ)
+#define I2C_TURBO_MODE_FREQ		(1400 * HZ_PER_KHZ)
+#define I2C_HIGH_SPEED_MODE_FREQ	(3400 * HZ_PER_KHZ)
 
 struct module;
 struct property_entry;
-- 
2.25.0

