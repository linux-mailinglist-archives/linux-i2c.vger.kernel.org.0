Return-Path: <linux-i2c+bounces-11470-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13451AD9DF0
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Jun 2025 17:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F4DD189D2F9
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Jun 2025 15:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26122D9EF4;
	Sat, 14 Jun 2025 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="VGBsbGr0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2BB256C7C;
	Sat, 14 Jun 2025 15:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749913253; cv=none; b=mbMKSiWtafLwhZi8YWV1Z6ln44twx19llURZQWsT48HjYDY2zsDKydgAxzkf/+kxpMWyCtG86AiFvP0LGgDDjpvEQv6v0DXeKzAJKpxfe1PXXxU6f6E+y1GI7gGj4/wr3dCCjl07ykXPxIg61V2457G6S/F7fNSH4AKPumJgjH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749913253; c=relaxed/simple;
	bh=pRoQVD1k8gddZ6eCyztA1dMVRZv+vLamQe7EhDenJNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p9xQPJFvMAderInUF8d8YtTcqBM7bBbexWJYL46JLsZzP1CYcLGVSIFaK1yUkQokWHZAIxS/r8MMYqbDz57fN4mykdgnDDDiwxYqFRzpgp6h/h7goC6adywScoCW2remN/skB1REx2JYPVEVT/T9wWXbs4ekOWuPrrJs7yv8NLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=VGBsbGr0; arc=none smtp.client-ip=80.12.242.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id QSM3u88XaEYDLQSM3ueZb6; Sat, 14 Jun 2025 16:59:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1749913177;
	bh=xaTlGEEhTijiMyHmtHzEn1Ywdg68fkcpPpcl21gOtVE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=VGBsbGr0tJUiVEfqjRlS5v/0u8O+rx/22kkMZr9d6QzPzgbY6EcjzYedaCldieame
	 GlIjc4UvYFP+XH3plGYZcvxL320qAZlnNeX8RNovxA7rpJJukOfPw6BkFQuc5Cq2qX
	 b2QXGTHBRBCcea+ADxTh3zzzuLNiX3iqS9UWBdsXnyvvb8mTAU0kksSQcyLRaVrPxU
	 caifhl7X11UKggM6Z9pcbmJGc+MhQQ2E0ph5Wsda0EFDCSETR/tM9UuY0uDAe6Rr00
	 9RHrftZvI6coO/KNyPiYEtb4WgzHNwwifneqo5y1RhCWylYsYAVNe+Jd58QTTxRrYW
	 TjUjNFB8P2+gA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 14 Jun 2025 16:59:37 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Vignesh R <vigneshr@ti.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jayesh Choudhary <j-choudhary@ti.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: omap: Fix an error handling path in omap_i2c_probe()
Date: Sat, 14 Jun 2025 16:59:26 +0200
Message-ID: <998542981b6d2435c057dd8b9fe71743927babab.1749913149.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after calling mux_state_select(), mux_state_deselect()
should be called as already done in the remove function.

Fixes: b6ef830c60b6 ("i2c: omap: Add support for setting mux")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I'm not 100% sure of the error handling path.

Should pm_runtime_dont_use_autosuspend() be called after the err_disable_pm
label? (to match the calling order)

Also, should errors from omap_i2c_init() be handled?
---
 drivers/i2c/busses/i2c-omap.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 876791d20ed5..5e46dc2cbbd7 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1461,13 +1461,13 @@ omap_i2c_probe(struct platform_device *pdev)
 		if (IS_ERR(mux_state)) {
 			r = PTR_ERR(mux_state);
 			dev_dbg(&pdev->dev, "failed to get I2C mux: %d\n", r);
-			goto err_disable_pm;
+			goto err_put_pm;
 		}
 		omap->mux_state = mux_state;
 		r = mux_state_select(omap->mux_state);
 		if (r) {
 			dev_err(&pdev->dev, "failed to select I2C mux: %d\n", r);
-			goto err_disable_pm;
+			goto err_put_pm;
 		}
 	}
 
@@ -1515,6 +1515,9 @@ omap_i2c_probe(struct platform_device *pdev)
 
 err_unuse_clocks:
 	omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, 0);
+	if (omap->mux_state)
+		mux_state_deselect(omap->mux_state);
+err_put_pm:
 	pm_runtime_dont_use_autosuspend(omap->dev);
 	pm_runtime_put_sync(omap->dev);
 err_disable_pm:
-- 
2.49.0


