Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13F6546C380
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 20:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240959AbhLGTZj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Dec 2021 14:25:39 -0500
Received: from mga06.intel.com ([134.134.136.31]:64804 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236233AbhLGTZh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Dec 2021 14:25:37 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="298462339"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="298462339"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 11:22:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="751423313"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 07 Dec 2021 11:22:04 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F3CB4361; Tue,  7 Dec 2021 21:22:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v1 09/11] i2c: nvidia-gpu: Switch to use i2c_new_ccgx_ucsi()
Date:   Tue,  7 Dec 2021 21:21:57 +0200
Message-Id: <20211207192159.41383-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211207192159.41383-1-andriy.shevchenko@linux.intel.com>
References: <20211207192159.41383-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Instead of open coded variant switch to use i2c_new_ccgx_ucsi().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/Kconfig          |  1 +
 drivers/i2c/busses/i2c-nvidia-gpu.c | 26 ++++++--------------------
 2 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 451ddec12dba..c2d29d7cdff3 100644
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
2.33.0

