Return-Path: <linux-i2c+bounces-2610-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1108E88CE83
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 21:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91ECE1F83D60
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 20:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F2213E6C8;
	Tue, 26 Mar 2024 20:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hrZLkR0X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045DA13E415
	for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 20:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484660; cv=none; b=HBXCt/u2yg3mH2GKTN0k4tvgVhJNwJFz3AgJxrgKIFyfRgsZydyS8olXuO7bPzue3YRdXYV3ZGz7gvpFtV2wt/IrafBhHDumv9MnJ2B/AQXhowE9YOXxRNGhSTHUJIl8v8kJfqR4+fpdZt5RaYMjn2MYV8mSRBsCfPVV/q/CwpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484660; c=relaxed/simple;
	bh=wYJl4vhVWtWOdD3Sbdos0pesavVG40uaiKbFBYn+928=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hfkoolerUiR9Y2euxuEB47x6v4ArJgkSSMUq0X3pKjBrVyyTSfkbGsilxzdGCt9eeZrGJHOnRpmTD27zBcjJM3k77hCk3DEnw3kFfg+HjpYiYwBzCc2YhRR+r4B72dgCKMU6TjV6UrkS7HHYDCk4qTOy6mcW9S1V3AnZAAwYLXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hrZLkR0X; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-513ccc70a6dso10428078e87.1
        for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 13:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711484656; x=1712089456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HACANyvTKUa2F7OFT3YqMnbFiK8dE6yzsz6U8915HRw=;
        b=hrZLkR0XxkR7Z6TQIsweJcT7KRBuVYnlpqPuL6lL5jex4KJBw702FK72Q4WBtE+vFB
         ZG9sMNSElSAcmlfGwYAVqCUxEG/6ooZ/i9AJ//nlV9wRiZvzlzmW1t+fttZHTtpt1hVt
         ACOJYR4AxgzEOd2Ek8aj0JLve5W7DDo/vrMGqBy3HryPZC0m7GRdrS7TvtjazP5XS9vq
         EgbDqVW2hFH1wuKCGRJrqdUhmRbd5RNBDhUyKRQpIQZP2gAyVDqDiilUHBezndYmCMTI
         cP7ZYtnSNQuHNiBD6wGT1l8+vCt4Z2XqYp0yYTRHRzO7DPq08QsFI+MlHUqyuU74qH/b
         Sx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711484656; x=1712089456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HACANyvTKUa2F7OFT3YqMnbFiK8dE6yzsz6U8915HRw=;
        b=QlpkVyq56XddUea9qrDOIdS+TLhFR5slO+ZuL71O5QegQ0anutrf5+NCS6N0wOT0EO
         45jukG1OCEoC7Ea3+Fug2p+82DpDqaRl9i5dXdRWwxv8WGWEejrMqbWACUsXLOwe+YP+
         qHWpCEr7fueVN6/FOAOEKPB69yRaiLqYHkaauA69G+KWUBrk2ahV0RExBUUiUUIMxep3
         yawNV0bVOnVksQzdFf2EXaqFe5aPnifdm+rXMRprsHOlIYA0xbo9w1i3h6noHSNfqXly
         uAqyzIJOZ5CBFWk76FNeg9yRb4pqL2y/iY8y9/AaoNxSyJDSYwzQ2aZvS3BuPUJPu/u8
         ftCg==
X-Forwarded-Encrypted: i=1; AJvYcCUJqo5jmUjqA/8PMMb795CfK2d+BEs7zzjaYqBVt7m5/vnqChMzI+OSicRUH1N7tKbxhCyB1P/+5cAsnrxiwiMt9Ct+9WOZTpRn
X-Gm-Message-State: AOJu0YyUY8niF/WDZ0RD7CBu5kWVwbSgkmPyDVdfgArSIsRVL0Sc5Et6
	FJRqAM3hOnoI+j0zM0DsFC0RT9aM/XdRlmRqnV76ZCnIjxwmgg2lqQTvdMLu54E=
X-Google-Smtp-Source: AGHT+IF9pUMO5M3/G0TGt/BcN+vt86zQwEQP4of6OmbIqz+WBaFAHT+Lq8Y8KdBG7dtyVu7UH7lCUQ==
X-Received: by 2002:a05:6512:2012:b0:513:bf8a:bd2e with SMTP id a18-20020a056512201200b00513bf8abd2emr604675lfb.17.1711484656259;
        Tue, 26 Mar 2024 13:24:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:24:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:38 +0100
Subject: [PATCH 08/19] coresight: etb10: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-module-owner-amba-v1-8-4517b091385b@linaro.org>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
In-Reply-To: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-input@vger.kernel.org, kvm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=729;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wYJl4vhVWtWOdD3Sbdos0pesavVG40uaiKbFBYn+928=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7SkWq5sAlGgTyUPiqGzsh+Q+oXWdA1MnZYA
 IUmYXEOH1OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu0gAKCRDBN2bmhouD
 1+HOEACAmSAmkE3a3j67RICYun3nSNDCQ2Ctd3yWPnpTaNzh2D4VErkXht9CBOYh9XcE8TJP8sb
 iWjQjj0Zuc7MUFhPyWSUo6R9q7YIKGdhlN4h+PraouDOic+ib3iU0a+YKc/+H0f38cTpKLExdyE
 DYrkcd/8n71Zn02XP6WPM6HS8CUbKj9syRY7iOXPsRKUEacQ7Prj/fRtfEU9mKaDQ5V2CBymmvl
 APTMp2voCMq+0E1VmmE26uY+0SrK8PYPe/iiWHZAc8EkX1Uqz9/HxaVEGv8Zco9qI/IFj5jqCd/
 78P2ufBMMwjrgwFmTYedxZPNIgwfNu3c6sXH+M0V30qWivJW/xEtQmcTA66xjyLpaI2JqPRCzQ0
 t7bPzGh/e47T3pLALRDnTfd87Rq5h9Iei/E4EGQvlCmdN7Muo+Qj1xM0GXUJW6vmiT0dCBZmEUE
 5HOpQcQxD5WVVrXf1M4u6fVE75dlWRG0wR09TIEqoVOmNZqpGBExHxOERcUA7ZUyaFXj1ZVr4/G
 fqxDm1AF8P9ToGvKeuujU+nwaiO+xutHyuxDvIMg7G3tKlTNZZoXIG/fJGI/tE3jGDy+Tw3GNVh
 yJZy0bXGOzbsbOszryV3haor8aXc8XJML+xeVHwJlq1FbN53kUCCg1mlQoB6I7n+IexGHMGQMMN
 8jI6ABMDvFg0I+w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etb10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index 3aab182b562f..7edd3f1d0d46 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -844,7 +844,6 @@ MODULE_DEVICE_TABLE(amba, etb_ids);
 static struct amba_driver etb_driver = {
 	.drv = {
 		.name	= "coresight-etb10",
-		.owner	= THIS_MODULE,
 		.pm	= &etb_dev_pm_ops,
 		.suppress_bind_attrs = true,
 

-- 
2.34.1


