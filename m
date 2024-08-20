Return-Path: <linux-i2c+bounces-5595-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 07562958423
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 12:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FF19B25680
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 10:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528FD18F2E0;
	Tue, 20 Aug 2024 10:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SKRB8aFJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEAB18EFEC
	for <linux-i2c@vger.kernel.org>; Tue, 20 Aug 2024 10:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149185; cv=none; b=KbU7+k2PwRRAn+4fYzKW/xFndEKeHEEWMZEIZw2wLqZXCpNYYQjRPYqLRqVme4dCxxZJf5Y/cJSIR5T8MMRDtO4vo0LWduqb8v03r6QNA5dFjsL3ECJlex6N9sgVz76JhXIwzjb6BTOpmJMXs/K4KtJhMnbAbWDFH32ffONgWhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149185; c=relaxed/simple;
	bh=KI03NXaMd1QC9VE9Z4VVaE0H506C/htfrmJvTUjjSHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OhiL2slvDLngIK33+FEFGsTXl0znGN/2XvaVvFdwnlGxdGU4iEq3I93DjrD6yU55fGIjT9c45Ir5tjrqmcrP9Ef1aAzPoaEgdIqY5e57jFIrz2fXv8wwbq40r5D7713uVQx48TXHRdX0UItDt/klP+1oOysgL94aiOLNw01Oies=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SKRB8aFJ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a83562f9be9so480247866b.0
        for <linux-i2c@vger.kernel.org>; Tue, 20 Aug 2024 03:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724149182; x=1724753982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=219c63JbxhJlvsmjhtmJRprxFDazu4TcqcxKlP/ynos=;
        b=SKRB8aFJF6prmhA9Cr4a1G8C3sFKKmxj5PMNxK/7LwKt7C4KKObSslMlQXp640xXbU
         9GYO2eIza68gQcd0z/+CMVIv5caMYIwHyIFtuNVbbmlprKSVb64+scb3mLK4s5HOT0JJ
         qKEdq1uodP8vOVEns0FDq/eJ8fqPzcCOjGKW5Wgk7Ek5TrnuceTy4u7B4QReH22494RX
         Ig5XVv+sbcmAMfG5CvNoMVnLMI/O0G8R0OI91Zwb3fzsl7TPYku0PBMG1/E65IIR2D+W
         V3umbj5Ww5FMMKWF8wePwTVuZO5hzHyvgUcErHNwyLRiccayIQAbgBMDwRyoDOiYpGXq
         WjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724149182; x=1724753982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=219c63JbxhJlvsmjhtmJRprxFDazu4TcqcxKlP/ynos=;
        b=mv3BkDMwwAtzw3oS0ATxmiMJx162haGkUVc441s/jclWfB8wt1IEgKRdvXiUG7NJRT
         tfb41keOySP0TgNSb4pnlfjdrubrAz8y12OQ6B1rBa45oLpsg6jJAIyAdyeT5KHjY8yI
         3RLqg5B4eVihMouP/0dz3NNqcmxLiMzpuL3BQcgcsT7IkBpHpTAayLO7q2uTkfHPGg0Y
         bm50vdE0tuRRQQZFDHiwVbADi5MPI8KnN7KThRUoydUsxuawaiwstn8LKqRUmDFGcMUV
         UF+G0q8DqUntkfHrp1fUzhtOYqus1dLG9aL9/OtlJewfRIsw0DWgSQef26RS+Y8N84GA
         PaDA==
X-Forwarded-Encrypted: i=1; AJvYcCUX4P++u2ADp/jm1qLhqLeDtdhFJLRKlb7ADYZKVjlslHi9YpfRH/YKFFhzLcaOMIzyNgk+qKkr4gTeVCRUZ46O/30pTv0yIRcV
X-Gm-Message-State: AOJu0Yyoqnp+P2Y4zxfMdb9+Y9lRCUNfU/behPpJxSNgC9N+cVNoA7Q6
	NW2Uvui8h69DKLZH6Oeo/EOB9l+qWuYKTtnWzmiT44nJVNzW7IrT4P9Z5JW32WU=
X-Google-Smtp-Source: AGHT+IE7gA6ysW6bEpwxOFRB6xikUMRG6dFr1SONaXIuUFoRYhenFe3YI2z2jpTk6Y6jiWJph9+30Q==
X-Received: by 2002:a17:907:e6a0:b0:a7a:9fe9:99e7 with SMTP id a640c23a62f3a-a8392955fdamr996588466b.41.1724149181778;
        Tue, 20 Aug 2024 03:19:41 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83839464ebsm734550066b.155.2024.08.20.03.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 03:19:41 -0700 (PDT)
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
Subject: [PATCH v5 08/11] i2c: riic: Add support for fast mode plus
Date: Tue, 20 Aug 2024 13:19:15 +0300
Message-Id: <20240820101918.2384635-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Fast mode plus is available on most of the IP variants that RIIC driver
is working with. The exception is (according to HW manuals of the SoCs
where this IP is available) the Renesas RZ/A1H. For this, patch
introduces the struct riic_of_data::fast_mode_plus.

Fast mode plus was tested on RZ/G3S, RZ/G2{L,UL,LC}, RZ/Five by
instantiating the RIIC frequency to 1MHz and issuing i2c reads on the
fast mode plus capable devices (and the i2c clock frequency was checked on
RZ/G3S).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- added local variable in riic_init_hw() to store the fast_mode_plus
  and used it all over the places
- align arguments of the 1st dev_err() in riic_init_hw() as suggested
  on review

Changes in v4:
- in riic_init_hw() checked t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ
  before applying hardware settings

Changes in v3:
- enabled FM+ for all riic_rz_a_info based platforms except RZ/A1H
  as requested in review comments; with this, dropped the riic_rz_g2_info
  and RZ/G2 specific compatibles in riic_i2c_dt_ids[];

  Note that it has been tested only on platforms mentioned in commit
  description (as I don't have all the other RZ/A platforms).

Changes in v2:
- dropped code that handles the renesas,riic-no-fast-mode-plus
- updated commit description

 drivers/i2c/busses/i2c-riic.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index f7293bf4b585..a6996f3c1711 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -63,6 +63,8 @@
 #define ICMR3_ACKWP	0x10
 #define ICMR3_ACKBT	0x08
 
+#define ICFER_FMPE	0x80
+
 #define ICIER_TIE	0x80
 #define ICIER_TEIE	0x40
 #define ICIER_RIE	0x20
@@ -80,6 +82,7 @@ enum riic_reg_list {
 	RIIC_ICCR2,
 	RIIC_ICMR1,
 	RIIC_ICMR3,
+	RIIC_ICFER,
 	RIIC_ICSER,
 	RIIC_ICIER,
 	RIIC_ICSR2,
@@ -92,6 +95,7 @@ enum riic_reg_list {
 
 struct riic_of_data {
 	const u8 *regs;
+	bool fast_mode_plus;
 };
 
 struct riic_dev {
@@ -311,11 +315,15 @@ static int riic_init_hw(struct riic_dev *riic)
 	int total_ticks, cks, brl, brh;
 	struct i2c_timings *t = &riic->i2c_t;
 	struct device *dev = riic->adapter.dev.parent;
+	bool fast_mode_plus = riic->info->fast_mode_plus;
 
-	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
+	if ((!fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) ||
+	    (fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)) {
 		dev_err(&riic->adapter.dev,
 			"unsupported bus speed (%dHz). %d max\n",
-			t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ);
+			t->bus_freq_hz,
+			fast_mode_plus ? I2C_MAX_FAST_MODE_PLUS_FREQ :
+					 I2C_MAX_FAST_MODE_FREQ);
 		return -EINVAL;
 	}
 
@@ -401,6 +409,9 @@ static int riic_init_hw(struct riic_dev *riic)
 	riic_writeb(riic, 0, RIIC_ICSER);
 	riic_writeb(riic, ICMR3_ACKWP | ICMR3_RDRFS, RIIC_ICMR3);
 
+	if (fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ)
+		riic_clear_set_bit(riic, 0, ICFER_FMPE, RIIC_ICFER);
+
 	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
 
 	pm_runtime_mark_last_busy(dev);
@@ -527,6 +538,7 @@ static const u8 riic_rz_a_regs[RIIC_REG_END] = {
 	[RIIC_ICCR2] = 0x04,
 	[RIIC_ICMR1] = 0x08,
 	[RIIC_ICMR3] = 0x10,
+	[RIIC_ICFER] = 0x14,
 	[RIIC_ICSER] = 0x18,
 	[RIIC_ICIER] = 0x1c,
 	[RIIC_ICSR2] = 0x24,
@@ -538,6 +550,11 @@ static const u8 riic_rz_a_regs[RIIC_REG_END] = {
 
 static const struct riic_of_data riic_rz_a_info = {
 	.regs = riic_rz_a_regs,
+	.fast_mode_plus = true,
+};
+
+static const struct riic_of_data riic_rz_a1h_info = {
+	.regs = riic_rz_a_regs,
 };
 
 static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
@@ -545,6 +562,7 @@ static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
 	[RIIC_ICCR2] = 0x01,
 	[RIIC_ICMR1] = 0x02,
 	[RIIC_ICMR3] = 0x04,
+	[RIIC_ICFER] = 0x05,
 	[RIIC_ICSER] = 0x06,
 	[RIIC_ICIER] = 0x07,
 	[RIIC_ICSR2] = 0x09,
@@ -556,6 +574,7 @@ static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
 
 static const struct riic_of_data riic_rz_v2h_info = {
 	.regs = riic_rz_v2h_regs,
+	.fast_mode_plus = true,
 };
 
 static int riic_i2c_suspend(struct device *dev)
@@ -609,6 +628,7 @@ static const struct dev_pm_ops riic_i2c_pm_ops = {
 
 static const struct of_device_id riic_i2c_dt_ids[] = {
 	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
+	{ .compatible = "renesas,riic-r7s72100", .data =  &riic_rz_a1h_info, },
 	{ .compatible = "renesas,riic-r9a09g057", .data = &riic_rz_v2h_info },
 	{ /* Sentinel */ },
 };
-- 
2.39.2


