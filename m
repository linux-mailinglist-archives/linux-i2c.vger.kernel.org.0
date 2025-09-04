Return-Path: <linux-i2c+bounces-12631-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 557D1B43E22
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52B48189D4EA
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAFF306497;
	Thu,  4 Sep 2025 14:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyPJghnz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45D5307AD9;
	Thu,  4 Sep 2025 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756994842; cv=none; b=G3DzRqIcG99j6cAi+ojE8JOcjXhYQLiQ3aptRho/2uIIxot1pLOQg1zKkdcFVZZUArFGXKzxpkUmMe2oJT+o+zD7W27eTjUiCeyXY4utCPTKMzgdktnhYH4yQKKc2QtoQZty3la2YPte8rA7Fstu+mNQMsiuP944ydNYZ207W+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756994842; c=relaxed/simple;
	bh=lWN0ulIH0wwIJPga4ChEhM5mxUFxQkAfxBCmjxx95HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SgK+es11ZVQkj2j5Q20su/4PGijyp9VHdwCAzzOs82jwluD0FM+Dt0KtKT7qVPeq9cnppix6Qyp6PQvsieaHnk0zDOWBH9UE4sT72sGVXySS8Z1Fut9OLlGXL55qHa4NvFFjSImLJehZT8cqCRyJyZW7cfCpeRIHpI+BAeLQcu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyPJghnz; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7fe9eea0d21so108096385a.2;
        Thu, 04 Sep 2025 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756994837; x=1757599637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJ6oNr03LbCrJdAlBeNJZO/yB/0yx3wdhXj/qEYtLCw=;
        b=eyPJghnzYtwEBwCMOnJcWnGA2/YigIdAqcuo8Ep7UizNJsDCP6T35IwuLwrdO2USYu
         2OQhe+OUYR9hXThWCtO5Qw6EXIDUGW5fGf79+e1JOp34H+FileI4hTVmryS1UuK4/lEn
         h+dESXsO0fJdw2wmGAuWu9Q7DoGcqtECFwTxpsu00lr9KNKaLsNZDQw9dku9kQ35HIEo
         jqpb5jkQpU1/ZdHlNHsZCWK3S63jy/LJXQ8E226q9RO1iYdaOxhQaY0inRNX3KL/C4FU
         bihOt5yH7eMVisQ7QSg+3SY+APKoXX9Q/a83W9Ctev3WbbOD2/VuFeQv1+cvWmmyUf1g
         tz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756994837; x=1757599637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJ6oNr03LbCrJdAlBeNJZO/yB/0yx3wdhXj/qEYtLCw=;
        b=D1tohtspsTyK366NsaTVdDqJSMplZXSRmxxGG1i7Dwdy80jgpiWcLamgQ1/rVei5Mj
         F2OhqVvtLuUysd7aHl1vf3v5r/BfKAK5uNuC6/3Fb+tsi+iyNh7tmgIDw8TmgPWQ65gp
         f46d90VNZlcDAcxA6rpsCwSxhGbZBWLIXcGR13mK86k16IO8+lk9nHfT55ZH0hmZYVJU
         k1F8Bt0m4zhOhuWgU1Doj2/nbqEzinNgqtonVvYC/aNQGwr9XHln7f88x2C+cyNl7Y15
         Y/v1bjZptHdwABArZN1i/e5KaHIrH1frS29T5j9ZkitisfBvtO/BvCurSKhRMWh5WDRx
         cmJA==
X-Forwarded-Encrypted: i=1; AJvYcCVArXA79t6kcS+0QMnY6vmHoVSdHZWf8ZU7tQvjeg6X9cSjb8ct+5MqALgDNY0AnqYuZL81RIPl355l@vger.kernel.org, AJvYcCWLXNK4BVewBvkfdQYLzwV7ft+NszvwfGkosnRTrr1o03NZrAolWHZ7UxVYd93ojZYQ0ouXOfPPp679@vger.kernel.org, AJvYcCWdNDY8j+vFNi8FpPE5o2FgndMCH7cJKnz5J+eUdmwadxMH5HRWkva3yaTZgok5Fr43goV+E5MZL2a7@vger.kernel.org, AJvYcCWxZ1dWR7t5EtlCoji3MNnd9Rlfo/W5V8IMs6eOjVHthsc/n6Sr2ADm763uS1N40YfP67B8/WKrVxShzXr0@vger.kernel.org
X-Gm-Message-State: AOJu0YxN5kqyF4PZSDc+fMen5kUKSHDr3Q9d6Rv1GVSmolXLTECQz5y4
	5RMsQhl0KT/Z5uF8GYHdBRYvZvyUrwv+MZsaBrX3VArUxkowxl6/USzIk6E5NEAa
X-Gm-Gg: ASbGncuLcLllraViyBW0a4/5jNaAqf12Hs4IsUOvhQFdptvvGn6ZofzG4dfeCL6fIvs
	38piIG7PsnbpcqenYUzgioaMkYDoVlS/Co5Q5OjFF25fS2YVpE5Khmd2bfSu53jaxgEN+lSDdLy
	PN9mIpZjguafh/bvMC0OGaT6fcGgbq3ibXKgsVISPSPIAR3LGUoCur8FxeGlEUE2zEFjvN1CfBT
	kcXHkWj0+3F3MthuDS92QMZVID5eHyIYBJyEh7Xmp7Gg1EEIgV12k0tQzAaecXmbbpTNryIpqn5
	PyA6uM25ux1bU0CGw9yUq/oQq3g0g8t3QU1b10yErDPZ4XipBvU8w9lMWL/LfH/VQYwwgFrmPWN
	1tKoDwiNyOCzlRuWmRO/mdwU/WhdueJYAN0Jz/eA=
X-Google-Smtp-Source: AGHT+IFFkHMIb4+sS654FyRBeOw6U1GzG7g3yWe1WJXGBA8dUeYCx4DP7Ryt2P7Yvb/u491tUcTI4Q==
X-Received: by 2002:a05:620a:29d3:b0:80e:159b:9aee with SMTP id af79cd13be357-80e159b9b02mr322675085a.79.1756994836053;
        Thu, 04 Sep 2025 07:07:16 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.194])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80bdedfeaedsm212280285a.70.2025.09.04.07.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:07:15 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Thu, 04 Sep 2025 14:07:13 +0000
Subject: [PATCH v3 3/4] clk: samsung: exynos990: Add PERIC0 and PERIC1
 clock support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-perics-usi-v3-3-3ea109705cb6@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756994833; l=63213;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=lWN0ulIH0wwIJPga4ChEhM5mxUFxQkAfxBCmjxx95HM=;
 b=rENCkkbuimhOPxbNwSVRJer/1fm2AevIORgu02n3C8Du3FaK1Wu/EzTen9PCAO8vAz/SR8Ddh
 aty47+MfYVEDcnDuHIlBB8Fu9T7AQF1tnPWUoX/oEhRoLfuBLIUlZsq
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add clock controller support for Peripheral Connectivity 0 and 1 blocks.
These provide clocks for USI, I2C and UART peripherals.

Some clocks need to be marked as critical to prevent system hang when
disabled.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 1152 +++++++++++++++++++++++++++++++++++
 1 file changed, 1152 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 47a1e0850c3020ab66931ae0c5ac4920f41496d0..d6ae6c2e270c6e87beb029577e661a9fba32b497 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -19,6 +19,8 @@
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP (CLK_DOUT_CMU_CLK_CMUREF + 1)
 #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK + 1)
+#define CLKS_NR_PERIC0 (CLK_GOUT_PERIC0_SYSREG_PCLK + 1)
+#define CLKS_NR_PERIC1 (CLK_GOUT_PERIC1_XIU_P_ACLK + 1)
 #define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------- */
@@ -1351,6 +1353,1150 @@ static const struct samsung_cmu_info hsi0_cmu_info __initconst = {
 	.clk_name		= "bus",
 };
 
+/* ---- CMU_PERIC0 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIC0 (0x10400000) */
+#define PLL_CON0_MUX_CLKCMU_PERIC0_BUS_USER						0x0600
+#define PLL_CON1_MUX_CLKCMU_PERIC0_BUS_USER						0x0604
+#define PLL_CON0_MUX_CLKCMU_PERIC0_UART_DBG						0x0610
+#define PLL_CON1_MUX_CLKCMU_PERIC0_UART_DBG						0x0614
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI00_USI_USER					0x0620
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI00_USI_USER					0x0624
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI01_USI_USER					0x0630
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI01_USI_USER					0x0634
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI02_USI_USER					0x0640
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI02_USI_USER					0x0644
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI03_USI_USER					0x0650
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI03_USI_USER					0x0654
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI04_USI_USER					0x0660
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI04_USI_USER					0x0664
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI05_USI_USER					0x0670
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI05_USI_USER					0x0674
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI13_USI_USER					0x0680
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI13_USI_USER					0x0684
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI14_USI_USER					0x0690
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI14_USI_USER					0x0694
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI15_USI_USER					0x06a0
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI15_USI_USER					0x06a4
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI_I2C_USER						0x06b0
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI_I2C_USER						0x06b4
+#define CLK_CON_DIV_DIV_CLK_PERIC0_UART_DBG						0x1800
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI						0x1804
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI						0x1808
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI						0x180c
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI						0x1810
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI						0x1814
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI						0x1818
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI13_USI						0x181c
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI14_USI						0x1820
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI15_USI						0x1824
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI_I2C						0x1828
+#define CLK_CON_GAT_CLK_BLK_PERIC0_UID_PERIC0_CMU_PERIC0_IPCLKPORT_PCLK			0x2004
+#define CLK_CON_GAT_CLK_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_OSCCLK_IPCLKPORT_CLK		0x2008
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_D_TZPC_PERIC0_IPCLKPORT_PCLK			0x200c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPIO_PERIC0_IPCLKPORT_PCLK			0x2010
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_LHM_AXI_P_PERIC0_IPCLKPORT_I_CLK		0x2014
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_10			0x2018
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_11			0x201c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_12			0x2020
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_13			0x2024
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_14			0x2028
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_15			0x202c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4			0x2030
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_5			0x2034
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_6			0x2038
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7			0x203c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_8			0x2040
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_9			0x2044
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_10			0x2048
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_11			0x204c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_12			0x2050
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_13			0x2054
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_14			0x2058
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_15			0x205c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_4			0x2060
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_5			0x2064
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_6			0x2068
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7			0x206c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_8			0x2070
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9			0x2074
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_0			0x2078
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_3			0x207c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_4			0x2080
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_5			0x2084
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_6			0x2088
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_7			0x208c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_8			0x2090
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_0			0x2094
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_15			0x2098
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_3			0x209c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_4			0x20a0
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_5			0x20a4
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_6			0x20a8
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_7			0x20ac
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_8			0x20b0
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_BUSP_IPCLKPORT_CLK		0x20b4
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_UART_DBG_IPCLKPORT_CLK	0x20b8
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI00_USI_IPCLKPORT_CLK	0x20bc
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI01_USI_IPCLKPORT_CLK	0x20c0
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI02_USI_IPCLKPORT_CLK	0x20c4
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI03_USI_IPCLKPORT_CLK	0x20c8
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI04_USI_IPCLKPORT_CLK	0x20cc
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI05_USI_IPCLKPORT_CLK	0x20d0
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI13_USI_IPCLKPORT_CLK	0x20d4
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI14_USI_IPCLKPORT_CLK	0x20d8
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI15_USI_IPCLKPORT_CLK	0x20dc
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI_I2C_IPCLKPORT_CLK	0x20e0
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_SYSREG_PERIC0_IPCLKPORT_PCLK			0x20e4
+
+static const unsigned long peric0_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_PERIC0_BUS_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_BUS_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_UART_DBG,
+	PLL_CON1_MUX_CLKCMU_PERIC0_UART_DBG,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI00_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI00_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI01_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI01_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI02_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI02_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI03_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI03_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI04_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI04_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI05_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI05_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI13_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI13_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI14_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI14_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI15_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI15_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI_I2C_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI_I2C_USER,
+	CLK_CON_DIV_DIV_CLK_PERIC0_UART_DBG,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI13_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI14_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI15_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI_I2C,
+	CLK_CON_GAT_CLK_BLK_PERIC0_UID_PERIC0_CMU_PERIC0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_CLK_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_OSCCLK_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_D_TZPC_PERIC0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPIO_PERIC0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_LHM_AXI_P_PERIC0_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_10,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_11,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_12,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_13,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_14,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_15,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_5,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_6,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_8,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_9,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_10,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_11,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_12,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_13,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_14,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_15,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_4,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_5,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_6,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_8,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_0,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_3,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_4,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_5,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_6,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_7,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_8,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_0,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_15,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_3,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_4,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_5,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_6,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_7,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_8,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_BUSP_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_UART_DBG_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI00_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI01_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI02_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI03_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI04_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI05_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI13_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI14_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI15_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI_I2C_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_SYSREG_PERIC0_IPCLKPORT_PCLK,
+};
+
+/* Parent clock list for CMU_PERIC0 muxes */
+PNAME(mout_peric0_bus_user_p) = { "oscclk", "dout_cmu_peric0_bus" };
+PNAME(mout_peric0_uart_dbg_p) = { "oscclk", "dout_cmu_peric0_ip" };
+PNAME(mout_peric0_usi00_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
+PNAME(mout_peric0_usi01_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
+PNAME(mout_peric0_usi02_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
+PNAME(mout_peric0_usi03_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
+PNAME(mout_peric0_usi04_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
+PNAME(mout_peric0_usi05_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
+PNAME(mout_peric0_usi13_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
+PNAME(mout_peric0_usi14_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
+PNAME(mout_peric0_usi15_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
+PNAME(mout_peric0_usi_i2c_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
+
+static const struct samsung_mux_clock peric0_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIC0_BUS_USER, "mout_peric0_bus_user",
+	    mout_peric0_bus_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_BUS_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC0_UART_DBG, "mout_peric0_uart_dbg",
+	    mout_peric0_uart_dbg_p, PLL_CON0_MUX_CLKCMU_PERIC0_UART_DBG,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC0_USI00_USI_USER, "mout_peric0_usi00_usi_user",
+	    mout_peric0_usi00_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI00_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC0_USI01_USI_USER, "mout_peric0_usi01_usi_user",
+	    mout_peric0_usi01_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI01_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC0_USI02_USI_USER, "mout_peric0_usi02_usi_user",
+	    mout_peric0_usi02_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI02_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC0_USI03_USI_USER, "mout_peric0_usi03_usi_user",
+	    mout_peric0_usi03_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI03_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC0_USI04_USI_USER, "mout_peric0_usi04_usi_user",
+	    mout_peric0_usi04_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI04_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC0_USI05_USI_USER, "mout_peric0_usi05_usi_user",
+	    mout_peric0_usi05_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI05_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC0_USI13_USI_USER, "mout_peric0_usi13_usi_user",
+	    mout_peric0_usi13_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI13_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC0_USI14_USI_USER, "mout_peric0_usi14_usi_user",
+	    mout_peric0_usi14_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI14_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC0_USI15_USI_USER, "mout_peric0_usi15_usi_user",
+	    mout_peric0_usi15_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI15_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC0_USI_I2C_USER, "mout_peric0_usi_i2c_user",
+	    mout_peric0_usi_i2c_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI_I2C_USER,
+	    4, 1),
+};
+
+static const struct samsung_div_clock peric0_div_clks[] __initconst = {
+	DIV(CLK_DOUT_PERIC0_UART_DBG, "dout_peric0_uart_dbg",
+	    "mout_peric0_uart_dbg",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_UART_DBG,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI00_USI, "dout_peric0_usi00_usi",
+	    "mout_peric0_usi00_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI01_USI, "dout_peric0_usi01_usi",
+	    "mout_peric0_usi01_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI02_USI, "dout_peric0_usi02_usi",
+	    "mout_peric0_usi02_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI03_USI, "dout_peric0_usi03_usi",
+	    "mout_peric0_usi03_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI04_USI, "dout_peric0_usi04_usi",
+	    "mout_peric0_usi04_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI05_USI, "dout_peric0_usi05_usi",
+	    "mout_peric0_usi05_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI13_USI, "dout_peric0_usi13_usi",
+	    "mout_peric0_usi13_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI13_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI14_USI, "dout_peric0_usi14_usi",
+	    "mout_peric0_usi14_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI14_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI15_USI, "dout_peric0_usi15_usi",
+	    "mout_peric0_usi15_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI15_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI_I2C, "dout_peric0_usi_i2c",
+	    "mout_peric0_usi_i2c_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI_I2C,
+	    0, 4),
+};
+
+static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_PERIC0_CMU_PCLK, "gout_peric0_cmu_pclk",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_CLK_BLK_PERIC0_UID_PERIC0_CMU_PERIC0_IPCLKPORT_PCLK,
+	     21, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIC0_OSCCLK_CLK, "gout_peric0_oscclk_clk",
+	     "oscclk",
+	     CLK_CON_GAT_CLK_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_OSCCLK_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_D_TZPC_PCLK, "gout_peric0_d_tpzc_pclk",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_D_TZPC_PERIC0_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_GPIO_PCLK, "gout_peric0_gpio_pclk",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPIO_PERIC0_IPCLKPORT_PCLK,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_PERIC0_LHM_AXI_P_CLK, "gout_peric0_lhm_axi_p_clk",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_LHM_AXI_P_PERIC0_IPCLKPORT_I_CLK,
+	     21, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_IPCLK_10, "gout_peric0_top0_ipclk_10",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_10,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_IPCLK_11, "gout_peric0_top0_ipclk_11",
+	     "dout_peric0_usi03_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_11,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_IPCLK_12, "gout_peric0_top0_ipclk_12",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_12,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_IPCLK_13, "gout_peric0_top0_ipclk_13",
+	     "dout_peric0_usi04_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_13,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_IPCLK_14, "gout_peric0_top0_ipclk_14",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_14,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_IPCLK_15, "gout_peric0_top0_ipclk_15",
+	     "dout_peric0_usi05_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_15,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_IPCLK_4, "gout_peric0_top0_ipclk_4",
+	     "dout_peric0_uart_dbg",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_IPCLK_5, "gout_peric0_top0_ipclk_5",
+	     "dout_peric0_usi00_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_5,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_IPCLK_6, "gout_peric0_top0_ipclk_6",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_6,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_IPCLK_7, "gout_peric0_top0_ipclk_7",
+	     "dout_peric0_usi01_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_IPCLK_8, "gout_peric0_top0_ipclk_8",
+	    "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_8,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_IPCLK_9, "gout_peric0_top0_ipclk_9",
+	     "dout_peric0_usi02_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_9,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_PCLK_10, "gout_peric0_top0_pclk_10",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_10,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_PCLK_11, "gout_peric0_top0_pclk_11",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_11,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_PCLK_12, "gout_peric0_top0_pclk_12",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_12,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_PCLK_13, "gout_peric0_top0_pclk_13",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_13,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_PCLK_14, "gout_peric0_top0_pclk_14",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_14,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_PCLK_15, "gout_peric0_top0_pclk_15",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_15,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_PCLK_4, "gout_peric0_top0_pclk_4",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_4,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_PCLK_5, "gout_peric0_top0_pclk_5",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_5,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_PCLK_6, "gout_peric0_top0_pclk_6",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_6,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_PCLK_7, "gout_peric0_top0_pclk_7",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_PCLK_8, "gout_peric0_top0_pclk_8",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_8,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP0_PCLK_9, "gout_peric0_top0_pclk_9",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP1_IPCLK_0, "gout_peric0_top1_ipclk_0",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_0,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP1_IPCLK_3, "gout_peric0_top1_ipclk_3",
+	     "dout_peric0_usi13_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_3,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP1_IPCLK_4, "gout_peric0_top1_ipclk_4",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_4,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP1_IPCLK_5, "gout_peric0_top1_ipclk_5",
+	     "dout_peric0_usi14_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_5,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP1_IPCLK_6, "gout_peric0_top1_ipclk_6",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_6,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP1_IPCLK_7, "gout_peric0_top1_ipclk_7",
+	     "dout_peric0_usi15_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_7,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP1_IPCLK_8, "gout_peric0_top1_ipclk_8",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_8,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP1_PCLK_0, "gout_peric0_top1_pclk_0",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_0,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP1_PCLK_15, "gout_peric0_top1_pclk_15",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_15,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP1_PCLK_3, "gout_peric0_top1_pclk_3",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_3,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP1_PCLK_4, "gout_peric0_top1_pclk_4",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_4,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP1_PCLK_5, "gout_peric0_top1_pclk_5",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_5,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP1_PCLK_6, "gout_peric0_top1_pclk_6",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_6,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP1_PCLK_7, "gout_peric0_top1_pclk_7",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_7,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_TOP1_PCLK_8, "gout_peric0_top1_pclk_8",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_8,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_BUSP_CLK, "gout_peric0_busp_clk",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_BUSP_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_UART_DBG_CLK, "gout_peric0_uart_dbg_clk",
+	     "dout_peric0_uart_dbg",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_UART_DBG_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_USI00_USI_CLK, "gout_peric0_usi00_usi_clk",
+	     "dout_peric0_usi00_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI00_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_USI01_USI_CLK, "gout_peric0_usi01_usi_clk",
+	     "dout_peric0_usi01_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI01_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_USI02_USI_CLK, "gout_peric0_usi02_usi_clk",
+	     "dout_peric0_usi02_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI02_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_USI03_USI_CLK, "gout_peric0_usi03_usi_clk",
+	     "dout_peric0_usi03_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI03_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_USI04_USI_CLK, "gout_peric0_usi04_usi_clk",
+	     "dout_peric0_usi04_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI04_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_USI05_USI_CLK, "gout_peric0_usi05_usi_clk",
+	     "dout_peric0_usi05_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI05_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_USI13_USI_CLK, "gout_peric0_usi13_usi_clk",
+	     "dout_peric0_usi13_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI13_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_USI14_USI_CLK, "gout_peric0_usi14_usi_clk",
+	     "dout_peric0_usi14_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI14_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_USI15_USI_CLK, "gout_peric0_usi15_usi_clk",
+	     "dout_peric0_usi15_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI15_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_USI_I2C_CLK, "gout_peric0_usi_i2c_clk",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI_I2C_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_SYSREG_PCLK, "gout_peric0_sysreg_pclk",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_SYSREG_PERIC0_IPCLKPORT_PCLK,
+	     21, 0, 0)
+};
+
+static const struct samsung_cmu_info peric0_cmu_info __initconst = {
+	.mux_clks	= peric0_mux_clks,
+	.nr_mux_clks	= ARRAY_SIZE(peric0_mux_clks),
+	.div_clks	= peric0_div_clks,
+	.nr_div_clks	= ARRAY_SIZE(peric0_div_clks),
+	.gate_clks	= peric0_gate_clks,
+	.nr_gate_clks	= ARRAY_SIZE(peric0_gate_clks),
+	.nr_clk_ids	= CLKS_NR_PERIC0,
+	.clk_regs	= peric0_clk_regs,
+	.nr_clk_regs	= ARRAY_SIZE(peric0_clk_regs),
+	.clk_name	= "bus",
+};
+
+/* ---- CMU_PERIC1 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIC1 (0x10700000) */
+#define PLL_CON0_MUX_CLKCMU_PERIC1_BUS_USER						0x0600
+#define PLL_CON1_MUX_CLKCMU_PERIC1_BUS_USER						0x0604
+#define PLL_CON0_MUX_CLKCMU_PERIC1_UART_BT_USER						0x0610
+#define PLL_CON1_MUX_CLKCMU_PERIC1_UART_BT_USER						0x0614
+#define PLL_CON0_MUX_CLKCMU_PERIC1_USI06_USI_USER					0x0620
+#define PLL_CON1_MUX_CLKCMU_PERIC1_USI06_USI_USER					0x0624
+#define PLL_CON0_MUX_CLKCMU_PERIC1_USI07_USI_USER					0x0630
+#define PLL_CON1_MUX_CLKCMU_PERIC1_USI07_USI_USER					0x0634
+#define PLL_CON0_MUX_CLKCMU_PERIC1_USI08_USI_USER					0x0640
+#define PLL_CON1_MUX_CLKCMU_PERIC1_USI08_USI_USER					0x0644
+#define PLL_CON0_MUX_CLKCMU_PERIC1_USI09_USI_USER					0x0650
+#define PLL_CON1_MUX_CLKCMU_PERIC1_USI09_USI_USER					0x0654
+#define PLL_CON0_MUX_CLKCMU_PERIC1_USI10_USI_USER					0x0660
+#define PLL_CON1_MUX_CLKCMU_PERIC1_USI10_USI_USER					0x0664
+#define PLL_CON0_MUX_CLKCMU_PERIC1_USI11_USI_USER					0x0670
+#define PLL_CON1_MUX_CLKCMU_PERIC1_USI11_USI_USER					0x0674
+#define PLL_CON0_MUX_CLKCMU_PERIC1_USI12_USI_USER					0x0680
+#define PLL_CON1_MUX_CLKCMU_PERIC1_USI12_USI_USER					0x0684
+#define PLL_CON0_MUX_CLKCMU_PERIC1_USI16_USI_USER					0x0690
+#define PLL_CON1_MUX_CLKCMU_PERIC1_USI16_USI_USER					0x0694
+#define PLL_CON0_MUX_CLKCMU_PERIC1_USI17_USI_USER					0x06a0
+#define PLL_CON1_MUX_CLKCMU_PERIC1_USI17_USI_USER					0x06a4
+#define PLL_CON0_MUX_CLKCMU_PERIC1_USI18_USI_USER					0x06b0
+#define PLL_CON1_MUX_CLKCMU_PERIC1_USI18_USI_USER					0x06b4
+#define PLL_CON0_MUX_CLKCMU_PERIC1_USI_I2C_USER						0x06c0
+#define PLL_CON1_MUX_CLKCMU_PERIC1_USI_I2C_USER						0x06c4
+#define CLK_CON_DIV_DIV_CLK_PERIC1_UART_BT						0x1800
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI06_USI						0x1804
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI07_USI						0x1808
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI08_USI						0x180c
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI09_USI						0x1810
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI10_USI						0x1814
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI11_USI						0x1818
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI12_USI						0x181c
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI16_USI						0x1820
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI17_USI						0x1824
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI18_USI						0x1828
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI_I2C						0x182c
+#define CLK_CON_GAT_CLK_BLK_PERIC1_UID_PERIC1_CMU_PERIC1_IPCLKPORT_PCLK			0x2004
+#define CLK_CON_GAT_CLK_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_UART_BT_IPCLKPORT_CLK	0x2008
+#define CLK_CON_GAT_CLK_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI12_USI_IPCLKPORT_CLK	0x200c
+#define CLK_CON_GAT_CLK_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI18_USI_IPCLKPORT_CLK	0x2010
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_D_TZPC_PERIC1_IPCLKPORT_PCLK			0x2014
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_GPIO_PERIC1_IPCLKPORT_PCLK			0x2018
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_LHM_AXI_P_CSISPERIC1_IPCLKPORT_I_CLK		0x201c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_LHM_AXI_P_PERIC1_IPCLKPORT_I_CLK		0x2020
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_10			0x2024
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_11			0x2028
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_12			0x202c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_13			0x2030
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_14			0x2034
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_15			0x2038
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_4			0x203c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_10			0x2040
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_11			0x2044
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_12			0x2048
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_13			0x204c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_14			0x2050
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_15			0x2054
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_4			0x2058
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_0			0x205c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_1			0x2060
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_10			0x2064
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_12			0x206c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_13			0x2070
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_14			0x2074
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_15			0x2078
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_2			0x207c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_3			0x2080
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_4			0x2084
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_5			0x2088
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_6			0x208c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_7			0x2090
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_9			0x2098
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_0			0x209c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_1			0x20a0
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_10			0x20a4
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_12			0x20ac
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_13			0x20b0
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_14			0x20b4
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_15			0x20b8
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_2			0x20bc
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_3			0x20c0
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_4			0x20c4
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_5			0x20c8
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_6			0x20cc
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_7			0x20d0
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_9			0x20d8
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_BUSP_IPCLKPORT_CLK		0x20dc
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_OSCCLK_IPCLKPORT_CLK	0x20e0
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI06_USI_IPCLKPORT_CLK	0x20e4
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI07_USI_IPCLKPORT_CLK	0x20e8
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI08_USI_IPCLKPORT_CLK	0x20ec
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI09_USI_IPCLKPORT_CLK	0x20f0
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI10_USI_IPCLKPORT_CLK	0x20f4
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI11_USI_IPCLKPORT_CLK	0x20f8
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI16_USI_IPCLKPORT_CLK	0x20fc
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI17_USI_IPCLKPORT_CLK	0x2100
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI_I2C_IPCLKPORT_CLK	0x2104
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_SYSREG_PERIC1_IPCLKPORT_PCLK			0x2108
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_USI16_I3C_IPCLKPORT_I_PCLK			0x210c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_USI16_I3C_IPCLKPORT_I_SCLK			0x2110
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_USI17_I3C_IPCLKPORT_I_PCLK			0x2114
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_USI17_I3C_IPCLKPORT_I_SCLK			0x2118
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_XIU_P_PERIC1_IPCLKPORT_ACLK			0x211c
+
+static const unsigned long peric1_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_PERIC1_BUS_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC1_BUS_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC1_UART_BT_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC1_UART_BT_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC1_USI06_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC1_USI06_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC1_USI07_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC1_USI07_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC1_USI08_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC1_USI08_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC1_USI09_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC1_USI09_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC1_USI10_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC1_USI10_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC1_USI11_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC1_USI11_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC1_USI12_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC1_USI12_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC1_USI16_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC1_USI16_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC1_USI17_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC1_USI17_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC1_USI18_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC1_USI18_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC1_USI_I2C_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC1_USI_I2C_USER,
+	CLK_CON_DIV_DIV_CLK_PERIC1_UART_BT,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI06_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI07_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI08_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI09_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI10_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI11_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI12_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI16_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI17_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI18_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI_I2C,
+	CLK_CON_GAT_CLK_BLK_PERIC1_UID_PERIC1_CMU_PERIC1_IPCLKPORT_PCLK,
+	CLK_CON_GAT_CLK_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_UART_BT_IPCLKPORT_CLK,
+	CLK_CON_GAT_CLK_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI12_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_CLK_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI18_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_D_TZPC_PERIC1_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_GPIO_PERIC1_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_LHM_AXI_P_CSISPERIC1_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_LHM_AXI_P_PERIC1_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_10,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_11,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_12,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_13,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_14,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_15,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_4,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_10,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_11,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_12,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_13,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_14,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_15,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_4,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_0,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_1,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_10,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_12,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_13,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_14,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_15,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_2,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_3,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_4,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_5,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_6,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_7,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_9,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_0,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_1,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_10,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_12,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_13,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_14,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_15,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_2,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_3,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_4,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_5,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_6,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_7,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_9,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_BUSP_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_OSCCLK_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI06_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI07_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI08_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI09_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI10_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI11_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI16_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI17_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI_I2C_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_SYSREG_PERIC1_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_USI16_I3C_IPCLKPORT_I_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_USI16_I3C_IPCLKPORT_I_SCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_USI17_I3C_IPCLKPORT_I_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_USI17_I3C_IPCLKPORT_I_SCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_XIU_P_PERIC1_IPCLKPORT_ACLK,
+};
+
+/* Parent clock list for CMU_PERIC1 muxes */
+PNAME(mout_peric1_bus_user_p)  = { "oscclk", "dout_cmu_peric1_bus" };
+PNAME(mout_peric1_uart_bt_user_p) = { "oscclk", "dout_cmu_peric1_ip" };
+PNAME(mout_peric1_usi06_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
+PNAME(mout_peric1_usi07_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
+PNAME(mout_peric1_usi08_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
+PNAME(mout_peric1_usi09_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
+PNAME(mout_peric1_usi10_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
+PNAME(mout_peric1_usi11_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
+PNAME(mout_peric1_usi12_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
+PNAME(mout_peric1_usi18_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
+PNAME(mout_peric1_usi16_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
+PNAME(mout_peric1_usi17_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
+PNAME(mout_peric1_usi_i2c_user_p) = { "oscclk", "dout_cmu_peric1_ip" };
+
+static const struct samsung_mux_clock peric1_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIC1_BUS_USER, "mout_peric1_bus_user",
+	    mout_peric1_bus_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_BUS_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC1_UART_BT_USER, "mout_peric1_uart_bt_user",
+	    mout_peric1_uart_bt_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_UART_BT_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC1_USI06_USI_USER, "mout_peric1_usi06_usi_user",
+	    mout_peric1_usi06_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI06_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC1_USI07_USI_USER, "mout_peric1_usi07_usi_user",
+	    mout_peric1_usi07_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI07_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC1_USI08_USI_USER, "mout_peric1_usi08_usi_user",
+	    mout_peric1_usi08_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI08_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC1_USI09_USI_USER, "mout_peric1_usi09_usi_user",
+	    mout_peric1_usi09_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI09_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC1_USI10_USI_USER, "mout_peric1_usi10_usi_user",
+	    mout_peric1_usi10_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI10_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC1_USI11_USI_USER, "mout_peric1_usi11_usi_user",
+	    mout_peric1_usi11_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI11_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC1_USI12_USI_USER, "mout_peric1_usi12_usi_user",
+	    mout_peric1_usi12_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI12_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC1_USI18_USI_USER, "mout_peric1_usi18_usi_user",
+	    mout_peric1_usi18_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI18_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC1_USI16_USI_USER, "mout_peric1_usi16_usi_user",
+	    mout_peric1_usi16_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI16_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC1_USI17_USI_USER, "mout_peric1_usi17_usi_user",
+	    mout_peric1_usi17_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI17_USI_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIC1_USI_I2C_USER, "mout_peric1_usi_i2c_user",
+	    mout_peric1_usi_i2c_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI_I2C_USER,
+	    4, 1),
+};
+
+static const struct samsung_div_clock peric1_div_clks[] __initconst = {
+	DIV(CLK_DOUT_PERIC1_UART_BT, "dout_peric1_uart_bt",
+	    "mout_peric1_uart_bt_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC1_UART_BT,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI06_USI, "dout_peric1_usi06_usi",
+	    "mout_peric1_usi06_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC1_USI06_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI07_USI, "dout_peric1_usi07_usi",
+	    "mout_peric1_usi07_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC1_USI07_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI08_USI, "dout_peric1_usi08_usi",
+	    "mout_peric1_usi08_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC1_USI08_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI18_USI, "dout_peric1_usi18_usi",
+	    "mout_peric1_usi18_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC1_USI18_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI12_USI, "dout_peric1_usi12_usi",
+	    "mout_peric1_usi12_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC1_USI12_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI09_USI, "dout_peric1_usi09_usi",
+	    "mout_peric1_usi09_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC1_USI09_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI10_USI, "dout_peric1_usi10_usi",
+	    "mout_peric1_usi10_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC1_USI10_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI11_USI, "dout_peric1_usi11_usi",
+	    "mout_peric1_usi11_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC1_USI11_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI16_USI, "dout_peric1_usi16_usi",
+	    "mout_peric1_usi16_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC1_USI16_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI17_USI, "dout_peric1_usi17_usi",
+	    "mout_peric1_usi17_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC1_USI17_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI_I2C, "dout_peric1_usi_i2c",
+	    "mout_peric1_usi_i2c_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC1_USI_I2C,
+	    0, 4),
+};
+
+static const struct samsung_gate_clock peric1_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_PERIC1_CMU_PCLK, "gout_peric1_cmu_pclk",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_CLK_BLK_PERIC1_UID_PERIC1_CMU_PERIC1_IPCLKPORT_PCLK,
+	     21, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIC1_UART_BT_CLK, "gout_peric1_uart_bt_clk",
+	     "dout_peric1_uart_bt",
+	     CLK_CON_GAT_CLK_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_UART_BT_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_USI12_USI_CLK, "gout_peric1_usi12_usi_clk",
+	     "dout_peric1_usi12_usi",
+	     CLK_CON_GAT_CLK_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI12_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_USI18_USI_CLK, "gout_peric1_usi18_usi_clk",
+	     "dout_peric1_usi18_usi",
+	     CLK_CON_GAT_CLK_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI18_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_D_TZPC_PCLK, "gout_peric1_d_tzpc_pclk",
+	     "dout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_D_TZPC_PERIC1_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_GPIO_PCLK, "gout_peric1_gpio_pclk",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_GPIO_PERIC1_IPCLKPORT_PCLK,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_PERIC1_LHM_AXI_P_CSIS_CLK, "gout_peric1_lhm_axi_p_csis_clk",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_LHM_AXI_P_CSISPERIC1_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_LHM_AXI_P_CLK, "gout_peric1_lhm_axi_p_clk",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_LHM_AXI_P_PERIC1_IPCLKPORT_I_CLK,
+	     21, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIC1_TOP0_IPCLK_10, "gout_peric1_top0_ipclk_10",
+	     "dout_peric1_usi06_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_10,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP0_IPCLK_11, "gout_peric1_top0_ipclk_11",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_11,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP0_IPCLK_12, "gout_peric1_top0_ipclk_12",
+	     "dout_peric1_usi07_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_12,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP0_IPCLK_13, "gout_peric1_top0_ipclk_13",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_13,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP0_IPCLK_14, "gout_peric1_top0_ipclk_14",
+	     "dout_peric1_usi08_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_14,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP0_IPCLK_15, "gout_peric1_top0_ipclk_15",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_15,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP0_IPCLK_4, "gout_peric1_top0_ipclk_4",
+	     "dout_peric1_uart_bt",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_4,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP0_PCLK_10, "gout_peric1_top0_pclk_10",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_10,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP0_PCLK_11, "gout_peric1_top0_pclk_11",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_11,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP0_PCLK_12, "gout_peric1_top0_pclk_12",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_12,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP0_PCLK_13, "gout_peric1_top0_pclk_13",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_13,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP0_PCLK_14, "gout_peric1_top0_pclk_14",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_14,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP0_PCLK_15, "gout_peric1_top0_pclk_15",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_15,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP0_PCLK_4, "gout_peric1_top0_pclk_4",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_4,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_IPCLK_0, "gout_peric1_top1_ipclk_0",
+	     "dout_peric1_usi09_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_0,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_IPCLK_1, "gout_peric1_top1_ipclk_1",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_1,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_IPCLK_10, "gout_peric1_top1_ipclk_10",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_10,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_IPCLK_12, "gout_peric1_top1_ipclk_12",
+	     "dout_peric1_usi12_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_12,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_IPCLK_13, "gout_peric1_top1_ipclk_13",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_13,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_IPCLK_14, "gout_peric1_top1_ipclk_14",
+	     "dout_peric1_usi18_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_14,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_IPCLK_15, "gout_peric1_top1_ipclk_15",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_15,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_IPCLK_2, "gout_peric1_top1_ipclk_2",
+	     "dout_peric1_usi10_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_IPCLK_3, "gout_peric1_top1_ipclk_3",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_3,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_IPCLK_4, "gout_peric1_top1_ipclk_4",
+	     "dout_peric1_usi11_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_4,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_IPCLK_5, "gout_peric1_top1_ipclk_5",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_5,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_IPCLK_6, "gout_peric1_top1_ipclk_6",
+	     "dout_peric1_usi16_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_6,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_IPCLK_7, "gout_peric1_top1_ipclk_7",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_7,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_IPCLK_9, "gout_peric1_top1_ipclk_9",
+	     "dout_peric1_usi17_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_IPCLK_9,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_PCLK_0, "gout_peric1_top1_pclk_0",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_0,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_PCLK_1, "gout_peric1_top1_pclk_1",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_1,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_PCLK_10, "gout_peric1_top1_pclk_10",
+	     "dout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_10,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_PCLK_12, "gout_peric1_top1_pclk_12",
+	     "dout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_12,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_PCLK_13, "gout_peric1_top1_pclk_13",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_13,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_PCLK_14, "gout_peric1_top1_pclk_14",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_14,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_PCLK_15, "gout_peric1_top1_pclk_15",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_15,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_PCLK_2, "gout_peric1_top1_pclk_2",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_PCLK_3, "gout_peric1_top1_pclk_3",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_3,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_PCLK_4, "gout_peric1_top1_pclk_4",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_4,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_PCLK_5, "gout_peric1_top1_pclk_5",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_5,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_PCLK_6, "gout_peric1_top1_pclk_6",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_6,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_PCLK_7, "gout_peric1_top1_pclk_7",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_7,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_TOP1_PCLK_9, "gout_peric1_top1_pclk_9",
+	     "dout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP1_IPCLKPORT_PCLK_9,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_BUSP_CLK, "gout_peric1_busp_clk",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_BUSP_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_OSCCLK_CLK, "gout_peric1_oscclk_clk",
+	     "oscclk",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_OSCCLK_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_USI06_USI_CLK, "gout_peric1_usi06_usi_clk",
+	     "dout_peric1_usi06_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI06_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_USI07_USI_CLK, "gout_peric1_usi07_usi_clk",
+	     "dout_peric1_usi07_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI07_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_USI08_USI_CLK, "gout_peric1_usi08_usi_clk",
+	     "dout_peric1_usi08_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI08_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_USI09_USI_CLK, "gout_peric1_usi09_usi_clk",
+	     "dout_peric1_usi09_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI09_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_USI10_USI_CLK, "gout_peric1_usi10_usi_clk",
+	     "dout_peric1_usi10_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI10_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_USI11_USI_CLK, "gout_peric1_usi11_usi_clk",
+	     "dout_peric1_usi11_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI11_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_USI16_USI_CLK, "gout_peric1_usi16_usi_clk",
+	     "dout_peric1_usi16_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI16_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_USI17_USI_CLK, "gout_peric1_usi17_usi_clk",
+	     "dout_peric1_usi17_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI17_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_USI_I2C_CLK, "gout_peric1_usi_i2c_clk",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_RSTNSYNC_CLK_PERIC1_USI_I2C_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_SYSREG_PCLK, "gout_peric1_sysreg_pclk",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_SYSREG_PERIC1_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_USI16_I3C_PCLK, "gout_peric1_usi16_i3c_pclk",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_USI16_I3C_IPCLKPORT_I_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_USI16_I3C_SCLK, "gout_peric1_usi16_i3c_sclk",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_USI16_I3C_IPCLKPORT_I_SCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_USI17_I3C_PCLK, "gout_peric1_usi17_i3c_pclk",
+	     "dout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_USI17_I3C_IPCLKPORT_I_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_USI17_I3C_SCLK, "gout_peric1_usi17_i3c_sclk",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_USI17_I3C_IPCLKPORT_I_SCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_XIU_P_ACLK, "gout_peric1_xiu_p_aclk",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_XIU_P_PERIC1_IPCLKPORT_ACLK,
+	     21, CLK_IGNORE_UNUSED, 0),
+};
+
+static const struct samsung_cmu_info peric1_cmu_info __initconst = {
+	.mux_clks	= peric1_mux_clks,
+	.nr_mux_clks	= ARRAY_SIZE(peric1_mux_clks),
+	.div_clks	= peric1_div_clks,
+	.nr_div_clks	= ARRAY_SIZE(peric1_div_clks),
+	.gate_clks	= peric1_gate_clks,
+	.nr_gate_clks	= ARRAY_SIZE(peric1_gate_clks),
+	.nr_clk_ids	= CLKS_NR_PERIC1,
+	.clk_regs	= peric1_clk_regs,
+	.nr_clk_regs	= ARRAY_SIZE(peric1_clk_regs),
+	.clk_name	= "bus",
+};
+
 /* ---- CMU_PERIS ----------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_PERIS (0x10020000) */
@@ -1544,6 +2690,12 @@ static const struct of_device_id exynos990_cmu_of_match[] = {
 	{
 		.compatible = "samsung,exynos990-cmu-hsi0",
 		.data = &hsi0_cmu_info,
+	}, {
+		.compatible = "samsung,exynos990-cmu-peric0",
+		.data = &peric0_cmu_info,
+	}, {
+		.compatible = "samsung,exynos990-cmu-peric1",
+		.data = &peric1_cmu_info,
 	},
 	{ },
 };

-- 
2.50.1


