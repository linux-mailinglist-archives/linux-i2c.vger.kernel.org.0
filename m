Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF56393FA1
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 11:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235453AbhE1JPK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 05:15:10 -0400
Received: from mga18.intel.com ([134.134.136.126]:19597 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234770AbhE1JPJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 05:15:09 -0400
IronPort-SDR: FYX/+ELiTC9A0ySI6clSkxmLaYQ6VASrKZGUvCoUS67vHrFl3EkGXYicbd1lpeXSYVBmFxHhni
 1iu2aoo6WTgQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="190294525"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="190294525"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 02:13:34 -0700
IronPort-SDR: T3YZv1SPiP3EGYAqEXSRgwDaJaVqt5f8jcaC3i4cRzpeJwncc5ni4hcwvizhACAEJ9vhHL/iYk
 9RDop+ElwNzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="631740210"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 28 May 2021 02:13:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 46ECB3B6; Fri, 28 May 2021 12:13:55 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/2] i2c: core: Make debug message even more debuggish
Date:   Fri, 28 May 2021 12:13:50 +0300
Message-Id: <20210528091351.70699-1-andriy.shevchenko@linux.intel.com>
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
v2: renamed error_or_debug to is_error_level (Wolfram)
 drivers/i2c/i2c-core-base.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5a97e4a02fa2..ae1b1b610aca 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -399,7 +399,8 @@ static int i2c_gpio_init_recovery(struct i2c_adapter *adap)
 static int i2c_init_recovery(struct i2c_adapter *adap)
 {
 	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
-	char *err_str, *err_level = KERN_ERR;
+	bool is_error_level = true;
+	char *err_str;
 
 	if (!bri)
 		return 0;
@@ -409,7 +410,7 @@ static int i2c_init_recovery(struct i2c_adapter *adap)
 
 	if (!bri->recover_bus) {
 		err_str = "no suitable method provided";
-		err_level = KERN_DEBUG;
+		is_error_level = false;
 		goto err;
 	}
 
@@ -436,7 +437,10 @@ static int i2c_init_recovery(struct i2c_adapter *adap)
 
 	return 0;
  err:
-	dev_printk(err_level, &adap->dev, "Not using recovery: %s\n", err_str);
+	if (is_error_level)
+		dev_err(&adap->dev, "Not using recovery: %s\n", err_str);
+	else
+		dev_dbg(&adap->dev, "Not using recovery: %s\n", err_str);
 	adap->bus_recovery_info = NULL;
 
 	return -EINVAL;
-- 
2.30.2

