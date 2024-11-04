Return-Path: <linux-i2c+bounces-7768-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A69D9BC040
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 22:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D7661C21E72
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 21:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA8D1FDFA3;
	Mon,  4 Nov 2024 21:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rrsfwb9l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4877E1FDF88;
	Mon,  4 Nov 2024 21:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730756599; cv=none; b=NkgqHxVB40JF09FJBgirz7lTnqyizXwUWxcfnHPF/LAZj1xWJu4ipTvp1lKZ/Loc1+FvZbZzKhawgPNEMiWb73M9Qb7kfZf94maEmU1XhjwPC2Do8uwA6KyV8wqa1YP9OL2rA5WeqB2Esrhtz3mPmXZlr0mNTgUFvanjGroH4YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730756599; c=relaxed/simple;
	bh=bpKFPPtC1GStj4J3pND2QCsA8ppdzq3JzH/A/uLN4i8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c2dQWu/I5Ow58v/SJtm1uNZbeQrpm1AiVZN168Wzu5Oim4CHEBluS9wPvc5aMfBg9DjK//K/MkCksIJq5mROXCCLPzdQQSM8Sg/xU6DTQJUjl55ElraOWHCYzvbrmSiRaDVJkBOdJS+FXYe3alIZek7MEt5u0wZ0k/YP8ajelBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rrsfwb9l; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6cbcc2bd7fcso31966156d6.1;
        Mon, 04 Nov 2024 13:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730756597; x=1731361397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpEshnq6i6G+Np3ZVcF5ef21yjGyMRFFgjDXZD1qG8A=;
        b=Rrsfwb9lZzgj9op302JbXmVOnY/1IrettQ1r0gkhdHz59QYUFmwLwsWzBW37dI9crx
         JNln9N4TR1K/wO+6lizrw/HwjZfFuXg8XkpbfulvWqQeRW6GA84mG5pu/zDEk1NxNMJb
         udn+6vWhOTgQDFCOCB5y44VsSTHjA0WeDXY3/ilxQHmi4cksd1wB9A85ZoQMXNCkrsFS
         uaKbh7ButvmSNgaiSr8fjIhdHoss43tlPI5VSz+amJvhjn/VVk0Ns2ymkj24UlS8F1g8
         h7IKepUPQL8vNpjSRFPTSvnAA/eL5Ekj3NZcPjynRURQ05FCPsMSHGAJMVw8vqdR4sgd
         sOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730756597; x=1731361397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpEshnq6i6G+Np3ZVcF5ef21yjGyMRFFgjDXZD1qG8A=;
        b=e8tF7PYE+is+wvq6hHs7iAIJxRZyJST4+e7vD5ecAyC3tl/nadZAsEThgwYU2vaLN3
         Yzky9BJ+UtWdONaIEDeAr/1Uv8mm1dUCYPKvB1iF4qyc0LnFx6MXEWThtfz1UrWy3S2p
         tZjJ55tHIcfYG3nTftZiZ5eDM3jMx3u7Z1HM00raxwSt+KnsIvS8PQnUv9poDiLuBvI7
         OZDuXdV+xy51rD+HrSrxHXYF2vkbdiqGNdv9clvygmih0acoCel6OVYjlDH16GAKzhZC
         9L7j8/bVslVz0VglIfWyf4X8y5UcNIihsU/N+KiBtocyVtipx1FQTr+TZBY96JB/FxpS
         UYLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcKWeASx9zAAmMC09e6sFsDOqc48AEXeygf5thGiI3M9mGR4FyiaD6sFd7CIP7K3vPUssEc3QvGLw=@vger.kernel.org, AJvYcCXvbtyiKOT4xjTlCkO9AHjGiWJi2JJEu2durEgZh9oQl/2+6FhHdkIWCKGkeUNDYr6EDvd/sL05rgcPR730@vger.kernel.org
X-Gm-Message-State: AOJu0YzzeeLmCzV0MFcebKXCFJaUq1MyTQjhQWRKQJ5krOTluYLhjhzE
	RRH2IDkhtoaijVVcBDmbnW1BzpbK0Xq+hf8SBP5PYdW8zFLXN9l+
X-Google-Smtp-Source: AGHT+IES5Vzl7DJKtNHPJ7UmtrOwkZwfCRkFo15pFheXgrIEAUHkNDpzR2YA54jau7pQhc5lYfGEsQ==
X-Received: by 2002:a05:6214:5f01:b0:6d1:7854:ab49 with SMTP id 6a1803df08f44-6d351a8f23bmr277872066d6.11.1730756597159;
        Mon, 04 Nov 2024 13:43:17 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d35415b1edsm52553916d6.75.2024.11.04.13.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 13:43:16 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: rmk@dyn-67.arm.linux.org.uk,
	max.schwarz@online.de,
	dianders@chromium.org,
	david.wu@rock-chips.com,
	heiko@sntech.de,
	vz@mleia.com,
	andi.shyti@kernel.org,
	wsa@kernel.org,
	manabian@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH 3/3] i2c: rk3x: Add check for clk_enable()
Date: Mon,  4 Nov 2024 21:43:10 +0000
Message-Id: <20241104214310.6048-3-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241104214310.6048-1-jiashengjiangcool@gmail.com>
References: <20241104214310.6048-1-jiashengjiangcool@gmail.com>
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

Fixes: 7e086c3fc2df ("i2c: rk3x: add i2c support for rk3399 soc")
Fixes: 249051f49907 ("i2c: rk3x: handle dynamic clock rate changes correctly")
Fixes: c41aa3ce938b ("i2c: rk3x: add driver for Rockchip RK3xxx SoC I2C adapter")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/i2c/busses/i2c-rk3x.c | 55 ++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 4ef9bad77b85..a4662b0dbd8c 100644
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
+		dev_err(i2c->dev, "Can't enable bus clk: %d\n", ret);
+		spin_unlock_irqrestore(&i2c->lock, flags);
+		return ret;
+	}
+
+	ret = clk_enable(i2c->pclk);
+	if (ret) {
+		dev_err(i2c->dev, "Can't enable bus clk for rk3399: %d\n", ret);
+		clk_disable(i2c->clk);
+		spin_unlock_irqrestore(&i2c->lock, flags);
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


