Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B44946537D5
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Dec 2022 21:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234883AbiLUUw2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Dec 2022 15:52:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234806AbiLUUwQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Dec 2022 15:52:16 -0500
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C646A218AF;
        Wed, 21 Dec 2022 12:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671655935; x=1703191935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QZ7rWYK2CKwOEagvxBjviYv+AnRa/cMCIpiy/dlt5s4=;
  b=Ir/aIIQFx1pCaqN3ekH+5b/qDRdtupV6MF6usIQAzAalRiy9If+Sw4wD
   MGDwnXf2x9+XOdbjgc0pkVB8RUruwEmZoqciCVZOajGZI9HEj/u5PZ+mw
   FVi8NE+j7mR1XC/en3DF/j7rPpHjwUf2uRB6UXy+0sXzQDEvk6vjtf9pZ
   k=;
X-IronPort-AV: E=Sophos;i="5.96,263,1665446400"; 
   d="scan'208";a="281548083"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-pdx-2c-m6i4x-dc7c3f8b.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2022 20:52:14 +0000
Received: from EX13D42EUA004.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2c-m6i4x-dc7c3f8b.us-west-2.amazon.com (Postfix) with ESMTPS id 90592A1238;
        Wed, 21 Dec 2022 20:52:12 +0000 (UTC)
Received: from EX19D019EUA002.ant.amazon.com (10.252.50.84) by
 EX13D42EUA004.ant.amazon.com (10.43.165.34) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Wed, 21 Dec 2022 20:52:10 +0000
Received: from dev-dsk-hhhawa-1b-84e0d7ff.eu-west-1.amazon.com (10.43.162.134)
 by EX19D019EUA002.ant.amazon.com (10.252.50.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.20; Wed, 21 Dec 2022 20:52:06 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <wsa@kernel.org>, <linus.walleij@linaro.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <farbere@amazon.com>, <itamark@amazon.com>, <hhhawa@amazon.com>
Subject: [PATCH v4 2/2] i2c: Set i2c pinctrl recovery info from it's device pinctrl
Date:   Wed, 21 Dec 2022 20:51:16 +0000
Message-ID: <20221221205116.73941-3-hhhawa@amazon.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221205116.73941-1-hhhawa@amazon.com>
References: <20221221205116.73941-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.162.134]
X-ClientProxiedBy: EX13D28UWC004.ant.amazon.com (10.43.162.24) To
 EX19D019EUA002.ant.amazon.com (10.252.50.84)
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
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

Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
---
 drivers/i2c/i2c-core-base.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7539b0740351..8c5f76c43dc8 100644
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
@@ -282,7 +283,10 @@ static void i2c_gpio_init_pinctrl_recovery(struct i2c_adapter *adap)
 {
 	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
 	struct device *dev = &adap->dev;
-	struct pinctrl *p = bri->pinctrl;
+	struct pinctrl *p;
+
+	bri->pinctrl = bri->pinctrl ?: dev_pinctrl(dev->parent);
+	p = bri->pinctrl;
 
 	/*
 	 * we can't change states without pinctrl, so remove the states if
-- 
2.38.1

