Return-Path: <linux-i2c+bounces-11077-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62126ABE3EE
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 21:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0371F4C554C
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 19:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A863281524;
	Tue, 20 May 2025 19:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHNnV4sG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814E525A645
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 19:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770255; cv=none; b=YFSOBWva4eYfKF+rfbIl96c1+pu46IPMbBRBkqEbxOycIB8ZeIijAK9GzKf91ka1hHUbJ1mNmqnCli0N9pY1xmwIkW2Hwph4Qm1Xhd5az0fNuSz9NGsrWn5tgVL0rpB4j61//LxrmRfPQVMqkOVul4+Ko0UFeK84ZXIrMjO/u5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770255; c=relaxed/simple;
	bh=nGYnKGhw73dJHiwm1W1eb6FQjjywGbLAgxARipb5Iw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wnk0vGjeZzhLbHZySZSZIKed5obyPuJmvMSfcGQ20FDUDGLOdNjNcVoYzgXCFhzytHXwY+1UX75qY7U4/xbH081I2Ze12CYiE/YmolhVi6TgZVcI/lBnjIaFoqD2nC1npdFljcOaeI0QAJny0GuII32ycV6uOO3v9crB3jg37fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHNnV4sG; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-601ad859ec0so6266542a12.0
        for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 12:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747770252; x=1748375052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ov9ZG4e7DE6olqmoqUw7eHlut/Cel5+9g7jkUvcF8w8=;
        b=CHNnV4sGu6wQYeaQuUYiTSzlJt1XAYp44XAyLs2BDooVH89Zx4TE2ovnmmJqHH2nRs
         zAU/kQm9qy7R1govpUpthqhkEWdSexhqXUprzg7m3pTbsjxXoa68YKT1OBMQXVvflh5l
         /nRMCF5i6G/W57m5y28f/Leh7i8whQxPRD0xbsIJyPpJiRRihM5u74aU4PhjyTb4JbKI
         CdtpkEkWMKC6kr0SV9AI+3KI+TGL/aI6uCHHPIAWD6gTGX6Q+mNqxO9BliHIREMmNTYc
         SzgBWkDrRRT8yz12vFpu2dYaXSjWCwJmQ6asl6VQxZSQ77NnRVrVBz0wavhR85KlxflU
         KUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770252; x=1748375052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ov9ZG4e7DE6olqmoqUw7eHlut/Cel5+9g7jkUvcF8w8=;
        b=QlaThCn3KDrVWXnJOMDaUItDrZqG3ptACC/Qr2eT9BzVH/EPwcYyL2m3iGLMckc0sS
         5SJGiLaaRGhSTRTYcqnAILQYRVe0kR3uxAqjz1qmO/iVFrWbjHJpBCmeEWmKciOz7Xy2
         kJ8tEfUX9Zy9k5c+9U9NYBPS/T8dI6ZiudbvMEcpg/mVqaKVlepRyvbORuyhsq0TdZXC
         /wuDvjb7q1OSejsqjoRbrtRp3FYwgpFFNHTCMZOgpTFEf+qr8bYmY+Pu8I/P8Hz7HBB7
         WvjjdIl8rLvyPumzdmw7BIlzlgfWUfQK+sGHYKIDsue9UPkAZ/ItNLwI4SFrepyiCZcF
         IhKg==
X-Gm-Message-State: AOJu0Yz2ZrMqEzKnj8NcwztcNpUXM4kp+OLmOWLmTAVXACn0sm8jHUDs
	5XNne4CxR1UHnW8UWXEhpTXblC015ebeft7iG4LsZ/trlcbglWmVPwGloiWHo4h+zzU=
X-Gm-Gg: ASbGncuPdJKqD1UqnVOG5/sREqvwnpFjqThMZ7hZG/hBraUTmxEdUVD2yCBcyucj1Ay
	9IVtRbUx8+s3DX7JgkXp8Kj2Hd1leNIGqPhmDqwQAbh1hDw4SB7K9KbGmyPvmfTm/DpQAyC2Di1
	zuRu4eTdM8+E7Q2HJn1Lj63m4iPDesoCzcfFS6zEP+Zfn+hFkYskLVR2dc0qOZTvfP9LqmDoi2Y
	L+rIRuLwolx1qtjDJT3b3tMEV/UhRAzB+7K7XebNWZUNl4d2H1Qbe8lLf01f5KAKpN5QvxDfSaT
	5+V1zyrvlr8X5uKyl+44NOhpLPzfIy6qXqmEvRzUb85MNuLyLQx3+Fy/07AS0hEUXWRQYwdyXtP
	QFdI0dQ==
X-Google-Smtp-Source: AGHT+IFHamLUlaZH1stWXeZDPt+Zw/8x4O1P9FYC2tlodQCiVww7NBfQCkxto8I3cnYb2GuQLfHPCg==
X-Received: by 2002:a05:6402:90a:b0:5fb:1cbb:9390 with SMTP id 4fb4d7f45d1cf-60090185bbamr14917065a12.33.1747770251683;
        Tue, 20 May 2025 12:44:11 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-11.cgn.sunrise.net. [194.230.145.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac33a98sm7736122a12.49.2025.05.20.12.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:44:11 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 03/10] i2c: sun6i-p2wi: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 20 May 2025 21:43:53 +0200
Message-ID: <20250520194400.341079-4-e.zanda1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520194400.341079-1-e.zanda1@gmail.com>
References: <20250520194400.341079-1-e.zanda1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 55 +++++++++++------------------
 1 file changed, 20 insertions(+), 35 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7f..dffbe776a195 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -194,22 +194,16 @@ static int p2wi_probe(struct platform_device *pdev)
 	int ret;
 
 	of_property_read_u32(np, "clock-frequency", &clk_freq);
-	if (clk_freq > P2WI_MAX_FREQ) {
-		dev_err(dev,
-			"required clock-frequency (%u Hz) is too high (max = 6MHz)",
-			clk_freq);
-		return -EINVAL;
-	}
+	if (clk_freq > P2WI_MAX_FREQ)
+		return dev_err_probe(dev, -EINVAL,
+				     "required clock-frequency (%u Hz) is too high (max = 6MHz)",
+				     clk_freq);
 
-	if (clk_freq == 0) {
-		dev_err(dev, "clock-frequency is set to 0 in DT\n");
-		return -EINVAL;
-	}
+	if (clk_freq == 0)
+		return dev_err_probe(dev, -EINVAL, "clock-frequency is set to 0 in DT\n");
 
-	if (of_get_child_count(np) > 1) {
-		dev_err(dev, "P2WI only supports one target device\n");
-		return -EINVAL;
-	}
+	if (of_get_child_count(np) > 1)
+		return dev_err_probe(dev, -EINVAL, "P2WI only supports one target device\n");
 
 	p2wi = devm_kzalloc(dev, sizeof(struct p2wi), GFP_KERNEL);
 	if (!p2wi)
@@ -226,11 +220,9 @@ static int p2wi_probe(struct platform_device *pdev)
 	childnp = of_get_next_available_child(np, NULL);
 	if (childnp) {
 		ret = of_property_read_u32(childnp, "reg", &target_addr);
-		if (ret) {
-			dev_err(dev, "invalid target address on node %pOF\n",
-				childnp);
-			return -EINVAL;
-		}
+		if (ret)
+			return dev_err_probe(dev, -EINVAL,
+					     "invalid target address on node %pOF\n", childnp);
 
 		p2wi->target_addr = target_addr;
 	}
@@ -245,26 +237,20 @@ static int p2wi_probe(struct platform_device *pdev)
 		return irq;
 
 	p2wi->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(p2wi->clk)) {
-		ret = PTR_ERR(p2wi->clk);
-		dev_err(dev, "failed to enable clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(p2wi->clk))
+		return dev_err_probe(dev, PTR_ERR(p2wi->clk),
+				     "failed to enable clk\n");
 
 	parent_clk_freq = clk_get_rate(p2wi->clk);
 
 	p2wi->rstc = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(p2wi->rstc)) {
-		dev_err(dev, "failed to retrieve reset controller: %pe\n",
-			p2wi->rstc);
-		return PTR_ERR(p2wi->rstc);
-	}
+	if (IS_ERR(p2wi->rstc))
+		return dev_err_probe(dev, PTR_ERR(p2wi->rstc),
+				     "failed to retrieve reset controller\n");
 
 	ret = reset_control_deassert(p2wi->rstc);
-	if (ret) {
-		dev_err(dev, "failed to deassert reset line: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to deassert reset line\n");
 
 	init_completion(&p2wi->complete);
 	p2wi->adapter.dev.parent = dev;
@@ -276,8 +262,7 @@ static int p2wi_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, p2wi_interrupt, 0, pdev->name, p2wi);
 	if (ret) {
-		dev_err(dev, "can't register interrupt handler irq%d: %d\n",
-			irq, ret);
+		dev_err_probe(dev, ret, "can't register interrupt handler irq%d\n", irq);
 		goto err_reset_assert;
 	}
 
-- 
2.43.0


