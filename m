Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF9F5397CDD
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jun 2021 01:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235119AbhFAXJP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Jun 2021 19:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235054AbhFAXJO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Jun 2021 19:09:14 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFE6C061574
        for <linux-i2c@vger.kernel.org>; Tue,  1 Jun 2021 16:07:32 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6DC57806B6;
        Wed,  2 Jun 2021 11:07:27 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1622588847;
        bh=BUgKP2p2ODpeDxoVvam1T3O5oapcOJTx8/j9VGvkgFQ=;
        h=From:To:Cc:Subject:Date;
        b=f/udgQEBDilPZwLAa5wRRp5lyyDhHfPh+qzb6xdVcFQndOSd52ff8D3b5QtRbdRSe
         GWFo4M1EvnmQPP+qtFHWKNEwU+6lIpTb5L7rNqYTLC7kDDReclqAn/zyHbe9KGMqKd
         k9Tkx+dQIWWWVwvtORwVtOiMyJIfQt/UwiSLTXrcicigsUN9h47fzXKK8WGGDe7dng
         gCaIHKM0EzJkRDgADGZI9Yk86sLWYZpgBeOYT5juTr5PokwwKtd8fHDQTWzAGbHKoY
         4nYFIHfxVcJD0qQRG7+S1g94BN/sawAnRV4VgluiXrjNd7Wmu2fAMuJy/J6QlGV34u
         H9InncjHaB35w==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60b6bdaf0000>; Wed, 02 Jun 2021 11:07:27 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id 3C33913EE13;
        Wed,  2 Jun 2021 11:07:27 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 367BA283A4B; Wed,  2 Jun 2021 11:07:27 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wsa@kernel.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Richard Laing <richard.laing@alliedtelesis.co.nz>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2] i2c: bcm-iproc: Add i2c recovery support
Date:   Wed,  2 Jun 2021 11:07:10 +1200
Message-Id: <20210601230710.6861-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=WOcBoUkR c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=r6YtysWOX24A:10 a=FTFZR8p3D3VaYLtSs7MA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Richard Laing <richard.laing@alliedtelesis.co.nz>

The bcm-iproc controller can put the SDA/SCL lines into bit-bang mode,
make use of this to support i2c bus recovery.

Signed-off-by: Richard Laing <richard.laing@alliedtelesis.co.nz>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Richard did most of the work on this. I'm just cleaning it up to get it
upstream.

Changes in v2:
- Incorporate feedback from Ray Jui
- Move bcm_iproc_i2c_resume so it can be re-used to return the i2c bus
  to normal operation at the correct speed after a recovery.
- Add iproc_i2c_lockup_recover() helper to only trigger recovery if sda
  is actually stuck
- Use usleep_range() instead of udelay()
- Cosmetic changes to register bit definitions

 drivers/i2c/busses/i2c-bcm-iproc.c | 176 +++++++++++++++++++++++++----
 1 file changed, 151 insertions(+), 25 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-=
bcm-iproc.c
index cceaf69279a9..417eb8d69d54 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -25,6 +25,7 @@
 #define CFG_OFFSET                   0x00
 #define CFG_RESET_SHIFT              31
 #define CFG_EN_SHIFT                 30
+#define CFG_BIT_BANG_SHIFT           29
 #define CFG_SLAVE_ADDR_0_SHIFT       28
 #define CFG_M_RETRY_CNT_SHIFT        16
 #define CFG_M_RETRY_CNT_MASK         0x0f
@@ -66,6 +67,12 @@
 #define S_FIFO_RX_THLD_SHIFT         8
 #define S_FIFO_RX_THLD_MASK          0x3f
=20
+#define M_BB_CTRL_OFFSET             0x14
+#define M_BB_SMBCLK_IN_SHIFT         31
+#define M_BB_SMBCLK_OUT_EN_SHIFT     30
+#define M_BB_SMBDAT_IN_SHIFT         29
+#define M_BB_SMBDAT_OUT_EN_SHIFT     28
+
 #define M_CMD_OFFSET                 0x30
 #define M_CMD_START_BUSY_SHIFT       31
 #define M_CMD_STATUS_SHIFT           25
@@ -713,6 +720,147 @@ static void bcm_iproc_i2c_enable_disable(struct bcm=
_iproc_i2c_dev *iproc_i2c,
 	iproc_i2c_wr_reg(iproc_i2c, CFG_OFFSET, val);
 }
=20
+static int bcm_iproc_i2c_resume(struct device *dev)
+{
+	struct bcm_iproc_i2c_dev *iproc_i2c =3D dev_get_drvdata(dev);
+	int ret;
+	u32 val;
+
+	/*
+	 * Power domain could have been shut off completely in system deep
+	 * sleep, so re-initialize the block here
+	 */
+	ret =3D bcm_iproc_i2c_init(iproc_i2c);
+	if (ret)
+		return ret;
+
+	/* configure to the desired bus speed */
+	val =3D iproc_i2c_rd_reg(iproc_i2c, TIM_CFG_OFFSET);
+	val &=3D ~BIT(TIM_CFG_MODE_400_SHIFT);
+	val |=3D (iproc_i2c->bus_speed =3D=3D I2C_MAX_FAST_MODE_FREQ) << TIM_CF=
G_MODE_400_SHIFT;
+	iproc_i2c_wr_reg(iproc_i2c, TIM_CFG_OFFSET, val);
+
+	bcm_iproc_i2c_enable_disable(iproc_i2c, true);
+
+	return 0;
+}
+
+static void bcm_iproc_i2c_prepare_recovery(struct i2c_adapter *adap)
+{
+	struct bcm_iproc_i2c_dev *iproc_i2c =3D i2c_get_adapdata(adap);
+	u32 tmp;
+
+	dev_dbg(iproc_i2c->device, "Prepare recovery\n");
+
+	/* Disable interrupts */
+	writel(0, iproc_i2c->base + IE_OFFSET);
+	readl(iproc_i2c->base + IE_OFFSET);
+	synchronize_irq(iproc_i2c->irq);
+
+	/* Place controller in reset */
+	tmp =3D readl(iproc_i2c->base + CFG_OFFSET);
+	tmp |=3D BIT(CFG_RESET_SHIFT);
+	writel(tmp, iproc_i2c->base + CFG_OFFSET);
+	usleep_range(100, 200);
+
+	/* Switch to bit-bang mode */
+	tmp =3D readl(iproc_i2c->base + CFG_OFFSET);
+	tmp |=3D BIT(CFG_BIT_BANG_SHIFT);
+	writel(tmp, iproc_i2c->base + CFG_OFFSET);
+	usleep_range(100, 200);
+}
+
+static void bcm_iproc_i2c_unprepare_recovery(struct i2c_adapter *adap)
+{
+	struct bcm_iproc_i2c_dev *iproc_i2c =3D i2c_get_adapdata(adap);
+	u32 tmp;
+
+	/* Switch to normal mode */
+	tmp =3D readl(iproc_i2c->base + CFG_OFFSET);
+	tmp &=3D ~BIT(CFG_BIT_BANG_SHIFT);
+	writel(tmp, iproc_i2c->base + CFG_OFFSET);
+	usleep_range(100, 200);
+
+	bcm_iproc_i2c_resume(iproc_i2c->device);
+
+	dev_dbg(iproc_i2c->device, "Recovery complete\n");
+}
+
+static int bcm_iproc_i2c_get_scl(struct i2c_adapter *adap)
+{
+	struct bcm_iproc_i2c_dev *iproc_i2c =3D i2c_get_adapdata(adap);
+	u32 tmp;
+
+	tmp =3D readl(iproc_i2c->base + M_BB_CTRL_OFFSET);
+
+	return !!(tmp & BIT(M_BB_SMBCLK_IN_SHIFT));
+}
+
+static void bcm_iproc_i2c_set_scl(struct i2c_adapter *adap, int val)
+{
+	struct bcm_iproc_i2c_dev *iproc_i2c =3D i2c_get_adapdata(adap);
+	u32 tmp;
+
+	tmp =3D readl(iproc_i2c->base + M_BB_CTRL_OFFSET);
+	if (val)
+		tmp |=3D BIT(M_BB_SMBCLK_OUT_EN_SHIFT);
+	else
+		tmp &=3D ~BIT(M_BB_SMBCLK_OUT_EN_SHIFT);
+
+	writel(tmp, iproc_i2c->base + M_BB_CTRL_OFFSET);
+}
+
+static void bcm_iproc_i2c_set_sda(struct i2c_adapter *adap, int val)
+{
+	struct bcm_iproc_i2c_dev *iproc_i2c =3D i2c_get_adapdata(adap);
+	u32 tmp;
+
+	tmp =3D readl(iproc_i2c->base + M_BB_CTRL_OFFSET);
+	if (val)
+		tmp |=3D BIT(M_BB_SMBDAT_OUT_EN_SHIFT);
+	else
+		tmp &=3D ~BIT(M_BB_SMBDAT_OUT_EN_SHIFT);
+
+	writel(tmp, iproc_i2c->base + M_BB_CTRL_OFFSET);
+}
+
+static int bcm_iproc_i2c_get_sda(struct i2c_adapter *adap)
+{
+	struct bcm_iproc_i2c_dev *iproc_i2c =3D i2c_get_adapdata(adap);
+	u32 tmp;
+
+	tmp =3D readl(iproc_i2c->base + M_BB_CTRL_OFFSET);
+
+	return !!(tmp & BIT(M_BB_SMBDAT_IN_SHIFT));
+}
+
+/* Check if bus lockup occurred, and invoke recovery if so. */
+static void iproc_i2c_lockup_recover(struct bcm_iproc_i2c_dev *iproc_i2c=
)
+{
+	/*
+	 * assume bus lockup if SDA line is low;
+	 * note that there is no need to switch to
+	 * bit-bang mode for this check.
+	 */
+	if (!bcm_iproc_i2c_get_sda(&iproc_i2c->adapter)) {
+		/* locked up - invoke i2c bus recovery. */
+		int ret =3D i2c_recover_bus(&iproc_i2c->adapter);
+
+		if (ret)
+			dev_err(iproc_i2c->device, "bus recovery: error %d\n", ret);
+	}
+}
+
+static const struct i2c_bus_recovery_info bcm_iproc_recovery_info =3D {
+	.recover_bus =3D i2c_generic_scl_recovery,
+	.prepare_recovery =3D bcm_iproc_i2c_prepare_recovery,
+	.unprepare_recovery =3D bcm_iproc_i2c_unprepare_recovery,
+	.set_scl =3D bcm_iproc_i2c_set_scl,
+	.get_scl =3D bcm_iproc_i2c_get_scl,
+	.set_sda =3D bcm_iproc_i2c_set_sda,
+	.get_sda =3D bcm_iproc_i2c_get_sda,
+};
+
 static int bcm_iproc_i2c_check_status(struct bcm_iproc_i2c_dev *iproc_i2=
c,
 				      struct i2c_msg *msg)
 {
@@ -806,6 +954,7 @@ static int bcm_iproc_i2c_xfer_wait(struct bcm_iproc_i=
2c_dev *iproc_i2c,
 		/* flush both TX/RX FIFOs */
 		val =3D BIT(M_FIFO_RX_FLUSH_SHIFT) | BIT(M_FIFO_TX_FLUSH_SHIFT);
 		iproc_i2c_wr_reg(iproc_i2c, M_FIFO_CTRL_OFFSET, val);
+		iproc_i2c_lockup_recover(iproc_i2c);
 		return -ETIMEDOUT;
 	}
=20
@@ -814,6 +963,7 @@ static int bcm_iproc_i2c_xfer_wait(struct bcm_iproc_i=
2c_dev *iproc_i2c,
 		/* flush both TX/RX FIFOs */
 		val =3D BIT(M_FIFO_RX_FLUSH_SHIFT) | BIT(M_FIFO_TX_FLUSH_SHIFT);
 		iproc_i2c_wr_reg(iproc_i2c, M_FIFO_CTRL_OFFSET, val);
+		iproc_i2c_lockup_recover(iproc_i2c);
 		return ret;
 	}
=20
@@ -1111,6 +1261,7 @@ static int bcm_iproc_i2c_probe(struct platform_devi=
ce *pdev)
 		of_node_full_name(iproc_i2c->device->of_node));
 	adap->algo =3D &bcm_iproc_algo;
 	adap->quirks =3D &bcm_iproc_i2c_quirks;
+	adap->bus_recovery_info =3D &bcm_iproc_recovery_info;
 	adap->dev.parent =3D &pdev->dev;
 	adap->dev.of_node =3D pdev->dev.of_node;
=20
@@ -1159,31 +1310,6 @@ static int bcm_iproc_i2c_suspend(struct device *de=
v)
 	return 0;
 }
=20
-static int bcm_iproc_i2c_resume(struct device *dev)
-{
-	struct bcm_iproc_i2c_dev *iproc_i2c =3D dev_get_drvdata(dev);
-	int ret;
-	u32 val;
-
-	/*
-	 * Power domain could have been shut off completely in system deep
-	 * sleep, so re-initialize the block here
-	 */
-	ret =3D bcm_iproc_i2c_init(iproc_i2c);
-	if (ret)
-		return ret;
-
-	/* configure to the desired bus speed */
-	val =3D iproc_i2c_rd_reg(iproc_i2c, TIM_CFG_OFFSET);
-	val &=3D ~BIT(TIM_CFG_MODE_400_SHIFT);
-	val |=3D (iproc_i2c->bus_speed =3D=3D I2C_MAX_FAST_MODE_FREQ) << TIM_CF=
G_MODE_400_SHIFT;
-	iproc_i2c_wr_reg(iproc_i2c, TIM_CFG_OFFSET, val);
-
-	bcm_iproc_i2c_enable_disable(iproc_i2c, true);
-
-	return 0;
-}
-
 static const struct dev_pm_ops bcm_iproc_i2c_pm_ops =3D {
 	.suspend_late =3D &bcm_iproc_i2c_suspend,
 	.resume_early =3D &bcm_iproc_i2c_resume
--=20
2.31.1

