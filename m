Return-Path: <linux-i2c+bounces-10930-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57646AB2B09
	for <lists+linux-i2c@lfdr.de>; Sun, 11 May 2025 22:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAB693B77DD
	for <lists+linux-i2c@lfdr.de>; Sun, 11 May 2025 20:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D88C25D1F0;
	Sun, 11 May 2025 20:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0jeP1eD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8751E2613
	for <linux-i2c@vger.kernel.org>; Sun, 11 May 2025 20:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746996269; cv=none; b=udVlqdJcPVo/IKdNo4/Srbwc/IYHNKyJQ/XmbwTkRdR8/fqlj3pDMyZZR1H96Etfec1bfT/W1YJE0Tnt54TuFeEbl9OVNk+xzCS2zkOTglX4Y1cWP243GBRO+A2LU9iD10OLpGBhCROq9KtYH2fpbeSi4o1/V8JGneEz9LOWnC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746996269; c=relaxed/simple;
	bh=m/w4nyf+emBYA+vw3Sg/uzxIxOtc6Krev9oOqdIXEBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PaPZVTqjangayHqCHgcGwhReOGYCqpq1jNvCbG+iiRpKtLYMoVZUq7pCDyRtHSKqUf2GXvoBKiC0BGG4j6kIxcMb+a9oLEa1Pub5zPshjVVUcsSfirg0V2v20m7NWFzUErUTMltdDtoFpD2kwN7Bvz58iMcAheJ045KZvo5i3OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0jeP1eD; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad238c68b35so280304266b.1
        for <linux-i2c@vger.kernel.org>; Sun, 11 May 2025 13:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746996266; x=1747601066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IXC3IDDYLuAwXXXC4OASl5fAFXnKitHH9V5oJ6jRyD0=;
        b=P0jeP1eD1QyioPDKo680kf9d4EJa3bVt9jNgwyLIlei/fHe0FGno7LymR26Ou/FKc9
         ILTagWkI6MInjvk0jbX1ica6zTJqbIDGdfv9rV5ftTKh56SSvTsSocCg+c1GLPfgr93U
         mnUiZ4GbCZT73r030sClZEUA0viAKuHx56MAfjnq3q0C77DrGAMojtx06Wo1irmsisjt
         Q8KyLhT+9vrCd3fhyhMQaSgJRkZ/gow5mgg+k6QltSET4Y59tCn7i4qElY2E8p/SyyBN
         Evt/CdhpnIJtCvvKaYl9YNtG6/BNKT18XGs/bnhnhQbWjgqWp9pY5tcbJe6YdQjxFCL+
         hEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746996266; x=1747601066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXC3IDDYLuAwXXXC4OASl5fAFXnKitHH9V5oJ6jRyD0=;
        b=DL9OPPSGzE4Yhs8BLabZewx6UO8fihQ5cNnVC4eLVCrVhgPlnbiyymBuv5OaUzU1El
         9YWD8RacDyU19Y0jG1XlICOi94u+kLto5BEqkw/CvDZmFNeNJsvFMoPgKsdbPjVAm2rD
         rW6HAVyqk1u+hBLUITViyZ+dW2mi3TBmqxuhV3N4pPOFEzaFC1kayPlAj+/k8ryRMe3Z
         eq3FgtsVCw7EQY1KFCxPgQ5aRxDV2E2zhak/VagJpdWqZe7fNPfpSsfa2nN1dVICsq+A
         J/IYVvO2iwNZRL/SuMuYpHa8QAldLL9EsgL3Puyv0c9bZ73L7km1CipRAEKx0FON5DF3
         PpoQ==
X-Gm-Message-State: AOJu0YxOs/jKn6t8ItBYDLpfPvYpauoeW4daKPO/+DZxjW3eQcm6O6Ys
	6tTR/dbM4xILd3pfr3IAlO0GGikKhQHBODSX5exphXdmy0+e+c+W62dUNg==
X-Gm-Gg: ASbGncuGL3xyGBg1siLP9Ov9ZAHKxCet3+Un7Y1FW8/upagxmSMznhyKcSYgfqFKbTg
	nF9Sm1+c/cnneqYY9nH2E8kXFQPs5PrBuX0NIUVODXSJqkcGrXnNB+/HFJQvZyKWQfZD6bFWDOa
	fVGGDzJKxdhfR4OiBQkHTrjeeYRoyNxbui57nMFWdaxHscqKd1ZeRzl7L13T6Ktn3bdLwmLWeki
	eWJo4rEPT4OYx4l/VWCl0WN/23YOql78DCXiwuWRagHESDPICAX4ibP9CCGrsqRNxUFrw2kaZGf
	JUHwJi3eQKmxhASR4VwTtszqtWJ2Upl4vBiq1EPsPRmCRXnEqTLAKhEAaZVQdAxpQZQ9NyzV0DH
	+AQIt4e4u
X-Google-Smtp-Source: AGHT+IHM/f+mLpHxswULMDRJp2DbrIbT8Ws+MJtpYXP3SfXbHfujxLmVyUX6/n3dd/h4fpKodypV6g==
X-Received: by 2002:a17:907:3e8d:b0:ad2:3555:f535 with SMTP id a640c23a62f3a-ad23555f608mr629177266b.5.1746996266328;
        Sun, 11 May 2025 13:44:26 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-210.cgn.sunrise.net. [194.230.145.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8608sm513819466b.26.2025.05.11.13.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 13:44:25 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH v2 8/10] i2c: xgene-slimpro: Replace dev_err() with dev_err_probe() in probe function
Date: Sun, 11 May 2025 22:39:21 +0200
Message-ID: <20250511203920.325704-2-e.zanda1@gmail.com>
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
Changes in v2: Rebase to https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git
branch i2c/i2c-host.
---
 drivers/i2c/busses/i2c-xgene-slimpro.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xgene-slimpro.c b/drivers/i2c/busses/i2c-xgene-slimpro.c
index a0880f4a056d..b29dec66b2c3 100644
--- a/drivers/i2c/busses/i2c-xgene-slimpro.c
+++ b/drivers/i2c/busses/i2c-xgene-slimpro.c
@@ -457,10 +457,9 @@ static int xgene_slimpro_i2c_probe(struct platform_device *pdev)
 		cl->tx_block = true;
 		cl->rx_callback = slimpro_i2c_rx_cb;
 		ctx->mbox_chan = mbox_request_channel(cl, MAILBOX_I2C_INDEX);
-		if (IS_ERR(ctx->mbox_chan)) {
-			dev_err(&pdev->dev, "i2c mailbox channel request failed\n");
-			return PTR_ERR(ctx->mbox_chan);
-		}
+		if (IS_ERR(ctx->mbox_chan))
+			return dev_err_probe(&pdev->dev, PTR_ERR(ctx->mbox_chan),
+					     "i2c mailbox channel request failed\n");
 	} else {
 		struct pcc_mbox_chan *pcc_chan;
 		const struct acpi_device_id *acpi_id;
@@ -477,17 +476,16 @@ static int xgene_slimpro_i2c_probe(struct platform_device *pdev)
 		cl->tx_block = false;
 		cl->rx_callback = slimpro_i2c_pcc_rx_cb;
 		pcc_chan = pcc_mbox_request_channel(cl, ctx->mbox_idx);
-		if (IS_ERR(pcc_chan)) {
-			dev_err(&pdev->dev, "PCC mailbox channel request failed\n");
-			return PTR_ERR(pcc_chan);
-		}
+		if (IS_ERR(pcc_chan))
+			return dev_err_probe(&pdev->dev, PTR_ERR(pcc_chan),
+					     "PCC mailbox channel request failed\n");
 
 		ctx->pcc_chan = pcc_chan;
 		ctx->mbox_chan = pcc_chan->mchan;
 
 		if (!ctx->mbox_chan->mbox->txdone_irq) {
-			dev_err(&pdev->dev, "PCC IRQ not supported\n");
-			rc = -ENOENT;
+			rc = dev_err_probe(&pdev->dev, -ENOENT,
+					   "PCC IRQ not supported\n");
 			goto mbox_err;
 		}
 
-- 
2.43.0


