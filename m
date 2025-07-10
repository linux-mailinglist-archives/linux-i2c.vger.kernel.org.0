Return-Path: <linux-i2c+bounces-11888-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F54BAFF8A3
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 07:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06AD84E13F4
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 05:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66211280331;
	Thu, 10 Jul 2025 05:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="XFS8u7t6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29075383;
	Thu, 10 Jul 2025 05:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752126756; cv=none; b=edcU32I8rQW4HD2SKlkVE6XOT0HjnLHFFlcVZstcvchCTYxpYGEnu2EnnOo9mk0tS0p/kB+ueEmJqU/i140Mscq5/6MPKwFltE8vV2J39Pw06krFNuvXK8083TM4YJbDC0hshBkCJxEcXG98BPAPWv2N1ksWmszT4mtgM51S6Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752126756; c=relaxed/simple;
	bh=V2oxLtXrTzZr+wtTLR0Crnh/bcm6L1q/rrLoD+/bqgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J+LjVQCoV58Wn70WlrzVDng+ocWuAtUw1lPiYfY/VqzVI4HOAuTMq4Y7RYanyQWPXOwGeWo+Q6emjL1ezmiTbISrFjiN09I1PAhkl5UBmJIOuZ4YMAZVUgqMgGO8YGUSZFrCQ3Kv51qFd6rU4C4bNE8aOg6hsSfYeYHdl3gMFFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=XFS8u7t6; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1752126655;
	bh=i3FEkqQM3A46Sog8P0QKUe0CbnjB3l59i3+sBNqnKeM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=XFS8u7t6W4hr4k5rnQ1vTdT98ma6PlMat+MP7gcZXqvLBXFtSacBui3josAWSBZlu
	 y6JZbXAzTcEedBkf5/lgRjszRTOtX9+S9QiFW4bSVmi+OQUTOicYQXrpf63Fw7WsOU
	 63jOv5Dokwy1l6CSfjMqqlpOiSFPjOiIVG9hZZ34=
X-QQ-mid: esmtpsz11t1752126650t8cf60ccb
X-QQ-Originating-IP: W0oQU+3EKYODo+J+Y0K48OJBpGmDBSIKtQSxcERKva4=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Jul 2025 13:50:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3475147808273269951
EX-QQ-RecipientCnt: 7
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 10 Jul 2025 13:50:24 +0800
Subject: [PATCH] i2c: spacemit: configure ILCR for accurate SCL frequency
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAJ9Ub2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwNL3WxD3UyjZN3MnOQi3dREYxPzVAMLU4NEEyWgjoKi1LTMCrBp0bG
 1tQD3DofMXQAAAA==
X-Change-ID: 20250709-k1-i2c-ilcr-ea347e0850a4
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752126648; l=9487;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=V2oxLtXrTzZr+wtTLR0Crnh/bcm6L1q/rrLoD+/bqgg=;
 b=oh3NAU5qB3WDoz6ssDWzoKUv9nvPSNUnYMAWmU344R3DLgR+NhmvNA0YT+Z7zwukwJLcBNzlL
 Aq6+BH2SP1UBfBgKuHnlfKGTwXF3xMSb8IYcHToIaZbfyDY1SJ+SePi
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MnDLfP0IFnF4ysBEROFl7bs8TA9HPZa/CR/Kk/Aw9+CRfKEyIyk1EVyT
	SJV26Rx90VM4lz/NtIsP0p3C+Ep74kpKI1hENYol/TxIEPEO5WAklAa79tEQHmKQmr/H+Em
	lHB/uJ5xxcFV8aH5D3y9DIJEP5KOyfEPFdEvn3nwFRsrtmzd+pqued5Yv6T3IADZwstuMSt
	rVFufhgeHrlDBNJB7NqV9HDo9OwpQdumM9IBZywsSvhCxOvSPQajnI6eRshxLoYmo+0Ewe6
	OgG8BlD6pi0GyQlRolmmw6s2mqtpXVfZhPh4QhzmGMU4wvjC49q61hXmhe0u5V89zE5l6Vj
	eb/YT85UflagRgKA+zApmqvoS57WyM2rvDqA/O36TLhCYtuXdol/e7accF9C2Xbv1vTFwDE
	I9ElfEUYS92RkiXQ3vlyvcmzp+9AeKi7FnFSiX8YEcawbPgKQPonWAgfnOaqWLshoJNH4eF
	o3bVc7+BZRo542TLWxY6j2ccYPRajg9YQLIqM9iMUk+PWIcFZtiGUvnkitWBI3Sal5xM6Md
	RNvtvZ6jymS1FoLprfbKS8UHIMiD0jSA5qmVK5FXHXlsUVyQIHjagt4IPp4+HG681UVpkHy
	Y/CNoSTc2txCZpRT9mbB6e8VBk+Fr/5vyxa0S4tisjyYYM3wrodPYZnxs4EJgAOCBV8IRZs
	u6VRQh/MwHLi1pew8p2449B+NrgWcvfJxE3hymyqULbU56NkG3z/xDI9cTSCV4oC4IzQ4jo
	g7Ori09UyO1uMa1Kcg5HjNVmYYtujZp0yZ5PyoZD+UrP4qtat4gsMTE6OwXyIlYisq87UZo
	/qce9JJpD3lY3b20sURgCGaJZbiBfvXCILvKuOfHfkzQQ3i0PVPf8ekIB6yYwi0LMwSuF38
	jn2m6Q1wICRfctiCLn/HU+5/c5L1J0C8CgHSVgudRLByX1p31Fw6Oe/ZJ9dEz7d7SjzuhJA
	FaRSeEy0M0gxmVE+/DuB6Lya5/vNp7LJHSKjBsk6Nige9jNbXxDrqA+bt+YPzpP1BGeOsCq
	lDezhM5et541m5ONkTamD6CvhNFGQ5stb0CqyjCbdxwHdcoy0yJdKlfALWgNcyVfLbuqx8s
	aRRWSKTUrzDqDnLJgFCLQ2w8htapQvtfQQBfWQDexB40/wlNWdPXbUKD1g3866bXQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
master mode operations is determined by the ILCR (I2C Load Count Register).
Previously, the driver relied on the hardware's reset default
values for this register.

The hardware's default ILCR values (SLV=0x156, FLV=0x5d) yield SCL
frequencies lower than intended. For example, with the default
31.5 MHz input clock, these default settings result in an SCL
frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
and approximately 338 kHz (fast mode) when targeting 400 kHz.
These frequencies are below the 100 kHz/400 kHz nominal speeds.

This patch integrates the SCL frequency management into
the Common Clock Framework (CCF). Specifically, the ILCR register,
which acts as a frequency divider for the SCL clock, is now registered
as a managed clock (scl_clk) within the CCF.

Additionally, the driver now validates user-provided SCL frequency values
and rejects illegal settings, rather than silently adjusting them.

This patch also cleans up unnecessary whitespace
in the included header files.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/i2c/busses/i2c-k1.c | 170 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 154 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index b68a21fff0b56b59fe2032ccb7ca6953423aad32..e846156466493f748c17f38bd4eaf99f68950202 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -3,17 +3,21 @@
  * Copyright (C) 2024-2025 Troy Mitchell <troymitchell988@gmail.com>
  */
 
- #include <linux/clk.h>
- #include <linux/i2c.h>
- #include <linux/iopoll.h>
- #include <linux/module.h>
- #include <linux/of_address.h>
- #include <linux/platform_device.h>
+#include "linux/bits.h"
+#include <linux/clk.h>
+#include <linux/clkdev.h>
+#include <linux/clk-provider.h>
+#include <linux/i2c.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
 
 /* spacemit i2c registers */
 #define SPACEMIT_ICR		 0x0		/* Control register */
 #define SPACEMIT_ISR		 0x4		/* Status register */
 #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
+#define SPACEMIT_ILCR		 0x10		/* Load Count Register */
 #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
 
 /* SPACEMIT_ICR register fields */
@@ -80,6 +84,17 @@
 #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
 #define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
 
+#define SPACEMIT_LCR_LV_STANDARD_SHIFT		0
+#define SPACEMIT_LCR_LV_FAST_SHIFT		9
+#define SPACEMIT_LCR_LV_STANDARD_WIDTH		9
+#define SPACEMIT_LCR_LV_FAST_WIDTH		9
+#define SPACEMIT_LCR_LV_STANDARD_MASK		GENMASK(SPACEMIT_LCR_LV_STANDARD_SHIFT +\
+						SPACEMIT_LCR_LV_STANDARD_WIDTH - 1,\
+						SPACEMIT_LCR_LV_STANDARD_SHIFT)
+#define SPACEMIT_LCR_LV_FAST_MASK		GENMASK(SPACEMIT_LCR_LV_FAST_SHIFT +\
+						SPACEMIT_LCR_LV_FAST_WIDTH - 1,\
+						SPACEMIT_LCR_LV_FAST_SHIFT)
+
 /* i2c bus recover timeout: us */
 #define SPACEMIT_I2C_BUS_BUSY_TIMEOUT		100000
 
@@ -95,11 +110,20 @@ enum spacemit_i2c_state {
 	SPACEMIT_STATE_WRITE,
 };
 
+enum spacemit_i2c_mode {
+	SPACEMIT_MODE_STANDARD,
+	SPACEMIT_MODE_FAST
+};
+
 /* i2c-spacemit driver's main struct */
 struct spacemit_i2c_dev {
 	struct device *dev;
 	struct i2c_adapter adapt;
 
+	struct clk_hw scl_clk_hw;
+	struct clk *scl_clk;
+	enum spacemit_i2c_mode mode;
+
 	/* hardware resources */
 	void __iomem *base;
 	int irq;
@@ -120,6 +144,78 @@ struct spacemit_i2c_dev {
 	u32 status;
 };
 
+static void spacemit_i2c_scl_clk_disable_unprepare(void *data)
+{
+	struct spacemit_i2c_dev *i2c = data;
+
+	clk_disable_unprepare(i2c->scl_clk);
+}
+
+static void spacemit_i2c_scl_clk_exclusive_put(void *data)
+{
+	struct spacemit_i2c_dev *i2c = data;
+
+	clk_rate_exclusive_put(i2c->scl_clk);
+}
+
+static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
+	u32 lv, lcr;
+
+	lv = DIV_ROUND_UP(parent_rate, rate);
+
+	lcr = readl(i2c->base + SPACEMIT_ILCR);
+	if (i2c->mode == SPACEMIT_MODE_STANDARD) {
+		lcr &= ~SPACEMIT_LCR_LV_STANDARD_MASK;
+		lcr |= lv << SPACEMIT_LCR_LV_STANDARD_SHIFT;
+	} else if (i2c->mode == SPACEMIT_MODE_FAST) {
+		lcr &= ~SPACEMIT_LCR_LV_FAST_MASK;
+		lcr |= lv << SPACEMIT_LCR_LV_FAST_SHIFT;
+	}
+	writel(lcr, i2c->base + SPACEMIT_ILCR);
+
+	return 0;
+}
+
+static long spacemit_i2c_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long *parent_rate)
+{
+	u32 lv, freq;
+
+	lv = DIV_ROUND_UP(*parent_rate, rate);
+	freq = DIV_ROUND_UP(*parent_rate, lv);
+
+	return freq;
+}
+
+static unsigned long spacemit_i2c_clk_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
+	u32 lcr, lv = 0;
+
+	lcr = readl(i2c->base + SPACEMIT_ILCR);
+
+	if (i2c->mode == SPACEMIT_MODE_STANDARD)
+		lv = (lcr >> SPACEMIT_LCR_LV_STANDARD_SHIFT) &
+		     GENMASK(SPACEMIT_LCR_LV_STANDARD_WIDTH - 1, 0);
+	else if (i2c->mode == SPACEMIT_MODE_FAST)
+		lv = (lcr >> SPACEMIT_LCR_LV_FAST_SHIFT) &
+		     GENMASK(SPACEMIT_LCR_LV_FAST_WIDTH - 1, 0);
+	else
+		return 0;
+
+	return DIV_ROUND_UP(parent_rate, lv);
+}
+
+static const struct clk_ops spacemit_i2c_clk_ops = {
+	.set_rate = spacemit_i2c_clk_set_rate,
+	.round_rate = spacemit_i2c_clk_round_rate,
+	.recalc_rate = spacemit_i2c_clk_recalc_rate,
+};
+
 static void spacemit_i2c_enable(struct spacemit_i2c_dev *i2c)
 {
 	u32 val;
@@ -138,6 +234,27 @@ static void spacemit_i2c_disable(struct spacemit_i2c_dev *i2c)
 	writel(val, i2c->base + SPACEMIT_ICR);
 }
 
+static struct clk *spacemit_i2c_register_scl_clk(struct spacemit_i2c_dev *i2c,
+						 struct clk *parent)
+{
+	struct clk_init_data init;
+	char name[32];
+
+	snprintf(name, sizeof(name), "%s_scl_clk", dev_name(i2c->dev));
+
+	init.name = name;
+	init.ops = &spacemit_i2c_clk_ops;
+	init.parent_data = (struct clk_parent_data[]) {
+		{ .fw_name = "func" },
+	};
+	init.num_parents = 1;
+	init.flags = 0;
+
+	i2c->scl_clk_hw.init = &init;
+
+	return devm_clk_register(i2c->dev, &i2c->scl_clk_hw);
+}
+
 static void spacemit_i2c_reset(struct spacemit_i2c_dev *i2c)
 {
 	writel(SPACEMIT_CR_UR, i2c->base + SPACEMIT_ICR);
@@ -224,7 +341,7 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 	 */
 	val |= SPACEMIT_CR_DRFIE;
 
-	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
+	if (i2c->mode == SPACEMIT_MODE_FAST)
 		val |= SPACEMIT_CR_MODE_FAST;
 
 	/* disable response to general call */
@@ -519,15 +636,13 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
 
 	/* For now, this driver doesn't support high-speed. */
-	if (!i2c->clock_freq || i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
-		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
-			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
-		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
-	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
-		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
-			 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
-		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
-	}
+	if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&
+	    i2c->clock_freq <= SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
+		i2c->mode = SPACEMIT_MODE_FAST;
+	else if (i2c->clock_freq && i2c->clock_freq <= SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ)
+		i2c->mode = SPACEMIT_MODE_STANDARD;
+	else
+		return -EINVAL;
 
 	i2c->dev = &pdev->dev;
 
@@ -548,10 +663,33 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
 
+	i2c->scl_clk = spacemit_i2c_register_scl_clk(i2c, clk);
+	if (IS_ERR(i2c->scl_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->scl_clk),
+				     "failed to register scl clock\n");
+
 	clk = devm_clk_get_enabled(dev, "bus");
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
 
+	ret = clk_set_rate_exclusive(i2c->scl_clk, i2c->clock_freq);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to set exclusive rate for SCL clock");
+
+	ret = devm_add_action_or_reset(dev, spacemit_i2c_scl_clk_exclusive_put, i2c);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				"failed to register cleanup action for exclusive SCL clock rate");
+
+	ret = clk_prepare_enable(i2c->scl_clk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to prepare and enable clock");
+
+	ret = devm_add_action_or_reset(dev, spacemit_i2c_scl_clk_disable_unprepare, i2c);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				"failed to register cleanup action for clk disable and unprepare");
+
 	spacemit_i2c_reset(i2c);
 
 	i2c_set_adapdata(&i2c->adapt, i2c);

---
base-commit: 733923397fd95405a48f165c9b1fbc8c4b0a4681
change-id: 20250709-k1-i2c-ilcr-ea347e0850a4

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


