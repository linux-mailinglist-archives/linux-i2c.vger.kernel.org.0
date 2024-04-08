Return-Path: <linux-i2c+bounces-2813-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 498BC89B62C
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 04:55:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD00D1F217D4
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 02:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFFCB662;
	Mon,  8 Apr 2024 02:55:05 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791BF8475
	for <linux-i2c@vger.kernel.org>; Mon,  8 Apr 2024 02:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.0.225.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712544905; cv=none; b=qwcaIhZYx3OPVAcTRXxPKlwB3j+8Rrx15jjwB0yNiqFLK7e6wk2lBBnixlC9YLOQhf0liSMBNvptDPDvRarHVUmfldcitL8DoaZ9pAReTBKMBo6II450Njx+dZZjwsf/Fe4qq/cZeeHQa7Iqr5IUkb88clY8tOl3RSGwarI2ZF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712544905; c=relaxed/simple;
	bh=M0A3T1qoqeDPx/w1hoUzXltwdzXzSGacJMLU90MA7Yc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HFqLbT42+rAyn8jqxTCofljo+0Zi9dOl2vfhrzusmTPaMbOm9qHErUXn9E0Fr0nISFmYLZ0chQtbTqSNZtOKvrRJwoBmAB4lVSEWczoYV0I59NqmefC/6BbZo5sgE38rIguwaqQXLlEJepJkt59oadKj4hE/mnMJwiJasj0f3Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=210.0.225.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1712544891-086e23661934350003-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx1.zhaoxin.com with ESMTP id WuAjz247YrgJ1ST5 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Mon, 08 Apr 2024 10:54:52 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 8 Apr
 2024 10:54:52 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 8 Apr 2024 10:54:51 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <wsa@kernel.org>, <cobechen@zhaoxin.com>, <hanshu@zhaoxin.com>, "Wolfram
 Sang" <wsa+renesas@sang-engineering.com>
Subject: [PATCH v10 4/6] i2c: wmt: fix a bug when thread blocked
Date: Mon, 8 Apr 2024 10:54:46 +0800
X-ASG-Orig-Subj: [PATCH v10 4/6] i2c: wmt: fix a bug when thread blocked
Message-ID: <4c1cf04bd240008df4ee98fe503aca157ff4fcb1.1712479417.git.hanshu-oc@zhaoxin.com>
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
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1712544892
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 6896
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.123213
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

During each byte access, the host performs clock stretching.

To reduce the host performs clock stretching, move most of
the per-msg processing to the interrupt context.

Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-viai2c-common.c | 145 +++++++++++++------------
 drivers/i2c/busses/i2c-viai2c-common.h |   6 +-
 2 files changed, 80 insertions(+), 71 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index 59901c53ad48..1b39cf4f0d6c 100644
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
@@ -73,42 +54,15 @@ static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, int last)
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
-			writew(VIAI2C_CR_CPU_RDY | VIAI2C_CR_ENABLE, i2c->base + VIAI2C_REG_CR);
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
@@ -133,21 +87,10 @@ static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
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
@@ -165,6 +108,9 @@ int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 				return ret;
 		}
 
+		i2c->msg = pmsg;
+		i2c->xfered_len = 0;
+
 		if (pmsg->flags & I2C_M_RD)
 			ret = viai2c_read(i2c, pmsg);
 		else
@@ -174,15 +120,76 @@ int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	return (ret < 0) ? ret : i;
 }
 
+/*
+ * Main process of the byte mode xfer
+ *
+ * Return value indicates whether the transfer is complete
+ *  1: all the data has been successfully transferred
+ *  0: there is still data that needs to be transferred
+ *  -EIO: error occurred
+ */
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
+		val = readw(base + VIAI2C_REG_CSR);
+		if (val & VIAI2C_CSR_RCV_NOT_ACK)
+			return -EIO;
+
+		/* I2C_SMBUS_QUICK */
+		if (msg->len == 0) {
+			val = VIAI2C_CR_TX_END | VIAI2C_CR_CPU_RDY | VIAI2C_CR_ENABLE;
+			writew(val, base + VIAI2C_REG_CR);
+			return 1;
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
+	/* All the data has been successfully transferred or error occurred */
+	if (i2c->ret)
+		complete(&i2c->complete);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
index 28799e7e97f0..c92e054ac7e7 100644
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
2.34.1


