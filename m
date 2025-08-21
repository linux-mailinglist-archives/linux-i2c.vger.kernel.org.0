Return-Path: <linux-i2c+bounces-12365-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3CAB2F429
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Aug 2025 11:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5A4FAA256B
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Aug 2025 09:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55008292936;
	Thu, 21 Aug 2025 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="tpt0f3v8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38171DF74F;
	Thu, 21 Aug 2025 09:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755769082; cv=none; b=VRR7oPn57vNss/7eV+d7w+Ad9njSJ/nJj35vRmxITPSpTgvfER57LGgB/mCjYK3Dg9670gArvd4h+TZ4oZJzNWt67NTLVAIHtZhWAxXxL9By2WBluH9fPrHDaRBvq6sHZfShsO5AFT/TPZDLQ6inm/iI9jJ/fgBhlcoQfIIqumk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755769082; c=relaxed/simple;
	bh=zjzHsYUFAYdhKsd6LMQCUsQ4i3LBBoVBbwpa+M9mieI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ReV1g4bY/+MEMFi6pO2p4wzCrD51/WZNFYH1GLoZwx3Jc+6wn+UpKmmh26Igz+0VLk+jyFwXjLhu+DysaHEy1LYr6gpTBOg1WWdFkpdjL+4T6ASAIHbfjLimWlX8FoMzJSvE067nwS8WKYSW++s9FJtFv+oBvhoVGXyXIwjn0Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=tpt0f3v8; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755768995;
	bh=Z7a20uzgaJfYK7FaliYK+7k5YDrvLjGIWAUoVZyPaKo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=tpt0f3v8z6ix/aeQztJY5oQD/ljaDELcTOJLD8oQjXxo6DIuVSUf2tazLsxdjWtsx
	 UJ+yE15QWeuZy7JHOStYVa6i5i/6b7T0Q6jHBUS+ilIB6/4b51wOKWmbrkddnsaTFk
	 wRH7B+BtPHSUPjFYKho3Dq/ZH08FkVnYhPT8OQew=
X-QQ-mid: zesmtpgz5t1755768987tf998ac75
X-QQ-Originating-IP: zxGfrGj3pnsFHyfA4AE25AfviKwsBEHGf+H24mqqqh4=
Received: from = ( [120.239.196.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 21 Aug 2025 17:36:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11650469383386562404
EX-QQ-RecipientCnt: 7
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 21 Aug 2025 17:36:10 +0800
Subject: [PATCH RESEND v3] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-k1-i2c-ilcr-v3-1-1a024f935717@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAInopmgC/23NOw+CMBQF4L9iOlvSFxadHGR10NE4QLnIjbzSI
 sEQ/rtNHQyJ47kn9zszcWARHDlsZmJhRIdd64PcboipsvYBFAufiWAiZprt6ZNTFIZibSyFTCo
 NLIlZpoj/6C2UOAXtRi7pNT2fyN3fK3RDZ99hZBSh/Xo8WXmjoJzmyuySksvC5PxYY/uaItdnB
 hocItM1ARzlD0m4WiPSI5JrLSRolZviL7IsywcTrSWj/AAAAA==
X-Change-ID: 20250709-k1-i2c-ilcr-ea347e0850a4
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755768986; l=10871;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=zjzHsYUFAYdhKsd6LMQCUsQ4i3LBBoVBbwpa+M9mieI=;
 b=itq6wpZdtCHg8ajcuUM4J4yG4tiyX8jUU243UK7lf0ii2+HBTjdpATfu7CKEQ3d2cTOffvkMj
 +c4Exf95LDyD5ABnXgW/0HMcjka7fkfJVQdNYFx6yz10arG4o8pTWEL
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NSoa40jSEY0I0YCbYx3R2VyQoZFSz2NSDTt1nbYsf8T5v3+e6yyU8F1P
	vYXw5EM6khJ9Ybc/bYqEmpc0ConXs2E4djLuZlBleZdTupRw88TLfbwsyD+lVekZNVwpYgT
	SIysLCvyw51bvmtQUIsVZ5ADIyjo1089FPus3nneM0h7Fn0A3qCb+Xq/PVgZKhhw1L3O4Jo
	Ma5NiVbRPkmOkc7tgChTWfCb4iFwTbnkWMNEqPYA+1s4E8QbyQs4zCMk1Zj70K3OYEREGef
	zD7tDduelBVvMV2nuh0jLcV6Ogqg+9o4KbkQUDfJRP6buIum7vrk1BWo3lLU9vD1A1wolSI
	z4D9FH2aoYAhOajA0EZtH71iFpp38EFi+nNeafO787lI2yfkXk7uQOggbQwDZ1SE1bPYLXd
	79fopQIg+V9bZKdCuSmlRwDITfQcIDzDSwmVQ6dJ4gJtbeWqRmmpYhV+i8IAyJCRgRpc0VW
	C9rsw08PONC4Inf/fwyWS29/80YbK0xXe5wWQbn+1scVkq9qKeMQuK2sdmu/cEx42oaWK6S
	N1jdCtO55y2U3tM1IUtfdn37Xfb+FNwFMT5ZPhUK+Lu7KNv5bD4HD2AkwSl+1Yi+RDtfo4j
	1ATjVjUDcspetyQ9ZhCFT62j5moiXp+UFzqVV2Jf9MUPXNTYpnrf+6wh/F/siklkLUV7ayz
	ZW/RLdnPJmimvHkwJaj0+So60fSd8FKC+CKE+7tWLdE/tu9TGCEcn14CWM0tMWoweDttViQ
	8JZAJxOt9WyJeo4pxsbdUVHUpZvQweYlPUH+GMOdRX9dCx7x0bmqk8qgfRMNdepBJ+S3q15
	wR8496LRa7AIJ4Xs6hcjemXtBL7pbhm2BovRfv2RTh3YkvHICxxEqz3EcAh9jOpVOV4ZAu1
	0B9uDqBRgepjpETkFXWUGFA9OYj0vlr2BaQ8QZ9QwkrixIAOdqMu/R+U6SqTWPF7b0PvQ4v
	bF3x4V7kx+r0P/4UI/WGN6kd7QNXq8l1umO4/knN2SBgCayqHEi7zK7AtDIGcU33PtoBfyG
	bzOFUL7vgvAnXPRSlLYICJUlfjPGUkzzlBDabWnOx1Ak+gxcEu9ye3inXlp4L9HwuMScJL9
	Q9lPSmajQrkWdWcpGjPTy+R9lzYDX/7eh19cYc2jG9jsdbsVO+gvSw=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
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

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v3:
- use MASK macro in `recalc_rate` function
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
 drivers/i2c/busses/i2c-k1.c | 180 ++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 167 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index c8d115b58e449b59a38339b439190dcb0e332965..1382b6c257fa4ba4cf5098d684c1bbd5e2636fd4 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -797,7 +797,7 @@ config I2C_JZ4780
 config I2C_K1
 	tristate "SpacemiT K1 I2C adapter"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on OF
+	depends on OF && COMMON_CLK
 	help
 	  This option enables support for the I2C interface on the SpacemiT K1
 	  platform.
diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index b68a21fff0b56b59fe2032ccb7ca6953423aad32..34b22969cf6789e99de58dd93dda6f0951069f85 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -3,17 +3,20 @@
  * Copyright (C) 2024-2025 Troy Mitchell <troymitchell988@gmail.com>
  */
 
- #include <linux/clk.h>
- #include <linux/i2c.h>
- #include <linux/iopoll.h>
- #include <linux/module.h>
- #include <linux/of_address.h>
- #include <linux/platform_device.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
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
@@ -80,6 +83,19 @@
 #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
 #define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
 
+#define SPACEMIT_LCR_LV_STANDARD_SHIFT		0
+#define SPACEMIT_LCR_LV_FAST_SHIFT		9
+#define SPACEMIT_LCR_LV_STANDARD_WIDTH		9
+#define SPACEMIT_LCR_LV_FAST_WIDTH		9
+#define SPACEMIT_LCR_LV_STANDARD_MAX_VALUE	GENMASK(SPACEMIT_LCR_LV_STANDARD_WIDTH - 1, 0)
+#define SPACEMIT_LCR_LV_FAST_MAX_VALUE		GENMASK(SPACEMIT_LCR_LV_FAST_WIDTH - 1, 0)
+#define SPACEMIT_LCR_LV_STANDARD_MASK		GENMASK(SPACEMIT_LCR_LV_STANDARD_SHIFT +\
+						SPACEMIT_LCR_LV_STANDARD_WIDTH - 1,\
+						SPACEMIT_LCR_LV_STANDARD_SHIFT)
+#define SPACEMIT_LCR_LV_FAST_MASK		GENMASK(SPACEMIT_LCR_LV_FAST_SHIFT +\
+						SPACEMIT_LCR_LV_FAST_WIDTH - 1,\
+						SPACEMIT_LCR_LV_FAST_SHIFT)
+
 /* i2c bus recover timeout: us */
 #define SPACEMIT_I2C_BUS_BUSY_TIMEOUT		100000
 
@@ -95,11 +111,20 @@ enum spacemit_i2c_state {
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
@@ -120,6 +145,88 @@ struct spacemit_i2c_dev {
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
+				     unsigned long parent_rate)
+{
+	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
+	u32 lv, lcr, mask, shift, max_lv;
+
+	lv = DIV_ROUND_UP(parent_rate, rate);
+
+	if (i2c->mode == SPACEMIT_MODE_STANDARD) {
+		mask = SPACEMIT_LCR_LV_STANDARD_MASK;
+		shift = SPACEMIT_LCR_LV_STANDARD_SHIFT;
+		max_lv = SPACEMIT_LCR_LV_STANDARD_MAX_VALUE;
+	} else if (i2c->mode == SPACEMIT_MODE_FAST) {
+		mask = SPACEMIT_LCR_LV_FAST_MASK;
+		shift = SPACEMIT_LCR_LV_FAST_SHIFT;
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
+	lcr |= lv << shift;
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
+		lv = (lcr & SPACEMIT_LCR_LV_STANDARD_MASK) >>
+		     SPACEMIT_LCR_LV_STANDARD_SHIFT;
+	else if (i2c->mode == SPACEMIT_MODE_FAST)
+		lv = (lcr & SPACEMIT_LCR_LV_FAST_MASK) >>
+		     SPACEMIT_LCR_LV_FAST_SHIFT;
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
@@ -138,6 +245,27 @@ static void spacemit_i2c_disable(struct spacemit_i2c_dev *i2c)
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
@@ -224,7 +352,7 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 	 */
 	val |= SPACEMIT_CR_DRFIE;
 
-	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
+	if (i2c->mode == SPACEMIT_MODE_FAST)
 		val |= SPACEMIT_CR_MODE_FAST;
 
 	/* disable response to general call */
@@ -519,14 +647,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
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
+		dev_warn(i2c->dev, "invalid clock-frequency, using fast mode");
+		i2c->mode = SPACEMIT_MODE_FAST;
 		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
-	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
-		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
-			 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
-		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
 	}
 
 	i2c->dev = &pdev->dev;
@@ -548,10 +677,33 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
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


