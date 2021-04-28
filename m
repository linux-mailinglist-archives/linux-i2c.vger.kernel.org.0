Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10E7E36DAC7
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Apr 2021 17:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236873AbhD1PCp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Apr 2021 11:02:45 -0400
Received: from mga05.intel.com ([192.55.52.43]:9545 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236545AbhD1PCN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 28 Apr 2021 11:02:13 -0400
IronPort-SDR: zWJsv+pPFoLVbp4NFHFHzuSMhU05jK8B/uXA1e3RRvt19cZxzoon16CeIQZwO0JY+2DLTTbliN
 z/jBlRMlAfow==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="282097142"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="282097142"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 07:57:38 -0700
IronPort-SDR: z6Fw6mL6Mhk2EwL1TurbzTPFO8wLTVrQ0KaTyuWpG8njT+0ExV9zsNwBe5sjtvxyTm23G1gitS
 RdvhG7uSuZmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="616059694"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 28 Apr 2021 07:57:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8C7593C8; Wed, 28 Apr 2021 17:57:55 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] i2c: core: Make debug message even more debuggish
Date:   Wed, 28 Apr 2021 17:57:51 +0300
Message-Id: <20210428145751.4934-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

One may notice that dev_printk(KERN_DEBUG ...) is *not* an equivalent
to dev_dbg(). It will be printed whenever loglevel is high enough.
And currently it will be the only message in the I²C core in some
configurations that got printed under above conditions.

Moving to dev_dbg() will hide it in the configurations where Dynamic Debug
is enabled and hence align with all other debug messages in the I²C core..

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5a97e4a02fa2..7f711853d464 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -399,7 +399,8 @@ static int i2c_gpio_init_recovery(struct i2c_adapter *adap)
 static int i2c_init_recovery(struct i2c_adapter *adap)
 {
 	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
-	char *err_str, *err_level = KERN_ERR;
+	bool error_or_debug = true;
+	char *err_str;
 
 	if (!bri)
 		return 0;
@@ -409,7 +410,7 @@ static int i2c_init_recovery(struct i2c_adapter *adap)
 
 	if (!bri->recover_bus) {
 		err_str = "no suitable method provided";
-		err_level = KERN_DEBUG;
+		error_or_debug = false;
 		goto err;
 	}
 
@@ -436,7 +437,10 @@ static int i2c_init_recovery(struct i2c_adapter *adap)
 
 	return 0;
  err:
-	dev_printk(err_level, &adap->dev, "Not using recovery: %s\n", err_str);
+	if (error_or_debug)
+		dev_err(&adap->dev, "Not using recovery: %s\n", err_str);
+	else
+		dev_dbg(&adap->dev, "Not using recovery: %s\n", err_str);
 	adap->bus_recovery_info = NULL;
 
 	return -EINVAL;
-- 
2.30.2

