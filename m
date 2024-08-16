Return-Path: <linux-i2c+bounces-5460-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A411954D63
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 17:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 242D61F23239
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 15:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BC81BD013;
	Fri, 16 Aug 2024 15:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s0aSfQci"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A63C817
	for <linux-i2c@vger.kernel.org>; Fri, 16 Aug 2024 15:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723821228; cv=none; b=Y9xVU+IWi5l7ep6ZaHZV9eKHYBT2YlPYNtAzztXu3ZVY9mgyWPHigsV7aMHbAcTnlyn2fmTh5kuaSPbDxtGjo3Q2jFGbsQ8Zo+IZPefaTlVzdf5J+sqsOjVsh2ruz3+TBZXybl5PFVBkWvRV1se1x158oz55CMOREFrAh7wTk5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723821228; c=relaxed/simple;
	bh=XdX9TFTmAztBFpprLFXuMb8FszwPT5OGoKC3R6HmiE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D8SrVzC7Nq6ZmVj6BSTDUOxsNVxIzCgwDBKLtjP0FaK7lr+EII8kQNH5TaXP8j+0zpKa0g9gXMiUA9GxBJjh8kteDHWFQpUHGnWeX8F03KpFFXvJQ4Pe0yS3pFk9Jl+YexB+gX+QXPEMhUmFs32XOQrE347d573ocbV8z7zpAa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s0aSfQci; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f136e23229so22530811fa.1
        for <linux-i2c@vger.kernel.org>; Fri, 16 Aug 2024 08:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723821224; x=1724426024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ss5iRyP+GViMYSXSV6/9YpYWRY4hwPc+O4Zp1rAHqvE=;
        b=s0aSfQci58PxvrSQy152ZVpO+6OOIon7eZLJssFRxBXFdRwKwrgkW/AbJuC9cqNw5D
         fTnRaHHzN3zWDBZDMyiLawaDlU/1cmVtVbo1rfoJ+HCPndXdu+C9LGAUgnXDpa1CM8PU
         m9SzDCveqnGnX833dDvpFu0o8phFQlStarXAEX/2mVHxp55FbmMTMg7+kMoer/e+4kGO
         TRyW8eVF1L8mMKW55vo6E6sfOEZk2bHAQbAlFPyIm+8LMnyZNGmQc+vXWrMWHD3WO+/4
         aLZXUDWamPLZiaUEO8RjEnSWsdcMFNKB3vIsuSGmwutHTAzJ7GBAuWoBfnbAgBZG347b
         /YVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723821224; x=1724426024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ss5iRyP+GViMYSXSV6/9YpYWRY4hwPc+O4Zp1rAHqvE=;
        b=DRHG+SgZ+ksIOrgOIHVoZ2XUbe1FFcRReNsiuM3xvY4I8S/vrhvBDoSihG5G0vyghW
         VDIui8OJiPZjfs6PMrAEkKaLNb338NVTDLSzGMh+5/gdOViWyftte+2w17WznhuFQ/pI
         4ldAy67R1+ZmV4vLR/8f0zQdgiSdh+pZg6iKB7vuCrWpbPjJzkNGYK03mzw21G5FOCOC
         LSO4/VX+h2rC//b1JbFQacOHXeCrG1eLjTBifiOWfo73diVUrSRfNFSCIGM2uMU9uRni
         /dSVUITRNqUcObCBp3Jt6W9CzWM7NoBDgQBtx7AnWfg2RzYuireRDibk44Yct1LFSGTh
         yf1A==
X-Forwarded-Encrypted: i=1; AJvYcCUiCR6yChyA6SniKLWAvkK7dWOHu0Z0yo5hDzEoqZAhFxX1xyvqeD2istDfpuBPVd7/Jnqa57K8cCbfd1hUnU0Junv36sOp8ywq
X-Gm-Message-State: AOJu0YyL2kn/japQeScpqePovHklH7k6YO86MMX8k+EmCepchbE8Yz0E
	3z5qRaRxCqXHYZgrl7fLI5mP/Yncpq04ra2s/aQQ3m1zlezgRH+72iPbb9nIhNA=
X-Google-Smtp-Source: AGHT+IENaJHmCWMCAiFDXiDCFYY5vetxC5fst5EKVjwRV83jh6OIzG2gQxGx/vK6egR/TndNLUxLUQ==
X-Received: by 2002:a2e:a990:0:b0:2ef:23ec:9357 with SMTP id 38308e7fff4ca-2f3be3df688mr30264741fa.0.1723821224246;
        Fri, 16 Aug 2024 08:13:44 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed649019sm25425415e9.8.2024.08.16.08.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:13:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] i2c: simplify with scoped for each OF child loop
Date: Fri, 16 Aug 2024 17:13:40 +0200
Message-ID: <20240816151340.154939-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/i2c-core-slave.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-slave.c b/drivers/i2c/i2c-core-slave.c
index e3765e12f93b..faefe1dfa8e5 100644
--- a/drivers/i2c/i2c-core-slave.c
+++ b/drivers/i2c/i2c-core-slave.c
@@ -109,15 +109,12 @@ EXPORT_SYMBOL_GPL(i2c_slave_event);
 bool i2c_detect_slave_mode(struct device *dev)
 {
 	if (IS_BUILTIN(CONFIG_OF) && dev->of_node) {
-		struct device_node *child;
 		u32 reg;
 
-		for_each_child_of_node(dev->of_node, child) {
+		for_each_child_of_node_scoped(dev->of_node, child) {
 			of_property_read_u32(child, "reg", &reg);
-			if (reg & I2C_OWN_SLAVE_ADDRESS) {
-				of_node_put(child);
+			if (reg & I2C_OWN_SLAVE_ADDRESS)
 				return true;
-			}
 		}
 	} else if (IS_BUILTIN(CONFIG_ACPI) && ACPI_HANDLE(dev)) {
 		dev_dbg(dev, "ACPI slave is not supported yet\n");
-- 
2.43.0


