Return-Path: <linux-i2c+bounces-7717-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F34049B918F
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 14:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 300551C2123B
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 13:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D7719F422;
	Fri,  1 Nov 2024 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyRXmGpE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E2A15F40B;
	Fri,  1 Nov 2024 13:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730466669; cv=none; b=XdsKm/WqqlGSrIZVOilRF7VLjbf9qXuE3f3HIXamj0nx4OhMWrd+4ocDUNpiF79fGH5rM1vg7SNqjwFDCIiot8Y45mEcdiPy1fqoA5uIuTtJAziIPEPiN3qKY9LB1rSUPr/Qc8aPANNYMNe3iTUSKCoWJgncWUpJh08PDsEZ5To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730466669; c=relaxed/simple;
	bh=wWxvL9Cky/sSQOL1Xs4C7q8ygEJH7e18YUvNw2xwr4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QFkUqxxiDW2HBvSl5sGB2xIaWIyDEAOA3M/uqkEDFchnlMwJFDqMUcs4mpEPk6Q2LW2iefv1Q5HC7jsZ7yzgVLk2lKfLzL/LgEQC/aJhFPyM8JmFZriiFS0HfoOo00YuoqAQLtIshokRe0GMUF9zobrny1qlQtV3PYrBCqxB+AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LyRXmGpE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730466668; x=1762002668;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wWxvL9Cky/sSQOL1Xs4C7q8ygEJH7e18YUvNw2xwr4M=;
  b=LyRXmGpEO3hEEIMxYmQP9OyeA6GH4Pl9mRjJLfM0v6+Al/5bLep6CCW2
   p4oMdhT/hNkzux55xDPQ7fINvxBoL0L0EqxNIcOd1kEbm3Z/OAm9u9gdL
   Z2QI71Cg1ZMAbJoFeat5kC9/RvGXoCgU/I3CQMrDX846SYIxwnBbPY34o
   M9n9Q8q9soGatp1Di9vkii2IKWc7ZKrQ8YScBVAvqPvYKh2grg7decIi7
   /szpejGQIF+iDYyNyuVvR2+c1nd5/MLzokzbquCKgnhQjwdue2gCAzPbH
   o3FgSIEUTn594sxiZhg3q6xiP59s+Jli+u31Mn43rNRyVN3N//WLAE1b6
   Q==;
X-CSE-ConnectionGUID: Nw473buhR9Oht1otMPedaw==
X-CSE-MsgGUID: +DI3GuYPQFmDphX+n5xQjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33920076"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33920076"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 06:11:07 -0700
X-CSE-ConnectionGUID: 714fhW0XTzqqPoIH6ULTug==
X-CSE-MsgGUID: Z2xegDoWSXmJLuhsLMTfag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="87753788"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 01 Nov 2024 06:11:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C068B2D3; Fri, 01 Nov 2024 15:11:04 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] i2c: busses: Use *-y instead of *-objs in Makefile
Date: Fri,  1 Nov 2024 15:11:03 +0200
Message-ID: <20241101131103.3679560-1-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/Makefile | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

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


