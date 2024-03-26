Return-Path: <linux-i2c+bounces-2614-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6E188CEA6
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 21:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B07AB1F869BB
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 20:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0714F140387;
	Tue, 26 Mar 2024 20:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y+7VMJav"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287C913F452
	for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 20:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484669; cv=none; b=RyocCGzdhne0ulNr5yM5sBf3gCVTflTV1WWdwSnkZK72Ph6oXeqOuYF9AEvM5fSZx5y4XQmplI8+Je8zyTMEMdLMHIK/FBEyDyl7cvg5se8vQaQ/kIyqouDzD6TOTG3GMGUkO4mezq+A6yetfbeljldDk1rW1TgU9CVd4DCEcVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484669; c=relaxed/simple;
	bh=WaOdPxQDLRUP1i4wGsr9OiyCK6VXAW85SV74ALGfvjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BZI9t32pKHJawDllIy8GPTAgrd9igwcnc7KztiD29zcggku2I6YEW2XK2pKDsoRz94I/M+jmgIwPo2cPFjT25+fXTfYdb/V7IPGspSURoMVzRn8STb4U3oFlDTH9OtRh3i+bXNzJEWNYKErEqbLmZcyGk5VGjQrL+Ilax9ANbfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y+7VMJav; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a4715991c32so724299666b.1
        for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 13:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711484664; x=1712089464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+KofsDX7b8B7he35yQ05XHUdu1qHb7C3AOSdJZ0YF4=;
        b=Y+7VMJavFCDbWDyhXvQQPsmH+Xtzuw1zONvgfCcupI05Xv5SbXLYcHfbw41MGdyRe8
         ozg1K5Cy5AR9scqcv6RQ5FUcvRhs/JU9VGKNpAOasJUfNm3frjYKcKPnG0yGBFo2YbEz
         /GnRI0peHLgV7BGjjXPBR6/ktZLHswBZkqvqwe4rSsOxGS0TB8Eu7e4ke4osYunSCXR2
         9EfxCMMK2SHc2HKNsFUdqiaWu0vwqcB2qIKpiOxuPO65tyMwVZYkSzo5YK//VgvqsWVY
         zP9B/TDzuaMa3/5CkBKJWkfNUS9IfyVMgjiNBEwZlcDTtgxSTrxLA7u47lVEiUrrjsud
         ngBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711484664; x=1712089464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+KofsDX7b8B7he35yQ05XHUdu1qHb7C3AOSdJZ0YF4=;
        b=ve6vtc8dXLkxxlowKnyJXvxLHGQHDmj0iRhmiWZ5PUwHDtpC+pJKqmbu/7Q9wHugly
         z6ud7ZMJmrVjKobo3cFElfspz2BVqXlcqOgrhn1jxug7FjunyA83UunpoxB55J13a8+U
         KyIyObvjPmv+E7NS8aro6Gi9Tk92Z3pO8Pmc8kvmwJHifrJqG8bS0JTKe3jy/3hSXnng
         SvGItXJZttzF40sxsondwfCU0mUhf/iL16eEayUc+hZfvZMqokbwEKFUGQdsLTQnnWiP
         hkR/0WxqQYhBssrEVQoiHjQ6rD2vZt/kZrJlfaYEzqxhpAYg9Aw+WqPGDm3UBofkGh71
         zV+w==
X-Forwarded-Encrypted: i=1; AJvYcCVGsyPpK+MWvZPNckjsJdEdBAnGClPF0ryukJv4GMetoYEjwYn0kSfa1irtusk8+0w4iSzhx8UktUoIT8EyYh1CXj5zWaEWnQxW
X-Gm-Message-State: AOJu0Yy88CHgp5O1cge8dxXW+IQRdXSagq2S00QUGSpfoUJ4qkmO134k
	dR9b3Z2X5+6dU3IFnPYaY9981Kla8leeZpnVh1kMvda/cnkEFrbZ47Uq/jbbmqo=
X-Google-Smtp-Source: AGHT+IFm8CFi29yR95ZJLmtNPItA91IHSPbKKy14cjzd8kPq+ryRNulw1lIA4wR1RkRJVc0q7PGSoQ==
X-Received: by 2002:a17:906:304e:b0:a49:56d4:d643 with SMTP id d14-20020a170906304e00b00a4956d4d643mr539291ejd.36.1711484664359;
        Tue, 26 Mar 2024 13:24:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:24:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:42 +0100
Subject: [PATCH 12/19] coresight: tpdm: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-module-owner-amba-v1-12-4517b091385b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=738;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WaOdPxQDLRUP1i4wGsr9OiyCK6VXAW85SV74ALGfvjU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7VRj7R1J4HzEG/Gqt70vwCECGo9q1EyZWXt
 w1kKN5twZGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu1QAKCRDBN2bmhouD
 11sAEACIpsCGKurOsdyhjt6Sh3nUouIrbZZk0aR8BhRFTpdJTwryo1ef40TZZrvrMOMfwvapB5M
 ghzPBFB5vOzAV2o/BNkPJepUzhRojqMIvm+JOay+U272jYuPKfgP3BimNdADbVHy5gSo0JcFz1q
 bBJLmPf1Gwly+2vyygEz2L3Pe2+xIAgCJ4z0S6rv03z+wLXdQYKXd5KzrlCYMyb9GWFYFJM/wJ3
 t1QlO82WYHJ9RJjxlEHO6qI9+9UknzKa4BxAF3PQnX4wWwU9fSqZUUkryO4fJOcnZW/fvbi73S0
 8Jk9MApU5+XARrgatq504SjsVK00ZEcIYNEJK5Xsy8IY1zFUiW0uzeLs/E5hT7GmX82aAZHh3DV
 4CkyGRxfTEeYqbcSx7/y5mKrFiQMGnrlx3A1JWMcXP1muz3qF4iA5TdHC+Vl/sbNEUeXSlN9PAg
 2wNC09dWLimreHgexDrI92RYIlcoQbVLnDzE7g9slTwk3cqK5jr6g2oiuEakApm39rCVXymjmpC
 u9vui5Q7j7sx+Sql9cUAdkFNzz9QX0tV5jtQgMEN1YjrZ/2gJZ7AR+L/Z+92T0/CroN/L1TMQiP
 7K3Wm8uSpe85UYUvEws4GDRefaeLlj4txksJZM4wbeNW03VPat7Cknbv0NN2cRfsbBLyxvjLnPl
 y6NGCqzOagwzZ3w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index a9708ab0d488..0726f8842552 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1310,7 +1310,6 @@ static struct amba_id tpdm_ids[] = {
 static struct amba_driver tpdm_driver = {
 	.drv = {
 		.name   = "coresight-tpdm",
-		.owner	= THIS_MODULE,
 		.suppress_bind_attrs = true,
 	},
 	.probe          = tpdm_probe,

-- 
2.34.1


