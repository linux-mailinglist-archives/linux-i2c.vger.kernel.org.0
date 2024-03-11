Return-Path: <linux-i2c+bounces-2316-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 066AB877A07
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 04:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A5121C209FF
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 03:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4980D1860;
	Mon, 11 Mar 2024 03:26:13 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E5615A5
	for <linux-i2c@vger.kernel.org>; Mon, 11 Mar 2024 03:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.110.167.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710127573; cv=none; b=jJQLEFbK1GPcs5HRcAnlJSfkZ9mrvlfRL/UzkvXQre07VW41tkToHUFZmhrDTtwrHYJhAom19zumnRHjHVPurT7cXUopWCaveh+2Jq4J3UeCw8EY2Rx5j1VKgVcWUIL8/KoPIRI5YQKgq8AMU5gvmys2BQgBFEXTFvMwi0ELd18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710127573; c=relaxed/simple;
	bh=hcmWfAHkepYcmqPqhP2t1ncjyVJFoCC6iF/0qdzq5N4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P3pwKfL3z/FEISYMj8CBzb/3WGKv0YXINuxI6N2y5W++fq8Nxn2IONyiKHbJoAWt8GcdvgQSEgzROs3+0bDj2M9oSa1KV2ug1QApp2OGTk8NiBKT/fiv7qyhBV875lHuverEBNHWvG+VOQ+355wxN5TadWy+oY1xr+MvBlpQ9VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=203.110.167.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1710127561-1eb14e2b8406fc0001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id gpVSCfkQCsLC6jNJ (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Mon, 11 Mar 2024 11:26:01 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Mar
 2024 11:26:01 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 11 Mar 2024 11:26:00 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>, <wsa@kernel.org>
CC: <hanshu@zhaoxin.com>
Subject: [PATCH 1/2] i2c: viai2c: Fix some minor style issues
Date: Mon, 11 Mar 2024 11:25:59 +0800
X-ASG-Orig-Subj: [PATCH 1/2] i2c: viai2c: Fix some minor style issues
Message-ID: <20240311032600.56244-1-hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
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
X-Barracuda-Start-Time: 1710127561
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 4684
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.121952
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

1. fixed some minor issues that were checked out by checkpatch
2. deleted the unnecessary log that received nack during write cycle
3. adjusted the log when FW gives inappropriate parameters

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-viai2c-common.c  | 15 ++++++---------
 drivers/i2c/busses/i2c-viai2c-wmt.c     |  2 +-
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c |  9 ++++-----
 3 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index 05b615144442..4c208b3a509e 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.c
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -81,8 +81,8 @@ static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg, bool first)
 
 	writew(tcr_val, i2c->base + VIAI2C_REG_TCR);
 
-	if ((i2c->platform == VIAI2C_PLAT_WMT && (pmsg->flags & I2C_M_NOSTART))
-	   || (i2c->platform == VIAI2C_PLAT_ZHAOXIN && !first)) {
+	if ((i2c->platform == VIAI2C_PLAT_WMT && (pmsg->flags & I2C_M_NOSTART)) ||
+	    (i2c->platform == VIAI2C_PLAT_ZHAOXIN && !first)) {
 		val = readw(i2c->base + VIAI2C_REG_CR);
 		val |= VIAI2C_CR_CPU_RDY;
 		writew(val, i2c->base + VIAI2C_REG_CR);
@@ -104,8 +104,8 @@ int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	i2c->mode = VIAI2C_BYTE_MODE;
 	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
-		if ((i2c->platform == VIAI2C_PLAT_WMT)
-		   && !(pmsg->flags & I2C_M_NOSTART)) {
+		if (i2c->platform == VIAI2C_PLAT_WMT &&
+		    !(pmsg->flags & I2C_M_NOSTART)) {
 			ret = viai2c_wait_bus_not_busy(i2c);
 			if (ret < 0)
 				return ret;
@@ -138,12 +138,9 @@ static int viai2c_irq_xfer(struct viai2c *i2c)
 			val |= VIAI2C_CR_RX_END;
 		writew(val, base + VIAI2C_REG_CR);
 	} else {
-
 		val = readw(base + VIAI2C_REG_CSR);
-		if (val & VIAI2C_CSR_RCV_NOT_ACK) {
-			dev_dbg_ratelimited(i2c->dev, "write RCV NACK error\n");
+		if (val & VIAI2C_CSR_RCV_NOT_ACK)
 			return -EIO;
-		}
 
 		if (msg->len == 0) {
 			val = VIAI2C_CR_TX_END | VIAI2C_CR_CPU_RDY | VIAI2C_CR_ENABLE;
@@ -236,7 +233,7 @@ int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c, int plat)
 	i2c->platform = plat;
 
 	err = devm_request_irq(&pdev->dev, i2c->irq, viai2c_isr,
-					irq_flags, pdev->name, i2c);
+			       irq_flags, pdev->name, i2c);
 	if (err)
 		return dev_err_probe(&pdev->dev, err,
 				"failed to request irq %i\n", i2c->irq);
diff --git a/drivers/i2c/busses/i2c-viai2c-wmt.c b/drivers/i2c/busses/i2c-viai2c-wmt.c
index aa6c34a78b1e..e1988f946026 100644
--- a/drivers/i2c/busses/i2c-viai2c-wmt.c
+++ b/drivers/i2c/busses/i2c-viai2c-wmt.c
@@ -91,7 +91,7 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	}
 
 	err = of_property_read_u32(np, "clock-frequency", &clk_rate);
-	if (!err && (clk_rate == I2C_MAX_FAST_MODE_FREQ))
+	if (!err && clk_rate == I2C_MAX_FAST_MODE_FREQ)
 		i2c->tcr = VIAI2C_TCR_FAST;
 
 	adap = &i2c->adapter;
diff --git a/drivers/i2c/busses/i2c-viai2c-zhaoxin.c b/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
index 99db93caa4cb..7e3ac2a3e1fd 100644
--- a/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
+++ b/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
@@ -132,7 +132,8 @@ static int zxi2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int
 
 		i2c->msg = msgs;
 		i2c->mode = VIAI2C_FIFO_MODE;
-		priv->xfer_len = i2c->xfered_len = 0;
+		priv->xfer_len = 0;
+		i2c->xfered_len = 0;
 
 		viai2c_fifo_irq_xfer(i2c, 0);
 
@@ -196,7 +197,6 @@ static void zxi2c_get_bus_speed(struct viai2c *i2c)
 	u8 fstp;
 	const u32 *params;
 	struct viai2c_zhaoxin *priv = i2c->pltfm_priv;
-
 	u32 acpi_speed = i2c_acpi_find_bus_speed(i2c->dev);
 
 	count = ARRAY_SIZE(zxi2c_speed_params_table);
@@ -213,8 +213,7 @@ static void zxi2c_get_bus_speed(struct viai2c *i2c)
 		 * if BIOS setting value far from golden value,
 		 * use golden value and warn user
 		 */
-		dev_warn(i2c->dev, "speed:%d, fstp:0x%x, golden:0x%x\n",
-				params[0], fstp, params[2]);
+		dev_warn(i2c->dev, "FW FSTP[%x] might cause wrong timings, dropped\n", fstp);
 		priv->tr = params[2] | 0xff00;
 	} else {
 		priv->tr = fstp | 0xff00;
@@ -257,7 +256,7 @@ static int zxi2c_probe(struct platform_device *pdev)
 	adap->dev.parent = &pdev->dev;
 	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
 	snprintf(adap->name, sizeof(adap->name), "zhaoxin-%s-%s",
-			dev_name(pdev->dev.parent), dev_name(i2c->dev));
+		 dev_name(pdev->dev.parent), dev_name(i2c->dev));
 	i2c_set_adapdata(adap, i2c);
 
 	return devm_i2c_add_adapter(&pdev->dev, adap);
-- 
2.34.1


