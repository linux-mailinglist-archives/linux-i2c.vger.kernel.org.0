Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41CDA64C713
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 11:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237866AbiLNK1W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 05:27:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbiLNK1V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 05:27:21 -0500
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D3C1CB33;
        Wed, 14 Dec 2022 02:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671013641; x=1702549641;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1cznQI0aG8Ae2+yWtqv5UxrgHIiBQCMhbfbLMCPY70I=;
  b=MGxsKR0cEQa90F3ndfIfG1WrOlJTa+w0JzG5DibeNZ8otUtYzjAB1dU7
   +pRK462EQryZWVE0ZYyZ+TJgMKvtdzlNYuV5Y/Cdc2sXN1VXQMhh9c2we
   NzMt8ynBWe/X8GiSV30FBC62dpI5bunx0mKBsfRIZ0gapdW9B5nWZZNeo
   U=;
X-IronPort-AV: E=Sophos;i="5.96,244,1665446400"; 
   d="scan'208";a="273343457"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-iad-1a-m6i4x-54a853e6.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 10:27:18 +0000
Received: from EX13D25EUA004.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-iad-1a-m6i4x-54a853e6.us-east-1.amazon.com (Postfix) with ESMTPS id 4D17042788;
        Wed, 14 Dec 2022 10:27:16 +0000 (UTC)
Received: from EX19D019EUA002.ant.amazon.com (10.252.50.84) by
 EX13D25EUA004.ant.amazon.com (10.43.165.12) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Wed, 14 Dec 2022 10:27:15 +0000
Received: from dev-dsk-hhhawa-1b-84e0d7ff.eu-west-1.amazon.com (10.43.161.114)
 by EX19D019EUA002.ant.amazon.com (10.252.50.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.20; Wed, 14 Dec 2022 10:27:11 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <farbere@amazon.com>, <itamark@amazon.com>, <hhhawa@amazon.com>
Subject: [PATCH 1/1] i2c: designware: add pinctrl for recovery info as an option
Date:   Wed, 14 Dec 2022 10:27:07 +0000
Message-ID: <20221214102707.60018-1-hhhawa@amazon.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.161.114]
X-ClientProxiedBy: EX13D31UWC001.ant.amazon.com (10.43.162.152) To
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

The current implementation of designware recovery mechanism fit for
specific device (Intel / Altera Cyclone V SOC) which have two separated
"wired" GPIOs to the i2c bus via the SOC FPGA for the i2c recovery.

This change add ability to get the pinctrl for the i2c recovery in order
to switch between pin configuration (I2C and GPIO functionality) if the
pinctrl exists.

Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index dc3c5a15a95b..478318b1d35f 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -17,6 +17,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
@@ -832,6 +833,14 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 	struct i2c_adapter *adap = &dev->adapter;
 	struct gpio_desc *gpio;
 
+	rinfo->pinctrl = devm_pinctrl_get(dev->dev);
+	if (IS_ERR(rinfo->pinctrl)) {
+		if (PTR_ERR(rinfo->pinctrl) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		rinfo->pinctrl = NULL;
+		dev_dbg(dev->dev, "can't get pinctrl for i2c recovery\n");
+	}
+
 	gpio = devm_gpiod_get_optional(dev->dev, "scl", GPIOD_OUT_HIGH);
 	if (IS_ERR_OR_NULL(gpio))
 		return PTR_ERR_OR_ZERO(gpio);
-- 
2.38.1

