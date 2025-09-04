Return-Path: <linux-i2c+bounces-12629-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB25B43E18
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFAB117EEEF
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9787E3081C2;
	Thu,  4 Sep 2025 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVEvPs9w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FC5307481;
	Thu,  4 Sep 2025 14:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756994839; cv=none; b=bm1/ZbajYH1KM/O16HpgFB90onohSNrYyNbPfU7sjbO44Ed90V3DkZmX6xj2KRb9VWPx4a+nrhceeELK7Be1NfxiTiUOhnkqBLA2mUQuq8Vt/cUaJkoSwaMJkwA52j4qlg9Zks8C90lW6UiFVRdM3AQvJVK3MIO0Eq43R15c0+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756994839; c=relaxed/simple;
	bh=FWfkf2K/As/HY295WWG/h7wnSFwEcmpa3ryJTLAMao0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AOWI2fX8stJd+iwU4tY33MFZ6BPir/W/grQbIMKYetPHW9cP3THHYFeAUdwFl4N0wqPOKaTgIpfRS9N+AOOhyXOt+hekwDL9iregTlQj04xIQ2/ClILeOKuhqACk3z5OtuqalLxMgIRLX0tTosF+14MUmNZNxoV3PZ/4tumxs0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVEvPs9w; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4b3d3f6360cso12084191cf.0;
        Thu, 04 Sep 2025 07:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756994835; x=1757599635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEWsfe2YY56Y0NYA602LXIe3dsPA7RKn4VfScJVc2bs=;
        b=FVEvPs9waBgD9fk9PmdNhNdIX5QO6FBvg1PAk/P9+5h23M/6ZVc+0KDZAvRo4ldhWb
         IxmbW4ljcYdeZW0PDyhHYFKuxZXyeGpgCmyHeGrPQ/I3WDbQygBdziBs5BaMkBeFwiaP
         5gvQOsRfhahZosnX2NDf/Xkb315f8ajMtAPWIIytIm5ADIMlMNrbf1AOEe4518wPs4hr
         nRh6puv1BSePZ1d2zAWMujkiXk3HP7yGqNKXS3LAQrgunXwxIHS15zoaJ9Xe5Gx+OjWP
         8b1pYxVsLjLXWca2mXLZ8KWoGkX20rtDPsLZJlPUutkVRl30mAu6wOCQ4B0wL/ryAIJp
         0TtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756994835; x=1757599635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEWsfe2YY56Y0NYA602LXIe3dsPA7RKn4VfScJVc2bs=;
        b=pJN9Uh0RouATgIhR4F0/a1r9u+FglQAYhVj9NWTqENFt/6KMSsF2D6XPC+s8jOPSBf
         +lRILnl3AYB1eILFGzEwGDf4MDhLMk5cOMS7GxjCLtHBjeq8DIfC9EjVjUZDe6YHR8Jt
         nRerRiV6WbsMeuPNmNu2+t97aKrcZ1JoTfRCQW5QJunleEMUKUlatVDtiv1E/Xm/do0I
         gbur9RQKoUmckMFuERHB6BYxFm6unkd60MtsQIO5FBE4sHOJEwKDuKsZYnO6CtfCtNU/
         syhRrf5qVc/mcye8YA/DwECTcMXK+RXhzSdttjw3c+Shx64pO8sww39B5nKrgqpAqZz/
         gUFA==
X-Forwarded-Encrypted: i=1; AJvYcCVY0Ca6B+q+nVTlrEkmgUzQxG5tW8X1CbyrNvhoka8uOLc8/jKhymxOJsKd4S5BVvEn9iU8wh2PPF3e@vger.kernel.org, AJvYcCVqkIvSOIiwbZfwVrux9BDqxt5aA230dIvKL66hVOtvA/kqeJq1gW+PIdGAjwHT/t6L4snK4E0ZS4AN@vger.kernel.org, AJvYcCWPWPH+4MoGh/T7OT3xQHlykehYeLGIbXMZYPDsDh4KtOYc6JsD9iJt5Dm3uwhWoeFfwEXmPzXrn1ov1xw2@vger.kernel.org, AJvYcCWy2FltFEl8/LwTq1O2As8zM4OkzFYHKlYkzhS2V2dqivpGYJmTZUl9TN0lNqZC9bclKTIOnoslzLKE@vger.kernel.org
X-Gm-Message-State: AOJu0YzoymxlsmKkUYE5Ou5dX2qj3lAbjh2kYlDNmYj3uSWnWmaDVbiN
	zUWeZWS2yg0qs+o8LL7CHZ/QNRq/GnAGi7dUL1x05Rwjl9ADb8n+kFz/roOJ2vcw
X-Gm-Gg: ASbGncubOVi3rEjpPo2BBbivJksXbrAJS+BdgG+joygSvZtv42s2Xps+dPxhXOq0d8U
	MDhBqbXqqTDI9P3sS3AzXQ06mDZk6vUw1OLvbsCFPk49t5uG72JEb2w5HRn7eOQKtxW0JUOqPws
	bhXnHVtuTRY6Z/r6ni6j9Dw3mRR+UZkkiIdJsJOs8kHQrQn/WNzwCoHgQBeEWOpaeVPf5TkdAOe
	Hfz+4eLt8oPCqIYQYGpoNBaDLOzM6LmVUmeraiS8a+w1UZHlwqheN3s5nqdbKvslYMtkV+Kihnd
	KSdgeOkxECp3IIclI+nmT5EZUwaY3O6sAPq/dpxfP/AtudjwQUupu/kGQHOdE9IHO60bkA7MPUx
	FlkcnHrjlukUJLu8eHG2qadqHdi7Gp8Diwq62v+4=
X-Google-Smtp-Source: AGHT+IFSn3RGIh9Vo9ZpAm8JD24yupRBSRlNS1hxRaXiIPj2Z064y2yu8lRKzq97ApwGEYc9lzPw1A==
X-Received: by 2002:a05:622a:28d:b0:4b5:e175:eadb with SMTP id d75a77b69052e-4b5e175ee17mr13666051cf.57.1756994834553;
        Thu, 04 Sep 2025 07:07:14 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.194])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80bdedfeaedsm212280285a.70.2025.09.04.07.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:07:14 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Thu, 04 Sep 2025 14:07:11 +0000
Subject: [PATCH v3 1/4] dt-bindings: clock: exynos990: Add PERIC0 and
 PERIC1 clock units
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-perics-usi-v3-1-3ea109705cb6@gmail.com>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
In-Reply-To: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756994833; l=9680;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=FWfkf2K/As/HY295WWG/h7wnSFwEcmpa3ryJTLAMao0=;
 b=gE/El9JO4DhQ8WfqRu+Cst8I2FxPHHt0V/SY5EhIK4V6kGjue5i9Q9DVKdEqhHPiUkJTyTjxD
 h33A/t2LiKtDb1522f3bO4FjSfRr4OONOskoL+a2TrdCmTAEGngPFSf
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add clock management unit bindings for PERIC0 and PERIC1 blocks
which provide clocks for USI, I2C and UART peripherals.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../bindings/clock/samsung,exynos990-clock.yaml    |  24 +++
 include/dt-bindings/clock/samsung,exynos990.h      | 176 +++++++++++++++++++++
 2 files changed, 200 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
index c15cc1752b026231d8d9c3c07bdab201016b6078..5cd2d80b8ed667af2b44e3686aacbe3de31e3e2d 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
@@ -30,6 +30,8 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,exynos990-cmu-peric1
+      - samsung,exynos990-cmu-peric0
       - samsung,exynos990-cmu-hsi0
       - samsung,exynos990-cmu-peris
       - samsung,exynos990-cmu-top
@@ -56,6 +58,28 @@ required:
   - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos990-cmu-peric1
+              - samsung,exynos990-cmu-peric0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: Connectivity Peripheral 0/1 bus clock (from CMU_TOP)
+            - description: Connectivity Peripheral 0/1 IP clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: ip
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index c60f15503d5b18b11ca9bdce86466512dc933901..47540307cb52ead9c8f82a99957cdb2f1b0633e8 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -238,6 +238,182 @@
 #define CLK_GOUT_HSI0_XIU_D_HSI0_ACLK			22
 #define CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK		23
 
+/* CMU_PERIC0 */
+#define CLK_MOUT_PERIC0_BUS_USER		1
+#define CLK_MOUT_PERIC0_UART_DBG		2
+#define CLK_MOUT_PERIC0_USI00_USI_USER		3
+#define CLK_MOUT_PERIC0_USI01_USI_USER		4
+#define CLK_MOUT_PERIC0_USI02_USI_USER		5
+#define CLK_MOUT_PERIC0_USI03_USI_USER		6
+#define CLK_MOUT_PERIC0_USI04_USI_USER		7
+#define CLK_MOUT_PERIC0_USI05_USI_USER		8
+#define CLK_MOUT_PERIC0_USI13_USI_USER		9
+#define CLK_MOUT_PERIC0_USI14_USI_USER		10
+#define CLK_MOUT_PERIC0_USI15_USI_USER		11
+#define CLK_MOUT_PERIC0_USI_I2C_USER		12
+#define CLK_DOUT_PERIC0_UART_DBG		13
+#define CLK_DOUT_PERIC0_USI00_USI		14
+#define CLK_DOUT_PERIC0_USI01_USI		15
+#define CLK_DOUT_PERIC0_USI02_USI		16
+#define CLK_DOUT_PERIC0_USI03_USI		17
+#define CLK_DOUT_PERIC0_USI04_USI		18
+#define CLK_DOUT_PERIC0_USI05_USI		19
+#define CLK_DOUT_PERIC0_USI13_USI		20
+#define CLK_DOUT_PERIC0_USI14_USI		21
+#define CLK_DOUT_PERIC0_USI15_USI		22
+#define CLK_DOUT_PERIC0_USI_I2C			23
+#define CLK_GOUT_PERIC0_CMU_PCLK		24
+#define CLK_GOUT_PERIC0_OSCCLK_CLK		25
+#define CLK_GOUT_PERIC0_D_TZPC_PCLK		26
+#define CLK_GOUT_PERIC0_GPIO_PCLK		27
+#define CLK_GOUT_PERIC0_LHM_AXI_P_CLK		28
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_10		29
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_11		30
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_12		31
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_13		32
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_14		33
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_15		34
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_4		35
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_5		36
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_6		37
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_7		38
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_8		39
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_9		40
+#define CLK_GOUT_PERIC0_TOP0_PCLK_10		41
+#define CLK_GOUT_PERIC0_TOP0_PCLK_11		42
+#define CLK_GOUT_PERIC0_TOP0_PCLK_12		43
+#define CLK_GOUT_PERIC0_TOP0_PCLK_13		44
+#define CLK_GOUT_PERIC0_TOP0_PCLK_14		45
+#define CLK_GOUT_PERIC0_TOP0_PCLK_15		46
+#define CLK_GOUT_PERIC0_TOP0_PCLK_4		47
+#define CLK_GOUT_PERIC0_TOP0_PCLK_5		48
+#define CLK_GOUT_PERIC0_TOP0_PCLK_6		49
+#define CLK_GOUT_PERIC0_TOP0_PCLK_7		50
+#define CLK_GOUT_PERIC0_TOP0_PCLK_8		51
+#define CLK_GOUT_PERIC0_TOP0_PCLK_9		52
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_0		53
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_3		54
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_4		55
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_5		56
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_6		57
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_7		58
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_8		59
+#define CLK_GOUT_PERIC0_TOP1_PCLK_0		60
+#define CLK_GOUT_PERIC0_TOP1_PCLK_15		61
+#define CLK_GOUT_PERIC0_TOP1_PCLK_3		62
+#define CLK_GOUT_PERIC0_TOP1_PCLK_4		63
+#define CLK_GOUT_PERIC0_TOP1_PCLK_5		64
+#define CLK_GOUT_PERIC0_TOP1_PCLK_6		65
+#define CLK_GOUT_PERIC0_TOP1_PCLK_7		66
+#define CLK_GOUT_PERIC0_TOP1_PCLK_8		67
+#define CLK_GOUT_PERIC0_BUSP_CLK		68
+#define CLK_GOUT_PERIC0_UART_DBG_CLK		69
+#define CLK_GOUT_PERIC0_USI00_USI_CLK		70
+#define CLK_GOUT_PERIC0_USI01_USI_CLK		71
+#define CLK_GOUT_PERIC0_USI02_USI_CLK		72
+#define CLK_GOUT_PERIC0_USI03_USI_CLK		73
+#define CLK_GOUT_PERIC0_USI04_USI_CLK		74
+#define CLK_GOUT_PERIC0_USI05_USI_CLK		75
+#define CLK_GOUT_PERIC0_USI13_USI_CLK		76
+#define CLK_GOUT_PERIC0_USI14_USI_CLK		77
+#define CLK_GOUT_PERIC0_USI15_USI_CLK		78
+#define CLK_GOUT_PERIC0_USI_I2C_CLK		79
+#define CLK_GOUT_PERIC0_SYSREG_PCLK		80
+
+/* CMU_PERIC1 */
+#define CLK_MOUT_PERIC1_BUS_USER		1
+#define CLK_MOUT_PERIC1_UART_BT_USER		2
+#define CLK_MOUT_PERIC1_USI06_USI_USER		3
+#define CLK_MOUT_PERIC1_USI07_USI_USER		4
+#define CLK_MOUT_PERIC1_USI08_USI_USER		5
+#define CLK_MOUT_PERIC1_USI09_USI_USER		6
+#define CLK_MOUT_PERIC1_USI10_USI_USER		7
+#define CLK_MOUT_PERIC1_USI11_USI_USER		8
+#define CLK_MOUT_PERIC1_USI12_USI_USER		9
+#define CLK_MOUT_PERIC1_USI18_USI_USER		10
+#define CLK_MOUT_PERIC1_USI16_USI_USER		11
+#define CLK_MOUT_PERIC1_USI17_USI_USER		12
+#define CLK_MOUT_PERIC1_USI_I2C_USER            13
+#define CLK_DOUT_PERIC1_UART_BT			14
+#define CLK_DOUT_PERIC1_USI06_USI		15
+#define CLK_DOUT_PERIC1_USI07_USI		16
+#define CLK_DOUT_PERIC1_USI08_USI		17
+#define CLK_DOUT_PERIC1_USI18_USI		18
+#define CLK_DOUT_PERIC1_USI12_USI		19
+#define CLK_DOUT_PERIC1_USI09_USI		20
+#define CLK_DOUT_PERIC1_USI10_USI		21
+#define CLK_DOUT_PERIC1_USI11_USI		22
+#define CLK_DOUT_PERIC1_USI16_USI		23
+#define CLK_DOUT_PERIC1_USI17_USI		24
+#define CLK_DOUT_PERIC1_USI_I2C			25
+#define CLK_GOUT_PERIC1_CMU_PCLK		26
+#define CLK_GOUT_PERIC1_UART_BT_CLK		27
+#define CLK_GOUT_PERIC1_USI12_USI_CLK		28
+#define CLK_GOUT_PERIC1_USI18_USI_CLK		29
+#define CLK_GOUT_PERIC1_D_TZPC_PCLK		30
+#define CLK_GOUT_PERIC1_GPIO_PCLK		31
+#define CLK_GOUT_PERIC1_LHM_AXI_P_CSIS_CLK	32
+#define CLK_GOUT_PERIC1_LHM_AXI_P_CLK		33
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_10		34
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_11		35
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_12		36
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_13		37
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_14		38
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_15		39
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_4		40
+#define CLK_GOUT_PERIC1_TOP0_PCLK_10		41
+#define CLK_GOUT_PERIC1_TOP0_PCLK_11		42
+#define CLK_GOUT_PERIC1_TOP0_PCLK_12		43
+#define CLK_GOUT_PERIC1_TOP0_PCLK_13		44
+#define CLK_GOUT_PERIC1_TOP0_PCLK_14		45
+#define CLK_GOUT_PERIC1_TOP0_PCLK_15		46
+#define CLK_GOUT_PERIC1_TOP0_PCLK_4		47
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_0		48
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_1		49
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_10		50
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_12		51
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_13		52
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_14		53
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_15		54
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_2		55
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_3		56
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_4		57
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_5		58
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_6		59
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_7		60
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_9		61
+#define CLK_GOUT_PERIC1_TOP1_PCLK_0		62
+#define CLK_GOUT_PERIC1_TOP1_PCLK_1		63
+#define CLK_GOUT_PERIC1_TOP1_PCLK_10		64
+#define CLK_GOUT_PERIC1_TOP1_PCLK_12		65
+#define CLK_GOUT_PERIC1_TOP1_PCLK_13		66
+#define CLK_GOUT_PERIC1_TOP1_PCLK_14		67
+#define CLK_GOUT_PERIC1_TOP1_PCLK_15		68
+#define CLK_GOUT_PERIC1_TOP1_PCLK_2		69
+#define CLK_GOUT_PERIC1_TOP1_PCLK_3		70
+#define CLK_GOUT_PERIC1_TOP1_PCLK_4		71
+#define CLK_GOUT_PERIC1_TOP1_PCLK_5		72
+#define CLK_GOUT_PERIC1_TOP1_PCLK_6		73
+#define CLK_GOUT_PERIC1_TOP1_PCLK_7		74
+#define CLK_GOUT_PERIC1_TOP1_PCLK_9		75
+#define CLK_GOUT_PERIC1_BUSP_CLK		76
+#define CLK_GOUT_PERIC1_OSCCLK_CLK		77
+#define CLK_GOUT_PERIC1_USI06_USI_CLK		78
+#define CLK_GOUT_PERIC1_USI07_USI_CLK		79
+#define CLK_GOUT_PERIC1_USI08_USI_CLK		80
+#define CLK_GOUT_PERIC1_USI09_USI_CLK		81
+#define CLK_GOUT_PERIC1_USI10_USI_CLK		82
+#define CLK_GOUT_PERIC1_USI11_USI_CLK		83
+#define CLK_GOUT_PERIC1_USI16_USI_CLK		84
+#define CLK_GOUT_PERIC1_USI17_USI_CLK		85
+#define CLK_GOUT_PERIC1_USI_I2C_CLK		86
+#define CLK_GOUT_PERIC1_SYSREG_PCLK		87
+#define CLK_GOUT_PERIC1_USI16_I3C_PCLK		88
+#define CLK_GOUT_PERIC1_USI16_I3C_SCLK		89
+#define CLK_GOUT_PERIC1_USI17_I3C_PCLK		90
+#define CLK_GOUT_PERIC1_USI17_I3C_SCLK		91
+#define CLK_GOUT_PERIC1_XIU_P_ACLK		92
+
 /* CMU_PERIS */
 #define CLK_MOUT_PERIS_BUS_USER			1
 #define CLK_MOUT_PERIS_CLK_PERIS_GIC		2

-- 
2.50.1


