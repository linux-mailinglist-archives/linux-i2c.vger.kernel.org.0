Return-Path: <linux-i2c+bounces-4689-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFA49292F9
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A0A41F22312
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7AA149E03;
	Sat,  6 Jul 2024 11:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QfvJv2ds"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B371474A3
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264915; cv=none; b=Gfy1Wnjlb80Rb2EIBlTZhEj9s7AKMoBRg4fb0CExKxZXFNwWMBIoCospIZDSehBFqEjot+20LrG1ATR6tTJ7YIoWCt6UZdnGZCkft9MdJ0Dx0KvxqrhA9b2rFcdT+xuOYTHidMHEioACiWc7EURl5CnlFcQcdv9LTosCmduoDf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264915; c=relaxed/simple;
	bh=TAMxqjwh0Yu6WLwnBKFhzPOrc+HgpJP7G8F/9/xOk+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOH5jTWcT8MFH62MSzdXKZ/aZWpzRa4fuOHgu14+Qm9u2tPOHsCmDQi0rAd5OXucNWCWMWmc1bkfdbQabd4wIgP2OlIY2uBzGs8T2QoAajQKGWvcRE6X6Hyidm7K1/X31PDG/VlEC5Vveo0Ucy/UCeKIb9E/EJfRWKZqVDMD4ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QfvJv2ds; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=0h37wVaNas3ztHVctYiDS4mlh0QnQBIcJ3hxl1tjriA=; b=QfvJv2
	ds4JG/nBsWlRStrEk/PUaZxBlePptH5MSB5j+vLMcLGwmxaNYnhaL49x6Gfab6Zm
	9iHCmUy/PBnCPHlUW+RRQ2Z2OkpQr6B43oR4AdgzpsXqAysNbsz3RnkZWCjgxCz5
	+2FkKYmZeZfsB4f0KEAxQv+VvIcNvXVhWb6FtVuum78ELRWGqe/K88DBHQyRAN9I
	1F2ZQe79tBjqH9V9HUGdL0AD5dC2ZahhvENhrB7rc/zQMxDjLokCTdK6VK98N0Pl
	Zb3UYGkl26UANA334S4iPMOvWHA6F/fbXwvEdRF7Idvx0bwA63JfXgDsdXXtvAm0
	/ZkyqaMkCVystFnw==
Received: (qmail 3809991 invoked from network); 6 Jul 2024 13:21:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:37 +0200
X-UD-Smtp-Session: l3s3148p1@ChgbYpIcOoZQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 21/60] i2c: ibm_iic: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:21 +0200
Message-ID: <20240706112116.24543-22-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
specifications and replace "master/slave" with more appropriate terms.
Remove a useless comment while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-ibm_iic.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ibm_iic.c b/drivers/i2c/busses/i2c-ibm_iic.c
index 7fb87b78923e..82dedb1bb5be 100644
--- a/drivers/i2c/busses/i2c-ibm_iic.c
+++ b/drivers/i2c/busses/i2c-ibm_iic.c
@@ -136,11 +136,11 @@ static void iic_dev_init(struct ibm_iic_private* dev)
 
 	DBG("%d: init\n", dev->idx);
 
-	/* Clear master address */
+	/* Clear remote target address */
 	out_8(&iic->lmadr, 0);
 	out_8(&iic->hmadr, 0);
 
-	/* Clear slave address */
+	/* Clear local target address */
 	out_8(&iic->lsadr, 0);
 	out_8(&iic->hsadr, 0);
 
@@ -337,7 +337,7 @@ static irqreturn_t iic_handler(int irq, void *dev_id)
 }
 
 /*
- * Get master transfer result and clear errors if any.
+ * Get controller transfer result and clear errors if any.
  * Returns the number of actually transferred bytes or error (<0)
  */
 static int iic_xfer_result(struct ibm_iic_private* dev)
@@ -352,7 +352,7 @@ static int iic_xfer_result(struct ibm_iic_private* dev)
 		out_8(&iic->extsts, EXTSTS_IRQP | EXTSTS_IRQD |
 			EXTSTS_LA | EXTSTS_ICT | EXTSTS_XFRA);
 
-		/* Flush master data buffer */
+		/* Flush controller data buffer */
 		out_8(&iic->mdcntl, in_8(&iic->mdcntl) | MDCNTL_FMDB);
 
 		/* Is bus free?
@@ -401,7 +401,7 @@ static void iic_abort_xfer(struct ibm_iic_private* dev)
 }
 
 /*
- * Wait for master transfer to complete.
+ * Wait for controller transfer to complete.
  * It puts current process to sleep until we get interrupt or timeout expires.
  * Returns the number of transferred bytes or error (<0)
  */
@@ -452,9 +452,6 @@ static int iic_wait_for_tc(struct ibm_iic_private* dev){
 	return ret;
 }
 
-/*
- * Low level master transfer routine
- */
 static int iic_xfer_bytes(struct ibm_iic_private* dev, struct i2c_msg* pm,
 			  int combined_xfer)
 {
@@ -511,9 +508,7 @@ static int iic_xfer_bytes(struct ibm_iic_private* dev, struct i2c_msg* pm,
 	return ret > 0 ? 0 : ret;
 }
 
-/*
- * Set target slave address for master transfer
- */
+/* Set remote target address for transfer */
 static inline void iic_address(struct ibm_iic_private* dev, struct i2c_msg* msg)
 {
 	volatile struct iic_regs __iomem *iic = dev->vaddr;
@@ -546,7 +541,7 @@ static inline int iic_address_neq(const struct i2c_msg* p1,
 }
 
 /*
- * Generic master transfer entrypoint.
+ * Generic transfer entrypoint.
  * Returns the number of processed messages or error (<0)
  */
 static int iic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
@@ -604,11 +599,11 @@ static int iic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		}
 	}
 	else {
-		/* Flush master data buffer (just in case) */
+		/* Flush controller data buffer (just in case) */
 		out_8(&iic->mdcntl, in_8(&iic->mdcntl) | MDCNTL_FMDB);
 	}
 
-	/* Load slave address */
+	/* Load target address */
 	iic_address(dev, &msgs[0]);
 
 	/* Do real transfer */
@@ -624,8 +619,8 @@ static u32 iic_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm iic_algo = {
-	.master_xfer 	= iic_xfer,
-	.functionality	= iic_func
+	.xfer = iic_xfer,
+	.functionality = iic_func
 };
 
 /*
-- 
2.43.0


