Return-Path: <linux-i2c+bounces-2621-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 325F088CED7
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 21:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E04893279AB
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 20:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849A9142E85;
	Tue, 26 Mar 2024 20:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z+Krid79"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6041428F7
	for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 20:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484683; cv=none; b=J6BRbcKjG8Q73WNjTNzCkzzyT6WSHegTkBhInBGscIRNdZeP5A5uOj1b44PDO8tgGJv98E/l/lRGJ5BhxF771JsVknR2AT6mu8oFfngj010daiTGL6C38KGt0vwG7GeqbzYkCVGNftitUhyRy92qDk2GF/R3u/UXQcFyMW7ZcOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484683; c=relaxed/simple;
	bh=ojs7mEKPrcvVUr2JWEMqEzKtHrhLtgwuKK5bfH7PiKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PtgGyPCsQ22rXKvbGRfHouYr6cAUnwDAYNDaYuYPpb+LOAranWZb2lKpHRmmczT0L/MeQzKFiPTQ9/+MPzAUt149Fsz5TR0P5Qpp2TSbMzFGbPa3mdq2z2I6EDIOBPatm+dTxASgXrhFywFUH2iavIC4R3HroahKd4xnBGTOakc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z+Krid79; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56bf6418434so4495774a12.0
        for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 13:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711484679; x=1712089479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Evydkn1Lb5ncyuedil0BLosCcwb0y4nVC6Xek2Vd9oM=;
        b=Z+Krid795vrVpYVCGUSU7L98sxumHHvjb32dFWYWSuNrUGG/JPr0kvGaUbFdXGOYCL
         VXwQLSRMwahixlxjmiA9sQ295xkKKKXgJuOY7Ztp+kGFOZ9K+2Xx7NbLB6LLUyUDdWO5
         sHp0hT3NX+yF51CQ9PGp0FXfegNkAjbwOXZQvnCRTRtG0YxCHYW+WdEuVS3Gx0h2E/BM
         7HellXDPEGPuhgs/ul366uHAgTHWFhgZ5A/ua60jTJYQkkPYSFJAI7S6oKI4jL6qp2un
         D0Gl1M3S4fblm4/w++33Kn80NMAGEMZzxzuIywL8AtPHSwLd7QePMpsPm85/duAjVt7z
         JQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711484679; x=1712089479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Evydkn1Lb5ncyuedil0BLosCcwb0y4nVC6Xek2Vd9oM=;
        b=N42Bcq1bOMX1W8PqW7HKTboI6F7+AmtcKMkEvDM/QyeeVT3bYJTLWy4ZpvXGW0Dbuu
         jHq93QyFNXdV7X077WIeDtPXCYMkPDjcpbCbiPLApds7pXtIymRLHn+q+tLx87ti5YsW
         LXxBC8nSB+CDuFO2dgVAZCZAUI0CaS0rNyiNHIQBKYA+U8dgAUmTThZpa4Hawkf7N51o
         zT43rmYshI0u7cdqFJqLMPODovDM0I7PWE6UbWeIEucUKHq3eJ2oNDPnSFWZoC3E9S6z
         tVXZ4QJwQ/pSTN5JIXu0dJ1yY301dSUWn1I4m3MvRH9XkWSWh0+cvf/O6yYadEypqtaJ
         rU6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7IFG8bCN+T6/OkFsY6Iui0Jud5mFQoKFxYKahzar4ZW30JkvEnxSqCGQbrBwI74xnzqeuVkSd3zZJbkI/nmHlD43bbTJ584H0
X-Gm-Message-State: AOJu0YycPb3me27HsIdUyt2T24p8gnTpN0RDoaSTcBUQ1k9xD+udp9Wm
	nim5LVqS069RUq9si145NHy4fxprdQu3nI8Yra/vpD91ngEAqut8ltTYFnVbOog=
X-Google-Smtp-Source: AGHT+IFgvfjWWox9Uo3i/AT2VYhjSoo4ckuT5rPp5BpEMm6OBEQgZd29xjK7bZzgB1ctJUvP8kQ51A==
X-Received: by 2002:a17:906:3013:b0:a47:3409:2948 with SMTP id 19-20020a170906301300b00a4734092948mr499391ejz.38.1711484678778;
        Tue, 26 Mar 2024 13:24:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:24:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:49 +0100
Subject: [PATCH 19/19] vfio: amba: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-module-owner-amba-v1-19-4517b091385b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=679;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ojs7mEKPrcvVUr2JWEMqEzKtHrhLtgwuKK5bfH7PiKY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7cQ2wMjp46pnEE8icKKqMelI6pPSmG+hUfb
 2ZrlhxjMw+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu3AAKCRDBN2bmhouD
 13gZD/4v9CVFU7qVO1P9WYH/VG3+reXnSoM713azcrYjyCKdI7dioF4epmmI1zi/UB/Ls061Qv8
 SrlosGP6BdnuD97+Kvw/cpKXm9HmT9jZkcDUKzpPh9JIh/t1us2INa0wjhDPp4P4wb5vS1VQbqf
 knzsoX+/dcV5b+/3iPoc6xeP0r9lhTYHmVHMmW+eSiiGBW2QCBbJsYnKrnNhv6rLaRSq57U1nHx
 pT71c7XiLtDPKStg5wPxjzjpHq4jWPxaTFrh3LQmtnRzN5bhVUbrCUzab+4ktZS9yimWLF4a+Oo
 iAT7g98DxDdr8jSClcqQu87kLTLqjxaseT/J1dplC/DdXUdP5Mep1DYMRjKI3Q/YYlWvTBJ0lNt
 5myY9ur2Ia4Nueg1OJ3LZT3VmNq2tcSG3uWqM3D1NLDlM8ptjTMnfEMaAio2NCUpuiRo2x6H2Jc
 ZcF1QzB99fnqpxdMfZ4KJNgdRfZyMp3/9Z7xlMC4J2UTLz1mm1aQRplMfE5t2wRcqNTDQ6SEorz
 Ok5M2JDCYslcCDpBS8zXB/nwzbwFGsCubbWPopaZpdma6LdVcyKYFnBHeRjMptl4qFsnIPRL+J2
 zLgKtjqK87ihte/KUXER7VcN2ABZHfh6N3p+xK2LfGxwdEyjrz72tFdE1bh8ND0soV3z3u97Ju4
 aPVYjjB/5NvG2Zw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on first amba patch.
---
 drivers/vfio/platform/vfio_amba.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/vfio/platform/vfio_amba.c b/drivers/vfio/platform/vfio_amba.c
index 485c6f9161a9..ff8ff8480968 100644
--- a/drivers/vfio/platform/vfio_amba.c
+++ b/drivers/vfio/platform/vfio_amba.c
@@ -134,7 +134,6 @@ static struct amba_driver vfio_amba_driver = {
 	.id_table = vfio_amba_ids,
 	.drv = {
 		.name = "vfio-amba",
-		.owner = THIS_MODULE,
 	},
 	.driver_managed_dma = true,
 };

-- 
2.34.1


