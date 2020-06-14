Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED0BD1F8862
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 12:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgFNK30 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 06:29:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:59194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725265AbgFNK3Y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 14 Jun 2020 06:29:24 -0400
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B020D20775;
        Sun, 14 Jun 2020 10:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592130564;
        bh=VbPnrh2dzWmMu5AE0V4vF5f2FTzseq8nQUHehOUFwYo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ds0Zyl5uWepxD2oLJwyPWlfZwstz7tadBfOX10qtRemlwtfs8s7iK9wzRnGbCQ45H
         cCTECw+8379UGcqi5gUW6PWqPEq8/Orwly3BYSWmHiTqxsM8c8ZU+Q34JYQGPnbjBF
         3wzwL4qTKFfG9FQDWYMm0/XOhGs//bX/eeocvO6s=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Marc Kleine-Budde <mkl@pengutronix.de>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
Subject: [PATCH v2 2/2] i2c: imx: Fix external abort on interrupt in exit paths
Date:   Sun, 14 Jun 2020 12:29:04 +0200
Message-Id: <1592130544-19759-2-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592130544-19759-1-git-send-email-krzk@kernel.org>
References: <1592130544-19759-1-git-send-email-krzk@kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If interrupt comes late, during probe error path or device remove (could
be triggered with CONFIG_DEBUG_SHIRQ), the interrupt handler
i2c_imx_isr() will access registers with the clock being disabled.  This
leads to external abort on non-linefetch on Toradex Colibri VF50 module
(with Vybrid VF5xx):

Unhandled fault: external abort on non-linefetch (0x1008) at 0x8882d003
Internal error: : 1008 [#1] ARM
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 5.7.0 #607
Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
  (i2c_imx_isr) from [<8017009c>] (free_irq+0x25c/0x3b0)
  (free_irq) from [<805844ec>] (release_nodes+0x178/0x284)
  (release_nodes) from [<80580030>] (really_probe+0x10c/0x348)
  (really_probe) from [<80580380>] (driver_probe_device+0x60/0x170)
  (driver_probe_device) from [<80580630>] (device_driver_attach+0x58/0x60)
  (device_driver_attach) from [<805806bc>] (__driver_attach+0x84/0xc0)
  (__driver_attach) from [<8057e228>] (bus_for_each_dev+0x68/0xb4)
  (bus_for_each_dev) from [<8057f3ec>] (bus_add_driver+0x144/0x1ec)
  (bus_add_driver) from [<80581320>] (driver_register+0x78/0x110)
  (driver_register) from [<8010213c>] (do_one_initcall+0xa8/0x2f4)
  (do_one_initcall) from [<80c0100c>] (kernel_init_freeable+0x178/0x1dc)
  (kernel_init_freeable) from [<80807048>] (kernel_init+0x8/0x110)
  (kernel_init) from [<80100114>] (ret_from_fork+0x14/0x20)

Additionally, the i2c_imx_isr() could wake up the wait queue
(imx_i2c_struct->queue) before its initialization happens.

The resource-managed framework should not be used for interrupt handling,
because the resource will be released too late - after disabling clocks.
The interrupt handler is not prepared for such case.

Fixes: 1c4b6c3bcf30 ("i2c: imx: implement bus recovery")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Remove the devm- and use regular methods.
---
 drivers/i2c/busses/i2c-imx.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 6e45958565d1..8a0d49419326 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1171,14 +1171,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Request IRQ */
-	ret = devm_request_irq(&pdev->dev, irq, i2c_imx_isr, IRQF_SHARED,
-				pdev->name, i2c_imx);
-	if (ret) {
-		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
-		goto clk_disable;
-	}
-
 	/* Init queue */
 	init_waitqueue_head(&i2c_imx->queue);
 
@@ -1197,6 +1189,14 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto rpm_disable;
 
+	/* Request IRQ */
+	ret = request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
+				   pdev->name, i2c_imx);
+	if (ret) {
+		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
+		goto rpm_put;
+	}
+
 	/* Set up clock divider */
 	i2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
 	ret = of_property_read_u32(pdev->dev.of_node,
@@ -1239,13 +1239,13 @@ static int i2c_imx_probe(struct platform_device *pdev)
 
 clk_notifier_unregister:
 	clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
+	free_irq(irq, i2c_imx);
+rpm_put:
 	pm_runtime_put_noidle(&pdev->dev);
 rpm_disable:
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
-
-clk_disable:
 	clk_disable_unprepare(i2c_imx->clk);
 	return ret;
 }
@@ -1253,7 +1253,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 static int i2c_imx_remove(struct platform_device *pdev)
 {
 	struct imx_i2c_struct *i2c_imx = platform_get_drvdata(pdev);
-	int ret;
+	int irq, ret;
 
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
@@ -1273,6 +1273,9 @@ static int i2c_imx_remove(struct platform_device *pdev)
 	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2SR);
 
 	clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
+	irq = platform_get_irq(pdev, 0);
+	if (irq >= 0)
+		free_irq(irq, i2c_imx);
 	clk_disable_unprepare(i2c_imx->clk);
 
 	pm_runtime_put_noidle(&pdev->dev);
-- 
2.7.4

