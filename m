Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3A154F43A3
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 00:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234356AbiDEOIV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 10:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380317AbiDENOB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 09:14:01 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54880123BE5;
        Tue,  5 Apr 2022 05:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649161001;
  x=1680697001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x4YcHLziIrEggw9HG5I5fbaW8iCdF7u9wJBMUjziEm8=;
  b=meQxV9f1p1HxnA3LmMRvs8ovRZ0drYp0I+KKJAUcs7eP7q68kAO9jRvG
   5xgBBynyHeSrU7SC+XYDy/gOfaOKCoOMUwNmTum1YmqLNFA/tDU1wNG0Z
   fKawQ0pdr4asecovTbrHWQE7JdFkJUI8dpn60dfWZXB5pY789qCwPJxbZ
   ctjRS89ABOnJilYZeMhLr4HxnA1XPBXRDCJS+lZF6iyuCH6nP8Cn+qkBD
   ONmlhg8GdVyC8ip3m1a5cQfJf+j7yBDSyKxykIETTWeFKKkXiOaXC98cF
   BWAO6Sr1S1y0r2wLxBnfjegIeqJXA4gA+j6MctVnwViaHh7A0LoFMPJU4
   w==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <wsa@kernel.org>
CC:     <kernel@axis.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <krzk+dt@kernel.org>, <robh+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] i2c: core: support no-detect property
Date:   Tue, 5 Apr 2022 14:16:27 +0200
Message-ID: <20220405121627.1560949-3-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405121627.1560949-1-vincent.whitchurch@axis.com>
References: <20220405121627.1560949-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If the devicetree specifies the no-detect property, we can avoid calling
drivers' detect callback and wasting time probing for devices which do
not exist.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/i2c/i2c-core-base.c | 8 +++++++-
 include/linux/i2c.h         | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index d43db2c3876e..d43025b84546 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1341,7 +1341,8 @@ static int i2c_do_add_adapter(struct i2c_driver *driver,
 			      struct i2c_adapter *adap)
 {
 	/* Detect supported devices on that bus, and instantiate them */
-	i2c_detect(adap, driver);
+	if (adap->detect)
+		i2c_detect(adap, driver);
 
 	return 0;
 }
@@ -1432,6 +1433,7 @@ EXPORT_SYMBOL_GPL(i2c_handle_smbus_host_notify);
 
 static int i2c_register_adapter(struct i2c_adapter *adap)
 {
+	struct device_node *np = adap->dev.of_node;
 	int res = -EINVAL;
 
 	/* Can't register until after driver model init */
@@ -1502,6 +1504,10 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 			 "Failed to create compatibility class link\n");
 #endif
 
+	adap->detect = true;
+	if (np && of_property_read_bool(np, "no-detect"))
+		adap->detect = false;
+
 	/* create pre-declared device nodes */
 	of_i2c_register_devices(adap);
 	i2c_acpi_install_space_handler(adap);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index fbda5ada2afc..8fad5fe85685 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -728,6 +728,7 @@ struct i2c_adapter {
 	struct rt_mutex bus_lock;
 	struct rt_mutex mux_lock;
 
+	bool detect;
 	int timeout;			/* in jiffies */
 	int retries;
 	struct device dev;		/* the adapter device */
-- 
2.34.1

