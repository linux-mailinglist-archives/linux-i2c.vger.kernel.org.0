Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84DCF47D509
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Dec 2021 17:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241720AbhLVQUi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Dec 2021 11:20:38 -0500
Received: from mga09.intel.com ([134.134.136.24]:11186 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241685AbhLVQUi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Dec 2021 11:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640190038; x=1671726038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bSrE3n9guR4oArlJQzkkvu5lthRmqYSrXzrJ2E3dEp4=;
  b=exeiI6MkTriHkiFrO79Sm/G/O6fuhVDVi5+jS2Kh/ruvivOJ0BNzT7vg
   LQmlW4V1T+lN4+bWR5G3NutQD3psyAzHL95JFzehzX1I8njsPjyqBLmVq
   WW/rINK9ZLyoeA4xpgniI3+3acCwMvk+XEK6uv6THYsvvWUlZNZE8le1s
   B1pXsDiRl335ANM0BtzpM0EtYSx1m3cO6k1x/PGqrYIZyoZFKP2h5i+5K
   uSpUbxhEVE2wgIiHyaJkClixgBeaJWqTc93oxiOB3/WkE5vysIaWeVfji
   CqrgYZr0rDt16dbDa5SVwhOVmRI+jKOPDuRMNhr80hUvzdp6UIzHr2uOI
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="240458813"
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; 
   d="scan'208";a="240458813"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 08:20:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; 
   d="scan'208";a="587058497"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 22 Dec 2021 08:20:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 143D881; Wed, 22 Dec 2021 18:20:44 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: [PATCH v2 2/5] i2c: nvidia-gpu: Switch to use i2c_new_ccgx_ucsi()
Date:   Wed, 22 Dec 2021 18:20:38 +0200
Message-Id: <20211222162041.64625-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211222162041.64625-1-andriy.shevchenko@linux.intel.com>
References: <20211222162041.64625-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Instead of open coded variant switch to use i2c_new_ccgx_ucsi().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: rebased on top of current i2c/for-next

 drivers/i2c/busses/Kconfig          |  1 +
 drivers/i2c/busses/i2c-nvidia-gpu.c | 26 ++++++--------------------
 2 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 08e24e396e37..0c9b089d1456 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -252,6 +252,7 @@ config I2C_NFORCE2_S4985
 config I2C_NVIDIA_GPU
 	tristate "NVIDIA GPU I2C controller"
 	depends on PCI
+	select I2C_CCGX_UCSI
 	help
 	  If you say yes to this option, support will be included for the
 	  NVIDIA GPU I2C controller which is used to communicate with the GPU's
diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index b5055a3cbd93..8117c3674209 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -17,6 +17,8 @@
 
 #include <asm/unaligned.h>
 
+#include "i2c-ccgx-ucsi.h"
+
 /* I2C definitions */
 #define I2C_MST_CNTL				0x00
 #define I2C_MST_CNTL_GEN_START			BIT(0)
@@ -266,23 +268,6 @@ static const struct software_node ccgx_node = {
 	.properties = ccgx_props,
 };
 
-static int gpu_populate_client(struct gpu_i2c_dev *i2cd, int irq)
-{
-	i2cd->gpu_ccgx_ucsi = devm_kzalloc(i2cd->dev,
-					   sizeof(*i2cd->gpu_ccgx_ucsi),
-					   GFP_KERNEL);
-	if (!i2cd->gpu_ccgx_ucsi)
-		return -ENOMEM;
-
-	strlcpy(i2cd->gpu_ccgx_ucsi->type, "ccgx-ucsi",
-		sizeof(i2cd->gpu_ccgx_ucsi->type));
-	i2cd->gpu_ccgx_ucsi->addr = 0x8;
-	i2cd->gpu_ccgx_ucsi->irq = irq;
-	i2cd->gpu_ccgx_ucsi->swnode = &ccgx_node;
-	i2cd->ccgx_client = i2c_new_client_device(&i2cd->adapter, i2cd->gpu_ccgx_ucsi);
-	return PTR_ERR_OR_ZERO(i2cd->ccgx_client);
-}
-
 static int gpu_i2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	struct gpu_i2c_dev *i2cd;
@@ -328,9 +313,10 @@ static int gpu_i2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (status < 0)
 		goto free_irq_vectors;
 
-	status = gpu_populate_client(i2cd, pdev->irq);
-	if (status < 0) {
-		dev_err(&pdev->dev, "gpu_populate_client failed %d\n", status);
+	i2cd->ccgx_client = i2c_new_ccgx_ucsi(&i2cd->adapter, pdev->irq, &ccgx_node);
+	if (IS_ERR(i2cd->ccgx_client)) {
+		status = dev_err_probe(&pdev->dev, PTR_ERR(i2cd->ccgx_client),
+				       "register UCSI failed\n");
 		goto del_adapter;
 	}
 
-- 
2.34.1

