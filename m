Return-Path: <linux-i2c+bounces-14787-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6087CDE7FE
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 09:33:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 385B9300C1AE
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 08:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D082314B9A;
	Fri, 26 Dec 2025 08:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="nzHinCQY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16273314D2B;
	Fri, 26 Dec 2025 08:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766738022; cv=none; b=ryOoLS9g01BQ0HskrJAPTEw/rLukQehsBkTYIEkH3nQgatMr4K73dNVskpkVI6IOPKIO/uFxv+Hsl6boZxEQchxC3irJFZrR39tuEavXwf0YztdHaQD1+29wwiGma3NVujVAIci6A7pjiCooTHlV1QQoBA8MuhCE6Yl4pqouenE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766738022; c=relaxed/simple;
	bh=I/F4O6OvL9CNOoglUGCCtM/ENUOiU3Z4Par3dafj4UI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tQfzKIfK0ToYclbe7c9dUzjlXLoORHPbB4M5xlBrKP0sFke+dzc5V1ihrvb1LZS7CQLbi7zS38Fa9EkIEYEqfTvsAgtpBzQu/ZcxG410U/RgyU4h3J4J/XB5aXES97DWtvmxkxnJOlivRaB082NnbSXHTKtlvSIO4ohhri4k+PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=nzHinCQY; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766737940;
	bh=PCELiQb7TCEJrUREId7rk04F0GLa7oCrPY4mgq8XjWw=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=nzHinCQYZKVR7V8X+q2u50sxaslixdKySUrUktHHKVT1JK1YMbfOqxLhei8t9Ly8b
	 INxehJnJ2wdRGJHjyVKwvcIEB+NypQEaRayLJA7bglJ6oB6Q84zYoagKB2luu/ZyVP
	 WzLwvgkAzvpWqu2hbZ+2uD/GRMGGUixNDITJdlmQ=
X-QQ-mid: zesmtpsz6t1766737933t24b325ba
X-QQ-Originating-IP: cALO0R3bG1M7vFqLfGGJf6Z6IDAg9jNXl+jgESR3DbA=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Dec 2025 16:32:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2815579874784846442
EX-QQ-RecipientCnt: 8
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 26 Dec 2025 16:32:00 +0800
Subject: [PATCH v5 2/3] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-k1-i2c-ilcr-v5-2-b5807b7dd0e6@linux.spacemit.com>
References: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
In-Reply-To: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766737924; l=10380;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=I/F4O6OvL9CNOoglUGCCtM/ENUOiU3Z4Par3dafj4UI=;
 b=LvVtMeATBMCZuz2ueHs/uaqQm17tymVVCAolfql7mqtTli1A7lpr8tUWWXCmrskG5Qq/Ow2NQ
 yn/AdCLmvmeAN6Sm6jzhJ02D+SX8nlTUaWSOcGxXr3xsn4jhm3Px+VL
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MkJWcWIqqE1TmhRQNmlBx9zUcobMzhx/1QOM0ezY3RrgwEMyvyrMFlrK
	mJUqT0d+yTgNwrKfE5QcmxDBes8L5zp4cP5UedxU5r4yc7k4e8H6owUaQE6uS3jzo6LMI2N
	ulNTjiGDB3jsasXs2KHQgF8grucBTQ+LDdSJC3jjZXKO0Pl9xJAIuRG5xzpVlOMA/1kd6t6
	lR1uX+31/69jDPouN4I/QZ26+sg5SZ2lPcMph9c5kPaJn3Wc+pB4emjrJpvE0pZN2wNU6OJ
	/l5IQKn08qyrg5zGnSqq2aUpD7H8n0jqMgTVY4YWx/iS8u89lH3tdu0cYCXdYo6Y93LGcfZ
	FVfmiUDgxARHaPKPYnuwwnAOeuyfXa0VhwSHqFMwTXriMiqKAQ028HeSDGIZKyBMGhQZtvw
	SAvgmz0HawVSItEkUamciYhXX+XNMOMGbiOCj7zsYOnNbGRPpgFD2CJM8nXjlhwRi1+9JKE
	RsoGx0mG8rt0b4K9fnGa+YJ/ueFLVSMG+fXLxzXkeOshzFBDoeulHD8zx6mminKRYofHAtv
	ocbbf6G9YcFwlwXlq4LlMyd1aDQol08BGljN9vcsxuoR84dnc74l/uH+z1qz1PXcs4hjGm6
	9RdDA0eIKY7dZZzAWnL6UPdX5q/8qvLJWy/HQxacbZVug64uVbCmJS8m3vx1Uw25WXxwCJj
	vo2RQTCyAJ740Vsm1Dsgm0AVYMUgrs2oF2ZmqFboEJkS5nTr9Vmlt6Jso82JzxPo0AavoMJ
	0X1Wv3NpBELeWCA/Pnp+q7jXMY/2wwMIecjGhtOyuCoK092ZlUHoZOJhcc7XsVUBlki+FTE
	4TiMGd0fkGUZbHxubnmvRfOwwxNIpT+YLJQxBVk9T/2H6DcVeHuIC2jD6ktVhDZyeR15MRn
	adASSqnD7xyUNZ/Wwrf3DYRUKiNEqcXCwX71u1/+WD7aOZStW231IJ20O4bxOy5ScXRiGf7
	Alln7AVHw7+8CZgvZ+9gOuIKVCjwS+LSpbUstOBhji8ENrXM817WB3Kt1L2W29uFxpZobD2
	ndWuqpspttslf/dwvnozgpYlNXQ00IbMVfIXtu4v2mO3hnRzjQ/y01bOQmJFaqdUuQ9ovjl
	aq9tkk8j39AIQtEV3q455JBjpUqEpr9KAdZ0P5I8OTtYUUnasxyYIReQoVKqeXN7w==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
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

This patch also cleans up unnecessary whitespace
in the included header files.

Reviewed-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v5:
- use __ffs() instead of *_SHIFT
- remove useless *_SHIFT
- check return value when scl clk name array is truncated
- rebase to v6.19-rc1
- Link to v3: https://lore.kernel.org/all/20251017-k1-i2c-ilcr-v4-1-eed4903ecdb9@linux.spacemit.com/

Changelog in v4:
- initialize clk_init_data with {} so that init.flags is implicitly set to 0
- minor cleanup and style fixes for better readability
- remove unused spacemit_i2c_scl_clk_exclusive_put() cleanup callback
- replace clk_set_rate_exclusive()/clk_rate_exclusive_put() pair with clk_set_rate()
- simplify LCR LV field macros by using FIELD_GET/FIELD_MAX helpers
- Link to v3: https://lore.kernel.org/all/20250814-k1-i2c-ilcr-v3-1-317723e74bcd@linux.spacemit.com/

Changelog in v3:
- use MASK macro in `recalc_rate` function
- rename clock name
- Link to v2: https://lore.kernel.org/r/20250718-k1-i2c-ilcr-v2-1-b4c68f13dcb1@linux.spacemit.com

Changelog in v2:
- Align line breaks.
- Check `lv` in `clk_set_rate` function.
- Force fast mode when SCL frequency is illegal or unavailable.
- Change "linux/bits.h" to <linux/bits.h>
- Kconfig: Add dependency on CCF.
- Link to v1: https://lore.kernel.org/all/20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com/
---
 drivers/i2c/busses/Kconfig  |   2 +-
 drivers/i2c/busses/i2c-k1.c | 146 +++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 139 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index cea87fcb4a1a945f805e9eff25d2f7ab9f61ddf9..b13fb7155786c246229f5e17aa57603c5e755683 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -799,7 +799,7 @@ config I2C_JZ4780
 config I2C_K1
 	tristate "SpacemiT K1 I2C adapter"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on OF
+	depends on OF && COMMON_CLK
 	help
 	  This option enables support for the I2C interface on the SpacemiT K1
 	  platform.
diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 30cdf733deef264061c8ea565634c5a17f5aebfd..f0c35e23f4f2e139da0d09f314f3eb0e0462a382 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -4,7 +4,9 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/i2c.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -16,6 +18,7 @@
 #define SPACEMIT_ISR		 0x4		/* Status register */
 #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
 #define SPACEMIT_IRCR		 0x18		/* Reset cycle counter */
+#define SPACEMIT_ILCR		 0x10		/* Load Count Register */
 #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
 
 /* SPACEMIT_ICR register fields */
@@ -87,6 +90,11 @@
 #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
 #define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
 
+#define SPACEMIT_LCR_LV_STANDARD_MASK		GENMASK(8, 0)
+#define SPACEMIT_LCR_LV_FAST_MASK		GENMASK(17, 9)
+#define SPACEMIT_LCR_LV_STANDARD_MAX_VALUE	FIELD_MAX(SPACEMIT_LCR_LV_STANDARD_MASK)
+#define SPACEMIT_LCR_LV_FAST_MAX_VALUE		FIELD_MAX(SPACEMIT_LCR_LV_FAST_MASK)
+
 /* i2c bus recover timeout: us */
 #define SPACEMIT_I2C_BUS_BUSY_TIMEOUT		100000
 
@@ -104,11 +112,20 @@ enum spacemit_i2c_state {
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
@@ -129,6 +146,77 @@ struct spacemit_i2c_dev {
 	u32 status;
 };
 
+static void spacemit_i2c_scl_clk_disable_unprepare(void *data)
+{
+	struct spacemit_i2c_dev *i2c = data;
+
+	clk_disable_unprepare(i2c->scl_clk);
+}
+
+static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long parent_rate)
+{
+	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
+	u32 lv, lcr, mask, max_lv;
+
+	lv = DIV_ROUND_UP(parent_rate, rate);
+
+	if (i2c->mode == SPACEMIT_MODE_STANDARD) {
+		mask = SPACEMIT_LCR_LV_STANDARD_MASK;
+		max_lv = SPACEMIT_LCR_LV_STANDARD_MAX_VALUE;
+	} else if (i2c->mode == SPACEMIT_MODE_FAST) {
+		mask = SPACEMIT_LCR_LV_FAST_MASK;
+		max_lv = SPACEMIT_LCR_LV_FAST_MAX_VALUE;
+	}
+
+	if (!lv || lv > max_lv) {
+		dev_err(i2c->dev, "set scl clock failed: lv 0x%x", lv);
+		return -EINVAL;
+	}
+
+	lcr = readl(i2c->base + SPACEMIT_ILCR);
+	lcr &= ~mask;
+	lcr |= lv << __ffs(mask);
+	writel(lcr, i2c->base + SPACEMIT_ILCR);
+
+	return 0;
+}
+
+static long spacemit_i2c_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+					unsigned long *parent_rate)
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
+						  unsigned long parent_rate)
+{
+	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
+	u32 lcr, lv = 0;
+
+	lcr = readl(i2c->base + SPACEMIT_ILCR);
+
+	if (i2c->mode == SPACEMIT_MODE_STANDARD)
+		lv = FIELD_GET(SPACEMIT_LCR_LV_STANDARD_MASK, lcr);
+	else if (i2c->mode == SPACEMIT_MODE_FAST)
+		lv = FIELD_GET(SPACEMIT_LCR_LV_FAST_MASK, lcr);
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
@@ -147,6 +235,29 @@ static void spacemit_i2c_disable(struct spacemit_i2c_dev *i2c)
 	writel(val, i2c->base + SPACEMIT_ICR);
 }
 
+static struct clk *spacemit_i2c_register_scl_clk(struct spacemit_i2c_dev *i2c,
+						 struct clk *parent)
+{
+	struct clk_init_data init = {};
+	char name[64];
+	int ret;
+
+	ret = snprintf(name, sizeof(name), "%s_scl_clk", dev_name(i2c->dev));
+	if (ret >= ARRAY_SIZE(name))
+		dev_warn(i2c->dev, "scl clock name truncated");
+
+	init.name = name;
+	init.ops = &spacemit_i2c_clk_ops;
+	init.parent_data = (struct clk_parent_data[]) {
+		{ .fw_name = "func" },
+	};
+	init.num_parents = 1;
+
+	i2c->scl_clk_hw.init = &init;
+
+	return devm_clk_register(i2c->dev, &i2c->scl_clk_hw);
+}
+
 static void spacemit_i2c_reset(struct spacemit_i2c_dev *i2c)
 {
 	writel(SPACEMIT_CR_UR, i2c->base + SPACEMIT_ICR);
@@ -257,7 +368,7 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 	 */
 	val |= SPACEMIT_CR_DRFIE;
 
-	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
+	if (i2c->mode == SPACEMIT_MODE_FAST)
 		val |= SPACEMIT_CR_MODE_FAST;
 
 	/* disable response to general call */
@@ -545,14 +656,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
 
 	/* For now, this driver doesn't support high-speed. */
-	if (!i2c->clock_freq || i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
-		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
-			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
+	if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&
+	    i2c->clock_freq <= SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
+		i2c->mode = SPACEMIT_MODE_FAST;
+	} else if (i2c->clock_freq && i2c->clock_freq <= SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
+		i2c->mode = SPACEMIT_MODE_STANDARD;
+	} else {
+		dev_warn(i2c->dev, "invalid clock-frequency, fallback to fast mode");
+		i2c->mode = SPACEMIT_MODE_FAST;
 		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
-	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
-		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
-			 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
-		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
 	}
 
 	i2c->dev = &pdev->dev;
@@ -574,10 +686,28 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
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
 
+	ret = clk_set_rate(i2c->scl_clk, i2c->clock_freq);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to set rate for SCL clock");
+
+	ret = clk_prepare_enable(i2c->scl_clk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to prepare and enable clock");
+
+	ret = devm_add_action_or_reset(dev, spacemit_i2c_scl_clk_disable_unprepare, i2c);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register cleanup action for clk disable and unprepare");
+
 	spacemit_i2c_reset(i2c);
 
 	i2c_set_adapdata(&i2c->adapt, i2c);

-- 
2.52.0


