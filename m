Return-Path: <linux-i2c+bounces-11580-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB0AAE8015
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 12:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DAD31C208B2
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 10:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E892DA75A;
	Wed, 25 Jun 2025 10:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldnEr61e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804642D9ECB;
	Wed, 25 Jun 2025 10:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848342; cv=none; b=kLxyKaVQYWZ2WlhJO3yxCM4XnbfUWW0CfolxwdpB83SKoeWV6pZ2rxCnO/i9dWhsHVhgkRM/gkw/Fe3xIwgMpGCrSSvDBT+XvJ9cEvRnbjFotl3SzrSTSYkQ25kezNSb+ts2Rahlj1mEgWhik8QYFoDFUJduKO3nWkMzbgZZJjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848342; c=relaxed/simple;
	bh=mUD2833JuG8J5scV+YsordChuNvzXCArXz8G600luX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k6kcpblljo5rcxfj1OShUaX4NwK2KYQlyy0Y3EfHNCPYJzPrhknmWo7iUPGiWJsvOaRxdX92KAcd+O/5R+T2/+FIbKOP6QQ8B9T2Tf57oO+4o4ARRSaHdh2U6kPLJ/3UaaV7iyF7Qn5E+AkVG2pAhnrCTSS1koB62MQFFn/YslE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldnEr61e; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45310223677so47897765e9.0;
        Wed, 25 Jun 2025 03:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750848338; x=1751453138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkRy3nKrFGbSul+q17335EOgr/sgvrBWKgqg7xNqJtk=;
        b=ldnEr61elx/lWj7FOv8+YZmufHhp289LWeUYLNvBkJc69sSszhcNQ6XnBnRJAOTZJM
         jwoFLVx6ZQ2f8UfRZf3WmIsNFTbj4i1e4AxpJNvg2x9uCUq64sWXNu/S5dwB1KBc28Xo
         cAcGaC98QxFLDcpYGcya9d0HzXve1N6S17oQWvB+pbLORaGkuhU4WkHWOO5Ik6/GKhj8
         VmTjE+TsPu77VOfBtNAte8ETcrqqmjJj4dSifL5yPahw97c/lnyWC1USoEjOm+ACmBoI
         8JoaEsit6OZzQABlm+gZ/unOWg5AP4fGz7gk8O6HkOyWAkDe0TKmwJHfJBEdgq4zyOWc
         Yr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848338; x=1751453138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkRy3nKrFGbSul+q17335EOgr/sgvrBWKgqg7xNqJtk=;
        b=rppa7GpLommwc9l+dQITyELoHqzQWyqqR9wt1mHMRhqQxQMUGm3HA/I/sAyaWUWvG3
         V6qnE8+o12SNa/OsWN9A5ghWEvHI2+yNH0tt2/45oHaHOvzrQ6OM9m1TRz0DbZ6AeQXP
         HljieA5GkFA3JaflVdsm3a/ZEuNQnjZTNnrB/q59kWf7GOcVZZ4EyAAA9dLrfIV/CIZE
         TUp8a/vD1I/D+Yf5dr0bVA5t3sFDDZDFq7bGaOMu/n9YOB4PNEl1psFGh/48B0e4tx9f
         Pv5owh97B3d393TkfHR5tA54ilF2J9s2r2BFHhLlR/1p94xNgOZwZ1PaeTA2Ic+rXTU9
         IErg==
X-Forwarded-Encrypted: i=1; AJvYcCUVX/vAJX959h/kH5yXc75RRHGFZvH48F9nLCGQIM6j+4AkGXqpO+a11ohEe5O6vgTeAUSzlGGq1fvhoBhE@vger.kernel.org, AJvYcCUk+jF+M3tCkYTli4Rq3yy4HmIhZ5QvqfEd+BL5tnRE5gni+E4NKcdawsKb7nBnfpGtcxdferiZ0jlO@vger.kernel.org, AJvYcCWOQmX0gix5yMZ0oeMXJ6e6gU8aSJ+w2AkyTCTTsQecjjERVzSYBS7LbOpveSk5FkYZmzol9vgFjzuq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+9eC0lbqlPVZXcrMGlEUOAb+ddcAoTcdmtlMMPjXbBVmNNKzt
	tVCWmFtXy5v5SArlJrYnIe+knfswNIcjbd6qpgEv1vWff1c9WrV/WrXa
X-Gm-Gg: ASbGncuBXjF8GHXyj27bRDZYqPJCdWCgb8XLqGx1qdhXjb2p3S5YdDHKVE76CR1jh2C
	SfuEeb1r3+/Vkuerme83W5iGj71moZNqV6tC0oKElv84YxKv2Ut+JJIh453wgzLFiBFVmZ+OBpu
	5XBQhx/gKBXXKXX/EK4d4KyHsGGFWyVwfg6odR380IEkKvTwe5sW6QSrI49+ZI5oQ0dDBwYBoDi
	ZOVc7rVlnxftnjPmJ8xldiEYA7TjZZDsnps04pmFNIeckPkyo7qkjjwUDWUlHYKlbcM7gopD+Th
	LHoZWLwQirBRkW2MsFLVzfWUaddnorG3yOZBKCLNJrKpAgx0dwlmh68BtlsjT7gQiHoJ6giD2vl
	K5Wzrk0FYloiRkpbDUAQj
X-Google-Smtp-Source: AGHT+IF+EGGV8eMv8qPl+jjcHTvqLF4NLnWLmmU5RvgVVGrK//Za2i6uYKHL14id6c/9EEFn24WyaA==
X-Received: by 2002:a05:600c:4689:b0:450:30e4:bdf6 with SMTP id 5b1f17b1804b1-453837b27admr15558415e9.19.1750848337449;
        Wed, 25 Jun 2025 03:45:37 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c1easm16036175e9.3.2025.06.25.03.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:45:36 -0700 (PDT)
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
Subject: [PATCH v4 3/5] i2c: riic: Pass IRQ desc array as part of OF data
Date: Wed, 25 Jun 2025 11:45:24 +0100
Message-ID: <20250625104526.101004-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v3->v4:
- No changes.

v2->v3:
- No changes.

v1->v2:
- Added Acked-by and Reviewed-by tags.
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


