Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3106B6537D2
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Dec 2022 21:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232786AbiLUUwI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Dec 2022 15:52:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234797AbiLUUwH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Dec 2022 15:52:07 -0500
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1DB12529B;
        Wed, 21 Dec 2022 12:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671655927; x=1703191927;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6zCe4ufIr/No26lRqlARtCkg/ggfyQN/WYU8B/o/Vas=;
  b=mtpeyBEm9KpTL8XvsKUynOmRrUyqMQZG46wM7/BQBs4rNsLZiHSI5Gzf
   qc2mgB5crYXOxrFyFX176Ri4y78WUhzmMLUt7De17KyHuepo8JBRwr22s
   fx+cZmh9u1PqLLAvUuMI/JrKqAdcATcpgLx9USS8viKu6Scenuwr6kl5E
   8=;
X-IronPort-AV: E=Sophos;i="5.96,263,1665446400"; 
   d="scan'208";a="279788630"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-pdx-2a-m6i4x-44b6fc51.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2022 20:52:05 +0000
Received: from EX13D43EUA001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2a-m6i4x-44b6fc51.us-west-2.amazon.com (Postfix) with ESMTPS id 8615DA3613;
        Wed, 21 Dec 2022 20:52:04 +0000 (UTC)
Received: from EX19D019EUA002.ant.amazon.com (10.252.50.84) by
 EX13D43EUA001.ant.amazon.com (10.43.165.66) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Wed, 21 Dec 2022 20:52:02 +0000
Received: from dev-dsk-hhhawa-1b-84e0d7ff.eu-west-1.amazon.com (10.43.162.134)
 by EX19D019EUA002.ant.amazon.com (10.252.50.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.20; Wed, 21 Dec 2022 20:51:58 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <wsa@kernel.org>, <linus.walleij@linaro.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <farbere@amazon.com>, <itamark@amazon.com>, <hhhawa@amazon.com>
Subject: [PATCH v4 1/2] pinctrl: Add an API to get the pinctrl pins if initialized
Date:   Wed, 21 Dec 2022 20:51:15 +0000
Message-ID: <20221221205116.73941-2-hhhawa@amazon.com>
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
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add an API to get the pinctrl pins if it was initialized before driver
probed. This API will be used in I2C core to get the device pinctrl
information for recovery state change.

Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
---
 include/linux/pinctrl/devinfo.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/pinctrl/devinfo.h b/include/linux/pinctrl/devinfo.h
index a48ff69acddd..83eef2ac8cd6 100644
--- a/include/linux/pinctrl/devinfo.h
+++ b/include/linux/pinctrl/devinfo.h
@@ -17,6 +17,7 @@
 #ifdef CONFIG_PINCTRL
 
 /* The device core acts as a consumer toward pinctrl */
+#include <linux/device.h>
 #include <linux/pinctrl/consumer.h>
 
 /**
@@ -40,6 +41,14 @@ struct dev_pin_info {
 extern int pinctrl_bind_pins(struct device *dev);
 extern int pinctrl_init_done(struct device *dev);
 
+static inline struct pinctrl *dev_pinctrl(struct device *dev)
+{
+	if (!dev->pins)
+		return NULL;
+
+	return dev->pins->p;
+}
+
 #else
 
 struct device;
@@ -56,5 +65,10 @@ static inline int pinctrl_init_done(struct device *dev)
 	return 0;
 }
 
+static inline struct pinctrl *dev_pinctrl(struct device *dev)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_PINCTRL */
 #endif /* PINCTRL_DEVINFO_H */
-- 
2.38.1

