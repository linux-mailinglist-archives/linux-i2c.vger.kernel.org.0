Return-Path: <linux-i2c+bounces-12518-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C557B3CA3A
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Aug 2025 12:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63FFD1B27459
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Aug 2025 10:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49B9233721;
	Sat, 30 Aug 2025 10:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IqyLmc5h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F112F274670
	for <linux-i2c@vger.kernel.org>; Sat, 30 Aug 2025 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756550170; cv=none; b=A4bZC/t/3LqQ90bOt3qrIGPUl+P6ZH0HbPR9VbV/uoqjIfOpLtCH980h1PYKDZjTJdspoaYly8vdY3a4PaN2szRDdOrcB0FIxo9c9KtXDHxJMLZT9D3OBx7SB5EIwlyIv86BTVOH6C37NoQ5CR0ZNSECwjJoZ68X80t9gpz56Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756550170; c=relaxed/simple;
	bh=aYDrCmJqwydp0cITFrdKKChTEbGkRwFi+heWaQ+g8x8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EjSYEhQUKtzVhni7Oi3oQbM84EPQktAa83N9MGEJPdcgfwWjmyphDk8BZTSSis1SWCd2TJIg3t9uNhK9MHwBG3UEQCSeoBe88c/c1DwFwXcyfjs8qRGajKItUp7MbGMP5I1ETVqo7frSHCrwfgX/aDCB5U+TTxKZllxL1ZnYKRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IqyLmc5h; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61cd63fa0c5so431589a12.3
        for <linux-i2c@vger.kernel.org>; Sat, 30 Aug 2025 03:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756550166; x=1757154966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j9uKP/w701Utzlek95Zxmn6XXXuTthToNRKbdLienIk=;
        b=IqyLmc5hqJI0egPoM0NFL7dwWTX5up4Mre+r4cIVugRnkrtwNscnp4khufINyHpyIt
         XR4DoFb+MtJu3Qn0IDZHE6Vr19/kLaSaFToU2xGLhNS8SuavnQGQ6F0LzH/d9ZVeuCjs
         E4B26sxFSnX6UXDcHdQ/KWv01BsnguO4MiDRAt3kZ5uQF3nhH0gvyx47xWZMYvymUzFB
         cPjEGIyqPoBrUhjSKWHjYPUVMvwbtr7rVQqR+R2waSEhnp2hmicI+ehH1e3d+HcKIq9H
         V8MCYjygDpW04jPpsEH4uKHBbOaBj9QjNBbeH3OG9QfbKtC2MmFq2acD5MSifQKhrMd8
         3o4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756550166; x=1757154966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9uKP/w701Utzlek95Zxmn6XXXuTthToNRKbdLienIk=;
        b=hZYMDqN20DufqqKSJHMC/UvW8t6Ne6uFQdOSoYXy6h/J2pYsTJGQr1JApIBlMM/whs
         nB0hp5Jdrm70MfbYx9Vd2kobfeAnE+Sci4tfsj2PMGCnbJSgRZ2HA9QAygekfsOH/kUC
         LMfcuSafdldjiDzZM0pNpgbtIcvNdzvcc0M9Mjf6/R6BZDjLUedWDIRrZonEQ3H6xZsR
         sgVhlYkseMY80RLt4rn0pr75rLxrFZivgjlaewKry5sPzbZYTSeG6gr8mweyzeMCPH/0
         D6TmvYCQsJ5Zf4U2BhRVq0AwRbG+K/OwAgzZeiLohxoA8VcN/zfLIjWNbz3hmvYcplE0
         aywg==
X-Forwarded-Encrypted: i=1; AJvYcCXRFb3btNmXGd1lJ3WsmDxytKmj+nGQioyCYx7HZrebbF2QOL4rraK7jbiiEkCSMzCDJ5C7Kfyk7TM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy++ckvdVXeMLtPP2+Q69IVR5D0xT+U/2o0r3CW58/nQC3A1/wp
	a+vRyEFImavOr45V6pGykC63xddNYO1MjrzTWqSbASbb2axNTVtp5j6cjBvSZsxKKcs=
X-Gm-Gg: ASbGnct6us3E38rF3A3yxIso7xscAdjVBRIv6PSjVasPF0WVu7tbCDSnPmrL6w2gKPI
	HK15XAuYjRqeQX2C+dnleV7JKzYYxts+AjlTImgzxT5/nm22v6dhHmEMEGuFVSyW1lnesuASaYV
	h49PvCxrHkF2CF0i3ovbVGdt1Ag8TaGzUCApdrwajrhlhAHABnW45esxWaqZYJCdasOqNZNxp0H
	pzmcdjMLzYkmZw3JwgKenUMIX1k9BNEmJiycUVM8Yq/WaXmKxZVGZRj0q5CeFJkP1B8n2XeJcUb
	nhtFKhgtWd9O1NxGdRf/BsWRyDwblkcX1ufL42I4W331iz9VlinR7mzKakmJHdSw6vysu938sbm
	DQawrgjCzqHp4MlgXrxbnzZRpwj6hwjc1Ap41BsEJiswD
X-Google-Smtp-Source: AGHT+IGdgzBBWg0IEYY6EguBKdq5dpPqYmiYWBCMG3kWwvM1hnhfunzI2F1bpeK7ModfnwPEFWO1Ww==
X-Received: by 2002:a17:907:784a:b0:b01:7e4e:9bf4 with SMTP id a640c23a62f3a-b017e4ea313mr83699066b.8.1756550166068;
        Sat, 30 Aug 2025 03:36:06 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefcbd9090sm393749166b.69.2025.08.30.03.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 03:36:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] i2c: s3c2410: Drop S3C2410 OF support
Date: Sat, 30 Aug 2025 12:36:02 +0200
Message-ID: <20250830103601.82046-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=aYDrCmJqwydp0cITFrdKKChTEbGkRwFi+heWaQ+g8x8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostQRcylIQbLHQaXyoT5lBp9dj25r3KgJrdhH6
 8mC/mo8CO+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLUEQAKCRDBN2bmhouD
 16+GD/9M1J85gCn20FMDk1QPTL3u+uwRfax3oj5iYwAvMOwkSIjeyHlvkMRzay+X2KWu66XXcjm
 hOmwAuSza6JH0eoCje7JaZIQ3hDfklIf1K6/i7wGoXDNWzF2AVFk2j3AgCoUkh0PgjcQgb26pb8
 hSWqvCuJJEmrC7cGevfpl1WzrFGjsQAWPe9WdT6nb51GbfaepDapfHnXZSrv+olJGd83PcID6Nm
 uBrOhQByHIFTxLUTJlcYHa7t+/T/J16oltUpqb7T1z3aHF2XflK9pxGPqIRmpjloSJHixMVqLYg
 Y6aFvh/dNlK4A9lAYFPTm8yGXx5zS+n0ImO5+5an5VZ1DmL6/d2b6AAUTzh3emDXMow1Zs4bJGD
 hVqpdBnAP3XWma6eCVc5qTz8f8gvhOjWYEDXqH0kerRGDw3nt76m0eNw7MdH7sx9knmQumGOHfm
 n52XcFBEhLVBabL7FyD5K2tgyus2rtxzJdq3io9hqjhvc5hB/+UuPs/evZRca1fCrzykbpSukA6
 jTWkG1i6Hhv2y4+xT+QHEJlDy7itMFjwhdeqOtx9wp3mfCa7rtynUXToBOl4KEFgDgpWcq/1YdT
 uFZvZN/LiQjg6Mi6bb+JM/OI/4+abDaxl1NWpGlWKgTptd25RdpyIR5AyI8vWPPHfEwTlIAzVMV cJK484bq7er5PuA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Samsung S3C2410 SoC was removed from the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of "samsung,s3c2410-i2c" compatible.

However, there is still a user of "s3c2410-i2c" platform device ID,
S3C64xx platform, so that part needs to stay.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/busses/i2c-s3c2410.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index f4fa4703acbd..8138f5ef40f0 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -138,7 +138,6 @@ static void i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 
 #ifdef CONFIG_OF
 static const struct of_device_id s3c24xx_i2c_match[] = {
-	{ .compatible = "samsung,s3c2410-i2c", .data = (void *)0 },
 	{ .compatible = "samsung,s3c2440-i2c", .data = (void *)QUIRK_S3C2440 },
 	{ .compatible = "samsung,s3c2440-hdmiphy-i2c",
 	  .data = (void *)(QUIRK_S3C2440 | QUIRK_HDMIPHY | QUIRK_NO_GPIO) },
-- 
2.48.1


