Return-Path: <linux-i2c+bounces-4187-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F08F912360
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 13:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54D632870F8
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 11:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92942176FB2;
	Fri, 21 Jun 2024 11:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OfOAIeJ5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED13176FB3
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 11:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718969013; cv=none; b=j2UbRl4G6xK9QGvRp6Sm2wGQ8Um2chSdfz0V9NWWEfiuhPx74PSooORwCsfSf3VSjEUgVkoRpWebTLfDm08GNamzWTVcHZAr6PfUxXnlpWGgaaZXG0FEn92n5V+P8fL+t1KU1LuctybQrgzMh/CnyDUsRpVQtB3hLaSsnhgfB4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718969013; c=relaxed/simple;
	bh=RfYez9u5Ak2SMIO0DEHAa2+9k5wdFaN5G9kzhpx8cZo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nAu8XFdT4upQ0hU81qCEENwgB5wVWWroQUxThl9qft6LfWRO9qt+iPcYlIielQtPCXfcNFsBXYu5NLEaqWvaT2ULHLXKTrJdlqTYrhlRWyLSM/WXrybycsq99FScKGgcRUuVPV2c/BoEuz9+fp0GRpH3FWhXz0LXyoGmi34M/9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OfOAIeJ5; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6f9fe791f8so312937366b.0
        for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 04:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718969010; x=1719573810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPhmKh5jKgJmuUvvPetSNlsnz5DPCDUj94A1k27txko=;
        b=OfOAIeJ5F+54whmteMS9xrDZDP7rZV5fI9cAb6a4Jn6AbUzHX9Jqqy1pXUXoWuY8U2
         hennh1NLa2fGRyK3jRmFH+Bh1mMNKrpFlZErJxEzkjcWufrh8vP50IUfmAUHo1AVJ0vm
         ryGWXbH8+D7iuyUQw9wLDDb6Q7uNbarDpByElsVTp3KcQF8sXIBsB6TEmk4evkaUGPeo
         Z3JNY1voMdaUfRad7KQdkV5ReTUmjV92rk1Ewt7cwaHYt0sT/+Yf3Kb/MR0FDQubkqyV
         yWM/pbQjwlfal6KoO2TC9FTYi+pOdfJyet59hNAULGXIpS3Qm2Iqfu1AJqUlAIo2NYOA
         a/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969010; x=1719573810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kPhmKh5jKgJmuUvvPetSNlsnz5DPCDUj94A1k27txko=;
        b=eA9dyfVOMP0uYrX5D3ASbdy0DTamObU1K1ztpjpag0m/XQxj52iV1BygM0Jrl8Jhov
         NtX/weO3XbJz87BsYQK+uC6Si1eCmQQ94p54az62LTPE1IXw7CULlD+jPbBPSBnvpyRW
         Au0ZfyqT8N79XWuQIFSPblGB3kSJ2vSpOtD/AbXAQa68QkXMRpAZx9dHQnKzvod2k7K+
         V4/aC/S3t5AyfwMNryLxysUw4PSZd1Hhx1crSau5ymy5YTkIt4BjdYrRn+VA4izTq9xD
         BobEimpIgn/m69vIyXydMTjBOQtwKGNbq6WKech779yMwnNLs8ljVAW6Mg3EUK7ENAyc
         xzFA==
X-Forwarded-Encrypted: i=1; AJvYcCVVk+wqYQKtZkHNA3cZog9eYgL1d0lYvqbIiYV3vLmMHSt75qy6xoNcqhXPI1/AkRDO+EHKOINyI7/LF5O1sp7RLY7VDPBexjy/
X-Gm-Message-State: AOJu0Yxs/RprHGht5Khb7uzh5tdkkm3Y1xHfuH4M4gnP3y+sYquk2JVd
	8vGc1cXC5l0LPYiTMCQsxXgtRMqrlezsHuaayu5gXRyYSxWZccfnzU5yF/Y/SYc=
X-Google-Smtp-Source: AGHT+IHBTxiQrf0wAKOR2ezweJqHlvILVoM5bIbyJNw7cBRiSN/Ej9U9o9S0APKYUNMc2fthSYB+Pw==
X-Received: by 2002:a17:906:b318:b0:a6f:259d:9a5f with SMTP id a640c23a62f3a-a6f9508e83cmr703320166b.35.1718969010055;
        Fri, 21 Jun 2024 04:23:30 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fd0838345sm64498466b.99.2024.06.21.04.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:23:29 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 07/12] i2c: riic: Define individual arrays to describe the register offsets
Date: Fri, 21 Jun 2024 14:22:58 +0300
Message-Id: <20240621112303.1607621-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Define individual arrays to describe the register offsets. In this way
we can describe different IP variants that share the same register offsets
but have differences in other characteristics. Commit prepares for the
addition of fast mode plus.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 58 +++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 27 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index f9b9e92570d8..46070f323810 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -91,7 +91,7 @@ enum riic_reg_list {
 };
 
 struct riic_of_data {
-	u8 regs[RIIC_REG_END];
+	const u8 *regs;
 };
 
 struct riic_dev {
@@ -530,36 +530,40 @@ static void riic_i2c_remove(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(dev);
 }
 
+static const u8 riic_rz_a_regs[RIIC_REG_END] = {
+	[RIIC_ICCR1] = 0x00,
+	[RIIC_ICCR2] = 0x04,
+	[RIIC_ICMR1] = 0x08,
+	[RIIC_ICMR3] = 0x10,
+	[RIIC_ICSER] = 0x18,
+	[RIIC_ICIER] = 0x1c,
+	[RIIC_ICSR2] = 0x24,
+	[RIIC_ICBRL] = 0x34,
+	[RIIC_ICBRH] = 0x38,
+	[RIIC_ICDRT] = 0x3c,
+	[RIIC_ICDRR] = 0x40,
+};
+
 static const struct riic_of_data riic_rz_a_info = {
-	.regs = {
-		[RIIC_ICCR1] = 0x00,
-		[RIIC_ICCR2] = 0x04,
-		[RIIC_ICMR1] = 0x08,
-		[RIIC_ICMR3] = 0x10,
-		[RIIC_ICSER] = 0x18,
-		[RIIC_ICIER] = 0x1c,
-		[RIIC_ICSR2] = 0x24,
-		[RIIC_ICBRL] = 0x34,
-		[RIIC_ICBRH] = 0x38,
-		[RIIC_ICDRT] = 0x3c,
-		[RIIC_ICDRR] = 0x40,
-	},
+	.regs = riic_rz_a_regs,
+};
+
+static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
+	[RIIC_ICCR1] = 0x00,
+	[RIIC_ICCR2] = 0x01,
+	[RIIC_ICMR1] = 0x02,
+	[RIIC_ICMR3] = 0x04,
+	[RIIC_ICSER] = 0x06,
+	[RIIC_ICIER] = 0x07,
+	[RIIC_ICSR2] = 0x09,
+	[RIIC_ICBRL] = 0x10,
+	[RIIC_ICBRH] = 0x11,
+	[RIIC_ICDRT] = 0x12,
+	[RIIC_ICDRR] = 0x13,
 };
 
 static const struct riic_of_data riic_rz_v2h_info = {
-	.regs = {
-		[RIIC_ICCR1] = 0x00,
-		[RIIC_ICCR2] = 0x01,
-		[RIIC_ICMR1] = 0x02,
-		[RIIC_ICMR3] = 0x04,
-		[RIIC_ICSER] = 0x06,
-		[RIIC_ICIER] = 0x07,
-		[RIIC_ICSR2] = 0x09,
-		[RIIC_ICBRL] = 0x10,
-		[RIIC_ICBRH] = 0x11,
-		[RIIC_ICDRT] = 0x12,
-		[RIIC_ICDRR] = 0x13,
-	},
+	.regs = riic_rz_v2h_regs,
 };
 
 static int riic_i2c_suspend(struct device *dev)
-- 
2.39.2


