Return-Path: <linux-i2c+bounces-11082-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 237ADABE3F3
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 21:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FF457A57D8
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 19:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C742820BE;
	Tue, 20 May 2025 19:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ms5jg6Uh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CA3280315
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 19:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770261; cv=none; b=pUQEcP/oUra/4l814E005ZrQusJ/aSaHNkSk/C0Ynh4Am+bD2cxxoOw6wvO9bmhqphoq9ENtbufkvPYiuzWIJRLJ1NkFrAhXahbP0fC0pVF2JJgON/3KpYo+MNAuqi2sTrD3o1e8BEM2Tx1ejg4ZAxDPhAL4Mw5qUUqtNMTE4Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770261; c=relaxed/simple;
	bh=F795GdY6ayBv0DwLnMom/uSHZRkwwVkciJQIcg/xdwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h8F03MoR5TLhVtQab4MV0/HC5JbQJBkG7nx7IyXOXw+rPL5Q6mXNeytTM+G04mV1im/y7snnxS5dWwyZT38Y5cH630FKoqBO/QsW0M0BpjxdVZht/kHQYsafzsxAxvheeFksK3UJExUM7a7kE3HjhsXape314FElXt6PE2O8GMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ms5jg6Uh; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-601aa44af77so5967365a12.3
        for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 12:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747770257; x=1748375057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCs1F6io3un3HDzqL7E1QMr2p+GN43rrNRa2GPduaWE=;
        b=ms5jg6UhaxFH23UZH7+wnwi4gYg/AJUtPD+PMOgGIdAySPRuC/jZ3NmT4zGBc1Ct+M
         uVH6sQyrNxhGT+B0xN6XrMQtvzIlGxuUTNgpsTxlGUWw5NY5pvT430SXCJSwNwiGDP4f
         7h42084TGVFn5mTgnMk5KW6pI/Ua/WlvkY0uuPe6LhuEaA833Ak4mfrC1GCyl1+LoVpj
         mXDGlbufzie1LLG0iwBHoMVazI6ozAkhsuT+64H0aSl3PTDa7czH3yEEAF7FgJfbQuCl
         YzxPj7u4s3RwWSdT5kMUGS8XjzBPRLdKkHllcW18mfPQ1Ag2ZSLL9gpddJK20C9sh1UJ
         N0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770257; x=1748375057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCs1F6io3un3HDzqL7E1QMr2p+GN43rrNRa2GPduaWE=;
        b=MmOe4q1ZEQKerMsWefAgj/wJbbkqVGypfAc1FoCCwbex1Dz1oFRlZQHA95HWDmTW4G
         bJuxWzot+laifNiPJS67Us/NYwfg9Ujn8hlL13KynfSXDUQrWAIDnJ2tfXVkeMdsUmYD
         sh3yRxPv2HRmFXs6E+NQoVcv+YUUGZZ2dwpxSKz9odDPieCCghSD8rGpPSsSSczxT5E9
         sLGLeOWqd3fgBpN/U3k4huW0Kzo+TwnaDMgdQpaJaGQ4cFgBVL52ck/XXaEdFaVX6k0t
         /S1LiAoDVACRm4hBML3DZkMljSKHE2oRXJo7hrEl4YWbW1tZDSaWeGuchURC0bER1zTH
         ZWiA==
X-Gm-Message-State: AOJu0Yx3eltvMEPpKxZ8nYe+v7i9vOD7OmZdYyG6OMjJiit5WPRG2gnF
	m/XFvWB3ZsQJawzl2WQJ6/511VBGjqtdJNOs9ui/SprXB70kcN2xf2g1asTPBmOz
X-Gm-Gg: ASbGncsLlE97ZtRydSepZVSZaHmKKmV/kDGjwGv2GZtAmceI9w1wxzYFZbNXU0rmaav
	hW9jlRROWv8S1v3SZH+tHQ4Qq4/Jxnfx0dv9HjSi+Ho/FqPwsWUj+KkGnHuokHrH3kdFJUzru2L
	4FXxWxclDFb0DznjpmJO50obmct+U2u86FeoogIJAoDe/TtgTDufwMlJUwuWOBuyHb+2dRk9qT6
	eytDvt44E4DhGaSCvYWvVpHu8oc3WykxIUgnJ4fzKrA+tGJD6DxTY7EnDuiEBnPrWIiJkxtcUOk
	q1mn+POwJWb+z7diWoLDldAporR8sCPEDXlFMS3o9Wvz57ahzwgxniUhJCBKIdHvLoIit8T0FHx
	8C6ywTg==
X-Google-Smtp-Source: AGHT+IGPX5BxiP38YfWj7Ou9pfAOejBr7vEZS69PUxzmSPGAgro2F9kVcV7FG2/Nsr9oykEMvZOj5Q==
X-Received: by 2002:a05:6402:40c3:b0:601:fcc7:4520 with SMTP id 4fb4d7f45d1cf-601fcc748ddmr5660684a12.4.1747770256689;
        Tue, 20 May 2025 12:44:16 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-11.cgn.sunrise.net. [194.230.145.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac33a98sm7736122a12.49.2025.05.20.12.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:44:16 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 08/10] i2c: sprd: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 20 May 2025 21:43:58 +0200
Message-ID: <20250520194400.341079-9-e.zanda1@gmail.com>
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
 drivers/i2c/busses/i2c-sprd.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 56b2e5c5fb49..9dfcb4955610 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -470,11 +470,10 @@ static int sprd_i2c_clk_init(struct sprd_i2c *i2c_dev)
 		i2c_dev->adap.nr, i2c_dev->src_clk);
 
 	i2c_dev->clk = devm_clk_get(i2c_dev->dev, "enable");
-	if (IS_ERR(i2c_dev->clk)) {
-		dev_err(i2c_dev->dev, "i2c%d can't get the enable clock\n",
-			i2c_dev->adap.nr);
-		return PTR_ERR(i2c_dev->clk);
-	}
+	if (IS_ERR(i2c_dev->clk))
+		return dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->clk),
+				     "i2c%d can't get the enable clock\n",
+				     i2c_dev->adap.nr);
 
 	return 0;
 }
@@ -549,13 +548,13 @@ static int sprd_i2c_probe(struct platform_device *pdev)
 		IRQF_NO_SUSPEND | IRQF_ONESHOT,
 		pdev->name, i2c_dev);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to request irq %d\n", i2c_dev->irq);
+		dev_err_probe(&pdev->dev, ret, "failed to request irq %d\n", i2c_dev->irq);
 		goto err_rpm_put;
 	}
 
 	ret = i2c_add_numbered_adapter(&i2c_dev->adap);
 	if (ret) {
-		dev_err(&pdev->dev, "add adapter failed\n");
+		dev_err_probe(&pdev->dev, ret, "add adapter failed\n");
 		goto err_rpm_put;
 	}
 
-- 
2.43.0


