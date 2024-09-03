Return-Path: <linux-i2c+bounces-6030-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E25396A060
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 16:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 330711F25A8A
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 14:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9C8156972;
	Tue,  3 Sep 2024 14:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSfNPfH8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1F7154BFC;
	Tue,  3 Sep 2024 14:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373522; cv=none; b=EwgZIzM7scnAIw+V1tTT6r1xJ54oEqFASQ1C7TD6Hkc8cPrE74LXnjHsUu2ZsWsDviCLTpTURNKAxTgsCReY5ec5st2W77raTU2Na8ojWrwL4Cvf64U5ow5DJNSvbI7xVPO6+OvBwYK400Jr6uMYXxmReLMGrfXFjZSoy5PZ6yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373522; c=relaxed/simple;
	bh=N+ztKGxEoqoGG92EUZtMJ7GeCha38X8P/R+k1UAvCx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SlCF47io3V4028pnvwaXtUAsQZ8Ocen6w8UAKjd9keAGNOvgsf5r+cNaNkmaVzyPHCy0jU7+53jrMkA8Mo2N0mgC4vln9Dq5MI2lbyz0sKhRb+GOi80U89K0W+mLp8QgxnCDQo5YYLkVvLI7e5T+6TiHuSXWmH+HYhwXGQXjQOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSfNPfH8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725373520; x=1756909520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N+ztKGxEoqoGG92EUZtMJ7GeCha38X8P/R+k1UAvCx8=;
  b=mSfNPfH8x4uyviwZpeeIdUtrPGCC3VM8gRKg8w2vABoBpwd9YeJsWxYR
   5eUD/4zfr6lAP8UtvjJOoerQMbRvhZAAdoV8DpAW1uKkaY2TbThhRmbFD
   Ix4RJxPPYDwOjmGGElJlvG3JOBA34v6vK9aldr11qUWooRwTeEXXzkfgt
   LBA2VqqXgbcwaoDsWVJ6Nfyw2O3hMnMCUrthXE+vlB5vTcsPwvwPI+5+Z
   yOdhWHSqery5ahYsBjzANPjH04QoAaqVxkV9Czwr42Y+eg/zWF+2ePXgJ
   yAr11BN0Q8Kzhtzf0btfU4SsGJk/jUuOmWdrTRV3Iegk0B/3QCkZ66oBu
   Q==;
X-CSE-ConnectionGUID: vvBEygscR+6rYaWjfU4dCg==
X-CSE-MsgGUID: 2Fb5/6hFTX69Xw7vrcif0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23541284"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23541284"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 07:25:20 -0700
X-CSE-ConnectionGUID: 5rLRW7gLSbmueDDcnaJfgw==
X-CSE-MsgGUID: 1AlL5Y6KR1qm7aYQCUaEUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65658823"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 03 Sep 2024 07:25:17 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/7] ARM: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
Date: Tue,  3 Sep 2024 17:25:01 +0300
Message-ID: <20240903142506.3444628-3-heikki.krogerus@linux.intel.com>
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

Cc: Russell King <linux@armlinux.org.uk>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 arch/arm/configs/hisi_defconfig      | 1 +
 arch/arm/configs/multi_v7_defconfig  | 1 +
 arch/arm/configs/pxa_defconfig       | 1 +
 arch/arm/configs/socfpga_defconfig   | 1 +
 arch/arm/configs/spear13xx_defconfig | 1 +
 arch/arm/configs/spear3xx_defconfig  | 1 +
 arch/arm/configs/spear6xx_defconfig  | 1 +
 7 files changed, 7 insertions(+)

diff --git a/arch/arm/configs/hisi_defconfig b/arch/arm/configs/hisi_defconfig
index 0376a65e8bc1..e19c1039fb93 100644
--- a/arch/arm/configs/hisi_defconfig
+++ b/arch/arm/configs/hisi_defconfig
@@ -43,6 +43,7 @@ CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 CONFIG_SPI_PL022=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 62734530a3d6..9a5f5c439b87 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -413,6 +413,7 @@ CONFIG_I2C_AT91=m
 CONFIG_I2C_BCM2835=y
 CONFIG_I2C_CADENCE=y
 CONFIG_I2C_DAVINCI=y
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_DIGICOLOR=m
 CONFIG_I2C_EMEV2=m
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index f2ca5c9131b5..e1cb170c2bf0 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -277,6 +277,7 @@ CONFIG_HW_RANDOM=y
 CONFIG_I2C_CHARDEV=m
 CONFIG_I2C_MUX_PCA954x=m
 CONFIG_I2C_MUX_PINCTRL=m
+CONFIG_I2C_DESIGNWARE_CORE=m
 CONFIG_I2C_DESIGNWARE_PLATFORM=m
 CONFIG_I2C_GPIO=y
 CONFIG_I2C_PXA_SLAVE=y
diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
index e82c3866b810..294906c8f16e 100644
--- a/arch/arm/configs/socfpga_defconfig
+++ b/arch/arm/configs/socfpga_defconfig
@@ -83,6 +83,7 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=2
 CONFIG_SERIAL_8250_DW=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 CONFIG_SPI_CADENCE_QUADSPI=y
diff --git a/arch/arm/configs/spear13xx_defconfig b/arch/arm/configs/spear13xx_defconfig
index c8128a6180e7..a8f992fdb30d 100644
--- a/arch/arm/configs/spear13xx_defconfig
+++ b/arch/arm/configs/spear13xx_defconfig
@@ -62,6 +62,7 @@ CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_RAW_DRIVER=y
 CONFIG_I2C=y
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 CONFIG_SPI_PL022=y
diff --git a/arch/arm/configs/spear3xx_defconfig b/arch/arm/configs/spear3xx_defconfig
index 97ea2e9a6f07..8dc5a388759c 100644
--- a/arch/arm/configs/spear3xx_defconfig
+++ b/arch/arm/configs/spear3xx_defconfig
@@ -42,6 +42,7 @@ CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_RAW_DRIVER=y
 CONFIG_I2C=y
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 CONFIG_SPI_PL022=y
diff --git a/arch/arm/configs/spear6xx_defconfig b/arch/arm/configs/spear6xx_defconfig
index a7a3413ac968..4e9e1a6ff381 100644
--- a/arch/arm/configs/spear6xx_defconfig
+++ b/arch/arm/configs/spear6xx_defconfig
@@ -33,6 +33,7 @@ CONFIG_STMMAC_ETH=y
 CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_I2C=y
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 CONFIG_SPI_PL022=y
-- 
2.45.2


