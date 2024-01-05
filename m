Return-Path: <linux-i2c+bounces-1127-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 429BC824F5C
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 08:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6DE91F22824
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 07:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B2520DD0;
	Fri,  5 Jan 2024 07:52:07 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429A420DC9
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jan 2024 07:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1704441111-086e230f2811770004-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx1.zhaoxin.com with ESMTP id WDYZCygtCm7NBAhJ (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 05 Jan 2024 15:51:53 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Jan
 2024 15:51:52 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 5 Jan 2024 15:51:51 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <wsa@kernel.org>, <cobechen@zhaoxin.com>
Subject: [PATCH v7 5/6] i2c: wmt: add platform type VIAI2C_PLAT_WMT
Date: Fri, 5 Jan 2024 15:51:48 +0800
X-ASG-Orig-Subj: [PATCH v7 5/6] i2c: wmt: add platform type VIAI2C_PLAT_WMT
Message-ID: <37b0418dee4e92542f84eab927d5692884ac8d2b.1704440251.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
References: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
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
X-Barracuda-Start-Time: 1704441112
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 5331
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.119008
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Enumeration variables are added to differentiate
between different platforms.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-viai2c-common.c | 31 +++++++++++++++++---------
 drivers/i2c/busses/i2c-viai2c-common.h |  7 +++++-
 drivers/i2c/busses/i2c-viai2c-wmt.c    |  2 +-
 3 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index 0fd2554731ca..2bc34a574fab 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.c
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -79,7 +79,7 @@ static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, int last)
 		writew(pmsg->buf[0] & 0xFF, i2c->base + VIAI2C_REG_CDR);
 	}
 
-	if (!(pmsg->flags & I2C_M_NOSTART)) {
+	if (i2c->platform == VIAI2C_PLAT_WMT && !(pmsg->flags & I2C_M_NOSTART)) {
 		val = readw(i2c->base + VIAI2C_REG_CR);
 		val &= ~VIAI2C_CR_TX_END;
 		val |= VIAI2C_CR_CPU_RDY;
@@ -92,7 +92,7 @@ static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, int last)
 
 	writew(tcr_val, i2c->base + VIAI2C_REG_TCR);
 
-	if (pmsg->flags & I2C_M_NOSTART) {
+	if (i2c->platform == VIAI2C_PLAT_WMT && pmsg->flags & I2C_M_NOSTART) {
 		val = readw(i2c->base + VIAI2C_REG_CR);
 		val |= VIAI2C_CR_CPU_RDY;
 		writew(val, i2c->base + VIAI2C_REG_CR);
@@ -118,7 +118,7 @@ static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, int last)
 		}
 
 		if (xfer_len == pmsg->len) {
-			if (last != 1)
+			if (i2c->platform == VIAI2C_PLAT_WMT && !last)
 				writew(VIAI2C_CR_ENABLE, i2c->base + VIAI2C_REG_CR);
 		} else {
 			writew(pmsg->buf[xfer_len] & 0xFF, i2c->base + VIAI2C_REG_CDR);
@@ -139,7 +139,7 @@ static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
 	val = readw(i2c->base + VIAI2C_REG_CR);
 	val &= ~(VIAI2C_CR_TX_END | VIAI2C_CR_RX_END);
 
-	if (!(pmsg->flags & I2C_M_NOSTART))
+	if (i2c->platform == VIAI2C_PLAT_WMT && !(pmsg->flags & I2C_M_NOSTART))
 		val |= VIAI2C_CR_CPU_RDY;
 
 	if (pmsg->len == 1)
@@ -153,7 +153,7 @@ static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
 
 	writew(tcr_val, i2c->base + VIAI2C_REG_TCR);
 
-	if (pmsg->flags & I2C_M_NOSTART) {
+	if (i2c->platform == VIAI2C_PLAT_WMT && (pmsg->flags & I2C_M_NOSTART)) {
 		val = readw(i2c->base + VIAI2C_REG_CR);
 		val |= VIAI2C_CR_CPU_RDY;
 		writew(val, i2c->base + VIAI2C_REG_CR);
@@ -186,7 +186,8 @@ int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	i2c->t2 = i2c->t1 = ktime_get();
 	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
-		if (!(pmsg->flags & I2C_M_NOSTART)) {
+		if ((i2c->platform == VIAI2C_PLAT_WMT)
+		   && !(pmsg->flags & I2C_M_NOSTART)) {
 			ret = viai2c_wait_bus_not_busy(i2c);
 			if (ret < 0)
 				return ret;
@@ -214,9 +215,10 @@ static irqreturn_t viai2c_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c)
+int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c, int plat)
 {
 	int err;
+	int irq_flags;
 	struct viai2c *i2c;
 	struct device_node *np = pdev->dev.of_node;
 
@@ -228,12 +230,19 @@ int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c)
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
index d0ffba22104d..4da330d8cfea 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.h
+++ b/drivers/i2c/busses/i2c-viai2c-common.h
@@ -51,6 +51,10 @@
 #define VIAI2C_TIMEOUT		(msecs_to_jiffies(1000))
 #define VIAI2C_STRETCHING_TIMEOUT	200
 
+enum {
+	VIAI2C_PLAT_WMT = 1,
+};
+
 struct viai2c {
 	struct i2c_adapter	adapter;
 	struct completion	complete;
@@ -62,11 +66,12 @@ struct viai2c {
 	u16			cmd_status;
 	ktime_t			t1;
 	ktime_t			t2;
+	int			platform;
 };
 
 int viai2c_wait_bus_not_busy(struct viai2c *i2c);
 int viai2c_check_status(struct viai2c *i2c);
 int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
-int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c);
+int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c, int plat);
 
 #endif
diff --git a/drivers/i2c/busses/i2c-viai2c-wmt.c b/drivers/i2c/busses/i2c-viai2c-wmt.c
index 56602f248e1f..ba22fdc0f27c 100644
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


