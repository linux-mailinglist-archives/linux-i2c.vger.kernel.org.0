Return-Path: <linux-i2c+bounces-1012-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEA081EC0E
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 05:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16C4C1C21673
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 04:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162724428;
	Wed, 27 Dec 2023 04:40:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6E53C29
	for <linux-i2c@vger.kernel.org>; Wed, 27 Dec 2023 04:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1703651994-1eb14e0c7f05720004-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx2.zhaoxin.com with ESMTP id Zagnbs13BHwRJuCr (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Wed, 27 Dec 2023 12:39:55 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX02.zhaoxin.com (10.29.252.6) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 27 Dec
 2023 12:39:55 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX02.zhaoxin.com (10.29.252.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 27 Dec 2023 12:39:54 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.6
To: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <andi.shyti@kernel.org>, <cobechen@zhaoxin.com>, <hanshu-oc@zhaoxin.com>
Subject: [PATCH v4 7/8] i2c: wmt: add platform type VIAI2C_PLAT_WMT
Date: Wed, 27 Dec 2023 12:39:50 +0800
X-ASG-Orig-Subj: [PATCH v4 7/8] i2c: wmt: add platform type VIAI2C_PLAT_WMT
Message-ID: <1bdfaf42290fbf094a445c563e5404c23c1fef32.1703647471.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703647471.git.hanshu-oc@zhaoxin.com>
References: <cover.1703647471.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX02.zhaoxin.com (10.29.252.6)
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1703651995
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 5305
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118618
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Enumeration variables are added to differentiate between different platforms

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-viai2c-common.c | 34 ++++++++++++++++----------
 drivers/i2c/busses/i2c-viai2c-common.h |  7 +++++-
 drivers/i2c/busses/i2c-wmt-plt.c       |  2 +-
 3 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index e5eca10efedc..56c538653da1 100644
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
index 73a88398d763..39c0c12326a7 100644
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
+	u8			platform;
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


