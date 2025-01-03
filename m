Return-Path: <linux-i2c+bounces-8875-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1420DA006B7
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 10:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F0C218840B5
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 09:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D210A1D5CC9;
	Fri,  3 Jan 2025 09:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQ9pkxzg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D411D514E;
	Fri,  3 Jan 2025 09:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735895962; cv=none; b=BuxZlrfPF3d0ov4cLMF1+7XXOzLVDLOB+dx1h3+nlwWhPLVZ2lQ5ubXuk1e4D5QXuvrD4gS+kSEN/AsljFe/gEqShoPXTCTrZMx9GJHzfkIPxXKktfJW/qe/wZ357WOqpTf/JSYErtdwBtDuOMdwC8JN1caKLI1Q/KxIFohu4Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735895962; c=relaxed/simple;
	bh=KtuJmz9E5NAD/kQy/wEtix/DQqXZ7mFJuytQUHhe+rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dXJWNUT5qE9nmdsOevISVOmTqyZ63QsDLs69cf5lSosidu1qmvQJyzoVx69+pyxkHtmPoREMfP0UtZs6NAEskPnhwk9ampTmM7UvK2/FkIJpF1hAJW1zGwlM/mdhJzwLeVTTHrvlroX1GjODEYG8JGOwOW2xJiU61Ft4x3V4Egg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQ9pkxzg; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43690d4605dso46254955e9.0;
        Fri, 03 Jan 2025 01:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735895958; x=1736500758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MeO3qg7TGRxVchfa98hl5J7dZ69kA3UnrU6UXyWv8w=;
        b=TQ9pkxzgFinWSaTTjlC+T2wmOExx5z2ell46PS72KBUfGmi9EqUtIJPEqdW2wjEx8L
         5eiDLVhWJ6ANS+GI5a5VCvZdKwidBlFOz120EM1OZ9C5clbu8PEfT4yz8BfyJ6bAHCxW
         NBRA78OvOeFoUI/rHtT6OGIh44MyTabqb14BaRn+6y+IF/wd+w7LZyQt8mZnMgZWs0Bp
         ZPoapS4ZVz3heE0hFMW+Ez7nIZ/XkioQ9tnYqhPrKSCnIGp19UFH5YpL3ior27PHeion
         /l1H6Iq08XupqNstfViXGgiQU5YylSseOfnpyTONISIcBOvR46FZpJCgsPINBSAyGZtH
         bvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735895958; x=1736500758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MeO3qg7TGRxVchfa98hl5J7dZ69kA3UnrU6UXyWv8w=;
        b=a7b7gMFGPR4vG43Vn5i2o8p6XWz0VfVGRW6HwVQPFNvzHTTiitKykBRZagx0qwU1rb
         sqXg+8I6vwuPBxmmTaWW2ugdEHoMn26GHTrpPw+/zEjVyWGRBnKi1FVqrS608e54miL1
         UomR4IlGMWVoMVppIegEWBu+ifbFy8JwDkdg32c0dR7P7OGGlTmoJRPdxvn9DOV+JUyD
         4IPpOhY3LuyUxrrgsvEbDMxjFNPM2auGRJMQ4ikLAtI/gitUyUa6o+pDb2KAspP52S7R
         lJx8WzqmkIFdRSEU7odKvHFAEJTJ2+dzzw55Lrcb3oGyJOHGxwmnjjSwcfA/Hi3LR5aH
         jY1w==
X-Forwarded-Encrypted: i=1; AJvYcCUCEreoCgNg2sQGWwk1gVb/Hp1SXeKVTeAmna7BO5J2q+ySyfxLO4brIt2kJN2ZcGnw5dRqgImc2o0=@vger.kernel.org, AJvYcCXPKIUihIw9hVVEFykINeN2Pszbf7H3arzq4XBWT4uo6EGH1mZoSajigJ4yWcVU5HkHmGy2GoKXPJOzj2h4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Z+KquBBW6r0vSVY55XNS4Uye7wBV2HyFxS0oC46IY17O3kM2
	/V4kw8dV1HthZaJJPb/YJ0QHTvFBjq2pcphPnKR0MGAywCXVmNxZ9qCQmFRZ
X-Gm-Gg: ASbGncuqYHhflwxOHBfUcu7ES52NRZrj20ZqHisRpVJaq3zj5EsFaKhwLajQZ4rOMUH
	iTW1LAc2up6KDBMlo/Xf591rKlOO8oXif/WZ8+576I6Ap0Objq2zEK/6BgAzkIfvZh0D1ScApY5
	X+fpE7gA4ufWCwgmFyCzXNV4qbRVSUm1Pr14gAExmcG2WhIQeyaYTfOv89a+FDQtFS6qg1L8Ovb
	UG1lOYVpYbQjhEWVyE11U/lo2rP9SSkwfAo9YYDQy4+5BLpNTj4ynvUZdYOF0hieU6KNjozhvgZ
	vP4Bm358mQ==
X-Google-Smtp-Source: AGHT+IEnpIFuwVMfRAKXeaDqLWuliYppRAQNQhkTLxsCXYqFw9Mj9eZrq086glu9kkRv4blrRtsC3g==
X-Received: by 2002:a5d:5f8a:0:b0:385:e3d3:be1b with SMTP id ffacd0b85a97d-38a2220044emr43608934f8f.28.1735895957847;
        Fri, 03 Jan 2025 01:19:17 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:84e9:7adb:b646:c9c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366a093cbfsm452493275e9.22.2025.01.03.01.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 01:19:17 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 6/9] i2c: riic: Make use of devres helper to request deasserted reset line
Date: Fri,  3 Jan 2025 09:18:57 +0000
Message-ID: <20250103091900.428729-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Simplify the `riic_i2c_probe()` function by using the
`devm_reset_control_get_optional_exclusive_deasserted()` API to request a
deasserted reset line. This eliminates the need to manually deassert the
reset control and the additional cleanup.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v2->v3
- No change

v2->v3
- Collected RB and tested tags

v1->v2
- Updated error message
---
 drivers/i2c/busses/i2c-riic.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index ab9ec7f12032..0953fedac786 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -424,11 +424,6 @@ static struct riic_irq_desc riic_irqs[] = {
 	{ .res_num = 5, .isr = riic_tend_isr, .name = "riic-nack" },
 };
 
-static void riic_reset_control_assert(void *data)
-{
-	reset_control_assert(data);
-}
-
 static int riic_i2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -449,18 +444,10 @@ static int riic_i2c_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(riic->clk),
 				     "missing controller clock");
 
-	riic->rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
+	riic->rstc = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(riic->rstc))
 		return dev_err_probe(dev, PTR_ERR(riic->rstc),
-				     "Error: missing reset ctrl\n");
-
-	ret = reset_control_deassert(riic->rstc);
-	if (ret)
-		return ret;
-
-	ret = devm_add_action_or_reset(dev, riic_reset_control_assert, riic->rstc);
-	if (ret)
-		return ret;
+				     "failed to acquire deasserted reset\n");
 
 	for (i = 0; i < ARRAY_SIZE(riic_irqs); i++) {
 		int irq = platform_get_irq(pdev, riic_irqs[i].res_num);
-- 
2.43.0


