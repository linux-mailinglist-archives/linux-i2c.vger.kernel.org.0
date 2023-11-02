Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD017DEB06
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Nov 2023 03:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348179AbjKBCyL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Nov 2023 22:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347257AbjKBCyK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Nov 2023 22:54:10 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C76B9
        for <linux-i2c@vger.kernel.org>; Wed,  1 Nov 2023 19:54:07 -0700 (PDT)
X-ASG-Debug-ID: 1698893644-1eb14e538e03af0002-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id X40x139H80wrFMTX (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 02 Nov 2023 10:54:04 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 2 Nov
 2023 10:54:04 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 2 Nov 2023 10:54:03 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
From:   Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To:     <andi.shyti@kernel.org>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>
CC:     <cobechen@zhaoxin.com>
Subject: [PATCH v3 03/12] i2c: wmt: Reduce redundant: clock mode setting
Date:   Thu, 2 Nov 2023 10:53:53 +0800
X-ASG-Orig-Subj: [PATCH v3 03/12] i2c: wmt: Reduce redundant: clock mode setting
Message-ID: <b9b9336a2d24ceb23fb773932e7836b0cb04f372.1698889581.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
References: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1698893644
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 3041
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.116192
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

The frequency setting mode is adjusted to reduce the code redundancy,
and it is also convenient to share with zhaoxin

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-wmt.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
index 1b31330ba4eb..a44ce5fdde8a 100644
--- a/drivers/i2c/busses/i2c-wmt.c
+++ b/drivers/i2c/busses/i2c-wmt.c
@@ -74,9 +74,6 @@
 #define MCR_APB_96M		7
 #define MCR_APB_166M		12
 
-#define I2C_MODE_STANDARD	0
-#define I2C_MODE_FAST		1
-
 #define WMT_I2C_TIMEOUT		(msecs_to_jiffies(1000))
 
 struct wmt_i2c_dev {
@@ -85,7 +82,7 @@ struct wmt_i2c_dev {
 	struct device		*dev;
 	void __iomem		*base;
 	struct clk		*clk;
-	int			mode;
+	u16			tcr;
 	int			irq;
 	u16			cmd_status;
 };
@@ -129,7 +126,7 @@ static int wmt_i2c_write(struct i2c_adapter *adap, struct i2c_msg *pmsg,
 			 int last)
 {
 	struct wmt_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
-	u16 val, tcr_val;
+	u16 val, tcr_val = i2c_dev->tcr;
 	int ret;
 	int xfer_len = 0;
 
@@ -156,11 +153,6 @@ static int wmt_i2c_write(struct i2c_adapter *adap, struct i2c_msg *pmsg,
 
 	reinit_completion(&i2c_dev->complete);
 
-	if (i2c_dev->mode == I2C_MODE_STANDARD)
-		tcr_val = TCR_STANDARD_MODE;
-	else
-		tcr_val = TCR_FAST_MODE;
-
 	tcr_val |= (TCR_MASTER_WRITE | (pmsg->addr & TCR_SLAVE_ADDR_MASK));
 
 	writew(tcr_val, i2c_dev->base + REG_TCR);
@@ -207,7 +199,7 @@ static int wmt_i2c_read(struct i2c_adapter *adap, struct i2c_msg *pmsg,
 			int last)
 {
 	struct wmt_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
-	u16 val, tcr_val;
+	u16 val, tcr_val = i2c_dev->tcr;
 	int ret;
 	u32 xfer_len = 0;
 
@@ -233,11 +225,6 @@ static int wmt_i2c_read(struct i2c_adapter *adap, struct i2c_msg *pmsg,
 
 	reinit_completion(&i2c_dev->complete);
 
-	if (i2c_dev->mode == I2C_MODE_STANDARD)
-		tcr_val = TCR_STANDARD_MODE;
-	else
-		tcr_val = TCR_FAST_MODE;
-
 	tcr_val |= TCR_MASTER_READ | (pmsg->addr & TCR_SLAVE_ADDR_MASK);
 
 	writew(tcr_val, i2c_dev->base + REG_TCR);
@@ -346,10 +333,10 @@ static int wmt_i2c_reset_hardware(struct wmt_i2c_dev *i2c_dev)
 	readw(i2c_dev->base + REG_CSR);		/* read clear */
 	writew(ISR_WRITE_ALL, i2c_dev->base + REG_ISR);
 
-	if (i2c_dev->mode == I2C_MODE_STANDARD)
-		writew(SCL_TIMEOUT(128) | TR_STD, i2c_dev->base + REG_TR);
-	else
+	if (i2c_dev->tcr == TCR_FAST_MODE)
 		writew(SCL_TIMEOUT(128) | TR_HS, i2c_dev->base + REG_TR);
+	else
+		writew(SCL_TIMEOUT(128) | TR_STD, i2c_dev->base + REG_TR);
 
 	return 0;
 }
@@ -382,10 +369,9 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c_dev->clk);
 	}
 
-	i2c_dev->mode = I2C_MODE_STANDARD;
 	err = of_property_read_u32(np, "clock-frequency", &clk_rate);
 	if (!err && (clk_rate == I2C_MAX_FAST_MODE_FREQ))
-		i2c_dev->mode = I2C_MODE_FAST;
+		i2c_dev->tcr = TCR_FAST_MODE;
 
 	i2c_dev->dev = &pdev->dev;
 
-- 
2.34.1

