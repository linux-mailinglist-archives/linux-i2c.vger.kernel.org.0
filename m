Return-Path: <linux-i2c+bounces-6936-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C0F97EC3F
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 15:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 010141C21373
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 13:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C1F199923;
	Mon, 23 Sep 2024 13:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SR3iuK9e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EAD1993AF
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727098051; cv=none; b=IL7tKf7CICNZW0haBoeT+o9GTOEqDo33DqxBAVi7ih7Sai4nZbx1IcNimvXaxQG+CWo/eIKzyThlg0JIhtm3nNThzatdOzaHfXnbuy0xY9UguSXRiQcgain9T52ukyUBYDA3O/a+T5ugPEzJERlPDayDFf9zk+9YO6//KivUMYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727098051; c=relaxed/simple;
	bh=+5pcO+hrF1QvYpDg+nE9KUEvfj5GUl67+TrRo2XUMaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gQc4rbgsiyoNLKGEEYQtAoWDPaCA+exPDihWPtDcJQjg1Lk6gNH5qLfAc282fmdlW2rWeoUl9qS4XaiU1kWK3nRURx0z1BRbj33Rg2pFdUAHOz/8Z9u9ddPmjSDdKbtjzfGB8nYNJihe/NWmFOw1aqzZoLo5W9hgN1KZZyafBJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SR3iuK9e; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727098049; x=1758634049;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+5pcO+hrF1QvYpDg+nE9KUEvfj5GUl67+TrRo2XUMaQ=;
  b=SR3iuK9ebferXAb/592hDPA8fzDeaVCGxA+1Mw6MM3HGUx5R9k89lw4E
   JaN8MrESYv25y9ToSaGI/8RXIHgesMbkOlzWi84Bd3NNBKHcUolv9Aps9
   DaCWoJSUOCLxy/2CaNbENTv/dug2gb1ju72sR6EMLbmbl25bttie/6UrW
   RiAoa5+EaJ2r6dcFiCPvIAL9ygMd4NmDGqeyh87y2Q+REik+um2A3x+OA
   AP7BDR/Kj+Up1+47jEPzBdEJEQ8Hk0dp5S4cEWGRj/3YlU+pwouc1R7GS
   ZCX7F8sdGyITYtWhAF17jeMar/CSlQLCR8weNC0jKWKdEsLm3x0N/Bpjd
   w==;
X-CSE-ConnectionGUID: VtM9L6t9T3uwuJQrZC6qMg==
X-CSE-MsgGUID: YGnwzyvATjajQoPNU/MzvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26199038"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="26199038"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 06:27:28 -0700
X-CSE-ConnectionGUID: KtgeLkdARLe8LW77p5uRoA==
X-CSE-MsgGUID: 72qgC2h6S82vBdKQY3Sxsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="75178752"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.57])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2024 06:27:27 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i2c: i801: Add support for Intel Panther Lake
Date: Mon, 23 Sep 2024 16:27:19 +0300
Message-ID: <20240923132719.252770-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SMBus PCI IDs on Intel Panther Lake-P and -U.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 Documentation/i2c/busses/i2c-i801.rst | 1 +
 drivers/i2c/busses/Kconfig            | 1 +
 drivers/i2c/busses/i2c-i801.c         | 6 ++++++
 3 files changed, 8 insertions(+)

diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
index c840b597912c..47e8ac5b7099 100644
--- a/Documentation/i2c/busses/i2c-i801.rst
+++ b/Documentation/i2c/busses/i2c-i801.rst
@@ -49,6 +49,7 @@ Supported adapters:
   * Intel Meteor Lake (SOC and PCH)
   * Intel Birch Stream (SOC)
   * Intel Arrow Lake (SOC)
+  * Intel Panther Lake (SOC)
 
    Datasheets: Publicly available at the Intel website
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index a22f9125322a..e14281aed1ac 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -160,6 +160,7 @@ config I2C_I801
 	    Meteor Lake (SOC and PCH)
 	    Birch Stream (SOC)
 	    Arrow Lake (SOC)
+	    Panther Lake (SOC)
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-i801.
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 328c0dab6b14..9c3a6c1fd3dc 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -81,6 +81,8 @@
  * Meteor Lake PCH-S (PCH)	0x7f23	32	hard	yes	yes	yes
  * Birch Stream (SOC)		0x5796	32	hard	yes	yes	yes
  * Arrow Lake-H (SOC)		0x7722	32	hard	yes	yes	yes
+ * Panther Lake-H (SOC)		0xe322	32	hard	yes	yes	yes
+ * Panther Lake-P (SOC)		0xe422	32	hard	yes	yes	yes
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -261,6 +263,8 @@
 #define PCI_DEVICE_ID_INTEL_CANNONLAKE_H_SMBUS		0xa323
 #define PCI_DEVICE_ID_INTEL_COMETLAKE_V_SMBUS		0xa3a3
 #define PCI_DEVICE_ID_INTEL_METEOR_LAKE_SOC_S_SMBUS	0xae22
+#define PCI_DEVICE_ID_INTEL_PANTHER_LAKE_H_SMBUS	0xe322
+#define PCI_DEVICE_ID_INTEL_PANTHER_LAKE_P_SMBUS	0xe422
 
 struct i801_mux_config {
 	char *gpio_chip;
@@ -1055,6 +1059,8 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_PCH_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, BIRCH_STREAM_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, ARROW_LAKE_H_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
+	{ PCI_DEVICE_DATA(INTEL, PANTHER_LAKE_H_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
+	{ PCI_DEVICE_DATA(INTEL, PANTHER_LAKE_P_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ 0, }
 };
 
-- 
2.45.2


