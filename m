Return-Path: <linux-i2c+bounces-15144-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 404C7D1D14C
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 09:22:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C2B733024F7F
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 08:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADB437BE64;
	Wed, 14 Jan 2026 08:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQdJaxf4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D3037F113;
	Wed, 14 Jan 2026 08:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768378808; cv=none; b=nh0eGTE+wwzSMLTZh4CNaKFImwLdA+hwf8SkVYZwvo+1j9nGjrew80uTsBSQvqEcHDHJIB8kXHxom+x5cRn7Apt3HYhxhPSzAb7juZ3xcc4gg23a1f/0+64FfQamH19C/LBQ/2uoLBSW588jeiBBQ0n6lZrU8j/r+KU4ViAmI3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768378808; c=relaxed/simple;
	bh=GT5HmCAZ6dh6XeFOBC3Z6TVXmDJ2gi/nEihxD5w2ojA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mAfvyM7gE7FbZd4r3EGTdTQFmgKAYu58xfI+x7dp0qEknmfx6RJYBOzz0F2hki3YYCLpMqDUecB+WOalxpNJf3rVRNw+U/qVjM26K1xDnrL98U/aE57gIwHkq4KVmFHC3IqWYKsbfpD0SyiDEEBGHkk2eEHVIXR83Kov9k09MlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQdJaxf4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768378803; x=1799914803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GT5HmCAZ6dh6XeFOBC3Z6TVXmDJ2gi/nEihxD5w2ojA=;
  b=CQdJaxf4SXKPl/jxnI0mRD7BfLkF+H+ugoYndjydrQk5NVt8b5cWKP3H
   MstdAPq4GlZjmEUVJLpc4lcmU4opF0mgkGJootM3hmUh+MOpE1Ty7v5pv
   zziMD0K6IMAKlzhV7cxcMfTaXb9qBloIT/85qO3c4I7QPiuWh0qiPFZgh
   JtPbQZYRCRPF4mP0XLhSkksEhh49UsumQ8KFIqb1pr/MxvEOVO7z2I8J9
   3EbwjnrivA0OQofSGhp+4jsjSKfx6xGzk4NO6yv2zzdh0ejhC+tTriyn5
   EwYJ4gRw104wpDCAwGa4NwdZeDifPngxGg0AP+CPlVmJvNR3eUpWIDpCD
   g==;
X-CSE-ConnectionGUID: L510ANHBQHSdlUQF5AUlDw==
X-CSE-MsgGUID: MQYbNEplSt+S/qUE41gaow==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73513052"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="73513052"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:19:59 -0800
X-CSE-ConnectionGUID: 53hSZIwaSBGkrgH9uZNH9g==
X-CSE-MsgGUID: VPSgyxmKRCq+UljWlhUcZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204627059"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 14 Jan 2026 00:19:58 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id EC98399; Wed, 14 Jan 2026 09:19:55 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>
Subject: [PATCH v1 1/2] i2c: designware: Remove not-going-to-be-supported code for Baikal SoC
Date: Wed, 14 Jan 2026 09:17:50 +0100
Message-ID: <20260114081954.252160-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260114081954.252160-1-andriy.shevchenko@linux.intel.com>
References: <20260114081954.252160-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As noticed in the discussion [1] the Baikal SoC and platforms
are not going to be finalized, hence remove stale code.

Link: https://lore.kernel.org/lkml/22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org/ [1]
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/Kconfig                  |  1 -
 drivers/i2c/busses/i2c-designware-core.h    |  1 -
 drivers/i2c/busses/i2c-designware-platdrv.c | 68 ---------------------
 3 files changed, 70 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 860812e224a0..e11d50750e63 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -580,7 +580,6 @@ if I2C_DESIGNWARE_CORE
 config I2C_DESIGNWARE_PLATFORM
 	tristate "Synopsys DesignWare Platform driver"
 	depends on (ACPI && COMMON_CLK) || !ACPI
-	select MFD_SYSCON if MIPS_BAIKAL_T1
 	default I2C_DESIGNWARE_CORE
 	help
 	  If you say yes to this option, support will be included for the
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 2a7decc24931..cf0364079b55 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -314,7 +314,6 @@ struct dw_i2c_dev {
 #define ACCESS_POLLING				BIT(3)
 
 #define MODEL_MSCC_OCELOT			BIT(8)
-#define MODEL_BAIKAL_BT1			BIT(9)
 #define MODEL_AMD_NAVI_GPU			BIT(10)
 #define MODEL_WANGXUN_SP			BIT(11)
 #define MODEL_MASK				GENMASK(11, 8)
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 077b34535ec7..2e532f16691b 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -37,70 +37,6 @@ static u32 i2c_dw_get_clk_rate_khz(struct dw_i2c_dev *dev)
 	return clk_get_rate(dev->clk) / HZ_PER_KHZ;
 }
 
-#ifdef CONFIG_OF
-#define BT1_I2C_CTL			0x100
-#define BT1_I2C_CTL_ADDR_MASK		GENMASK(7, 0)
-#define BT1_I2C_CTL_WR			BIT(8)
-#define BT1_I2C_CTL_GO			BIT(31)
-#define BT1_I2C_DI			0x104
-#define BT1_I2C_DO			0x108
-
-static int bt1_i2c_read(void *context, unsigned int reg, unsigned int *val)
-{
-	struct dw_i2c_dev *dev = context;
-	int ret;
-
-	/*
-	 * Note these methods shouldn't ever fail because the system controller
-	 * registers are memory mapped. We check the return value just in case.
-	 */
-	ret = regmap_write(dev->sysmap, BT1_I2C_CTL,
-			   BT1_I2C_CTL_GO | (reg & BT1_I2C_CTL_ADDR_MASK));
-	if (ret)
-		return ret;
-
-	return regmap_read(dev->sysmap, BT1_I2C_DO, val);
-}
-
-static int bt1_i2c_write(void *context, unsigned int reg, unsigned int val)
-{
-	struct dw_i2c_dev *dev = context;
-	int ret;
-
-	ret = regmap_write(dev->sysmap, BT1_I2C_DI, val);
-	if (ret)
-		return ret;
-
-	return regmap_write(dev->sysmap, BT1_I2C_CTL,
-			    BT1_I2C_CTL_GO | BT1_I2C_CTL_WR | (reg & BT1_I2C_CTL_ADDR_MASK));
-}
-
-static const struct regmap_config bt1_i2c_cfg = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.reg_stride = 4,
-	.fast_io = true,
-	.reg_read = bt1_i2c_read,
-	.reg_write = bt1_i2c_write,
-	.max_register = DW_IC_COMP_TYPE,
-};
-
-static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
-{
-	dev->sysmap = syscon_node_to_regmap(dev->dev->of_node->parent);
-	if (IS_ERR(dev->sysmap))
-		return PTR_ERR(dev->sysmap);
-
-	dev->map = devm_regmap_init(dev->dev, NULL, dev, &bt1_i2c_cfg);
-	return PTR_ERR_OR_ZERO(dev->map);
-}
-#else
-static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
-{
-	return -ENODEV;
-}
-#endif
-
 static int dw_i2c_get_parent_regmap(struct dw_i2c_dev *dev)
 {
 	dev->map = dev_get_regmap(dev->dev->parent, NULL);
@@ -127,9 +63,6 @@ static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
 		return dw_i2c_get_parent_regmap(dev);
 
 	switch (dev->flags & MODEL_MASK) {
-	case MODEL_BAIKAL_BT1:
-		ret = bt1_i2c_request_regs(dev);
-		break;
 	case MODEL_WANGXUN_SP:
 		ret = dw_i2c_get_parent_regmap(dev);
 		break;
@@ -334,7 +267,6 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dw_i2c_of_match[] = {
-	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
 	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
 	{ .compatible = "snps,designware-i2c" },
 	{}
-- 
2.50.1


