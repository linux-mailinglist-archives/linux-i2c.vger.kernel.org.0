Return-Path: <linux-i2c+bounces-11080-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE45ABE3F1
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 21:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27F737A56BE
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 19:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A05281374;
	Tue, 20 May 2025 19:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3s21wLN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E3C27FD4D
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 19:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770260; cv=none; b=gIs2xhdZv0O0XJAnLFDjR+7GqF3uJ1CQ8l+5NXkNPavWD9bvH5+mNBquiBMklf8CEswjpNB3B5yFAaSu+CgjYfNK4Agir9lGG4e2PVH+b4SyBeIcePqG6Ajq8IVPBMZk9oSimWxekLyUNTRcnTh0aYvipoo3iW7woqL1eFtGCCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770260; c=relaxed/simple;
	bh=6bDSviPTEwFEXcWZySCcxrDK6S0DSpavH2mDF2+eyoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qvCwBegt3XwSLwPtawcThDKuj0yj/zr8e2SoD4mZ4taVQmy1rTCbI74WnlCSj3FzV6pt1odHk9DvjzumEMq7Y5zBf1wZMuXEb1TnarZZ+dD8uv4UswDDJdBj3rvYpvepRbnG0vh5HA8uZw16cbZzfRZzL1t83VXQRJdwfS2bJ9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3s21wLN; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-601afe51106so4467124a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 12:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747770256; x=1748375056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMPXPAMRhAmykmGRJk3xsS3rWd1ulHzSKuY5YnUZI1w=;
        b=X3s21wLNVhJD4G+lBBU2yvkiTqV2kLMG84XPatCwX3lEK1hRQv7hgMMGav5z0f1mAK
         bYijSinxEgjxNCYRQOwCGiJAKC2sOkLODxpjAaFJTvDHr9dYy84Ykr0mm38+DsYRgTOy
         /f/zEMHJd+0Ns7+4R1uky1mfGdA849v0nyVevPQiPaosppiPbZOE6QwXzBTBiLnZWIs7
         hNgiNYD2UrzQjQ645GSpp0rZQlz9szbg5mGO38WsgQpJNKtgEeMW+NosIs7X2Goo69F+
         VFgumrb6/bjFlxGtftwPg4CstK69cL4INE2JoloLg4Cn4iLw7j9+Ff/uyFQNmIj+XB7u
         Oj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770256; x=1748375056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMPXPAMRhAmykmGRJk3xsS3rWd1ulHzSKuY5YnUZI1w=;
        b=wh4M06rS0DOPk0/t0zYk3H50RpGJTr2uwGndyEPbdBYxEuR3NSAEW8Rqsyx6tGgy29
         cEJLy3huNAhkel1NMuz0tQmx9vsgfKOBUAH1xDioe6hQFFg5wpoB5N6IsahOtjj1/qTL
         IOOrKJQ0Yp4AeFeUEzXkDRE59NhVgourJYOO1mO86Cu1ylRLI/ccpdyrpdwc+XdjFb3L
         1/7X6mM7cws0fh9p6V3XGzmEuMrG9L6bpvdeDkz+jMXC2QSnosbOcjz/oL6x/UhI3FKV
         XTCOA4hpjfmo2LhGNiFn62NMCT4PZv9Jiv4t4NOVIrAPLA/kM8EJG49xu08zVxyXhVqB
         1NvQ==
X-Gm-Message-State: AOJu0YxL8LNhMV5h0S2B4jCMeOlW4MoMkt7l7vP8mLQHzZWt/EgY+v+U
	EPIAryAalsXRN/+5aHkW2zP9vja5vK2SSF82on5Y/eMeLVVZXcn9NEqVgB+vjGh4
X-Gm-Gg: ASbGnctrBdWzeWtqHR+waRcGbEND2zkZXzAw4fiPn7EH+G5yWwi/XvXY8mFxO5hTnga
	3NM89PsU600nDzaGsKjLvQPzvFOh2bGEc65M4AQqX5mIUmtUMrRBI5i5XdTGPnrXAP+GTKpzG5I
	85tWMjNk/shupRW3JVR9iXHJXDaCcr31uqbFC4aUUOPw0eOSeVHh5Te6fXQ+p5ih6FBfGAS39Vu
	InXvXT4gqelVohk0QBPweQdIrfb/S3c12J9DVMwoVFR7z+RhaKg5dyptDoMoRo6vNLpMmBaMq6o
	zK4wxc6v44qbxPkee5kFpMMt0lGSiVic6cJbJgctuC8JIQPhe+NwvC3ytnmkkie2bPY0MH+tk7y
	WtQfu6g==
X-Google-Smtp-Source: AGHT+IHdPxGKF+PxNRa6DzDEHfHbcwS+uR0+RgIRbHjr8zT1d6wtx5CK9f9G7111zdVcI62zdynIlA==
X-Received: by 2002:a05:6402:26d0:b0:601:f4e2:320c with SMTP id 4fb4d7f45d1cf-601f4e23302mr5878120a12.23.1747770255675;
        Tue, 20 May 2025 12:44:15 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-11.cgn.sunrise.net. [194.230.145.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac33a98sm7736122a12.49.2025.05.20.12.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:44:15 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 07/10] i2c: st: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 20 May 2025 21:43:57 +0200
Message-ID: <20250520194400.341079-8-e.zanda1@gmail.com>
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
 drivers/i2c/busses/i2c-st.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 750fff3d2389..96e4c68428b1 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -781,17 +781,15 @@ static int st_i2c_of_get_deglitch(struct device_node *np,
 
 	ret = of_property_read_u32(np, "st,i2c-min-scl-pulse-width-us",
 			&i2c_dev->scl_min_width_us);
-	if ((ret == -ENODATA) || (ret == -EOVERFLOW)) {
-		dev_err(i2c_dev->dev, "st,i2c-min-scl-pulse-width-us invalid\n");
-		return ret;
-	}
+	if ((ret == -ENODATA) || (ret == -EOVERFLOW))
+		return dev_err_probe(i2c_dev->dev, ret,
+				     "st,i2c-min-scl-pulse-width-us invalid\n");
 
 	ret = of_property_read_u32(np, "st,i2c-min-sda-pulse-width-us",
 			&i2c_dev->sda_min_width_us);
-	if ((ret == -ENODATA) || (ret == -EOVERFLOW)) {
-		dev_err(i2c_dev->dev, "st,i2c-min-sda-pulse-width-us invalid\n");
-		return ret;
-	}
+	if ((ret == -ENODATA) || (ret == -EOVERFLOW))
+		return dev_err_probe(i2c_dev->dev, ret,
+				     "st,i2c-min-sda-pulse-width-us invalid\n");
 
 	return 0;
 }
@@ -814,16 +812,13 @@ static int st_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c_dev->base);
 
 	i2c_dev->irq = irq_of_parse_and_map(np, 0);
-	if (!i2c_dev->irq) {
-		dev_err(&pdev->dev, "IRQ missing or invalid\n");
-		return -EINVAL;
-	}
+	if (!i2c_dev->irq)
+		return dev_err_probe(&pdev->dev, -EINVAL, "IRQ missing or invalid\n");
 
 	i2c_dev->clk = of_clk_get_by_name(np, "ssc");
-	if (IS_ERR(i2c_dev->clk)) {
-		dev_err(&pdev->dev, "Unable to request clock\n");
-		return PTR_ERR(i2c_dev->clk);
-	}
+	if (IS_ERR(i2c_dev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_dev->clk),
+				     "Unable to request clock\n");
 
 	i2c_dev->mode = I2C_MODE_STANDARD;
 	ret = of_property_read_u32(np, "clock-frequency", &clk_rate);
@@ -835,10 +830,9 @@ static int st_i2c_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(&pdev->dev, i2c_dev->irq,
 			NULL, st_i2c_isr_thread,
 			IRQF_ONESHOT, pdev->name, i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to request irq %i\n", i2c_dev->irq);
 
 	pinctrl_pm_select_default_state(i2c_dev->dev);
 	/* In case idle state available, select it */
-- 
2.43.0


