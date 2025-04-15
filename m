Return-Path: <linux-i2c+bounces-10373-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8E5A8A6E7
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 20:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2C2C4434CF
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 18:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01824224243;
	Tue, 15 Apr 2025 18:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDvn8+10"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E752204F73
	for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 18:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742160; cv=none; b=SH6AoP/RkFovvErG3EV82kKggiJFQbUIrS6P8hRW17eGJKEFZSabxHOxuHBpTQSO2Gg7bQZyEaQhfdZ2ZCbcEf9kt1Gyui81V5SmFfCkjLhWP6UDFEtb6nCXSH6dqRkcTtyujRj7KPWhmTC/h0jB/kRRDcnzPDCqRAC2QMeuO0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742160; c=relaxed/simple;
	bh=dxV8cSzj9WssYWag9PR/+gu64NGs1MqPWNg03L7kzR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJSQ81IMKLWPyI3huPSf7vGGsTmXeHdQmPmDTVjhTUixeNJWJNAhF2jDnBNYiagDoYq3clI/pxgsrOajviMgMJhanKI2oFgLasQIrAQmjz608V9DCsTlhof5JuxtvU3M3imjyyCiIpTP8pbwEAxDWzL5tzhIA+pJSUm2BExGGZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDvn8+10; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aca99fc253bso918243666b.0
        for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 11:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744742157; x=1745346957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imnJIvmlPEYO5zwPP7FxPJDrPT2t9pZtdVbP//eKCUc=;
        b=XDvn8+100ChkqzYNY1NlvUPj3juD5e4VDIFMLG91tHk/oWimG0wQmJ8x3Zg68HpjeC
         F69FzGYhFVaHTfcCla7A0HGkeaCyPn8gCT0ccy/xCvHkX2r7SM/ZkrXf/5njPXDDKL4F
         S3G25SPR6gmaBvNKJA6nEHR3qo3u48aexv2AV2tAL/5JELhvFeTyHrOYGegw5JjWqCeQ
         9meaOUqnoSgDxiUADnpRBxBNDKQei2R9VlGfhgFhp14OZR7I2WP+PfRhw88BnrlVywcO
         GT0D8DP/cB9QYu8ll1K2OMHf8FAfUvYovNdGM5TK2Adc5aG3VeoqK5uEMH2A9msD//NL
         0MWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742157; x=1745346957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imnJIvmlPEYO5zwPP7FxPJDrPT2t9pZtdVbP//eKCUc=;
        b=owA5+yCy4GCNUa1ZC/UqLh40VIFJQQOJEwtbYkZMRZyn22LnNw29AD4OwPtkp26Y8/
         IrZYUk9dbBWsuXb+oC1FSiPE3oDCJs0j4tsT4uKfbxURzXWuUHjnBfuiCJe3SsPddCfA
         k6GnDBU0JlDmOsqMLtUSirym0YRn6Slbotbjq8W9UPpmL8oY4Bku8+fy/yBwRG71u9kl
         LE+LfcnPT2r1jls6TtwiiM1yohkPSqnUKzsqVYeG9GTPAX/7QMkdUU0I2ZWIFRhuq8bz
         UMrtX0q4gYDGkwR3LwaLrtTaamKSD62xO0Qf6+1jIOa7lB+SE0xoyfBbCw26efAawaQV
         Fs/A==
X-Gm-Message-State: AOJu0Yx9StFjtyOq2hkfC0/Xhk2ckLy4Zxh1h/I5j8lto3EuFiwbgWJc
	o2bnkkWzlNlg9F/n7IIfPlsVcgVnJifgH9Vq+nEJU/1nMhTw2GAG+4vAVxFI
X-Gm-Gg: ASbGncvrDT6blOGe7IYjPZf2o1zORfGwE1qsZdTAv+2X31zqiMBF7i+JTM57VYvB1Tx
	2d5JYHUF+gAv5pBNLNo4c/hWVVirjU1evJtu2YQsc+Y+3XA01zBxSG2X9JyBHKguC8dkUcQfhEQ
	zqUVn4XM8AMn1V0SBYWNvM89//imV8KD90bqE0JEnvM+aL6HC2E4gcNmafSYkbCWyTN2c6yLP8m
	Eam0rXGfbve/nWiRloVjxyScAwhJ7V85j9/ySCD+podyLA1/UT26v8YDvclrAoTgIBKXehlqyZ/
	BJQ1XPUJIXz9sLAfr0H2EL9aCXA3jB9sn8l4SYBY/eg1vZN9ysWpHqEIjBODI4p8BFa4rU4=
X-Google-Smtp-Source: AGHT+IG+49RmF8hP8uaBg1JtEgSGb+5mlPDL8Wg2VQaKSpLJkXf9Ni2wIqbSRWix64qBv7CRMHCEew==
X-Received: by 2002:a17:907:3d8c:b0:abf:4da0:28e3 with SMTP id a640c23a62f3a-acb3824ced0mr14160666b.18.1744742157213;
        Tue, 15 Apr 2025 11:35:57 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-83.cgn.sunrise.net. [194.230.145.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd1adsm1148844266b.145.2025.04.15.11.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:35:56 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 09/10] i2c: i2c-xiic: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 15 Apr 2025 20:34:46 +0200
Message-ID: <20250415183447.396277-10-e.zanda1@gmail.com>
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
 drivers/i2c/busses/i2c-xiic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index dc1e46d834dc..6bc1575cea6c 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1489,7 +1489,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 					pdev->name, i2c);
 
 	if (ret < 0) {
-		dev_err(&pdev->dev, "Cannot claim IRQ\n");
+		dev_err_probe(&pdev->dev, ret, "Cannot claim IRQ\n");
 		goto err_pm_disable;
 	}
 
@@ -1510,7 +1510,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	ret = xiic_reinit(i2c);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "Cannot xiic_reinit\n");
+		dev_err_probe(&pdev->dev, ret, "Cannot xiic_reinit\n");
 		goto err_pm_disable;
 	}
 
-- 
2.43.0


