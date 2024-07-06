Return-Path: <linux-i2c+bounces-4715-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9789F929332
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52B09281C5E
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FF417622A;
	Sat,  6 Jul 2024 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cvNR0uhY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E60A16D30B
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264937; cv=none; b=WT8X2GLoleDKnYy18MgSBDCTlHrOwWYmZEe3G1ZKFqPKce325alliu2B0DD78tCGPkDCztA/qw3vAZHeFOT8QXNPJqvqkajsO+WUspiyJvVffRMdphW3srzUOyMyp/1CSUvTNNo1n1tvQWBlzq5bZJa2qz5HzfcxL1fbnH6N1Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264937; c=relaxed/simple;
	bh=piYNfirvyvUfVGJpwWM2pBJIFdgHNDAvd7DaSUMEABo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e6tV0NiKJt0Kr8fwxnqCxNYTiMD18yXz9Zi53IKciogo+ypAmKagiWHdONNketCi23R2/zRrFqFRJgZdb3lcLDnhsWChDhhKQsY20kUscyaT1fhGHnw0CycwoSvrzP5h8L136nrBvUpDSo9g7mnIF2/SiKNcXuXpIDcpzI6gLrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cvNR0uhY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=bI3IPaPgeZwq3XbmFqqNETyD88lvDgDpAuhZWxBVAU0=; b=cvNR0u
	hYhMOldgrg1u1peLHJ6B1wVZGcNJdum/1PSgwf5eaQkyRvypgqPDF4N75rXtYPW+
	T6fpS55oOfdY1ya94qAQGckW125xTDa+KAuDsU8XdpilTVJJvViNQtkaIeLqoNO6
	g3YFzH1IWTPrjm7GWZQdbO8b4FKAyYzjAmjiKAmX7iYHEAI2xy6S2etS+AoqpmI9
	duZCH3sfJOdIQDLFATtIcSeNfKvBSyYDaU0XH7gTd/8tbtDsKUQ7Wxm1aZbESos2
	l5kLplvpBEcxzXcIhi8lA+pdqpBhZ6NIaPDphNkhmgTRw2YssTA7tJddVSLQ2NO4
	w4YSk1J4F2hFKUJg==
Received: (qmail 3810933 invoked from network); 6 Jul 2024 13:21:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:56 +0200
X-UD-Smtp-Session: l3s3148p1@KA49Y5IcWuFQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 48/60] i2c: sun6i-p2wi: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:48 +0200
Message-ID: <20240706112116.24543-49-wsa+renesas@sang-engineering.com>
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

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index 85e035e7a1d7..074eade6c4a4 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -10,7 +10,7 @@
  * The P2WI controller looks like an SMBus controller which only supports byte
  * data transfers. But, it differs from standard SMBus protocol on several
  * aspects:
- * - it supports only one slave device, and thus drop the address field
+ * - it supports only one target device, and thus drop the address field
  * - it adds a parity bit every 8bits of data
  * - only one read access is required to read a byte (instead of a write
  *   followed by a read access in standard SMBus protocol)
@@ -88,7 +88,7 @@ struct p2wi {
 	void __iomem *regs;
 	struct clk *clk;
 	struct reset_control *rstc;
-	int slave_addr;
+	int target_addr;
 };
 
 static irqreturn_t p2wi_interrupt(int irq, void *dev_id)
@@ -121,7 +121,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	struct p2wi *p2wi = i2c_get_adapdata(adap);
 	unsigned long dlen = P2WI_DLEN_DATA_LENGTH(1);
 
-	if (p2wi->slave_addr >= 0 && addr != p2wi->slave_addr) {
+	if (p2wi->target_addr >= 0 && addr != p2wi->target_addr) {
 		dev_err(&adap->dev, "invalid P2WI address\n");
 		return -EINVAL;
 	}
@@ -188,7 +188,7 @@ static int p2wi_probe(struct platform_device *pdev)
 	unsigned long parent_clk_freq;
 	u32 clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
 	struct p2wi *p2wi;
-	u32 slave_addr;
+	u32 target_addr;
 	int clk_div;
 	int irq;
 	int ret;
@@ -207,7 +207,7 @@ static int p2wi_probe(struct platform_device *pdev)
 	}
 
 	if (of_get_child_count(np) > 1) {
-		dev_err(dev, "P2WI only supports one slave device\n");
+		dev_err(dev, "P2WI only supports one target device\n");
 		return -EINVAL;
 	}
 
@@ -215,24 +215,24 @@ static int p2wi_probe(struct platform_device *pdev)
 	if (!p2wi)
 		return -ENOMEM;
 
-	p2wi->slave_addr = -1;
+	p2wi->target_addr = -1;
 
 	/*
 	 * Authorize a p2wi node without any children to be able to use an
 	 * i2c-dev from userpace.
-	 * In this case the slave_addr is set to -1 and won't be checked when
+	 * In this case the target_addr is set to -1 and won't be checked when
 	 * launching a P2WI transfer.
 	 */
 	childnp = of_get_next_available_child(np, NULL);
 	if (childnp) {
-		ret = of_property_read_u32(childnp, "reg", &slave_addr);
+		ret = of_property_read_u32(childnp, "reg", &target_addr);
 		if (ret) {
-			dev_err(dev, "invalid slave address on node %pOF\n",
+			dev_err(dev, "invalid target address on node %pOF\n",
 				childnp);
 			return -EINVAL;
 		}
 
-		p2wi->slave_addr = slave_addr;
+		p2wi->target_addr = target_addr;
 	}
 
 	p2wi->regs = devm_platform_ioremap_resource(pdev, 0);
-- 
2.43.0


