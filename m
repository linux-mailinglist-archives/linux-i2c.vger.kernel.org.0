Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6BC86AAC
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2019 21:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390301AbfHHTjT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Aug 2019 15:39:19 -0400
Received: from sauhun.de ([88.99.104.3]:58202 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390300AbfHHTjS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Aug 2019 15:39:18 -0400
Received: from localhost (p5486CA1C.dip0.t-ipconnect.de [84.134.202.28])
        by pokefinder.org (Postfix) with ESMTPSA id A8BF72C3112;
        Thu,  8 Aug 2019 21:39:16 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
Subject: [PATCH] i2c: rcar: avoid race when unregistering slave client
Date:   Thu,  8 Aug 2019 21:39:10 +0200
Message-Id: <20190808193910.12365-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

After we disabled interrupts, there might still be an active one
running. Sync before clearing the pointer to the slave device.

Reported-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Tested with a Lager board (Renesas R-Car H2) and no regressions found. I
tried to run into this race via stress-testing but failed. The race
window is tiny, but it is still there, so let's fix it.

 drivers/i2c/busses/i2c-rcar.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index d39a4606f72d..531c01100b56 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -139,6 +139,7 @@ struct rcar_i2c_priv {
 	enum dma_data_direction dma_direction;
 
 	struct reset_control *rstc;
+	int irq;
 };
 
 #define rcar_i2c_priv_to_dev(p)		((p)->adap.dev.parent)
@@ -861,9 +862,11 @@ static int rcar_unreg_slave(struct i2c_client *slave)
 
 	WARN_ON(!priv->slave);
 
+	/* disable irqs and ensure none is running before clearing ptr */
 	rcar_i2c_write(priv, ICSIER, 0);
 	rcar_i2c_write(priv, ICSCR, 0);
 
+	synchronize_irq(priv->irq);
 	priv->slave = NULL;
 
 	pm_runtime_put(rcar_i2c_priv_to_dev(priv));
@@ -918,7 +921,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	struct i2c_adapter *adap;
 	struct device *dev = &pdev->dev;
 	struct i2c_timings i2c_t;
-	int irq, ret;
+	int ret;
 
 	/* Otherwise logic will break because some bytes must always use PIO */
 	BUILD_BUG_ON_MSG(RCAR_MIN_DMA_LEN < 3, "Invalid min DMA length");
@@ -984,10 +987,10 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 		pm_runtime_put(dev);
 
 
-	irq = platform_get_irq(pdev, 0);
-	ret = devm_request_irq(dev, irq, rcar_i2c_irq, 0, dev_name(dev), priv);
+	priv->irq = platform_get_irq(pdev, 0);
+	ret = devm_request_irq(dev, priv->irq, rcar_i2c_irq, 0, dev_name(dev), priv);
 	if (ret < 0) {
-		dev_err(dev, "cannot get irq %d\n", irq);
+		dev_err(dev, "cannot get irq %d\n", priv->irq);
 		goto out_pm_disable;
 	}
 
-- 
2.20.1

