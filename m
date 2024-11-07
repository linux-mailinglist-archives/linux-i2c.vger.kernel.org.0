Return-Path: <linux-i2c+bounces-7875-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A709C10CD
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 22:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9C671F20B66
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 21:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACAF21893A;
	Thu,  7 Nov 2024 21:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuJAqHdm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5113C2185BD;
	Thu,  7 Nov 2024 21:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731014078; cv=none; b=GS/ls7tfJ2S2K3vUMvz1DkfRSIAQKRP9FOzc7Qj4ln4LOYlzQXzqoO5GVnOtRlRZ8vuD4eoJOr9F3O5vb4IFoh1pxjM/6RwE2soEHB3/Q69iBcpvJuqk4+MXDWxraLKsWv8gqFHL4pZdC78MhcUERzbVJhN1Efffz7SOUu1aL8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731014078; c=relaxed/simple;
	bh=zzzyW8v7EZ7zw7Pi/ba6/6m1PE4JwT6Zv996YFDghKs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iTTWTAb/d9JVGCBun6CCAVWy4ONMq2Y+xAZmUIxgOmS+WXG9yyNxvOBX67qzJoI71mzsLMbKfCI11pQTtHHAQ8r7hvx9aTVW1EcfxrectPcibE1A8+kr4Mrx2QQm0BUbzyAJPLDXNImD/SQPuOMgOGANnk2kzFwX80bVaQ9lSSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuJAqHdm; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3e6005781c0so931090b6e.3;
        Thu, 07 Nov 2024 13:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731014076; x=1731618876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtYJat2vwne5+4WJO2r1NKcoNFx7A4N4AD7ayp8QtCI=;
        b=MuJAqHdmJZHOtvRGTpSUdlGTUTWxrBby5A4ANaNVVFFdbkFZVHagZ5fzE/Nyo7f60W
         2t6sZgfMkYgUngj3XvjUpbPdq1Ceoo8P+k8konXhx/5lRMWNo+TVD9jVz+Eh/BpJ0Mj5
         vPET5562fjgOPccmjD3MZLSrN6dD8nbszyiXJ4QpPcbzp2Ee4ZPQugD7HvcGxnPoiTfw
         Z2EHf6kusgcoWrhM5ukqFr/prCOnq1kUGLwGGOwkYgzf0Al2PO4v2HX6nY2XOm9j/9/C
         ygoUc59ACpMa16623kDJu9wgifMupvwgunSnnnshFx8mhUm7wACOCfM19a699hBbCJlV
         lnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731014076; x=1731618876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtYJat2vwne5+4WJO2r1NKcoNFx7A4N4AD7ayp8QtCI=;
        b=jxzqGKPymOA++U9IOnWmyVQNJygPhsW5DsMynBBVXaR8+DJ1fBGOu3d1oMX0Egsvi6
         ZnxwPTJygGB8YHg8wlQhFURAHohleFtvCZRWyxZnwMSmrf3KUA+wZMrVDmTr5H9WuqCV
         OBiY7WY4hRj2HYKM7l2axvyvvetIyFS54ISJtkOBLtQ2fUhMw+u6SCU0uxaWyCDvjxiu
         B513+qYJWS8R30qNENMX5TZ65whmJZXdJyXy5eWtl/H4iWo1GKyOL3gPkKAyMhD80DKS
         ewxCVh+fqEmhIRFsZ4/X61DSllfhjKJNhQTW8Si9fk0ocuTBA7yNsHyhBs6UIN1yruPr
         VVmA==
X-Forwarded-Encrypted: i=1; AJvYcCUMFO3kn+xuhMveX1raIXzaa6GYWMDROcJyaB18613PHBW3c+VLERQ4OFGTr/vW+p4peJmNm53u8To=@vger.kernel.org, AJvYcCXEbVw6vzFelisEJmB1y/rWrX4Wu/HtViTrhtSxH1OZtv6nXYcPSW1M0UdOb3dpwZ/Ls6EpzlcmKkb4yMqk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzwi7dNI0vajmXWGhb02dUMN6exwhnA9oUV8V+X1SBplbVE1uD
	tEjJXdA4EaB66KRIYB+pmLx+U8ac25GlyouKfe76vKIImoWd9Oz1
X-Google-Smtp-Source: AGHT+IGHP0pu9JWTZVGvNEWya7gP+rkzPi0pM59LG1R+OZu7lEwHGebIcNHfjBTkDrWb+2m5YeySdQ==
X-Received: by 2002:a05:6358:790:b0:1c6:12aa:a50d with SMTP id e5c5f4694b2df-1c641f81b71mr65221955d.25.1731014076286;
        Thu, 07 Nov 2024 13:14:36 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3962089fesm11486116d6.61.2024.11.07.13.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 13:14:36 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: andi.shyti@kernel.org
Cc: dianders@chromium.org,
	rmk@dyn-67.arm.linux.org.uk,
	max.schwarz@online.de,
	david.wu@rock-chips.com,
	heiko@sntech.de,
	vz@mleia.com,
	wsa@kernel.org,
	manabian@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v3 3/3] i2c: rk3x: Add check for clk_enable()
Date: Thu,  7 Nov 2024 21:14:28 +0000
Message-Id: <20241107211428.32273-3-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241107211428.32273-1-jiashengjiangcool@gmail.com>
References: <20241107211428.32273-1-jiashengjiangcool@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() in order to catch the
potential exception. Moreover, convert the return type of
rk3x_i2c_adapt_div() into int and add the check.

Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v2 -> v3:

1. Roll back unsuitable dev_err_probe() to dev_err()

v1 -> v2:

1. Remove the Fixes tag.
2. Use dev_err_probe to simplify error handling.
---
 drivers/i2c/busses/i2c-rk3x.c | 55 ++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 4ef9bad77b85..0263ee0e0470 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -871,7 +871,7 @@ static int rk3x_i2c_v1_calc_timings(unsigned long clk_rate,
 	return ret;
 }
 
-static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
+static int rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 {
 	struct i2c_timings *t = &i2c->t;
 	struct rk3x_i2c_calced_timings calc;
@@ -883,7 +883,11 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 	ret = i2c->soc_data->calc_timings(clk_rate, t, &calc);
 	WARN_ONCE(ret != 0, "Could not reach SCL freq %u", t->bus_freq_hz);
 
-	clk_enable(i2c->pclk);
+	ret = clk_enable(i2c->pclk);
+	if (ret) {
+		dev_err(i2c->dev, "Can't enable bus clk for rk3399: %d\n", ret);
+		return ret;
+	}
 
 	spin_lock_irqsave(&i2c->lock, flags);
 	val = i2c_readl(i2c, REG_CON);
@@ -904,6 +908,8 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 		clk_rate / 1000,
 		1000000000 / t->bus_freq_hz,
 		t_low_ns, t_high_ns);
+
+	return 0;
 }
 
 /**
@@ -942,19 +948,27 @@ static int rk3x_i2c_clk_notifier_cb(struct notifier_block *nb, unsigned long
 			return NOTIFY_STOP;
 
 		/* scale up */
-		if (ndata->new_rate > ndata->old_rate)
-			rk3x_i2c_adapt_div(i2c, ndata->new_rate);
+		if (ndata->new_rate > ndata->old_rate) {
+			if (rk3x_i2c_adapt_div(i2c, ndata->new_rate))
+				return NOTIFY_STOP;
+		}
 
 		return NOTIFY_OK;
 	case POST_RATE_CHANGE:
 		/* scale down */
-		if (ndata->new_rate < ndata->old_rate)
-			rk3x_i2c_adapt_div(i2c, ndata->new_rate);
+		if (ndata->new_rate < ndata->old_rate) {
+			if (rk3x_i2c_adapt_div(i2c, ndata->new_rate))
+				return NOTIFY_STOP;
+		}
+
 		return NOTIFY_OK;
 	case ABORT_RATE_CHANGE:
 		/* scale up */
-		if (ndata->new_rate > ndata->old_rate)
-			rk3x_i2c_adapt_div(i2c, ndata->old_rate);
+		if (ndata->new_rate > ndata->old_rate) {
+			if (rk3x_i2c_adapt_div(i2c, ndata->old_rate))
+				return NOTIFY_STOP;
+		}
+
 		return NOTIFY_OK;
 	default:
 		return NOTIFY_DONE;
@@ -1068,8 +1082,20 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 
 	spin_lock_irqsave(&i2c->lock, flags);
 
-	clk_enable(i2c->clk);
-	clk_enable(i2c->pclk);
+	ret = clk_enable(i2c->clk);
+	if (ret) {
+		spin_unlock_irqrestore(&i2c->lock, flags);
+		dev_err(i2c->dev, "Can't enable bus clk: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_enable(i2c->pclk);
+	if (ret) {
+		clk_disable(i2c->clk);
+		spin_unlock_irqrestore(&i2c->lock, flags);
+		dev_err(i2c->dev, "Can't enable bus clk for rk3399: %d\n", ret);
+		return ret;
+	}
 
 	i2c->is_last_msg = false;
 
@@ -1149,9 +1175,7 @@ static __maybe_unused int rk3x_i2c_resume(struct device *dev)
 {
 	struct rk3x_i2c *i2c = dev_get_drvdata(dev);
 
-	rk3x_i2c_adapt_div(i2c, clk_get_rate(i2c->clk));
-
-	return 0;
+	return rk3x_i2c_adapt_div(i2c, clk_get_rate(i2c->clk));
 }
 
 static u32 rk3x_i2c_func(struct i2c_adapter *adap)
@@ -1365,9 +1389,12 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 	}
 
 	clk_rate = clk_get_rate(i2c->clk);
-	rk3x_i2c_adapt_div(i2c, clk_rate);
+	ret = rk3x_i2c_adapt_div(i2c, clk_rate);
 	clk_disable(i2c->clk);
 
+	if (ret)
+		goto err_clk_notifier;
+
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret < 0)
 		goto err_clk_notifier;
-- 
2.25.1


