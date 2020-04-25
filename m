Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420D11B86DA
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Apr 2020 15:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgDYNpI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Apr 2020 09:45:08 -0400
Received: from mga09.intel.com ([134.134.136.24]:10240 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726092AbgDYNpI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Apr 2020 09:45:08 -0400
IronPort-SDR: +toter3y4oQhCs113hX8QPWqEqdgsA6pZAnyiURP5da6MyMl/MmXT0M9iLz9Qptv1v/iscuWcl
 wpfI/LXxBNJA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2020 06:45:08 -0700
IronPort-SDR: k5QMvBYNgz82CU+x88xVW4G8+2/eIvVbCF/lx7RchfvplhMwOH46IDFuKZIEsKCoLs2vXWoLKe
 1slQ3kq5xm6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,316,1583222400"; 
   d="scan'208";a="260165412"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 25 Apr 2020 06:44:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E666A2A0; Sat, 25 Apr 2020 16:44:49 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 3/5] i2c: designware: Switch PCI driver to use i2c_dw_configure_master()
Date:   Sat, 25 Apr 2020 16:44:46 +0300
Message-Id: <20200425134448.28514-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200425134448.28514-1-andriy.shevchenko@linux.intel.com>
References: <20200425134448.28514-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since we have available helper to configure master mode, let's use it
in the PCI driver instead of spread open-coded variant.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch
 drivers/i2c/busses/i2c-designware-pcidrv.c | 33 +++++-----------------
 1 file changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 7a0b65b5b5b59..d5e5abc03683f 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -46,20 +46,14 @@ struct dw_scl_sda_cfg {
 
 struct dw_pci_controller {
 	u32 bus_num;
-	u32 bus_cfg;
 	u32 tx_fifo_depth;
 	u32 rx_fifo_depth;
 	u32 clk_khz;
-	u32 functionality;
 	u32 flags;
 	struct dw_scl_sda_cfg *scl_sda_cfg;
 	int (*setup)(struct pci_dev *pdev, struct dw_pci_controller *c);
 };
 
-#define INTEL_MID_STD_CFG  (DW_IC_CON_MASTER |			\
-				DW_IC_CON_SLAVE_DISABLE |	\
-				DW_IC_CON_RESTART_EN)
-
 /* Merrifield HCNT/LCNT/SDA hold time */
 static struct dw_scl_sda_cfg mrfld_config = {
 	.ss_hcnt = 0x2f8,
@@ -88,10 +82,11 @@ static struct dw_scl_sda_cfg hsw_config = {
 
 static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 {
+	struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
+
 	switch (pdev->device) {
 	case 0x0817:
-		c->bus_cfg &= ~DW_IC_CON_SPEED_MASK;
-		c->bus_cfg |= DW_IC_CON_SPEED_STD;
+		dev->timings.bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
 		/* fall through */
 	case 0x0818:
 	case 0x0819:
@@ -128,53 +123,41 @@ static int mrfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 static struct dw_pci_controller dw_pci_controllers[] = {
 	[medfield] = {
 		.bus_num = -1,
-		.bus_cfg   = INTEL_MID_STD_CFG | DW_IC_CON_SPEED_FAST,
 		.tx_fifo_depth = 32,
 		.rx_fifo_depth = 32,
-		.functionality = I2C_FUNC_10BIT_ADDR,
 		.clk_khz      = 25000,
 		.setup = mfld_setup,
 	},
 	[merrifield] = {
 		.bus_num = -1,
-		.bus_cfg = INTEL_MID_STD_CFG | DW_IC_CON_SPEED_FAST,
 		.tx_fifo_depth = 64,
 		.rx_fifo_depth = 64,
-		.functionality = I2C_FUNC_10BIT_ADDR,
 		.scl_sda_cfg = &mrfld_config,
 		.setup = mrfld_setup,
 	},
 	[baytrail] = {
 		.bus_num = -1,
-		.bus_cfg = INTEL_MID_STD_CFG | DW_IC_CON_SPEED_FAST,
 		.tx_fifo_depth = 32,
 		.rx_fifo_depth = 32,
-		.functionality = I2C_FUNC_10BIT_ADDR,
 		.scl_sda_cfg = &byt_config,
 	},
 	[haswell] = {
 		.bus_num = -1,
-		.bus_cfg = INTEL_MID_STD_CFG | DW_IC_CON_SPEED_FAST,
 		.tx_fifo_depth = 32,
 		.rx_fifo_depth = 32,
-		.functionality = I2C_FUNC_10BIT_ADDR,
 		.scl_sda_cfg = &hsw_config,
 	},
 	[cherrytrail] = {
 		.bus_num = -1,
-		.bus_cfg = INTEL_MID_STD_CFG | DW_IC_CON_SPEED_FAST,
 		.tx_fifo_depth = 32,
 		.rx_fifo_depth = 32,
-		.functionality = I2C_FUNC_10BIT_ADDR,
 		.flags = MODEL_CHERRYTRAIL,
 		.scl_sda_cfg = &byt_config,
 	},
 	[elkhartlake] = {
 		.bus_num = -1,
-		.bus_cfg = INTEL_MID_STD_CFG | DW_IC_CON_SPEED_FAST,
 		.tx_fifo_depth = 32,
 		.rx_fifo_depth = 32,
-		.functionality = I2C_FUNC_10BIT_ADDR,
 		.clk_khz = 100000,
 	},
 };
@@ -250,14 +233,16 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	if (r < 0)
 		return r;
 
-	dev->clk = NULL;
 	dev->controller = controller;
 	dev->get_clk_rate_khz = i2c_dw_get_clk_rate_khz;
+	dev->timings.bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
 	dev->base = pcim_iomap_table(pdev)[0];
 	dev->dev = &pdev->dev;
 	dev->irq = pci_irq_vector(pdev, 0);
 	dev->flags |= controller->flags;
 
+	pci_set_drvdata(pdev, dev);
+
 	if (controller->setup) {
 		r = controller->setup(pdev, controller);
 		if (r) {
@@ -266,10 +251,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		}
 	}
 
-	dev->functionality = controller->functionality |
-				DW_IC_DEFAULT_FUNCTIONALITY;
+	i2c_dw_configure_master(dev);
 
-	dev->master_cfg = controller->bus_cfg;
 	if (controller->scl_sda_cfg) {
 		cfg = controller->scl_sda_cfg;
 		dev->ss_hcnt = cfg->ss_hcnt;
@@ -279,8 +262,6 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		dev->sda_hold_time = cfg->sda_hold;
 	}
 
-	pci_set_drvdata(pdev, dev);
-
 	dev->tx_fifo_depth = controller->tx_fifo_depth;
 	dev->rx_fifo_depth = controller->rx_fifo_depth;
 
-- 
2.26.2

