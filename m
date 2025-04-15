Return-Path: <linux-i2c+bounces-10370-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F42EA8A6E4
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 20:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECCA61901D3D
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 18:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94294225A32;
	Tue, 15 Apr 2025 18:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQZTOYaE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2EA22256C
	for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 18:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742154; cv=none; b=cGF5Lke3pfTCWHMXDKptpUVcSgIsVFn5nsPjQ3FxGt2SYE854J0WXZdbn8R+6lrGTPYphtwVAVypX219VdCRBSijf47cyjzuIr18UeoGrXMbWJxhN0DAhrpUvX++y702QQXWg6MM+IMOxwzqG/LCUqMgw2YodGggLGrpWJqhFY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742154; c=relaxed/simple;
	bh=P4a9PkA3kJVcwIZwq0G2YlBk39aIMMfgZWf2uZG563M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ArEPSon53+9vsnfv9HBx3ymuqqVozP6R9gSB74bNWxALKo5GvG9BrGnkDBRtTdKXGegpkEw84aSj6kW322tnuyYv1r6spSHybvyAd/0LGNgh2Psf8ZGcw5cw+K/XVC9TzzeBjh1f/LTLXwgqgqeB9zp1YzjbdaoaDuhx8ye5hc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQZTOYaE; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so10339664a12.0
        for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 11:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744742151; x=1745346951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMFKvS13V24oEXpPbrmoE/yWPQaVsv1gzO+NMDMGLiM=;
        b=UQZTOYaEu0yePQw6FnXzB67gMK2R2RDoXzS1veg8fizEW6kQ7O4e6997wAt5qnlGV2
         /K8+FJy/9EhM/vP3IITKFkLyepcmway6cEFoan8/9/tv5gkjzNDl6ku0Ym3GFIjgV50q
         d60c+sGuhCHCFJPVvALChjROW3z0GO6aw65NRa89PWU2CNffEZwPwI4O2E+Rg9vQvOB9
         NkAGakJlhSWHTG9YslSXUPTafOOQBcmOrOOjQF7vANiL2J6d/vfCfSvLHEzsel5WpiGu
         tr8PItP6O0TOmU9pxYJF818EOj9CcPwjFl594YShCMUAXv9j6RC8DfMfG0G2fTMPW4y1
         6KGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742151; x=1745346951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMFKvS13V24oEXpPbrmoE/yWPQaVsv1gzO+NMDMGLiM=;
        b=iZ6nou+ZxD8Yf+1s8IfGOFDTEX7Us8J6zsIrK+4eqttdcuyTXe/9UZvDZ5k/78Jnl9
         N400qet3OFWOi3Z0bdue4nF/94WUgBgKBSzMa8wg7Oo4ZOmCVxT2ixzvKW/341f3DaKO
         kDWFv8diIn8jXAP+AsY9iI2o5QW6FeWX7S9e0Xw2SI3sudZNVw4OD6p1x1Cls/9ppsAJ
         bZAuw9vFfa0Abb8myPuIjmgvWHC0DAZlngDoVWJaC6egpCdSAve0ZT1DpRc6bneC+qcH
         k2GKHpEPao0YX8MDTVbEP8rQNMkW+8VR6aO7ljBXyj/jeJFuPGc+e/c7spMtrLTLI0mf
         qKoQ==
X-Gm-Message-State: AOJu0YxwR1204lt120eK8uoFC/fld6uZTX7UJQ6cq9Aa+LIdLIKJ2eqh
	aJGY4QabUb4u/HGMpyO+IGQ1kPLPQEr73duWZKFM+1b7xaYNrA51AC8FFUekJic=
X-Gm-Gg: ASbGncsDx6QdmNZ4XCdG0jFPRQeFf1hYMFiooBK4sloA7c9zqmhMAfAt+fQnfsEks1g
	NhbUd5VmyBgSdfiPWCnapX0Hl3EIBS7yiPTz5YGGflohe4ulsvbe8d0XBnz7/Rbg67lnxjXz1Dd
	2Foa2tOI/Mqc2vdxDexs7ZWyoR/qvFEg7jUEPYgoM9TftPXFWs5D1qULUX2x/MxDEOgZ4z1XOdE
	1GU8eB1kKdtTsULfuOHSP13YA0cYuyEsPmRHS4V6kg/bBu2QStd0wgYx8NIRed7VzDPTJZZkg5O
	XMSBkc0b+wVGttzDKU0aR3Lbk+qdRfOs21v2XoYniiernXn6MHCxXXJxAkdy6GMXn7HFYHg=
X-Google-Smtp-Source: AGHT+IGiQ4yih0Ecg/pRPDgZK6EKOJQ3fWoqc45FOGxsBcRESYgAGcGoBoJGpB9gbPL0RQ9K67B9rQ==
X-Received: by 2002:a17:907:2cc4:b0:ac3:e4ea:de3b with SMTP id a640c23a62f3a-acb38310a14mr12266966b.27.1744742150836;
        Tue, 15 Apr 2025 11:35:50 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-83.cgn.sunrise.net. [194.230.145.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd1adsm1148844266b.145.2025.04.15.11.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:35:50 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 06/10] i2c: viperboard: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 15 Apr 2025 20:34:43 +0200
Message-ID: <20250415183447.396277-7-e.zanda1@gmail.com>
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
 drivers/i2c/busses/i2c-viperboard.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viperboard.c b/drivers/i2c/busses/i2c-viperboard.c
index 503e2f4d6f84..7523e7c02271 100644
--- a/drivers/i2c/busses/i2c-viperboard.c
+++ b/drivers/i2c/busses/i2c-viperboard.c
@@ -384,15 +384,13 @@ static int vprbrd_i2c_probe(struct platform_device *pdev)
 			VPRBRD_USB_REQUEST_I2C_FREQ, VPRBRD_USB_TYPE_OUT,
 			0x0000, 0x0000, &vb_i2c->bus_freq_param, 1,
 			VPRBRD_USB_TIMEOUT_MS);
-		if (ret != 1) {
-			dev_err(&pdev->dev, "failure setting i2c_bus_freq to %d\n",
-				i2c_bus_freq);
-			return -EIO;
-		}
+		if (ret != 1)
+			return dev_err_probe(&pdev->dev, -EIO,
+					     "failure setting i2c_bus_freq to %d\n",
+					     i2c_bus_freq);
 	} else {
-		dev_err(&pdev->dev,
-			"invalid i2c_bus_freq setting:%d\n", i2c_bus_freq);
-		return -EIO;
+		return dev_err_probe(&pdev->dev, -EIO,
+				     "invalid i2c_bus_freq setting:%d\n", i2c_bus_freq);
 	}
 
 	vb_i2c->i2c.dev.parent = &pdev->dev;
-- 
2.43.0


