Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8744F1D96A7
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 14:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgESMuz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 08:50:55 -0400
Received: from mga09.intel.com ([134.134.136.24]:44030 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726471AbgESMuv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 08:50:51 -0400
IronPort-SDR: g4dyGsPzgigFnJVg+Koh6jpx0qipwjiNwU1Z5PI5RHRkTwufES0Jc660EUbtcD0FAuuTmO8Wif
 vyQ64VEyDGuA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 05:50:50 -0700
IronPort-SDR: IYu6mUbMEAwetbfHKm2xr26UNAgy2aGxYgCn9Wxb3Fg1bODTy4EDdCO1r8pndUsF69cr2vjjOh
 7Mx37fg3m0Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="439607317"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 19 May 2020 05:50:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BC625103; Tue, 19 May 2020 15:50:47 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/7] i2c: designware: Get rid of PCI driver specifics in common code
Date:   Tue, 19 May 2020 15:50:37 +0300
Message-Id: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Do not spread PCI specifics over common code. It seems to be a layering
violation which can be easily avoided. Refactor PCI driver and drop
PCI specifics from common code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch
 drivers/i2c/busses/i2c-designware-core.h   |  1 -
 drivers/i2c/busses/i2c-designware-pcidrv.c | 24 +++++++++++++---------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 1674caf27745..6202f9ee953d 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -232,7 +232,6 @@ struct dw_i2c_dev {
 	struct reset_control	*rst;
 	struct i2c_client		*slave;
 	u32			(*get_clk_rate_khz) (struct dw_i2c_dev *dev);
-	struct dw_pci_controller *controller;
 	int			cmd_err;
 	struct i2c_msg		*msgs;
 	int			msgs_num;
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index c762e5a11e44..c8808e5855b4 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -48,10 +48,10 @@ struct dw_pci_controller {
 	u32 bus_num;
 	u32 tx_fifo_depth;
 	u32 rx_fifo_depth;
-	u32 clk_khz;
 	u32 flags;
 	struct dw_scl_sda_cfg *scl_sda_cfg;
 	int (*setup)(struct pci_dev *pdev, struct dw_pci_controller *c);
+	u32 (*get_clk_rate_khz)(struct dw_i2c_dev *dev);
 };
 
 /* Merrifield HCNT/LCNT/SDA hold time */
@@ -80,6 +80,11 @@ static struct dw_scl_sda_cfg hsw_config = {
 	.sda_hold = 0x9,
 };
 
+static u32 mfld_get_clk_rate_khz(struct dw_i2c_dev *dev)
+{
+	return 25000;
+}
+
 static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 {
 	struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
@@ -120,13 +125,18 @@ static int mrfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 	return -ENODEV;
 }
 
+static u32 ehl_get_clk_rate_khz(struct dw_i2c_dev *dev)
+{
+	return 100000;
+}
+
 static struct dw_pci_controller dw_pci_controllers[] = {
 	[medfield] = {
 		.bus_num = -1,
 		.tx_fifo_depth = 32,
 		.rx_fifo_depth = 32,
-		.clk_khz      = 25000,
 		.setup = mfld_setup,
+		.get_clk_rate_khz = mfld_get_clk_rate_khz,
 	},
 	[merrifield] = {
 		.bus_num = -1,
@@ -158,7 +168,7 @@ static struct dw_pci_controller dw_pci_controllers[] = {
 		.bus_num = -1,
 		.tx_fifo_depth = 32,
 		.rx_fifo_depth = 32,
-		.clk_khz = 100000,
+		.get_clk_rate_khz = ehl_get_clk_rate_khz,
 	},
 };
 
@@ -188,11 +198,6 @@ static int i2c_dw_pci_resume(struct device *dev)
 static UNIVERSAL_DEV_PM_OPS(i2c_dw_pm_ops, i2c_dw_pci_suspend,
 			    i2c_dw_pci_resume, NULL);
 
-static u32 i2c_dw_get_clk_rate_khz(struct dw_i2c_dev *dev)
-{
-	return dev->controller->clk_khz;
-}
-
 static int i2c_dw_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *id)
 {
@@ -233,8 +238,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	if (r < 0)
 		return r;
 
-	dev->controller = controller;
-	dev->get_clk_rate_khz = i2c_dw_get_clk_rate_khz;
+	dev->get_clk_rate_khz = controller->get_clk_rate_khz;
 	dev->timings.bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
 	dev->base = pcim_iomap_table(pdev)[0];
 	dev->dev = &pdev->dev;
-- 
2.26.2

