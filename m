Return-Path: <linux-i2c+bounces-2510-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 599D5886D11
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1573728829E
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C8860879;
	Fri, 22 Mar 2024 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MLlHPMNs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224A2604DA
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114019; cv=none; b=o+8a4ZB/e+P5VZvK0sGXnuDJzjGOJIexnNKSNUgBwfikWUEpxqXzwKETOms/hOJBz3jN9iBv5kczaZcVxlRYjsq5WRuc7y08fN0G25DWpTjz3qxkonLpB7eRuTLhcliBFIdFCs0+0Ne15EMd1FPVGhHbDg7acquy8gMmsYLqwWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114019; c=relaxed/simple;
	bh=G/Op5CTNc7pnGrKK6AxAzIHLRpIR4XjnsrHDY5BHeb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrFpb4+/sPT0hqSXTtg8bKmylEB1tunrjza/b3xuwSw/Y37CWJPNASyz5eYnj784Yy1KTWCyWQ37xlKJKzNIacHUZRsHaePOjMObaHclsOmaq9LAVz6k6Im5886DiE2oDbk0NmzEkA3Fcj7wuAxcT5bxHqP4oyvEwh0znl7/+I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MLlHPMNs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=egjrsEBY1tV+MtY6pTP+RmKOqsl2JfskA20O5zDYvVQ=; b=MLlHPM
	NsuLK80+GWAgfjCSI1janf3ZqQYBWuJPq/mD1R/V0+AEqT0JwIy26qRL9SplGJpU
	P0/FWwwafrhI2CoHbaXysy8OwbdWILhHXclQUR+pNa++mFBLqPPz3807L6XDl8Nf
	EQauFleSzV4i4g6t4ND3wY0o6ZFlZsWQb+17auuNcpEM3ePWVZupLGT/TDN7DS/c
	EHvicm47M2AyaG9EBPMpDTk4GqFyGyjKPWdQMOzusiE/kY6+ZYzh+tFpN43MP3r5
	um9oPawNSVm8h8TLiMsHEj545Rw1IbzK2l39YQcy9QivmnABwHcFrHdWlB5gdHmI
	kRNI6wP7t9H6isvA==
Received: (qmail 3870734 invoked from network); 22 Mar 2024 14:26:41 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:41 +0100
X-UD-Smtp-Session: l3s3148p1@vrg8xj8UspRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 25/64] i2c: ibm_iic: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:18 +0100
Message-ID: <20240322132619.6389-26-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-ibm_iic.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ibm_iic.c b/drivers/i2c/busses/i2c-ibm_iic.c
index 7fb87b78923e..f94596074446 100644
--- a/drivers/i2c/busses/i2c-ibm_iic.c
+++ b/drivers/i2c/busses/i2c-ibm_iic.c
@@ -136,11 +136,11 @@ static void iic_dev_init(struct ibm_iic_private* dev)
 
 	DBG("%d: init\n", dev->idx);
 
-	/* Clear master address */
+	/* Clear client address */
 	out_8(&iic->lmadr, 0);
 	out_8(&iic->hmadr, 0);
 
-	/* Clear slave address */
+	/* Clear target address */
 	out_8(&iic->lsadr, 0);
 	out_8(&iic->hsadr, 0);
 
@@ -337,7 +337,7 @@ static irqreturn_t iic_handler(int irq, void *dev_id)
 }
 
 /*
- * Get master transfer result and clear errors if any.
+ * Get host transfer result and clear errors if any.
  * Returns the number of actually transferred bytes or error (<0)
  */
 static int iic_xfer_result(struct ibm_iic_private* dev)
@@ -352,7 +352,7 @@ static int iic_xfer_result(struct ibm_iic_private* dev)
 		out_8(&iic->extsts, EXTSTS_IRQP | EXTSTS_IRQD |
 			EXTSTS_LA | EXTSTS_ICT | EXTSTS_XFRA);
 
-		/* Flush master data buffer */
+		/* Flush host data buffer */
 		out_8(&iic->mdcntl, in_8(&iic->mdcntl) | MDCNTL_FMDB);
 
 		/* Is bus free?
@@ -401,7 +401,7 @@ static void iic_abort_xfer(struct ibm_iic_private* dev)
 }
 
 /*
- * Wait for master transfer to complete.
+ * Wait for host transfer to complete.
  * It puts current process to sleep until we get interrupt or timeout expires.
  * Returns the number of transferred bytes or error (<0)
  */
@@ -452,9 +452,7 @@ static int iic_wait_for_tc(struct ibm_iic_private* dev){
 	return ret;
 }
 
-/*
- * Low level master transfer routine
- */
+/* Low level host transfer routine */
 static int iic_xfer_bytes(struct ibm_iic_private* dev, struct i2c_msg* pm,
 			  int combined_xfer)
 {
@@ -511,9 +509,7 @@ static int iic_xfer_bytes(struct ibm_iic_private* dev, struct i2c_msg* pm,
 	return ret > 0 ? 0 : ret;
 }
 
-/*
- * Set target slave address for master transfer
- */
+/* Set client address for host transfer */
 static inline void iic_address(struct ibm_iic_private* dev, struct i2c_msg* msg)
 {
 	volatile struct iic_regs __iomem *iic = dev->vaddr;
@@ -546,7 +542,7 @@ static inline int iic_address_neq(const struct i2c_msg* p1,
 }
 
 /*
- * Generic master transfer entrypoint.
+ * Generic transfer entrypoint.
  * Returns the number of processed messages or error (<0)
  */
 static int iic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
@@ -604,11 +600,11 @@ static int iic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		}
 	}
 	else {
-		/* Flush master data buffer (just in case) */
+		/* Flush host data buffer (just in case) */
 		out_8(&iic->mdcntl, in_8(&iic->mdcntl) | MDCNTL_FMDB);
 	}
 
-	/* Load slave address */
+	/* Load client address */
 	iic_address(dev, &msgs[0]);
 
 	/* Do real transfer */
@@ -624,7 +620,7 @@ static u32 iic_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm iic_algo = {
-	.master_xfer 	= iic_xfer,
+	.xfer		= iic_xfer,
 	.functionality	= iic_func
 };
 
-- 
2.43.0


