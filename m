Return-Path: <linux-i2c+bounces-7789-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B704E9BD22A
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 17:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB48C1C2313F
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 16:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC4B183CA7;
	Tue,  5 Nov 2024 16:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OG45trwz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0182D17DFE8;
	Tue,  5 Nov 2024 16:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730823510; cv=none; b=iMrnml4xQxfUNnMb3SAQeLm+bzlepUNiQv05nsKKo2SuHI8PFf9xH/91zFRyAHAQ3hrO07UD71iPhOAjufE8hOmj10MikhdNftE8837JDUCwkHOhrNySisKa4vR/1NroVac2A7M2dTn6yDbRjZUQmuNMnmFQVZeHet9LpLxnwi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730823510; c=relaxed/simple;
	bh=CNx5+P8L3AbdA637G48DT+8HgcBVx2RQ5y1gvQK3YGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WDuLNEvhWc9lZo52Ac/o6XH9/6o7n22Of3l+scT8Tuoe2iQqWz8+udYrsLidcUzCdhBKB0tbp9+i/ajlci+GfvMOtPsB4aLwv4djSuRYAx+RJyd1bdQsGkRHl/HPjjXAXXC3fVGnPjgvFTL3PDRTfA3OlY+2BNmZhmaLfmPWK0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OG45trwz; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b155cca097so446460685a.1;
        Tue, 05 Nov 2024 08:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730823508; x=1731428308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZsBpzkk5eIxxCoFTUQlG8fOz3VfVWVw0fc2odhFnds=;
        b=OG45trwzN+h+SCWuKJD+yeWXl2uBxtlkawJi8dQJIHhRStRwZNmxCvwxBcOyeNirJq
         KCY9iTEOtmYAow9gXylSpsAPZfcn1UryBIoX0TVEM16RNqb/D+3P9wEvt7Tq3yzLIwoD
         I8LatHSRVeh415r6qTJUzM2+PToDqpX9edY+ROR9Z2SPYVQ32rEyVuoTv6y7VrMJV6+I
         ApCZjLsyPdqV02DO86BNMp2t4w/OOED9AxtrEDlR78Pg3TSxyy9OlYUxYdrtoY7iA2RH
         5+8hfyCltxhAtbY1i6MvbT77HsyxoiD0U7nbMyuvsc+sm5P/cjh1Nn1ofx/aQY4ruVlS
         QK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823508; x=1731428308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZsBpzkk5eIxxCoFTUQlG8fOz3VfVWVw0fc2odhFnds=;
        b=W9EixnIyLfGjahwEUzbaflhwpa6I6dwCOrL21yH/UHwSPN9/QRXcvlv7W8+PwHzvn7
         m3vfBcNa+s7R02rUQn4xLX2945PCxspOCypqQRknyo9cy4DArqUSqbGkFlG0mWMX1PEi
         4Rft8BrD874TOTW4W+6cDuJz+5uA95TCji664s3XWo3453DQizAWNtArUroZNgd460gs
         zeXfWPBVHytmHFftVsjVCHnGgXDqTqGhRmdpYuerVVVcc9IT1YX2WjZn3NUxUUuvOQHh
         psoDGiEWyW93Hx3Zguu1zJDRtGNoV70p/tBjU+W2BEOcoIiS/e6HEZU4J34iXA14aLs8
         B3IA==
X-Forwarded-Encrypted: i=1; AJvYcCWB3NeuhZIfIoibwGZuZ/HKBrE59Dj7rjbxG7G1LQ9R8WgMOeZt/seAM+4P1feOPWn9ZXcYXo55n/w=@vger.kernel.org, AJvYcCWiPczRWOIfZ7kfCFQpJErk7efncDNlm9B45uc+oamjyRjmGyzc2hnSo8glNPpRkr77ybaAc44LS2M4jaDS@vger.kernel.org
X-Gm-Message-State: AOJu0YywqsoJ5a+fjGUPM5bbH71cDsZzx/W414tDsEycfFvbl93gmvHC
	gNtXF0bmxJMbnAtxkIGEzGDr0dts63TAkXQa6aLdbYIAWJ0HQeoa
X-Google-Smtp-Source: AGHT+IGQEeuVCyhghtqvJgTQQUezecC0Efl6QzEbppiW669eVn4FBMz1WOBfVXc/9kFFbFVBKkX7wg==
X-Received: by 2002:a05:620a:284b:b0:7a9:c129:504f with SMTP id af79cd13be357-7b2f3d3999emr2948846985a.23.1730823507790;
        Tue, 05 Nov 2024 08:18:27 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f39eb14fsm538010885a.7.2024.11.05.08.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:18:27 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: andi.shyti@kernel.org
Cc: rmk@dyn-67.arm.linux.org.uk,
	max.schwarz@online.de,
	dianders@chromium.org,
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
Subject: [PATCH v2 3/3] i2c: rk3x: Add check for clk_enable()
Date: Tue,  5 Nov 2024 16:18:20 +0000
Message-Id: <20241105161820.32512-3-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241105161820.32512-1-jiashengjiangcool@gmail.com>
References: <20241105161820.32512-1-jiashengjiangcool@gmail.com>
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

v1 -> v2:

1. Remove the Fixes tag.
2. Use dev_err_probe to simplify error handling.
---
 drivers/i2c/busses/i2c-rk3x.c | 51 +++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 4ef9bad77b85..57c2d37fc7c3 100644
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
@@ -883,7 +883,9 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 	ret = i2c->soc_data->calc_timings(clk_rate, t, &calc);
 	WARN_ONCE(ret != 0, "Could not reach SCL freq %u", t->bus_freq_hz);
 
-	clk_enable(i2c->pclk);
+	ret = clk_enable(i2c->pclk);
+	if (ret)
+		return dev_err_probe(i2c->dev, ret, "Can't enable bus clk for rk3399: %d\n", ret);
 
 	spin_lock_irqsave(&i2c->lock, flags);
 	val = i2c_readl(i2c, REG_CON);
@@ -904,6 +906,8 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 		clk_rate / 1000,
 		1000000000 / t->bus_freq_hz,
 		t_low_ns, t_high_ns);
+
+	return 0;
 }
 
 /**
@@ -942,19 +946,27 @@ static int rk3x_i2c_clk_notifier_cb(struct notifier_block *nb, unsigned long
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
@@ -1068,8 +1080,18 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 
 	spin_lock_irqsave(&i2c->lock, flags);
 
-	clk_enable(i2c->clk);
-	clk_enable(i2c->pclk);
+	ret = clk_enable(i2c->clk);
+	if (ret) {
+		spin_unlock_irqrestore(&i2c->lock, flags);
+		return dev_err_probe(i2c->dev, ret, "Can't enable bus clk: %d\n", ret);
+	}
+
+	ret = clk_enable(i2c->pclk);
+	if (ret) {
+		clk_disable(i2c->clk);
+		spin_unlock_irqrestore(&i2c->lock, flags);
+		return dev_err_probe(i2c->dev, ret, "Can't enable bus clk for rk3399: %d\n", ret);
+	}
 
 	i2c->is_last_msg = false;
 
@@ -1149,9 +1171,7 @@ static __maybe_unused int rk3x_i2c_resume(struct device *dev)
 {
 	struct rk3x_i2c *i2c = dev_get_drvdata(dev);
 
-	rk3x_i2c_adapt_div(i2c, clk_get_rate(i2c->clk));
-
-	return 0;
+	return rk3x_i2c_adapt_div(i2c, clk_get_rate(i2c->clk));
 }
 
 static u32 rk3x_i2c_func(struct i2c_adapter *adap)
@@ -1365,9 +1385,12 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
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


