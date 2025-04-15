Return-Path: <linux-i2c+bounces-10366-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9C0A8A6E0
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 20:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87B007ADD15
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 18:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A5E22688B;
	Tue, 15 Apr 2025 18:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtrGxS5a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E2F22686F
	for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 18:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742139; cv=none; b=L6LI8496meOza0kiWTLXrTxpUcT+XTmgEObSlJoq4nnNlgmv7tf6stpyUnupicd70bcZcA0HbPTWBhqJlkodWKOoQUM3FECT2W+tiBIUwX6KQK/W9H7zbfD3BzvVdNYcQN1ncE4hc+uNoIBFy1Lui/54RF73XDnD1QZl9nNNrx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742139; c=relaxed/simple;
	bh=wtvkK7t8bKcV1fXBVGIuLimOCdXGq7mpKoeZ36ObVgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9zee/H1s8aApaG/le7+yZKEbxVIHZIQs1aidh+FncHB/2c4pFaprnn4Ukw6Qh2eXuG56uylOZFDMZmiIc6TE+aX3R2rJijH2/1lJuGwe9Y7igRi4O+R3m9YRPrBNZSiboBjlIf1Vy/XO0H+ecvSMAgGQgpjpyQ3hO794Zt1nco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtrGxS5a; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so10850547a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 11:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744742136; x=1745346936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+BiVUOweVIHSXPffjiVNDnalTCKeOgbSdliRb/NekU=;
        b=OtrGxS5aj+Ozw/FrA0SCadKfXU1G6/VhOpDgAcVLgLfN7dUd1zMDG7h9EH1N4TKrZL
         HnmsGQnvISGy+P/akvLQTkBgpaTmLFKHFR5pQUulpbZxx4QpjA+G9Ljkw+AMCS0eFEaI
         Je0ox6YHB/fzHdU1fkUDik6FTvXHltL0DXp2WfgRO2kKEU/Kxi9EDXxpOUuCPaarYm+M
         S+j4zqylut/5gRDWa4E4jF/WAWjzvPBIFL8hOL+fl4bR8j5RxI8g6GtOXTq9GaAsKSKz
         8c641o4SDhOMXk0sciRRt0h1z9OIniOheumEVrAdKBcokqqjWldG4CgyqXbzPA8JsXYK
         wSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742136; x=1745346936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+BiVUOweVIHSXPffjiVNDnalTCKeOgbSdliRb/NekU=;
        b=IuD6vZrUaw8aBV35Bly6l1ihGWIOnQ02y/QFu1qxxLX5hPji4LHT/gA+ujlyU5Pv6M
         1IJe7heksCYZ9238q4vvXqKdqKMTmEI3orRQWqq/USkXes1Kz7cUF9uGRDLk2gYazuMN
         Qy9FtkFrXyl1cTHy+4dCru0zjOLbREDWtr4hUSzRS7/do5pzgM8xrTL5Lnq705rIsjof
         ojU3K7V/Bsdova/fHQGLMRL1+6U983duk6xsqWvLqwS3Y4aLNNyCL+vssFmBiqmy5Nyy
         XQUqFIjjd1wYbel0aL7a84Fg/yVq3fD2KiAuncccwrTSLGRZqIFe7/0FGdKTjl/AWGJc
         Bl7w==
X-Gm-Message-State: AOJu0YzrfxVc5X0C2mPSh+mj+PqDwqRhAW1l/5U7FEuNS0w9csvDpghx
	DgvBUfjGFLPUD5JlBMcQU4WgIdvoW49JCpSMsQYX45lNrkWlS6a8Bs+9ZJ4v9DM=
X-Gm-Gg: ASbGnctR5d4NGgomE+/FPgznBzYAptwuWuETERhBmmEU6thwfMHO7goKgcXNJbwp72w
	XPVrjcKJiMxWA4urxpynUu5JT6dQVda8vbQoAsDyS6q6F8eEfC/4sm9/yBsvqU/nNyEoST88hPS
	AuMY26cVV4s9gCT5CkUgJb3Kmxt40xpk63dLn7kIypZQDLISI6uxhSt6/bWlxnF0fHJGYc0TuEm
	lLi78jPqRpy0VCX01DxghlKJWZ86RKt0QpHAavT3xOnkZWq9iRzFFpbyJIs0LqNBk0yeuLePiFf
	C7rnYfK2ZPUWVVOi3ITb8v2MApmg3NYf/c6REFwHJHlJAFEMzKAsu3HrIWFDs//aVYq0ivY=
X-Google-Smtp-Source: AGHT+IFHQOJjJ4u+1LqRGokl9xjv2UDGaWtsPPLgjEyCfUnypyM5hIue/p4kgtNxNDbj7bxEGC779g==
X-Received: by 2002:a17:907:7ea4:b0:ac7:cfcc:690d with SMTP id a640c23a62f3a-acb3849e122mr9512566b.40.1744742135590;
        Tue, 15 Apr 2025 11:35:35 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-83.cgn.sunrise.net. [194.230.145.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd1adsm1148844266b.145.2025.04.15.11.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:35:35 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 02/10] i2c: uniphier: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 15 Apr 2025 20:34:39 +0200
Message-ID: <20250415183447.396277-3-e.zanda1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415183447.396277-1-e.zanda1@gmail.com>
References: <20250415183447.396277-1-e.zanda1@gmail.com>
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
 drivers/i2c/busses/i2c-uniphier.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-uniphier.c b/drivers/i2c/busses/i2c-uniphier.c
index b95d50d4d7db..9d49a3d5d612 100644
--- a/drivers/i2c/busses/i2c-uniphier.c
+++ b/drivers/i2c/busses/i2c-uniphier.c
@@ -327,22 +327,16 @@ static int uniphier_i2c_probe(struct platform_device *pdev)
 	if (of_property_read_u32(dev->of_node, "clock-frequency", &bus_speed))
 		bus_speed = I2C_MAX_STANDARD_MODE_FREQ;
 
-	if (!bus_speed || bus_speed > I2C_MAX_FAST_MODE_FREQ) {
-		dev_err(dev, "invalid clock-frequency %d\n", bus_speed);
-		return -EINVAL;
-	}
+	if (!bus_speed || bus_speed > I2C_MAX_FAST_MODE_FREQ)
+		return dev_err_probe(dev, -EINVAL, "invalid clock-frequency %d\n", bus_speed);
 
 	priv->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "failed to enable clock\n");
-		return PTR_ERR(priv->clk);
-	}
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk), "failed to enable clock\n");
 
 	clk_rate = clk_get_rate(priv->clk);
-	if (!clk_rate) {
-		dev_err(dev, "input clock rate should not be zero\n");
-		return -EINVAL;
-	}
+	if (!clk_rate)
+		return dev_err_probe(dev, -EINVAL, "input clock rate should not be zero\n");
 
 	priv->clk_cycle = clk_rate / bus_speed;
 	init_completion(&priv->comp);
@@ -359,10 +353,8 @@ static int uniphier_i2c_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, uniphier_i2c_interrupt, 0, pdev->name,
 			       priv);
-	if (ret) {
-		dev_err(dev, "failed to request irq %d\n", irq);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request irq %d\n", irq);
 
 	return i2c_add_adapter(&priv->adap);
 }
-- 
2.43.0


