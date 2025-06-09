Return-Path: <linux-i2c+bounces-11314-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3233AD25EB
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 20:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 830FC3AB142
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 18:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CE322488E;
	Mon,  9 Jun 2025 18:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+A903Zy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52752220F24;
	Mon,  9 Jun 2025 18:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494491; cv=none; b=bPp6bSYP+D00HRycT7HEJCgJ+YsdAe42PhR30ylLP+6rhL8t+v5iHNivZrxOlzJvzvi/Psj6QZT1hTm3gnr6zx1tOSN+0lPZGEwPCjDIjVhVFDjzMdYi/JG7Z5FQ6pwWjzkqqHS2+mr0yEO6IG38Uo7ovuC/26aoFx/Oirx/HWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494491; c=relaxed/simple;
	bh=Uj/KfIi9fOxiUY2A+/E9bO9hgMgy4MbtZmze9GHekto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmRcmWt+c4sxqDfwD/YrZ1scrlSZHp8+1n9QYxwDA8XykRcFEPflWX2F8y+gsDOvdbZblHSZMpnz3K2Kgywj2MxOpc11Tm8Vj6nYMAT8iLWLul/TyV7xJi29VFr9tQSZU99nDex4LlRwtbgapyu/K3V8nUTrlCisE1tdGhFOrTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+A903Zy; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so1212018f8f.1;
        Mon, 09 Jun 2025 11:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749494488; x=1750099288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsw8tondlBcuEBF5iSlMut8q8qrk7dnSJpSoLF/GVCk=;
        b=c+A903ZyTzLMVJI/AlTjdiVb/v3ulNAwRnY+tTGw56GGA0pM/275sbxlcrDnMUU7ih
         aQ5FxBHeVuzcANUqjzYXLA2Hfoe9BGkuK6Q5Z69kN+4unj1QHHRL4kARJiC5BggtZelu
         Xfk1N7cHwclXJeJm9teHwCyAeL6mNQoqaDv/XCFxd7DPGFn4HcOsIcZnIYvVbk37sd3V
         YKsbtBmpKfPP6sEamdmgjUpJn8fieQXGZJFUYrTTjZGwdU6BtzjBEAO1BuzFh/DewLa4
         FypmCIezbs76CwVEnPyMzK0b+NjEeW7v1vLEc4eROVZ+k26X3s/L5NnDe6jji+1RT+Ty
         JY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494488; x=1750099288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsw8tondlBcuEBF5iSlMut8q8qrk7dnSJpSoLF/GVCk=;
        b=HfHmYoSGS1b9ahlrEDI8j15bA93opHuNjtOtDPiuBXZoqgQ7Wz9o048iRJhnYGdo9Y
         K9dvmkjBf/8e+kganuLCFm32FjUkFUch7NWFjKJJwrq7vxOfJLCK+AfH5CTwKY7IT9Fk
         ONN+es/lAZ/pehQtfnEHdjLfKHTqw/6ghV4XeY8nhDTVFIPsBkpDJZE+nPd1SgB/gc1p
         LbAvhoLwku6SneykNqkvMgVS6ChH8ffVfJF09wpPTtnUO1IgTdy0n3g17ehF/c/vtIxr
         6sBerq5kh0taYkUyaXu0KHjGtG7ulNn2dBZfBMEgjzwBA1BTOT2SWaGCLLLibMlXNLWr
         XYiA==
X-Forwarded-Encrypted: i=1; AJvYcCUdea5cJ6Qm4rVKSUoaEkhPciiZzKrxijf2xVAfGizUI/oCj6w8v06mRoxDl4kPrXn7wUwPnfpsFDxD@vger.kernel.org, AJvYcCVubQb1YcXgyoygZD/y3v7aXCXpiUTiz6YfaqIOOeP+z45shmiPxeCoYcQYHwSfjYeLQsuwZF6OkH9dVBBS@vger.kernel.org, AJvYcCW41RkzJ2bpAe+FU86Is2L41Rswb0LCqtXib+WP0KHaBHvNJvtncHrbhKAR/Y4fg1b06bHZuBKVwuRf@vger.kernel.org
X-Gm-Message-State: AOJu0YztweIB2zJWGv8LXzzTA+Z6mV0RcvHBC4C2i7qYSWYBMn2X7f2K
	VJWQ5UNiUKYFT15QH3T/uwHPhgGfFx5dTIqggcp4zl8K/yzHHna6ToF7
X-Gm-Gg: ASbGncsgMS5zBIgZ/FEiqz96+AoUVaCNwUlCUUBlce6PrRSiaEwMV1eFX5l+srDywD9
	g4ofzOGQT6bwKckGorNpL6YeR04X9+RaMdSATyqUVv9wOqpWyYAWKzvyCb1274L5qzOJ36eOfbQ
	tE/beltZ78suReAJBF81po5XC5sgPPsZg08xuwbQmrV0iEd762lvYV/1E0pIP7G2tkCZd8m4Ta6
	oVyhMme8ydeUw3S5sxGGbs7FjYkZz+IiFPSaIUU1VnumMlMDGvu5CU41ygBMLjtdV4kxE9CRuvA
	EcX1cyyarX361do7tgdSmeAr+FyIunz0ZjQQFu7fJiUGLOppExvNGyrbMjzKBSTdQ57Xa/YAEq9
	XCi9lzuz9
X-Google-Smtp-Source: AGHT+IFJ0KNUIIUq5bUrKWI3NLQ6JtjA8ODoUgCDdV0qLgumlbS5Bh7lqpBopbiTl47zHSQLJGWo0g==
X-Received: by 2002:a5d:64e7:0:b0:3a4:f902:3872 with SMTP id ffacd0b85a97d-3a531cab757mr10535922f8f.19.1749494487294;
        Mon, 09 Jun 2025 11:41:27 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f04dsm10137865f8f.73.2025.06.09.11.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:41:26 -0700 (PDT)
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
Subject: [PATCH v2 4/6] i2c: riic: Pass IRQ desc array as part of OF data
Date: Mon,  9 Jun 2025 19:41:12 +0100
Message-ID: <20250609184114.282732-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

In preparation for adding support for Renesas RZ/T2H and RZ/N2H SoCs,
which feature a combined error interrupt instead of individual error
interrupts per condition, update the driver to support configurable IRQ
layouts via OF data.

Introduce a new `irqs` field and `num_irqs` count in `riic_of_data` to
allow future SoCs to provide a custom IRQ layout. This patch is a
non-functional change for existing SoCs and maintains compatibility with
the current `riic_irqs` array.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # on RZ/A1
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
v1->v2:
- Initialized the members of `riic_of_data` in the order they are
  declared in the struct.
- Added Reviewed-by and Tested-by tags.
---
 drivers/i2c/busses/i2c-riic.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 23375f7fe3ad..ecd1c78eecfd 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -102,6 +102,8 @@ enum riic_reg_list {
 
 struct riic_of_data {
 	const u8 *regs;
+	const struct riic_irq_desc *irqs;
+	u8 num_irqs;
 	bool fast_mode_plus;
 };
 
@@ -520,21 +522,23 @@ static int riic_i2c_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(riic->rstc),
 				     "failed to acquire deasserted reset\n");
 
-	for (i = 0; i < ARRAY_SIZE(riic_irqs); i++) {
+	riic->info = of_device_get_match_data(dev);
+
+	for (i = 0; i < riic->info->num_irqs; i++) {
+		const struct riic_irq_desc *irq_desc;
 		int irq;
 
-		irq = platform_get_irq(pdev, riic_irqs[i].res_num);
+		irq_desc = &riic->info->irqs[i];
+		irq = platform_get_irq(pdev, irq_desc->res_num);
 		if (irq < 0)
 			return irq;
 
-		ret = devm_request_irq(dev, irq, riic_irqs[i].isr,
-				       0, riic_irqs[i].name, riic);
+		ret = devm_request_irq(dev, irq, irq_desc->isr, 0, irq_desc->name, riic);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to request irq %s\n",
-					     riic_irqs[i].name);
+					     irq_desc->name);
 	}
 
-	riic->info = of_device_get_match_data(dev);
 
 	adap = &riic->adapter;
 	i2c_set_adapdata(adap, riic);
@@ -606,11 +610,15 @@ static const u8 riic_rz_a_regs[RIIC_REG_END] = {
 
 static const struct riic_of_data riic_rz_a_info = {
 	.regs = riic_rz_a_regs,
+	.irqs = riic_irqs,
+	.num_irqs = ARRAY_SIZE(riic_irqs),
 	.fast_mode_plus = true,
 };
 
 static const struct riic_of_data riic_rz_a1h_info = {
 	.regs = riic_rz_a_regs,
+	.irqs = riic_irqs,
+	.num_irqs = ARRAY_SIZE(riic_irqs),
 };
 
 static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
@@ -630,6 +638,8 @@ static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
 
 static const struct riic_of_data riic_rz_v2h_info = {
 	.regs = riic_rz_v2h_regs,
+	.irqs = riic_irqs,
+	.num_irqs = ARRAY_SIZE(riic_irqs),
 	.fast_mode_plus = true,
 };
 
-- 
2.49.0


