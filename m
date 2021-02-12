Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC1CC31A321
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Feb 2021 17:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229465AbhBLQxr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Feb 2021 11:53:47 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:17365 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbhBLQxi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Feb 2021 11:53:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1613148585;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
        bh=2BosGdLEVca1vo7eADB7GO0sDSEP41E/Ts7Qp1qaAVk=;
        b=AMoUv9WSCpFWXqJ0zxjVwVtz8lbnuWuXylRD7S2G3C+V/yl5anI/A8sjVdXRkAkf4T
        4ql16je5Krt6667L2CkEwpgPYLKHkckdJ0CRPEczTYW+SR711cG8t0WffLmwCzWH+byd
        l9UqHEQWjQpMWqiq907WVbMLm5Kb5fxI8VIKFDKpzYRpkuecTM1gt8dwdlR0atYuUnFp
        aq1J+2stBnjNCRUvmumeN4Z7D7sLLFKfih2YH+9EfwInDL9ouG4W7U9gaoktSZR3RWGm
        ED5MuwRiw4JR5OyGcYInFg3BodxK8H+ORmyIkDQvtyrqTgbiuzp0q3EUJMYj898xB1Hj
        bMlw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR9WZEaxOy"
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.17.1 DYNA|AUTH)
        with ESMTPSA id c05ce8x1CGjkMHz
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 12 Feb 2021 17:45:46 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, linux-i2c@vger.kernel.org,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH] i2c: rcar: implement atomic transfers
Date:   Fri, 12 Feb 2021 17:45:41 +0100
Message-Id: <20210212164541.8986-1-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Implements atomic transfers. Tested by rebooting an r8a7790 Lager board
after connecting the i2c-rcar controller to the PMIC in
arch/arm/boot/dts/r8a7790-lager.dts like so:

		compatible = "i2c-demux-pinctrl";
		pinctrl-names = "default";
		pinctrl-0 = <&pmic_irq_pins>;
-		i2c-parent = <&iic3>, <&i2c3>;
+		i2c-parent = <&i2c3>, <&iic3>;
		i2c-bus-name = "i2c-pwr";
		#address-cells = <1>;
		#size-cells = <0>;

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/i2c/busses/i2c-rcar.c | 84 ++++++++++++++++++++++++++++++++---
 1 file changed, 78 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 12f6d452c0f7..1f0c164f671a 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -141,6 +141,7 @@ struct rcar_i2c_priv {
 	enum dma_data_direction dma_direction;
 
 	struct reset_control *rstc;
+	bool atomic_xfer;
 	int irq;
 
 	struct i2c_client *host_notify_client;
@@ -353,7 +354,9 @@ static void rcar_i2c_prepare_msg(struct rcar_i2c_priv *priv)
 			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_START);
 		rcar_i2c_write(priv, ICMSR, 0);
 	}
-	rcar_i2c_write(priv, ICMIER, read ? RCAR_IRQ_RECV : RCAR_IRQ_SEND);
+
+	if (!priv->atomic_xfer)
+		rcar_i2c_write(priv, ICMIER, read ? RCAR_IRQ_RECV : RCAR_IRQ_SEND);
 }
 
 static void rcar_i2c_next_msg(struct rcar_i2c_priv *priv)
@@ -418,7 +421,7 @@ static bool rcar_i2c_dma(struct rcar_i2c_priv *priv)
 	int len;
 
 	/* Do various checks to see if DMA is feasible at all */
-	if (IS_ERR(chan) || msg->len < RCAR_MIN_DMA_LEN ||
+	if (priv->atomic_xfer || IS_ERR(chan) || msg->len < RCAR_MIN_DMA_LEN ||
 	    !(msg->flags & I2C_M_DMA_SAFE) || (read && priv->flags & ID_P_NO_RXDMA))
 		return false;
 
@@ -646,7 +649,8 @@ static irqreturn_t rcar_i2c_irq(int irq, struct rcar_i2c_priv *priv, u32 msr)
 	/* Nack */
 	if (msr & MNR) {
 		/* HW automatically sends STOP after received NACK */
-		rcar_i2c_write(priv, ICMIER, RCAR_IRQ_STOP);
+		if (!priv->atomic_xfer)
+			rcar_i2c_write(priv, ICMIER, RCAR_IRQ_STOP);
 		priv->flags |= ID_NACK;
 		goto out;
 	}
@@ -667,7 +671,8 @@ static irqreturn_t rcar_i2c_irq(int irq, struct rcar_i2c_priv *priv, u32 msr)
 	if (priv->flags & ID_DONE) {
 		rcar_i2c_write(priv, ICMIER, 0);
 		rcar_i2c_write(priv, ICMSR, 0);
-		wake_up(&priv->wait);
+		if (!priv->atomic_xfer)
+			wake_up(&priv->wait);
 	}
 
 	return IRQ_HANDLED;
@@ -684,7 +689,8 @@ static irqreturn_t rcar_i2c_gen2_irq(int irq, void *ptr)
 
 	/* Only handle interrupts that are currently enabled */
 	msr = rcar_i2c_read(priv, ICMSR);
-	msr &= rcar_i2c_read(priv, ICMIER);
+	if (!priv->atomic_xfer)
+		msr &= rcar_i2c_read(priv, ICMIER);
 
 	return rcar_i2c_irq(irq, priv, msr);
 }
@@ -696,7 +702,8 @@ static irqreturn_t rcar_i2c_gen3_irq(int irq, void *ptr)
 
 	/* Only handle interrupts that are currently enabled */
 	msr = rcar_i2c_read(priv, ICMSR);
-	msr &= rcar_i2c_read(priv, ICMIER);
+	if (!priv->atomic_xfer)
+		msr &= rcar_i2c_read(priv, ICMIER);
 
 	/*
 	 * Clear START or STOP immediately, except for REPSTART after read or
@@ -804,6 +811,8 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 	int i, ret;
 	long time_left;
 
+	priv->atomic_xfer = false;
+
 	pm_runtime_get_sync(dev);
 
 	/* Check bus state before init otherwise bus busy info will be lost */
@@ -858,6 +867,68 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 	return ret;
 }
 
+static int rcar_i2c_master_xfer_atomic(struct i2c_adapter *adap,
+				struct i2c_msg *msgs,
+				int num)
+{
+	struct rcar_i2c_priv *priv = i2c_get_adapdata(adap);
+	struct device *dev = rcar_i2c_priv_to_dev(priv);
+	unsigned long j;
+	bool time_left;
+	int ret;
+
+	priv->atomic_xfer = true;
+
+	pm_runtime_get_sync(dev);
+
+	/* Check bus state before init otherwise bus busy info will be lost */
+	ret = rcar_i2c_bus_barrier(priv);
+	if (ret < 0)
+		goto out;
+
+	rcar_i2c_init(priv);
+
+	/* init first message */
+	priv->msg = msgs;
+	priv->msgs_left = num;
+	priv->flags = (priv->flags & ID_P_MASK) | ID_FIRST_MSG;
+	rcar_i2c_prepare_msg(priv);
+
+	j = jiffies + num * adap->timeout;
+	do {
+		u32 msr = rcar_i2c_read(priv, ICMSR);
+
+		msr &= (rcar_i2c_is_recv(priv) ? RCAR_IRQ_RECV : RCAR_IRQ_SEND) | RCAR_IRQ_STOP;
+
+		if (msr) {
+			if (priv->devtype < I2C_RCAR_GEN3)
+				rcar_i2c_gen2_irq(0, priv);
+			else
+				rcar_i2c_gen3_irq(0, priv);
+		}
+
+		time_left = time_before_eq(jiffies, j);
+	} while (!(priv->flags & ID_DONE) && time_left);
+
+	if (!time_left) {
+		rcar_i2c_init(priv);
+		ret = -ETIMEDOUT;
+	} else if (priv->flags & ID_NACK) {
+		ret = -ENXIO;
+	} else if (priv->flags & ID_ARBLOST) {
+		ret = -EAGAIN;
+	} else {
+		ret = num - priv->msgs_left; /* The number of transfer */
+	}
+out:
+	pm_runtime_put(dev);
+
+	if (ret < 0 && ret != -ENXIO)
+		dev_err(dev, "error %d : %x\n", ret, priv->flags);
+
+	return ret;
+}
+
 static int rcar_reg_slave(struct i2c_client *slave)
 {
 	struct rcar_i2c_priv *priv = i2c_get_adapdata(slave->adapter);
@@ -922,6 +993,7 @@ static u32 rcar_i2c_func(struct i2c_adapter *adap)
 
 static const struct i2c_algorithm rcar_i2c_algo = {
 	.master_xfer	= rcar_i2c_master_xfer,
+	.master_xfer_atomic = rcar_i2c_master_xfer_atomic,
 	.functionality	= rcar_i2c_func,
 	.reg_slave	= rcar_reg_slave,
 	.unreg_slave	= rcar_unreg_slave,
-- 
2.20.1

