Return-Path: <linux-i2c+bounces-9050-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A08A0B6EC
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 13:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F5023AB0F9
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 12:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0833923A58C;
	Mon, 13 Jan 2025 12:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCrWrwp9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012AA235BFB;
	Mon, 13 Jan 2025 12:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771225; cv=none; b=Ri6VM7GaFqxP9md3qjqYz+o+WzntpN+0jPWMjZZqcXPTBug3SBrvXtsK/Uopax7e94nvT2oiRe4iQZtOTMhQhcyoJEHPUXibdFSwwvSwCjY1qBosJS50VvaS1AxPGqwOC9vaNvMSzfolOpPEtdJk7YChZc5T+PJkf3QZz+rmv5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771225; c=relaxed/simple;
	bh=R7pz0XBX0BgrtScwKhgYERxMm6Ina5M2/cQDoHU36z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUM/Gjw0dRRF8tgNlZFuZc40BleMLdZK/q4dRH3sUTDr6AnRuYYDaFCcsbz1ircH0uv0VxaArtI23Qo8rbfEtf8QBSrtGCs7gfyaBTCUcOzxo7gfealvJfbGwS9vgk41tDOm+vQg+nie6JHFon84bOa9bdg4O3Y2+FFROMgqEnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCrWrwp9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so2279442f8f.0;
        Mon, 13 Jan 2025 04:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736771222; x=1737376022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgZ23kaBTh2F/RZ2prBStTL5i4OYKF6YytVP7mVC+3s=;
        b=GCrWrwp9YaV2LO7FpEiYymnUpom/6JWKQUNFq/7RwndkoMND+QkJCjMXhcOYc0Ul19
         SY2Lr6r6q6rg49iSoVIR3BMS2Rn3/FyQRrY5e88AOjCETmbJ4nlB23zulv+0CkzTFnlG
         VZtl8DOxJiu93xxfeqi+ivXV6knGyV7f6yz2To9jMndBQzXcnYwu9rJkZScX4o9qNQlv
         i8X8KlfFfWj8pLUOhZG+mH0LuSNSL/jOgNMmKBU1cfWeIf3a5RCoKTlKor1f1dsbFrlh
         6LvT8sUjb6+8kp+JtIHUrmSP8EEwXs2yo6EuQ9o81rBpjLOWF6+sd4cMxAKuKsAIED0U
         O1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736771222; x=1737376022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgZ23kaBTh2F/RZ2prBStTL5i4OYKF6YytVP7mVC+3s=;
        b=rde3XaVLV7iRr3uBgTqQCzcvcKNtmyh4QR08khSd78A4Nmethxxp+6ysWE1V36uyA0
         MWcLaD3jBcrvdsPiogAdLSXu48dMK/QTJDfCUepAURiLtO77QPh1iQ8ni+Co4xan9ROz
         4G1bfTH4hAUwmUUUqYDyE9KqtaxBJxEzPbh7jUoYsaMz3kZNUehbUTH3GCKgImVKwKJ4
         rqNtDZ7A2ziDE9ytxy5nF/jahTFlSk2mmVGRr/yDHsdPn/DbMQK2bYwtm06wpyPWl1aC
         Ga5/KKeXZ0BpWbMc99lZduZVr8JHWSfr9bluzF1V8APE3B4R4/KjFDYLZBMb+K3xdFvs
         7IbA==
X-Forwarded-Encrypted: i=1; AJvYcCUdoZTCfIH4dpu9kyy1B6mbHcilcsozJDip4wjhVttdeX7OVNvajGjecx+isFXwj38LuXjeTYBiRtwhXKTt@vger.kernel.org, AJvYcCX2BbhjiUkTMa7iheSKtcQxroOw6w745DNY8Aj6j/Q9XMInEC2nXDrdP7+6Jkf2inH/XMXjrtow3L0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiiUMF1nZnhp3xrrw0pVg2U71g1U3tVna4bUEGldxxt8jLxP8C
	q887GRwrC8cM2ZFyEM1No6L925UayNysIG+FkCBtzolXe4fOYckn
X-Gm-Gg: ASbGncsn11+hGopg2EYmHT+HauWPYrEUTyrcBctdYsvDpVsbZkUEVwZC+KiFa+NheUi
	39Gj+PfH3cGvWiPt5uzBekr0ms8nAZgw/IV/YZEJA+VV6YuwFlv76vTLoAKI0gvCVKsJ5mT7xUr
	ST9BRjevZYJ52y8UyEsFuTmEdXawZuzVCgqBwYVlrbCZIZSx0uaZdfuke3T8dG4jhrOEA6rEE9W
	cJ3pKTGLgkYCukmS4mQ2SYYj+zhLVE5xFi/VF1uttpbwjxrvYdjDrVoSQJDiM9pdveGXqn0ZnJc
	Eh5TjcNkfw==
X-Google-Smtp-Source: AGHT+IFKUc067RWqKURCdqYEN45IevOqPBL4b1CXvL6+cWgOYnMj7SxoaS7PBYDlsmu+TgOR8p/6uA==
X-Received: by 2002:a5d:6da8:0:b0:38a:5ce8:df51 with SMTP id ffacd0b85a97d-38a872f7ef2mr17709349f8f.2.1736771220579;
        Mon, 13 Jan 2025 04:27:00 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:acc9:404c:3a6c:d1aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c23dcsm11812720f8f.101.2025.01.13.04.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:27:00 -0800 (PST)
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
Subject: [PATCH v6 06/10] i2c: riic: Make use of devres helper to request deasserted reset line
Date: Mon, 13 Jan 2025 12:26:39 +0000
Message-ID: <20250113122643.819379-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v6
- No change

v3->v4
- No change

v2->v3
- Collected RB and tested tags

v1->v2
- Updated error message
---
 drivers/i2c/busses/i2c-riic.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index cf0b45f9e3d5..577be1fb941e 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -423,11 +423,6 @@ static struct riic_irq_desc riic_irqs[] = {
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
@@ -448,18 +443,10 @@ static int riic_i2c_probe(struct platform_device *pdev)
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
 		int irq;
-- 
2.43.0


