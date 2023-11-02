Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 298EC7DEB2A
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Nov 2023 04:10:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233010AbjKBDKr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Nov 2023 23:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232949AbjKBDKq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Nov 2023 23:10:46 -0400
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A6AB113
        for <linux-i2c@vger.kernel.org>; Wed,  1 Nov 2023 20:10:42 -0700 (PDT)
X-ASG-Debug-ID: 1698893646-086e236fed038f0002-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx1.zhaoxin.com with ESMTP id BMKEGRBBC7yXXbzM (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 02 Nov 2023 10:54:07 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 2 Nov
 2023 10:54:07 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 2 Nov 2023 10:54:06 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
From:   Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To:     <andi.shyti@kernel.org>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>
CC:     <cobechen@zhaoxin.com>
Subject: [PATCH v3 11/12] i2c: via-common: add zhaoxin platform
Date:   Thu, 2 Nov 2023 10:54:01 +0800
X-ASG-Orig-Subj: [PATCH v3 11/12] i2c: via-common: add zhaoxin platform
Message-ID: <724d41f2ce79314cab76a2141229cc7126fb1c75.1698889581.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
References: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1698893647
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 4761
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.116190
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


There are some differences between the design of zhaoxin
i2c controller and wmt. Use VIAI2C_PLAT_WMT and VIAI2C_PLAT_ZHAOXIN
to identify the two platforms.

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-viai2c-common.c | 30 +++++++++++++++++++-------
 drivers/i2c/busses/i2c-viai2c-common.h |  7 ++++++
 2 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index 45ac56941bee..0247865cb57a 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.c
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -15,6 +15,13 @@ int viai2c_wait_bus_ready(struct viai2c *i2c)
 			dev_warn(i2c->dev, "timeout waiting for bus ready\n");
 			return -EBUSY;
 		}
+		if (i2c->platform == VIAI2C_PLAT_ZHAOXIN) {
+			u16 tmp = ioread16(i2c->base + VIAI2C_REG_CR);
+
+			iowrite16(tmp | VIAI2C_CR_END_MASK,
+					i2c->base + VIAI2C_REG_CR);
+		}
+
 		msleep(20);
 	}
 
@@ -53,7 +60,7 @@ static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, bool last)
 		writew(pmsg->buf[0] & 0xFF, base + VIAI2C_REG_CDR);
 	}
 
-	if (!(pmsg->flags & I2C_M_NOSTART)) {
+	if (i2c->platform == VIAI2C_PLAT_WMT && !(pmsg->flags & I2C_M_NOSTART)) {
 		val = readw(base + VIAI2C_REG_CR);
 		val &= ~VIAI2C_CR_TX_END;
 		val |= VIAI2C_CR_CPU_RDY;
@@ -63,7 +70,7 @@ static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, bool last)
 	reinit_completion(&i2c->complete);
 	writew(tcr_val | pmsg->addr, base + VIAI2C_REG_TCR);
 
-	if (pmsg->flags & I2C_M_NOSTART) {
+	if (i2c->platform == VIAI2C_PLAT_WMT && pmsg->flags & I2C_M_NOSTART) {
 		val = readw(base + VIAI2C_REG_CR);
 		val |= VIAI2C_CR_CPU_RDY;
 		writew(val, base + VIAI2C_REG_CR);
@@ -92,8 +99,10 @@ static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, bool last)
 		}
 
 		if (xfer_len == pmsg->len) {
-			if (!last)
+			if (i2c->platform == VIAI2C_PLAT_WMT && !last)
 				writew(VIAI2C_CR_ENABLE, base + VIAI2C_REG_CR);
+			else if (i2c->platform == VIAI2C_PLAT_ZHAOXIN && last)
+				writeb(VIAI2C_CR_TX_END, base + VIAI2C_REG_CR);
 		} else {
 			writew(pmsg->buf[xfer_len] & 0xFF,
 					base + VIAI2C_REG_CDR);
@@ -105,7 +114,7 @@ static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, bool last)
 	return 0;
 }
 
-static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
+static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg, bool first)
 {
 	u16 val, tcr_val = i2c->tcr;
 	u32 xfer_len = 0;
@@ -114,7 +123,7 @@ static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
 	val = readw(base + VIAI2C_REG_CR);
 	val &= ~(VIAI2C_CR_TX_END | VIAI2C_CR_RX_END);
 
-	if (!(pmsg->flags & I2C_M_NOSTART))
+	if (i2c->platform == VIAI2C_PLAT_WMT && !(pmsg->flags & I2C_M_NOSTART))
 		val |= VIAI2C_CR_CPU_RDY;
 
 	if (pmsg->len == 1)
@@ -128,7 +137,8 @@ static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
 
 	writew(tcr_val, base + VIAI2C_REG_TCR);
 
-	if (pmsg->flags & I2C_M_NOSTART) {
+	if ((i2c->platform == VIAI2C_PLAT_WMT && (pmsg->flags & I2C_M_NOSTART))
+	    || (i2c->platform == VIAI2C_PLAT_ZHAOXIN && !first)) {
 		val = readw(base + VIAI2C_REG_CR);
 		val |= VIAI2C_CR_CPU_RDY;
 		writew(val, base + VIAI2C_REG_CR);
@@ -162,14 +172,15 @@ int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
-		if (!(pmsg->flags & I2C_M_NOSTART)) {
+		if (!(pmsg->flags & I2C_M_NOSTART)
+		   && (i2c->platform == VIAI2C_PLAT_WMT)) {
 			ret = viai2c_wait_bus_ready(i2c);
 			if (ret < 0)
 				return ret;
 		}
 
 		if (pmsg->flags & I2C_M_RD)
-			ret = viai2c_read(i2c, pmsg);
+			ret = viai2c_read(i2c, pmsg, i == 0);
 		else
 			ret = viai2c_write(i2c, pmsg, i == (num - 1));
 	}
@@ -183,6 +194,9 @@ static irqreturn_t viai2c_isr(int irq, void *data)
 
 	/* save the status and write-clear it */
 	i2c->cmd_status = readw(i2c->base + VIAI2C_REG_ISR);
+	if (!i2c->cmd_status)
+		return IRQ_NONE;
+
 	writew(i2c->cmd_status, i2c->base + VIAI2C_REG_ISR);
 
 	complete(&i2c->complete);
diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
index f3dcc609679e..c1b9ccff24e8 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.h
+++ b/drivers/i2c/busses/i2c-viai2c-common.h
@@ -50,6 +50,7 @@
 
 enum {
 	VIAI2C_PLAT_WMT = 1,
+	VIAI2C_PLAT_ZHAOXIN
 };
 
 struct viai2c {
@@ -62,6 +63,12 @@ struct viai2c {
 	int			irq;
 	u16			cmd_status;
 	u8			platform;
+	u8			addr;
+	u16			tr;
+	u16			mcr;
+	u16			csr;
+	u8			fstp;
+	u8			hrv;
 };
 
 int viai2c_wait_bus_ready(struct viai2c *i2c);
-- 
2.34.1

