Return-Path: <linux-i2c+bounces-2541-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 375D9886D5F
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98E392858EC
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E08664D3;
	Fri, 22 Mar 2024 13:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Inynn4cA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C54765BBF
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114049; cv=none; b=pbwkzi+anG+wKUdJP7/fT0aTv2A/NuKqvmonUk6Gp34qfAH04jEqPPI3sbOXRFV7DGUYMFzikm1jePnv0U9bmj+6v4Wrd5kNL6uT4AWlw9E8vGrKAfOIqupwnrsJ2tS1xlxaHn4q9DBCXMJNbipObcb2my8PSrnvda3PldA0yH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114049; c=relaxed/simple;
	bh=A4Mzc2nTZGdzFMcgWqISDzq4egh98/WrwYY5nCHZFUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qu8kuisTabE+KvPAIvYkuD7YauUKnaRnbdj59CFgEEr/EvLIgTEQoA1HOVdI12QXz7iCYDwI7znZr0Ig4vcEgYEMdxRuqBpqNrlfhU3DJ3CxVNXpWmZ88blXjAPOdgbEjhWgJO8leAkph2ttW64UL0bom/O7MNsAMuC5Lk/oBHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Inynn4cA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ytanu7H5eyBZ7/uQQrpibeDO0nDWqRUtTfFni6jgrYU=; b=Inynn4
	cAKloAbOe1BMSWTKEXk7UMn0qEswaNtZvclzB3S8odDdfdfITHmo2/62ZfDZpNIR
	8fl7Bcf9mY4DQlRcYBuLInnJiv7UNO37dnV4mCw0kboQkBLO590Br59mJNhuefCB
	FJmIU9jS1nMraNXQjhwNKQCvJU2z6WJpvROZs/TYehnzltuqj9SJ0DR+XgGRBbtr
	krLYxgtd0VQYdvlc2NdAZzSe/ewx7ruXzuojGVSqkQrGqXbzYFudnKeDZHLSh2XB
	+iZh2fE7d5xyyssuuO5gBMEZNik5iPgqNvmkdXr7VqLfd61D2vxpkdfP25Zelayr
	OzhdHCVcZJECLJZA==
Received: (qmail 3872005 invoked from network); 22 Mar 2024 14:27:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:27:06 +0100
X-UD-Smtp-Session: l3s3148p1@rO+4xz8URpRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 55/64] i2c: sun6i-p2wi: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:48 +0100
Message-ID: <20240322132619.6389-56-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index 85e035e7a1d7..bb01746738b1 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -10,7 +10,7 @@
  * The P2WI controller looks like an SMBus controller which only supports byte
  * data transfers. But, it differs from standard SMBus protocol on several
  * aspects:
- * - it supports only one slave device, and thus drop the address field
+ * - it supports only one client device, and thus drop the address field
  * - it adds a parity bit every 8bits of data
  * - only one read access is required to read a byte (instead of a write
  *   followed by a read access in standard SMBus protocol)
@@ -88,7 +88,7 @@ struct p2wi {
 	void __iomem *regs;
 	struct clk *clk;
 	struct reset_control *rstc;
-	int slave_addr;
+	int client_addr;
 };
 
 static irqreturn_t p2wi_interrupt(int irq, void *dev_id)
@@ -121,7 +121,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	struct p2wi *p2wi = i2c_get_adapdata(adap);
 	unsigned long dlen = P2WI_DLEN_DATA_LENGTH(1);
 
-	if (p2wi->slave_addr >= 0 && addr != p2wi->slave_addr) {
+	if (p2wi->client_addr >= 0 && addr != p2wi->client_addr) {
 		dev_err(&adap->dev, "invalid P2WI address\n");
 		return -EINVAL;
 	}
@@ -188,7 +188,7 @@ static int p2wi_probe(struct platform_device *pdev)
 	unsigned long parent_clk_freq;
 	u32 clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
 	struct p2wi *p2wi;
-	u32 slave_addr;
+	u32 client_addr;
 	int clk_div;
 	int irq;
 	int ret;
@@ -207,7 +207,7 @@ static int p2wi_probe(struct platform_device *pdev)
 	}
 
 	if (of_get_child_count(np) > 1) {
-		dev_err(dev, "P2WI only supports one slave device\n");
+		dev_err(dev, "P2WI only supports one client device\n");
 		return -EINVAL;
 	}
 
@@ -215,24 +215,24 @@ static int p2wi_probe(struct platform_device *pdev)
 	if (!p2wi)
 		return -ENOMEM;
 
-	p2wi->slave_addr = -1;
+	p2wi->client_addr = -1;
 
 	/*
 	 * Authorize a p2wi node without any children to be able to use an
 	 * i2c-dev from userpace.
-	 * In this case the slave_addr is set to -1 and won't be checked when
+	 * In this case the client_addr is set to -1 and won't be checked when
 	 * launching a P2WI transfer.
 	 */
 	childnp = of_get_next_available_child(np, NULL);
 	if (childnp) {
-		ret = of_property_read_u32(childnp, "reg", &slave_addr);
+		ret = of_property_read_u32(childnp, "reg", &client_addr);
 		if (ret) {
-			dev_err(dev, "invalid slave address on node %pOF\n",
+			dev_err(dev, "invalid client address on node %pOF\n",
 				childnp);
 			return -EINVAL;
 		}
 
-		p2wi->slave_addr = slave_addr;
+		p2wi->client_addr = client_addr;
 	}
 
 	p2wi->regs = devm_platform_ioremap_resource(pdev, 0);
-- 
2.43.0


