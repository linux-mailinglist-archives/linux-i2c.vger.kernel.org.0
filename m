Return-Path: <linux-i2c+bounces-11416-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD2EAD8AC9
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFA5E1888E49
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 11:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625722E62D7;
	Fri, 13 Jun 2025 11:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtzO2G90"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7742E3382;
	Fri, 13 Jun 2025 11:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814838; cv=none; b=CnJxUG2X9JE4s8JgvMiCdLgs/KyemY2aFOgPKtxd8YftJ3HHPvjAxPVUoVM4/90NLEAz7U6kHoSxgh3nqMn4d9aX9wdyg3frBYhrjZQSl6Y3bO6v3Uw33X8/Wl6zI5g09CtUrOSfETrdEcKF4EgnkOkFWtvfWykWO3K9lyFAGQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814838; c=relaxed/simple;
	bh=9lS0GiXIw36VpD4gMDnScr1Wznlsy2mbXpLBMqfdVPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VnrBu7l22VPQVJLajJ2Tv1QkVs+fivCCt/Z/XnIJSc2XCUYLv1r8MFM5aHl7IASUZOQTRnePQfq6CddXOfaE8uoOQ7rKbCP5GW9/JWIf3ebTUBGzzuiDTUG7DElCKZplDw7DbtYjlms5OiN4eAbyv6Y7YGbwtesMMDsr3afFBIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtzO2G90; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso1268973f8f.0;
        Fri, 13 Jun 2025 04:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749814834; x=1750419634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pM0Osg+lhhh0k6/BGrJyYjnMbn6UNRn2yJYDdy0tDD8=;
        b=QtzO2G9037exkYzaV7T6lqx4rfQaBGeoEh8sbJXE+JOVyhh2hXfLKNlYekgi/zG6uJ
         IalAxUbRYzwTaSdzdnlYYXSiLE/NV1z1zOG4kJqnJKGV3u0yGR13zq9AItg6qv+6m7Jl
         2PswuAR2Ie9t+wxucMnqtqwR2OUObfwh3vknz4jw0cZxT1qw1MaNXhDzUOLqJSqbQB1w
         NnsiAGkhbOu3sv8GJqYxcMGXshK8Lowk7wuarHHdM53bXI82kGxe3VrjUFpKGzTgHGjA
         Kf2xDTLv8YtNfshRsf0e6KXJQT6qyNFKyraaqRcpNLLpIJvrP00q6u68oYXE4w6zXxpt
         i9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814834; x=1750419634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pM0Osg+lhhh0k6/BGrJyYjnMbn6UNRn2yJYDdy0tDD8=;
        b=m0pYkqSK4Vbc4LqpUPTj7k35uCQ5StstCOtNOByTyIk8rD2yyDfQocT5WtWCfhOZCZ
         vBit0Kl1gZmdbiZqRNEblMLzsw1AS/RiXxCtGZq3AxhpcEvd9CgTgf8ndqsxK/Bousis
         u6CPj14XPQH8778+qxF67ma5sntw+RIlMoGAwRTJLPn0o+FwimelJ1SIw2saw9I7yDmT
         IeTvMhPcc99f26dtJuJNzyFMnZofcUtGrTSjf28Lc1RHhKnl52QQhg07pRLIXnODsYyA
         1jlPCD5oBuYQSm1n9lZI7o7OYNLi+8Bl4M/WODnBOge87M/O1hOKsqjnGZpYw3zyTNsw
         rfPA==
X-Forwarded-Encrypted: i=1; AJvYcCUYRASMMmES0AZxbE/MukTSgxhKwFYvcOGxWrMyKhhH5VHapYxOEm/mlUOSiBEF1zDLe57RChTFV10i+vuC@vger.kernel.org, AJvYcCWkN6CNOOZVFffXdvnJErurGS6yHQbV1POWvPLRJ7LWgkspIaB16NKSU8AitWwX4TG3iVBEWO8TWTqD@vger.kernel.org, AJvYcCXKP9d8LlDdpi0SEEyPTKtkuuuYjqS4t0w9rzB91h6/WcIcS31Zhfwi8wKUCJqGXErY/JEM60/Z2UYU@vger.kernel.org
X-Gm-Message-State: AOJu0YxkDHBdlBgC5M3/7DLOLfBaF+U/MFwSLTpPEyH7Zu0yTACG9oEu
	mkDY/pt34vHi8j34es/l+Cfpzzsxgq1+niXskJiUwKO9JMJN9z55T0PG
X-Gm-Gg: ASbGnctrFnMkPHEK7nAbmJmKR+nHDsFTXmPkQ9PxNi8MbQ8FI2jxNK9PdiMl15AOlUL
	Ho19qWezf2p+5EfYgxag9cUrqg5mdZaxkVs0y9Zb94esPVgVR3FtPJ9XmSTyE4oxhOsby0diMCe
	u9ktGyRHlIBK8gI0QMKKT4A5u+X6vHhT7KCRgXu6NdU/uc0X6mvOu7nJJg5eobGUQhM94S8rGIw
	qBkSyPs+gY1WijosEgpoQun05PQfg2O9oyxl0qhvGim3BssRolInn5VxCQhENCMZvz94t3AJNwm
	UzK0jhjwC2odWuanHcpz0NLN+5BzVa8bnouZw5dF1XNKzgEN4pMSgEZ101vc/X84oKZUMq6XcY5
	HQrTCr88ASA==
X-Google-Smtp-Source: AGHT+IH2b69X7a0iHgBxSKN3rcmFhqIpiVER5rJBn/NY6jmoGearML0USBYLxKWCBzs62ngEwLKe0Q==
X-Received: by 2002:a5d:584c:0:b0:3a4:eef5:dece with SMTP id ffacd0b85a97d-3a5686f4977mr2464737f8f.35.1749814834379;
        Fri, 13 Jun 2025 04:40:34 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2c2d:5496:6768:592])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54aeasm2171519f8f.14.2025.06.13.04.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:40:33 -0700 (PDT)
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
Subject: [PATCH v3 6/6] i2c: riic: Add support for RZ/T2H SoC
Date: Fri, 13 Jun 2025 12:38:39 +0100
Message-ID: <20250613113839.102994-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613113839.102994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250613113839.102994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


