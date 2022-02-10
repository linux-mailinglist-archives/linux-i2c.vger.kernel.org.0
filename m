Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A014F4B179D
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 22:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbiBJVdz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 16:33:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344633AbiBJVdy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 16:33:54 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB3DA10D6
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 13:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=Mq0irdrOjND9n3l1a2mLIWHhae2
        c5djqRC0G5mdS+1w=; b=CyZR5CZEgnMkcXCOl+MVra7KYUkGLeIBaLv5cheAakt
        6LU7ZIFGJTDdUOJb4q2TLfylIgGUoq9uS9cvn04vr4ijtJcrRVusCCb2omsiGGrV
        czSTXSmcxPg7W6ZJOCwKSTt8eesMxZAsB3Fr2U8ee2nCRMPjLG9/9dO20+x9gZOU
        =
Received: (qmail 1348453 invoked from network); 10 Feb 2022 22:33:50 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Feb 2022 22:33:50 +0100
X-UD-Smtp-Session: l3s3148p1@OYKQtLDXjrogAQnoAGmtADvKpjkX1tF1
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] i2c: don't expose function which is only used internally
Date:   Thu, 10 Feb 2022 22:33:41 +0100
Message-Id: <20220210213341.2121-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c_setup_smbus_alert() is only needed within the I2C core, so no need
to expose it to other modules.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Based on i2c/for-mergewindow. Build bots are happy.

Change since v1:

not only remove the symbol, also move the declaration from a public
header to the private one.

 drivers/i2c/i2c-core-smbus.c | 1 -
 drivers/i2c/i2c-core.h       | 9 +++++++++
 include/linux/i2c-smbus.h    | 8 --------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index 304c2c8fee68..053b215308c4 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -716,5 +716,4 @@ int i2c_setup_smbus_alert(struct i2c_adapter *adapter)
 
 	return PTR_ERR_OR_ZERO(i2c_new_smbus_alert_device(adapter, NULL));
 }
-EXPORT_SYMBOL_GPL(i2c_setup_smbus_alert);
 #endif
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 8ce261167a2d..87e2c914f1c5 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -86,3 +86,12 @@ void of_i2c_register_devices(struct i2c_adapter *adap);
 static inline void of_i2c_register_devices(struct i2c_adapter *adap) { }
 #endif
 extern struct notifier_block i2c_of_notifier;
+
+#if IS_ENABLED(CONFIG_I2C_SMBUS)
+int i2c_setup_smbus_alert(struct i2c_adapter *adap);
+#else
+static inline int i2c_setup_smbus_alert(struct i2c_adapter *adap)
+{
+	return 0;
+}
+#endif
diff --git a/include/linux/i2c-smbus.h b/include/linux/i2c-smbus.h
index 95cf902e0bda..ced1c6ead52a 100644
--- a/include/linux/i2c-smbus.h
+++ b/include/linux/i2c-smbus.h
@@ -30,14 +30,6 @@ struct i2c_client *i2c_new_smbus_alert_device(struct i2c_adapter *adapter,
 					      struct i2c_smbus_alert_setup *setup);
 int i2c_handle_smbus_alert(struct i2c_client *ara);
 
-#if IS_ENABLED(CONFIG_I2C_SMBUS)
-int i2c_setup_smbus_alert(struct i2c_adapter *adap);
-#else
-static inline int i2c_setup_smbus_alert(struct i2c_adapter *adap)
-{
-	return 0;
-}
-#endif
 #if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_I2C_SLAVE)
 struct i2c_client *i2c_new_slave_host_notify_device(struct i2c_adapter *adapter);
 void i2c_free_slave_host_notify_device(struct i2c_client *client);
-- 
2.30.2

