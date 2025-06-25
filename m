Return-Path: <linux-i2c+bounces-11582-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF57CAE801C
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 12:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0A33166349
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 10:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96E22DCBE3;
	Wed, 25 Jun 2025 10:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqrmozRI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33742DAFAD;
	Wed, 25 Jun 2025 10:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848345; cv=none; b=PWk/1WQRiuWD5IQZzzZxS9p6KVIxZGADFki1Vrc7mNqxwRjVr4t2aP24V7u3nXYtarButzKNaL/otR1vUr/WsmpouF/LkuutmvMoyyJpaf6wKvZmhxlDQkAd7J3hu1RPjCSuk0Q/YBOn7iirdxqYWtY09aEjiulusX4QSM8Wrqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848345; c=relaxed/simple;
	bh=qdP/GNG9ynrq763FP3QFBIjwWpwvoFqtkVSEzaOB3lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a8czfRxzaaLSr+2rpkucoTwZOEel+JgPw8glRrevBDXVrln4PxY+G7aTjj8kvbejhgVzGZgl+lnAEkw0iqvZWs4rgs+u32h5YGlcJCjV/R5huyaLPj6ipV0qHltpSdoCp0LpzZVdmB0B0iwFKyDLkqcMe0WU5z+YQZotv89aI7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqrmozRI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so10674775e9.1;
        Wed, 25 Jun 2025 03:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750848341; x=1751453141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7TjW11pS9pqBHrVFgl2ri7fsSXdHbIvbSJxHftaM5A=;
        b=PqrmozRIgIJ6ZDOGSJMpr3eCqjvuNfGHmMrpfOREDrFmi6343cyFKYPxA44Mt9NSAv
         OlV7t94POHCkkiiQdSwZVVUX6HreaHDH2GQ4xEtto0OMIA0nOrsVlufyA+d8DVcOQeWC
         Gh2h1/ddT1jYX0kYF4ZdVyGiCsd/Cx1i2hUvtoN9zB9VY3199whNfE8ikQ66WzUKFNj0
         ryOk0oz7MLJ+SZtASCJNGFbc/QcqYlFCNKHeUO8NDohWcG2c4kW1mPX2bNz+lxDl6wMT
         o9CbaBcXX6GZjspXRaKFJ4Wrex938vaP1CL5uv5Teio4mgtbQn23VlpZzM0XSfEhOSGD
         O7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848341; x=1751453141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7TjW11pS9pqBHrVFgl2ri7fsSXdHbIvbSJxHftaM5A=;
        b=JTDlKaM16W5fymoMUCg3r3zBmaP7z+EwjIVbXE/QxubyJWJbu6zgisF2u57F0obiFk
         dbJiGLFGmWEIlRWIT04vfImxpwzA9EV2Gw9+qHobQ+njGFgOpQjdYSmNB4ZtN/cDUbzP
         ptHjrug83iJFGTKf/dSMDwmN5r78ZIwIwinDHoHU3eGnJ9R20T/P9oAPFtQFexIjGHkn
         gzsE3ur/lhiR86ctxq/p3G8MHDniuvhgDxQfzm09Z9h+GIOPjeXgb3pT7w17g0Jfy01i
         m+j8Sg2mCevFLNVxnBNXPHTmvWqUSfKZn1w9siuFwzurdcPpKXAPbxqX2/aJOhMWjmwP
         PSqg==
X-Forwarded-Encrypted: i=1; AJvYcCUP8gq5NftleeI41oNZIFhKxnUO3ouGEe/5Mqz9Y5bBBoWgcH7zN4bx/8n7DwG3NMsx25aHPQZXlnLH@vger.kernel.org, AJvYcCVedxXxMGiivEtV8ktTjbt3SuJXrNvz2J8ZS52j9mfbPaUCE2Np3DZxFluDn6J+ZQFyUHX5b6TwdbYW@vger.kernel.org, AJvYcCWha58ePTvHRZVwzxPknIDJ3kJZKDsjznkEfcqZMn60uhxOU3YA94P4IJ/4krceCXli8KyMNePsxmkvM9j7@vger.kernel.org
X-Gm-Message-State: AOJu0YwC3VE1p3jfDayfVC3UlPT8ZI0dJggkJVWOdN3gQ3PGe76yhsi+
	2JhD5V+GMg5WVzxcs+x9e9uJRm9uEyaNrDvhYncSSRa9HoIKAhYfn035
X-Gm-Gg: ASbGncs0o/hVZK0QnXndKfororA4fRu58JOsiV9Wt3FaKFPb9T9x/v2FjF0dy5IrNGO
	yaOgl1CnQOJ5boEz2FWPtf4IceTFUnzR9caL1stv4L4ESlF/jUjcUPAHmdJaIgWe1gmZulUefxF
	cL9V3ImbZ3iDGCHM8GWr6EXKR3j0G89VYcanuB2dWJq2X0nR6dIHrzjAiwyCIZeSLJmtUakQ9WI
	Wmn7E5ALstmb1xwTR2X6Q5Ah5lVKQVMae7VGnUfxhJ/r2oJlBMLgLxe6g1FGU7UPQEIXXlzPsad
	JfrlV+YSL7XUd9BviaUUDKphrEZUGFcus1laNUfSdDCA5n3RXPgAZp/o4t928fB4Y6SgGxzECh4
	tBH88aImFKdWnGDH3q49d
X-Google-Smtp-Source: AGHT+IFBxm6EmW32lcRlPsUnLPbeySEPUX/S1vK0KZddhQnAehcP1rndzN0/KfNC4ajIDkyKWoVBKw==
X-Received: by 2002:a05:600c:670a:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-45381aba2efmr25272935e9.9.1750848340503;
        Wed, 25 Jun 2025 03:45:40 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c1easm16036175e9.3.2025.06.25.03.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:45:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 5/5] i2c: riic: Add support for RZ/T2H SoC
Date: Wed, 25 Jun 2025 11:45:26 +0100
Message-ID: <20250625104526.101004-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625104526.101004-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250625104526.101004-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the Renesas RZ/T2H (R9A09G077) SoC, which features a
different interrupt layout for the RIIC controller. Unlike other SoCs
with individual error interrupts, RZ/T2H uses a combined error interrupt
(EEI).

Introduce a new IRQ descriptor table for RZ/T2H, along with a custom
ISR (`riic_eei_isr`) to handle STOP and NACK detection from the shared
interrupt.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # on RZ/A1
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
v3->v4:
- No changes.

v2->v3:
- No changes.

v1->v2:
- Updated the riic_rzt2h_irqs array to match the order of
  interrupts as mentioned in the DT binding.
- Updated the interrupt names in the riic_rzt2h_irqs array to
  match the HW manual.
- Added Tested-by and Reviewed-by tags.
---
 drivers/i2c/busses/i2c-riic.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index d0b975e45595..9c164a4b9bb9 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -79,6 +79,7 @@
 #define ICIER_SPIE	BIT(3)
 
 #define ICSR2_NACKF	BIT(4)
+#define ICSR2_STOP	BIT(3)
 
 #define ICBR_RESERVED	GENMASK(7, 5) /* Should be 1 on writes */
 
@@ -326,6 +327,19 @@ static irqreturn_t riic_stop_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t riic_eei_isr(int irq, void *data)
+{
+	u8 icsr2 = riic_readb(data, RIIC_ICSR2);
+
+	if (icsr2 & ICSR2_NACKF)
+		return riic_tend_isr(irq, data);
+
+	if (icsr2 & ICSR2_STOP)
+		return riic_stop_isr(irq, data);
+
+	return IRQ_NONE;
+}
+
 static u32 riic_func(struct i2c_adapter *adap)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
@@ -497,6 +511,13 @@ static const struct riic_irq_desc riic_irqs[] = {
 	{ .res_num = 5, .isr = riic_tend_isr, .name = "riic-nack" },
 };
 
+static const struct riic_irq_desc riic_rzt2h_irqs[] = {
+	{ .res_num = 0, .isr = riic_eei_isr,  .name = "riic-eei" },
+	{ .res_num = 1, .isr = riic_rdrf_isr, .name = "riic-rxi" },
+	{ .res_num = 2, .isr = riic_tdre_isr, .name = "riic-txi" },
+	{ .res_num = 3, .isr = riic_tend_isr, .name = "riic-tei" },
+};
+
 static int riic_i2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -643,6 +664,12 @@ static const struct riic_of_data riic_rz_v2h_info = {
 	.fast_mode_plus = true,
 };
 
+static const struct riic_of_data riic_rz_t2h_info = {
+	.regs = riic_rz_v2h_regs,
+	.irqs = riic_rzt2h_irqs,
+	.num_irqs = ARRAY_SIZE(riic_rzt2h_irqs),
+};
+
 static int riic_i2c_suspend(struct device *dev)
 {
 	struct riic_dev *riic = dev_get_drvdata(dev);
@@ -695,6 +722,7 @@ static const struct dev_pm_ops riic_i2c_pm_ops = {
 static const struct of_device_id riic_i2c_dt_ids[] = {
 	{ .compatible = "renesas,riic-r7s72100", .data =  &riic_rz_a1h_info, },
 	{ .compatible = "renesas,riic-r9a09g057", .data = &riic_rz_v2h_info },
+	{ .compatible = "renesas,riic-r9a09g077", .data = &riic_rz_t2h_info },
 	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
 	{ /* Sentinel */ }
 };
-- 
2.49.0


