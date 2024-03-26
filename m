Return-Path: <linux-i2c+bounces-2609-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7612188CE82
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 21:27:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C17A9B2353B
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 20:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D4F13E6CF;
	Tue, 26 Mar 2024 20:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mzcXedrf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C2113E3F0
	for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 20:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484659; cv=none; b=cmUtayLrasGVkAHp/Lwic6j/AJ+umu4p54igL3B5wVnfOZk5X4TpfUC4WLnpeiP5YfyVKNdmJx2rHL1+y4rJNlRPwViGp34C5cZRLyAUjYPKVyJn33Fz5o1m9lX7qWLdlMSrDLg592I09JrNDo1/wn7eaPhFN6W2h5UJIFj3+jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484659; c=relaxed/simple;
	bh=nzJjr/3kzpVLtmrrfpAcGA4hmhn+rDCa4L/qGUurIR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wld/9mIUtEUiP9mGdPjOmCcJ70WlXE6rVb7OcGGxluptQy7idJoRGWwbAJSlb5jf1gCBGqWozYJHZid8mzr6Ssei4rt+mEGfGzU3SRBGdt/Lz78dJQY56RKdtPHuuWbir/sUn/EtdkMmyPlN1XboK25m+MUcaXNGuwyPHgWPFTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mzcXedrf; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d4a901e284so113768071fa.1
        for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 13:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711484654; x=1712089454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuScgEGC8UrWc0EoVLGgWCbv6tlfkdiLjT4dUhMOUcQ=;
        b=mzcXedrf2qOWSCbl+yETURtJp+o6JRoslZXK7YTOh5UODhKsX8a6vWEwHPaDc52jT/
         GeT9/FoY6v2wZGjy36dWD6m/jYMfOKDRzQZtnWXBYWZRh5CbZiWnkhvzGyWycQ7cG0oD
         fTQp6qnpHYFI1BmgcmSoraKgNcbDu6KU+8Dl/6quQ44veyB1Lns4oClToq8nirLhXvap
         SREtn9AjiKIsgGDcDb2KRtMi11TtGon7DjpXdPExM4LHCdxFEOgxBpgVOXlwBCvMKTMc
         v1Fl+Nmqperu2H8vqgFDRqnYxZt+29IAi0II995hax25ESRxSU3KGwA9Djs5sd9THx7y
         c5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711484654; x=1712089454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuScgEGC8UrWc0EoVLGgWCbv6tlfkdiLjT4dUhMOUcQ=;
        b=ZwZoFjpMFBvHT5+NuTSeq57MzhXq69z3E2eZ52+Fd8cYBTSKur9NzzhoqcNryKiLYO
         aBMAo4sxfQonaTfhFo1cw72pbRZbnfFpzMHiHJjzwk5LnOZNyWEu9nWhQUBF5+s3S+L2
         yfic+B+7UYebcyPn6G8GrxVjJhb/V52xqwzI2cJPy+Tw5Fuit4wOxBZf9MxNuM965nj0
         jq3LwSEXLMrk2nlKP2HLfu03A710PwWzxaKLqZgcMY2Pt3jrNUu/yDkt8kOon6PIZrIp
         ukk5dvycYBj9dWAF+msPjEuoR6ElTQi4ftU2DrfwvhVQUFf9QVTal3Zr1xJnbGBiVJea
         HinQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpOqMPNQwoAFrHxaxseuiXiza/GIQ6YVNnU8eAiL+tZv0PXLK4uho7Zti0F9M5TmsW0N2l1rhMPuaFe7RwEoRjjPb/bRFgPutf
X-Gm-Message-State: AOJu0YxJIAgYvrLWtbdvigdIqcMPgKtilM5zSb1Cyzi/PSrrvtoynMj8
	EYPnwi5IhwNSGAagaDV+JrQj671ejw4M5IQ3JhkIrMKel8T/84LWg+xerak7ktc=
X-Google-Smtp-Source: AGHT+IGMXZVW5Ho8kmBDmP6Omvoj6jlGcOLG9xvCaAtMPcGWVxz3Ke5z/lSDDh+jhBaIsDnuGDukqg==
X-Received: by 2002:a2e:2403:0:b0:2d4:4ffa:9fa6 with SMTP id k3-20020a2e2403000000b002d44ffa9fa6mr548353ljk.52.1711484654090;
        Tue, 26 Mar 2024 13:24:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:24:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:37 +0100
Subject: [PATCH 07/19] coresight: replicator: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-module-owner-amba-v1-7-4517b091385b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=793;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nzJjr/3kzpVLtmrrfpAcGA4hmhn+rDCa4L/qGUurIR0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7RsBi9rHE6OerWYBGpsQMhaz7sDPU0K5tJt
 e5wrxjrm9aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu0QAKCRDBN2bmhouD
 12TQD/91xpOZIgLBEENNHIqagJN55vDh9wP+g0KteobIrBUpfgDGbwLBHPdL2E8eV+ZDMeVIxBK
 /CYCJMyJ4f1Xt2NQ3EIE6pAZZmYG2zggbc6ZOK5kkxYxAUGqXj8tBB6WE8IHdZu/ztKl7bwb/iQ
 g/mzOYng7/+bi5ZLMUtD2QnISo+qIRHw231SZ1Ss9+rno95DhucOQw09sxTElgCvj8iF4FRTqHt
 2pVx8QTGVe7de68eNnqDWZ7M4i3e/SQ/UzfsXzKj0wnosMJmWapOuaoGMvrAuSBetrHAWG5A4kC
 2VkJy1CKGow3pRqbmBZWFuQvkgcLP/sOPkT5UAdUpcm3TdM21IjNwEkFOmaaXiqYwQ8kKfBquel
 xWyP5ugKPwZAvNmJP6kBLVFtBZ0fsLOdQbov4bfg4BJ2CkrwOXKlvoK3MPC2uitvcNS7lq4I8+Z
 bItTs5IN+EmNc0osQcar9g4oHqSjLEPFk//1+gF/HAP0zT0tVk5arvN2/l/VzeipqGn6UaOwCOy
 7t/sqEhDcgBOzfYuBuj96UuisdPH531LFP8sPyguoAmQj/jRHRKtptTLoX/C+6luAQYkPLs6DQu
 hDqzGvzZyZuu8GbRMn4umaNuj5g/ZS00l3b5jZx/qC3brSZ2D/PWeR53ESa29QZKSYJ7cnr/RUj
 514FcGu+Prar6ng==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwtracing/coresight/coresight-replicator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 73452d9dc13b..2bb9ba66e3c0 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -406,7 +406,6 @@ static struct amba_driver dynamic_replicator_driver = {
 	.drv = {
 		.name	= "coresight-dynamic-replicator",
 		.pm	= &replicator_dev_pm_ops,
-		.owner	= THIS_MODULE,
 		.suppress_bind_attrs = true,
 	},
 	.probe		= dynamic_replicator_probe,

-- 
2.34.1


