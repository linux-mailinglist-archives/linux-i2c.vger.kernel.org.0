Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF2284FDC37
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Apr 2022 13:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237762AbiDLKP3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Apr 2022 06:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351629AbiDLJmd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Apr 2022 05:42:33 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AFB952E51;
        Tue, 12 Apr 2022 01:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649753455;
  x=1681289455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uLQdlfAQXlCN4pf6t7na9yusjUfO4K5tqg+Dz7YUDFM=;
  b=Rr4kEVfRpFsMjSaJj/0JFOFNCi8+JOAdv6lqvppuw5AS2jvUp1il8T7f
   j7mNOyFEO0TM+JiQYcD5RfuTUO1tWMGKpMtAA8Hi0OkYChMgIhpVD3fg4
   Qrv3bP+NZhEROqKfIjP/sO4UHmJDGhrvs9xu2Exal3vRZH7IWa21X6a5+
   6OsI00oMHRqcFOH09wnr6WXqJR4Oly4KUnzSR/J3gP5uMdhCyYK/C6u0X
   UgUrvdT+1uOTMej86LF2+0dszNno9Ve7yFVsDZb/baXLYbasuQ754Fq9R
   44IpE9R6jtqbJ+NCl0JFYOtv9E6FFU0jcVDLIVNtGWbelhD6T6ROPnr0R
   Q==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <wsa@kernel.org>
CC:     <kernel@axis.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <krzk+dt@kernel.org>, <robh+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] i2c: core: support no-detect property
Date:   Tue, 12 Apr 2022 10:50:46 +0200
Message-ID: <20220412085046.1110127-3-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220412085046.1110127-1-vincent.whitchurch@axis.com>
References: <20220412085046.1110127-1-vincent.whitchurch@axis.com>
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

If the devicetree specifies the no-detect property, we know that there
are no other devices on the bus other than the ones listed in the
devicetree, so avoid calling drivers' detect callback and wasting time
probing for devices which do not exist.

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

