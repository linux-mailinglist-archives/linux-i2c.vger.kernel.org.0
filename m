Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4167D658405
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Dec 2022 17:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234902AbiL1QyE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Dec 2022 11:54:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235060AbiL1QxZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Dec 2022 11:53:25 -0500
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com [207.171.184.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF2E71D30B;
        Wed, 28 Dec 2022 08:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1672246123; x=1703782123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ypztWKO0acnZ9KxjcJXXqWb0zwFVPuYw8z6bkanpP7I=;
  b=X2avdODidm1GauxVEdrETEnAyBkNYgUVCsIq5vb37YTi23OZeOET9jN2
   ad47jh4ley/NTa2LhqkZLduqsna9X3R6JCnJO1TznHbyVIN/ywI8o0/Wa
   CfTGsvZS02uzETzQ7ntTGM5MON/dtCkiX+9GgPkNtabTOeWx6ITmL9KCW
   I=;
X-IronPort-AV: E=Sophos;i="5.96,281,1665446400"; 
   d="scan'208";a="294965043"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-pdx-2b-m6i4x-cadc3fbd.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2022 16:48:37 +0000
Received: from EX13D46EUA001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2b-m6i4x-cadc3fbd.us-west-2.amazon.com (Postfix) with ESMTPS id 5D439A0B2D;
        Wed, 28 Dec 2022 16:48:35 +0000 (UTC)
Received: from EX19D019EUA002.ant.amazon.com (10.252.50.84) by
 EX13D46EUA001.ant.amazon.com (10.43.165.109) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Wed, 28 Dec 2022 16:48:34 +0000
Received: from dev-dsk-hhhawa-1b-84e0d7ff.eu-west-1.amazon.com (10.43.162.56)
 by EX19D019EUA002.ant.amazon.com (10.252.50.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.20; Wed, 28 Dec 2022 16:48:30 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <andriy.shevchenko@linux.intel.com>, <wsa@kernel.org>,
        <linus.walleij@linaro.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <farbere@amazon.com>, <itamark@amazon.com>, <hhhawa@amazon.com>
Subject: [PATCH v5 1/2] pinctrl: Add an API to get the pinctrl pins if initialized
Date:   Wed, 28 Dec 2022 16:48:12 +0000
Message-ID: <20221228164813.67964-2-hhhawa@amazon.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228164813.67964-1-hhhawa@amazon.com>
References: <20221228164813.67964-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.162.56]
X-ClientProxiedBy: EX13D45UWA001.ant.amazon.com (10.43.160.91) To
 EX19D019EUA002.ant.amazon.com (10.252.50.84)
X-Spam-Status: No, score=-10.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/pinctrl/devinfo.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/pinctrl/devinfo.h b/include/linux/pinctrl/devinfo.h
index a48ff69acddd..670588bfc7ab 100644
--- a/include/linux/pinctrl/devinfo.h
+++ b/include/linux/pinctrl/devinfo.h
@@ -16,6 +16,8 @@
 
 #ifdef CONFIG_PINCTRL
 
+#include <linux/device.h>
+
 /* The device core acts as a consumer toward pinctrl */
 #include <linux/pinctrl/consumer.h>
 
@@ -40,6 +42,14 @@ struct dev_pin_info {
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
@@ -56,5 +66,10 @@ static inline int pinctrl_init_done(struct device *dev)
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

