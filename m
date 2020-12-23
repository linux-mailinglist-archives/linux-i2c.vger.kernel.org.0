Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88B812E1FD5
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Dec 2020 18:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgLWRWp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Dec 2020 12:22:45 -0500
Received: from www.zeus03.de ([194.117.254.33]:41318 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725957AbgLWRWp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Dec 2020 12:22:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=1JW78K30O2RbXi
        D/46e66qs9goat0S+NhqzHuG4kNXs=; b=StiL3grPgjnquBqYamH1YGAMWtuMyv
        KdpGVlNBoPCDRNj1afIEt0U1SxshbwdmZ4Sv5WmUm4EFmP06E9tHhgAuILzjwLs+
        ewQFHed0DZsUS9JgC2lJYVR9TYFB4pl3K/k1oxTdjddN0P8HA7zMxwdQBKAUdzaw
        Epd700XulFAtI=
Received: (qmail 543679 invoked from network); 23 Dec 2020 18:22:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Dec 2020 18:22:03 +0100
X-UD-Smtp-Session: l3s3148p1@D9D77SS3vOdUhszw
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 4/4] i2c: rcar: protect against supurious interrupts on V3U
Date:   Wed, 23 Dec 2020 18:21:54 +0100
Message-Id: <20201223172154.34462-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201223172154.34462-1-wsa+renesas@sang-engineering.com>
References: <20201223172154.34462-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

V3U creates spurious interrupts which we need to handle. This costs time
until BUS_PHASE_DATA can be activated which is problematic for Gen2 SoCs
and earlier. Because of this we introduce two interrupt handlers here
which will call a generic main irq function once the timing critical
stuff is done.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 57 ++++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 3c9c3a6f7ac8..12f6d452c0f7 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -625,20 +625,11 @@ static bool rcar_i2c_slave_irq(struct rcar_i2c_priv *priv)
  * generated. It turned out that taking a spinlock at the beginning of the ISR
  * was already causing repeated messages. Thus, this driver was converted to
  * the now lockless behaviour. Please keep this in mind when hacking the driver.
+ * R-Car Gen3 seems to have this fixed but earlier versions than R-Car Gen2 are
+ * likely affected. Therefore, we have different interrupt handler entries.
  */
-static irqreturn_t rcar_i2c_irq(int irq, void *ptr)
+static irqreturn_t rcar_i2c_irq(int irq, struct rcar_i2c_priv *priv, u32 msr)
 {
-	struct rcar_i2c_priv *priv = ptr;
-	u32 msr;
-
-	/* Clear START or STOP immediately, except for REPSTART after read */
-	if (likely(!(priv->flags & ID_P_REP_AFTER_RD)))
-		rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_DATA);
-
-	msr = rcar_i2c_read(priv, ICMSR);
-
-	/* Only handle interrupts that are currently enabled */
-	msr &= rcar_i2c_read(priv, ICMIER);
 	if (!msr) {
 		if (rcar_i2c_slave_irq(priv))
 			return IRQ_HANDLED;
@@ -682,6 +673,41 @@ static irqreturn_t rcar_i2c_irq(int irq, void *ptr)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t rcar_i2c_gen2_irq(int irq, void *ptr)
+{
+	struct rcar_i2c_priv *priv = ptr;
+	u32 msr;
+
+	/* Clear START or STOP immediately, except for REPSTART after read */
+	if (likely(!(priv->flags & ID_P_REP_AFTER_RD)))
+		rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_DATA);
+
+	/* Only handle interrupts that are currently enabled */
+	msr = rcar_i2c_read(priv, ICMSR);
+	msr &= rcar_i2c_read(priv, ICMIER);
+
+	return rcar_i2c_irq(irq, priv, msr);
+}
+
+static irqreturn_t rcar_i2c_gen3_irq(int irq, void *ptr)
+{
+	struct rcar_i2c_priv *priv = ptr;
+	u32 msr;
+
+	/* Only handle interrupts that are currently enabled */
+	msr = rcar_i2c_read(priv, ICMSR);
+	msr &= rcar_i2c_read(priv, ICMIER);
+
+	/*
+	 * Clear START or STOP immediately, except for REPSTART after read or
+	 * if a spurious interrupt was detected.
+	 */
+	if (likely(!(priv->flags & ID_P_REP_AFTER_RD) && msr))
+		rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_DATA);
+
+	return rcar_i2c_irq(irq, priv, msr);
+}
+
 static struct dma_chan *rcar_i2c_request_dma_chan(struct device *dev,
 					enum dma_transfer_direction dir,
 					dma_addr_t port_addr)
@@ -929,6 +955,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	struct i2c_adapter *adap;
 	struct device *dev = &pdev->dev;
 	unsigned long irqflags = 0;
+	irqreturn_t (*irqhandler)(int irq, void *ptr) = rcar_i2c_gen3_irq;
 	int ret;
 
 	/* Otherwise logic will break because some bytes must always use PIO */
@@ -977,8 +1004,10 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 
 	rcar_i2c_write(priv, ICSAR, 0); /* Gen2: must be 0 if not using slave */
 
-	if (priv->devtype < I2C_RCAR_GEN3)
+	if (priv->devtype < I2C_RCAR_GEN3) {
 		irqflags |= IRQF_NO_THREAD;
+		irqhandler = rcar_i2c_gen2_irq;
+	}
 
 	if (priv->devtype == I2C_RCAR_GEN3) {
 		priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
@@ -999,7 +1028,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 		priv->flags |= ID_P_HOST_NOTIFY;
 
 	priv->irq = platform_get_irq(pdev, 0);
-	ret = devm_request_irq(dev, priv->irq, rcar_i2c_irq, irqflags, dev_name(dev), priv);
+	ret = devm_request_irq(dev, priv->irq, irqhandler, irqflags, dev_name(dev), priv);
 	if (ret < 0) {
 		dev_err(dev, "cannot get irq %d\n", priv->irq);
 		goto out_pm_disable;
-- 
2.28.0

