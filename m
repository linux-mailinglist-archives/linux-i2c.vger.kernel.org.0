Return-Path: <linux-i2c+bounces-13697-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ECDBF4FD7
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 09:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E4E25351F20
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 07:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8880327F74B;
	Tue, 21 Oct 2025 07:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1zCeEtR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACDA27B331
	for <linux-i2c@vger.kernel.org>; Tue, 21 Oct 2025 07:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761032127; cv=none; b=rMbPSUyuJtDwBEoKLPAtEpvcG57U7kHVMY8A2SNxJ1Z68joTPv14C8G5GPgWj3cAHjS0i4Mc/ZwIdBaY4uRrc6JXgxQGcHBBgm2bj8flFp4DeIWCVgTyhSvLLQdzPNpVCsOHSumsli7ChmlGo23fXx1lPvbsSh1gppY4GVYrTLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761032127; c=relaxed/simple;
	bh=j0o2FJmXY5xIfYVZFE6LY/YDVfm0W2e79fcCxsmoNwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=efY+ky+GDyOT+1y1gd8AiP39WL7+sKcOh1LlIVkHvverriz0KdBhzfny/RAihyb0K7KtZMPsI2V3/153vo7kjQgdqZydICGzyj/pInh4CYLqk/t0kvQPqe05E81UpjFstPdTW4wrV2YObKBvMiiBUyCrO4A0+O1tD8m0KrrkIzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X1zCeEtR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761032126; x=1792568126;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j0o2FJmXY5xIfYVZFE6LY/YDVfm0W2e79fcCxsmoNwA=;
  b=X1zCeEtRqpiOAknPR7WtiZOBzPEchu54Sg1ZErJ9Jz2QYMyPbiuVO3U6
   gUDqQPl0FCxl7JlytdY8KdMGvk/C5p6MIFOLvRWECyTAc1tgXr76JX8UI
   R4atWOurZh0V8FPFQwVykN+jeu450umG7fjYAjA+vrWUWXNnDb8GZd3kY
   PDfS2pk4SveoM5tSaxb/V5rbhuNstw8HiYA2ZitPiw4do6VPhAPa0shhN
   moQ4KB64NBr7QSAmPcsRrYATRvP6KkNgLNCJ/T7ZUUi5OFhPcuIqWPvIH
   KNbe2Oe0IuhaXl1b6oxuEaHAa3J8V4nv9GDhaZWUBsrowcEbfg/1wgy69
   Q==;
X-CSE-ConnectionGUID: 6SukOv/oTvqL0bBamT+tYQ==
X-CSE-MsgGUID: K+eV+zClQTOibIjPnhudMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73443562"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="73443562"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 00:35:25 -0700
X-CSE-ConnectionGUID: uxdl+SMHQeersBOp6W0oOA==
X-CSE-MsgGUID: OVipBWmkTj61NsL2igK4pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="184006681"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 21 Oct 2025 00:35:23 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jean Delvare <jdelvare@suse.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	Zeng Guang <guang.zeng@intel.com>
Subject: [PATCH] i2c: i801: Add support for Intel Diamond Rapids
Date: Tue, 21 Oct 2025 09:35:22 +0200
Message-ID: <20251021073522.3458383-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zeng Guang <guang.zeng@intel.com>

Add SMBus PCI ID on Intel Diamond Rapids.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 Documentation/i2c/busses/i2c-i801.rst | 1 +
 drivers/i2c/busses/Kconfig            | 1 +
 drivers/i2c/busses/i2c-i801.c         | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
index 36c563ad3f06..c939a5bfc8d0 100644
--- a/Documentation/i2c/busses/i2c-i801.rst
+++ b/Documentation/i2c/busses/i2c-i801.rst
@@ -51,6 +51,7 @@ Supported adapters:
   * Intel Arrow Lake (SOC)
   * Intel Panther Lake (SOC)
   * Intel Wildcat Lake (SOC)
+  * Intel Diamond Rapids (SOC)
 
    Datasheets: Publicly available at the Intel website
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fd81e49638aa..8bf0e07aa75c 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -166,6 +166,7 @@ config I2C_I801
 	    Arrow Lake (SOC)
 	    Panther Lake (SOC)
 	    Wildcat Lake (SOC)
+	    Diamond Rapids (SOC)
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-i801.
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 57fbec1259be..91d4d14605aa 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -242,6 +242,7 @@
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_P_SMBUS		0x51a3
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_M_SMBUS		0x54a3
 #define PCI_DEVICE_ID_INTEL_BIRCH_STREAM_SMBUS		0x5796
+#define PCI_DEVICE_ID_INTEL_DIAMOND_RAPIDS_SMBUS	0x5827
 #define PCI_DEVICE_ID_INTEL_BROXTON_SMBUS		0x5ad4
 #define PCI_DEVICE_ID_INTEL_ARROW_LAKE_H_SMBUS		0x7722
 #define PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_S_SMBUS		0x7a23
@@ -1054,6 +1055,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_SOC_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_PCH_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, BIRCH_STREAM_SMBUS,		FEATURES_ICH5)			 },
+	{ PCI_DEVICE_DATA(INTEL, DIAMOND_RAPIDS_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, ARROW_LAKE_H_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, PANTHER_LAKE_H_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, PANTHER_LAKE_P_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
-- 
2.50.1


