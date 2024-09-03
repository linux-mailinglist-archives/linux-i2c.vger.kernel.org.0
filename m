Return-Path: <linux-i2c+bounces-6031-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3F896A062
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 16:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D36AF1C23A7D
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 14:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3903716C453;
	Tue,  3 Sep 2024 14:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GFd960k5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C48158DD4;
	Tue,  3 Sep 2024 14:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373525; cv=none; b=GvZz7fql7/X6Q0vDZgKrS6U/Zcj6XKJ6zBweLzlw5yILZNGQZs/cB62bfDEN7jybA0oST+Zxd1wozh+i5n7vAp57gK8qehVRAQs02D6LJyGPkHUCa2W/sxENbZTUBiF860sheRTMGALRuVE1AidLH8k+n1CEZC6CTJ8srSpEqIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373525; c=relaxed/simple;
	bh=mel7qlpzCkiL9Hsin6o3Lvdj+wlMgKo6h/abeWM+V/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZhUNktHNFo5xH6cjZwfxyIDn2H/FnbJ/yvmCvzaLiangTvcOCcwKIQ3zZ206hIV35+7tJTGWiKX4+Xpdcoeq7x5gWw7W4iN9ci4sXzsF6sJ3oWhG8D9P42ASDKMr908YiADih7sD/maNSFNeOSEIg3+66/Pn/t2IjF2nuI6GX7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GFd960k5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725373523; x=1756909523;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mel7qlpzCkiL9Hsin6o3Lvdj+wlMgKo6h/abeWM+V/o=;
  b=GFd960k5pf9LsnRxE6YYi9P+RIXaYgKiPeNi6w4ad20nYlbZqS/EOyzn
   TxbQbhWYRCCkKXBGZeDKT4iac5aez7dhzD/SHPR5M3ya+nVcwvK7VwSwN
   2b87y5nr+SdrD6KAOHqg+0reAoLdDcmC77a78IlHVgtkfAqzrQGzluTGc
   sKRDpyscvrME/5dhuMB+tTJatdJNWJNg9rKj2if6dckSorkViBVcAd+Eu
   eTktILt7XmR3ongOgEyv4YrkbnsLO8h77I77bgyDdClylOlqiVD24afEw
   QM18qDlWamX2vU6v7TxNFcMckqJBYTZQsW/89BFOmT7ISHfPJx+w13hZh
   A==;
X-CSE-ConnectionGUID: +6SHeqEWTqOu8mHpGFSGIw==
X-CSE-MsgGUID: SIBg0iThSaKvGmSV/VnlsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23541306"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23541306"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 07:25:23 -0700
X-CSE-ConnectionGUID: wRTPtPltQfCa5aCYSGsGnQ==
X-CSE-MsgGUID: Bd9mb3FVRKagf2PaL2Nvfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65658839"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 03 Sep 2024 07:25:20 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/7] arm64: defconfig: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
Date: Tue,  3 Sep 2024 17:25:02 +0300
Message-ID: <20240903142506.3444628-4-heikki.krogerus@linux.intel.com>
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

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f064c7c91dbb..c2973b7a873e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -518,6 +518,7 @@ CONFIG_I2C_MUX=y
 CONFIG_I2C_MUX_PCA954x=y
 CONFIG_I2C_BCM2835=m
 CONFIG_I2C_CADENCE=m
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_GPIO=m
 CONFIG_I2C_IMX=y
-- 
2.45.2


