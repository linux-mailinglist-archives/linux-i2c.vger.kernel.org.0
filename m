Return-Path: <linux-i2c+bounces-5496-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23307956853
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 12:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A50FDB20F1C
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 10:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEE5165F1A;
	Mon, 19 Aug 2024 10:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jM/7nqaB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E93160865
	for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 10:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724063050; cv=none; b=cDLy8WQrwHfNDrPs3jFPEB+VKc7a/HRZft6XLXAsHBtmG/qQhoT+6tlsuM1HSIAkJOYOMPLahAtpG0LuRZqLDpVPzAMNl8NPQVXA1DNfHDf6CB0C18cd2bhsBcW51bEBRuCbEjXXm04cIIaYGLyxSzl575Jsb89I3i4pupkHZhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724063050; c=relaxed/simple;
	bh=lATT16tEASaWJrtIZ8R8OxHTCKd5ZoB5ix2CHDbDV6Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JCAJ5xmHPYhF+ACGK0puHeXNPnbkoHwEFmaerjOj9JGduuz6OLJX5lr1kK8iPOBIzHH7XH6M83ZyeroLMnQHaaM8hW8zYm3LeJcBJdb6zJJvUSgDTxHbV95wKd3a0CVZpG+QpL8wpZJ3A7uO2YYWxFF1spRnGs/WvOJiUDyMSHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jM/7nqaB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-429ec9f2155so27026195e9.2
        for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 03:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724063045; x=1724667845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ria4gejXgTrbHH7pUOF3bsKUCGfhOX9GK/RsFmy6f6k=;
        b=jM/7nqaBb5NIT5GNIxdjetb+Z0SPV2JTC7cG4Uwp12xFT301H7zMWR6mh0smiPkhzx
         Ea8xJUr9Bd/WjGCcApYvZE5pbnZCQUh8AfHBIhOojaIZaJY3avxr4geZLRQGZM2hkwOZ
         0Su36RjUoZQ2InPdqMezEqaZFXViAfXmBvLnv77naJafVvnJF3CwFeMXa4NDwU4IZamU
         burzyo4XlmJY0o2unleMusPVXBOYrA930hpFO5WmX5Z6fpOOcoisnhw5yk9MzK6AcBQp
         RuXt2Mbdk+cgeiyUiJJcqXAlL2sboyX/P7sVrDkrG5p3rZniXD/Tx/WeUS6TbPJb/VM0
         fcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724063045; x=1724667845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ria4gejXgTrbHH7pUOF3bsKUCGfhOX9GK/RsFmy6f6k=;
        b=nc8PxZbX8tnb60CBj03h/KpSTINtXFvg2lL8hrK85RcvsLNIAKxPD7+IWfL+btHJnR
         CYFldxsTu+m26Z2iwlmp+9l3opxRFTWp3dmjC59AN5KCfB79n2HdrzK8wWv9oNhix9xw
         omqJLbwHN5H5HN5pNCTHF85KM4T9uD2tlP3uyVMjEFX4WXGDQWOmNpT5SJoSNQKt+oxA
         CxDz8Ur1jeuaEDj+q8kxjqjTaZktHueCmta6gKOmlmI7aQmEtcWsZec2RDaTSAwhl+jh
         Pa7ygURjG/aFDdqUCcW3AdzpjggYuYZtV7udRr35iGTSvO3mEOFYCEs15TzgLolRt+Qc
         vevA==
X-Forwarded-Encrypted: i=1; AJvYcCW/cmcDUP3+zoLLvNjtWgLphaSvNCL/tgDzkJ8BIhnKVT3Mnetq+JC6+IFhs6xutgwknMVoM6NSDIs1lIWM3L7dzT9pD2J51+O7
X-Gm-Message-State: AOJu0YyRZmD6UdZ/GZs1LbhbH/IYGm1lDDZJDelqYoiIHphjCCPD2v8c
	P/tC4TGAbtH4fX5rLMlw1P30oElY3cl0zsBtsQhEPD6jHqtfwp6Br7qIe+lnx5I=
X-Google-Smtp-Source: AGHT+IFRms7CEp+mC2QUpyEJ6F7ca4xvMy27W1APCHnVbbzJpGgWcbRMxcsIbhj6IKc7uYK2FM2O0Q==
X-Received: by 2002:a05:600c:3550:b0:429:e67f:1249 with SMTP id 5b1f17b1804b1-429ed77db6amr68523215e9.3.1724063045333;
        Mon, 19 Aug 2024 03:24:05 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed650402sm106690275e9.11.2024.08.19.03.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 03:24:04 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 02/11] i2c: riic: Call pm_runtime_get_sync() when need to access registers
Date: Mon, 19 Aug 2024 13:23:39 +0300
Message-Id: <20240819102348.1592171-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need to runtime resume the device as long as the IP registers
are not accessed. Calling pm_runtime_get_sync() at the register access
time leads to a simpler error path.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- collected tags

Changes in v2:
- none

 drivers/i2c/busses/i2c-riic.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index bc33762a5d07..2e119024c2d7 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -301,19 +301,15 @@ static const struct i2c_algorithm riic_algo = {
 
 static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 {
-	int ret = 0;
 	unsigned long rate;
 	int total_ticks, cks, brl, brh;
 	struct device *dev = riic->adapter.dev.parent;
 
-	pm_runtime_get_sync(dev);
-
 	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
 		dev_err(&riic->adapter.dev,
 			"unsupported bus speed (%dHz). %d max\n",
 			t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	rate = clk_get_rate(riic->clk);
@@ -351,8 +347,7 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 	if (brl > (0x1F + 3)) {
 		dev_err(&riic->adapter.dev, "invalid speed (%lu). Too slow.\n",
 			(unsigned long)t->bus_freq_hz);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	brh = total_ticks - brl;
@@ -384,6 +379,8 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 		 t->scl_fall_ns / (1000000000 / rate),
 		 t->scl_rise_ns / (1000000000 / rate), cks, brl, brh);
 
+	pm_runtime_get_sync(dev);
+
 	/* Changing the order of accessing IICRST and ICE may break things! */
 	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1);
 	riic_clear_set_bit(riic, 0, ICCR1_ICE, RIIC_ICCR1);
@@ -397,9 +394,8 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 
 	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
 
-out:
 	pm_runtime_put(dev);
-	return ret;
+	return 0;
 }
 
 static struct riic_irq_desc riic_irqs[] = {
-- 
2.39.2


