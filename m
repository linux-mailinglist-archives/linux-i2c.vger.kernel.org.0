Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9AD658419
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Dec 2022 17:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbiL1QyG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Dec 2022 11:54:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235127AbiL1Qxa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Dec 2022 11:53:30 -0500
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100281D322;
        Wed, 28 Dec 2022 08:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1672246125; x=1703782125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1A5zlnRR2f2ZTu4fR9CQ3Z2F8xD3bcpX34JwmydLuRw=;
  b=hRo+ktv32bU5i4CiAAkrW190QrCGbcAEgFvf1M99Sl1fTEgWFy67EL9R
   OhFoTP9Zz5I0d7WnGdnA/aOSKL9/vqe/DFuMsZimNkKTfR2I9vC1Kzebw
   tfRL+TGKNDkhcNYDbxiXdln44uWUe/X77U6Szp3GmPnEuIm9YyXW43fjO
   Q=;
X-IronPort-AV: E=Sophos;i="5.96,281,1665446400"; 
   d="scan'208";a="281514154"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-pdx-2b-m6i4x-32fb4f1a.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2022 16:48:43 +0000
Received: from EX13D45EUA003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2b-m6i4x-32fb4f1a.us-west-2.amazon.com (Postfix) with ESMTPS id CAEBAC30CB;
        Wed, 28 Dec 2022 16:48:41 +0000 (UTC)
Received: from EX19D019EUA002.ant.amazon.com (10.252.50.84) by
 EX13D45EUA003.ant.amazon.com (10.43.165.71) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Wed, 28 Dec 2022 16:48:39 +0000
Received: from dev-dsk-hhhawa-1b-84e0d7ff.eu-west-1.amazon.com (10.43.162.56)
 by EX19D019EUA002.ant.amazon.com (10.252.50.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.20; Wed, 28 Dec 2022 16:48:34 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <andriy.shevchenko@linux.intel.com>, <wsa@kernel.org>,
        <linus.walleij@linaro.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <farbere@amazon.com>, <itamark@amazon.com>, <hhhawa@amazon.com>
Subject: [PATCH v5 2/2] i2c: Set i2c pinctrl recovery info from it's device pinctrl
Date:   Wed, 28 Dec 2022 16:48:13 +0000
Message-ID: <20221228164813.67964-3-hhhawa@amazon.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228164813.67964-1-hhhawa@amazon.com>
References: <20221228164813.67964-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.162.56]
X-ClientProxiedBy: EX13D45UWA001.ant.amazon.com (10.43.160.91) To
 EX19D019EUA002.ant.amazon.com (10.252.50.84)
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Currently the i2c subsystem rely on the controller device tree to
initialize the pinctrl recovery information, part of the drivers does
not set this field (rinfo->pinctrl), for example i2c DesignWare driver.

The pins information is saved part of the device structure before probe
and it's done on pinctrl_bind_pins().

Make the i2c init recovery to get the device pins if it's not
initialized by the driver from the device pins.

Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7539b0740351..fb5644457452 100644
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
@@ -282,7 +283,9 @@ static void i2c_gpio_init_pinctrl_recovery(struct i2c_adapter *adap)
 {
 	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
 	struct device *dev = &adap->dev;
-	struct pinctrl *p = bri->pinctrl;
+	struct pinctrl *p = bri->pinctrl ?: dev_pinctrl(dev->parent);
+
+	bri->pinctrl = p;
 
 	/*
 	 * we can't change states without pinctrl, so remove the states if
-- 
2.38.1

