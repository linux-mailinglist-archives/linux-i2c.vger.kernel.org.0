Return-Path: <linux-i2c+bounces-12161-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8298AB1E8F1
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Aug 2025 15:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 481C21AA4FE3
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Aug 2025 13:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E5327AC3A;
	Fri,  8 Aug 2025 13:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUEibn/k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F94260592
	for <linux-i2c@vger.kernel.org>; Fri,  8 Aug 2025 13:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754658603; cv=none; b=tdhwmRfSqMHnxykyRMmVXtD8U8nep8TQswpEiZasOfxBCHFfD6f3c3H+jVkVBxfAIvWHOfEDWUQVwQChcuB9oLhV3V2Wp0KFSlYiPuDGPlVnvfTWuaeb55MPq3PVDKIR2q0K2g6VZa5aJeKuVvaR1eoWEHwSW4iOStr9EpioEzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754658603; c=relaxed/simple;
	bh=t/6E84b/ikN4+nH90xNSJEvOs0S+0M2aOGcXzYNLze4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i1TXscIPbHo9Ig7Alc0mlFvkRaohNQ0/arwKrzYFzvz54/fA+gOlS8R91bHG3evjIU7B1tNV94I+QBsOWv2UAOS7uVi83YA9XZsei6fzj+frO4cbfzIqbmnyRnKvTSgExnhZ3pns3pPrMPU15+AoIcn/7pbUdtx8pO0Tg2hSXE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUEibn/k; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754658601; x=1786194601;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t/6E84b/ikN4+nH90xNSJEvOs0S+0M2aOGcXzYNLze4=;
  b=iUEibn/kcYdeJgwuMjZmZSpvaytoVxA4p0zK2tFQCJK0vq7y98STNLPq
   ul5NltRRuC/dNsDPWpPOQXX8vu1x7CXOBOlUzG+E/SVQxgmAckENUEn9T
   AMLG5Zxel95qwDdLMYMszbmSpm4i6e5ZeVoCBB/iHaN5WneAWZPaXhb67
   82tbYY2neoySJhwcMDz5FLoBIlLsIYAyPHA60hPdCXYQIof1lKChW60Kv
   mToJ+lEilpmgzkfQSXLp+Bs8KSeH6lxg9vLEVWRGpUunNonyvlR1RqtMv
   qiB90k+zpQpN+qAb8LypNyjWgMBiI3RbPAXpRh13LK/w2N41R9GXpK6B0
   A==;
X-CSE-ConnectionGUID: bDf7t3jTQGqEO/hlJk3jpQ==
X-CSE-MsgGUID: zasBmgyPTfe32F4psv/6/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68372528"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="68372528"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 06:10:01 -0700
X-CSE-ConnectionGUID: LMLb3MwRTmaqqYVoPYSKpA==
X-CSE-MsgGUID: gi456PJ5Sdun2JksVun9VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="164564005"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.50])
  by orviesa010.jf.intel.com with ESMTP; 08 Aug 2025 06:09:59 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i2c: i801: Add support for Intel Wildcat Lake-U
Date: Fri,  8 Aug 2025 16:09:56 +0300
Message-ID: <20250808130956.1167509-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SMBus IDs on Intel Wildcat Lake-U.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 Documentation/i2c/busses/i2c-i801.rst | 1 +
 drivers/i2c/busses/Kconfig            | 1 +
 drivers/i2c/busses/i2c-i801.c         | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
index 47e8ac5b7099..36c563ad3f06 100644
--- a/Documentation/i2c/busses/i2c-i801.rst
+++ b/Documentation/i2c/busses/i2c-i801.rst
@@ -50,6 +50,7 @@ Supported adapters:
   * Intel Birch Stream (SOC)
   * Intel Arrow Lake (SOC)
   * Intel Panther Lake (SOC)
+  * Intel Wildcat Lake (SOC)
 
    Datasheets: Publicly available at the Intel website
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 070d014fdc5d..0c77b1d4c260 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -165,6 +165,7 @@ config I2C_I801
 	    Birch Stream (SOC)
 	    Arrow Lake (SOC)
 	    Panther Lake (SOC)
+	    Wildcat Lake (SOC)
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-i801.
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a7f89946dad4..1e54fed4cac1 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -83,6 +83,7 @@
  * Arrow Lake-H (SOC)		0x7722	32	hard	yes	yes	yes
  * Panther Lake-H (SOC)		0xe322	32	hard	yes	yes	yes
  * Panther Lake-P (SOC)		0xe422	32	hard	yes	yes	yes
+ * Wildcat Lake-U (SOC)		0x4d22	32	hard	yes	yes	yes
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -236,6 +237,7 @@
 #define PCI_DEVICE_ID_INTEL_5_3400_SERIES_SMBUS		0x3b30
 #define PCI_DEVICE_ID_INTEL_TIGERLAKE_H_SMBUS		0x43a3
 #define PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS		0x4b23
+#define PCI_DEVICE_ID_INTEL_WILDCAT_LAKE_U_SMBUS	0x4d22
 #define PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS		0x4da3
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_P_SMBUS		0x51a3
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_M_SMBUS		0x54a3
@@ -1056,6 +1058,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, ARROW_LAKE_H_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, PANTHER_LAKE_H_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, PANTHER_LAKE_P_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
+	{ PCI_DEVICE_DATA(INTEL, WILDCAT_LAKE_U_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ 0, }
 };
 
-- 
2.47.2


