Return-Path: <linux-i2c+bounces-11414-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5561AD8ABF
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A39D1E3895
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 11:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE35D2E336B;
	Fri, 13 Jun 2025 11:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYuEGt9p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E533318BC0C;
	Fri, 13 Jun 2025 11:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814835; cv=none; b=d33GRimF/MSV1iPcrN2kAL7fPX+BHZZ2vqfnWZ4FjYaO6+XB1kpkPfjnlvNi2aX8JGPUJwajveA0qdx4dnLPpCvcEsnan/bGiFnrt0mo90McTi6EvHzgkXJ0P520BAl2OYTmc8EMzcHgiL1T2wUwMQNpFXPVyuNxYOPiJaohH/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814835; c=relaxed/simple;
	bh=B2kdYmrgiCNTCfqIXo4oAfhg5Z6GLSCTaP9Wv0mh0gE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BIMpHGpDmvJ66178ZW1eAotLzYH9vX9GrRtLezbTSQiZTHytO6nwYcGgFUP15D8SKMe1C69l36OypO/RUtHR5drt3A893VV4o4OazM2TXvz8afsKFz67Hay1h0JU6hFpwJmHmgRfdmMGtpXkKwFsPrRet9K9f2ICCCZ6BQJzfxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYuEGt9p; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a522224582so1151413f8f.3;
        Fri, 13 Jun 2025 04:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749814832; x=1750419632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fgvm880VcuXiCEoKAu2WjzrsY93QR8+oXpMIM6AhO4=;
        b=OYuEGt9pndgsokQufhGLOPFAk0xq+qxBrt8fgqNVDz3g/S4EUvamecFlkmXLiX+gKA
         1GCMfURmfHvPlQu7DMgOD25K0oRyVTyvjKWDXTV5SNBCs/urzULgBuV3UluvoLUG+Rbd
         MD8b7JKasY3tAUf9rQOjs710h1gUW5QL/5eEUMmrLsOIsWmKQ1yBp1SiwUMiPFuT3iSz
         wCtq+gs8LXu6J5TUOFjYecIAF0SYXL4Hg84gGztnUYED+afIURmjv+onygJ4xSzwFfID
         9ZQJfrC2yt6QDxYFSzji7ew0h8bSOJ3W71/X3w/ZWIUsPx7FBNTWbePvJocy2yZfPSxM
         ASmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814832; x=1750419632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fgvm880VcuXiCEoKAu2WjzrsY93QR8+oXpMIM6AhO4=;
        b=K13tppjgncaqGewZQ+EZTMGWjkrB4kwy60uGfrDT1TeCdKVxjxjVg0EWJXcyDJILaX
         l8Qh/bKgOGl9Szc72tmUpdawD69PEr4UvM8mTsv9qFQbcLp9TURgZvZ2F7F30ckMDSMh
         YuFeMDlygHD3awyJ3xfgI/j1nWPl4qbmdnq5qsCWX/KrqzFFpROM6AddZZDjYwb/8N9Z
         ThPVX/9uwCvrDx0hwYt8pWv+M/tkSo/51hgqObqa6gKtf1xLFzN4LBje6X8N5Y+Cjc4f
         Heuh94AoPX/YDsYoYfWH4UwS5xKJK2CezFOjM6YbSXAC8w3D+D0xCUgimlxQGHhfNmLf
         qawQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+hcHTFyjePvhIsmmW5n1B6qcuvmfQIG7oI7sBlPz0mMQzmxMjWoYyv7RZZn9/GVB+39aTq6cWB4m2puK7@vger.kernel.org, AJvYcCViRTiSCDNdqlIpnhdqXc3cVkUcVx96Yy32BTYpEObgopqEWaYeDpGAXFpItPh86RBe3yhXK0v90nfi@vger.kernel.org, AJvYcCXfOIWsMFvi6yJNgd2gzClC2uaWU/ELLISqxuSHyTvuDW8KNu5z50VKHK5Elh2yPuh7F1gbqc6YGYy+@vger.kernel.org
X-Gm-Message-State: AOJu0YwKMc0bzDxRyelKmnXFh04PWNqdBcfQO1E3IrgMwN7acIUV8BuF
	jqnfdo9IYE3Fc8670WwVOpuBx9gocdzfsfi3o534NCZEjc8j/ieoQcPhOQyvrMEN/+I=
X-Gm-Gg: ASbGncus76K+A+cHV8ZxenOtlkpWxLjeBN4gnZ5cl/dAlbfOudb4YnqkW/CHkRMkreJ
	k+YB8HsqYMqxiuQ1Zhne4mhQi6rHfcz0Y/AjUpP8QvMLCPGVGyK13x8rWWFiJvLs3ovlPkpVOhu
	PTX9aJUaZJIelwy/9kfww6HLA62aGElnOnf4MeVV5E4N/N/LyhrdsEEEguRUITGYkZIiRZ8hljx
	4vA0FAf87GP7TNDmS8DJmgwnj7iL98J88KVC3R/GcQy2dX/YhQ898ESFbb0AYheMj8XK/eO2iyF
	vXqx96Ra0hMq0jnLOh1ETLDt8aykx1abNfLQ9JqDWXeSu4ad+F6ODLVdxpljEnv3DiZ07/s8nf8
	+ec7u2VOdyg==
X-Google-Smtp-Source: AGHT+IGeAihFPKxMP0inw3SWKDDbTS+ul5kyJ18nP0jm+E/GOHkmPOmtb7s6sw51QSflgbItmUpdcw==
X-Received: by 2002:a05:6000:24c7:b0:3a5:26eb:b4af with SMTP id ffacd0b85a97d-3a5686fc03dmr2550551f8f.18.1749814832075;
        Fri, 13 Jun 2025 04:40:32 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2c2d:5496:6768:592])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54aeasm2171519f8f.14.2025.06.13.04.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:40:31 -0700 (PDT)
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
Subject: [PATCH v3 4/6] i2c: riic: Pass IRQ desc array as part of OF data
Date: Fri, 13 Jun 2025 12:38:37 +0100
Message-ID: <20250613113839.102994-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


