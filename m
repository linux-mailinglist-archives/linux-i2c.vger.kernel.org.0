Return-Path: <linux-i2c+bounces-2493-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6B4886CEC
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 589D4284002
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4725026B;
	Fri, 22 Mar 2024 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Vfk35MJS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE95B4CB35
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114003; cv=none; b=c4yqvffxitDwRpIu5bM9G5a27YOOGVUwlpoNgF64N57B9WPp9vu4OdbGGaaxCrJISDfvN/OXE1R5eZ4p1GKEOYHlLPDo9M60CR3MnsdyS3zYSo62PKIbimTzl0IwRQeXJX48iTB/lcr65nhHcgEDgFl/RN0wmza9Qh5YeEd7yK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114003; c=relaxed/simple;
	bh=ym3gtFYbdGqQAg20b+BWubWlBx3M58XIGmfXCrpju9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o81T9isT5O+UQWnxgx1X87LriBsBESMVD82kJEIoKvVXNX2r3YjkA5M7GVrA4zPsRNQ2HMZcBWI5GbAHqfW9eV7IaAer9GrkHLEXoyiYAbqA4UcMOOcajtShHk2fcFwS29ceLhggB9mEz5hHGPkz+B5Fh+BQG560i0uVhgJT5lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Vfk35MJS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=+9eJDPYcvheHFhVWSeTXcV93NuGaWmWAwekU/Oh9CJ4=; b=Vfk35M
	JSUL85oEwdUpaoZywSUhRxjNWZFf91x1byAkI9WKNyJM/QbM1VfS2Fxb6cb2IvHT
	1/EXdQaz2aj2f0uLFipQE/ze0asri/1BS+RMssCl4QWqbgQ2Xoa2z1IuQcT7oEFx
	jDeYf1s2IZJm0VYbTrom+PO5KqjUsZMIYQEhFIQ2FlGgoQ//LRU9/8CgWVdfQ67w
	mRKX5szDSTQWxcLnn+m7bw0lgL75+Tt1gb10JGDFSy5jiygKviWP/zbmJyLWToBt
	7f79pX+sQ0F0Hl139XavzX7SymVIaIUVHIyDTZ3uCmjboWaGdqNZjk5CfBZjy896
	Zl7wVryR1CdTCnQg==
Received: (qmail 3870202 invoked from network); 22 Mar 2024 14:26:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:26 +0100
X-UD-Smtp-Session: l3s3148p1@tj9VxT8UdJNehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/64] i2c: bcm-iproc: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:00 +0100
Message-ID: <20240322132619.6389-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
specifications and replace "master/slave" with more appropriate terms.
They are also more specific because we distinguish now between a remote
entity ("client") and a local one ("target").

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index e905734c26a0..3c68d4df029f 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -224,8 +224,8 @@ static void slave_rx_tasklet_fn(unsigned long);
 		| BIT(IS_S_TX_UNDERRUN_SHIFT) | BIT(IS_S_RX_FIFO_FULL_SHIFT)\
 		| BIT(IS_S_RX_THLD_SHIFT))
 
-static int bcm_iproc_i2c_reg_slave(struct i2c_client *slave);
-static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave);
+static int bcm_iproc_i2c_reg_target(struct i2c_client *slave);
+static int bcm_iproc_i2c_unreg_target(struct i2c_client *slave);
 static void bcm_iproc_i2c_enable_disable(struct bcm_iproc_i2c_dev *iproc_i2c,
 					 bool enable);
 
@@ -987,17 +987,17 @@ static uint32_t bcm_iproc_i2c_functionality(struct i2c_adapter *adap)
 
 	val = I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
 
-	if (adap->algo->reg_slave)
+	if (adap->algo->reg_target)
 		val |= I2C_FUNC_SLAVE;
 
 	return val;
 }
 
 static struct i2c_algorithm bcm_iproc_algo = {
-	.master_xfer = bcm_iproc_i2c_xfer,
+	.xfer = bcm_iproc_i2c_xfer,
 	.functionality = bcm_iproc_i2c_functionality,
-	.reg_slave = bcm_iproc_i2c_reg_slave,
-	.unreg_slave = bcm_iproc_i2c_unreg_slave,
+	.reg_target = bcm_iproc_i2c_reg_target,
+	.unreg_target = bcm_iproc_i2c_unreg_target,
 };
 
 static const struct i2c_adapter_quirks bcm_iproc_i2c_quirks = {
@@ -1079,8 +1079,8 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
 		spin_lock_init(&iproc_i2c->idm_lock);
 
 		/* no slave support */
-		bcm_iproc_algo.reg_slave = NULL;
-		bcm_iproc_algo.unreg_slave = NULL;
+		bcm_iproc_algo.reg_target = NULL;
+		bcm_iproc_algo.unreg_target = NULL;
 	}
 
 	ret = bcm_iproc_i2c_init(iproc_i2c);
@@ -1191,7 +1191,7 @@ static const struct dev_pm_ops bcm_iproc_i2c_pm_ops = {
 	.resume_early = &bcm_iproc_i2c_resume
 };
 
-static int bcm_iproc_i2c_reg_slave(struct i2c_client *slave)
+static int bcm_iproc_i2c_reg_target(struct i2c_client *slave)
 {
 	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(slave->adapter);
 
@@ -1210,7 +1210,7 @@ static int bcm_iproc_i2c_reg_slave(struct i2c_client *slave)
 	return 0;
 }
 
-static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave)
+static int bcm_iproc_i2c_unreg_target(struct i2c_client *slave)
 {
 	u32 tmp;
 	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(slave->adapter);
-- 
2.43.0


