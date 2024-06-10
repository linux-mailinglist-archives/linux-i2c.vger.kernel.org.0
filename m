Return-Path: <linux-i2c+bounces-3942-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C9B901F14
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 12:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A2581F20FFD
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 10:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2ED757FB;
	Mon, 10 Jun 2024 10:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiPaDxZX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAC528EA
	for <linux-i2c@vger.kernel.org>; Mon, 10 Jun 2024 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718014687; cv=none; b=p3fkywsdlRQ+EKGy0fNyq638Q4SeskVM7PYE//Ff7VQa0B1srrcahwTJWu7HyqILVMqvWE6fBNpL9CwKra7atV1tCS58INcKLOlb2+NGDZKiL/Kd9Tgyu44YYC1rHrbUQpEfGayxAjZojJYCuZAMMpWBccCoV1p2wzYGZBIcCwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718014687; c=relaxed/simple;
	bh=qsaJDtGq0q1TEXO+T1qA74dpqOLu86Drjb2f2ycR0fw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u2QnoNpXhtVu9lyQhYSxpbXd7rTZA+z3xsse7qr2Go6ma9SFFSujHuc0m9FkaOCsFmUqcRpPBiYImUGmoKoGpQYOlellq9sguMwTInSkLO/z3iYaC4hxmF1kB7W+2vGlQx1NRouy6kxAL38UhZ8UonMqWaLophc0ZrZocOw6dU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiPaDxZX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718014687; x=1749550687;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qsaJDtGq0q1TEXO+T1qA74dpqOLu86Drjb2f2ycR0fw=;
  b=aiPaDxZXX8X96NxCX8w3ViUO+55dYrSOwf2Nl6nyUMZeheFfDfixjJx4
   21R6nG3+KM9KYq97TPgakczlYuAoA5+Qh78JGUTzDHKe1bXNeml+BZApf
   2YjLWnbnGSEz7jDOoyIPKn9NWzA+9OWCVSvJ3zLkamnAaBttjZvrkrAQN
   NphFKC73qi5HrigB3IygLZ8E/RZLBFEBYOvmxgXW62T7RqFDLW7ByL9vW
   nN2qCg1ky+atKDMh97p+Jgg3ef869/5XSokamZLnyi0bgLjgVRx0+fm24
   nFyKsHw0o0FchThHK+NPwnbFpK587DiOwDN1lPna8YZmHvggyucxCI2ID
   w==;
X-CSE-ConnectionGUID: SwUTIV3CThOzQ4At2WCfiA==
X-CSE-MsgGUID: ErYHxfpSTvel/f/1fe86qA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14503705"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14503705"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:18:06 -0700
X-CSE-ConnectionGUID: UVc3Q14fSK2Ml6orXpYqWw==
X-CSE-MsgGUID: YI+eXn2iRS2Ta5wsYcZxGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43449320"
Received: from aquilante.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jun 2024 03:18:04 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i2c: i801: Add support for Intel Arrow Lake-H
Date: Mon, 10 Jun 2024 13:18:01 +0300
Message-ID: <20240610101801.453785-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SMBus PCI ID on Intel Arrow Lake-H.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 Documentation/i2c/busses/i2c-i801.rst | 1 +
 drivers/i2c/busses/Kconfig            | 1 +
 drivers/i2c/busses/i2c-i801.c         | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
index 10eced6c2e46..c840b597912c 100644
--- a/Documentation/i2c/busses/i2c-i801.rst
+++ b/Documentation/i2c/busses/i2c-i801.rst
@@ -48,6 +48,7 @@ Supported adapters:
   * Intel Raptor Lake (PCH)
   * Intel Meteor Lake (SOC and PCH)
   * Intel Birch Stream (SOC)
+  * Intel Arrow Lake (SOC)
 
    Datasheets: Publicly available at the Intel website
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fe6e8a1bb607..85b57d2ec998 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -159,6 +159,7 @@ config I2C_I801
 	    Raptor Lake (PCH)
 	    Meteor Lake (SOC and PCH)
 	    Birch Stream (SOC)
+	    Arrow Lake (SOC)
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-i801.
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index d2d2a6dbe29f..44e3e9bae5f1 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -80,6 +80,7 @@
  * Meteor Lake SoC-S (SOC)	0xae22	32	hard	yes	yes	yes
  * Meteor Lake PCH-S (PCH)	0x7f23	32	hard	yes	yes	yes
  * Birch Stream (SOC)		0x5796	32	hard	yes	yes	yes
+ * Arrow Lake-H (SOC)		0x7722	32	hard	yes	yes	yes
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -237,6 +238,7 @@
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_M_SMBUS		0x54a3
 #define PCI_DEVICE_ID_INTEL_BIRCH_STREAM_SMBUS		0x5796
 #define PCI_DEVICE_ID_INTEL_BROXTON_SMBUS		0x5ad4
+#define PCI_DEVICE_ID_INTEL_ARROW_LAKE_H_SMBUS		0x7722
 #define PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_S_SMBUS		0x7a23
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS		0x7aa3
 #define PCI_DEVICE_ID_INTEL_METEOR_LAKE_P_SMBUS		0x7e22
@@ -1052,6 +1054,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_SOC_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_PCH_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, BIRCH_STREAM_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
+	{ PCI_DEVICE_DATA(INTEL, ARROW_LAKE_H_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ 0, }
 };
 
-- 
2.43.0


