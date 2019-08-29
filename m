Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB8CAA1074
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 06:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbfH2E3p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 00:29:45 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:54664 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfH2E3p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Aug 2019 00:29:45 -0400
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id C8D38789194; Thu, 29 Aug 2019 06:29:41 +0200 (CEST)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Oleksij Rempel <linux@rempel-privat.de>
Cc:     kernel@pengutronix.de, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Enrico Weigelt <lkml@metux.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] [RFC] i2c: imx: make use of format specifier %dE
Date:   Thu, 29 Aug 2019 06:29:05 +0200
Message-Id: <20190829042905.4850-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I created a patch that teaches printk et al to emit a symbolic error
name for an error valued integer[1]. With that applied

	dev_err(&pdev->dev, "can't enable I2C clock, ret=%dE\n", ret);

emits

	... can't enable I2C clock, ret=EIO

if ret is -EIO. Petr Mladek (i.e. one of the printk maintainers) had
concerns if this would be well received and worth the effort. He asked
to present it to a few subsystems. So for now, this patch converting the
i2c-imx driver shouldn't be applied yet but it would be great to get
some feedback about if you think that being able to easily printk (for
example) "EIO" instead of "-5" is a good idea. Would it help you? Do you
think it helps your users?

Thanks
Uwe

[1] https://lkml.org/lkml/2019/8/27/1456
---
 drivers/i2c/busses/i2c-imx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 15f6cde6452f..359e911cb891 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -289,7 +289,7 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
 	if (IS_ERR(dma->chan_tx)) {
 		ret = PTR_ERR(dma->chan_tx);
 		if (ret != -ENODEV && ret != -EPROBE_DEFER)
-			dev_err(dev, "can't request DMA tx channel (%d)\n", ret);
+			dev_err(dev, "can't request DMA tx channel (%dE)\n", ret);
 		goto fail_al;
 	}
 
@@ -300,7 +300,7 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
 	dma_sconfig.direction = DMA_MEM_TO_DEV;
 	ret = dmaengine_slave_config(dma->chan_tx, &dma_sconfig);
 	if (ret < 0) {
-		dev_err(dev, "can't configure tx channel (%d)\n", ret);
+		dev_err(dev, "can't configure tx channel (%dE)\n", ret);
 		goto fail_tx;
 	}
 
@@ -308,7 +308,7 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
 	if (IS_ERR(dma->chan_rx)) {
 		ret = PTR_ERR(dma->chan_rx);
 		if (ret != -ENODEV && ret != -EPROBE_DEFER)
-			dev_err(dev, "can't request DMA rx channel (%d)\n", ret);
+			dev_err(dev, "can't request DMA rx channel (%dE)\n", ret);
 		goto fail_tx;
 	}
 
@@ -319,7 +319,7 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
 	dma_sconfig.direction = DMA_DEV_TO_MEM;
 	ret = dmaengine_slave_config(dma->chan_rx, &dma_sconfig);
 	if (ret < 0) {
-		dev_err(dev, "can't configure rx channel (%d)\n", ret);
+		dev_err(dev, "can't configure rx channel (%dE)\n", ret);
 		goto fail_rx;
 	}
 
@@ -964,7 +964,7 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
 	pm_runtime_put_autosuspend(i2c_imx->adapter.dev.parent);
 
 out:
-	dev_dbg(&i2c_imx->adapter.dev, "<%s> exit with: %s: %d\n", __func__,
+	dev_dbg(&i2c_imx->adapter.dev, "<%s> exit with: %s: %dE\n", __func__,
 		(result < 0) ? "error" : "success msg",
 			(result < 0) ? result : num);
 	return (result < 0) ? result : num;
@@ -1100,7 +1100,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(i2c_imx->clk);
 	if (ret) {
-		dev_err(&pdev->dev, "can't enable I2C clock, ret=%d\n", ret);
+		dev_err(&pdev->dev, "can't enable I2C clock, ret=%dE\n", ret);
 		return ret;
 	}
 
@@ -1108,7 +1108,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	ret = devm_request_irq(&pdev->dev, irq, i2c_imx_isr, IRQF_SHARED,
 				pdev->name, i2c_imx);
 	if (ret) {
-		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
+		dev_err(&pdev->dev, "can't claim irq %dE\n", irq);
 		goto clk_disable;
 	}
 
@@ -1230,7 +1230,7 @@ static int __maybe_unused i2c_imx_runtime_resume(struct device *dev)
 
 	ret = clk_enable(i2c_imx->clk);
 	if (ret)
-		dev_err(dev, "can't enable I2C clock, ret=%d\n", ret);
+		dev_err(dev, "can't enable I2C clock, ret=%dE\n", ret);
 
 	return ret;
 }
-- 
2.23.0

