Return-Path: <linux-i2c+bounces-2241-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B450A874231
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 22:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A4AB2821EE
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 21:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A46B1B7F7;
	Wed,  6 Mar 2024 21:50:38 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 5.mo560.mail-out.ovh.net (5.mo560.mail-out.ovh.net [87.98.181.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F251B968
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 21:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.181.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709761838; cv=none; b=jQoyFs7fwSH+7xbZiU95hDgPV104ER9ezmZ8fIeUwApqmdRTCrm0US6dUsT6yqEUC7hvNZ+lQu6ftvszwcTPHdwADt8gjoiZo3ecX020OWGOXCCZBEOWLtVA7TcqcgND8rRgw+f5l+nawnnCOP7mH4dT/TYe/n6ipBjar0DQAX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709761838; c=relaxed/simple;
	bh=vT1IEr1g8q+eh0OzQtyofkBQQbi9U9PpDm/EV/rm4I0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RL6KACm8cFXBfmreuVH3/gzha0V7HqzQeaZr+tozacuebNU7iY9Xry//zjM/NDGLbWtCKrHE1MKQkUWf4PUSGeYJJ8IhJPiMwAj/LzcSeKeeA5TSC8At5WqMm3NuabNA0aHegdEpD4kgBn2rKVzyrlpdQQAhz4up308Qg4prpnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=87.98.181.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.2.55])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4Tqlpd4mD7z1G1D
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 21:25:45 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-74c7m (unknown [10.110.96.108])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E30EE1FE99;
	Wed,  6 Mar 2024 21:25:43 +0000 (UTC)
Received: from etezian.org ([37.59.142.109])
	by ghost-submission-6684bf9d7b-74c7m with ESMTPSA
	id of61IVff6GV+DQAAvg/sBA
	(envelope-from <andi@etezian.org>); Wed, 06 Mar 2024 21:25:43 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S0036571fc3b-4779-4baf-81d5-95fce6c60466,
                    62DEF991EB217AB86F953B10C2782167B22AFEEB) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>,
	linux-i2c@vger.kernel.org
Cc: wsa@kernel.org,
	cobechen@zhaoxin.com,
	hanshu@zhaoxin.com,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v9 5/6] i2c: wmt: add platform type VIAI2C_PLAT_WMT
Date: Wed,  6 Mar 2024 22:24:12 +0100
Message-ID: <20240306212413.1850236-6-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240306212413.1850236-1-andi.shyti@kernel.org>
References: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
 <20240306212413.1850236-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16093894744656185927
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledriedugddugeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudevjeetgeetlefhteeuteehgeefhefhkedtvdelheethfehveekudelueeuveenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth

From: Hans Hu <hanshu-oc@zhaoxin.com>

Enumeration variables are added to differentiate
between different platforms.

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-viai2c-common.c | 33 ++++++++++++++++----------
 drivers/i2c/busses/i2c-viai2c-common.h |  7 +++++-
 drivers/i2c/busses/i2c-viai2c-wmt.c    |  2 +-
 3 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index 30405205ba3a0..75663a3e3fe57 100644
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
@@ -102,7 +102,8 @@ int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
-		if (!(pmsg->flags & I2C_M_NOSTART)) {
+		if ((i2c->platform == VIAI2C_PLAT_WMT)
+		   && !(pmsg->flags & I2C_M_NOSTART)) {
 			ret = viai2c_wait_bus_not_busy(i2c);
 			if (ret < 0)
 				return ret;
@@ -149,7 +150,7 @@ static int viai2c_irq_xfer(struct viai2c *i2c)
 		}
 
 		if ((i2c->xfered_len + 1) == msg->len) {
-			if (!i2c->last)
+			if (i2c->platform == VIAI2C_PLAT_WMT && !i2c->last)
 				writew(VIAI2C_CR_ENABLE, base + VIAI2C_REG_CR);
 		} else {
 			writew(msg->buf[i2c->xfered_len + 1] & 0xFF, base + VIAI2C_REG_CDR);
@@ -175,7 +176,7 @@ static irqreturn_t viai2c_isr(int irq, void *data)
 	if (status & VIAI2C_ISR_NACK_ADDR)
 		i2c->ret = -EIO;
 
-	if (status & VIAI2C_ISR_SCL_TIMEOUT)
+	if (i2c->platform == VIAI2C_PLAT_WMT && (status & VIAI2C_ISR_SCL_TIMEOUT))
 		i2c->ret = -ETIMEDOUT;
 
 	if (!i2c->ret)
@@ -187,9 +188,10 @@ static irqreturn_t viai2c_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c)
+int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c, int plat)
 {
 	int err;
+	int irq_flags;
 	struct viai2c *i2c;
 	struct device_node *np = pdev->dev.of_node;
 
@@ -201,12 +203,19 @@ int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c)
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
-					0, pdev->name, i2c);
+					irq_flags, pdev->name, i2c);
 	if (err)
 		return dev_err_probe(&pdev->dev, err,
 				"failed to request irq %i\n", i2c->irq);
diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
index c92e054ac7e73..cfe5ab2bd7792 100644
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
index 07fd954f1d008..aa6c34a78b1e4 100644
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
2.43.0


