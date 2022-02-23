Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9483D4C14A8
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Feb 2022 14:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237876AbiBWNtX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Feb 2022 08:49:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233661AbiBWNtX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Feb 2022 08:49:23 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1D429AF1E2
        for <linux-i2c@vger.kernel.org>; Wed, 23 Feb 2022 05:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645624135;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NMULq3V4m4+5au+6o2heGgTYoeHenlBL72DtfTh39TU=;
        b=H4vnVWvB/NNMuA6D42g8UUv9WA2e6X/5oWCgPCBrGO5ottjEjKdSYzZf1eq1h+m5tI6Ddw
        zfD44NberUXwq88Vh21Ao7HsXcm9+hPMveLZlsJZ1+WIsD6XieTruGIVHQfYUnNrCVJZR5
        RCPZzUphcBAOCbgRYMyo9PmmCcQNfCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-wwxlt7BYOLW5HMTBSy2kFQ-1; Wed, 23 Feb 2022 08:48:52 -0500
X-MC-Unique: wwxlt7BYOLW5HMTBSy2kFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C320B501E0;
        Wed, 23 Feb 2022 13:48:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F1DD8838C5;
        Wed, 23 Feb 2022 13:48:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-i2c@vger.kernel.org
Subject: [PATCH 2/2] i2c: designware: Use the i2c_mark_adapter_suspended/resumed() helpers
Date:   Wed, 23 Feb 2022 14:48:39 +0100
Message-Id: <20220223134839.731138-2-hdegoede@redhat.com>
In-Reply-To: <20220223134839.731138-1-hdegoede@redhat.com>
References: <20220223134839.731138-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the i2c_mark_adapter_suspended/resumed() i2c-core helpers and rely
on the i2c-core's suspended checking instead of using DIY code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/i2c/busses/i2c-designware-core.h    | 2 --
 drivers/i2c/busses/i2c-designware-master.c  | 5 -----
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 8 ++------
 drivers/i2c/busses/i2c-designware-platdrv.c | 9 ++-------
 4 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 4b26cba40139..d9ac302011f2 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -234,7 +234,6 @@ struct reset_control;
  * @set_sda_hold_time: callback to retrieve IP specific SDA hold timing
  * @mode: operation mode - DW_IC_MASTER or DW_IC_SLAVE
  * @rinfo: I²C GPIO recovery information
- * @suspended: set to true if the controller is suspended
  *
  * HCNT and LCNT parameters can be used if the platform knows more accurate
  * values than the one computed based only on the input clock frequency.
@@ -292,7 +291,6 @@ struct dw_i2c_dev {
 	int			(*set_sda_hold_time)(struct dw_i2c_dev *dev);
 	int			mode;
 	struct i2c_bus_recovery_info rinfo;
-	bool			suspended;
 };
 
 #define ACCESS_INTR_MASK	BIT(0)
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 1a4b23556db3..44a94b225ed8 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -567,11 +567,6 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 		goto done_nolock;
 	}
 
-	if (dev_WARN_ONCE(dev->dev, dev->suspended, "Transfer while suspended\n")) {
-		ret = -ESHUTDOWN;
-		goto done_nolock;
-	}
-
 	reinit_completion(&dev->cmd_complete);
 	dev->msgs = msgs;
 	dev->msgs_num = num;
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 9553d7075223..777cbac34982 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -225,9 +225,7 @@ static int __maybe_unused i2c_dw_pci_suspend(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 
-	i2c_lock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
-	i_dev->suspended = true;
-	i2c_unlock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
+	i2c_mark_adapter_suspended(&i_dev->adapter);
 
 	return i2c_dw_pci_runtime_suspend(dev);
 }
@@ -246,9 +244,7 @@ static int __maybe_unused i2c_dw_pci_resume(struct device *dev)
 
 	ret = i2c_dw_pci_runtime_resume(dev);
 
-	i2c_lock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
-	i_dev->suspended = false;
-	i2c_unlock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
+	i2c_mark_adapter_resumed(&i_dev->adapter);
 
 	return ret;
 }
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 8e45f65bab73..43d2bee45ede 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -385,9 +385,7 @@ static int dw_i2c_plat_suspend(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 
-	i2c_lock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
-	i_dev->suspended = true;
-	i2c_unlock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
+	i2c_mark_adapter_suspended(&i_dev->adapter);
 
 	return dw_i2c_plat_runtime_suspend(dev);
 }
@@ -409,10 +407,7 @@ static int dw_i2c_plat_resume(struct device *dev)
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 
 	dw_i2c_plat_runtime_resume(dev);
-
-	i2c_lock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
-	i_dev->suspended = false;
-	i2c_unlock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
+	i2c_mark_adapter_resumed(&i_dev->adapter);
 
 	return 0;
 }
-- 
2.35.1

