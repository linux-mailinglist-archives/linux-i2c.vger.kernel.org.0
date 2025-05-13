Return-Path: <linux-i2c+bounces-10967-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB063AB5E38
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 23:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2344C868185
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 21:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9D91F2B8D;
	Tue, 13 May 2025 21:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVbedR+t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA5453365
	for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 21:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747170308; cv=none; b=AzV2VpTbPW/IY7ygy4bxRS8DZDeMCkVwsS8LQIKntk70tHv1b+m6m7UBDNpWNJDarQKRkWOWzCBbfPec7QLuJaUW5G49doxKMuFgs+cWqobZDbV4O/fhJ1OhskNpnbPtB5eHhSkIZQNh3J/qU69ZsLD3lS/GclJ7PtmMvMzEs9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747170308; c=relaxed/simple;
	bh=RMXf7DgFqRGIW7RBQzeGQBRN8s8cYlgemD3g5umwgW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o/GgurPVBVJ5GkQu8BwwAn4pM3ncWA0pcCpS7XNVq4kCclcHU4gB6JgvNyg+WgKl2dlJrBRBw2iycdjMjf6uDoAyYTBwAlCy6IywEV3QE/XbvVMeKI6WzwJ4k4FiMeF/ctziE0hWfb2+Y9vTSpZE8NoUzuXVF9jB8jfULacfE4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVbedR+t; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad1b94382b8so986901166b.0
        for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 14:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747170305; x=1747775105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pog/0yUjQeDYMRklkNsdv1HA22uJ1oywCnyTgrV9xoM=;
        b=fVbedR+tS8+9DDipHNlQAIWmR0vUnt2oiMkgSh+lx5RaMm2Hs0Y9hlSortmZ5PeY0V
         iB1NDuNNFSIvKjUCduoVS7zexErVkn4bfUezZXi4ObzTOZa123myDzAqUI+sPNOe+Bp1
         asX9Jr7gszciPPw3HHGz1D3WaQp9s9fORQbfkOpz2KstKLeqP3VEeOLREPej/VUzqFZa
         +nWn6FiuZ858Z9ftQMANq3ELi2XmevunUo2d+koGHBn4jveBYDxKyF7Ooy7SJlniYpr3
         jWuDbbMnMcOxZPp/5sAwaVt8yB+MlnS0dJfydo8w4cgRUtvYjJHM3ih41DtuBhNfEtSS
         yaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747170305; x=1747775105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pog/0yUjQeDYMRklkNsdv1HA22uJ1oywCnyTgrV9xoM=;
        b=ZH99xGqgf/QJpy9j4fPhUhRqRlm4pYRtSyib1yvkRRCyc5zjvFISaxvjhA1EuNF6RS
         tOJhOnKNqpe1GcChjEDb7Y8V/0ByRIeDhNZqGjLr6tpgI3nQv2HjaAvscHeBgCIIIKGB
         EJHOjQWTwjomIEN3KmG4v5+ECh2tDM2KLvBF6Rd3An8eeLPdRlQ4XI8FY4YvOf0A96yV
         ivVr4Xujm996cQR2GbRW8uVqw/xShNjsqHcGQUZrB2lA18OLwSK7fzstrOn7iLWV7hNQ
         OqaGm/9AxGvs4JymGh6dp/0CA5k3Qv5mnP5kYEjDGzsN7cZRBxYgoilScjjfPNw2chwo
         aPaA==
X-Gm-Message-State: AOJu0YyDqmEIM3x5CTFQsypAlTZFGQMqVcag4XX8DwheGuNb7/50nyYE
	wyhqUHQ90cdORiaz1r2o773y+/t03BUCJa1G6ME/IwNlvr0GB03UmzwCVw==
X-Gm-Gg: ASbGncv2xs6MYLs4dG+tzEfDf4c2fJTn1BwyR+4SJQn0W80IkTQiUuvmW+AlIohrdqY
	Z8pCy7XrcO0vzZl8vcOeYx3c7MM2rm84Fxl+7vmUmjc/RL7RWZvxdsecQUyzBrO4kjpfDSwhg0C
	KPCXfLR7KJVlVpBL8iv/+xQs1oEXuL4/Cqj4JWVFVfq768k6f4MMDmTQDFZt/fz00TRjoQ6tQvs
	2Gyv95gyPz5Dl75te0ps4IEYRZF6kHHWn4J6WTuBtELBwLW5ZOcjfcdBIL84tTasR6bsS2WLFuu
	GcqoTWtCZ7lN/sR1R9+bXCxMZT9lkhwGJu3/G8uaAcZBYkNtvmzprp6BW6bHH8N8uQzmaeNfv7I
	L8p4yAq6P
X-Google-Smtp-Source: AGHT+IHYcPXNXm7fu4EVNMrnbTMv8bxMtJYUS+jyyeNawwqtkNO0AoyCotknt9oZAutAfSpGA1T4yg==
X-Received: by 2002:a17:907:96a8:b0:ad2:378f:99ef with SMTP id a640c23a62f3a-ad4f70f619emr70280266b.8.1747170304615;
        Tue, 13 May 2025 14:05:04 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-210.cgn.sunrise.net. [194.230.145.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd525sm839630566b.144.2025.05.13.14.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:05:04 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH v2] i2c: viai2c-wmt: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 13 May 2025 23:02:47 +0200
Message-ID: <20250513210246.528370-2-e.zanda1@gmail.com>
X-Mailer: git-send-email 2.43.0
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
V1 -> V2: Completed dev_err_probe() substitution and removed redundant call

 drivers/i2c/busses/i2c-viai2c-wmt.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-wmt.c b/drivers/i2c/busses/i2c-viai2c-wmt.c
index 4eb740faf268..2cf3cc0165fb 100644
--- a/drivers/i2c/busses/i2c-viai2c-wmt.c
+++ b/drivers/i2c/busses/i2c-viai2c-wmt.c
@@ -44,16 +44,13 @@ static int wmt_i2c_reset_hardware(struct viai2c *i2c)
 	int err;
 
 	err = clk_prepare_enable(i2c->clk);
-	if (err) {
-		dev_err(i2c->dev, "failed to enable clock\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(i2c->dev, err, "failed to enable clock\n");
 
 	err = clk_set_rate(i2c->clk, 20000000);
 	if (err) {
-		dev_err(i2c->dev, "failed to set clock = 20Mhz\n");
 		clk_disable_unprepare(i2c->clk);
-		return err;
+		return dev_err_probe(i2c->dev, err, "failed to set clock = 20Mhz\n");
 	}
 
 	writew(0, i2c->base + VIAI2C_REG_CR);
@@ -121,10 +118,9 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 				"failed to request irq %i\n", i2c->irq);
 
 	i2c->clk = of_clk_get(np, 0);
-	if (IS_ERR(i2c->clk)) {
-		dev_err(&pdev->dev, "unable to request clock\n");
-		return PTR_ERR(i2c->clk);
-	}
+	if (IS_ERR(i2c->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
+				     "unable to request clock\n");
 
 	err = of_property_read_u32(np, "clock-frequency", &clk_rate);
 	if (!err && clk_rate == I2C_MAX_FAST_MODE_FREQ)
@@ -139,10 +135,8 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	adap->dev.of_node = pdev->dev.of_node;
 
 	err = wmt_i2c_reset_hardware(i2c);
-	if (err) {
-		dev_err(&pdev->dev, "error initializing hardware\n");
+	if (err)
 		return err;
-	}
 
 	err = i2c_add_adapter(adap);
 	if (err)
-- 
2.43.0


