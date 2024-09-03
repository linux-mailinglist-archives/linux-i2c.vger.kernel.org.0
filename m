Return-Path: <linux-i2c+bounces-6029-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C2596A05E
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 16:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 249631C235D2
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 14:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3243A14A4E0;
	Tue,  3 Sep 2024 14:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAGRW78C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582EE13C906;
	Tue,  3 Sep 2024 14:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373519; cv=none; b=aYX9DQMkvcHeyiPvFYE8x58b2WCvr5KaSNvCuW8RL+t/hrf8gqI5RviQaOi3SgysmZpwu8XbNAKm+ArFbaGL/IttzOpzngIlgt1MLPYauzr0WSOjo9whsc8QcrXmYcWvfgp0ZDpTI+3uo3eoR6nCF8iLx6Zz0aOXW7x5GvP65uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373519; c=relaxed/simple;
	bh=/NH32SjYt0sPBumAG45T8HQXhATIwv180H+ycCI81Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gOo44qTDIhGcFbxYWnEPlCixOa3r0mYChkWCWoO6eAMB/lI1yM31Gq4g13oegWeC4e8a4SEQ9P6i/5bRbcMBM4cColS4tU0t7cMUzNYQD64W6svhJ/u2wnKtiEsB/06vNjPTdv7Fn3I4cgsZtfhaIwLrEwZN4qEfLQnokqcvpq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GAGRW78C; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725373517; x=1756909517;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/NH32SjYt0sPBumAG45T8HQXhATIwv180H+ycCI81Ok=;
  b=GAGRW78CdkGuaM3ooZmJS17zaTW8A+VDurBc2iKTADeKg9pUVCRe89st
   rqFPKD0XWpJ8OQdBSy+aJ1f7BMVfGxO22MVRxsWI5Ri0MGZsjNyxbL3IW
   u501PSnd3seTOkhvUdH6+KZfpp5xfsV0r+Fea0+8/6PonmK9x4KCyNitb
   8EcyHj8yyq1T56x2YdtcIa4pfLvSDQuIJb0Kqd7U/ucvW0MNEkCqjF2JZ
   6pol8Sh19Iqc2xCuvRwend9O5tZ15L/tZTrGvpowvlJ+Ym6DVOk/q3ZHE
   ldr3KK7Rtf4PuHUm30Velj0E9IGhYjRG09VWYvgmtyiRPPKPsqrblvhCW
   w==;
X-CSE-ConnectionGUID: 8ucCiS08S7m1lFPKoDnsFA==
X-CSE-MsgGUID: 0IGoRwZWTB6d/fQLRx2zJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23541270"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23541270"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 07:25:17 -0700
X-CSE-ConnectionGUID: edDhvotLQcuRWt0gndB0oA==
X-CSE-MsgGUID: XnjOQGn9QLSWQ7JPMnCOLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65658816"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 03 Sep 2024 07:25:14 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH v2 1/7] ARC: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
Date: Tue,  3 Sep 2024 17:25:00 +0300
Message-ID: <20240903142506.3444628-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
References: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dependency handling of the Synopsys DesignWare I2C
adapter drivers is going to be changed so that the glue
drivers for the PCI and platform buses depend on
I2C_DESIGNWARE_CORE.

Cc: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 arch/arc/configs/axs101_defconfig     | 1 +
 arch/arc/configs/axs103_defconfig     | 1 +
 arch/arc/configs/axs103_smp_defconfig | 1 +
 arch/arc/configs/tb10x_defconfig      | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index 89720d6d7e0d..319bbe270322 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -66,6 +66,7 @@ CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 # CONFIG_HWMON is not set
 CONFIG_DRM=m
diff --git a/arch/arc/configs/axs103_defconfig b/arch/arc/configs/axs103_defconfig
index 73ec01ed0492..8c1f1a111a17 100644
--- a/arch/arc/configs/axs103_defconfig
+++ b/arch/arc/configs/axs103_defconfig
@@ -66,6 +66,7 @@ CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
index 4da0f626fa9d..75cab9f25b5b 100644
--- a/arch/arc/configs/axs103_smp_defconfig
+++ b/arch/arc/configs/axs103_smp_defconfig
@@ -66,6 +66,7 @@ CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 # CONFIG_HWMON is not set
 CONFIG_DRM=m
diff --git a/arch/arc/configs/tb10x_defconfig b/arch/arc/configs/tb10x_defconfig
index 1a68e4beebca..5aba3d850fa2 100644
--- a/arch/arc/configs/tb10x_defconfig
+++ b/arch/arc/configs/tb10x_defconfig
@@ -60,6 +60,7 @@ CONFIG_SERIAL_8250_DW=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
 # CONFIG_I2C_COMPAT is not set
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_GPIO_SYSFS=y
 # CONFIG_HWMON is not set
-- 
2.45.2


