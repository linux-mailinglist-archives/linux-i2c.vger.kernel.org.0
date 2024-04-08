Return-Path: <linux-i2c+bounces-2811-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D85589B62A
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 04:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A06331C20FCB
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 02:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40F38BFC;
	Mon,  8 Apr 2024 02:55:04 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA697847B
	for <linux-i2c@vger.kernel.org>; Mon,  8 Apr 2024 02:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.0.225.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712544904; cv=none; b=kEE6oAZn1Bn7S4/piXZYMv6A+5T/6qQhhvvZu959up4QbgHC6VDALmT3V+03gOa/7e7AcGJz1jdTHojSyF2fKPLveeZTjICzHSlGsYL5EvIxByhyggpZU1aWvvA1mtYx8z1h7JYeVOjaXuJqVcbtbdu4a1MAYK360lH2lp3DzrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712544904; c=relaxed/simple;
	bh=QBkP/YG4kdVt34iPTAjmFk33v/xqeHhCMaHoSi8i9TA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ULGX4wVZ50FTIUiDFfMWjxX4eD1+FahgqXUwPgyth64EVhOUyuu31tsQ+ND3aVCrOvR92Z+Mzb/0UKyaxHCsPlPSa6L4CmCsXse86yNWrMqEuQnfVoOLD0PDn1ECyIHmGbSjwFm69VvKt3Hu4Y+S7Tp748ah/7kLdllxSns3Xb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=210.0.225.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1712544893-086e23661834350001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx1.zhaoxin.com with ESMTP id iCTaZIIRnim1x9ah (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Mon, 08 Apr 2024 10:54:53 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 8 Apr
 2024 10:54:53 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 8 Apr 2024 10:54:52 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <wsa@kernel.org>, <cobechen@zhaoxin.com>, <hanshu@zhaoxin.com>, "Wolfram
 Sang" <wsa+renesas@sang-engineering.com>
Subject: [PATCH v10 5/6] i2c: wmt: add platform type VIAI2C_PLAT_WMT
Date: Mon, 8 Apr 2024 10:54:47 +0800
X-ASG-Orig-Subj: [PATCH v10 5/6] i2c: wmt: add platform type VIAI2C_PLAT_WMT
Message-ID: <7c8f75dc368be5eca1b368998d78b743487b8b89.1712479417.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712479417.git.hanshu-oc@zhaoxin.com>
References: <cover.1712479417.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1712544893
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 5565
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.123213
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Enumeration variables are added to differentiate
between different platforms.

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-viai2c-common.c | 32 ++++++++++++++++----------
 drivers/i2c/busses/i2c-viai2c-common.h |  7 +++++-
 drivers/i2c/busses/i2c-viai2c-wmt.c    |  2 +-
 3 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index 1b39cf4f0d6c..22a2e31e9c14 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.c
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -35,7 +35,7 @@ static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, int last)
 		writew(pmsg->buf[0] & 0xFF, i2c->base + VIAI2C_REG_CDR);
 	}
 
-	if (!(pmsg->flags & I2C_M_NOSTART)) {
+	if (i2c->platform == VIAI2C_PLAT_WMT && !(pmsg->flags & I2C_M_NOSTART)) {
 		val = readw(i2c->base + VIAI2C_REG_CR);
 		val &= ~VIAI2C_CR_TX_END;
 		val |= VIAI2C_CR_CPU_RDY;
@@ -48,7 +48,7 @@ static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, int last)
 
 	writew(tcr_val, i2c->base + VIAI2C_REG_TCR);
 
-	if (pmsg->flags & I2C_M_NOSTART) {
+	if (i2c->platform == VIAI2C_PLAT_WMT && pmsg->flags & I2C_M_NOSTART) {
 		val = readw(i2c->base + VIAI2C_REG_CR);
 		val |= VIAI2C_CR_CPU_RDY;
 		writew(val, i2c->base + VIAI2C_REG_CR);
@@ -67,7 +67,7 @@ static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
 	val = readw(i2c->base + VIAI2C_REG_CR);
 	val &= ~(VIAI2C_CR_TX_END | VIAI2C_CR_RX_END);
 
-	if (!(pmsg->flags & I2C_M_NOSTART))
+	if (i2c->platform == VIAI2C_PLAT_WMT && !(pmsg->flags & I2C_M_NOSTART))
 		val |= VIAI2C_CR_CPU_RDY;
 
 	if (pmsg->len == 1)
@@ -81,7 +81,7 @@ static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
 
 	writew(tcr_val, i2c->base + VIAI2C_REG_TCR);
 
-	if (pmsg->flags & I2C_M_NOSTART) {
+	if (i2c->platform == VIAI2C_PLAT_WMT && (pmsg->flags & I2C_M_NOSTART)) {
 		val = readw(i2c->base + VIAI2C_REG_CR);
 		val |= VIAI2C_CR_CPU_RDY;
 		writew(val, i2c->base + VIAI2C_REG_CR);
@@ -102,7 +102,7 @@ int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
-		if (!(pmsg->flags & I2C_M_NOSTART)) {
+		if (i2c->platform == VIAI2C_PLAT_WMT && !(pmsg->flags & I2C_M_NOSTART)) {
 			ret = viai2c_wait_bus_not_busy(i2c);
 			if (ret < 0)
 				return ret;
@@ -155,7 +155,7 @@ static int viai2c_irq_xfer(struct viai2c *i2c)
 		}
 
 		if ((i2c->xfered_len + 1) == msg->len) {
-			if (!i2c->last)
+			if (i2c->platform == VIAI2C_PLAT_WMT && !i2c->last)
 				writew(VIAI2C_CR_ENABLE, base + VIAI2C_REG_CR);
 		} else {
 			writew(msg->buf[i2c->xfered_len + 1] & 0xFF, base + VIAI2C_REG_CDR);
@@ -181,7 +181,7 @@ static irqreturn_t viai2c_isr(int irq, void *data)
 	if (status & VIAI2C_ISR_NACK_ADDR)
 		i2c->ret = -EIO;
 
-	if (status & VIAI2C_ISR_SCL_TIMEOUT)
+	if (i2c->platform == VIAI2C_PLAT_WMT && (status & VIAI2C_ISR_SCL_TIMEOUT))
 		i2c->ret = -ETIMEDOUT;
 
 	if (!i2c->ret)
@@ -194,9 +194,10 @@ static irqreturn_t viai2c_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c)
+int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c, int plat)
 {
 	int err;
+	int irq_flags;
 	struct viai2c *i2c;
 	struct device_node *np = pdev->dev.of_node;
 
@@ -208,12 +209,19 @@ int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c)
 	if (IS_ERR(i2c->base))
 		return PTR_ERR(i2c->base);
 
-	i2c->irq = irq_of_parse_and_map(np, 0);
-	if (!i2c->irq)
-		return -EINVAL;
+	if (plat == VIAI2C_PLAT_WMT) {
+		irq_flags = 0;
+		i2c->irq = irq_of_parse_and_map(np, 0);
+		if (!i2c->irq)
+			return -EINVAL;
+	} else {
+		return dev_err_probe(&pdev->dev, -EINVAL, "wrong platform type\n");
+	}
+
+	i2c->platform = plat;
 
 	err = devm_request_irq(&pdev->dev, i2c->irq, viai2c_isr,
-			       0, pdev->name, i2c);
+			       irq_flags, pdev->name, i2c);
 	if (err)
 		return dev_err_probe(&pdev->dev, err,
 				"failed to request irq %i\n", i2c->irq);
diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
index c92e054ac7e7..cfe5ab2bd779 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.h
+++ b/drivers/i2c/busses/i2c-viai2c-common.h
@@ -50,6 +50,10 @@
 
 #define VIAI2C_TIMEOUT		(msecs_to_jiffies(1000))
 
+enum {
+	VIAI2C_PLAT_WMT,
+};
+
 struct viai2c {
 	struct i2c_adapter	adapter;
 	struct completion	complete;
@@ -62,10 +66,11 @@ struct viai2c {
 	struct i2c_msg		*msg;
 	int			ret;
 	bool			last;
+	unsigned int		platform;
 };
 
 int viai2c_wait_bus_not_busy(struct viai2c *i2c);
 int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
-int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c);
+int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c, int plat);
 
 #endif
diff --git a/drivers/i2c/busses/i2c-viai2c-wmt.c b/drivers/i2c/busses/i2c-viai2c-wmt.c
index 1e9db735e1fa..e1988f946026 100644
--- a/drivers/i2c/busses/i2c-viai2c-wmt.c
+++ b/drivers/i2c/busses/i2c-viai2c-wmt.c
@@ -80,7 +80,7 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	int err;
 	u32 clk_rate;
 
-	err = viai2c_init(pdev, &i2c);
+	err = viai2c_init(pdev, &i2c, VIAI2C_PLAT_WMT);
 	if (err)
 		return err;
 
-- 
2.34.1


