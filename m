Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF83C39534A
	for <lists+linux-i2c@lfdr.de>; Mon, 31 May 2021 00:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhE3W6t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 May 2021 18:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhE3W6t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 May 2021 18:58:49 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C812C061574
        for <linux-i2c@vger.kernel.org>; Sun, 30 May 2021 15:57:08 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 257348364F;
        Mon, 31 May 2021 10:57:03 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1622415423;
        bh=r1PeCdtDfQf/3d2GiJhstp2bICjzI0nnfAcIwqjbXZ4=;
        h=From:To:Cc:Subject:Date;
        b=lOXuLy/60scgTUC2Bu9b4Mb4n4eas1m020Az7oK+E8nZ4IzvYSFnShj8cEkRmMNen
         dCvIJZfAA3vjwOoekMBbVzQbjz1qeLYBvWQKaZo+/LleN6KZDLsoW9sJ+48xQhsTqu
         uPMn40ebp9NNg2/G2jyk8VMADGlhrSlm2gyYy/JpM6q0mhKGBjl043pYBBWgLZquLX
         jfTIDmxKDg+aAKD3NfVeWMTt2zDbeEcOffXCyDNgIVFVN9YPh7HR4h/ZF0wYn6ltF8
         vtpMeT+3RJevKtKv9qxIS/N1c8f0alA0/xFVxW1avejPR4sd5SPYlJW/fWHwGN3p71
         hv5nVHGDwcJxA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60b4183f0000>; Mon, 31 May 2021 10:57:03 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id 04F3413EEA1;
        Mon, 31 May 2021 10:57:03 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id F2E75283A4E; Mon, 31 May 2021 10:57:02 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wsa@kernel.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Richard Laing <richard.laing@alliedtelesis.co.nz>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] i2c: bcm-iproc: Add i2c recovery support
Date:   Mon, 31 May 2021 10:56:59 +1200
Message-Id: <20210530225659.17138-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=WOcBoUkR c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=5FLXtPjwQuUA:10 a=Jg9UQ0_FWdfR-ABCIGgA:9
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

Notes:
    Richard did most of the work on this. I'm just cleaning it up to get =
it
    upstream.

 drivers/i2c/busses/i2c-bcm-iproc.c | 115 +++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-=
bcm-iproc.c
index cceaf69279a9..d63a286c1660 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -26,6 +26,7 @@
 #define CFG_RESET_SHIFT              31
 #define CFG_EN_SHIFT                 30
 #define CFG_SLAVE_ADDR_0_SHIFT       28
+#define CFG_BIT_BANG_SHIFT           29
 #define CFG_M_RETRY_CNT_SHIFT        16
 #define CFG_M_RETRY_CNT_MASK         0x0f
=20
@@ -66,6 +67,12 @@
 #define S_FIFO_RX_THLD_SHIFT         8
 #define S_FIFO_RX_THLD_MASK          0x3f
=20
+#define M_BB_CTRL_OFFSET             0x14
+#define M_BB_SMBCLK_IN               31
+#define M_BB_SMBCLK_OUT_EN           30
+#define M_BB_SMBDAT_IN               29
+#define M_BB_SMBDAT_OUT_EN           28
+
 #define M_CMD_OFFSET                 0x30
 #define M_CMD_START_BUSY_SHIFT       31
 #define M_CMD_STATUS_SHIFT           25
@@ -713,6 +720,112 @@ static void bcm_iproc_i2c_enable_disable(struct bcm=
_iproc_i2c_dev *iproc_i2c,
 	iproc_i2c_wr_reg(iproc_i2c, CFG_OFFSET, val);
 }
=20
+static void bcm_iproc_i2c_reset(struct bcm_iproc_i2c_dev *iproc_i2c)
+{
+	u32 tmp;
+
+	tmp =3D readl(iproc_i2c->base + CFG_OFFSET);
+	tmp |=3D BIT(CFG_RESET_SHIFT);
+	writel(tmp, iproc_i2c->base + CFG_OFFSET);
+	udelay(100);
+
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
+	bcm_iproc_i2c_reset(iproc_i2c);
+
+	/* Switch to bit-bang mode */
+	tmp =3D readl(iproc_i2c->base + CFG_OFFSET);
+	tmp |=3D BIT(CFG_BIT_BANG_SHIFT);
+	writel(tmp, iproc_i2c->base + CFG_OFFSET);
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
+	udelay(100);
+
+	bcm_iproc_i2c_init(iproc_i2c);
+	bcm_iproc_i2c_enable_disable(iproc_i2c, true);
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
+	return !!(tmp & BIT(M_BB_SMBCLK_IN));
+}
+
+static void bcm_iproc_i2c_set_scl(struct i2c_adapter *adap, int val)
+{
+	struct bcm_iproc_i2c_dev *iproc_i2c =3D i2c_get_adapdata(adap);
+	u32 tmp;
+
+	tmp =3D readl(iproc_i2c->base + M_BB_CTRL_OFFSET);
+	if (val)
+		tmp |=3D BIT(M_BB_SMBCLK_OUT_EN);
+	else
+		tmp &=3D ~BIT(M_BB_SMBCLK_OUT_EN);
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
+		tmp |=3D BIT(M_BB_SMBDAT_OUT_EN);
+	else
+		tmp &=3D ~BIT(M_BB_SMBDAT_OUT_EN);
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
+	return !!(tmp & BIT(M_BB_SMBDAT_IN));
+}
+
+static struct i2c_bus_recovery_info bcm_iproc_recovery_info =3D {
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
@@ -839,6 +952,7 @@ static int bcm_iproc_i2c_xfer_internal(struct bcm_ipr=
oc_i2c_dev *iproc_i2c,
 	if (!!(iproc_i2c_rd_reg(iproc_i2c,
 				M_CMD_OFFSET) & BIT(M_CMD_START_BUSY_SHIFT))) {
 		dev_warn(iproc_i2c->device, "bus is busy\n");
+		i2c_recover_bus(&iproc_i2c->adapter);
 		return -EBUSY;
 	}
=20
@@ -1111,6 +1225,7 @@ static int bcm_iproc_i2c_probe(struct platform_devi=
ce *pdev)
 		of_node_full_name(iproc_i2c->device->of_node));
 	adap->algo =3D &bcm_iproc_algo;
 	adap->quirks =3D &bcm_iproc_i2c_quirks;
+	adap->bus_recovery_info =3D &bcm_iproc_recovery_info;
 	adap->dev.parent =3D &pdev->dev;
 	adap->dev.of_node =3D pdev->dev.of_node;
=20
--=20
2.31.1

