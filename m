Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2AF4C14A5
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Feb 2022 14:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235380AbiBWNtW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Feb 2022 08:49:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232897AbiBWNtV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Feb 2022 08:49:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1AD08AF1E2
        for <linux-i2c@vger.kernel.org>; Wed, 23 Feb 2022 05:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645624133;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=QKY99ZXZ9YfHFSEaY8xlB4C3QXeafgWGGiJQpFtDBaA=;
        b=hUmQFjwMhOSkE8NSalE9UHEBixTSvOo+YYmjCW3DaXHaWVbImJ1/gddDPJbicvWfAaomv/
        6UaEULVWOsyRoT2ELpUQ/d89aoA5SJDg1c1ZG4U9aieA22slVCUNVJ4hvdALjegYKPjhrv
        6Odnw/o4H/hsW69qA1cn9C6KzZ4lXjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-g2DAv-W9OYmqtv89seDoCg-1; Wed, 23 Feb 2022 08:48:50 -0500
X-MC-Unique: g2DAv-W9OYmqtv89seDoCg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE4D2185A0C0;
        Wed, 23 Feb 2022 13:48:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5F86F838DB;
        Wed, 23 Feb 2022 13:48:47 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-i2c@vger.kernel.org
Subject: [PATCH 1/2] i2c: designware: Lock the adapter while setting the suspended flag
Date:   Wed, 23 Feb 2022 14:48:38 +0100
Message-Id: <20220223134839.731138-1-hdegoede@redhat.com>
MIME-Version: 1.0
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

Lock the adapter while setting the suspended flag, to ensure that other
locked code always sees the change immediately, rather then possibly using
a stale value.

This involves splitting the suspend/resume callbacks into separate runtime
and normal suspend/resume calls. This is necessary because i2c_dw_xfer()
will get called by the i2c-core with the adapter locked and it in turn
calls the runtime-resume callback through pm_runtime_get_sync().

So the runtime versions of the suspend/resume callbacks cannot take
the adapter-lock. Note this patch simply makes the runtime suspend/resume
callbacks not deal with the suspended flag at all. During runtime the
pm_runtime_get_sync() from i2c_dw_xfer() will always ensure that the
adapter is resumed when necessary.

The suspended flag check is only necessary to check proper suspend/resume
ordering during normal suspend/resume which makes the pm_runtime_get_sync()
call a no-op.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 31 +++++++++++++++++----
 drivers/i2c/busses/i2c-designware-platdrv.c | 31 +++++++++++++++++----
 2 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index ef4250f8852b..9553d7075223 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -213,14 +213,30 @@ static struct dw_pci_controller dw_pci_controllers[] = {
 	},
 };
 
+static int __maybe_unused i2c_dw_pci_runtime_suspend(struct device *dev)
+{
+	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
+
+	i_dev->disable(i_dev);
+	return 0;
+}
+
 static int __maybe_unused i2c_dw_pci_suspend(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 
+	i2c_lock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
 	i_dev->suspended = true;
-	i_dev->disable(i_dev);
+	i2c_unlock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
 
-	return 0;
+	return i2c_dw_pci_runtime_suspend(dev);
+}
+
+static int __maybe_unused i2c_dw_pci_runtime_resume(struct device *dev)
+{
+	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
+
+	return i_dev->init(i_dev);
 }
 
 static int __maybe_unused i2c_dw_pci_resume(struct device *dev)
@@ -228,14 +244,19 @@ static int __maybe_unused i2c_dw_pci_resume(struct device *dev)
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 	int ret;
 
-	ret = i_dev->init(i_dev);
+	ret = i2c_dw_pci_runtime_resume(dev);
+
+	i2c_lock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
 	i_dev->suspended = false;
+	i2c_unlock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
 
 	return ret;
 }
 
-static UNIVERSAL_DEV_PM_OPS(i2c_dw_pm_ops, i2c_dw_pci_suspend,
-			    i2c_dw_pci_resume, NULL);
+static const struct dev_pm_ops i2c_dw_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(i2c_dw_pci_suspend, i2c_dw_pci_resume)
+	SET_RUNTIME_PM_OPS(i2c_dw_pci_runtime_suspend, i2c_dw_pci_runtime_resume, NULL)
+};
 
 static int i2c_dw_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *id)
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 2bd81abc86f6..8e45f65bab73 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -368,12 +368,10 @@ static void dw_i2c_plat_complete(struct device *dev)
 #endif
 
 #ifdef CONFIG_PM
-static int dw_i2c_plat_suspend(struct device *dev)
+static int dw_i2c_plat_runtime_suspend(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 
-	i_dev->suspended = true;
-
 	if (i_dev->shared_with_punit)
 		return 0;
 
@@ -383,7 +381,18 @@ static int dw_i2c_plat_suspend(struct device *dev)
 	return 0;
 }
 
-static int dw_i2c_plat_resume(struct device *dev)
+static int dw_i2c_plat_suspend(struct device *dev)
+{
+	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
+
+	i2c_lock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
+	i_dev->suspended = true;
+	i2c_unlock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
+
+	return dw_i2c_plat_runtime_suspend(dev);
+}
+
+static int dw_i2c_plat_runtime_resume(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 
@@ -391,7 +400,19 @@ static int dw_i2c_plat_resume(struct device *dev)
 		i2c_dw_prepare_clk(i_dev, true);
 
 	i_dev->init(i_dev);
+
+	return 0;
+}
+
+static int dw_i2c_plat_resume(struct device *dev)
+{
+	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
+
+	dw_i2c_plat_runtime_resume(dev);
+
+	i2c_lock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
 	i_dev->suspended = false;
+	i2c_unlock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
 
 	return 0;
 }
@@ -400,7 +421,7 @@ static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
 	.prepare = dw_i2c_plat_prepare,
 	.complete = dw_i2c_plat_complete,
 	SET_LATE_SYSTEM_SLEEP_PM_OPS(dw_i2c_plat_suspend, dw_i2c_plat_resume)
-	SET_RUNTIME_PM_OPS(dw_i2c_plat_suspend, dw_i2c_plat_resume, NULL)
+	SET_RUNTIME_PM_OPS(dw_i2c_plat_runtime_suspend, dw_i2c_plat_runtime_resume, NULL)
 };
 
 #define DW_I2C_DEV_PMOPS (&dw_i2c_dev_pm_ops)
-- 
2.35.1

