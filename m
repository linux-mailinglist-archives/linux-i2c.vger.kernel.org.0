Return-Path: <linux-i2c+bounces-11973-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 561F2B0B018
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Jul 2025 14:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9D5F3A7150
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Jul 2025 12:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEA828850C;
	Sat, 19 Jul 2025 12:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqWjKtZx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B692882B0;
	Sat, 19 Jul 2025 12:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752929799; cv=none; b=f8f5t4G1CO81mWBmrCTOWJrFuLMXjZiz81m+TmWRmLHZmaHOXoaaUItWuIL49x41CTjQ1vRz2PRCvrZ5D8VtaoG3wzQv+Pfe+oJ1C1AoJ12lFZj31eTeGzJxM1A9qwp3Q7apbaztPFYfcfGbYAP9DqiZahDJf7/2jRFfZeNGkR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752929799; c=relaxed/simple;
	bh=Vs+D1OyyPsCiKsDufhO8BO5KJnYHW8HEaou5C1Rmdyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dyWd1vTNIur5bJqDkKVJLonwaJl57J0F2lbNtM4ZPkuHbAiKvhLZn68UuZ1VwakZRLdk35fANbjCfUc4v1Dff7GCIVgGjqbrjLb091JqkTuXbHKzT8DyNceTtf4Ixk5MrlRBFCApBh8ugiAI++YVcvZAlaGhuZ8aGhpH/PMQ+b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqWjKtZx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so31716965e9.1;
        Sat, 19 Jul 2025 05:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752929796; x=1753534596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKfLEG6+ipDQ095wwf+Yj6O/rN6WeuJI3tKiO7F5vfc=;
        b=fqWjKtZxwFIeARdiMOPFM+eundO26TmItw1vXgevgLDhdgJYI35++TDIRoh29QNKuc
         PnYnT/HiQCmVNdLNnmaFxAuYrwPLzGPyjVlaEFFHHJG9JXlvYUqaymI4KhyUF/f9UCcs
         7YuplYSp0mK+0qWxVc1tTc/H8/rOECE7MlJzxxDrO2MgH0Ixn7Kr8NBJ2Pt4EFe2Qd40
         5jssZ0zpUpJkeozBI0kun15jLL2pXM4BbYq7zPzrvBZnRy/l5kp0UCdHD7pzp/UtkwQI
         SV98KMELSLChi3De2IlB/m3Rcw6I+68avPr4EYWglKmvOLKNFkYA/qkYSfr2xRRano73
         UpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752929796; x=1753534596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKfLEG6+ipDQ095wwf+Yj6O/rN6WeuJI3tKiO7F5vfc=;
        b=fn8frRKiNDE8WW1znUspwzGZwdufLQ4e+cdDDbBYRH4QJVR+NHHz5WavianLMgG0UZ
         fJvFRK4q+dpFwpklSUfXx2coJNVbgiNVbTFmtdbGt8wCa6YvutIwjM3t6fA6GaX/SkrO
         xo3hM4wrzGmRMvGFFmJu6fcVtt4uloHbopEHCQ83se2UJAUc3oeCZQgXn5elkJs1sZlD
         JcfLqwI4LmxTdhAXjbzA/8pQtKugdu7YacObLnJlu7bYdka7A3qOckH6925ulUMXVXQI
         tXMrWK50F2rdNNpRaP9fe67Tqg/3/CPmVZuivfMawKxO2VtGTirgoFEUi1B0ZmWEjmU9
         ALJA==
X-Forwarded-Encrypted: i=1; AJvYcCVtbfIgY3IOwFy1wN18tHV0pYrhFeuAVREK+YFbI+t7zAkB/fp9LlhUV3htfqF7fFbRnapyfkbtedEm@vger.kernel.org, AJvYcCXg4A46c+4wrLO2xGz4Yv13LnlPCVdo3whma+GL8McfNTILl7VOfLJe1FQSzn1kis2Db5MNxrqA576e@vger.kernel.org, AJvYcCXyXM+Y3fH4cs6jpHs8EFmp4pZRnYQLWuujmJh6MfppHdnjg3kpmRAsJUeT/ohGBdkvdVf9CzGPOWSn0xIX@vger.kernel.org
X-Gm-Message-State: AOJu0YzmhGXvT5jzWp4CP/wGh6X90SHlBuefJEXE1QY9eItLNUKu9sup
	b4677tV9MInS54XXOu/J6jx9bPf2zhVLijd54jzzaGQOOVKWa6m7TR/D
X-Gm-Gg: ASbGnctllnHdf4exlo2rcXOQT54NBE+sC974Q7yavgyx1rkA4jdWFPjATxw2NlVkNDA
	ZzKfS2CSFMtBnrgOzpV3Z2drEe1XR/jNFe/i1XDTNO8+I5fYfXFypZlbr2z+sLjjJtsEiZ4tL04
	R++8H/40X4opgVMFcTZHSWh4LcvPXxHsEbgczn3daJ7Si5mqZ8IaNpJjnW5phm2JKpHWz2nprL3
	yjB6GXMs9V0ja5y2ctciPrCOG5aeTIdqTATVCgTafwjw2VF1rwqYJSOOKnzc/yb4EDvRySBNTD0
	G9nlPywi8CS09G4mdpcNkUvxtexC2RJOLa5N4q+VhhdUR0i3enc5sjpEaZ7763N0LsgLthrAYGE
	6GHSykBJmsI5xfkcKvcdqtBsiu+zYf9H7+O3YHH0qS7pXy1aSu1Ct8EPqUFxpGQgjLRyerNgNJl
	gl
X-Google-Smtp-Source: AGHT+IHuF11ip4L2zFfEUMigRC8dkjkuBq7ULx5s8kWGHzrhWElZjxldUDaslThQi3g96GCZtgJjdg==
X-Received: by 2002:a05:600c:4f85:b0:456:43d:1198 with SMTP id 5b1f17b1804b1-4562e3801ddmr128008475e9.32.1752929796210;
        Sat, 19 Jul 2025 05:56:36 -0700 (PDT)
Received: from Ansuel-XPS24 (host-212-171-170-230.retail.telecomitalia.it. [212.171.170.230])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4562e81ccb4sm106688005e9.17.2025.07.19.05.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 05:56:35 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 4/5] i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
Date: Sat, 19 Jul 2025 14:56:14 +0200
Message-ID: <20250719125617.8886-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250719125617.8886-1-ansuelsmth@gmail.com>
References: <20250719125617.8886-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The same I2C driver is also used for Airoha SoC with the only difference
that the i2c_reset should not enable SCL_STRETCH for Airoha SoC.

Introduce a new compatible for Airoha and limit the SCL_STRETCH only to
mediatek SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 58c3da92cea3..b4dc1fb269a6 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -88,6 +88,7 @@ static int mtk_i2c_wait_idle(struct mtk_i2c *i2c, bool atomic)
 
 static void mtk_i2c_reset(struct mtk_i2c *i2c)
 {
+	u32 reg;
 	int ret;
 
 	ret = device_reset(i2c->adap.dev.parent);
@@ -98,8 +99,12 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
 	 * configure open-drain mode, this bit needs to be cleared.
 	 */
-	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
-		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
+	reg = ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN;
+	/* Set SCL_STRETCH only for Mediatek SoC */
+	if (device_is_compatible(i2c->dev, "mediatek,mt7621-i2c"))
+		reg |= SM0CTL0_SCL_STRETCH;
+
+	iowrite32(reg, i2c->base + REG_SM0CTL0_REG);
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
 	/* Clear any pending interrupt */
 	iowrite32(1, i2c->base + REG_PINTEN_REG);
@@ -276,6 +281,7 @@ static const struct i2c_algorithm mtk_i2c_algo = {
 
 static const struct of_device_id i2c_mtk_dt_ids[] = {
 	{ .compatible = "mediatek,mt7621-i2c" },
+	{ .compatible = "airoha,an7581-i2c" },
 	{ /* sentinel */ }
 };
 
-- 
2.50.0


