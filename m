Return-Path: <linux-i2c+bounces-3684-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8A08D1AA5
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 14:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDC20B21185
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 12:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8B116B743;
	Tue, 28 May 2024 12:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OS06Afeu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1A271753;
	Tue, 28 May 2024 12:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716898036; cv=none; b=N2HMo+N50CgRAe1m6yb9oMZgvpBc2ZOAasn1QbP+vv0xmvUTHfFG6WYBM1mjt+hsHIVjxv7vTH6e3xWi580UQW1r7q+LMIAebxbARF2g7Bu4Yqd7fsucE8eMeM4wUMAjMeTpBO/qn8dWj6DpUYFaxvO+G04FWGRGAHfzag2t+5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716898036; c=relaxed/simple;
	bh=3NJyYszoVob0gKmWcC7e1PIMLB9ijUxqeL+CkuTM8Is=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HCyNXFAkkdfzkdvRWtIDCakdZ0tBq3PIsPUzwSCYkOl/OO3HkEK9Pv9UdH9iIlDTOKzjOOfYYWX5ENaB18eGCQbWmEx7gYVHQ5uBgOpi2AyStpOTct662eBXu8E1gZrjDqcPQMP8VvF/x5FEllODWMZ9++K0vSOPeUycdxriny8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OS06Afeu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7FC2C3277B;
	Tue, 28 May 2024 12:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716898035;
	bh=3NJyYszoVob0gKmWcC7e1PIMLB9ijUxqeL+CkuTM8Is=;
	h=From:To:Cc:Subject:Date:From;
	b=OS06AfeuiQYmi20jHitAAePv2aK/lTfoN/GSzHbX7EfBoAqppzJRh8zh3P4woLSbe
	 jiGcCkFSpfktRvYQ/rn+7EdsFp7K8DYmVVicLXHnRNxvDo9urndoSL08BPG3gPBWYc
	 h1G5FVsJl3o2C15ZwYIrKv1dlYKKv1VNCR0hiOo2TbTFIFFGkkH7RFNXRpNdZoDT/f
	 ACLo1qkbEucRwXgPR3b4bDr4Bhb3Eijmo2A1OZd2upvcWoowCe0+inmsm2BsJVhnlt
	 ePRRTv3QFvYBwyOSzyIRmUv5BsR9Ji6zcK8NOn07uqYJJfynbva+neRCTp3ekaz/lQ
	 RubPMyU9+HRZg==
From: Arnd Bergmann <arnd@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Hans Hu <hanshu@zhaoxin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Wentong Wu <wentong.wu@intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] i2c: viai2c: turn common code into a proper module
Date: Tue, 28 May 2024 14:06:30 +0200
Message-Id: <20240528120710.3433792-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The i2c-viai2c-common.c file is used by two drivers, but is not a proper
abstraction and can get linked into both modules in the same configuration,
which results in a warning:

scripts/Makefile.build:236: drivers/i2c/busses/Makefile: i2c-viai2c-common.o is added to multiple modules: i2c-wmt i2c-zhaoxin

The other problems with this include the incorrect use of a __weak function
when both are built-in, and the fact that the "common" module is sprinked
with 'if (i2c->plat == ...)' checks that have knowledge about the differences
between the drivers using it.

Avoid the link time warning by making the common driver a proper module
with MODULE_LICENCE()/MODULE_AUTHOR() tags, and remove the __weak function
by slightly rearranging the code.

This adds a little more duplication between the two main drivers, but
those versions get more readable in the process.

Fixes: a06b80e83011 ("i2c: add zhaoxin i2c controller driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/i2c/busses/Makefile             |   6 +-
 drivers/i2c/busses/i2c-viai2c-common.c  |  71 ++-------------
 drivers/i2c/busses/i2c-viai2c-common.h  |   2 +-
 drivers/i2c/busses/i2c-viai2c-wmt.c     |  37 ++++++++
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c | 113 +++++++++++++++++++-----
 5 files changed, 140 insertions(+), 89 deletions(-)

diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 3d65934f5eb4..78d0561339e5 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -29,8 +29,7 @@ obj-$(CONFIG_I2C_SIS630)	+= i2c-sis630.o
 obj-$(CONFIG_I2C_SIS96X)	+= i2c-sis96x.o
 obj-$(CONFIG_I2C_VIA)		+= i2c-via.o
 obj-$(CONFIG_I2C_VIAPRO)	+= i2c-viapro.o
-i2c-zhaoxin-objs := i2c-viai2c-zhaoxin.o i2c-viai2c-common.o
-obj-$(CONFIG_I2C_ZHAOXIN)	+= i2c-zhaoxin.o
+obj-$(CONFIG_I2C_ZHAOXIN)	+= i2c-viai2c-zhaoxin.o i2c-viai2c-common.o
 
 # Mac SMBus host controller drivers
 obj-$(CONFIG_I2C_HYDRA)		+= i2c-hydra.o
@@ -120,8 +119,7 @@ obj-$(CONFIG_I2C_TEGRA_BPMP)	+= i2c-tegra-bpmp.o
 obj-$(CONFIG_I2C_UNIPHIER)	+= i2c-uniphier.o
 obj-$(CONFIG_I2C_UNIPHIER_F)	+= i2c-uniphier-f.o
 obj-$(CONFIG_I2C_VERSATILE)	+= i2c-versatile.o
-i2c-wmt-objs := i2c-viai2c-wmt.o i2c-viai2c-common.o
-obj-$(CONFIG_I2C_WMT)		+= i2c-wmt.o
+obj-$(CONFIG_I2C_WMT)		+= i2c-viai2c-wmt.o i2c-viai2c-common.o
 i2c-octeon-objs := i2c-octeon-core.o i2c-octeon-platdrv.o
 obj-$(CONFIG_I2C_OCTEON)	+= i2c-octeon.o
 i2c-thunderx-objs := i2c-octeon-core.o i2c-thunderx-pcidrv.o
diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index 1844d13f1f79..162b31306cba 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.c
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -17,6 +17,7 @@ int viai2c_wait_bus_not_busy(struct viai2c *i2c)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(viai2c_wait_bus_not_busy);
 
 static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, int last)
 {
@@ -121,6 +122,7 @@ int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	return (ret < 0) ? ret : i;
 }
+EXPORT_SYMBOL_GPL(viai2c_xfer);
 
 /*
  * Main process of the byte mode xfer
@@ -130,7 +132,7 @@ int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
  *  0: there is still data that needs to be transferred
  *  -EIO: error occurred
  */
-static int viai2c_irq_xfer(struct viai2c *i2c)
+int viai2c_irq_xfer(struct viai2c *i2c)
 {
 	u16 val;
 	struct i2c_msg *msg = i2c->msg;
@@ -171,51 +173,11 @@ static int viai2c_irq_xfer(struct viai2c *i2c)
 
 	return i2c->xfered_len == msg->len;
 }
-
-int __weak viai2c_fifo_irq_xfer(struct viai2c *i2c, bool irq)
-{
-	return 0;
-}
-
-static irqreturn_t viai2c_isr(int irq, void *data)
-{
-	struct viai2c *i2c = data;
-	u8 status;
-
-	/* save the status and write-clear it */
-	status = readw(i2c->base + VIAI2C_REG_ISR);
-	if (!status && i2c->platform == VIAI2C_PLAT_ZHAOXIN)
-		return IRQ_NONE;
-
-	writew(status, i2c->base + VIAI2C_REG_ISR);
-
-	i2c->ret = 0;
-	if (status & VIAI2C_ISR_NACK_ADDR)
-		i2c->ret = -EIO;
-
-	if (i2c->platform == VIAI2C_PLAT_WMT && (status & VIAI2C_ISR_SCL_TIMEOUT))
-		i2c->ret = -ETIMEDOUT;
-
-	if (!i2c->ret) {
-		if (i2c->mode == VIAI2C_BYTE_MODE)
-			i2c->ret = viai2c_irq_xfer(i2c);
-		else
-			i2c->ret = viai2c_fifo_irq_xfer(i2c, true);
-	}
-
-	/* All the data has been successfully transferred or error occurred */
-	if (i2c->ret)
-		complete(&i2c->complete);
-
-	return IRQ_HANDLED;
-}
+EXPORT_SYMBOL_GPL(viai2c_irq_xfer);
 
 int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c, int plat)
 {
-	int err;
-	int irq_flags;
 	struct viai2c *i2c;
-	struct device_node *np = pdev->dev.of_node;
 
 	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
@@ -225,28 +187,8 @@ int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c, int plat)
 	if (IS_ERR(i2c->base))
 		return PTR_ERR(i2c->base);
 
-	if (plat == VIAI2C_PLAT_WMT) {
-		irq_flags = 0;
-		i2c->irq = irq_of_parse_and_map(np, 0);
-		if (!i2c->irq)
-			return -EINVAL;
-	} else if (plat == VIAI2C_PLAT_ZHAOXIN) {
-		irq_flags = IRQF_SHARED;
-		i2c->irq = platform_get_irq(pdev, 0);
-		if (i2c->irq < 0)
-			return i2c->irq;
-	} else {
-		return dev_err_probe(&pdev->dev, -EINVAL, "wrong platform type\n");
-	}
-
 	i2c->platform = plat;
 
-	err = devm_request_irq(&pdev->dev, i2c->irq, viai2c_isr,
-			       irq_flags, pdev->name, i2c);
-	if (err)
-		return dev_err_probe(&pdev->dev, err,
-				"failed to request irq %i\n", i2c->irq);
-
 	i2c->dev = &pdev->dev;
 	init_completion(&i2c->complete);
 	platform_set_drvdata(pdev, i2c);
@@ -254,3 +196,8 @@ int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c, int plat)
 	*pi2c = i2c;
 	return 0;
 }
+EXPORT_SYMBOL_GPL(viai2c_init);
+
+MODULE_DESCRIPTION("Via/Wondermedia/Zhaoxin I2C master-mode bus adapter");
+MODULE_AUTHOR("Tony Prisk <linux@prisktech.co.nz>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
index 81e827c54434..00f17733223c 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.h
+++ b/drivers/i2c/busses/i2c-viai2c-common.h
@@ -80,6 +80,6 @@ struct viai2c {
 int viai2c_wait_bus_not_busy(struct viai2c *i2c);
 int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
 int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c, int plat);
-int viai2c_fifo_irq_xfer(struct viai2c *i2c, bool irq);
+int viai2c_irq_xfer(struct viai2c *i2c);
 
 #endif
diff --git a/drivers/i2c/busses/i2c-viai2c-wmt.c b/drivers/i2c/busses/i2c-viai2c-wmt.c
index e1988f946026..b3ab9633015a 100644
--- a/drivers/i2c/busses/i2c-viai2c-wmt.c
+++ b/drivers/i2c/busses/i2c-viai2c-wmt.c
@@ -72,6 +72,33 @@ static int wmt_i2c_reset_hardware(struct viai2c *i2c)
 	return 0;
 }
 
+static irqreturn_t wmt_i2c_isr(int irq, void *data)
+{
+	struct viai2c *i2c = data;
+	u8 status;
+
+	/* save the status and write-clear it */
+	status = readw(i2c->base + VIAI2C_REG_ISR);
+	writew(status, i2c->base + VIAI2C_REG_ISR);
+
+	i2c->ret = 0;
+	if (status & VIAI2C_ISR_NACK_ADDR)
+		i2c->ret = -EIO;
+
+	if (status & VIAI2C_ISR_SCL_TIMEOUT)
+		i2c->ret = -ETIMEDOUT;
+
+	if (!i2c->ret)
+		i2c->ret = viai2c_irq_xfer(i2c);
+
+	/* All the data has been successfully transferred or error occurred */
+	if (i2c->ret)
+		complete(&i2c->complete);
+
+	return IRQ_HANDLED;
+}
+
+
 static int wmt_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -84,6 +111,16 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	i2c->irq = platform_get_irq(pdev, 0);
+	if (i2c->irq < 0)
+		return i2c->irq;
+
+	err = devm_request_irq(&pdev->dev, i2c->irq, wmt_i2c_isr,
+			       0, pdev->name, i2c);
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				"failed to request irq %i\n", i2c->irq);
+
 	i2c->clk = of_clk_get(np, 0);
 	if (IS_ERR(i2c->clk)) {
 		dev_err(&pdev->dev, "unable to request clock\n");
diff --git a/drivers/i2c/busses/i2c-viai2c-zhaoxin.c b/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
index 7e3ac2a3e1fd..dbcb904c74f0 100644
--- a/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
+++ b/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
@@ -49,8 +49,7 @@ struct viai2c_zhaoxin {
 	u16			xfer_len;
 };
 
-/* 'irq == true' means in interrupt context */
-int viai2c_fifo_irq_xfer(struct viai2c *i2c, bool irq)
+static int viai2c_fifo_xfer(struct viai2c *i2c)
 {
 	u16 i;
 	u8 tmp;
@@ -59,17 +58,6 @@ int viai2c_fifo_irq_xfer(struct viai2c *i2c, bool irq)
 	bool read = !!(msg->flags & I2C_M_RD);
 	struct viai2c_zhaoxin *priv = i2c->pltfm_priv;
 
-	if (irq) {
-		/* get the received data */
-		if (read)
-			for (i = 0; i < priv->xfer_len; i++)
-				msg->buf[i2c->xfered_len + i] = ioread8(base + ZXI2C_REG_HRDR);
-
-		i2c->xfered_len += priv->xfer_len;
-		if (i2c->xfered_len == msg->len)
-			return 1;
-	}
-
 	/* reset fifo buffer */
 	tmp = ioread8(base + ZXI2C_REG_HCR);
 	iowrite8(tmp | ZXI2C_HCR_RST_FIFO, base + ZXI2C_REG_HCR);
@@ -92,18 +80,59 @@ int viai2c_fifo_irq_xfer(struct viai2c *i2c, bool irq)
 		iowrite8(tmp, base + VIAI2C_REG_CR);
 	}
 
-	if (irq) {
-		/* continue transmission */
-		tmp = ioread8(base + VIAI2C_REG_CR);
-		iowrite8(tmp |= VIAI2C_CR_CPU_RDY, base + VIAI2C_REG_CR);
+	u16 tcr_val = i2c->tcr;
+
+	/* start transmission */
+	tcr_val |= read ? VIAI2C_TCR_READ : 0;
+	writew(tcr_val | msg->addr, base + VIAI2C_REG_TCR);
+
+	return 0;
+}
+
+static int viai2c_fifo_irq_xfer(struct viai2c *i2c)
+{
+	u16 i;
+	u8 tmp;
+	struct i2c_msg *msg = i2c->msg;
+	void __iomem *base = i2c->base;
+	bool read = !!(msg->flags & I2C_M_RD);
+	struct viai2c_zhaoxin *priv = i2c->pltfm_priv;
+
+	/* get the received data */
+	if (read)
+		for (i = 0; i < priv->xfer_len; i++)
+			msg->buf[i2c->xfered_len + i] = ioread8(base + ZXI2C_REG_HRDR);
+
+	i2c->xfered_len += priv->xfer_len;
+	if (i2c->xfered_len == msg->len)
+		return 1;
+
+	/* reset fifo buffer */
+	tmp = ioread8(base + ZXI2C_REG_HCR);
+	iowrite8(tmp | ZXI2C_HCR_RST_FIFO, base + ZXI2C_REG_HCR);
+
+	/* set xfer len */
+	priv->xfer_len = min_t(u16, msg->len - i2c->xfered_len, ZXI2C_FIFO_SIZE);
+	if (read) {
+		iowrite8(priv->xfer_len - 1, base + ZXI2C_REG_HRLR);
 	} else {
-		u16 tcr_val = i2c->tcr;
+		iowrite8(priv->xfer_len - 1, base + ZXI2C_REG_HTLR);
+		/* set write data */
+		for (i = 0; i < priv->xfer_len; i++)
+			iowrite8(msg->buf[i2c->xfered_len + i], base + ZXI2C_REG_HTDR);
+	}
 
-		/* start transmission */
-		tcr_val |= read ? VIAI2C_TCR_READ : 0;
-		writew(tcr_val | msg->addr, base + VIAI2C_REG_TCR);
+	/* prepare to stop transmission */
+	if (priv->hrv && msg->len == (i2c->xfered_len + priv->xfer_len)) {
+		tmp = ioread8(base + VIAI2C_REG_CR);
+		tmp |= read ? VIAI2C_CR_RX_END : VIAI2C_CR_TX_END;
+		iowrite8(tmp, base + VIAI2C_REG_CR);
 	}
 
+	/* continue transmission */
+	tmp = ioread8(base + VIAI2C_REG_CR);
+	iowrite8(tmp |= VIAI2C_CR_CPU_RDY, base + VIAI2C_REG_CR);
+
 	return 0;
 }
 
@@ -135,7 +164,7 @@ static int zxi2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int
 		priv->xfer_len = 0;
 		i2c->xfered_len = 0;
 
-		viai2c_fifo_irq_xfer(i2c, 0);
+		viai2c_fifo_xfer(i2c);
 
 		if (!wait_for_completion_timeout(&i2c->complete, VIAI2C_TIMEOUT))
 			return -ETIMEDOUT;
@@ -228,6 +257,36 @@ static void zxi2c_get_bus_speed(struct viai2c *i2c)
 	dev_info(i2c->dev, "speed mode is %s\n", i2c_freq_mode_string(params[0]));
 }
 
+static irqreturn_t zxi2c_isr(int irq, void *data)
+{
+	struct viai2c *i2c = data;
+	u8 status;
+
+	/* save the status and write-clear it */
+	status = readw(i2c->base + VIAI2C_REG_ISR);
+	if (!status)
+		return IRQ_NONE;
+
+	writew(status, i2c->base + VIAI2C_REG_ISR);
+
+	i2c->ret = 0;
+	if (status & VIAI2C_ISR_NACK_ADDR)
+		i2c->ret = -EIO;
+
+	if (!i2c->ret) {
+		if (i2c->mode == VIAI2C_BYTE_MODE)
+			i2c->ret = viai2c_irq_xfer(i2c);
+		else
+			i2c->ret = viai2c_fifo_irq_xfer(i2c);
+	}
+
+	/* All the data has been successfully transferred or error occurred */
+	if (i2c->ret)
+		complete(&i2c->complete);
+
+	return IRQ_HANDLED;
+}
+
 static int zxi2c_probe(struct platform_device *pdev)
 {
 	int error;
@@ -239,6 +298,16 @@ static int zxi2c_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	i2c->irq = platform_get_irq(pdev, 0);
+	if (i2c->irq < 0)
+		return i2c->irq;
+
+	error = devm_request_irq(&pdev->dev, i2c->irq, zxi2c_isr,
+			       IRQF_SHARED, pdev->name, i2c);
+	if (error)
+		return dev_err_probe(&pdev->dev, error,
+				"failed to request irq %i\n", i2c->irq);
+
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
-- 
2.39.2


