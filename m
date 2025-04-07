Return-Path: <linux-i2c+bounces-10110-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2291EA7D193
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 03:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 721DB3AD237
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 01:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B4D1AAA23;
	Mon,  7 Apr 2025 01:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIMWX90m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77441AC43A;
	Mon,  7 Apr 2025 01:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988039; cv=none; b=HKH+iyxWKaL7dx6cc4nL67S/pAnWq1LVcOjRHouB8HfZE4e05m1sh1iCUWkcLe6heKRC957gPbHHMYuYHwq6btrw+tkz4rK94VAkdu56+Z3SyvvHF3rR+kFB60OeqGi0fbnU02bm9HVyQoGTwT/BbJJHM7gaa8BssBi/vmr3uz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988039; c=relaxed/simple;
	bh=0VDH/LXkgyPWREKGJ6L3ImEQl8jRzmgKxVbe+sXjwvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TU0S3zOyzOGRb+B+d3mI239knnBJQC2X13pN3s6dmKa1lgbXjOJ4U3GtiIKWNGWfZbMKwjcABW6mYiDXR4L/JZBhgkjHCK/LM2r3FRrZHY9nQ6XxaUx0VjjkkwlNY0RfiSrQ3cG7OMkR85J36t4Imz12uNeeRMUaG1b5BGJx6as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIMWX90m; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c546334bdeso312694885a.2;
        Sun, 06 Apr 2025 18:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988035; x=1744592835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igVn5a9lnYZiv748Bf1nucU57+aqB/uXYfi3TAKJX8Y=;
        b=PIMWX90m+EpW/6DSjcORy7kCiLF2E7Rlj8LloSRCW0koS+JC8wY3J0qrc88QwmLAOh
         5heW3f+tr9RkkYTiI/ZT2tPp0KlOQnBVFEBWtGPKDfg8Zxxh33XluT7pmSdBkTxbrm6B
         nRH1ldvZTLW/NH+/7MBk1LcSNV7B9LRn/tB2MwkNe0qYZJpWP7VQ7uf/XUwVUhuZOWcY
         HoWHOE/4lOeVd12NGDtCiRG8HNlKOGgzHd81WnoAvZDZk9yoMJBZYpALVSXmbcIFO9/2
         V+M7EqEdGjZypfe6rlGHJM45bISHITNrK00cRALL6pTpQgVCI9B7pCUq/2Wr1R47vd/m
         BvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988035; x=1744592835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igVn5a9lnYZiv748Bf1nucU57+aqB/uXYfi3TAKJX8Y=;
        b=fA3+gpWVuqd1yDAsxKF5PCVzYQbzN2tihC1mSPrFI3K83Pn2d36KSHmPvJBtCopLyB
         4/hsnB9ldxzolM2yg/+2sYtnmfoM8Jo1VWFJebOhW1ZKZtBWagcl+GIf+tqvnrhiLtbs
         btV9ug4D6XXxhyERfUNHc67pawK4bLplKSgorOJzurx5bGrRR2bqzZChhyiI9xLJiNfZ
         kRlgr0i6+EidOpsKCKmvrpwjy2djzr+PTNGJR1mi2gLew8PpaZ5uYaPgu3kcpyQamydR
         M3Aklkhe+w8M3aJvYs5NUMnEcF9MwxGzbgYdOPmc6Rbeu6XylfPlonN+Poo/NKkjpS98
         DitA==
X-Forwarded-Encrypted: i=1; AJvYcCVO+pzDEGWBgubpKn7XFcASZYBpUW4bPbAFkXaWCN4BiQc90toa0508dTdLqFhvCrAjcqhSOFTiX6CduhHF@vger.kernel.org, AJvYcCVneckd5MTC9aBdb59F+YplAlvRrPnfVoqXJdmAAsyUxakEJkATAgqB/kSYvy+wyaqKY/MVVicLs6Db@vger.kernel.org, AJvYcCXV4bWtOdG2OIAO+mC2knl9YStbdjq8FeAAM/H+z/MMumg1f1F0awybc5HfwHV8MlF0Woggz3wkxANM@vger.kernel.org, AJvYcCXlfWgC4aH/5OymzpYYfuhnQgu1aqwYvJIw5CLC/8k3wwDzTicWDlbkaD7ThhCQdS+ieRBtsZ2pjZEJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/0BafBJO61zgDL2EdiEDO3IxkSbiksc3Uj3Ey2AJX7lv23P9w
	SASz7tWvrq9ppq54Aq0sRaqa26rKXmb2AdNHqkbyc5FTJwgAZQSr
X-Gm-Gg: ASbGncv0Htc5gxnngP8RG+Y2x5pq15Ua84BXYdTYen8doR+5XNpLlMewi/j7EnFNuGS
	aKGTcAvWXAB/lAHy8iaGDNk7xXjl8THBjZwr2Uxz/0uQRikWI6BfnzazSQt4l75RVMx3ipJimA8
	Uvx0FNwjsgGYXU3QncGy49ePjEio3jG3raDTqCB624ONigXNStB5E5dIIVgi5PT3NJMyLYXRWE7
	u19+1fTfdp56QqPBS9q/rs7oOapKVlnt+0gB8q6QfyM0YGj3RK7zfLp41lmsqSFtuPBZDLEIlXB
	6de2xErILulOsJQtOmPJp6Xw9PoIoDw=
X-Google-Smtp-Source: AGHT+IFNNT1TQk9hNsU8tcAP1XaXbTB54YiVS5jZhvg0FI/49XFrqaA3CzgEc9xU3GgDXEPKZXqRgw==
X-Received: by 2002:a05:6214:2268:b0:6ea:d6e1:f3f8 with SMTP id 6a1803df08f44-6f01e7f5c1cmr141067116d6.45.1743988035598;
        Sun, 06 Apr 2025 18:07:15 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f010bfasm51815846d6.49.2025.04.06.18.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:14 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 6/9] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2044 support
Date: Mon,  7 Apr 2025 09:06:11 +0800
Message-ID: <20250407010616.749833-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407010616.749833-1-inochiama@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sdhci IP of SG2044 is similar to it of SG2042. They
share the same clock and controller configuration.

Add compatible string for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml        | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
index e6e604072d3c..47b5fc1b8e07 100644
--- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
@@ -19,6 +19,9 @@ properties:
               - rockchip,rk3562-dwcmshc
               - rockchip,rk3576-dwcmshc
           - const: rockchip,rk3588-dwcmshc
+      - items:
+          - const: sophgo,sg2044-dwcmshc
+          - const: sophgo,sg2042-dwcmshc
       - enum:
           - rockchip,rk3568-dwcmshc
           - rockchip,rk3588-dwcmshc
@@ -74,7 +77,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: sophgo,sg2042-dwcmshc
+            enum:
+              - sophgo,sg2042-dwcmshc
+              - sophgo,sg2044-dwcmshc
 
     then:
       properties:
-- 
2.49.0


