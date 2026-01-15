Return-Path: <linux-i2c+bounces-15171-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F2ED21DBD
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 01:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D4E330422B9
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 00:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5851684BE;
	Thu, 15 Jan 2026 00:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="XREXSqb0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89DF149C7B
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 00:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768436949; cv=none; b=FVWP3qgjmPqtM821MAWxWxMVNbQnP0fpm+uwQqqPIC4lStckQ+1TYavqWOvqaywfiYcRqfKz+tU8qwpoor6csO466NvT9kClyKiJF76azL4rA47KlJYJTSrskEigFL3gaLv/xMBl+0AlLGNJZLN/9JiryHvhwUHSNf0H6LfkYcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768436949; c=relaxed/simple;
	bh=eXLLDGlYmh8WUQK7xV15hxAZ2PuvSMmnIg2Y3TIgCLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YNrHE0SI/Mqo7hqiFKB/lgohfdAds1bPbBAFqDQ2tdrGYX+4d4ZJR9zsA1MpKdTSOhv02jeXRBDIEflTML88PfGMdIwFo6wtidDrkRvQM1xRhACPNwyKvfstPaTQFzzuaeMcsm97ikHQ/EuMvylOPe1EYvIsUlL2soxaoLb/YcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=XREXSqb0; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-11f42e97229so765180c88.0
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 16:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768436947; x=1769041747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=roN4NcJtuzGWonO7OQ8fdkqgHT0peC+VlYJ/zBMgNDM=;
        b=XREXSqb060wNnFPri1GlOO6A+UdKdaQqSP9FmJW8YZPQb5lQIBPF3TqwLpIxOFnC48
         9kS+StUFr7l3jJWMt3jB0lWl3FfrgBrYnO4xL5UMVZA9REkD1udhFAiriEt4lS/+uEGA
         2R32FjhngyINmtMsXLGvBVy7Ua6CZ0VBXtTosLDQ9nQrQp/8YFIvLHS2jMKTrqbZe2SB
         F3u+QseXeNC3+jOcf0k+AJf4jl+JEW/Um6VdvL6xnBZX6iBA94JLaoO4XHg6wKwDo/qC
         z3itP7zGVsYvZmUktYnqy07ihJpGbExvv1o8nuZR0lzpsY72pz9yqXJA1T+v5r9zc2Uy
         w1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768436947; x=1769041747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roN4NcJtuzGWonO7OQ8fdkqgHT0peC+VlYJ/zBMgNDM=;
        b=ZZD1DKSIknhqD0mEdI5N+GAc6nqKzHv4i/WMLOVwHKHTaF5V+z947y6SbbZbSOKrCm
         TasaFm0lSExajOVQXBARGLgzCn+dhl+4XdC2CtuOegdVLEyI8izDfDjCbPcYCslzMpYf
         Ox4TQUe0BKrMPnKRBveRG1+dkacyT1oteueiCZzBJhmJ/nhqcEFrfzIik8KEMT4qQ1bp
         UvW0oHQ5TDWAVZw+WHnrtQ3B2kJtYaddpAFKRwP9qR3GytYYu2sVRyADRqzmXVOuXCqt
         Y57GxwERbj1pYaMoprVjJcxfMJhetPim9KNiUvt32bC0aj39Y7CkEkt8eGNenNNm8JYr
         x3mA==
X-Forwarded-Encrypted: i=1; AJvYcCWYfYugOX/LICErE5l3jPUfZ2RnQOrX+SjICvkYl3FQ6BAEAla4AXe/mqIAXoG+QiY1/TxfWuIwZkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YztrPDizRvBnUvR99F/8jBshmG0vErhfR3oXpjUIiw5PqFUdNtO
	sD6DxCTN244ks8lLxmKxkoLbF8BsII9+La3TlxcXZ47do00J4ge6tKrPPVjCZAbF51U=
X-Gm-Gg: AY/fxX6z3BYjsbrN8JIYwc+rBbGqG+zAHO5SdFSt4HxWgALRJ+JGNlN04amO79EP7Ep
	osaSpIuZICle6zcqptOqgoluNaSDyItC0LC3NiiOm3wsEkfu6CUXfieBEta5gWVKnlBG0O3qQb2
	4Cgt6Kh22QQzKzCvApoaJifw59pXeV6bGR90O1JMhFeSIlW+zwgiNBp9lbO8+XDMRhhRtxkqUjK
	hundtCSlJSOUAZJWD2Dj3cJyO0pPNzVHnsJ4B9dvBldAhFde6gjOH+uOZgmDBv375/2TT7wXKOr
	EMEmqYs4PFyeZOCbbkuXs2T+nl5DMwr0ZXHa2aGNjm7f7auHYlW3TCyEIxCYZbZJegdW3SuFCLe
	ToMkTmREES/Qk5EU6H+Tu1wgJ38deyHl07mmZ9Qy105Qx12G/tla+NL9165dVOiC2HT4PMUcAKh
	nd7lT5RzUSBPP3L7MmC0LVyA==
X-Received: by 2002:a05:7022:660a:b0:11b:ceee:b78a with SMTP id a92af1059eb24-12336a64fcdmr4929101c88.19.1768436946763;
        Wed, 14 Jan 2026 16:29:06 -0800 (PST)
Received: from localhost ([50.145.100.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12331d95110sm4462526c88.8.2026.01.14.16.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 16:29:06 -0800 (PST)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH] i2c: xiic: add ACPI support
Date: Thu, 15 Jan 2026 00:28:46 +0000
Message-ID: <20260115002846.25389-1-abdurrahman@nexthop.ai>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use generic device property accessors.
Make the clock optional assuming it's managed by firmware.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 28015d77599d..ee4731570977 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1408,7 +1408,6 @@ static const struct i2c_adapter xiic_adapter = {
 	.algo = &xiic_algorithm,
 };
 
-#if defined(CONFIG_OF)
 static const struct xiic_version_data xiic_2_00 = {
 	.quirks = DYNAMIC_MODE_READ_BROKEN_BIT,
 };
@@ -1419,13 +1418,12 @@ static const struct of_device_id xiic_of_match[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, xiic_of_match);
-#endif
 
 static int xiic_i2c_probe(struct platform_device *pdev)
 {
 	struct xiic_i2c *i2c;
 	struct xiic_i2c_platform_data *pdata;
-	const struct of_device_id *match;
+	const struct xiic_version_data *data;
 	struct resource *res;
 	int ret, irq;
 	u8 i;
@@ -1435,12 +1433,9 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (!i2c)
 		return -ENOMEM;
 
-	match = of_match_node(xiic_of_match, pdev->dev.of_node);
-	if (match && match->data) {
-		const struct xiic_version_data *data = match->data;
-
+	data = device_get_match_data(&pdev->dev);
+	if (data)
 		i2c->quirks = data->quirks;
-	}
 
 	i2c->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2c->base))
@@ -1458,13 +1453,14 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	i2c_set_adapdata(&i2c->adap, i2c);
 	i2c->adap.dev.parent = &pdev->dev;
 	i2c->adap.dev.of_node = pdev->dev.of_node;
+	ACPI_COMPANION_SET(&i2c->adap.dev, ACPI_COMPANION(&pdev->dev));
 	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
 		 DRIVER_NAME " %s", pdev->name);
 
 	mutex_init(&i2c->lock);
 	spin_lock_init(&i2c->atomic_lock);
 
-	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	i2c->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
 	if (IS_ERR(i2c->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
 				     "failed to enable input clock.\n");
@@ -1477,8 +1473,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	/* SCL frequency configuration */
 	i2c->input_clk = clk_get_rate(i2c->clk);
-	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
-				   &i2c->i2c_clk);
+	ret = device_property_read_u32(&pdev->dev, "clock-frequency",
+				       &i2c->i2c_clk);
 	/* If clock-frequency not specified in DT, do not configure in SW */
 	if (ret || i2c->i2c_clk > I2C_MAX_FAST_MODE_PLUS_FREQ)
 		i2c->i2c_clk = 0;
@@ -1493,7 +1489,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	}
 
 	i2c->singlemaster =
-		of_property_read_bool(pdev->dev.of_node, "single-master");
+		device_property_read_bool(&pdev->dev, "single-master");
 
 	/*
 	 * Detect endianness
-- 
2.52.0


