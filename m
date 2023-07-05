Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E36A748F26
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 22:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbjGEUnm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 16:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233813AbjGEUnk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 16:43:40 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C638819AD;
        Wed,  5 Jul 2023 13:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688589810;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=obH8McaBd3nUMET7TuQgiFiKc+cl8J8cJlDEYCzaprU=;
        b=cr1y/7ymT1bphYVK/CGawimtywWwGDCF9aihE0i4zlmInnB6dJl8wKm+nAP5fd0mbGMfi8
        KbcJfuGRCvQeuAdPcQIVHUjgSgc4RhUDoqomysHbaWhJzVIG/dFDtXUuYBv5+3vA0yDms3
        yrrA5bu+y3UUn5UQGJbZKIcwSRLTv94=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Elie Morisse <syniurge@gmail.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>
Subject: [PATCH 01/23] i2c: amd-mp2: Remove #ifdef guards for PM related functions
Date:   Wed,  5 Jul 2023 22:42:52 +0200
Message-Id: <20230705204314.89800-2-paul@crapouillou.net>
In-Reply-To: <20230705204314.89800-1-paul@crapouillou.net>
References: <20230705204314.89800-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the new PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Note that the use of the UNIVERSAL_DEV_PM_OPS() macro was likely to be
wrong, as it sets the same callbacks for the runtime-PM and system
suspend/resume. This patch does not change this behaviour, but I suspect
that it should be changed to use DEFINE_RUNTIME_DEV_PM_OPS() instead, as
the current documentation for UNIVERSAL_DEV_PM_OPS() suggests.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>

---
Cc: Elie Morisse <syniurge@gmail.com>
Cc: Shyam Sundar S K <shyam-sundar.s-k@amd.com>
---
 drivers/i2c/busses/i2c-amd-mp2-pci.c  | 14 +++++---------
 drivers/i2c/busses/i2c-amd-mp2-plat.c |  8 ++------
 drivers/i2c/busses/i2c-amd-mp2.h      |  2 --
 3 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
index 143165300949..114fe329279a 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
@@ -382,7 +382,6 @@ static void amd_mp2_pci_remove(struct pci_dev *pci_dev)
 	amd_mp2_clear_reg(privdata);
 }
 
-#ifdef CONFIG_PM
 static int amd_mp2_pci_suspend(struct device *dev)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
@@ -434,9 +433,10 @@ static int amd_mp2_pci_resume(struct device *dev)
 	return ret;
 }
 
-static UNIVERSAL_DEV_PM_OPS(amd_mp2_pci_pm_ops, amd_mp2_pci_suspend,
-			    amd_mp2_pci_resume, NULL);
-#endif /* CONFIG_PM */
+static const struct dev_pm_ops amd_mp2_pci_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(amd_mp2_pci_suspend, amd_mp2_pci_resume)
+	RUNTIME_PM_OPS(amd_mp2_pci_suspend, amd_mp2_pci_resume, NULL)
+};
 
 static const struct pci_device_id amd_mp2_pci_tbl[] = {
 	{PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_MP2)},
@@ -449,11 +449,7 @@ static struct pci_driver amd_mp2_pci_driver = {
 	.id_table	= amd_mp2_pci_tbl,
 	.probe		= amd_mp2_pci_probe,
 	.remove		= amd_mp2_pci_remove,
-#ifdef CONFIG_PM
-	.driver = {
-		.pm	= &amd_mp2_pci_pm_ops,
-	},
-#endif
+	.driver.pm	= pm_ptr(&amd_mp2_pci_pm_ops),
 };
 module_pci_driver(amd_mp2_pci_driver);
 
diff --git a/drivers/i2c/busses/i2c-amd-mp2-plat.c b/drivers/i2c/busses/i2c-amd-mp2-plat.c
index 112fe2bc5662..4c677aeaca29 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-plat.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-plat.c
@@ -183,7 +183,6 @@ static const struct i2c_algorithm i2c_amd_algorithm = {
 	.functionality = i2c_amd_func,
 };
 
-#ifdef CONFIG_PM
 static int i2c_amd_suspend(struct amd_i2c_common *i2c_common)
 {
 	struct amd_i2c_dev *i2c_dev = amd_i2c_dev_common(i2c_common);
@@ -198,7 +197,6 @@ static int i2c_amd_resume(struct amd_i2c_common *i2c_common)
 
 	return i2c_amd_enable_set(i2c_dev, true);
 }
-#endif
 
 static const u32 supported_speeds[] = {
 	I2C_MAX_HIGH_SPEED_MODE_FREQ,
@@ -276,10 +274,8 @@ static int i2c_amd_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, i2c_dev);
 
 	i2c_dev->common.cmd_completion = &i2c_amd_cmd_completion;
-#ifdef CONFIG_PM
-	i2c_dev->common.suspend = &i2c_amd_suspend;
-	i2c_dev->common.resume = &i2c_amd_resume;
-#endif
+	i2c_dev->common.suspend = pm_ptr(&i2c_amd_suspend);
+	i2c_dev->common.resume = pm_ptr(&i2c_amd_resume);
 
 	/* Register the adapter */
 	amd_mp2_pm_runtime_get(mp2_dev);
diff --git a/drivers/i2c/busses/i2c-amd-mp2.h b/drivers/i2c/busses/i2c-amd-mp2.h
index 018a42de8b1e..40f3cdcc60aa 100644
--- a/drivers/i2c/busses/i2c-amd-mp2.h
+++ b/drivers/i2c/busses/i2c-amd-mp2.h
@@ -160,10 +160,8 @@ struct amd_i2c_common {
 	enum speed_enum i2c_speed;
 	u8 *dma_buf;
 	dma_addr_t dma_addr;
-#ifdef CONFIG_PM
 	int (*suspend)(struct amd_i2c_common *i2c_common);
 	int (*resume)(struct amd_i2c_common *i2c_common);
-#endif /* CONFIG_PM */
 };
 
 /**
-- 
2.40.1

