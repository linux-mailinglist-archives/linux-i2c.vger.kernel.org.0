Return-Path: <linux-i2c+bounces-4185-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AC7912357
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 13:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0F4BB23A5A
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 11:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3842176AB3;
	Fri, 21 Jun 2024 11:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DxdgPVxd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5884176258
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 11:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718969008; cv=none; b=lQvExXfUOzvCAIlXoyc7coKkLCiBL2Kl4bpG4I40X7m3US0LPaX8sHvCWDh3B0yUm+7tsAYlUgGbMF1vr0htWfY7zZwPtwkJAo7sY/mVt1UYbDHb9TWp8TxKSeGWvJN044AUyPffowK5i1EJkGkIDdnT3vj5WMbdbU6p8tbXF+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718969008; c=relaxed/simple;
	bh=wovYL+KBiDSSeNAZuqj5Clu00lS6lYUfaKOjsQH6z1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rqf1f+uKSovI5eGDm40gnq8w/x3Sx2n3snMsamuq3Kss+0EPnQA5+7drmimJcmd1hcz1OsmozHdybbEpqSM5N9arGh7Dj18cO7Pk7j3Lb0tZhdRon1LpMPeVbH5BOHR7s1QAxgAJqbZd6vQR1BVOAPTbz0fx3Y2cMx3MD7zVGks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DxdgPVxd; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6ef793f4b8so194166466b.1
        for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 04:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718969005; x=1719573805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dW9T/eZM5RV9t43dNQ65JhpJklu5g8GWF2aDPxi7wbI=;
        b=DxdgPVxdNQdH85Kp1i4VWsWAgJ3HtfIyaLY4BZz6QHWxDAP4zhdUXom5tupZJhc8Mp
         8O4OMWAm1jHiiahWlnwQc0zPtKT45bsoZ6MqhII3ZbYLca0HIC4s+ba8loBEDXGMNJOP
         LvVzCSkghK4nPykmblRYAFgP2QlTc5i8wKjwlL90T9X5lNz1ZetDTVtV/QQ2zi6JJNJH
         tLmHJXRUA5yrUMTQZrne2RAgWRBCWgAAa+9UXydzcc/GM2+miV6T/djEELurH8g8J1uD
         wSm0RKNnf9kzCH78uDSxhXGURYLR9HoZS7pMCfxX31uZ7bCr9I3ARmZY1PSAliZn5/3F
         j6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969005; x=1719573805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dW9T/eZM5RV9t43dNQ65JhpJklu5g8GWF2aDPxi7wbI=;
        b=nI8/BKotF/jbRuifXV3Eo5WjUuzBGvUY2Qx1ekzyIhNpDzzXpCVhc8Ohz0RNd9o58c
         OKHBlEKfGCOubXQKecr/bp0INSFH4cNP66KO2Vpk7QbRFHiUOzVcFqcxtfRgoyJ9k978
         UQR0qpe547AAFk/gm/0lXb0IZLsc2PdHlHOn7d6DD0sGJI5S7IYG+qI471ZRYtG+QuDt
         gPpb0hlEuzGtq3jtZb7C0r8ylHLge7bFhseNnkVxXFgdhlbPOXpO78OKidQOqNOeG9sF
         85rCwUHey8tBvoDxIpkldHY3RmjTe44BceU9P5dA4w8+t0bs/s4Ki15h0bzwCcqoSiB/
         XhSg==
X-Forwarded-Encrypted: i=1; AJvYcCVWEjhVIvyzVIx0g/KxDYmcmenkRImZNtdePV7m7uJcq4bADFohcbeTRNLtykP5DmVDJPzefxdg0OeTDuLy9P06FOYXeNr10p74
X-Gm-Message-State: AOJu0Yz77jTGgBPuSSei1qpMTSSH7SQLTxzUrI6Reg7xUC474PXYTV9I
	XzLqR029J7b13TZc0sQ1CeqAK4uKyvEwV6zDzAdKAGWtan8f0lwoU37kcfnppZc=
X-Google-Smtp-Source: AGHT+IFy1kAEcnlAOSo5nHvfvKjAEwLrS0YbBwtI4Y6CfpkEaCc5opX+RA9D00tsKvOBrO+igWIdbg==
X-Received: by 2002:a17:907:c80a:b0:a6f:bdb3:9748 with SMTP id a640c23a62f3a-a6fbdb397e2mr314408366b.33.1718969005480;
        Fri, 21 Jun 2024 04:23:25 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fd0838345sm64498466b.99.2024.06.21.04.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:23:24 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 05/12] i2c: riic: Enable runtime PM autosuspend support
Date: Fri, 21 Jun 2024 14:22:56 +0300
Message-Id: <20240621112303.1607621-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable runtime PM autosuspend support for the RIIC driver. With this, in
case there are consecutive xfer requests the device wouldn't be runtime
enabled/disabled after each consecutive xfer but after the
the delay configured by user. With this, we can avoid touching hardware
registers involved in runtime PM suspend/resume saving in this way some
cycles. The default chosen autosuspend delay is zero to keep the
previous driver behavior.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 6b739483ef37..00fb09786e48 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -175,7 +175,8 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	}
 
  out:
-	pm_runtime_put(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return riic->err ?: num;
 }
@@ -405,7 +406,8 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 
 	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
 
-	pm_runtime_put(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 	return 0;
 }
 
@@ -485,6 +487,8 @@ static int riic_i2c_probe(struct platform_device *pdev)
 
 	i2c_parse_fw_timings(dev, &i2c_t, true);
 
+	pm_runtime_set_autosuspend_delay(dev, 0);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	ret = riic_init_hw(riic, &i2c_t);
@@ -502,6 +506,7 @@ static int riic_i2c_probe(struct platform_device *pdev)
 
 out:
 	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 	return ret;
 }
 
@@ -521,6 +526,7 @@ static void riic_i2c_remove(struct platform_device *pdev)
 	pm_runtime_put(dev);
 	i2c_del_adapter(&riic->adapter);
 	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 }
 
 static const struct riic_of_data riic_rz_a_info = {
-- 
2.39.2


