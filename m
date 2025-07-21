Return-Path: <linux-i2c+bounces-11987-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C392B0CA46
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 20:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E4E81AA817E
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 18:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AA12E3AF6;
	Mon, 21 Jul 2025 18:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZP6hkT4I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1455D2E3385;
	Mon, 21 Jul 2025 18:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753121256; cv=none; b=tve/RttCuy6RGQUCmJs5U1qOauVNOT6lrrBjvHnzpqyUDX7dvA0071pGZ2WBxnSf31BHUF3dsB4YrqzTrS/gzlshzlCK4+Kul62CYFEcNHYK62FUdj97kB8XVBqB17tSXqIMtnJ2bzWwgK1T2AEbc8eABtx+HvoOOuX9RU7swXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753121256; c=relaxed/simple;
	bh=Vs+D1OyyPsCiKsDufhO8BO5KJnYHW8HEaou5C1Rmdyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lznw2LXrl52t6wbB9duI8Rs0pEQkWYwzDGPSjNPLMUcwaah4rQKih0K9gOD5Pnij7+gUOnNVQmlcD4WkvBQ6HMQM87yC12V+PZ6e4n993k4thrN4Qhr2S4o8Wn20bln9U4AC7iLWrsVGxzVeX8ItwCYeAwRj3YrRr4XEG7+2l5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZP6hkT4I; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso2725979f8f.2;
        Mon, 21 Jul 2025 11:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753121253; x=1753726053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKfLEG6+ipDQ095wwf+Yj6O/rN6WeuJI3tKiO7F5vfc=;
        b=ZP6hkT4I00sM6T21XhzQ15rNItXsS9mTWpY/s+ohIBHyGC3Cupgph3NZHgkX6urMbL
         PHgNo4yacg5gRNoxwapVb8hiahMLb/hYU5q+8VSStPTHPXcY9jpWe2zF5Brn11nVO8O9
         LTqs9dB//AKRwlNV7UBimLhyg1ESStIJrfZ2xJShOzYWFD/V65bOMhed01ZYQMsv94gl
         Xb7oKIrhrr5LbXt3ETME21IbLtULNAfvbmM++LROO57ljQ9UKpMQrca+pFvL3msgGoRX
         7g7DHIdVcGKNXn2Q+yVQh+It2w91Lb9AABwKjKR9gU1TxRkaVY+AaxrnEvOLxsqKpYNN
         JJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753121253; x=1753726053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKfLEG6+ipDQ095wwf+Yj6O/rN6WeuJI3tKiO7F5vfc=;
        b=hdVIp9z9C0JlfI2c3zpXJNaYwtm2p+QOqt1XqOgz5icaHxkl69jSPFRr5MqZDQxcfA
         EsqGOW40nHZbtkzNq0eoqtoEdQ8qs8SFtbGDC0k5TPwmjfRQbfgUyfR/ljveFKoOm7qb
         6hR9pVyCrKEjH4yXJ5dAKLhdBb0acvpQ+NygbKwmIWRIB+hathW3ff4YJBVPoLh80fbh
         xbrUTOyVLFbu4bTqTdg4LpcClWGqnAWWGwo3a2IDeF/9QBfcIKAKbQ6fPFxmr0wNeIO2
         gVPovTQQMwqrp0pgEWGiehzvXeQjnp6I4oqSQR2gzJHIS4CsZnczMhzsD4NURFhXZ+yT
         FI/A==
X-Forwarded-Encrypted: i=1; AJvYcCVAFsug4f9vBZNHqvAp48mquiua2iCMntUtqkdsRx+GSwRtsEwx2N7QSTy18Uu+K2wxFhxl+MnYI4dJ@vger.kernel.org, AJvYcCVtqcwqyE0A1+1GyN/tJV9hcy6ttJDonoSHgUkEftACCdSTucmC+IKlLF4mqm9E6hsSIaHYda8/7pou8UJh@vger.kernel.org, AJvYcCWIJwhXOhANxNx+vMhPuH28jl5G0Qbd9oeqF1Fld9bVdGMsKuh3gnPJyW7Mm6ZFP3wsc10/UylbHaAw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/bp6mt91iudPW6kpvbN4d//5BYpeu5mzEklh+QSsGnliDgOjh
	3oH15MfJsGLAc8Y48+/eZHCzztqMx2KmSqtcykgF3Tv3vrXG1hF0jopX
X-Gm-Gg: ASbGncsg66XHmH21+8ZEMcHzkz0iMOSwtk5AHEHQ7tUpC22elAWfySM1JV4z+2KNylv
	dT95Qb0tjrTS8RILgFK5YUkp6xQhmpBc9JJ9ngBWU949Ck4bkjnuH9wOGiP4GXao/ejNzPutt+k
	3aobMHSTibcuEsLsGlKE+ywvVZky0KuOWv4V+y7SFcIMhiq49kgGlq2AcmGZmh5urvceC/04s1l
	ap8KZOT6zab3OyhBo4KmkXCpI5G8ftwm3G+vL5Ru0A/ygZtekqYlUBjymzYZ3/QXyv27wFHJTrK
	qPU3gEoyGLA50zPvKZwEB3BjPpDixmxb+kElEA/m3seA/E3YJYFqMaUQiHCSTfc8hVMzN6ISLFt
	A0R8R6Eyd0Fc/LzQJTLli2kI=
X-Google-Smtp-Source: AGHT+IHmyUfextSJYKW/B0dJOold2dMrY42j43HF9l7jc9Jyi1JVLeAGi+6sfKg2IAK8W5YemEeGfQ==
X-Received: by 2002:a05:6000:2a0a:b0:3b6:18be:3fbc with SMTP id ffacd0b85a97d-3b618be3fe5mr7634132f8f.2.1753121253150;
        Mon, 21 Jul 2025 11:07:33 -0700 (PDT)
Received: from Ansuel-XPS24 ([109.52.136.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca25443sm11183370f8f.9.2025.07.21.11.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:07:32 -0700 (PDT)
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
Subject: [PATCH v2 4/5] i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
Date: Mon, 21 Jul 2025 20:05:55 +0200
Message-ID: <20250721180710.2116-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250721180710.2116-1-ansuelsmth@gmail.com>
References: <20250721180710.2116-1-ansuelsmth@gmail.com>
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


