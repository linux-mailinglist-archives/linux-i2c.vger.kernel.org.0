Return-Path: <linux-i2c+bounces-6638-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABCF977061
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D740284E4D
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170931C1AA7;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+YSqrPx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EBE1BF81D;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165215; cv=none; b=NmaMlITp6AkVaz4rqq7JSmY6EsII9eIOfMBPYbttmR/g2GbTDaKMcSfZEAVFoi/55HjeZZ/Pqv5cqgZhS0TQQuhVexNbJo9hbG6S3rkUId6RwM2b1ESspdwP+Migs/jvvZa7FdOrTXu+7JhxyyeqSQT0zYxXaGVIlBpl5f2FAJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165215; c=relaxed/simple;
	bh=WvuwUE3VkVrJz1HbbjLyC5fbTxNBjf8aLWKIvGiS8ZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EW5eWXp0syqFGbLuQD5mYCf5p2QVKIIQZrcvpXWPIThRipgra60Tq0rK8YntVTH47641ksq3CfFJT5nj/X768wXUCEwDEB0qaYF7OcasRaQ8Xch8w68lvNMLT9OIbp24KoaIjujytt7i1KUYvviEdZDdXkXJTQKc5ttcotcKzpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+YSqrPx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BC91C4CEDA;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165215;
	bh=WvuwUE3VkVrJz1HbbjLyC5fbTxNBjf8aLWKIvGiS8ZI=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=b+YSqrPxZMaWAWsU7bwfST26nLi93Ml85js3T7Ir1g2oMK7q33Lmw8NbN/YkR1fLv
	 S3Ajsi1PYZH22+NgsRDq13/lFT4WEzn1cPZIF1oukpRfpwHp+uDk5HkhC4bLQ3p0tb
	 8aL3QRCQaZ1U30kHN2FjT7GSIZyzjSvvWSH9u+5mwpWRLEu3HWLkl4qLBNQs+hzYr0
	 xkOLjgIUp7P5MqZh8C2Jk+dhmHPMwaII8ibWBMwesssmZEpzs01+Tk1RGpPJHGpTtD
	 +jErwxUBqSZVALuJlGvl/Y6xojm3IObwvs5v6HlzvDThMHw0lXZD6E41BYCKXNVyVL
	 GVH5SLLgTFMnw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1369DEEE240;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:24:50 +0100
Subject: [PATCH 05/21] clock:Add driver for ADI ADSP-SC5xx PLL
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-5-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
In-Reply-To: <20240912-test-v1-0-458fa57c8ccf@analog.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Greg Malysa <greg.malysa@timesys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Utsav Agarwal <Utsav.Agarwal@analog.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-serial@vger.kernel.org, 
 Arturs Artamonovs <arturs.artamonovs@analog.com>, adsp-linux@analog.com, 
 Arturs Artamonovs <Arturs.Artamonovs@analog.com>, 
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=7757;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=kKwWyaM2Blr339gT53LjtoBsxg/6T1Q1BsxHjj63Pk0=;
 b=J7Br682QHi9UgPDIRSCY68wh2/Zg7TIwYyngp7ewWcshD/o13+AQ7Ebd+zKvBFcOqD1LLjSHb
 obWccR+jIskA5qWU4GP7vAE8q8I9icPmqNtPJy6OZA0E52BtDddhgpK
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Implements clock tree, no dynamic pll rate change.

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 drivers/clk/adi/clk-adi-pll.c | 151 ++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/adi/clk.h         |  99 +++++++++++++++++++++++++++
 2 files changed, 250 insertions(+)

diff --git a/drivers/clk/adi/clk-adi-pll.c b/drivers/clk/adi/clk-adi-pll.c
new file mode 100644
index 0000000000000000000000000000000000000000..39fcc78b3170c0aa5962af5268f499082efb3686
--- /dev/null
+++ b/drivers/clk/adi/clk-adi-pll.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CGU PLL driver for ADI SC59X processors
+ *
+ * Copyright 2022-2024 - Analog Devices Inc.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+
+#include "clk.h"
+
+struct clk_sc5xx_cgu_pll {
+	struct clk_hw hw;
+	void __iomem *base;
+	spinlock_t *lock;
+	int prepared;
+	u32 mask;
+	u32 msel;
+	u32 m_offset;
+	u8 shift;
+};
+
+struct clk_sc5xx_cgu_pll *to_clk_sc5xx_cgu_pll(struct clk_hw *hw)
+{
+	return container_of(hw, struct clk_sc5xx_cgu_pll, hw);
+}
+
+static long sc5xx_cgu_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+	unsigned long *parent_rate)
+{
+	struct clk_sc5xx_cgu_pll *pll = to_clk_sc5xx_cgu_pll(hw);
+	unsigned long m, m2, new_rate, nr2, prate2;
+	unsigned long prate = *parent_rate;
+	struct clk_hw *parent_hw;
+	int parent_inc;
+
+	parent_hw = clk_hw_get_parent(hw);
+
+	m = rate / prate;
+
+	if (m > pll->msel) {
+		/* cannot scale this far, need bigger input */
+		parent_inc = m / pll->msel;
+		prate = clk_hw_round_rate(parent_hw, prate * (parent_inc + 1));
+	} else if (m == 0) {
+		pr_err("%s: Cannot use VCO to reduce parent clock rate, requested %lu, clamping to %lu\n",
+			__func__, rate, prate);
+		return prate;
+	}
+
+	new_rate = prate * m;
+
+	if (new_rate != rate) {
+		/*
+		 * Check if we could get an integer match by halving parent rate since we
+		 * know at least about the DF bit before the VCO, although we don't know
+		 * if we're already using it or not
+		 */
+		prate2 = clk_hw_round_rate(parent_hw, prate / 2);
+		m2 = rate / prate2;
+		nr2 = prate * m2;
+		if (m2 <= pll->msel && nr2 == rate) {
+			m = m2;
+			new_rate = nr2;
+			prate = prate2;
+		}
+	}
+
+	*parent_rate = prate;
+	return new_rate;
+}
+
+static unsigned long sc5xx_cgu_pll_recalc_rate(struct clk_hw *hw,
+	unsigned long parent_rate)
+{
+	struct clk_sc5xx_cgu_pll *pll = to_clk_sc5xx_cgu_pll(hw);
+	u32 reg = readl(pll->base);
+	u32 m = ((reg & pll->mask) >> pll->shift) + pll->m_offset;
+
+	if (m == 0)
+		m = pll->msel;
+
+	return parent_rate * m;
+
+}
+
+static int sc5xx_cgu_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+	unsigned long parent_rate)
+{
+	struct clk_sc5xx_cgu_pll *pll = to_clk_sc5xx_cgu_pll(hw);
+	u32 m;
+
+	m = (rate / parent_rate) - pll->m_offset;
+
+	if (m >= pll->msel)
+		m = 0;
+
+	/* reminder for implementation: lock around read/modify to control reg */
+	pr_err("%s: set_rate not permitted yet, but we would write %d to m\n", __func__,
+		m);
+	return -ENOENT;
+}
+
+static const struct clk_ops clk_sc5xx_cgu_pll_ops = {
+	.recalc_rate = sc5xx_cgu_pll_recalc_rate,
+	.round_rate = sc5xx_cgu_pll_round_rate,
+	.set_rate = sc5xx_cgu_pll_set_rate,
+};
+
+struct clk *sc5xx_cgu_pll(const char *name, const char *parent_name,
+	void __iomem *base, u8 shift, u8 width, u32 m_offset,
+		spinlock_t *lock)
+{
+	struct clk_sc5xx_cgu_pll *pll;
+	struct clk *clk;
+	struct clk_init_data init;
+
+	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.flags = CLK_SET_RATE_PARENT;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+	init.ops = &clk_sc5xx_cgu_pll_ops;
+
+	pll->base = base;
+	pll->hw.init = &init;
+	pll->lock = lock;
+	pll->shift = shift;
+	pll->mask = GENMASK(width-1, 0) << shift;
+	pll->msel = pll->mask + 1;
+	pll->m_offset = m_offset;
+
+	clk = clk_register(NULL, &pll->hw);
+	if (IS_ERR(clk)) {
+		pr_err("%s: Failed to register, code %lu\n", __func__,
+			PTR_ERR(clk));
+	}
+
+	return clk;
+}
+
+MODULE_DESCRIPTION("Analog Devices CLock PLL driver");
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Greg Malysa <greg.malysa@timesys.com>");
+
diff --git a/drivers/clk/adi/clk.h b/drivers/clk/adi/clk.h
new file mode 100644
index 0000000000000000000000000000000000000000..e17aa719c2170149a6a1a60dd4390a29f06e7296
--- /dev/null
+++ b/drivers/clk/adi/clk.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Clock support for ADI processors
+ *
+ * Copyright 2022-2024 - Analog Devices Inc.
+ */
+
+#ifndef CLK_ADI_CLK_H
+#define CLK_ADI_CLK_H
+
+#include <linux/clk.h>
+
+#define CGU_CTL         0x00
+#define CGU_PLLCTL      0x04
+#define CGU_STAT        0x08
+#define CGU_DIV         0x0C
+#define CGU_CLKOUTSEL   0x10
+#define CGU_OSCWDCTL    0x14
+#define CGU_TSCTL       0x18
+#define CGU_TSVALUE0    0x1C
+#define CGU_TSVALUE1    0x20
+#define CGU_TSCOUNT0    0x24
+#define CGU_TSCOUNT1    0x28
+#define CGU_CCBF_DIS    0x2C
+#define CGU_CCBF_STAT   0x30
+#define CGU_SCBF_DIS    0x38
+#define CGU_SCBF_STAT   0x3C
+#define CGU_DIVEX       0x40
+#define CGU_REVID       0x48
+
+#define CDU_CFG0     0x00
+#define CDU_CFG1     0x04
+#define CDU_CFG2     0x08
+#define CDU_CFG3     0x0C
+#define CDU_CFG4     0x10
+#define CDU_CFG5     0x14
+#define CDU_CFG6     0x18
+#define CDU_CFG7     0x1C
+#define CDU_CFG8     0x20
+#define CDU_CFG9     0x24
+#define CDU_CFG10    0x28
+#define CDU_CFG11    0x2C
+#define CDU_CFG12    0x30
+#define CDU_CFG13    0x34
+#define CDU_CFG14    0x38
+
+#define PLL3_OFFSET 0x2c
+
+#define CDU_CLKINSEL 0x44
+
+#define CGU_MSEL_SHIFT 8
+#define CGU_MSEL_WIDTH 7
+
+#define PLL3_MSEL_SHIFT 4
+#define PLL3_MSEL_WIDTH 7
+
+#define CDU_MUX_SIZE 4
+#define CDU_MUX_SHIFT 1
+#define CDU_MUX_WIDTH 2
+#define CDU_EN_BIT 0
+
+struct clk_sc5xx_cgu_pll *to_clk_sc5xx_cgu_pll(struct clk_hw *hw);
+
+struct clk *sc5xx_cgu_pll(const char *name, const char *parent_name,
+	void __iomem *base, u8 shift, u8 width, u32 m_offset, spinlock_t *lock);
+
+/**
+ * All CDU clock muxes are the same size
+ */
+static inline struct clk *cdu_mux(const char *name, void __iomem *reg,
+	const char * const *parents, spinlock_t *cdu_lock)
+{
+	return clk_register_mux(NULL, name, parents, CDU_MUX_SIZE,
+		CLK_SET_RATE_PARENT, reg, CDU_MUX_SHIFT, CDU_MUX_WIDTH, 0,
+		cdu_lock);
+}
+
+static inline struct clk *cgu_divider(const char *name, const char *parent,
+	void __iomem *reg, u8 shift, u8 width, u8 extra_flags, spinlock_t *cdu_lock)
+{
+	return clk_register_divider(NULL, name, parent, CLK_SET_RATE_PARENT,
+		reg, shift, width, CLK_DIVIDER_MAX_AT_ZERO | extra_flags, cdu_lock);
+}
+
+static inline struct clk *cdu_gate(const char *name, const char *parent,
+	void __iomem *reg, u32 flags, spinlock_t *cdu_lock)
+{
+	return clk_register_gate(NULL, name, parent, CLK_SET_RATE_PARENT | flags,
+		reg, CDU_EN_BIT, 0, cdu_lock);
+}
+
+static inline struct clk *cgu_gate(const char *name, const char *parent,
+	void __iomem *reg, u8 bit, spinlock_t *cdu_lock)
+{
+	return clk_register_gate(NULL, name, parent, CLK_SET_RATE_PARENT, reg, bit,
+		CLK_GATE_SET_TO_DISABLE, cdu_lock);
+}
+
+#endif

-- 
2.25.1



