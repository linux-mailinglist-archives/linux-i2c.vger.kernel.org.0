Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B41C651351
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 20:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232124AbiLSTc7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 14:32:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231531AbiLSTc5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 14:32:57 -0500
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F5312ABC;
        Mon, 19 Dec 2022 11:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671478377; x=1703014377;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XMs52eEwrpr6t8/OSw+Ha1zLO68AAU5IDolZMANPZLg=;
  b=rlBmxt9ksRLT4sO5l1DifhKTLRf4y9JZEtnCcNxSPt1Gso6VPOw/7e9J
   uV6MPmMTIjWflUq5ttOm4ExFc3fOHyvCvj5MSxfUqvu+qAMJ2iiqVDkDv
   j6xahN3Ijr9t1IwbGtF73cSqAZOjOXlprv91hL8AMKQ4R4AvvqiM1rM6F
   0=;
X-IronPort-AV: E=Sophos;i="5.96,257,1665446400"; 
   d="scan'208";a="275020458"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-pdx-2a-m6i4x-3ef535ca.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2022 19:32:54 +0000
Received: from EX13D21EUA001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2a-m6i4x-3ef535ca.us-west-2.amazon.com (Postfix) with ESMTPS id 49DFB60A0E;
        Mon, 19 Dec 2022 19:32:51 +0000 (UTC)
Received: from EX19D019EUA002.ant.amazon.com (10.252.50.84) by
 EX13D21EUA001.ant.amazon.com (10.43.165.41) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Mon, 19 Dec 2022 19:32:50 +0000
Received: from dev-dsk-hhhawa-1b-84e0d7ff.eu-west-1.amazon.com (10.43.160.83)
 by EX19D019EUA002.ant.amazon.com (10.252.50.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.20; Mon, 19 Dec 2022 19:32:45 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <wsa@kernel.org>, <linus.walleij@linaro.org>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <farbere@amazon.com>, <itamark@amazon.com>, <hhhawa@amazon.com>
Subject: [PATCH v3 1/1] i2c: Set pinctrl recovery info to device pinctrl
Date:   Mon, 19 Dec 2022 19:32:28 +0000
Message-ID: <20221219193228.35078-1-hhhawa@amazon.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.160.83]
X-ClientProxiedBy: EX13D28UWC003.ant.amazon.com (10.43.162.48) To
 EX19D019EUA002.ant.amazon.com (10.252.50.84)
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Currently the i2c subsystem rely on the controller device tree to
initialize the pinctrl recovery information, part of the drivers does
not set this field (rinfo->pinctrl), for example i2c designware driver.

The pins information is saved part of the device structure before probe
and it's done on pinctrl_bind_pins().

Make the i2c init recovery to get the device pins if it's not
initialized by the driver from the device pins.

Added new API to get the device pinctrl.

Signed-off-by: Hanna Hawa <hhhawa@amazon.com>

Change Log v2->v3:
- Add API to get the device pinctrl
- Make the i2c init recovery to get the device pins

Change Log v1->v2:
- set the rinfo->pinctrl to dev->pins->p instead calling
  devm_pinctrl_get()
---
 drivers/i2c/i2c-core-base.c     |  7 ++++++-
 include/linux/pinctrl/devinfo.h | 11 +++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7539b0740351..17eecdcf1cb2 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -34,6 +34,7 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/devinfo.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_wakeirq.h>
@@ -282,7 +283,11 @@ static void i2c_gpio_init_pinctrl_recovery(struct i2c_adapter *adap)
 {
 	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
 	struct device *dev = &adap->dev;
-	struct pinctrl *p = bri->pinctrl;
+	struct pinctrl *p;
+
+	if (!bri->pinctrl)
+		bri->pinctrl = dev_pinctrl(dev->parent);
+	p = bri->pinctrl;
 
 	/*
 	 * we can't change states without pinctrl, so remove the states if
diff --git a/include/linux/pinctrl/devinfo.h b/include/linux/pinctrl/devinfo.h
index a48ff69acddd..5c00ee115528 100644
--- a/include/linux/pinctrl/devinfo.h
+++ b/include/linux/pinctrl/devinfo.h
@@ -17,6 +17,7 @@
 #ifdef CONFIG_PINCTRL
 
 /* The device core acts as a consumer toward pinctrl */
+#include <linux/device.h>
 #include <linux/pinctrl/consumer.h>
 
 /**
@@ -40,6 +41,11 @@ struct dev_pin_info {
 extern int pinctrl_bind_pins(struct device *dev);
 extern int pinctrl_init_done(struct device *dev);
 
+static inline struct pinctrl *dev_pinctrl(struct device *dev)
+{
+	return dev->pins && dev->pins->p ? dev->pins->p : NULL;
+}
+
 #else
 
 struct device;
@@ -56,5 +62,10 @@ static inline int pinctrl_init_done(struct device *dev)
 	return 0;
 }
 
+static inline struct pinctrl *get_device_pinctrl(struct device *dev)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_PINCTRL */
 #endif /* PINCTRL_DEVINFO_H */
-- 
2.38.1

