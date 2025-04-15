Return-Path: <linux-i2c+bounces-10368-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5DDA8A6E2
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 20:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08F77443400
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 18:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915CB22688B;
	Tue, 15 Apr 2025 18:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcwiaxND"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD9A2253EA
	for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 18:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742150; cv=none; b=ITtdahsL3AL0ClNN3bw8V5kAq0wsMZhMnLD0JlcNKyM5mWrNaPmDdf3Z0TZOATVG8o39Yyvg82JVU+aamHpBRnoagxsYAium0+5xgr13fl1UCnk/FqldTDw3lK0UPYJtv2r6+7bFGfL4DM4k6m5MnA/3Imc3x6TLCxmJoHE6biE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742150; c=relaxed/simple;
	bh=qjfGJe5YV631zV3iulbwZ6i7MOpznd77s+WGoyfz1HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZK7jKmUbbBR3Ok4cBL5fVfSVYH/sYCZVOStcCXug5uWVD1yvGP+hdhu+rI3K0I0JNZ/zfqkiFQwTpQiP1Ffp/vo8aNRN2d1M2gDYG9YYvZb0isUEcMubAOQ07W1kPjjLHtQ15GwR21eaPk3Z1yoeTF0pfw0xax2o1MRdnfyhF30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcwiaxND; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so1131178266b.3
        for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 11:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744742147; x=1745346947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VP3m0RdnPv6mPDyQodFl6WZtTlIbnQ1jKMPGLv44k/c=;
        b=QcwiaxNDCZSPW3A+UPYhljx/sEIc7mfwswftqoXK4Wu/0AmjsQhDeSDwb5XOzAuRVa
         3NOlqTyXcbFK7/K05jeJce/tog40l5ijFv6uSb3mzZJ2UdM9OT/HhnQhqr4eYlEyKgSX
         Qd6cHBkZubon8gTOJSuu7yHGown3z3UkhxJpFAkCp1YSbRSNnPlCdiB66pZrlDndeAlm
         ic6Coy6LkPUHrhnwTPaAxJcKH6SCy6V2IhGBrAGHUD/mbK+LShSAW3Et5FZj5uPu1OWo
         U7bX/17Ip3eiM08iY31AwwWrrq3U1Ei75haKVr4vrJnvOPasLjBBdvwLj3faH+KdPeac
         cBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742147; x=1745346947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VP3m0RdnPv6mPDyQodFl6WZtTlIbnQ1jKMPGLv44k/c=;
        b=WhV9rBOLGxlL0D347PfCL6YNb/ZWplFgl4QaHTDeg1JhaO9aBhqRRJDXBMRwRZyqx/
         KpLyUT57S8MldHuqOSQpNMWv0Xu262ZkKRcFkPnD3jxI1tjS+z45ZR6PeMRLhNKpd98O
         CMMrTwKUptA6Jwr0pxXv7Dg71EIsMzNjTtn9PvAcpc1zTq30LZlbo/tR/nVN6s1b6Bky
         0lJE9sB2hyd3W3htQI4etghD/xSXqA7fHuy307yVDR78bzRvvX4PB/kiwqs96VeDARyC
         5pQV3DhppgXNmCRTihbwk6vYy/kUYN8f9pLyOrykptFCFKVXvx/UPZHsp1I86QDGVdus
         DaSQ==
X-Gm-Message-State: AOJu0YxzKxzk4zh3Ie7U2OmekcQYUeXCBrgSV+br+TIDHSJibQYYchKV
	CRtgWgwL7d5H8GlvyF22he8tdnZXO3lri+VkucftWwV4kQGZtWEclk+Uut/sC10=
X-Gm-Gg: ASbGncvotQu/Q9Hsl/YkLOvSVgxnEj3HlBK/rOLUDbv5maaUElbbXphLPRiQL3a4ePK
	SSJIsqxWA3Zs7YS4aJCMg+6N7ogiGpmrxcrz1ixEoYu3MQ9COO2e3dTZlmd2LQeH+jZJd9qS0Tx
	0MFRgD2MGd3b04oJ5WcirWfYPbgmaC4ZqD81wFWRXLNOPZPbsdWHFJ1e0GG+82IOM0OegQS2laJ
	ETkaMlvENH4QtlXtW+3l+eADcAT3liibU1+DLINAq61h5YEecWzVnfgL/jkeqtkVESgDbgfIS0p
	bo2Vfr70DMrcoRytGs1HO7sddbdo+IIOfgvcB5cpsam+/UYrM+m51ZU80yrA7n/wU63NHRnJKCB
	UUs2Ivg==
X-Google-Smtp-Source: AGHT+IHa+4AkwUDbKN5xidVv06/d8Nn6wuD1cj9aNOo5RN+WNebCbM8UlTUzXq1A0C09KKoVrydpHg==
X-Received: by 2002:a17:907:1c16:b0:ac3:3f11:b49d with SMTP id a640c23a62f3a-acb37e316d6mr16327566b.0.1744742146826;
        Tue, 15 Apr 2025 11:35:46 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-83.cgn.sunrise.net. [194.230.145.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd1adsm1148844266b.145.2025.04.15.11.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:35:46 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 04/10] i2c: viai2c-wmt: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 15 Apr 2025 20:34:41 +0200
Message-ID: <20250415183447.396277-5-e.zanda1@gmail.com>
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
 drivers/i2c/busses/i2c-viai2c-wmt.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-wmt.c b/drivers/i2c/busses/i2c-viai2c-wmt.c
index 4eb740faf268..be23dddf8bde 100644
--- a/drivers/i2c/busses/i2c-viai2c-wmt.c
+++ b/drivers/i2c/busses/i2c-viai2c-wmt.c
@@ -121,10 +121,9 @@ static int wmt_i2c_probe(struct platform_device *pdev)
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
@@ -139,10 +138,8 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	adap->dev.of_node = pdev->dev.of_node;
 
 	err = wmt_i2c_reset_hardware(i2c);
-	if (err) {
-		dev_err(&pdev->dev, "error initializing hardware\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err, "error initializing hardware\n");
 
 	err = i2c_add_adapter(adap);
 	if (err)
-- 
2.43.0


