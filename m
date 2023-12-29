Return-Path: <linux-i2c+bounces-1063-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EE581FD38
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 07:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E7BB1C20CE1
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 06:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C6C747E;
	Fri, 29 Dec 2023 06:30:53 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831C963D2
	for <linux-i2c@vger.kernel.org>; Fri, 29 Dec 2023 06:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1703831444-086e230f270a520001-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx1.zhaoxin.com with ESMTP id xpEEpsPitKrnGtL1 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 29 Dec 2023 14:30:44 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Dec
 2023 14:30:43 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 29 Dec 2023 14:30:42 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <andi.shyti@kernel.org>, <cobechen@zhaoxin.com>, <hanshu-oc@zhaoxin.com>
Subject: [PATCH v6 7/8] i2c: wmt: add platform type VIAI2C_PLAT_WMT
Date: Fri, 29 Dec 2023 14:30:38 +0800
X-ASG-Orig-Subj: [PATCH v6 7/8] i2c: wmt: add platform type VIAI2C_PLAT_WMT
Message-ID: <e4f9445f1fcbbf4736d420ea711b25f4a6b82dc6.1703830854.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
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
X-Barracuda-Start-Time: 1703831444
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 5306
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118704
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Enumeration variables are added to differentiate between different platforms.

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-viai2c-common.c | 34 ++++++++++++++++----------
 drivers/i2c/busses/i2c-viai2c-common.h |  7 +++++-
 drivers/i2c/busses/i2c-wmt-plt.c       |  2 +-
 3 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index e5eca10efedc..930f4c5c1797 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.c
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -78,8 +78,7 @@ static irqreturn_t viai2c_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg,
-			 int last)
+static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, bool last)
 {
 	u16 val, tcr_val = i2c->tcr;
 	int ret;
@@ -97,7 +96,7 @@ static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg,
 		writew(pmsg->buf[0] & 0xFF, base + VIAI2C_REG_CDR);
 	}
 
-	if (!(pmsg->flags & I2C_M_NOSTART)) {
+	if (i2c->platform == VIAI2C_PLAT_WMT && !(pmsg->flags & I2C_M_NOSTART)) {
 		val = readw(base + VIAI2C_REG_CR);
 		val &= ~VIAI2C_CR_TX_END;
 		val |= VIAI2C_CR_CPU_RDY;
@@ -111,7 +110,7 @@ static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg,
 
 	writew(tcr_val, base + VIAI2C_REG_TCR);
 
-	if (pmsg->flags & I2C_M_NOSTART) {
+	if (i2c->platform == VIAI2C_PLAT_WMT && pmsg->flags & I2C_M_NOSTART) {
 		val = readw(base + VIAI2C_REG_CR);
 		val |= VIAI2C_CR_CPU_RDY;
 		writew(val, base + VIAI2C_REG_CR);
@@ -138,7 +137,7 @@ static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg,
 		}
 
 		if (xfer_len == pmsg->len) {
-			if (last != 1)
+			if (i2c->platform == VIAI2C_PLAT_WMT && !last)
 				writew(VIAI2C_CR_ENABLE, base + VIAI2C_REG_CR);
 		} else {
 			writew(pmsg->buf[xfer_len] & 0xFF,
@@ -161,7 +160,7 @@ static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
 	val = readw(base + VIAI2C_REG_CR);
 	val &= ~(VIAI2C_CR_TX_END | VIAI2C_CR_RX_END);
 
-	if (!(pmsg->flags & I2C_M_NOSTART))
+	if (i2c->platform == VIAI2C_PLAT_WMT && !(pmsg->flags & I2C_M_NOSTART))
 		val |= VIAI2C_CR_CPU_RDY;
 
 	if (pmsg->len == 1)
@@ -176,7 +175,7 @@ static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
 
 	writew(tcr_val, base + VIAI2C_REG_TCR);
 
-	if (pmsg->flags & I2C_M_NOSTART) {
+	if (i2c->platform == VIAI2C_PLAT_WMT && (pmsg->flags & I2C_M_NOSTART)) {
 		val = readw(base + VIAI2C_REG_CR);
 		val |= VIAI2C_CR_CPU_RDY;
 		writew(val, base + VIAI2C_REG_CR);
@@ -211,7 +210,8 @@ int viai2c_xfer(struct i2c_adapter *adap,
 	i2c->to = i2c->ti = ktime_get();
 	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
-		if (!(pmsg->flags & I2C_M_NOSTART)) {
+		if ((i2c->platform == VIAI2C_PLAT_WMT)
+		   && !(pmsg->flags & I2C_M_NOSTART)) {
 			ret = viai2c_wait_bus_ready(i2c);
 			if (ret < 0)
 				return ret;
@@ -226,9 +226,10 @@ int viai2c_xfer(struct i2c_adapter *adap,
 	return (ret < 0) ? ret : i;
 }
 
-int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c)
+int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c, int plat)
 {
 	int err;
+	int irq_flags;
 	struct viai2c *i2c;
 	struct device_node *np = pdev->dev.of_node;
 
@@ -240,12 +241,19 @@ int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c)
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
+	} else
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				"wrong platform type\n");
+
+	i2c->platform = plat;
 
 	err = devm_request_irq(&pdev->dev, i2c->irq, viai2c_isr,
-					0, pdev->name, i2c);
+					irq_flags, pdev->name, i2c);
 	if (err)
 		return dev_err_probe(&pdev->dev, err,
 				"failed to request irq %i\n", i2c->irq);
diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
index 73a88398d763..6d210e562c9a 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.h
+++ b/drivers/i2c/busses/i2c-viai2c-common.h
@@ -49,6 +49,10 @@
 #define VIAI2C_REG_TR		0x0C
 #define VIAI2C_REG_MCR		0x0E
 
+enum {
+	VIAI2C_PLAT_WMT = 1,
+};
+
 struct viai2c {
 	struct i2c_adapter	adapter;
 	struct completion	complete;
@@ -60,9 +64,10 @@ struct viai2c {
 	u16			cmd_status;
 	ktime_t			ti;
 	ktime_t			to;
+	int			platform;
 };
 
 int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
-int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c);
+int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c, int plat);
 
 #endif
diff --git a/drivers/i2c/busses/i2c-wmt-plt.c b/drivers/i2c/busses/i2c-wmt-plt.c
index 8f506888cff7..6afb830eeb40 100644
--- a/drivers/i2c/busses/i2c-wmt-plt.c
+++ b/drivers/i2c/busses/i2c-wmt-plt.c
@@ -76,7 +76,7 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	int err;
 	u32 clk_rate;
 
-	err = viai2c_init(pdev, &i2c);
+	err = viai2c_init(pdev, &i2c, VIAI2C_PLAT_WMT);
 	if (err)
 		return err;
 
-- 
2.34.1


