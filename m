Return-Path: <linux-i2c+bounces-10365-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEC7A8A6DF
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 20:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A49313BD5B9
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 18:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8BE224243;
	Tue, 15 Apr 2025 18:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEfo9CVO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBA1204F73
	for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 18:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742135; cv=none; b=T8WbxHMBUdIhbIH/b13NuenzPV6b5rVoeJBDT83rq6uBLwhIy6YZUFvCqJv9E/B4aW+8t7reFHpYPIlN2LemSXnKVDJivUVpR+Cn60ftgCtJeRCvpPc2JDFrF/ZBtmQWwYZ4Yq3qbiRKQ6JXMJbzxljW/enGhwHSTY2kW+rruzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742135; c=relaxed/simple;
	bh=kGoDOFQgx2377brWiTL4KcLOhyAypHsgycE1UFpJa1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r0u1p+AVIoVd6+BD3wCsY1/8twNx+myo8lmunU7PrhYJa2p/DDcxBEoNGFGAAuHgfGToP1biSZdFvFGAnW3MjxcBPnGQQudvvG978rgR9uhXyUx5lICX4plFiY/0FXD3IZG25uvAUoaybV62Do1vIQ9wNokB+6AK9qyzHSU9qGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEfo9CVO; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac3b12e8518so984056666b.0
        for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 11:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744742132; x=1745346932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqDDKHcMVOtHqHJvkbewc6+GaqJjyOfiQe0VSDjHBgQ=;
        b=DEfo9CVORSRBszhVx5mUAz8tzTbRJ+C87hGqZX/mlwpkyjOUOpAa0hxHfo1MOgMhhd
         nav3nE6G0vA15UGNt6/qn9XvoAonLUsQYj8lzgGhP9+jpedFakP1ypgwqgWmZvsTL3A0
         CdgU1X2cbhisb/pm8p1zTG9197VsbRuw+rZscCN5LEicSzYZFxZHocYoPZlytSqcpvMQ
         lqHQFfMP53cHoQEqbVqQfR2z5EWqE+OY9D9kY5qS9CE8Au+a8T8lIrQTfSJ9FotQB0vp
         ud6LQ5p8Zgn+9jPOf510zSUyzaY2rih4sbQTbJNplzDZ3h+4/tITN57ImQQJATLbwVa4
         KR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742132; x=1745346932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqDDKHcMVOtHqHJvkbewc6+GaqJjyOfiQe0VSDjHBgQ=;
        b=d+EjpU4Qn118cSKfWTo9gFTGHn26m1rTeKIib3QcQLQdCh26NOBh+FaXuh587A7fiW
         p/bM8u7UZoGizPEUjz7gLaUZ6Xt4mEDcjnRjAUIfDmTGb8GpXJhcRLpbfYcdhBO2upzI
         RGVAsb37rqg8dXIv31ze1VYiJmV5Ei9+PSDCN1wsY/mMkvn6e5e9f0jTSW6uezFbMVFZ
         8S6agI7WDfo3XT0IrlU5YzH6cjnBROh58hQGmwU8QsllUKaLoenED9vhu9TL2Pyumzcd
         LkP059/wWIV6PnOcdySWRdW7yOAXpa9YyU8wk7PTvswRoSi03npuFRDyueKiAvjjrXAL
         TnMw==
X-Gm-Message-State: AOJu0Yw2UdYU70tKssdocxYxnvPnDG/ZvXRjbtrCQKQh9Idu1GOmcW4D
	ho5dOSUvTX1GFhQvomfvu0iH5ueIUg8e1gWeAoqlAbA1QPfhRTYbKphFe/vqCGc=
X-Gm-Gg: ASbGncvZzFThXcKLYTEpmyOtKwaQK7aQyN5oQ9Tfxkh3FzXDTAboyxw3cIJlJ2u4O+O
	81V2lDQ9flBobbvw7sfegfHdlxjm4RF6Q7h7fl2o2ns+6+IdC3FVYKY6mBPPhq4MN6zDi3slVWh
	fjzkRs61eeGrC/F+d677mB/GsSyP3UE3taUpJuUjYgq2v+c0vCT0mk3k/Xpv/ot2hcThtI41PDZ
	D6QiWMOboaNss7VujKx8B6++Rs+5Vz8Rj59w1ZjxYOG0ZDnCsaKhAWZwH6jMbffqRIygFSZkxK4
	EDb2BPIQI8icCVWYLrpZHS2TE0pSZMNpfWTLA8T9ApIfxo0l62ucmX82hzdY51yfX3uzScw=
X-Google-Smtp-Source: AGHT+IF9Hr1jJVGBwCaj9PAQ/AaQjFy/PsHSgSWhyQMi+4ABxfY3EViVvQ1nXI2UBBc2Zx/7IVG04w==
X-Received: by 2002:a17:907:7f17:b0:aca:a1d8:981f with SMTP id a640c23a62f3a-acb381c9c0emr14183166b.12.1744742131507;
        Tue, 15 Apr 2025 11:35:31 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-83.cgn.sunrise.net. [194.230.145.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd1adsm1148844266b.145.2025.04.15.11.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:35:31 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 01/10] i2c: uniphier(-f): Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 15 Apr 2025 20:34:38 +0200
Message-ID: <20250415183447.396277-2-e.zanda1@gmail.com>
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
 drivers/i2c/busses/i2c-uniphier-f.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-uniphier-f.c b/drivers/i2c/busses/i2c-uniphier-f.c
index d877f5a1f579..ca0358e8f928 100644
--- a/drivers/i2c/busses/i2c-uniphier-f.c
+++ b/drivers/i2c/busses/i2c-uniphier-f.c
@@ -532,22 +532,16 @@ static int uniphier_fi2c_probe(struct platform_device *pdev)
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
@@ -565,10 +559,8 @@ static int uniphier_fi2c_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, uniphier_fi2c_interrupt, 0,
 			       pdev->name, priv);
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


