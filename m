Return-Path: <linux-i2c+bounces-773-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4537812D77
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 11:53:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32B8DB21322
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 10:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F363D994;
	Thu, 14 Dec 2023 10:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UA/gFqUJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D087311A
	for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 02:52:53 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40c2308faedso81894935e9.1
        for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 02:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702551172; x=1703155972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtlDodxEq1R7xEjsu1E614pehgxBf0UDZpVHgmExdRA=;
        b=UA/gFqUJ+vAoMvJyWJwE1YbNacnrRBaY009dXaxbGcrgWa7mTVG9cd157yhQlZbBHo
         Ieaz2qQvT0BAJ6r5NHMO1+fdG0Qtwbfgwg7gNdkfGwEQpmMYUs1ntg6waOcvrVdmhrnT
         FfRcLJ9amNsfE4yKSPrvvcPs9XwOiQNGnRlx3/Sw/pDrw+CWYAVjmeCSe7cNJ6CZgnSo
         yYSXBsS2UaGXUXiwU0nvjYxrzilEdNYozbrg9nIzKrkIzOMBUgiE97uPoWaoF3b3YQDE
         91RpmrUAld0gkRbT/hev8niYQjjn8vFikX1WyaJbm37B3hebpefA7eS7PBh9mxYsMijp
         4cTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702551172; x=1703155972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtlDodxEq1R7xEjsu1E614pehgxBf0UDZpVHgmExdRA=;
        b=doXfeVc2De4aQvEiof0Mi3RjRCAcx6V6tHPcIJD+l9MwqGpUCXF2njaPMa5Ugm8459
         Xgu864U1LCv8lzWzROuHnyw98svIKM9NM3lZS1Jwmiv0PFV7XImz+cZSFDvYJgGpndRb
         Z8+pEwaO1MmsE0D/ZB5LOpiLS6k4oY5n8q8WKq5BHWCgXFQQFj9DfLTj7EfL7X/L8jjZ
         in+uyxQ/gnk0oDkpDLaUtVc6M5v3mWlImzYy/USNjrmOBic9ZRVHFNQA6ZLYHuu4enDi
         6EFl4N+8fdViQAKcHWNgL2tQWyum3iu5uizfnqprOQUaiYS6w6NnHyVBkeen9mrCt9x8
         BGHQ==
X-Gm-Message-State: AOJu0YzTllGQ//TtsRoNa2otvG6Jl7LmL/+6GSJ5R/AWkaZX8lbhz4Pz
	u0KvsTRkkXEcPQLPl0lzBhqDrA==
X-Google-Smtp-Source: AGHT+IGxIqIkofPLjCXacb38RhQOyOkWMQO3BASHDeIywHbnnJF908ruABa0X114kArFtMKcDQxzEA==
X-Received: by 2002:a05:600c:2804:b0:40c:3eab:d987 with SMTP id m4-20020a05600c280400b0040c3eabd987mr4515355wmb.125.1702551172243;
        Thu, 14 Dec 2023 02:52:52 -0800 (PST)
Received: from ta2.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c468700b0040c420eda48sm17614854wmo.22.2023.12.14.02.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:52:51 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	arnd@arndb.de,
	semen.protsenko@linaro.org
Cc: andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 01/13] dt-bindings: clock: google,gs101: fix CMU_TOP gate clock names
Date: Thu, 14 Dec 2023 10:52:31 +0000
Message-ID: <20231214105243.3707730-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gs101 clock names are derived from the clock register names under
some certain rules. In particular, for the gate clocks the following is
documented and expected in the gs101 clock driver:

  Replace CLK_CON_GAT_CLKCMU      with CLK_GOUT_CMU and gout_cmu
  Replace CLK_CON_GAT_GATE_CLKCMU with CLK_GOUT_CMU and gout_cmu

  For gates remove _UID _BLK _IPCLKPORT and _RSTNSYNC

The CMU TOP gate clock names missed to include the required "CMU"
differentiator which will cause name collisions with the gate clock names
of other clock units. Fix the TOP gate clock names and include "CMU" in
their name.

Fixes: 0a910f160638 ("dt-bindings: clock: Add Google gs101 clock management unit bindings")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c          | 167 ++++++++++++-----------
 include/dt-bindings/clock/google,gs101.h | 144 +++++++++----------
 2 files changed, 159 insertions(+), 152 deletions(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index a3dda97f5eb9..0964bb11657f 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -17,7 +17,7 @@
 #include "clk-exynos-arm64.h"
 
 /* NOTE: Must be equal to the last clock ID increased by one */
-#define CLKS_NR_TOP	(CLK_GOUT_TPU_UART + 1)
+#define CLKS_NR_TOP	(CLK_GOUT_CMU_TPU_UART + 1)
 #define CLKS_NR_APM	(CLK_APM_PLL_DIV16_APM + 1)
 #define CLKS_NR_MISC	(CLK_GOUT_MISC_XIU_D_MISC_ACLK + 1)
 
@@ -1259,160 +1259,167 @@ static const struct samsung_fixed_factor_clock cmu_top_ffactor[] __initconst = {
 };
 
 static const struct samsung_gate_clock cmu_top_gate_clks[] __initconst = {
-	GATE(CLK_GOUT_BUS0_BOOST, "gout_cmu_bus0_boost",
+	GATE(CLK_GOUT_CMU_BUS0_BOOST, "gout_cmu_bus0_boost",
 	     "mout_cmu_boost_option1", CLK_CON_GAT_CLKCMU_BUS0_BOOST, 21, 0, 0),
-	GATE(CLK_GOUT_BUS1_BOOST, "gout_cmu_bus1_boost",
+	GATE(CLK_GOUT_CMU_BUS1_BOOST, "gout_cmu_bus1_boost",
 	     "mout_cmu_boost_option1", CLK_CON_GAT_CLKCMU_BUS1_BOOST, 21, 0, 0),
-	GATE(CLK_GOUT_BUS2_BOOST, "gout_cmu_bus2_boost",
+	GATE(CLK_GOUT_CMU_BUS2_BOOST, "gout_cmu_bus2_boost",
 	     "mout_cmu_boost_option1", CLK_CON_GAT_CLKCMU_BUS2_BOOST, 21, 0, 0),
-	GATE(CLK_GOUT_CORE_BOOST, "gout_cmu_core_boost",
+	GATE(CLK_GOUT_CMU_CORE_BOOST, "gout_cmu_core_boost",
 	     "mout_cmu_boost_option1", CLK_CON_GAT_CLKCMU_CORE_BOOST, 21, 0, 0),
-	GATE(CLK_GOUT_CPUCL0_BOOST, "gout_cmu_cpucl0_boost",
+	GATE(CLK_GOUT_CMU_CPUCL0_BOOST, "gout_cmu_cpucl0_boost",
 	     "mout_cmu_boost_option1", CLK_CON_GAT_CLKCMU_CPUCL0_BOOST,
 	     21, 0, 0),
-	GATE(CLK_GOUT_CPUCL1_BOOST, "gout_cmu_cpucl1_boost",
+	GATE(CLK_GOUT_CMU_CPUCL1_BOOST, "gout_cmu_cpucl1_boost",
 	     "mout_cmu_boost_option1", CLK_CON_GAT_CLKCMU_CPUCL1_BOOST,
 	     21, 0, 0),
-	GATE(CLK_GOUT_CPUCL2_BOOST, "gout_cmu_cpucl2_boost",
+	GATE(CLK_GOUT_CMU_CPUCL2_BOOST, "gout_cmu_cpucl2_boost",
 	     "mout_cmu_boost_option1", CLK_CON_GAT_CLKCMU_CPUCL2_BOOST,
 	     21, 0, 0),
-	GATE(CLK_GOUT_MIF_BOOST, "gout_cmu_mif_boost",
+	GATE(CLK_GOUT_CMU_MIF_BOOST, "gout_cmu_mif_boost",
 	     "mout_cmu_boost_option1", CLK_CON_GAT_CLKCMU_MIF_BOOST,
 	     21, 0, 0),
-	GATE(CLK_GOUT_MIF_SWITCH, "gout_cmu_mif_switch", "mout_cmu_mif_switch",
-	     CLK_CON_GAT_CLKCMU_MIF_SWITCH, 21, 0, 0),
-	GATE(CLK_GOUT_BO_BUS, "gout_cmu_bo_bus", "mout_cmu_bo_bus",
+	GATE(CLK_GOUT_CMU_MIF_SWITCH, "gout_cmu_mif_switch",
+	     "mout_cmu_mif_switch", CLK_CON_GAT_CLKCMU_MIF_SWITCH, 21, 0, 0),
+	GATE(CLK_GOUT_CMU_BO_BUS, "gout_cmu_bo_bus", "mout_cmu_bo_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_BO_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_BUS0_BUS, "gout_cmu_bus0_bus", "mout_cmu_bus0_bus",
+	GATE(CLK_GOUT_CMU_BUS0_BUS, "gout_cmu_bus0_bus", "mout_cmu_bus0_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_BUS0_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_BUS1_BUS, "gout_cmu_bus1_bus", "mout_cmu_bus1_bus",
+	GATE(CLK_GOUT_CMU_BUS1_BUS, "gout_cmu_bus1_bus", "mout_cmu_bus1_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_BUS1_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_BUS2_BUS, "gout_cmu_bus2_bus", "mout_cmu_bus2_bus",
+	GATE(CLK_GOUT_CMU_BUS2_BUS, "gout_cmu_bus2_bus", "mout_cmu_bus2_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_BUS2_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_CIS_CLK0, "gout_cmu_cis_clk0", "mout_cmu_cis_clk0",
+	GATE(CLK_GOUT_CMU_CIS_CLK0, "gout_cmu_cis_clk0", "mout_cmu_cis_clk0",
 	     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK0, 21, 0, 0),
-	GATE(CLK_GOUT_CIS_CLK1, "gout_cmu_cis_clk1", "mout_cmu_cis_clk1",
+	GATE(CLK_GOUT_CMU_CIS_CLK1, "gout_cmu_cis_clk1", "mout_cmu_cis_clk1",
 	     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK1, 21, 0, 0),
-	GATE(CLK_GOUT_CIS_CLK2, "gout_cmu_cis_clk2", "mout_cmu_cis_clk2",
+	GATE(CLK_GOUT_CMU_CIS_CLK2, "gout_cmu_cis_clk2", "mout_cmu_cis_clk2",
 	     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK2, 21, 0, 0),
-	GATE(CLK_GOUT_CIS_CLK3, "gout_cmu_cis_clk3", "mout_cmu_cis_clk3",
+	GATE(CLK_GOUT_CMU_CIS_CLK3, "gout_cmu_cis_clk3", "mout_cmu_cis_clk3",
 	     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK3, 21, 0, 0),
-	GATE(CLK_GOUT_CIS_CLK4, "gout_cmu_cis_clk4", "mout_cmu_cis_clk4",
+	GATE(CLK_GOUT_CMU_CIS_CLK4, "gout_cmu_cis_clk4", "mout_cmu_cis_clk4",
 	     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK4, 21, 0, 0),
-	GATE(CLK_GOUT_CIS_CLK5, "gout_cmu_cis_clk5", "mout_cmu_cis_clk5",
+	GATE(CLK_GOUT_CMU_CIS_CLK5, "gout_cmu_cis_clk5", "mout_cmu_cis_clk5",
 	     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK5, 21, 0, 0),
-	GATE(CLK_GOUT_CIS_CLK6, "gout_cmu_cis_clk6", "mout_cmu_cis_clk6",
+	GATE(CLK_GOUT_CMU_CIS_CLK6, "gout_cmu_cis_clk6", "mout_cmu_cis_clk6",
 	     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK6, 21, 0, 0),
-	GATE(CLK_GOUT_CIS_CLK7, "gout_cmu_cis_clk7", "mout_cmu_cis_clk7",
+	GATE(CLK_GOUT_CMU_CIS_CLK7, "gout_cmu_cis_clk7", "mout_cmu_cis_clk7",
 	     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK7, 21, 0, 0),
-	GATE(CLK_GOUT_CMU_BOOST, "gout_cmu_cmu_boost", "mout_cmu_cmu_boost",
+	GATE(CLK_GOUT_CMU_CMU_BOOST, "gout_cmu_cmu_boost", "mout_cmu_cmu_boost",
 	     CLK_CON_GAT_GATE_CLKCMU_CMU_BOOST, 21, 0, 0),
-	GATE(CLK_GOUT_CORE_BUS, "gout_cmu_core_bus", "mout_cmu_core_bus",
+	GATE(CLK_GOUT_CMU_CORE_BUS, "gout_cmu_core_bus", "mout_cmu_core_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_CORE_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_CPUCL0_DBG, "gout_cmu_cpucl0_dbg", "mout_cmu_cpucl0_dbg",
-	     CLK_CON_GAT_GATE_CLKCMU_CPUCL0_DBG_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_CPUCL0_SWITCH, "gout_cmu_cpucl0_switch",
+	GATE(CLK_GOUT_CMU_CPUCL0_DBG, "gout_cmu_cpucl0_dbg",
+	     "mout_cmu_cpucl0_dbg", CLK_CON_GAT_GATE_CLKCMU_CPUCL0_DBG_BUS,
+	     21, 0, 0),
+	GATE(CLK_GOUT_CMU_CPUCL0_SWITCH, "gout_cmu_cpucl0_switch",
 	     "mout_cmu_cpucl0_switch", CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWITCH,
 	     21, 0, 0),
-	GATE(CLK_GOUT_CPUCL1_SWITCH, "gout_cmu_cpucl1_switch",
+	GATE(CLK_GOUT_CMU_CPUCL1_SWITCH, "gout_cmu_cpucl1_switch",
 	     "mout_cmu_cpucl1_switch", CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWITCH,
 	     21, 0, 0),
-	GATE(CLK_GOUT_CPUCL2_SWITCH, "gout_cmu_cpucl2_switch",
+	GATE(CLK_GOUT_CMU_CPUCL2_SWITCH, "gout_cmu_cpucl2_switch",
 	     "mout_cmu_cpucl2_switch", CLK_CON_GAT_GATE_CLKCMU_CPUCL2_SWITCH,
 	     21, 0, 0),
-	GATE(CLK_GOUT_CSIS_BUS, "gout_cmu_csis_bus", "mout_cmu_csis_bus",
+	GATE(CLK_GOUT_CMU_CSIS_BUS, "gout_cmu_csis_bus", "mout_cmu_csis_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_CSIS_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_DISP_BUS, "gout_cmu_disp_bus", "mout_cmu_disp_bus",
+	GATE(CLK_GOUT_CMU_DISP_BUS, "gout_cmu_disp_bus", "mout_cmu_disp_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_DISP_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_DNS_BUS, "gout_cmu_dns_bus", "mout_cmu_dns_bus",
+	GATE(CLK_GOUT_CMU_DNS_BUS, "gout_cmu_dns_bus", "mout_cmu_dns_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_DNS_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_DPU_BUS, "gout_cmu_dpu_bus", "mout_cmu_dpu_bus",
+	GATE(CLK_GOUT_CMU_DPU_BUS, "gout_cmu_dpu_bus", "mout_cmu_dpu_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_DPU_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_EH_BUS, "gout_cmu_eh_bus", "mout_cmu_eh_bus",
+	GATE(CLK_GOUT_CMU_EH_BUS, "gout_cmu_eh_bus", "mout_cmu_eh_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_EH_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_G2D_G2D, "gout_cmu_g2d_g2d", "mout_cmu_g2d_g2d",
+	GATE(CLK_GOUT_CMU_G2D_G2D, "gout_cmu_g2d_g2d", "mout_cmu_g2d_g2d",
 	     CLK_CON_GAT_GATE_CLKCMU_G2D_G2D, 21, 0, 0),
-	GATE(CLK_GOUT_G2D_MSCL, "gout_cmu_g2d_mscl", "mout_cmu_g2d_mscl",
+	GATE(CLK_GOUT_CMU_G2D_MSCL, "gout_cmu_g2d_mscl", "mout_cmu_g2d_mscl",
 	     CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL, 21, 0, 0),
-	GATE(CLK_GOUT_G3AA_G3AA, "gout_cmu_g3aa_g3aa", "mout_cmu_g3aa_g3aa",
+	GATE(CLK_GOUT_CMU_G3AA_G3AA, "gout_cmu_g3aa_g3aa", "mout_cmu_g3aa_g3aa",
 	     CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA, 21, 0, 0),
-	GATE(CLK_GOUT_G3D_BUSD, "gout_cmu_g3d_busd", "mout_cmu_g3d_busd",
+	GATE(CLK_GOUT_CMU_G3D_BUSD, "gout_cmu_g3d_busd", "mout_cmu_g3d_busd",
 	     CLK_CON_GAT_GATE_CLKCMU_G3D_BUSD, 21, 0, 0),
-	GATE(CLK_GOUT_G3D_GLB, "gout_cmu_g3d_glb", "mout_cmu_g3d_glb",
+	GATE(CLK_GOUT_CMU_G3D_GLB, "gout_cmu_g3d_glb", "mout_cmu_g3d_glb",
 	     CLK_CON_GAT_GATE_CLKCMU_G3D_GLB, 21, 0, 0),
-	GATE(CLK_GOUT_G3D_SWITCH, "gout_cmu_g3d_switch", "mout_cmu_g3d_switch",
-	     CLK_CON_GAT_GATE_CLKCMU_G3D_SWITCH, 21, 0, 0),
-	GATE(CLK_GOUT_GDC_GDC0, "gout_cmu_gdc_gdc0", "mout_cmu_gdc_gdc0",
+	GATE(CLK_GOUT_CMU_G3D_SWITCH, "gout_cmu_g3d_switch",
+	     "mout_cmu_g3d_switch", CLK_CON_GAT_GATE_CLKCMU_G3D_SWITCH,
+	     21, 0, 0),
+	GATE(CLK_GOUT_CMU_GDC_GDC0, "gout_cmu_gdc_gdc0", "mout_cmu_gdc_gdc0",
 	     CLK_CON_GAT_GATE_CLKCMU_GDC_GDC0, 21, 0, 0),
-	GATE(CLK_GOUT_GDC_GDC1, "gout_cmu_gdc_gdc1", "mout_cmu_gdc_gdc1",
+	GATE(CLK_GOUT_CMU_GDC_GDC1, "gout_cmu_gdc_gdc1", "mout_cmu_gdc_gdc1",
 	     CLK_CON_GAT_GATE_CLKCMU_GDC_GDC1, 21, 0, 0),
-	GATE(CLK_GOUT_GDC_SCSC, "gout_cmu_gdc_scsc", "mout_cmu_gdc_scsc",
+	GATE(CLK_GOUT_CMU_GDC_SCSC, "gout_cmu_gdc_scsc", "mout_cmu_gdc_scsc",
 	     CLK_CON_GAT_GATE_CLKCMU_GDC_SCSC, 21, 0, 0),
 	GATE(CLK_GOUT_CMU_HPM, "gout_cmu_hpm", "mout_cmu_hpm",
 	     CLK_CON_GAT_GATE_CLKCMU_HPM, 21, 0, 0),
-	GATE(CLK_GOUT_HSI0_BUS, "gout_cmu_hsi0_bus", "mout_cmu_hsi0_bus",
+	GATE(CLK_GOUT_CMU_HSI0_BUS, "gout_cmu_hsi0_bus", "mout_cmu_hsi0_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_HSI0_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_HSI0_DPGTC, "gout_cmu_hsi0_dpgtc", "mout_cmu_hsi0_dpgtc",
-	     CLK_CON_GAT_GATE_CLKCMU_HSI0_DPGTC, 21, 0, 0),
-	GATE(CLK_GOUT_HSI0_USB31DRD, "gout_cmu_hsi0_usb31drd",
+	GATE(CLK_GOUT_CMU_HSI0_DPGTC, "gout_cmu_hsi0_dpgtc",
+	     "mout_cmu_hsi0_dpgtc", CLK_CON_GAT_GATE_CLKCMU_HSI0_DPGTC,
+	     21, 0, 0),
+	GATE(CLK_GOUT_CMU_HSI0_USB31DRD, "gout_cmu_hsi0_usb31drd",
 	     "mout_cmu_hsi0_usb31drd", CLK_CON_GAT_GATE_CLKCMU_HSI0_USB31DRD,
 	     21, 0, 0),
-	GATE(CLK_GOUT_HSI0_USBDPDBG, "gout_cmu_hsi0_usbdpdbg",
+	GATE(CLK_GOUT_CMU_HSI0_USBDPDBG, "gout_cmu_hsi0_usbdpdbg",
 	     "mout_cmu_hsi0_usbdpdbg", CLK_CON_GAT_GATE_CLKCMU_HSI0_USBDPDBG,
 	     21, 0, 0),
-	GATE(CLK_GOUT_HSI1_BUS, "gout_cmu_hsi1_bus", "mout_cmu_hsi1_bus",
+	GATE(CLK_GOUT_CMU_HSI1_BUS, "gout_cmu_hsi1_bus", "mout_cmu_hsi1_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_HSI1_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_HSI1_PCIE, "gout_cmu_hsi1_pcie", "mout_cmu_hsi1_pcie",
+	GATE(CLK_GOUT_CMU_HSI1_PCIE, "gout_cmu_hsi1_pcie", "mout_cmu_hsi1_pcie",
 	     CLK_CON_GAT_GATE_CLKCMU_HSI1_PCIE, 21, 0, 0),
-	GATE(CLK_GOUT_HSI2_BUS, "gout_cmu_hsi2_bus", "mout_cmu_hsi2_bus",
+	GATE(CLK_GOUT_CMU_HSI2_BUS, "gout_cmu_hsi2_bus", "mout_cmu_hsi2_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_HSI2_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_HSI2_MMC_CARD, "gout_cmu_hsi2_mmc_card",
+	GATE(CLK_GOUT_CMU_HSI2_MMC_CARD, "gout_cmu_hsi2_mmc_card",
 	     "mout_cmu_hsi2_mmc_card", CLK_CON_GAT_GATE_CLKCMU_HSI2_MMCCARD,
 	     21, 0, 0),
-	GATE(CLK_GOUT_HSI2_PCIE, "gout_cmu_hsi2_pcie", "mout_cmu_hsi2_pcie",
+	GATE(CLK_GOUT_CMU_HSI2_PCIE, "gout_cmu_hsi2_pcie", "mout_cmu_hsi2_pcie",
 	     CLK_CON_GAT_GATE_CLKCMU_HSI2_PCIE, 21, 0, 0),
-	GATE(CLK_GOUT_HSI2_UFS_EMBD, "gout_cmu_hsi2_ufs_embd",
+	GATE(CLK_GOUT_CMU_HSI2_UFS_EMBD, "gout_cmu_hsi2_ufs_embd",
 	     "mout_cmu_hsi2_ufs_embd", CLK_CON_GAT_GATE_CLKCMU_HSI2_UFS_EMBD,
 	     21, 0, 0),
-	GATE(CLK_GOUT_IPP_BUS, "gout_cmu_ipp_bus", "mout_cmu_ipp_bus",
+	GATE(CLK_GOUT_CMU_IPP_BUS, "gout_cmu_ipp_bus", "mout_cmu_ipp_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_IPP_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_ITP_BUS, "gout_cmu_itp_bus", "mout_cmu_itp_bus",
+	GATE(CLK_GOUT_CMU_ITP_BUS, "gout_cmu_itp_bus", "mout_cmu_itp_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_ITP_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_MCSC_ITSC, "gout_cmu_mcsc_itsc", "mout_cmu_mcsc_itsc",
+	GATE(CLK_GOUT_CMU_MCSC_ITSC, "gout_cmu_mcsc_itsc", "mout_cmu_mcsc_itsc",
 	     CLK_CON_GAT_GATE_CLKCMU_MCSC_ITSC, 21, 0, 0),
-	GATE(CLK_GOUT_MCSC_MCSC, "gout_cmu_mcsc_mcsc", "mout_cmu_mcsc_mcsc",
+	GATE(CLK_GOUT_CMU_MCSC_MCSC, "gout_cmu_mcsc_mcsc", "mout_cmu_mcsc_mcsc",
 	     CLK_CON_GAT_GATE_CLKCMU_MCSC_MCSC, 21, 0, 0),
-	GATE(CLK_GOUT_MFC_MFC, "gout_cmu_mfc_mfc", "mout_cmu_mfc_mfc",
+	GATE(CLK_GOUT_CMU_MFC_MFC, "gout_cmu_mfc_mfc", "mout_cmu_mfc_mfc",
 	     CLK_CON_GAT_GATE_CLKCMU_MFC_MFC, 21, 0, 0),
-	GATE(CLK_GOUT_MIF_BUSP, "gout_cmu_mif_busp", "mout_cmu_mif_busp",
+	GATE(CLK_GOUT_CMU_MIF_BUSP, "gout_cmu_mif_busp", "mout_cmu_mif_busp",
 	     CLK_CON_GAT_GATE_CLKCMU_MIF_BUSP, 21, 0, 0),
-	GATE(CLK_GOUT_MISC_BUS, "gout_cmu_misc_bus", "mout_cmu_misc_bus",
+	GATE(CLK_GOUT_CMU_MISC_BUS, "gout_cmu_misc_bus", "mout_cmu_misc_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_MISC_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_MISC_SSS, "gout_cmu_misc_sss", "mout_cmu_misc_sss",
+	GATE(CLK_GOUT_CMU_MISC_SSS, "gout_cmu_misc_sss", "mout_cmu_misc_sss",
 	     CLK_CON_GAT_GATE_CLKCMU_MISC_SSS, 21, 0, 0),
-	GATE(CLK_GOUT_PDP_BUS, "gout_cmu_pdp_bus", "mout_cmu_pdp_bus",
+	GATE(CLK_GOUT_CMU_PDP_BUS, "gout_cmu_pdp_bus", "mout_cmu_pdp_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_PDP_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_PDP_VRA, "gout_cmu_pdp_vra", "mout_cmu_pdp_vra",
+	GATE(CLK_GOUT_CMU_PDP_VRA, "gout_cmu_pdp_vra", "mout_cmu_pdp_vra",
 	     CLK_CON_GAT_GATE_CLKCMU_PDP_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_PERIC0_BUS, "gout_cmu_peric0_bus", "mout_cmu_peric0_bus",
-	     CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_PERIC0_IP, "gout_cmu_peric0_ip", "mout_cmu_peric0_ip",
+	GATE(CLK_GOUT_CMU_PERIC0_BUS, "gout_cmu_peric0_bus",
+	     "mout_cmu_peric0_bus", CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS,
+	     21, 0, 0),
+	GATE(CLK_GOUT_CMU_PERIC0_IP, "gout_cmu_peric0_ip", "mout_cmu_peric0_ip",
 	     CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP, 21, 0, 0),
-	GATE(CLK_GOUT_PERIC1_BUS, "gout_cmu_peric1_bus", "mout_cmu_peric1_bus",
-	     CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_PERIC1_IP, "gout_cmu_peric1_ip", "mout_cmu_peric1_ip",
+	GATE(CLK_GOUT_CMU_PERIC1_BUS, "gout_cmu_peric1_bus",
+	     "mout_cmu_peric1_bus", CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS,
+	     21, 0, 0),
+	GATE(CLK_GOUT_CMU_PERIC1_IP, "gout_cmu_peric1_ip", "mout_cmu_peric1_ip",
 	     CLK_CON_GAT_GATE_CLKCMU_PERIC1_IP, 21, 0, 0),
-	GATE(CLK_GOUT_TNR_BUS, "gout_cmu_tnr_bus", "mout_cmu_tnr_bus",
+	GATE(CLK_GOUT_CMU_TNR_BUS, "gout_cmu_tnr_bus", "mout_cmu_tnr_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_TNR_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_TOP_CMUREF, "gout_cmu_top_cmuref", "mout_cmu_top_cmuref",
-	     CLK_CON_GAT_GATE_CLKCMU_TOP_CMUREF, 21, 0, 0),
-	GATE(CLK_GOUT_TPU_BUS, "gout_cmu_tpu_bus", "mout_cmu_tpu_bus",
+	GATE(CLK_GOUT_CMU_TOP_CMUREF, "gout_cmu_top_cmuref",
+	     "mout_cmu_top_cmuref", CLK_CON_GAT_GATE_CLKCMU_TOP_CMUREF,
+	     21, 0, 0),
+	GATE(CLK_GOUT_CMU_TPU_BUS, "gout_cmu_tpu_bus", "mout_cmu_tpu_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_TPU_BUS, 21, 0, 0),
-	GATE(CLK_GOUT_TPU_TPU, "gout_cmu_tpu_tpu", "mout_cmu_tpu_tpu",
+	GATE(CLK_GOUT_CMU_TPU_TPU, "gout_cmu_tpu_tpu", "mout_cmu_tpu_tpu",
 	     CLK_CON_GAT_GATE_CLKCMU_TPU_TPU, 21, 0, 0),
-	GATE(CLK_GOUT_TPU_TPUCTL, "gout_cmu_tpu_tpuctl", "mout_cmu_tpu_tpuctl",
-	     CLK_CON_GAT_GATE_CLKCMU_TPU_TPUCTL, 21, 0, 0),
-	GATE(CLK_GOUT_TPU_UART, "gout_cmu_tpu_uart", "mout_cmu_tpu_uart",
+	GATE(CLK_GOUT_CMU_TPU_TPUCTL, "gout_cmu_tpu_tpuctl",
+	     "mout_cmu_tpu_tpuctl", CLK_CON_GAT_GATE_CLKCMU_TPU_TPUCTL,
+	     21, 0, 0),
+	GATE(CLK_GOUT_CMU_TPU_UART, "gout_cmu_tpu_uart", "mout_cmu_tpu_uart",
 	     CLK_CON_GAT_GATE_CLKCMU_TPU_UART, 21, 0, 0),
 };
 
diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
index 9761c0b24e66..21adec22387c 100644
--- a/include/dt-bindings/clock/google,gs101.h
+++ b/include/dt-bindings/clock/google,gs101.h
@@ -166,79 +166,79 @@
 #define CLK_DOUT_CMU_SHARED3_DIV2	150
 
 /* CMU_TOP Gates */
-#define CLK_GOUT_BUS0_BOOST		151
-#define CLK_GOUT_BUS1_BOOST		152
-#define CLK_GOUT_BUS2_BOOST		153
-#define CLK_GOUT_CORE_BOOST		154
-#define CLK_GOUT_CPUCL0_BOOST		155
-#define CLK_GOUT_CPUCL1_BOOST		156
-#define CLK_GOUT_CPUCL2_BOOST		157
-#define CLK_GOUT_MIF_BOOST		158
-#define CLK_GOUT_MIF_SWITCH		159
-#define CLK_GOUT_BO_BUS			160
-#define CLK_GOUT_BUS0_BUS		161
-#define CLK_GOUT_BUS1_BUS		162
-#define CLK_GOUT_BUS2_BUS		163
-#define CLK_GOUT_CIS_CLK0		164
-#define CLK_GOUT_CIS_CLK1		165
-#define CLK_GOUT_CIS_CLK2		166
-#define CLK_GOUT_CIS_CLK3		167
-#define CLK_GOUT_CIS_CLK4		168
-#define CLK_GOUT_CIS_CLK5		169
-#define CLK_GOUT_CIS_CLK6		170
-#define CLK_GOUT_CIS_CLK7		171
-#define CLK_GOUT_CMU_BOOST		172
-#define CLK_GOUT_CORE_BUS		173
-#define CLK_GOUT_CPUCL0_DBG		174
-#define CLK_GOUT_CPUCL0_SWITCH		175
-#define CLK_GOUT_CPUCL1_SWITCH		176
-#define CLK_GOUT_CPUCL2_SWITCH		177
-#define CLK_GOUT_CSIS_BUS		178
-#define CLK_GOUT_DISP_BUS		179
-#define CLK_GOUT_DNS_BUS		180
-#define CLK_GOUT_DPU_BUS		181
-#define CLK_GOUT_EH_BUS			182
-#define CLK_GOUT_G2D_G2D		183
-#define CLK_GOUT_G2D_MSCL		184
-#define CLK_GOUT_G3AA_G3AA		185
-#define CLK_GOUT_G3D_BUSD		186
-#define CLK_GOUT_G3D_GLB		187
-#define CLK_GOUT_G3D_SWITCH		188
-#define CLK_GOUT_GDC_GDC0		189
-#define CLK_GOUT_GDC_GDC1		190
-#define CLK_GOUT_GDC_SCSC		191
+#define CLK_GOUT_CMU_BUS0_BOOST		151
+#define CLK_GOUT_CMU_BUS1_BOOST		152
+#define CLK_GOUT_CMU_BUS2_BOOST		153
+#define CLK_GOUT_CMU_CORE_BOOST		154
+#define CLK_GOUT_CMU_CPUCL0_BOOST	155
+#define CLK_GOUT_CMU_CPUCL1_BOOST	156
+#define CLK_GOUT_CMU_CPUCL2_BOOST	157
+#define CLK_GOUT_CMU_MIF_BOOST		158
+#define CLK_GOUT_CMU_MIF_SWITCH		159
+#define CLK_GOUT_CMU_BO_BUS		160
+#define CLK_GOUT_CMU_BUS0_BUS		161
+#define CLK_GOUT_CMU_BUS1_BUS		162
+#define CLK_GOUT_CMU_BUS2_BUS		163
+#define CLK_GOUT_CMU_CIS_CLK0		164
+#define CLK_GOUT_CMU_CIS_CLK1		165
+#define CLK_GOUT_CMU_CIS_CLK2		166
+#define CLK_GOUT_CMU_CIS_CLK3		167
+#define CLK_GOUT_CMU_CIS_CLK4		168
+#define CLK_GOUT_CMU_CIS_CLK5		169
+#define CLK_GOUT_CMU_CIS_CLK6		170
+#define CLK_GOUT_CMU_CIS_CLK7		171
+#define CLK_GOUT_CMU_CMU_BOOST		172
+#define CLK_GOUT_CMU_CORE_BUS		173
+#define CLK_GOUT_CMU_CPUCL0_DBG		174
+#define CLK_GOUT_CMU_CPUCL0_SWITCH	175
+#define CLK_GOUT_CMU_CPUCL1_SWITCH	176
+#define CLK_GOUT_CMU_CPUCL2_SWITCH	177
+#define CLK_GOUT_CMU_CSIS_BUS		178
+#define CLK_GOUT_CMU_DISP_BUS		179
+#define CLK_GOUT_CMU_DNS_BUS		180
+#define CLK_GOUT_CMU_DPU_BUS		181
+#define CLK_GOUT_CMU_EH_BUS		182
+#define CLK_GOUT_CMU_G2D_G2D		183
+#define CLK_GOUT_CMU_G2D_MSCL		184
+#define CLK_GOUT_CMU_G3AA_G3AA		185
+#define CLK_GOUT_CMU_G3D_BUSD		186
+#define CLK_GOUT_CMU_G3D_GLB		187
+#define CLK_GOUT_CMU_G3D_SWITCH		188
+#define CLK_GOUT_CMU_GDC_GDC0		189
+#define CLK_GOUT_CMU_GDC_GDC1		190
+#define CLK_GOUT_CMU_GDC_SCSC		191
 #define CLK_GOUT_CMU_HPM		192
-#define CLK_GOUT_HSI0_BUS		193
-#define CLK_GOUT_HSI0_DPGTC		194
-#define CLK_GOUT_HSI0_USB31DRD		195
-#define CLK_GOUT_HSI0_USBDPDBG		196
-#define CLK_GOUT_HSI1_BUS		197
-#define CLK_GOUT_HSI1_PCIE		198
-#define CLK_GOUT_HSI2_BUS		199
-#define CLK_GOUT_HSI2_MMC_CARD		200
-#define CLK_GOUT_HSI2_PCIE		201
-#define CLK_GOUT_HSI2_UFS_EMBD		202
-#define CLK_GOUT_IPP_BUS		203
-#define CLK_GOUT_ITP_BUS		204
-#define CLK_GOUT_MCSC_ITSC		205
-#define CLK_GOUT_MCSC_MCSC		206
-#define CLK_GOUT_MFC_MFC		207
-#define CLK_GOUT_MIF_BUSP		208
-#define CLK_GOUT_MISC_BUS		209
-#define CLK_GOUT_MISC_SSS		210
-#define CLK_GOUT_PDP_BUS		211
-#define CLK_GOUT_PDP_VRA		212
-#define CLK_GOUT_G3AA			213
-#define CLK_GOUT_PERIC0_BUS		214
-#define CLK_GOUT_PERIC0_IP		215
-#define CLK_GOUT_PERIC1_BUS		216
-#define CLK_GOUT_PERIC1_IP		217
-#define CLK_GOUT_TNR_BUS		218
-#define CLK_GOUT_TOP_CMUREF		219
-#define CLK_GOUT_TPU_BUS		220
-#define CLK_GOUT_TPU_TPU		221
-#define CLK_GOUT_TPU_TPUCTL		222
-#define CLK_GOUT_TPU_UART		223
+#define CLK_GOUT_CMU_HSI0_BUS		193
+#define CLK_GOUT_CMU_HSI0_DPGTC		194
+#define CLK_GOUT_CMU_HSI0_USB31DRD	195
+#define CLK_GOUT_CMU_HSI0_USBDPDBG	196
+#define CLK_GOUT_CMU_HSI1_BUS		197
+#define CLK_GOUT_CMU_HSI1_PCIE		198
+#define CLK_GOUT_CMU_HSI2_BUS		199
+#define CLK_GOUT_CMU_HSI2_MMC_CARD	200
+#define CLK_GOUT_CMU_HSI2_PCIE		201
+#define CLK_GOUT_CMU_HSI2_UFS_EMBD	202
+#define CLK_GOUT_CMU_IPP_BUS		203
+#define CLK_GOUT_CMU_ITP_BUS		204
+#define CLK_GOUT_CMU_MCSC_ITSC		205
+#define CLK_GOUT_CMU_MCSC_MCSC		206
+#define CLK_GOUT_CMU_MFC_MFC		207
+#define CLK_GOUT_CMU_MIF_BUSP		208
+#define CLK_GOUT_CMU_MISC_BUS		209
+#define CLK_GOUT_CMU_MISC_SSS		210
+#define CLK_GOUT_CMU_PDP_BUS		211
+#define CLK_GOUT_CMU_PDP_VRA		212
+#define CLK_GOUT_CMU_G3AA		213
+#define CLK_GOUT_CMU_PERIC0_BUS		214
+#define CLK_GOUT_CMU_PERIC0_IP		215
+#define CLK_GOUT_CMU_PERIC1_BUS		216
+#define CLK_GOUT_CMU_PERIC1_IP		217
+#define CLK_GOUT_CMU_TNR_BUS		218
+#define CLK_GOUT_CMU_TOP_CMUREF		219
+#define CLK_GOUT_CMU_TPU_BUS		220
+#define CLK_GOUT_CMU_TPU_TPU		221
+#define CLK_GOUT_CMU_TPU_TPUCTL		222
+#define CLK_GOUT_CMU_TPU_UART		223
 
 /* CMU_APM */
 #define CLK_MOUT_APM_FUNC				1
-- 
2.43.0.472.g3155946c3a-goog


