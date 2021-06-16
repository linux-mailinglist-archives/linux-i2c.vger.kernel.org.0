Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53CE43A9CF6
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Jun 2021 16:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233778AbhFPOI2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Jun 2021 10:08:28 -0400
Received: from mga02.intel.com ([134.134.136.20]:63903 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233420AbhFPOI1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 16 Jun 2021 10:08:27 -0400
IronPort-SDR: GczPlc79uu6ssbfv71Kai5W36lxtYtOQ9LBD11Jxm9qftNo5EsXE5jNpTVmeG9z3tFrZcI+wiu
 0r2Cvo7ljqQQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="193302315"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; 
   d="scan'208";a="193302315"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2021 07:06:20 -0700
IronPort-SDR: rhkRQCYvGclBnd+hF191KeKexMCIvZIEqGUBRbNM0royz7cMw/B0MzC6w7/QVj39W8s7NCq2tx
 8OKg216xfSVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; 
   d="scan'208";a="554816631"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2021 07:06:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E9E2E2AA; Wed, 16 Jun 2021 17:06:43 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>
Subject: [PATCH v1 1/1] i2c: parport: Switch to use module_parport_driver()
Date:   Wed, 16 Jun 2021 17:04:41 +0300
Message-Id: <20210616140441.39479-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Switch to use module_parport_driver() to reduce boilerplate code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-parport.c | 36 ++++++++++----------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/i2c/busses/i2c-parport.c b/drivers/i2c/busses/i2c-parport.c
index a535889acca6..ccbbc9306e88 100644
--- a/drivers/i2c/busses/i2c-parport.c
+++ b/drivers/i2c/busses/i2c-parport.c
@@ -267,6 +267,16 @@ static void i2c_parport_attach(struct parport *port)
 	int i;
 	struct pardev_cb i2c_parport_cb;
 
+	if (type < 0) {
+		pr_warn("adapter type unspecified\n");
+		return -ENODEV;
+	}
+
+	if (type >= ARRAY_SIZE(adapter_parm)) {
+		pr_warn("invalid type (%d)\n", type);
+		return -ENODEV;
+	}
+
 	for (i = 0; i < MAX_DEVICE; i++) {
 		if (parport[i] == -1)
 			continue;
@@ -392,32 +402,8 @@ static struct parport_driver i2c_parport_driver = {
 	.detach = i2c_parport_detach,
 	.devmodel = true,
 };
-
-/* ----- Module loading, unloading and information ------------------------ */
-
-static int __init i2c_parport_init(void)
-{
-	if (type < 0) {
-		pr_warn("adapter type unspecified\n");
-		return -ENODEV;
-	}
-
-	if (type >= ARRAY_SIZE(adapter_parm)) {
-		pr_warn("invalid type (%d)\n", type);
-		return -ENODEV;
-	}
-
-	return parport_register_driver(&i2c_parport_driver);
-}
-
-static void __exit i2c_parport_exit(void)
-{
-	parport_unregister_driver(&i2c_parport_driver);
-}
+module_parport_driver(i2c_parport_driver);
 
 MODULE_AUTHOR("Jean Delvare <jdelvare@suse.de>");
 MODULE_DESCRIPTION("I2C bus over parallel port");
 MODULE_LICENSE("GPL");
-
-module_init(i2c_parport_init);
-module_exit(i2c_parport_exit);
-- 
2.30.2

