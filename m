Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3550164CC3E
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 15:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238729AbiLNO2Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 09:28:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238672AbiLNO1v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 09:27:51 -0500
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B9D275FB;
        Wed, 14 Dec 2022 06:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671028060; x=1702564060;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fL+AZqtI/OizDHZ32Aoz+NaxJOOlRyuKcjjV58uebV4=;
  b=vboji1PqKxnkZVIMgJzGFRItFNNtG5NSCzeeiKJqvzW671WjN2TyVcQi
   RmofCZoWAGqiHDb9cp8KbdLMF9p8P+X3vFcTcmkCy8SH49CzhiMV43OFp
   bwxnr3o2RJUFndFWSZ4qS+JNvt2S/qZ5Wb3qfCYp0S5iO8JnLUUwm9xpO
   M=;
X-IronPort-AV: E=Sophos;i="5.96,244,1665446400"; 
   d="scan'208";a="161371394"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-pdx-2a-m6i4x-21d8d9f4.us-west-2.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 14:27:36 +0000
Received: from EX13D31EUA001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2a-m6i4x-21d8d9f4.us-west-2.amazon.com (Postfix) with ESMTPS id A5B6B81CF0;
        Wed, 14 Dec 2022 14:27:34 +0000 (UTC)
Received: from EX19D019EUA002.ant.amazon.com (10.252.50.84) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Wed, 14 Dec 2022 14:27:33 +0000
Received: from dev-dsk-hhhawa-1b-84e0d7ff.eu-west-1.amazon.com (10.43.161.114)
 by EX19D019EUA002.ant.amazon.com (10.252.50.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.20; Wed, 14 Dec 2022 14:27:28 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <farbere@amazon.com>, <itamark@amazon.com>,
        Hanna Hawa <hhhawa@amazon.com>
Subject: [PATCH v2 1/1] i2c: designware: set pinctrl recovery information from device pinctrl
Date:   Wed, 14 Dec 2022 14:27:25 +0000
Message-ID: <20221214142725.23881-1-hhhawa@amazon.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.161.114]
X-ClientProxiedBy: EX13D22UWC004.ant.amazon.com (10.43.162.198) To
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

The current implementation of designware recovery mechanism fit for
specific device (Intel / Altera Cyclone V SOC) which have two separated
"wired" GPIOs to the i2c bus via the SOC FPGA for the i2c recovery.

Make pinctrl recovery information to points to the device pinctrl by
setting the rinfo->pinctrl to dev->pins->p.

Change Log v1->v2:
- set the rinfo->pinctrl to dev->pins->p instead calling
  devm_pinctrl_get().

Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index dc3c5a15a95b..16a4cd68567c 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -17,6 +17,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/pinctrl/devinfo.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
@@ -832,6 +833,9 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 	struct i2c_adapter *adap = &dev->adapter;
 	struct gpio_desc *gpio;
 
+	if (dev->dev->pins && dev->dev->pins->p)
+		rinfo->pinctrl = dev->dev->pins->p;
+
 	gpio = devm_gpiod_get_optional(dev->dev, "scl", GPIOD_OUT_HIGH);
 	if (IS_ERR_OR_NULL(gpio))
 		return PTR_ERR_OR_ZERO(gpio);
-- 
2.38.1

