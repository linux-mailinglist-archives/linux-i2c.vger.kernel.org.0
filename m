Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76D321D96A9
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 14:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgESMu5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 08:50:57 -0400
Received: from mga14.intel.com ([192.55.52.115]:55573 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728737AbgESMux (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 08:50:53 -0400
IronPort-SDR: +3XXExxDkwLqhs/as8CGplDUq1AJBJVJso1L/BFmOtM8vpnaVywow6O1BrmEzLXb4VgACUP2YV
 eslcrctGi3hg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 05:50:52 -0700
IronPort-SDR: HruV6YmFRK3trk0KzruSsyQ5vF0HIDoUvHiNjEr36M/RoETIecCR9QVMcI13KPpemvetU8r4hP
 vWbTZNCdtoYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="411622642"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 19 May 2020 05:50:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0B08E446; Tue, 19 May 2020 15:50:48 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 7/7] i2c: designware: Drop hard coded FIFO depth assignment
Date:   Tue, 19 May 2020 15:50:43 +0300
Message-Id: <20200519125043.6069-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
References: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It's not clear why the commit fe20ff5c7e9c
  ("i2c-designware: Add support for Designware core behind PCI devices.")
followed by commit b61b14154b19
  ("i2c-designware: add support for Intel Lynxpoint")
chose to hard code FIFO depth size. The FIFO depth on all hardware,
I have tested on, can be nicely detected automatically.

Thus, we may safely drop hard coded FIFO sizes from the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch
 drivers/i2c/busses/i2c-designware-common.c |  3 ---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 17 -----------------
 2 files changed, 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e1697ed8b54a..ed302342f8db 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -200,9 +200,6 @@ int i2c_dw_acpi_configure(struct device *device)
 	struct i2c_timings *t = &dev->timings;
 	u32 ss_ht = 0, fp_ht = 0, hs_ht = 0, fs_ht = 0;
 
-	dev->tx_fifo_depth = 32;
-	dev->rx_fifo_depth = 32;
-
 	/*
 	 * Try to get SDA hold time and *CNT values from an ACPI method for
 	 * selected speed modes.
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 3664d76bb976..11a5e4751eab 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -46,8 +46,6 @@ struct dw_scl_sda_cfg {
 
 struct dw_pci_controller {
 	u32 bus_num;
-	u32 tx_fifo_depth;
-	u32 rx_fifo_depth;
 	u32 flags;
 	struct dw_scl_sda_cfg *scl_sda_cfg;
 	int (*setup)(struct pci_dev *pdev, struct dw_pci_controller *c);
@@ -133,41 +131,29 @@ static u32 ehl_get_clk_rate_khz(struct dw_i2c_dev *dev)
 static struct dw_pci_controller dw_pci_controllers[] = {
 	[medfield] = {
 		.bus_num = -1,
-		.tx_fifo_depth = 32,
-		.rx_fifo_depth = 32,
 		.setup = mfld_setup,
 		.get_clk_rate_khz = mfld_get_clk_rate_khz,
 	},
 	[merrifield] = {
 		.bus_num = -1,
-		.tx_fifo_depth = 64,
-		.rx_fifo_depth = 64,
 		.scl_sda_cfg = &mrfld_config,
 		.setup = mrfld_setup,
 	},
 	[baytrail] = {
 		.bus_num = -1,
-		.tx_fifo_depth = 32,
-		.rx_fifo_depth = 32,
 		.scl_sda_cfg = &byt_config,
 	},
 	[haswell] = {
 		.bus_num = -1,
-		.tx_fifo_depth = 32,
-		.rx_fifo_depth = 32,
 		.scl_sda_cfg = &hsw_config,
 	},
 	[cherrytrail] = {
 		.bus_num = -1,
-		.tx_fifo_depth = 32,
-		.rx_fifo_depth = 32,
 		.flags = MODEL_CHERRYTRAIL,
 		.scl_sda_cfg = &byt_config,
 	},
 	[elkhartlake] = {
 		.bus_num = -1,
-		.tx_fifo_depth = 32,
-		.rx_fifo_depth = 32,
 		.get_clk_rate_khz = ehl_get_clk_rate_khz,
 	},
 };
@@ -277,9 +263,6 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		dev->sda_hold_time = cfg->sda_hold;
 	}
 
-	dev->tx_fifo_depth = controller->tx_fifo_depth;
-	dev->rx_fifo_depth = controller->rx_fifo_depth;
-
 	adap = &dev->adapter;
 	adap->owner = THIS_MODULE;
 	adap->class = 0;
-- 
2.26.2

