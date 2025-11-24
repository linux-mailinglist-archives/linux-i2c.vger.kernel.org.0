Return-Path: <linux-i2c+bounces-14242-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCCAC80C45
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Nov 2025 14:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 78C87347CBF
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Nov 2025 13:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FC11DDC07;
	Mon, 24 Nov 2025 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeZpvnEN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA0E1DED63
	for <linux-i2c@vger.kernel.org>; Mon, 24 Nov 2025 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763990900; cv=none; b=cRZYxh+z87T3SSQzrNaI05iuBOHzn7DlDbJalUE2me8X/b6msqzvPp56ILSAR+KT9VlbSpGZwDa8SxFRCqiLGu082MNfsvs8+HTMXrSKQCaXtQm7LcHfva7JJjXvwW9THQCsMCQAmLmguUJMU2uaGfR/dTTR/R9a+e60S1p8F8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763990900; c=relaxed/simple;
	bh=JuL3yc5AsTl//MLVD9KGo9W0CjDZe+dMphJfX8sdxOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZaulGxffpftOSAgsD18wqd7YfqXFpJW9Pludh/eMxokJVlP3AePz+1dp2MDJCjLHHg9m4nHQxrm3V2E/wQhQtMW0SxBGbkgbL0oFgxY/QC0D/3NYMqMdz8FseEMYXnrM71jQ86+O3HWdGi5ky4ZsrXxj3OHcm0AESZMObU2vZl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jeZpvnEN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763990899; x=1795526899;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JuL3yc5AsTl//MLVD9KGo9W0CjDZe+dMphJfX8sdxOA=;
  b=jeZpvnENn/ooEsf7ZQPrEIWiM8Lg/71Y6TJs7ba4ylt2pMgh/YsYFKOI
   NzZIIsO+BG1sqhAOjmA3qB8ysHShZrt1J6HtE4DqiQptUHgdEhU3VFEKV
   746IsbGMEyybvXC6M1Yqb44YOOd6na+V4qC3ElIgSPTVprpPfindFjZRM
   k1oJa1TlwlqHxKtVHxUZcfpKqpR2JzfFmBYIKqQA4ETksRSxjt18wOqUm
   ZMN3l3e842tz0a6kWS+kg5moC3z8yjXrDODEvH8Rn2ZWBTr3Qj5YQCRmi
   plouGrLWe/GJTyw+X3GTEZjF2fN2ws4yLWn9nd4PnMSh7w3jfaGVv5Ffk
   Q==;
X-CSE-ConnectionGUID: dL5OipRdTl2OFMQCrPfdQg==
X-CSE-MsgGUID: lOCOd/WbTxWR/WwcuxddIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65926384"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="65926384"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 05:28:18 -0800
X-CSE-ConnectionGUID: qJBL/H1gRom0zzaHsv8gSg==
X-CSE-MsgGUID: ewbZvcBBTAOYqxk8n1kSag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="197459905"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 24 Nov 2025 05:28:16 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: i801: Add support for Intel Nova Lake-S
Date: Mon, 24 Nov 2025 14:28:15 +0100
Message-ID: <20251124132816.470599-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Add SMBus PCI IDs on Intel Nova Lake-S.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 Documentation/i2c/busses/i2c-i801.rst | 1 +
 drivers/i2c/busses/Kconfig            | 1 +
 drivers/i2c/busses/i2c-i801.c         | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
index c939a5bfc8d0..bbbce90eb7d8 100644
--- a/Documentation/i2c/busses/i2c-i801.rst
+++ b/Documentation/i2c/busses/i2c-i801.rst
@@ -52,6 +52,7 @@ Supported adapters:
   * Intel Panther Lake (SOC)
   * Intel Wildcat Lake (SOC)
   * Intel Diamond Rapids (SOC)
+  * Intel Nova Lake (PCH)
 
    Datasheets: Publicly available at the Intel website
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 8bf0e07aa75c..f2b923d38359 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -167,6 +167,7 @@ config I2C_I801
 	    Panther Lake (SOC)
 	    Wildcat Lake (SOC)
 	    Diamond Rapids (SOC)
+	    Nova Lake (PCH)
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-i801.
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 81e6e2d7ad3d..9e1789725edf 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -85,6 +85,7 @@
  * Panther Lake-P (SOC)		0xe422	32	hard	yes	yes	yes
  * Wildcat Lake-U (SOC)		0x4d22	32	hard	yes	yes	yes
  * Diamond Rapids (SOC)		0x5827	32	hard	yes	yes	yes
+ * Nova Lake-S (PCH)		0x6e23	32	hard	yes	yes	yes
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -245,6 +246,7 @@
 #define PCI_DEVICE_ID_INTEL_BIRCH_STREAM_SMBUS		0x5796
 #define PCI_DEVICE_ID_INTEL_DIAMOND_RAPIDS_SMBUS	0x5827
 #define PCI_DEVICE_ID_INTEL_BROXTON_SMBUS		0x5ad4
+#define PCI_DEVICE_ID_INTEL_NOVA_LAKE_S_SMBUS		0x6e23
 #define PCI_DEVICE_ID_INTEL_ARROW_LAKE_H_SMBUS		0x7722
 #define PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_S_SMBUS		0x7a23
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS		0x7aa3
@@ -1061,6 +1063,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, PANTHER_LAKE_H_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, PANTHER_LAKE_P_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, WILDCAT_LAKE_U_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
+	{ PCI_DEVICE_DATA(INTEL, NOVA_LAKE_S_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ 0, }
 };
 
-- 
2.50.1


