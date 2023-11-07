Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02D657E419F
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Nov 2023 15:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234050AbjKGOM0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Nov 2023 09:12:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbjKGOMZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Nov 2023 09:12:25 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D031BB4
        for <linux-i2c@vger.kernel.org>; Tue,  7 Nov 2023 06:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1699366342; x=1730902342;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OkTo0oXd0SGlrDzbhRw7Pu0dtcxpyYuzNSLrwrYbOO8=;
  b=HIIuPgJXrj3vgS4wVDRLjglo5pzYxoQgI563X7lscuaovGLcMs/NU/j/
   6h8Go7HDaCu9VbkGgmA2wTqIGkweU1SmEoo6jaknqHceqrCXS/SJq81UF
   DvDWz7fopxEDLmk9Xb4MiX49z4PK2IKGtbEWBpgxzYDhdKPsdytOe7V/r
   Ae7AfAAIVWsi+QCgeVAxE+GEN5R6b9ODrV3+5sXPt9u3TZL0y2LIIU9tz
   /lFhQtGZLediQGV5gWBL1HPme/dJz/b/mrCXUYRbEozW2JtQYQ/grNxEW
   wAfzqc7tJL+MNesaFsOVLpCd8nySkPQeneL43nv1qGlIccarCo5ibx4m1
   A==;
X-IronPort-AV: E=Sophos;i="6.03,283,1694728800"; 
   d="scan'208";a="33854643"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 07 Nov 2023 15:12:20 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C3C3928007F;
        Tue,  7 Nov 2023 15:12:19 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v7 1/1] i2c: lpi2c: use clk notifier for rate changes
Date:   Tue,  7 Nov 2023 15:12:01 +0100
Message-Id: <20231107141201.623482-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Instead of repeatedly calling clk_get_rate for each transfer, register
a clock notifier to update the cached divider value each time the clock
rate actually changes.
There is also a lockdep splat if a I2C based clock provider needs to
access the i2c bus while in recalc_rate(). "prepare_lock" is about to
be locked recursively.

Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v7:
* Use dev_err_probe
* Reworked/Shortened the commit message
 It is not about saving CPU cycles, but to avoid locking the clk subsystem
 upon each transfer.

 drivers/i2c/busses/i2c-imx-lpi2c.c | 40 +++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 678b30e90492a..3070e605fd8ff 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -5,6 +5,7 @@
  * Copyright 2016 Freescale Semiconductor, Inc.
  */
 
+#include <linux/atomic.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
@@ -99,6 +100,8 @@ struct lpi2c_imx_struct {
 	__u8			*rx_buf;
 	__u8			*tx_buf;
 	struct completion	complete;
+	struct notifier_block	clk_change_nb;
+	atomic_t		rate_per;
 	unsigned int		msglen;
 	unsigned int		delivered;
 	unsigned int		block_data;
@@ -197,6 +200,20 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx)
 	} while (1);
 }
 
+static int lpi2c_imx_clk_change_cb(struct notifier_block *nb,
+				   unsigned long action, void *data)
+{
+	struct clk_notifier_data *ndata = data;
+	struct lpi2c_imx_struct *lpi2c_imx = container_of(nb,
+							  struct lpi2c_imx_struct,
+							  clk_change_nb);
+
+	if (action & POST_RATE_CHANGE)
+		atomic_set(&lpi2c_imx->rate_per, ndata->new_rate);
+
+	return NOTIFY_OK;
+}
+
 /* CLKLO = I2C_CLK_RATIO * CLKHI, SETHOLD = CLKHI, DATAVD = CLKHI/2 */
 static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 {
@@ -207,7 +224,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 
 	lpi2c_imx_set_mode(lpi2c_imx);
 
-	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
+	clk_rate = atomic_read(&lpi2c_imx->rate_per);
 	if (!clk_rate)
 		return -EINVAL;
 
@@ -590,6 +607,27 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	lpi2c_imx->clk_change_nb.notifier_call = lpi2c_imx_clk_change_cb;
+	ret = devm_clk_notifier_register(&pdev->dev, lpi2c_imx->clks[0].clk,
+					 &lpi2c_imx->clk_change_nb);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't register peripheral clock notifier\n");
+	/*
+	 * Lock the clock rate to avoid rate change between clk_get_rate() and
+	 * atomic_set()
+	 */
+	ret = clk_rate_exclusive_get(lpi2c_imx->clks[0].clk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't lock I2C peripheral clock rate\n");
+
+	atomic_set(&lpi2c_imx->rate_per, clk_get_rate(lpi2c_imx->clks[0].clk));
+	clk_rate_exclusive_put(lpi2c_imx->clks[0].clk);
+	if (!atomic_read(&lpi2c_imx->rate_per))
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "can't get I2C peripheral clock rate\n");
+
 	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
-- 
2.34.1

