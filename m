Return-Path: <linux-i2c+bounces-2237-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 416C58741F0
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 22:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 669AAB21C4A
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 21:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4109B1B286;
	Wed,  6 Mar 2024 21:25:47 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 2.mo550.mail-out.ovh.net (2.mo550.mail-out.ovh.net [178.32.119.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CF51AAD0
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 21:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.32.119.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709760347; cv=none; b=gwE4Tzcan8lsvSWS3k3duzW5BcVFl30GwwkLcGotDtxeU/fUUn+hM297DRVxsIiJ6mtu5xjZHgmyA4CyEaOPUH3u2lFpvS+RMRPTG2F6X6DFcpyOKm09923CowPMnAxzV2PCiE6fMAtk4vAEReIuXuAszMSy3gVK0xIY/OpBTkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709760347; c=relaxed/simple;
	bh=N4bjMymLOb6Yrre2TAwpscAUQ+afxkGrB1+Z+/zWx6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tG6ZsNRS11yn9AFvyFioAFOYePNQE9T4awLdMMxTie8H7yprC9B/fz61oI+Bav2524gUdDOIi+pv+FsDH8Fn5clump98MYhgh9MqBV7k6EJfN9qiFzQO/aXG/R2U7IpNrGRgUy2HhCHIH0cxaDD04wzARADLM6YfMw9afJ+Qvng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.32.119.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.176.70])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4TqlpZ5R1Sz1HmZ
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 21:25:42 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-l5cp9 (unknown [10.110.168.168])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 206841FDEF;
	Wed,  6 Mar 2024 21:25:41 +0000 (UTC)
Received: from etezian.org ([37.59.142.97])
	by ghost-submission-6684bf9d7b-l5cp9 with ESMTPSA
	id p3RZOFXf6GXdLwAA7QAJSA
	(envelope-from <andi@etezian.org>); Wed, 06 Mar 2024 21:25:41 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-97G002f5882272-5ef6-4535-afa9-a133dcf8b378,
                    62DEF991EB217AB86F953B10C2782167B22AFEEB) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>,
	linux-i2c@vger.kernel.org
Cc: wsa@kernel.org,
	cobechen@zhaoxin.com,
	hanshu@zhaoxin.com,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v9 4/6] i2c: wmt: fix a bug when thread blocked
Date: Wed,  6 Mar 2024 22:24:11 +0100
Message-ID: <20240306212413.1850236-5-andi.shyti@kernel.org>
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
X-Ovh-Tracer-Id: 16093050322633361991
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledriedugddugeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudevjeetgeetlefhteeuteehgeefhefhkedtvdelheethfehveekudelueeuveenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht

From: Hans Hu <hanshu-oc@zhaoxin.com>

During each byte access, the host performs clock stretching.

To reduce the host performs clock stretching, move most of
the per-msg processing to the interrupt context.

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-viai2c-common.c | 139 ++++++++++++-------------
 drivers/i2c/busses/i2c-viai2c-common.h |   6 +-
 2 files changed, 73 insertions(+), 72 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index 3e565d5ee4c7c..30405205ba3a0 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.c
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -18,37 +18,18 @@ int viai2c_wait_bus_not_busy(struct viai2c *i2c)
 	return 0;
 }
 
-int viai2c_check_status(struct viai2c *i2c)
-{
-	int ret = 0;
-	unsigned long time_left;
-
-	time_left = wait_for_completion_timeout(&i2c->complete,
-						msecs_to_jiffies(500));
-	if (!time_left)
-		return -ETIMEDOUT;
-
-	if (i2c->cmd_status & VIAI2C_ISR_NACK_ADDR)
-		ret = -EIO;
-
-	if (i2c->cmd_status & VIAI2C_ISR_SCL_TIMEOUT)
-		ret = -ETIMEDOUT;
-
-	return ret;
-}
-
 static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, int last)
 {
 	u16 val, tcr_val = i2c->tcr;
-	int ret;
-	int xfer_len = 0;
+
+	i2c->last = last;
 
 	if (pmsg->len == 0) {
 		/*
 		 * We still need to run through the while (..) once, so
 		 * start at -1 and break out early from the loop
 		 */
-		xfer_len = -1;
+		i2c->xfered_len = -1;
 		writew(0, i2c->base + VIAI2C_REG_CDR);
 	} else {
 		writew(pmsg->buf[0] & 0xFF, i2c->base + VIAI2C_REG_CDR);
@@ -73,43 +54,15 @@ static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, int last)
 		writew(val, i2c->base + VIAI2C_REG_CR);
 	}
 
-	while (xfer_len < pmsg->len) {
-		ret = viai2c_check_status(i2c);
-		if (ret)
-			return ret;
-
-		xfer_len++;
-
-		val = readw(i2c->base + VIAI2C_REG_CSR);
-		if (val & VIAI2C_CSR_RCV_NOT_ACK) {
-			dev_dbg(i2c->dev, "write RCV NACK error\n");
-			return -EIO;
-		}
-
-		if (pmsg->len == 0) {
-			val = VIAI2C_CR_TX_END | VIAI2C_CR_CPU_RDY | VIAI2C_CR_ENABLE;
-			writew(val, i2c->base + VIAI2C_REG_CR);
-			break;
-		}
-
-		if (xfer_len == pmsg->len) {
-			if (last != 1)
-				writew(VIAI2C_CR_ENABLE, i2c->base + VIAI2C_REG_CR);
-		} else {
-			writew(pmsg->buf[xfer_len] & 0xFF, i2c->base + VIAI2C_REG_CDR);
-			writew(VIAI2C_CR_CPU_RDY | VIAI2C_CR_ENABLE,
-					i2c->base + VIAI2C_REG_CR);
-		}
-	}
+	if (!wait_for_completion_timeout(&i2c->complete, VIAI2C_TIMEOUT))
+		return -ETIMEDOUT;
 
-	return 0;
+	return i2c->ret;
 }
 
 static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
 {
 	u16 val, tcr_val = i2c->tcr;
-	int ret;
-	u32 xfer_len = 0;
 
 	val = readw(i2c->base + VIAI2C_REG_CR);
 	val &= ~(VIAI2C_CR_TX_END | VIAI2C_CR_RX_END);
@@ -134,21 +87,10 @@ static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
 		writew(val, i2c->base + VIAI2C_REG_CR);
 	}
 
-	while (xfer_len < pmsg->len) {
-		ret = viai2c_check_status(i2c);
-		if (ret)
-			return ret;
-
-		pmsg->buf[xfer_len] = readw(i2c->base + VIAI2C_REG_CDR) >> 8;
-		xfer_len++;
-
-		val = readw(i2c->base + VIAI2C_REG_CR) | VIAI2C_CR_CPU_RDY;
-		if (xfer_len == pmsg->len - 1)
-			val |= VIAI2C_CR_RX_END;
-		writew(val, i2c->base + VIAI2C_REG_CR);
-	}
+	if (!wait_for_completion_timeout(&i2c->complete, VIAI2C_TIMEOUT))
+		return -ETIMEDOUT;
 
-	return 0;
+	return i2c->ret;
 }
 
 int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
@@ -166,6 +108,9 @@ int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 				return ret;
 		}
 
+		i2c->msg = pmsg;
+		i2c->xfered_len = 0;
+
 		if (pmsg->flags & I2C_M_RD)
 			ret = viai2c_read(i2c, pmsg);
 		else
@@ -175,15 +120,69 @@ int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	return (ret < 0) ? ret : i;
 }
 
+static int viai2c_irq_xfer(struct viai2c *i2c)
+{
+	u16 val;
+	struct i2c_msg *msg = i2c->msg;
+	u8 read = msg->flags & I2C_M_RD;
+	void __iomem *base = i2c->base;
+
+	if (read) {
+		msg->buf[i2c->xfered_len] = readw(base + VIAI2C_REG_CDR) >> 8;
+
+		val = readw(base + VIAI2C_REG_CR) | VIAI2C_CR_CPU_RDY;
+		if (i2c->xfered_len == msg->len - 2)
+			val |= VIAI2C_CR_RX_END;
+		writew(val, base + VIAI2C_REG_CR);
+	} else {
+
+		val = readw(base + VIAI2C_REG_CSR);
+		if (val & VIAI2C_CSR_RCV_NOT_ACK) {
+			dev_dbg_ratelimited(i2c->dev, "write RCV NACK error\n");
+			return -EIO;
+		}
+
+		if (msg->len == 0) {
+			val = VIAI2C_CR_TX_END | VIAI2C_CR_CPU_RDY | VIAI2C_CR_ENABLE;
+			writew(val, base + VIAI2C_REG_CR);
+			return 0;
+		}
+
+		if ((i2c->xfered_len + 1) == msg->len) {
+			if (!i2c->last)
+				writew(VIAI2C_CR_ENABLE, base + VIAI2C_REG_CR);
+		} else {
+			writew(msg->buf[i2c->xfered_len + 1] & 0xFF, base + VIAI2C_REG_CDR);
+			writew(VIAI2C_CR_CPU_RDY | VIAI2C_CR_ENABLE, base + VIAI2C_REG_CR);
+		}
+	}
+
+	i2c->xfered_len++;
+
+	return i2c->xfered_len == msg->len;
+}
+
 static irqreturn_t viai2c_isr(int irq, void *data)
 {
 	struct viai2c *i2c = data;
+	u8 status;
 
 	/* save the status and write-clear it */
-	i2c->cmd_status = readw(i2c->base + VIAI2C_REG_ISR);
-	writew(i2c->cmd_status, i2c->base + VIAI2C_REG_ISR);
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
 
-	complete(&i2c->complete);
+	if (i2c->ret)
+		complete(&i2c->complete);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
index 28799e7e97f0b..c92e054ac7e73 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.h
+++ b/drivers/i2c/busses/i2c-viai2c-common.h
@@ -58,11 +58,13 @@ struct viai2c {
 	struct clk		*clk;
 	u16			tcr;
 	int			irq;
-	u16			cmd_status;
+	u16			xfered_len;
+	struct i2c_msg		*msg;
+	int			ret;
+	bool			last;
 };
 
 int viai2c_wait_bus_not_busy(struct viai2c *i2c);
-int viai2c_check_status(struct viai2c *i2c);
 int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
 int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c);
 
-- 
2.43.0


