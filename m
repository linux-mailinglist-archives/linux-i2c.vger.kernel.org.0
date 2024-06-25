Return-Path: <linux-i2c+bounces-4338-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A496E916745
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 14:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C843C1C24001
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 12:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6629216A39E;
	Tue, 25 Jun 2024 12:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NXKZWhsM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B6A166314
	for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 12:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719317676; cv=none; b=ciePlqBqbL6tlc4nvofJaX0iJ9T2RK/8ke/dKDVrqy88lgAUCYKpxElLak5ikNbTGMKs7aZIWf7IhtyN9Nb3vijqUMAD+k2onF0JW3ljdjVuzJWb+KjZ6sh2fyMiPF36WStlQuNhlSurSe1CAdnE2GNq+3Ybq8TKVbqg5pIOvOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719317676; c=relaxed/simple;
	bh=rr0lgEBLkmAXsCiSlTXgBt/no/AR92gtWozf/BUgBJw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qfRQ3xBEBvt3m1yv8+MAuIP9Cq2ptIhYlE7Rfl7Ks8gLScrqmtK0DoDpLyst+MIUjTENc4YEpBi7oWFnoxomh5YtrPU5vpVNPhLPNrDx16j/31ZfPQalPQJJThG1UVDagw8tFP5UbAeNa2u1PiMiNiUas0FEvz8Rz2StOv886FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NXKZWhsM; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so88195201fa.0
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 05:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719317673; x=1719922473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRze9YXE4oJAbB9LOUs5rXXSGUTHGLWP5SsCaSBey6I=;
        b=NXKZWhsMkBX+r41JCgIibsEt0XCPB0VF1BUBzoNT+cMOg9P34C8EzT4Ty1BoZXsPd0
         wZfUimoGclnxxklgNI5O64ifYjSv/wWX+B0RFFQxQy16BHIIAp21XtlCYco90vKu0dyB
         j/VrmJBgRgIqK8vAkZgeRHgNZp5TzQHUrIaKtik+jiC18i6/cImARZ5Or5MYXELD+nVF
         fMpgVmebrnQP3xki+nrLmQVS05biBZgUgQs7QkQaT6rs9h22F831rtrNdeCHIvRIZEJ5
         B8z/rLyVDdN4FaNPvqD9yIg54ZFOgPZ4W15McU9XFTFe469mqLiQdchpr5RiDzXDEZUC
         CZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719317673; x=1719922473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRze9YXE4oJAbB9LOUs5rXXSGUTHGLWP5SsCaSBey6I=;
        b=T1bBV71hV+sOj3shun6Cx/l/M7d7xhYnEXXaeVzws9JcC3bu042jxmBEnfl73fMQbz
         GgvbALlgOFPCdo5bc2yqqHWL2hWE2qlXP09H0DkJISYBlaa+h4s9y7q4rBbTZVVlbKtN
         du1yn3So8N043LwIdQKBWKpboZf9jju9lLx/+oLNjqUGIDfi+W+l1lAh44juxC99gUqe
         2GFdBmuZpZZA0+zh3lSlxvoZH+3Mh5/35coXGwm/mesjg57HzF1SmdBnHGqXRk4ijVrS
         Lq0RiK6mZM7qv2+KDCxiV7Jcuxphbs+jgJaJuXbdWyakUwx47xbjPOx/mk2rwxnRQl6M
         j0NA==
X-Forwarded-Encrypted: i=1; AJvYcCV7I334VF9Yjl//yFJPxk/oT/nv1rHPWBmUnl67Uf1SCKR9vDIE7/Ksax5xahqhye/eyyiA+owT9QarC26aUqDb9d5jxOR8R/zA
X-Gm-Message-State: AOJu0YzCHbiIRpo9l2UyJfbJ2MzeCXNJCTIYUPYI0goWAU8X8tOFqU2U
	zKGRcThD2mfvMYj6phEFAHMLZ6YOypCIsaSt5sYwB/sthWuUIu8qGfgOq8vbb0E=
X-Google-Smtp-Source: AGHT+IGYT+z595GKvgUGt9vUUVbcDQtV2IC7YkMuRBlJD2y/+YjkQ2HgvlUA0wAqAKIBNsXZdL+8HA==
X-Received: by 2002:a2e:994f:0:b0:2ec:541b:4b3d with SMTP id 38308e7fff4ca-2ec5b31d5e4mr52153491fa.41.1719317672811;
        Tue, 25 Jun 2024 05:14:32 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8b32sm12798437f8f.92.2024.06.25.05.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:14:32 -0700 (PDT)
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
Subject: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe the register offsets
Date: Tue, 25 Jun 2024 15:13:53 +0300
Message-Id: <20240625121358.590547-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v2:
- none

 drivers/i2c/busses/i2c-riic.c | 58 +++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 27 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 9fe007609076..8ffbead95492 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -91,7 +91,7 @@ enum riic_reg_list {
 };
 
 struct riic_of_data {
-	u8 regs[RIIC_REG_END];
+	const u8 *regs;
 };
 
 struct riic_dev {
@@ -531,36 +531,40 @@ static void riic_i2c_remove(struct platform_device *pdev)
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


