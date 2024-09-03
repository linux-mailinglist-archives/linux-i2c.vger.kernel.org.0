Return-Path: <linux-i2c+bounces-6033-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BE496A069
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 16:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7511FB24CBD
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 14:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC96A17E00C;
	Tue,  3 Sep 2024 14:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNt6kquP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B182185925;
	Tue,  3 Sep 2024 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373531; cv=none; b=Jmeks4e0sh290TVaOhdOCmxsiABimaqNxklBNagmsjfDrRh+zEwcQwybTnXCOxvX8XHhwEvcGb2N+KvNYEDl/oX/Y5LR6IdJ/8agj4+dW8qYlMY+viIi8LA0KJPr6H9g3BqAbj2VcQrZjQeSHod2YEx31FUoz0fZ735bpR+hAcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373531; c=relaxed/simple;
	bh=KI8GxIrOhxgLo51/oeYq13OvikInu2s7CKSV1thf5sQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eZmSvj5/0aYXQmFFFifpVQ743esLA1dWacor20o6AJNXK5lNp9Q2nBS3UJ4DhYfaHdX5MqFSk99wEZ7tQ/Y1U/IFEmOuT+bYB2pGXTlNDReHrgZdHZKDkjHomjTLhcPmaEwjRQXKNtCZrO8Wzgz8/SXwfVzb2jU2nakmmgDdE9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNt6kquP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725373530; x=1756909530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KI8GxIrOhxgLo51/oeYq13OvikInu2s7CKSV1thf5sQ=;
  b=kNt6kquP574JuvaY4y3hClIuCCSJ7MGss7QCTCpXT05Xzjc714pJbXTE
   o6m2HBDpVnVdp6OafVwd2sEVHMTjfWhmHH2pKnAbgbqetHK6qobtoOBWT
   sDufI+cT7fexHFohMKvcBumjfTj6P6hnbdQ9KvPCz5Bjpj6/uO8wjgLG2
   /u8VuK21skb5RSnnb1EGlajWSp5ycn6+lHSCFW77YsUEzVJwDwRajNcXU
   30M6jn6QDqKQD29xbZodPXOLctpz/iWl4DT80m+I8SaTFmXECwAdYLcUa
   F8MAQ09iMIVWTyq6gY7oLxJ8MzYCaAf0ApYEQt6GKw/7NzryA5MtftpBb
   w==;
X-CSE-ConnectionGUID: c2cHLxzCRRaoARFdWCPZHA==
X-CSE-MsgGUID: uQObs3r4QD2cUryQGNqcCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23541356"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23541356"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 07:25:30 -0700
X-CSE-ConnectionGUID: EhBQ2FULSAaj+xHeR4r97w==
X-CSE-MsgGUID: NZ1KZ83cRfqPprAfMd6fHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65658869"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 03 Sep 2024 07:25:27 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 5/7] RISC-V: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
Date: Tue,  3 Sep 2024 17:25:04 +0300
Message-ID: <20240903142506.3444628-6-heikki.krogerus@linux.intel.com>
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

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 arch/riscv/configs/defconfig                   | 1 +
 arch/riscv/configs/nommu_k210_defconfig        | 1 +
 arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 0d678325444f..a644a798f602 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -157,6 +157,7 @@ CONFIG_HW_RANDOM_VIRTIO=y
 CONFIG_HW_RANDOM_JH7110=m
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=m
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_MV64XXX=m
 CONFIG_I2C_RIIC=y
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index af9601da4643..87ff5a1233af 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -58,6 +58,7 @@ CONFIG_I2C=y
 # CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 # CONFIG_I2C_HELPER_AUTO is not set
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 # CONFIG_SPI_MEM is not set
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index dd460c649152..95cbd574f291 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -50,6 +50,7 @@ CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 # CONFIG_I2C_HELPER_AUTO is not set
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 # CONFIG_SPI_MEM is not set
-- 
2.45.2


