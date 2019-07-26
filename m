Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF0B76701
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jul 2019 15:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfGZNOY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Jul 2019 09:14:24 -0400
Received: from mga09.intel.com ([134.134.136.24]:46126 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726001AbfGZNOY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Jul 2019 09:14:24 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jul 2019 06:14:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,310,1559545200"; 
   d="scan'208";a="345821822"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 26 Jul 2019 06:14:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 98CE714A; Fri, 26 Jul 2019 16:14:21 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] i2c: base: Drop unneeded check for of_node
Date:   Fri, 26 Jul 2019 16:14:21 +0300
Message-Id: <20190726131421.70545-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

of_find_property() will return NULL if of_node is NULL,
thus of_irq_get_by_name() returns -EINVAL which we ignore,
so no need to double check.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
- dropped other hunk from the patch (Wolfram)
 drivers/i2c/i2c-core-base.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index f26ed495d384..b4d84bd475da 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -350,13 +350,11 @@ static int i2c_device_probe(struct device *dev)
 		return -ENODEV;
 
 	if (client->flags & I2C_CLIENT_WAKE) {
-		int wakeirq = -ENOENT;
+		int wakeirq;
 
-		if (dev->of_node) {
-			wakeirq = of_irq_get_byname(dev->of_node, "wakeup");
-			if (wakeirq == -EPROBE_DEFER)
-				return wakeirq;
-		}
+		wakeirq = of_irq_get_byname(dev->of_node, "wakeup");
+		if (wakeirq == -EPROBE_DEFER)
+			return wakeirq;
 
 		device_init_wakeup(&client->dev, true);
 
-- 
2.20.1

