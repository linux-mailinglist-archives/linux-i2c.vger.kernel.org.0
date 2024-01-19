Return-Path: <linux-i2c+bounces-1381-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F2F832882
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 12:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A4A3287856
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 11:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7C24CB52;
	Fri, 19 Jan 2024 11:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HywNT2xG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E4F4CB50
	for <linux-i2c@vger.kernel.org>; Fri, 19 Jan 2024 11:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705662715; cv=none; b=DUVHrJZemJkjQ1osxBNmcMUYje5sSz/SuHCRWwc6IgZsQMPuXWYHG41+9h1aiw+6XmKC3g1HxgRwNHrLrwkpLX55FW8rIIG0zqgnvm2rvN2Nyrxt0HDjRzmhnpu3CHNukRlDvK/jT6yNUxWJNnzC/ClpBAQbUg/tAfUCWMw5gGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705662715; c=relaxed/simple;
	bh=ui042f0WmAu1CcYDhAaMFfFskM7qu/aiOq1BgLVFAJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QdvN/3pT7TwixBkiufGP9YF0FuICgYEYak+D9p7j/LZkPvbd1c8ZDZuZdwnmr9ahQPFNu0G2kOK8UJ8k5yqggjrx0C23oFbGAeLLXqRpPG6FnWjcGMYwnW9qVVOEWL8uTcbRWbj+LSKmd9fjRI2WOX9R/fvOzPNhlX60Jcljv4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HywNT2xG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e5afc18f5so6846365e9.3
        for <linux-i2c@vger.kernel.org>; Fri, 19 Jan 2024 03:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705662710; x=1706267510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNwUybKWSt1VQzy7DcQTwcOaWKRFY9PuVnwe/OfWzP0=;
        b=HywNT2xG3IYxp/sIkoZPpxAU+2tfMfn0/dyYOxjvvvQtTzHcul/keLhRvnQKJ6RKw8
         13Z45FQeOrNf7Tkq0+SY+D0ZMPNUF//WMVXwPDXOSwEtrz+s16Ev1arskbfZCC0uPagY
         x9gjT0FAu0uieDmhWKN+bhoc14iK6AZUPSqdgKcf1Bz6QuOgv8VllWeYeV7HRh8WJWH1
         e30btgH4n2bxQWFeGssXE1j1nR2F2MvwtClp2A44KDKKxss5zv14iQlL+tXUgLL4wg5K
         o5iWiuQ4KyQza3yS7YfF0j0v15KgWcnPpDS5nRi5/y6LZesttyok9e6xqVOcT2wka2Jm
         ENuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705662710; x=1706267510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNwUybKWSt1VQzy7DcQTwcOaWKRFY9PuVnwe/OfWzP0=;
        b=VP4lSl4EKeBNF8n8zrvZsZAXevQ/TiMeqykRUYHdO5nJS0WnM0rdaZGmPFwAahHCil
         R5gw2KFh3thUKeAsCTw42+4jjwG93BWg5tAQrYskhbKZhfQFtFpyZH8B488jUitMh7Ub
         6rZG+BSD4SWx7NAbHNuCJJBK+lDZa3VPhvJkEvEvGuuBa2CzwXzQaHPasvzTQJ4Pwld9
         8XPhFtlM21Qg22iHP4sFMJupRh4QQF5t3olWuWtY97zmZXwZ3+sXFokY6YV4XnoMqDug
         LYuZqjqTttvu0MjUVlRX/4MZTplUZ4/NHLnqe+X0zUKDh2fDDwZoOcpCMCFWjX00YoS5
         ihdQ==
X-Gm-Message-State: AOJu0Yxi0tD8yI1d6EK88lt74i3YeCBRZMs+ZeNnheHw5t3H/zajtBCg
	rbxDm+qbcIRoMNscRKFKbXtO8+WIGoLKJzdC/qJQ67eXTMN0JonXi5H6fOXeO2w=
X-Google-Smtp-Source: AGHT+IFeNXmllm8uNGhke9PUPoX45dVduzB5R1Xs/zVFCEZ8tzeqmH4C8EbUtuqINlmGuPHbJ0pOPQ==
X-Received: by 2002:a05:600c:5124:b0:40e:9706:9a44 with SMTP id o36-20020a05600c512400b0040e97069a44mr694442wms.44.1705662710224;
        Fri, 19 Jan 2024 03:11:50 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d62ca000000b00337d4ce6ab4sm3341868wrv.20.2024.01.19.03.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:11:49 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 3/8] clk: samsung: gs101: add support for cmu_peric0
Date: Fri, 19 Jan 2024 11:11:27 +0000
Message-ID: <20240119111132.1290455-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CMU_PERIC0 is the clock management unit used for the peric0 block which
is used for USI and I3C. Add support for all cmu_peric0 clocks but
CLK_GOUT_PERIC0_IP (not enough info in the datasheet).

Few clocks are marked as critical because when either of them is
disabled, the system hangs even if their clock parents are enabled.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 583 ++++++++++++++++++++++++++++++++
 1 file changed, 583 insertions(+)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 782993951fff..d9ea559ca36e 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -20,6 +20,7 @@
 #define CLKS_NR_TOP	(CLK_GOUT_CMU_TPU_UART + 1)
 #define CLKS_NR_APM	(CLK_APM_PLL_DIV16_APM + 1)
 #define CLKS_NR_MISC	(CLK_GOUT_MISC_XIU_D_MISC_ACLK + 1)
+#define CLKS_NR_PERIC0	(CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
@@ -2478,6 +2479,585 @@ static const struct samsung_cmu_info misc_cmu_info __initconst = {
 	.clk_name		= "bus",
 };
 
+/* ---- CMU_PERIC0 ---------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIC0 (0x10800000) */
+#define PLL_CON0_MUX_CLKCMU_PERIC0_BUS_USER		0x0600
+#define PLL_CON1_MUX_CLKCMU_PERIC0_BUS_USER		0x0604
+#define PLL_CON0_MUX_CLKCMU_PERIC0_I3C_USER		0x0610
+#define PLL_CON1_MUX_CLKCMU_PERIC0_I3C_USER		0x0614
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI0_UART_USER	0x0620
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI0_UART_USER	0x0624
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI14_USI_USER	0x0640
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI14_USI_USER	0x0644
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI1_USI_USER	0x0650
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI1_USI_USER	0x0654
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI2_USI_USER	0x0660
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI2_USI_USER	0x0664
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI3_USI_USER	0x0670
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI3_USI_USER	0x0674
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI4_USI_USER	0x0680
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI4_USI_USER	0x0684
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI5_USI_USER	0x0690
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI5_USI_USER	0x0694
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI6_USI_USER	0x06a0
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI6_USI_USER	0x06a4
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI7_USI_USER	0x06b0
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI7_USI_USER	0x06b4
+#define PLL_CON0_MUX_CLKCMU_PERIC0_USI8_USI_USER	0x06c0
+#define PLL_CON1_MUX_CLKCMU_PERIC0_USI8_USI_USER	0x06c4
+#define PERIC0_CMU_PERIC0_CONTROLLER_OPTION		0x0800
+#define CLKOUT_CON_BLK_PERIC0_CMU_PERIC0_CLKOUT0	0x0810
+#define CLK_CON_DIV_DIV_CLK_PERIC0_I3C			0x1800
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI0_UART		0x1804
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI14_USI		0x180c
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI1_USI		0x1810
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI2_USI		0x1814
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI3_USI		0x1820
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI4_USI		0x1824
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI5_USI		0x1828
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI6_USI		0x182c
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI7_USI		0x1830
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI8_USI		0x1834
+#define CLK_CON_BUF_CLKBUF_PERIC0_IP			0x2000
+#define CLK_CON_GAT_CLK_BLK_PERIC0_UID_PERIC0_CMU_PERIC0_IPCLKPORT_PCLK			0x2004
+#define CLK_CON_GAT_CLK_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_OSCCLK_IPCLKPORT_CLK		0x2008
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_D_TZPC_PERIC0_IPCLKPORT_PCLK			0x200c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPC_PERIC0_IPCLKPORT_PCLK			0x2010
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPIO_PERIC0_IPCLKPORT_PCLK			0x2014
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_LHM_AXI_P_PERIC0_IPCLKPORT_I_CLK		0x2018
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_0			0x201c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_1			0x2020
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_10			0x2024
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_11			0x2028
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_12			0x202c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_13			0x2030
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_14			0x2034
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_15			0x2038
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_2			0x203c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_3			0x2040
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4			0x2044
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_5			0x2048
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_6			0x204c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7			0x2050
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_8			0x2054
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_9			0x2058
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_0			0x205c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1			0x2060
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_10			0x2064
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_11			0x2068
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_12			0x206c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_13			0x2070
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_14			0x2074
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_15			0x2078
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_2			0x207c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_3			0x2080
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_4			0x2084
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_5			0x2088
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_6			0x208c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7			0x2090
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_8			0x2094
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9			0x2098
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_0			0x209c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_2			0x20a4
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_0			0x20a8
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_2			0x20b0
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_BUSP_IPCLKPORT_CLK		0x20b4
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_I3C_IPCLKPORT_CLK		0x20b8
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI0_UART_IPCLKPORT_CLK	0x20bc
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI14_USI_IPCLKPORT_CLK	0x20c4
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI1_USI_IPCLKPORT_CLK	0x20c8
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI2_USI_IPCLKPORT_CLK	0x20cc
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI3_USI_IPCLKPORT_CLK	0x20d0
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI4_USI_IPCLKPORT_CLK	0x20d4
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI5_USI_IPCLKPORT_CLK	0x20d8
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI6_USI_IPCLKPORT_CLK	0x20dc
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI7_USI_IPCLKPORT_CLK	0x20e0
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI8_USI_IPCLKPORT_CLK	0x20e4
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_SYSREG_PERIC0_IPCLKPORT_PCLK			0x20e8
+#define DMYQCH_CON_PERIC0_TOP0_QCH_S1			0x3000
+#define DMYQCH_CON_PERIC0_TOP0_QCH_S2			0x3004
+#define DMYQCH_CON_PERIC0_TOP0_QCH_S3			0x3008
+#define DMYQCH_CON_PERIC0_TOP0_QCH_S4			0x300c
+#define DMYQCH_CON_PERIC0_TOP0_QCH_S5			0x3010
+#define DMYQCH_CON_PERIC0_TOP0_QCH_S6			0x3014
+#define DMYQCH_CON_PERIC0_TOP0_QCH_S7			0x3018
+#define DMYQCH_CON_PERIC0_TOP0_QCH_S8			0x301c
+#define PCH_CON_LHM_AXI_P_PERIC0_PCH			0x3020
+#define QCH_CON_D_TZPC_PERIC0_QCH			0x3024
+#define QCH_CON_GPC_PERIC0_QCH				0x3028
+#define QCH_CON_GPIO_PERIC0_QCH				0x302c
+#define QCH_CON_LHM_AXI_P_PERIC0_QCH			0x3030
+#define QCH_CON_PERIC0_CMU_PERIC0_QCH			0x3034
+#define QCH_CON_PERIC0_TOP0_QCH_I3C1			0x3038
+#define QCH_CON_PERIC0_TOP0_QCH_I3C2			0x303c
+#define QCH_CON_PERIC0_TOP0_QCH_I3C3			0x3040
+#define QCH_CON_PERIC0_TOP0_QCH_I3C4			0x3044
+#define QCH_CON_PERIC0_TOP0_QCH_I3C5			0x3048
+#define QCH_CON_PERIC0_TOP0_QCH_I3C6			0x304c
+#define QCH_CON_PERIC0_TOP0_QCH_I3C7			0x3050
+#define QCH_CON_PERIC0_TOP0_QCH_I3C8			0x3054
+#define QCH_CON_PERIC0_TOP0_QCH_USI1_USI		0x3058
+#define QCH_CON_PERIC0_TOP0_QCH_USI2_USI		0x305c
+#define QCH_CON_PERIC0_TOP0_QCH_USI3_USI		0x3060
+#define QCH_CON_PERIC0_TOP0_QCH_USI4_USI		0x3064
+#define QCH_CON_PERIC0_TOP0_QCH_USI5_USI		0x3068
+#define QCH_CON_PERIC0_TOP0_QCH_USI6_USI		0x306c
+#define QCH_CON_PERIC0_TOP0_QCH_USI7_USI		0x3070
+#define QCH_CON_PERIC0_TOP0_QCH_USI8_USI		0x3074
+#define QCH_CON_PERIC0_TOP1_QCH_USI0_UART		0x3078
+#define QCH_CON_PERIC0_TOP1_QCH_USI14_UART		0x307c
+#define QCH_CON_SYSREG_PERIC0_QCH			0x3080
+#define QUEUE_CTRL_REG_BLK_PERIC0_CMU_PERIC0		0x3c00
+
+static const unsigned long peric0_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_PERIC0_BUS_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_BUS_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_I3C_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_I3C_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI0_UART_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI0_UART_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI14_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI14_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI1_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI1_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI2_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI2_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI3_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI3_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI4_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI4_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI5_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI5_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI6_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI6_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI7_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI7_USI_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_USI8_USI_USER,
+	PLL_CON1_MUX_CLKCMU_PERIC0_USI8_USI_USER,
+	PERIC0_CMU_PERIC0_CONTROLLER_OPTION,
+	CLKOUT_CON_BLK_PERIC0_CMU_PERIC0_CLKOUT0,
+	CLK_CON_DIV_DIV_CLK_PERIC0_I3C,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI0_UART,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI14_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI1_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI2_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI3_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI4_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI5_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI6_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI6_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI8_USI,
+	CLK_CON_BUF_CLKBUF_PERIC0_IP,
+	CLK_CON_GAT_CLK_BLK_PERIC0_UID_PERIC0_CMU_PERIC0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_CLK_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_OSCCLK_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_D_TZPC_PERIC0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPC_PERIC0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPIO_PERIC0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_LHM_AXI_P_PERIC0_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_0,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_1,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_10,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_11,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_12,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_13,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_14,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_15,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_2,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_3,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_5,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_6,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_8,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_9,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_0,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_10,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_11,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_12,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_13,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_14,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_15,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_2,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_3,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_4,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_5,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_6,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_8,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_0,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_2,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_0,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_2,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_BUSP_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_I3C_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI0_UART_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI14_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI1_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI2_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI3_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI4_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI5_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI6_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI7_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI8_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_SYSREG_PERIC0_IPCLKPORT_PCLK,
+	DMYQCH_CON_PERIC0_TOP0_QCH_S1,
+	DMYQCH_CON_PERIC0_TOP0_QCH_S2,
+	DMYQCH_CON_PERIC0_TOP0_QCH_S3,
+	DMYQCH_CON_PERIC0_TOP0_QCH_S4,
+	DMYQCH_CON_PERIC0_TOP0_QCH_S5,
+	DMYQCH_CON_PERIC0_TOP0_QCH_S6,
+	DMYQCH_CON_PERIC0_TOP0_QCH_S7,
+	DMYQCH_CON_PERIC0_TOP0_QCH_S8,
+	PCH_CON_LHM_AXI_P_PERIC0_PCH,
+	QCH_CON_D_TZPC_PERIC0_QCH,
+	QCH_CON_GPC_PERIC0_QCH,
+	QCH_CON_GPIO_PERIC0_QCH,
+	QCH_CON_LHM_AXI_P_PERIC0_QCH,
+	QCH_CON_PERIC0_CMU_PERIC0_QCH,
+	QCH_CON_PERIC0_TOP0_QCH_I3C1,
+	QCH_CON_PERIC0_TOP0_QCH_I3C2,
+	QCH_CON_PERIC0_TOP0_QCH_I3C3,
+	QCH_CON_PERIC0_TOP0_QCH_I3C4,
+	QCH_CON_PERIC0_TOP0_QCH_I3C5,
+	QCH_CON_PERIC0_TOP0_QCH_I3C6,
+	QCH_CON_PERIC0_TOP0_QCH_I3C7,
+	QCH_CON_PERIC0_TOP0_QCH_I3C8,
+	QCH_CON_PERIC0_TOP0_QCH_USI1_USI,
+	QCH_CON_PERIC0_TOP0_QCH_USI2_USI,
+	QCH_CON_PERIC0_TOP0_QCH_USI3_USI,
+	QCH_CON_PERIC0_TOP0_QCH_USI4_USI,
+	QCH_CON_PERIC0_TOP0_QCH_USI5_USI,
+	QCH_CON_PERIC0_TOP0_QCH_USI6_USI,
+	QCH_CON_PERIC0_TOP0_QCH_USI7_USI,
+	QCH_CON_PERIC0_TOP0_QCH_USI8_USI,
+	QCH_CON_PERIC0_TOP1_QCH_USI0_UART,
+	QCH_CON_PERIC0_TOP1_QCH_USI14_UART,
+	QCH_CON_SYSREG_PERIC0_QCH,
+	QUEUE_CTRL_REG_BLK_PERIC0_CMU_PERIC0,
+};
+
+/* List of parent clocks for Muxes in CMU_PERIC0 */
+PNAME(mout_peric0_bus_user_p)		= { "oscclk", "dout_cmu_peric0_bus" };
+PNAME(mout_peric0_i3c_user_p)		= { "oscclk", "dout_cmu_peric0_ip" };
+PNAME(mout_peric0_usi0_uart_user_p)	= { "oscclk", "dout_cmu_peric0_ip" };
+PNAME(mout_peric0_usi_usi_user_p)	= { "oscclk", "dout_cmu_peric0_ip" };
+
+static const struct samsung_mux_clock peric0_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIC0_BUS_USER, "mout_peric0_bus_user",
+	    mout_peric0_bus_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_BUS_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC0_I3C_USER, "mout_peric0_i3c_user",
+	    mout_peric0_i3c_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_I3C_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC0_USI0_UART_USER,
+	    "mout_peric0_usi0_uart_user", mout_peric0_usi0_uart_user_p,
+	    PLL_CON0_MUX_CLKCMU_PERIC0_USI0_UART_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC0_USI14_USI_USER,
+	    "mout_peric0_usi14_usi_user", mout_peric0_usi_usi_user_p,
+	    PLL_CON0_MUX_CLKCMU_PERIC0_USI14_USI_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC0_USI1_USI_USER,
+	    "mout_peric0_usi1_usi_user", mout_peric0_usi_usi_user_p,
+	    PLL_CON0_MUX_CLKCMU_PERIC0_USI1_USI_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC0_USI2_USI_USER,
+	    "mout_peric0_usi2_usi_user", mout_peric0_usi_usi_user_p,
+	    PLL_CON0_MUX_CLKCMU_PERIC0_USI2_USI_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC0_USI3_USI_USER,
+	    "mout_peric0_usi3_usi_user", mout_peric0_usi_usi_user_p,
+	    PLL_CON0_MUX_CLKCMU_PERIC0_USI3_USI_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC0_USI4_USI_USER,
+	    "mout_peric0_usi4_usi_user", mout_peric0_usi_usi_user_p,
+	    PLL_CON0_MUX_CLKCMU_PERIC0_USI4_USI_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC0_USI5_USI_USER,
+	    "mout_peric0_usi5_usi_user", mout_peric0_usi_usi_user_p,
+	    PLL_CON0_MUX_CLKCMU_PERIC0_USI5_USI_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC0_USI6_USI_USER,
+	    "mout_peric0_usi6_usi_user", mout_peric0_usi_usi_user_p,
+	    PLL_CON0_MUX_CLKCMU_PERIC0_USI6_USI_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC0_USI7_USI_USER,
+	    "mout_peric0_usi7_usi_user", mout_peric0_usi_usi_user_p,
+	    PLL_CON0_MUX_CLKCMU_PERIC0_USI7_USI_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC0_USI8_USI_USER,
+	    "mout_peric0_usi8_usi_user", mout_peric0_usi_usi_user_p,
+	    PLL_CON0_MUX_CLKCMU_PERIC0_USI8_USI_USER, 4, 1),
+};
+
+static const struct samsung_div_clock peric0_div_clks[] __initconst = {
+	DIV(CLK_DOUT_PERIC0_I3C, "dout_peric0_i3c", "mout_peric0_i3c_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_I3C, 0, 4),
+	DIV(CLK_DOUT_PERIC0_USI0_UART,
+	    "dout_peric0_usi0_uart", "mout_peric0_usi0_uart_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI0_UART, 0, 4),
+	DIV(CLK_DOUT_PERIC0_USI14_USI,
+	    "dout_peric0_usi14_usi", "mout_peric0_usi14_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI14_USI, 0, 4),
+	DIV(CLK_DOUT_PERIC0_USI1_USI,
+	    "dout_peric0_usi1_usi", "mout_peric0_usi1_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI1_USI, 0, 4),
+	DIV(CLK_DOUT_PERIC0_USI2_USI,
+	    "dout_peric0_usi2_usi", "mout_peric0_usi2_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI2_USI, 0, 4),
+	DIV(CLK_DOUT_PERIC0_USI3_USI,
+	    "dout_peric0_usi3_usi", "mout_peric0_usi3_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI3_USI, 0, 4),
+	DIV(CLK_DOUT_PERIC0_USI4_USI,
+	    "dout_peric0_usi4_usi", "mout_peric0_usi4_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI4_USI, 0, 4),
+	DIV(CLK_DOUT_PERIC0_USI5_USI,
+	    "dout_peric0_usi5_usi", "mout_peric0_usi5_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI5_USI, 0, 4),
+	DIV(CLK_DOUT_PERIC0_USI6_USI,
+	    "dout_peric0_usi6_usi", "mout_peric0_usi6_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI6_USI, 0, 4),
+	DIV(CLK_DOUT_PERIC0_USI7_USI,
+	    "dout_peric0_usi7_usi", "mout_peric0_usi7_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI7_USI, 0, 4),
+	DIV(CLK_DOUT_PERIC0_USI8_USI,
+	    "dout_peric0_usi8_usi", "mout_peric0_usi8_usi_user",
+	    CLK_CON_DIV_DIV_CLK_PERIC0_USI8_USI, 0, 4),
+};
+
+static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
+	/* Disabling this clock makes the system hang. Mark the clock as critical. */
+	GATE(CLK_GOUT_PERIC0_PERIC0_CMU_PERIC0_PCLK,
+	     "gout_peric0_peric0_cmu_peric0_pclk", "mout_peric0_bus_user",
+	     CLK_CON_GAT_CLK_BLK_PERIC0_UID_PERIC0_CMU_PERIC0_IPCLKPORT_PCLK,
+	     21, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIC0_CLK_PERIC0_OSCCLK_CLK,
+	     "gout_peric0_clk_peric0_oscclk_clk", "oscclk",
+	     CLK_CON_GAT_CLK_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_OSCCLK_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_D_TZPC_PERIC0_PCLK,
+	     "gout_peric0_d_tzpc_peric0_pclk", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_D_TZPC_PERIC0_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_GPC_PERIC0_PCLK,
+	     "gout_peric0_gpc_peric0_pclk", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPC_PERIC0_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_GPIO_PERIC0_PCLK,
+	     "gout_peric0_gpio_peric0_pclk", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPIO_PERIC0_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	/* Disabling this clock makes the system hang. Mark the clock as critical. */
+	GATE(CLK_GOUT_PERIC0_LHM_AXI_P_PERIC0_I_CLK,
+	     "gout_peric0_lhm_axi_p_peric0_i_clk", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_LHM_AXI_P_PERIC0_IPCLKPORT_I_CLK,
+	     21, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_0,
+	     "gout_peric0_peric0_top0_ipclk_0", "dout_peric0_usi1_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_0,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_1,
+	     "gout_peric0_peric0_top0_ipclk_1", "dout_peric0_usi2_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_1,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_10,
+	     "gout_peric0_peric0_top0_ipclk_10", "dout_peric0_i3c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_10,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_11,
+	     "gout_peric0_peric0_top0_ipclk_11", "dout_peric0_i3c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_11,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_12,
+	     "gout_peric0_peric0_top0_ipclk_12", "dout_peric0_i3c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_12,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_13,
+	     "gout_peric0_peric0_top0_ipclk_13", "dout_peric0_i3c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_13,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_14,
+	     "gout_peric0_peric0_top0_ipclk_14", "dout_peric0_i3c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_14,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_15,
+	     "gout_peric0_peric0_top0_ipclk_15", "dout_peric0_i3c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_15,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_2,
+	     "gout_peric0_peric0_top0_ipclk_2", "dout_peric0_usi3_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_3,
+	     "gout_peric0_peric0_top0_ipclk_3", "dout_peric0_usi4_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_3,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_4,
+	     "gout_peric0_peric0_top0_ipclk_4", "dout_peric0_usi5_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_5,
+	     "gout_peric0_peric0_top0_ipclk_5", "dout_peric0_usi6_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_5,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_6,
+	     "gout_peric0_peric0_top0_ipclk_6", "dout_peric0_usi7_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_6,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7,
+	     "gout_peric0_peric0_top0_ipclk_7", "dout_peric0_usi8_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_8,
+	     "gout_peric0_peric0_top0_ipclk_8", "dout_peric0_i3c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_8,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_9,
+	     "gout_peric0_peric0_top0_ipclk_9", "dout_peric0_i3c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_9,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_0,
+	     "gout_peric0_peric0_top0_pclk_0", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_0,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_1,
+	     "gout_peric0_peric0_top0_pclk_1", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_10,
+	     "gout_peric0_peric0_top0_pclk_10", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_10,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_11,
+	     "gout_peric0_peric0_top0_pclk_11", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_11,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_12,
+	     "gout_peric0_peric0_top0_pclk_12", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_12,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_13,
+	     "gout_peric0_peric0_top0_pclk_13", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_13,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_14,
+	     "gout_peric0_peric0_top0_pclk_14", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_14,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_15,
+	     "gout_peric0_peric0_top0_pclk_15", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_15,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_2,
+	     "gout_peric0_peric0_top0_pclk_2", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_3,
+	     "gout_peric0_peric0_top0_pclk_3", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_3,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_4,
+	     "gout_peric0_peric0_top0_pclk_4", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_4,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_5,
+	     "gout_peric0_peric0_top0_pclk_5", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_5,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_6,
+	     "gout_peric0_peric0_top0_pclk_6", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_6,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_7,
+	     "gout_peric0_peric0_top0_pclk_7", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_8,
+	     "gout_peric0_peric0_top0_pclk_8", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_8,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_9,
+	     "gout_peric0_peric0_top0_pclk_9", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9,
+	     21, 0, 0),
+	/* Disabling this clock makes the system hang. Mark the clock as critical. */
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0,
+	     "gout_peric0_peric0_top1_ipclk_0", "dout_peric0_usi0_uart",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_0,
+	     21, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_2,
+	     "gout_peric0_peric0_top1_ipclk_2", "dout_peric0_usi14_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_2,
+	     21, 0, 0),
+	/* Disabling this clock makes the system hang. Mark the clock as critical. */
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_0,
+	     "gout_peric0_peric0_top1_pclk_0", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_0,
+	     21, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_2,
+	     "gout_peric0_peric0_top1_pclk_2", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_CLK_PERIC0_BUSP_CLK,
+	     "gout_peric0_clk_peric0_busp_clk", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_BUSP_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_CLK_PERIC0_I3C_CLK,
+	     "gout_peric0_clk_peric0_i3c_clk", "dout_peric0_i3c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_I3C_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI0_UART_CLK,
+	     "gout_peric0_clk_peric0_usi0_uart_clk", "dout_peric0_usi0_uart",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI0_UART_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI14_USI_CLK,
+	     "gout_peric0_clk_peric0_usi14_usi_clk", "dout_peric0_usi14_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI14_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI1_USI_CLK,
+	     "gout_peric0_clk_peric0_usi1_usi_clk", "dout_peric0_usi1_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI1_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI2_USI_CLK,
+	     "gout_peric0_clk_peric0_usi2_usi_clk", "dout_peric0_usi2_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI2_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI3_USI_CLK,
+	     "gout_peric0_clk_peric0_usi3_usi_clk", "dout_peric0_usi3_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI3_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI4_USI_CLK,
+	     "gout_peric0_clk_peric0_usi4_usi_clk", "dout_peric0_usi4_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI4_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI5_USI_CLK,
+	     "gout_peric0_clk_peric0_usi5_usi_clk", "dout_peric0_usi5_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI5_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI6_USI_CLK,
+	     "gout_peric0_clk_peric0_usi6_usi_clk", "dout_peric0_usi6_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI6_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI7_USI_CLK,
+	     "gout_peric0_clk_peric0_usi7_usi_clk", "dout_peric0_usi7_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI7_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK,
+	     "gout_peric0_clk_peric0_usi8_usi_clk", "dout_peric0_usi8_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI8_USI_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK,
+	     "gout_peric0_sysreg_peric0_pclk", "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_SYSREG_PERIC0_IPCLKPORT_PCLK,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info peric0_cmu_info __initconst = {
+	.mux_clks		= peric0_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(peric0_mux_clks),
+	.div_clks		= peric0_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(peric0_div_clks),
+	.gate_clks		= peric0_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(peric0_gate_clks),
+	.nr_clk_ids		= CLKS_NR_PERIC0,
+	.clk_regs		= peric0_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(peric0_clk_regs),
+	.clk_name		= "bus",
+};
+
 /* ---- platform_driver ----------------------------------------------------- */
 
 static int __init gs101_cmu_probe(struct platform_device *pdev)
@@ -2498,6 +3078,9 @@ static const struct of_device_id gs101_cmu_of_match[] = {
 	}, {
 		.compatible = "google,gs101-cmu-misc",
 		.data = &misc_cmu_info,
+	}, {
+		.compatible = "google,gs101-cmu-peric0",
+		.data = &peric0_cmu_info,
 	}, {
 	},
 };
-- 
2.43.0.429.g432eaa2c6b-goog


