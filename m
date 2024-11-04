Return-Path: <linux-i2c+bounces-7748-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDC79BB157
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 11:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 328CC1F212A0
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 10:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60321B394F;
	Mon,  4 Nov 2024 10:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JCpLU4iR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F385F1B21BB;
	Mon,  4 Nov 2024 10:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730716780; cv=none; b=Cv/wbMHaiSwufHmeG7NWXQUxM92nzVza3XTaekIKI4kbj29Otf0q63mo52Oh1ioRvmrrHdSJ/nA8Vl+q/2+d0omEQwrXuWtxEQuishi/ZgYPw4fbu3fR7VSNhz5ePiO8U4jhRPB6qlvZjy499h1TsnpZ0HV0s8YF6brNITpkZOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730716780; c=relaxed/simple;
	bh=fBXzj1gE+DIjX126NLyVI6qZpeF/TV60Xeo+GRcG8dw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lIAxVSnJlQPztI6RMRYwxAmjgyTUGs5dsWb1UoJVwJi9tH44TL0B/9gB4oTfwikOLZsxvhKnzpJbgaT5830lgiPhy6EBhFEn+eulVTudFKXyQ2UNndFGVmOx8SfhzAz8mNPBnnKysM3mVs0ADolTFE7nMOhBuJHi9ieKzXHvreI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JCpLU4iR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730716779; x=1762252779;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fBXzj1gE+DIjX126NLyVI6qZpeF/TV60Xeo+GRcG8dw=;
  b=JCpLU4iRQBW0gOnQnm+9BoB7wAwtbO35Br4lvgLvHhD1Imeig5E3pafi
   n5FqZ/NLQBsLrVQWZTgFu8Sd7uw9zwT/85WXhGtDHR9CbhdN4MllmQDVs
   s3tVQ1ylgbajIsVwyNJPOmPuKRgL01UM8U3USBeRzxPs4qZW+qQstAIpV
   OmJGxYV4c4knqd82YUmrIP+57yEdwWgRI4v2hinILyuQgT1uPrlUiBfFf
   DVdzXRuNkq4CF0T2Cd86GF5iV64LOC5a6bD4ZEVIQqKec3/q+wIPMCv02
   22H0x4YNsenWg8L8FuUDZoXqeMVpw6T1UO+Bebdbu49h0h4KRRNuLpkGv
   g==;
X-CSE-ConnectionGUID: tEJc9ze1ShaGpvb+T2KETQ==
X-CSE-MsgGUID: VLN31vOtQiKAuS1/efkT8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="34194931"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="34194931"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 02:39:38 -0800
X-CSE-ConnectionGUID: pjyZ02n3TEK0bbmyU/dEFw==
X-CSE-MsgGUID: uZlUolr7SASwuURFFkGckQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83291663"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 04 Nov 2024 02:39:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 912811C4; Mon, 04 Nov 2024 12:39:35 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] i2c: busses: Use *-y instead of *-objs in Makefile
Date: Mon,  4 Nov 2024 12:39:14 +0200
Message-ID: <20241104103935.195988-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: I2C_AT91_SLAVE_EXPERIMENTAL has to be boolean (LKP)
 drivers/i2c/busses/Kconfig  |  4 ++--
 drivers/i2c/busses/Makefile | 12 +++++-------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index bf79628a789d..20a8c88e854a 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -431,7 +431,7 @@ config I2C_AT91
 	  are facing this situation, use the i2c-gpio driver.
 
 config I2C_AT91_SLAVE_EXPERIMENTAL
-	tristate "Microchip AT91 I2C experimental slave mode"
+	bool "Microchip AT91 I2C experimental slave mode"
 	depends on I2C_AT91
 	select I2C_SLAVE
 	help
@@ -440,7 +440,7 @@ config I2C_AT91_SLAVE_EXPERIMENTAL
 	  been tested in a heavy way, help wanted.
 	  There are known bugs:
 	    - It can hang, on a SAMA5D4, after several transfers.
-	    - There are some mismtaches with a SAMA5D4 as slave and a SAMA5D2 as
+	    - There are some mismatches with a SAMA5D4 as slave and a SAMA5D2 as
 	    master.
 
 config I2C_AU1550
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 613ec59502c8..bf2d76e055c5 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -39,10 +39,8 @@ obj-$(CONFIG_I2C_AMD_MP2)	+= i2c-amd-mp2-pci.o i2c-amd-mp2-plat.o
 obj-$(CONFIG_I2C_AMD_ASF)	+= i2c-amd-asf-plat.o
 obj-$(CONFIG_I2C_ASPEED)	+= i2c-aspeed.o
 obj-$(CONFIG_I2C_AT91)		+= i2c-at91.o
-i2c-at91-objs			:= i2c-at91-core.o i2c-at91-master.o
-ifeq ($(CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL),y)
-	i2c-at91-objs		+= i2c-at91-slave.o
-endif
+i2c-at91-y			:= i2c-at91-core.o i2c-at91-master.o
+i2c-at91-$(CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL)	+= i2c-at91-slave.o
 obj-$(CONFIG_I2C_AU1550)	+= i2c-au1550.o
 obj-$(CONFIG_I2C_AXXIA)		+= i2c-axxia.o
 obj-$(CONFIG_I2C_BCM2835)	+= i2c-bcm2835.o
@@ -111,8 +109,8 @@ obj-$(CONFIG_I2C_SIMTEC)	+= i2c-simtec.o
 obj-$(CONFIG_I2C_SPRD)		+= i2c-sprd.o
 obj-$(CONFIG_I2C_ST)		+= i2c-st.o
 obj-$(CONFIG_I2C_STM32F4)	+= i2c-stm32f4.o
-i2c-stm32f7-drv-objs := i2c-stm32f7.o i2c-stm32.o
 obj-$(CONFIG_I2C_STM32F7)	+= i2c-stm32f7-drv.o
+i2c-stm32f7-drv-y		:= i2c-stm32f7.o i2c-stm32.o
 obj-$(CONFIG_I2C_SUN6I_P2WI)	+= i2c-sun6i-p2wi.o
 obj-$(CONFIG_I2C_SYNQUACER)	+= i2c-synquacer.o
 obj-$(CONFIG_I2C_TEGRA)		+= i2c-tegra.o
@@ -121,10 +119,10 @@ obj-$(CONFIG_I2C_UNIPHIER)	+= i2c-uniphier.o
 obj-$(CONFIG_I2C_UNIPHIER_F)	+= i2c-uniphier-f.o
 obj-$(CONFIG_I2C_VERSATILE)	+= i2c-versatile.o
 obj-$(CONFIG_I2C_WMT)		+= i2c-viai2c-wmt.o i2c-viai2c-common.o
-i2c-octeon-objs := i2c-octeon-core.o i2c-octeon-platdrv.o
 obj-$(CONFIG_I2C_OCTEON)	+= i2c-octeon.o
-i2c-thunderx-objs := i2c-octeon-core.o i2c-thunderx-pcidrv.o
+i2c-octeon-y			:= i2c-octeon-core.o i2c-octeon-platdrv.o
 obj-$(CONFIG_I2C_THUNDERX)	+= i2c-thunderx.o
+i2c-thunderx-y			:= i2c-octeon-core.o i2c-thunderx-pcidrv.o
 obj-$(CONFIG_I2C_XILINX)	+= i2c-xiic.o
 obj-$(CONFIG_I2C_XLP9XX)	+= i2c-xlp9xx.o
 obj-$(CONFIG_I2C_RCAR)		+= i2c-rcar.o
-- 
2.43.0.rc1.1336.g36b5255a03ac


