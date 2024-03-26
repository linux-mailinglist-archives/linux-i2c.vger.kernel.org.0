Return-Path: <linux-i2c+bounces-2606-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9765288CE6E
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 21:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE467B272C7
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 20:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E44613E035;
	Tue, 26 Mar 2024 20:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ogqM84QF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBB913DDA9
	for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 20:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484653; cv=none; b=SzJUj87/ni/iZ6Cza8NDUtW3El12ZyEq9q9hD7dJevqknexO1BknOj/PVTA+m0DZyDHprUcLlL6PZ6Cg7hPlHErH2yT9HhTzyd+fBJioVM3xy4TEDu1glB3oTuPbAam1helbf1Ex1rCEreefoVNjSQsirnWOmRIVfEgHEEFndBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484653; c=relaxed/simple;
	bh=OegJxEVoCh+2bPB0kaSuE8HSowWXNd7MSXtbllgm3ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T7MjfX1cG3JcvbpUZdxVCcnfFDsCT3Z7n38uHwUZZ66xr4KcWYhy1tWQcEcHVTnV1tVHPxHXcUGq50HBLM/BmRcYjyAbKXn9/q/3H4vVYAMpCKWUSq/KRoGyMt+ddkSq2Bl30Lnb8DWz5xGk23hR7i/04Ddb16UoW0k17NrbUI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ogqM84QF; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56bdf81706aso6238846a12.2
        for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 13:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711484648; x=1712089448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cS6l3DFyZZnaHeh/4JIde34mk8Loy614n3vF51Qtne4=;
        b=ogqM84QFEgHo+4snhGAF3AxPF/CQsHStZK7E0VWIhAHY2CPI+5CVWnINo7gWNyq8H+
         38jwDOKHfAxFR0na4Y/dTzGXnvSbbDa0N69Su4nwiO+VmF5HTwXy17yIHUoNbVlZQPeB
         JTVQSFG9PHXfbjRha/40hhEMOgj0PLShxKHyaGyopP8wtJEJMrC0lb2fV59EIUFcIpGz
         nyHVixsc+Y4jJiP3cWxH1d1K4kq9KDxtFbuSekcqYyoFkMcmGHiWlBIkBVBGhC7d1gik
         FpfJURk8VugddnOndPFA+fasR2sbEmqFsHsW2iuHOoaDSAd/ge0uActa1Ux5xeQaBGpH
         sH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711484648; x=1712089448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cS6l3DFyZZnaHeh/4JIde34mk8Loy614n3vF51Qtne4=;
        b=HY40DesF31d99Kw7bzdnROPeeIcOrcR9XT7t9x/ZSgunask1ClvauCsGLyVUcraFjj
         v0O2cfeKEfhUZfp5N5bVNK6p9g02zhfT4a7MBkxPBDnjfUAa3jsjT4O7rvjBAMdBBHlA
         XpbNdSo4RBdNfTi0cRP4uA8k/y1wVUflsoahDXjXMpgMmrYJnR/35mRsj8nOYkWXUy5z
         At7WfJiELAgr6ERd4MCB4UR53GTQq81qQ3uhFg2W7sOVbT2b9nB1XgQItI0vDveCpSFi
         wHZtfiGg1sUczbpGgG2ovBmKi4PZ/mmHUXBgiZzgPMnt+5zyG2ehOdQU8zofGMYzcWau
         HwLg==
X-Forwarded-Encrypted: i=1; AJvYcCUWNUhULQ0u+rvAqLoJnHE96yVIzHimywFL2Cy7f64WBYm8N7b5f5NOAtU5x0GnmDsfnhAP7/LeG8PfRIOdExcfO2/x1Q5Oenup
X-Gm-Message-State: AOJu0YwO5u1TPFParOGewp44uFz4ge4y5Tk12atCvwuoSXredNCsOQOx
	1GGn2vyoOFZ9kl4XjbcNE0kZ8pL1Alk4LBgmTh0MNlnKQYyu5bzOaAJNiLco2WM=
X-Google-Smtp-Source: AGHT+IHH9/GNxpyIkXwZHA9aKbHJoaISBEw7CCGiO/tr5xtDA/461qS+hvMLh2XB50VnnElFIf4DRQ==
X-Received: by 2002:a17:906:ae5b:b0:a46:da87:26e9 with SMTP id lf27-20020a170906ae5b00b00a46da8726e9mr1373608ejb.77.1711484647788;
        Tue, 26 Mar 2024 13:24:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:24:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:34 +0100
Subject: [PATCH 04/19] coresight: etm3x: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-module-owner-amba-v1-4-4517b091385b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=759;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OegJxEVoCh+2bPB0kaSuE8HSowWXNd7MSXtbllgm3ec=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7O3XhDWR0q73ZKyq6XFUMDnvOhhzKDH2CrZ
 vvB8ceCmhWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMuzgAKCRDBN2bmhouD
 1xKlD/9ExjFMSjdPGngGOSZcBFRS70Gp3v66nFNAWDnXMWpCuRjIg1ArvtwHE38reg4ukpjqisf
 eZCnXRa9ADyqy+n/8uJ3w7ccn9tZzDdmY3L4SaI3cMc5HAp5XYeMiX/cYKdzE2ALwBdMxY75TMl
 /Q4uKyo75bB3pM4Np7wfBBBiZpwLYTa1LMr4VmXOGaAZkgm+XRCGwl12VNZMp0avw+UiS+qs2Gt
 SGJV0hSOzf3ufcb54mIoz6VKTaN1q3MOdbc9z9aGqvotG1VRuPvn9QVd6jbVXoKayIt/mlwW3NG
 pIwRq2UVU2hDBYcoMS+S4c6bU2CIgajMVMkHzei39+/20OgcwjrWUB6i1KLzbe/lQtmgGs3S/HU
 Giw5gW49yn1lA40ZqEvOHRr4qRe538gVZB6dQVKv5Q5tQeE69z0jsfgey5aGbebR6mmkltOGVrc
 IQkvCmCeQ6yEGnOai1AvBGnrZk6G5nj3JN+fOyB1n53ihepFxqhVskEuWfqCB+5qNpiNntr1V6W
 +Do14xIInZSsuAnpGc06u6viXcysJyCkz2w4evz53wfEEK7kSq7roG5ncSgoI1OZZMabAYlCvp4
 3V9JqlpOMehdE2bAHiefJWpzv1Kaz1nz/2SomhlaDJh7L8Zb6g0brqigl4UQzGhW/g+NhHo+Gq5
 Wt9X4UAzVmw5Xqw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 9d5c1391ffb1..8b362605d242 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -1008,7 +1008,6 @@ MODULE_DEVICE_TABLE(amba, etm_ids);
 static struct amba_driver etm_driver = {
 	.drv = {
 		.name	= "coresight-etm3x",
-		.owner	= THIS_MODULE,
 		.pm	= &etm_dev_pm_ops,
 		.suppress_bind_attrs = true,
 	},

-- 
2.34.1


