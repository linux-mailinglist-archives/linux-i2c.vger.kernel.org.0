Return-Path: <linux-i2c+bounces-11316-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6D6AD25EC
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 20:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D30D71891F65
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 18:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429B02253A0;
	Mon,  9 Jun 2025 18:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKdLeCaN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247632206BC;
	Mon,  9 Jun 2025 18:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494493; cv=none; b=tGh5g24o4++dZcUK6yh2UJ2bi2VXM83AUmt7/drcwKJDNK8a1z6v7TDSjn/eNsAhq1kCtn3+wWn3jmhp4Md2ijfUYTeGvndSFA7iNtI00iPbGeIRhAoyCC5S8B5S6jObo3p8s3pFe7WBYMk761tRlYasuTyi8Uf6wL3JXMtELjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494493; c=relaxed/simple;
	bh=j8goozVk+DiYlp4GJTvl5ymKQRo3e0oyL/7h8bqvJi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7soVtmfD7ZPxxYazVEror2bvQF5LiwEin/zX4iXgkt5x8wtaw3H2/T5S73M6nuIXywiyN6jxY/ICrGs3q8nFb5ali22jYDkQURtxoPIHMjUOQpLsvfkXgR79TZ487NbJu04PL58Fmx+KxdYc46ZS3VA1/scxQVZSfQ0jgXhP84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKdLeCaN; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso3018808f8f.0;
        Mon, 09 Jun 2025 11:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749494489; x=1750099289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBVA8u7P9K0qf+hyn4RTzfCpu8dbeDyo/DFXP1/igMY=;
        b=dKdLeCaNGKs4u2XjjTsDwI2AXIosgqzayyrPGR3WrG04H/z7mhW7UA5a8Tv1lY5Uga
         KR0Tw5ZqkMdY9d23/q5ofRmFEPdhV3wpCwVXMX37sr3THs04aocdUO+LYkPombBKNJJ/
         6LYj5NOv0v/HHTbVwtweKylvj69YXlhjgsJiKaaW2AK/7kAAtz4ckS+sKcHq2ijkkHvu
         94LU3G9byBwfLrdB67aDuB+Emykru/+JYDft+IQW82QL3kgRi45wc/MZa4pq4q/ESj5Q
         Bk/kTfSWZEDDLmD1YhkL4ym3lzPkO28djyRz5rBomMk0sr1a93xlTqWPqJKGX1/2ET4P
         SO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494489; x=1750099289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBVA8u7P9K0qf+hyn4RTzfCpu8dbeDyo/DFXP1/igMY=;
        b=pV+kVJknDWt7GQ8WpOuDGXdYdTnRIxzixge0zWebsNmk+a5NzpvGC+LMCgSiQINDCj
         Q4YlEcZ3f4j/EIxVime7OeDyd+23nF2btBgsplNtsSCSI8xMDa8t3U0hEmSOxbuIFRgf
         hKZaz7/pTJzvWPyEKKudSLEQy+GNHfhftxSKfmZZ8AxaOJdTKx/v03DMX1rYKA5YIHaQ
         YXV3itwBc37JwdqL4i/aHvux7D2erywDJgOLgXgyPxjTbU2HoD91u5qc1GXWEzzNStx3
         Vs/MIymxAOpzIyzoIMaavfRhmBq+Hu26s8O34NCIvLAAfOFG7+iXhpDqcuoxhJjSBAKS
         bcmA==
X-Forwarded-Encrypted: i=1; AJvYcCUosZRoap/xeytKbAsu3zVwcSux0WFfK1Gex8ICTlP0fbueF4UD8kR87szpDe7AVZzkJ9rid7c8TGURiO97@vger.kernel.org, AJvYcCWSTbwwbzEjnC1+jWgT2NquopLNe260opYE4lmPfZ58Gg9OkpkbhHDYis4lLFqLeslUwtchct+3u3h1@vger.kernel.org, AJvYcCWXpBMz2yKNbKLS4ZgEfvT/VESnd+agORUCxje+WRoG4BxJKg9J4+dGdTyttHPQ4RBb2CZNlCcWPMj3@vger.kernel.org
X-Gm-Message-State: AOJu0YyNVroxAWjBzrlcykNzZpayCcxkeZsgBuAZ1e/DUYQUcZEbwn7i
	chKg+7Xb9UjMqg/GMgEE5jqPGk3tFpIijGi6J7cKeB2QgLrxImIkx2i6
X-Gm-Gg: ASbGncu8LMlAt9iDlwhiwLrjtF2HySe1arVLnSgHQXMgkBsxhl+LilMAY6e/ROm9H4u
	n6eyFS6wlFq7fBF87yY5s4ny3kJ1vWzB88Dld23yf//93Rzs7iS/WBb8WvefQJGF49/9n3oVyCg
	LuvQQ9/DLrEX9NKMZv9EoNT5ygtgvgGLKagSdyZFYTPd5AyJHUN8VEDKuEWbFpaqVY6ZUOH0UGL
	z9vWdmudvufmtuM2GkWlOxt8tYS7g67vwc6lkdpfphyDRHT6uF67KIwO3OUFIzAN6mRcr7yxdP6
	xzxRsiQeSsg4hpFJh1+ZDY2kxNbHuSb47HWaiNHYNKEIAqyvTSNln5qZID7Fydsewda4UfZCfIW
	trkWFBvku9fZrBW6Beyw=
X-Google-Smtp-Source: AGHT+IHa/uotTBQXRzJhNiKxf6x007lJmL946HjbCVUwqKj9SP4PvPBTpQK30grFpJTrfnG5QqSIzA==
X-Received: by 2002:a05:6000:2c10:b0:3a5:2653:7308 with SMTP id ffacd0b85a97d-3a531cf5becmr11040710f8f.57.1749494489223;
        Mon, 09 Jun 2025 11:41:29 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f04dsm10137865f8f.73.2025.06.09.11.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:41:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 6/6] i2c: riic: Add support for RZ/T2H SoC
Date: Mon,  9 Jun 2025 19:41:14 +0100
Message-ID: <20250609184114.282732-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609184114.282732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609184114.282732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


