Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D37192E8BC1
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Jan 2021 11:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbhACKwi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 Jan 2021 05:52:38 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:53753 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726029AbhACKwh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 Jan 2021 05:52:37 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id AA0E251B;
        Sun,  3 Jan 2021 05:51:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 03 Jan 2021 05:51:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=pNHgSBW8RYTr+UdeVo6i146iO8
        tIN/TN0W3UEDm3Cyk=; b=sdArhijelFOtPHWA6/K9eNrYbI23MZuN0h7iCS0JGl
        EiO3K4tl71GSVXkHOn6VYRb7XAMZowF0hgIwTYESjPBGBfzQHJ4dM22mas9gLQtd
        XjJf0BYlOOqKZU4JAdvjgVDvsnwuaDjkUGLXr4VNzxnBJM7x5cz/FVqtlWvBB0B9
        jNzHR1R1Xp7wpGrSfFxWAMnULoq7Nrni0X7p5zUndieRiXzKY1RBTv6qgo0f1NCv
        TTiukJYWdDKaPHJa4t2tJUbSwkbaDDKHfE1Aeg1e9844tXoLi0dEzPgvuR49oLg2
        NfFKGHz024Rfo7YhnpyCSXKbqNXhfxAENjR5PZ3IgYeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=pNHgSBW8RYTr+UdeV
        o6i146iO8tIN/TN0W3UEDm3Cyk=; b=NyxbJrNmcVhzCJN2Vc+jvrs1Ap9AoCSSx
        xTreDD3gLUMzVxrbdLx60hmVXBQ6gzJbw5b9S0e0+64STEZoqnRru8h1B0E5cpKC
        PjpFs4qZxKyirXoDvPjubtDIbIzA0Tn9zyuZEp6wo3dWCdflT+puuamUaYVOKDyv
        zUg4Wp7HoGXQ4VgAqat4JL9xdBulvsi1XRWZUXoPFCqlAIXmIav4KFa4Y2ET+yTH
        CZGxkvtgqGKPaC2uyOyTiJ/uOikp6lYWwOgWUxj5NvakDjClulo0ckwzJvU9TkGt
        Ngy5J4MTfCGhZ87Rh3OL8g22sHrw1D/sCFpR4BvFUefVX3EESVAqQ==
X-ME-Sender: <xms:xKHxX7ypAQnrethFZDmnzw_GMQ9QAD0uGhdJsuB_D1kF6Ob6uU0Tuw>
    <xme:xKHxXzRJeh1MxSIfooV5bbUIbmDpS4BDI1Hnnn4YZBmaLWyj11_QKdjUgPsmFPnuY
    sZwsnUI9-GCRPlRAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefuddgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeeiteekhfehuddugfeltddufeejjeefgeevheekueffhffhjeekheeiffdt
    vedtveenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdr
    ohhrgh
X-ME-Proxy: <xmx:xKHxX1U7Jvbc6p6DXsbyEE1oOY-qU3fcrgeW7yC4IVxTZYIonmIOew>
    <xmx:xKHxX1gN1dTud1Ztpyd3rWH6K5i_NwF-7g_DI73THif06KmaSH9FvA>
    <xmx:xKHxX9CCF-Kum8m3579fY3x9WzIaPOkxFdrGv0gr5EI6rWe6TZLa6w>
    <xmx:xqHxX_31XGFDI55tIUE_CyZmGBCt3rDy0MY686NdCozldFBS_3Q1Aw>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 19EEA24005B;
        Sun,  3 Jan 2021 05:51:48 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ondrej Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH] i2c: mv64xxx: Add runtime PM support
Date:   Sun,  3 Jan 2021 04:51:46 -0600
Message-Id: <20210103105146.33835-1-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

To save power, gate the clock when the bus is inactive, during system
sleep, and during shutdown. On some platforms, specifically Allwinner
A13/A20, gating the clock implicitly resets the module as well. Since
the module already needs to be reset after some suspend/resume cycles,
it is simple enough to reset it during every runtime suspend/resume.

Because the bus may be used by wakeup source IRQ threads, it needs to
be functional as soon as IRQs are enabled. Thus, its system PM hooks
need to run in the noirq phase.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 120 ++++++++++++++++++++-----------
 1 file changed, 78 insertions(+), 42 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index 5cfe70aedced..b03c344323d1 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -18,6 +18,7 @@
 #include <linux/mv643xx_i2c.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/io.h>
 #include <linux/of.h>
@@ -717,6 +718,10 @@ mv64xxx_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	struct mv64xxx_i2c_data *drv_data = i2c_get_adapdata(adap);
 	int rc, ret = num;
 
+	rc = pm_runtime_resume_and_get(&adap->dev);
+	if (rc)
+		return rc;
+
 	BUG_ON(drv_data->msgs != NULL);
 	drv_data->msgs = msgs;
 	drv_data->num_msgs = num;
@@ -732,6 +737,9 @@ mv64xxx_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	drv_data->num_msgs = 0;
 	drv_data->msgs = NULL;
 
+	pm_runtime_mark_last_busy(&adap->dev);
+	pm_runtime_put_autosuspend(&adap->dev);
+
 	return ret;
 }
 
@@ -828,7 +836,6 @@ mv64xxx_of_config(struct mv64xxx_i2c_data *drv_data,
 		rc = PTR_ERR(drv_data->rstc);
 		goto out;
 	}
-	reset_control_deassert(drv_data->rstc);
 
 	/* Its not yet defined how timeouts will be specified in device tree.
 	 * So hard code the value to 1 second.
@@ -893,6 +900,32 @@ static int mv64xxx_i2c_init_recovery_info(struct mv64xxx_i2c_data *drv_data,
 	return 0;
 }
 
+static int
+mv64xxx_i2c_runtime_suspend(struct device *dev)
+{
+	struct mv64xxx_i2c_data *drv_data = dev_get_drvdata(dev);
+
+	reset_control_assert(drv_data->rstc);
+	clk_disable_unprepare(drv_data->reg_clk);
+	clk_disable_unprepare(drv_data->clk);
+
+	return 0;
+}
+
+static int
+mv64xxx_i2c_runtime_resume(struct device *dev)
+{
+	struct mv64xxx_i2c_data *drv_data = dev_get_drvdata(dev);
+
+	clk_prepare_enable(drv_data->clk);
+	clk_prepare_enable(drv_data->reg_clk);
+	reset_control_reset(drv_data->rstc);
+
+	mv64xxx_i2c_hw_init(drv_data);
+
+	return 0;
+}
+
 static int
 mv64xxx_i2c_probe(struct platform_device *pd)
 {
@@ -920,18 +953,22 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 
 	/* Not all platforms have clocks */
 	drv_data->clk = devm_clk_get(&pd->dev, NULL);
-	if (PTR_ERR(drv_data->clk) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-	if (!IS_ERR(drv_data->clk))
-		clk_prepare_enable(drv_data->clk);
+	if (IS_ERR(drv_data->clk)) {
+		if (PTR_ERR(drv_data->clk) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		drv_data->clk = NULL;
+	}
 
 	drv_data->reg_clk = devm_clk_get(&pd->dev, "reg");
-	if (PTR_ERR(drv_data->reg_clk) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-	if (!IS_ERR(drv_data->reg_clk))
-		clk_prepare_enable(drv_data->reg_clk);
+	if (IS_ERR(drv_data->reg_clk)) {
+		if (PTR_ERR(drv_data->reg_clk) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		drv_data->reg_clk = NULL;
+	}
 
 	drv_data->irq = platform_get_irq(pd, 0);
+	if (drv_data->irq < 0)
+		return drv_data->irq;
 
 	if (pdata) {
 		drv_data->freq_m = pdata->freq_m;
@@ -942,16 +979,12 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 	} else if (pd->dev.of_node) {
 		rc = mv64xxx_of_config(drv_data, &pd->dev);
 		if (rc)
-			goto exit_clk;
-	}
-	if (drv_data->irq < 0) {
-		rc = drv_data->irq;
-		goto exit_reset;
+			return rc;
 	}
 
 	rc = mv64xxx_i2c_init_recovery_info(drv_data, &pd->dev);
 	if (rc == -EPROBE_DEFER)
-		goto exit_reset;
+		return rc;
 
 	drv_data->adapter.dev.parent = &pd->dev;
 	drv_data->adapter.algo = &mv64xxx_i2c_algo;
@@ -962,7 +995,14 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 	platform_set_drvdata(pd, drv_data);
 	i2c_set_adapdata(&drv_data->adapter, drv_data);
 
-	mv64xxx_i2c_hw_init(drv_data);
+	pm_runtime_set_autosuspend_delay(&pd->dev, MSEC_PER_SEC);
+	pm_runtime_use_autosuspend(&pd->dev);
+	pm_runtime_enable(&pd->dev);
+	if (!pm_runtime_enabled(&pd->dev)) {
+		rc = mv64xxx_i2c_runtime_resume(&pd->dev);
+		if (rc)
+			goto exit_disable_pm;
+	}
 
 	rc = request_irq(drv_data->irq, mv64xxx_i2c_intr, 0,
 			 MV64XXX_I2C_CTLR_NAME, drv_data);
@@ -970,7 +1010,7 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 		dev_err(&drv_data->adapter.dev,
 			"mv64xxx: Can't register intr handler irq%d: %d\n",
 			drv_data->irq, rc);
-		goto exit_reset;
+		goto exit_disable_pm;
 	} else if ((rc = i2c_add_numbered_adapter(&drv_data->adapter)) != 0) {
 		dev_err(&drv_data->adapter.dev,
 			"mv64xxx: Can't add i2c adapter, rc: %d\n", -rc);
@@ -981,54 +1021,50 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 
 exit_free_irq:
 	free_irq(drv_data->irq, drv_data);
-exit_reset:
-	reset_control_assert(drv_data->rstc);
-exit_clk:
-	clk_disable_unprepare(drv_data->reg_clk);
-	clk_disable_unprepare(drv_data->clk);
+exit_disable_pm:
+	pm_runtime_disable(&pd->dev);
+	if (!pm_runtime_status_suspended(&pd->dev))
+		mv64xxx_i2c_runtime_suspend(&pd->dev);
 
 	return rc;
 }
 
 static int
-mv64xxx_i2c_remove(struct platform_device *dev)
+mv64xxx_i2c_remove(struct platform_device *pd)
 {
-	struct mv64xxx_i2c_data		*drv_data = platform_get_drvdata(dev);
+	struct mv64xxx_i2c_data		*drv_data = platform_get_drvdata(pd);
 
 	i2c_del_adapter(&drv_data->adapter);
 	free_irq(drv_data->irq, drv_data);
-	reset_control_assert(drv_data->rstc);
-	clk_disable_unprepare(drv_data->reg_clk);
-	clk_disable_unprepare(drv_data->clk);
+	pm_runtime_disable(&pd->dev);
+	if (!pm_runtime_status_suspended(&pd->dev))
+		mv64xxx_i2c_runtime_suspend(&pd->dev);
 
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int mv64xxx_i2c_resume(struct device *dev)
+static void
+mv64xxx_i2c_shutdown(struct platform_device *pd)
 {
-	struct mv64xxx_i2c_data *drv_data = dev_get_drvdata(dev);
-
-	mv64xxx_i2c_hw_init(drv_data);
-
-	return 0;
+	pm_runtime_disable(&pd->dev);
+	if (!pm_runtime_status_suspended(&pd->dev))
+		mv64xxx_i2c_runtime_suspend(&pd->dev);
 }
 
-static const struct dev_pm_ops mv64xxx_i2c_pm = {
-	.resume = mv64xxx_i2c_resume,
+static const struct dev_pm_ops mv64xxx_i2c_pm_ops = {
+	SET_RUNTIME_PM_OPS(mv64xxx_i2c_runtime_suspend,
+			   mv64xxx_i2c_runtime_resume, NULL)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				      pm_runtime_force_resume)
 };
 
-#define mv64xxx_i2c_pm_ops (&mv64xxx_i2c_pm)
-#else
-#define mv64xxx_i2c_pm_ops NULL
-#endif
-
 static struct platform_driver mv64xxx_i2c_driver = {
 	.probe	= mv64xxx_i2c_probe,
 	.remove	= mv64xxx_i2c_remove,
+	.shutdown = mv64xxx_i2c_shutdown,
 	.driver	= {
 		.name	= MV64XXX_I2C_CTLR_NAME,
-		.pm     = mv64xxx_i2c_pm_ops,
+		.pm     = &mv64xxx_i2c_pm_ops,
 		.of_match_table = mv64xxx_i2c_of_match_table,
 	},
 };
-- 
2.26.2

