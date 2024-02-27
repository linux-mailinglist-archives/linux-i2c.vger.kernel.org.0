Return-Path: <linux-i2c+bounces-2025-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4FF868984
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 08:06:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6179E2852BD
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 07:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D8753E00;
	Tue, 27 Feb 2024 07:06:20 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDE252F9F
	for <linux-i2c@vger.kernel.org>; Tue, 27 Feb 2024 07:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.0.225.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709017579; cv=none; b=Kj4rBh8isWuQBE5uZOD07Ykgj/GjRhEv/e/2oa2FG9zj0qTkJK/O0AX5kGoVEO/CZukRBM91ubHEhQSsroLzp62d4wb3FUxBqqdfsNQkx3Vy8wRUiGdLpuOA4LT/I/Wycr+JcYwOvvbO3Z63LhCrgcfw4B08CsEol2ZUboXBzS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709017579; c=relaxed/simple;
	bh=n1KNap9Dp3rpaKPYDTNWrNKg67Y0enUCa3aEKjAdnqY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YB+ap4yzPhtudSgrcI4tfAlOQ4kZ7t1xx0zM1BvayxqC9H4G80WomlnpLv2biEwPERENfWNaJAMCBTSmIHlsGzQLrmLR92bsG3hZ/8XZB8pbjMUdkspd2Ph9pv6AJSHhoDW6YVU0eeVoUEIu1dRk66SkYIX0BiFCxWLAct7f76I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=210.0.225.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1709015810-552483-4719-4-1
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx1.zhaoxin.com with ESMTP id eYvHgC70akRGYOFV (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Tue, 27 Feb 2024 14:36:50 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 27 Feb
 2024 14:36:48 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Feb 2024 14:36:44 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <wsa@kernel.org>, <cobechen@zhaoxin.com>, <hanshu@zhaoxin.com>
Subject: [PATCH v8 4/6] i2c: wmt: fix a bug when thread blocked
Date: Tue, 27 Feb 2024 14:36:31 +0800
X-ASG-Orig-Subj: [PATCH v8 4/6] i2c: wmt: fix a bug when thread blocked
Message-ID: <56b8a4c309944a85dd1068bb6d54fe40d26c2b3f.1709014237.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
References: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
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
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1709015810
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 6444
X-Barracuda-BRTS-Status: 0

During each byte access, the host performs clock stretching.

To reduce the host performs clock stretching, move most of
the per-msg processing to the interrupt context.

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

---
 drivers/i2c/busses/i2c-viai2c-common.c | 139 ++++++++++++-------------
 drivers/i2c/busses/i2c-viai2c-common.h |   6 +-
 2 files changed, 73 insertions(+), 72 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index 3e565d5ee4c7..30405205ba3a 100644
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


