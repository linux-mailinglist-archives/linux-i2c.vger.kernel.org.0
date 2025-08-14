Return-Path: <linux-i2c+bounces-12292-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB4CB26073
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Aug 2025 11:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94D0F5C33A6
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Aug 2025 09:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD4A2ECE86;
	Thu, 14 Aug 2025 09:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="PBaItRcI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295D72EAD0D;
	Thu, 14 Aug 2025 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755162440; cv=none; b=DfXHXTWQ7hx9wk64ZzAem/0HENR5QbAomdRH/HLls8WxeYcEua+B0QNgm+2iAEC9nqA431qIdFYJp3Cucke/dRKstJXZhef1neCc9+X6wgwkg7fYG7K9Q3Y5pqvhrlNMvByNkdyzVoey4v7P39nJ9oq2nn2C8WHmkP1zIp8g2kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755162440; c=relaxed/simple;
	bh=v9gFTQYNMrlTALr414Xc6Xcn5vrVumGol8AQtpCDCo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QtpLV3eXtRMEBwoazlMK8me60G1D6x3S1SyqjouQqWIJ4LFAwPbS629ywWgpYs7lRATywQdCATdHVkatvwP7qWzrV+pQnxoz3djWnsq++b/L5dqQlEhNjKMMSzohlcwqSRjuOsB/IE6hDtKs3tBF9grS/I3/iG/5anYsYhm6QPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=PBaItRcI; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755162373;
	bh=S1dJP9k6COy3DGeBEyDHInXeqjgeK8QhDpkodX4mkg0=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=PBaItRcIcB2oYnb+T6jupCmcIL7xbKFhSTvzlI3dLglCMsTlkW54Jdv/6V0NWeQhI
	 EyKuw3d4g+hWHMlCAejPevRT3BEAIhuRcjOUemkW1UOsq3C8+DXoeBb9nXKlb2O9KB
	 AlvcdcAaklV98o1Vug9Rq3lEZVCGpGeIZhuwwX3g=
X-QQ-mid: zesmtpgz3t1755162367t2f9fcd99
X-QQ-Originating-IP: rwdMTuLNK2ES4qTu/goxpEcGs+VidmkLOYEXBYT73c0=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 14 Aug 2025 17:06:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14177102534845574766
EX-QQ-RecipientCnt: 7
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 14 Aug 2025 17:06:01 +0800
Subject: [PATCH v3] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-k1-i2c-ilcr-v3-1-317723e74bcd@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAPimnWgC/1XMyw6CMBCF4Vchs3ZIW0DQle9hWJRhkInc0iLBE
 N7dSty4/E9yvg08O2EP12gDx4t4GYcQySkCau3wYJQ6NBhlMpWrCz41iiGUjhyyTdKcVZEpm0J
 4TI4bWQ/tXoZuxc+jex/4Yr7rz9HFn7MY1FildC4andRU6Vsnw2uN/WSJe5ljGnso933/AH8Ju
 8SvAAAA
X-Change-ID: 20250709-k1-i2c-ilcr-ea347e0850a4
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755162366; l=10892;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=v9gFTQYNMrlTALr414Xc6Xcn5vrVumGol8AQtpCDCo8=;
 b=A3/XItlSoXz9XHRniFtY99VuIy7utyRo8INpTX/NpW8FP+SLbvCbjKd4DCEQx3nB3wLydxFgb
 bgW1MR5WWIqBnW/NOEvBArOVVI3dn7Gc8dK1eQBhxpagRodVEeWoz+L
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OeSI2pNiV9s9OnlTIiAYmqVGd0Svl0o3QNmyD9BTi5EUpV5eXH7ni3oa
	IctbBvDWRi/xN9bBWb9FUSrTLUA49d61gwSt8rFmVfbG4yP+VTwgOGSId2wY4pI1gOGRNcA
	s+5K83yAayKrRUp/hxCih7F9oAH0mymjiw7ugX/Q89s9CqAq78JYCI2V978ed1LYHXtacnC
	7CTQ7X276U3iSrIqfSxHoIwAfmj8uLtRErHkO0fKGTHCSczw56RejXnaN3Mk8yPQgYR3Kj7
	0oCOc4nvmEj7WXiWqFy3ZTdGI+rbn5arT4Frgdo1PgDyQysee078adRAsuGqKkbdFAB91Nn
	FjW0oINpFVqcQUc7f9FDsONSi3ss8VQbKF2sChiv+1sf3vuKupcdOQZLwTngkr8FlcbXpqv
	Y5Iz4J06F8ibYcuCIF4a30DSLGrkMPnfepWbL1XhyLpivlRL171kr9WKrBLQWdyrDZ/lLY2
	TYESfuhga37jnjpsP7nq+9EJxziLAuLrEq0gRb/DCTsjaoUec7DRB22itABfaHOoBWAEaBM
	k/gpimW7woJLEwifgPrGYFyBhy74qU2eAyLK5Gn1tPtlSo4cG0MFb5VQEF9RYFDoU7SkR8k
	bKJMGvfHjY5GcZzIMU/tMKuWrvr6ydzyYEyaRdJJfCZnXUETrllx7KoskcEFAO6ccj+80mG
	S0igVuTilmGKqgR6dSu2hHE4n3iIcLwBlgzbqFGitHmfSPgldTDmHSBJxSSPxQ+XmdOxSS6
	DtCT8OI5V2la8WFXDXKldEInz8iJ4s86PW+ig/4iF4e/mNrVr7NPpilFpDQ/jCHpbo2JV+L
	kFGXUUZkXHSpky5uzgbihlwWp8FdluiWMvTbUzCkhEv3P9TmGUugHmgp1nY0wGXZ23vruU9
	otpqoZYEMFhGSRUB58g/+2KXQ3dC6ZSIRgyfE7eJce8KYKPSFmesiWhXC7Eaeos8yS/XGbb
	LDG9d7b7CzqwNKOtDhbewjn45nti6+X3HVpVx9utYLDBJGcgB9rMXSTHbdiaw/l+wQLNqCv
	KeDsiSgfVFNAFwIpvpXYxrwGq8XnmQTOVSVqp0ntyqV+hVyHP43gTODIAa1Z27siljMxdDQ
	JEzs4rZMT3p52YuuJCS5vvheJwixy+Vkrq/c7iWea+tvLtPVAK9EX0ys84CcRcoKyFWkAdq
	dhrxdv1pbojgad4HaSbLz/A21BsFy7nqPOz2
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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


