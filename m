Return-Path: <linux-i2c+bounces-4921-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D20A92E78E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 13:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D5511C234C4
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 11:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B8F160884;
	Thu, 11 Jul 2024 11:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kZnnwCQ1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AA915FA92
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 11:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698754; cv=none; b=ORSuHl6/NPZit9wsCSemcJ9ht2QnqLQu2WBUAo4MQvIVaW0FX64QWQdW00Uw4CUQncpgogUDhl+klCB1cC14/wA4zKeTeq5qayrDpR3rnU180fdNjhaZkyRlKdsvP40IUlE+YInJ7m3oarO9eYdx5/XhkoY+VV+9xs3JJhxhwt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698754; c=relaxed/simple;
	bh=cPXyfY8A4cRvd7WlD2rFmAZL5qefIkhUKCpy7AquCHA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QrnvVXmxrTGD+JYWAh3QrNdcxOGKQ3uyWkwNDS1NXyPkauCEwZfvGuDNUTHiC1+lxN3F9u6K2fEHW8pcbwu50Z9PBp+JJ3IvKUuHBJ32sHb73Ucd++Oz12DCfSanzYBruu5dwMfAO8yHYauzaya8hBChoWcZ/BpOMNNJpruf4uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kZnnwCQ1; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52e9c6b5a62so848715e87.0
        for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 04:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720698751; x=1721303551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CaFuvPR51P5O/ySngpt3FZgNYinjREWQdgH0uqXR28=;
        b=kZnnwCQ1EF5sIAmOKgZbDZOanD2A09qurQNNCEwl7ptRjFRj2qBHxaA4IGYwgyWF1Z
         +Eyjii+204JnxoAhgA8G71xJEXF1MhDExjj5bG4aI3TiiF1KJU/B2BZ4OvU0Fb1mBM2X
         cdi+pCcufVoFHngy/DnrjTafP7DwNPJlbh83kV8p99rVtfCT1zy7IR/MrzZOfOUeWQXh
         vL4sANE34emnu/ADlqE39X9Ae4U8NAwWaDr6GdgWfMBDU5kuRCbHgmA1TEIbSq11wEke
         7LWFCwnpWE8zQWjy4ZbAYFFeuO/Wgi7dlKOBIvqn9f8IPLLCl2cyeQmj3J+en7+hByLR
         fUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720698751; x=1721303551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CaFuvPR51P5O/ySngpt3FZgNYinjREWQdgH0uqXR28=;
        b=werR8lfEt8py/4F0/Mp8wwrr3gsG5Bu802QUlHdQRHYGAeJ6yOkwPhwnPzfrEp/smM
         ejcSrdulhOc4mgUFRKKIyR1FD4j2PzxMt3ngnmc/AvXKIVSlpxOzR0b66LtN/JI7+Xlc
         nJkbJuMgwSuIdOZpyIgHi+QBBUqahio5rktZ8Y+Dtq2sztzgHTRo1MBjEz4y3+PlZYmY
         4PifmOoMPL2JAXg3lRjyOPaKyNSdIfIIPE6E2hhWbLQL7F4Xxz0OHLSQZ06Qyb4flRQq
         9+G273cbb0woatZ9zPssDrx24H/ZR3Z+1J8jRE757me56PSA4bNlyi60Oio0ySzO5rhH
         paUA==
X-Forwarded-Encrypted: i=1; AJvYcCXii4Q8ViZemOzZc+CSc4OavPWdq0RmRUK5l2oltKC0D+q0a068Dir/SSy9i1BBlLoSojRsAM7CxTSRlv7U8z67h4ZG+TfOQGcW
X-Gm-Message-State: AOJu0YwdaqUvPVcS5jg4E6FDUApOAIEXvFemwcRWf6qqzKfyJAsfMeMV
	adhtZrJp4aTBe9PE5VBOMmfHcOtvyfO4byKHUQwd1TtLerQaVgrk+r7yzLR6g4U=
X-Google-Smtp-Source: AGHT+IG9dg8Tuha70+0qdLaDyFcVJKMDe/+QCCnhVeLzIRtj/boW+WwZ3TRLfF40knZ97YHyI5H6Mw==
X-Received: by 2002:a05:6512:5d6:b0:52e:941d:7039 with SMTP id 2adb3069b0e04-52eb99d6c88mr4255844e87.59.1720698750518;
        Thu, 11 Jul 2024 04:52:30 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde891cesm7615728f8f.62.2024.07.11.04.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:52:30 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 06/11] i2c: riic: Define individual arrays to describe the register offsets
Date: Thu, 11 Jul 2024 14:52:02 +0300
Message-Id: <20240711115207.2843133-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v3:
- none

Changes in v2:
- none

 drivers/i2c/busses/i2c-riic.c | 58 +++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 27 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 5e4f56ee97e3..0019a8e56dbb 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -91,7 +91,7 @@ enum riic_reg_list {
 };
 
 struct riic_of_data {
-	u8 regs[RIIC_REG_END];
+	const u8 *regs;
 };
 
 struct riic_dev {
@@ -521,36 +521,40 @@ static void riic_i2c_remove(struct platform_device *pdev)
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


