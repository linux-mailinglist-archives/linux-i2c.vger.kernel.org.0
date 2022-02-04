Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94E4F4A9C8D
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 16:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238207AbiBDP7M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 10:59:12 -0500
Received: from mga09.intel.com ([134.134.136.24]:39213 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234808AbiBDP7L (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Feb 2022 10:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643990351; x=1675526351;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9KhxQXsAu7RrqbBNDRjQ5GvfIHgWxqlaV3+q1AnfYQs=;
  b=B9Cti0OD6vfFPuvRCpBuv3G5JOTT/OifxkmX3+UnsH6Fb/Fw4AF1x9x3
   jEM9fHLGEUCfxrRk5byRaKJU5Na50ajj2E828YgVViXapvRenimGrr7Op
   EodO7jgacBV3qdhCOmRoctMLEyeVOCopthiMpsHlCqngOnl58dMkEfhb8
   nmZ4mBaSoDmtgrH0/pjasY21wxGSzAm9OpxrcntieODdOvSO+mtkRkzQ1
   nUwtKLWwcFmQnJKvQFey7Ft5mQxXcEInUhlhMo90HU1ewbClgUHozJQjb
   LgLfrtMU4GJ4PLggofsd8Ib1XQ846AL9Fsw8Smnn5Pw4aADXGM83zeYab
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248150544"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="248150544"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 07:59:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="600265073"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 04 Feb 2022 07:59:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 48D02204; Fri,  4 Feb 2022 17:59:24 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com
Subject: [PATCH v1 1/1] i2c: smbus: Check for parent device before dereference
Date:   Fri,  4 Feb 2022 17:59:20 +0200
Message-Id: <20220204155920.13364-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

An I²C adapter might be instantiated without parent. In such case
there is no property can be retrieved. Skip SMBus alert setup when
this happens.

Fixes: a263a84088f6 ("i2c: smbus: Use device_*() functions instead of of_*()")
Reported-by: syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-smbus.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index 304c2c8fee68..029f1b7c83bc 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -705,10 +705,14 @@ EXPORT_SYMBOL_GPL(i2c_new_smbus_alert_device);
 #if IS_ENABLED(CONFIG_I2C_SMBUS)
 int i2c_setup_smbus_alert(struct i2c_adapter *adapter)
 {
+	struct device *parent = adapter->dev.parent;
 	int irq;
 
-	irq = device_property_match_string(adapter->dev.parent, "interrupt-names",
-					   "smbus_alert");
+	/* Adapter instantiated without parent, skip the SMBus alert setup */
+	if (!parent)
+		return 0;
+
+	irq = device_property_match_string(parent, "interrupt-names", "smbus_alert");
 	if (irq == -EINVAL || irq == -ENODATA)
 		return 0;
 	else if (irq < 0)
-- 
2.34.1

