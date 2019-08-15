Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 271CB8EE2A
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2019 16:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730452AbfHOOaA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Aug 2019 10:30:00 -0400
Received: from mga01.intel.com ([192.55.52.88]:3187 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730578AbfHOOaA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Aug 2019 10:30:00 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2019 07:29:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; 
   d="scan'208";a="194775089"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2019 07:29:48 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 2/2] i2c: designware-pci: Add support for Elkhart Lake PSE I2C
Date:   Thu, 15 Aug 2019 17:29:44 +0300
Message-Id: <20190815142944.18334-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190815142944.18334-1-jarkko.nikula@linux.intel.com>
References: <20190815142944.18334-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for Intel(R) Programmable Services Engine (Intel(R) PSE) I2C
controller in Intel Elkhart Lake when interface is assigned to the host
processor.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 249ee3ee2a09..050adda7c1bd 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -33,6 +33,7 @@ enum dw_pci_ctl_id_t {
 	baytrail,
 	cherrytrail,
 	haswell,
+	elkhartlake,
 };
 
 struct dw_scl_sda_cfg {
@@ -168,6 +169,14 @@ static struct dw_pci_controller dw_pci_controllers[] = {
 		.flags = MODEL_CHERRYTRAIL,
 		.scl_sda_cfg = &byt_config,
 	},
+	[elkhartlake] = {
+		.bus_num = -1,
+		.bus_cfg = INTEL_MID_STD_CFG | DW_IC_CON_SPEED_FAST,
+		.tx_fifo_depth = 32,
+		.rx_fifo_depth = 32,
+		.functionality = I2C_FUNC_10BIT_ADDR,
+		.clk_khz = 100000,
+	},
 };
 
 #ifdef CONFIG_PM
@@ -340,6 +349,15 @@ static const struct pci_device_id i2_designware_pci_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0x22C5), cherrytrail },
 	{ PCI_VDEVICE(INTEL, 0x22C6), cherrytrail },
 	{ PCI_VDEVICE(INTEL, 0x22C7), cherrytrail },
+	/* Elkhart Lake (PSE I2C) */
+	{ PCI_VDEVICE(INTEL, 0x4bb9), elkhartlake },
+	{ PCI_VDEVICE(INTEL, 0x4bba), elkhartlake },
+	{ PCI_VDEVICE(INTEL, 0x4bbb), elkhartlake },
+	{ PCI_VDEVICE(INTEL, 0x4bbc), elkhartlake },
+	{ PCI_VDEVICE(INTEL, 0x4bbd), elkhartlake },
+	{ PCI_VDEVICE(INTEL, 0x4bbe), elkhartlake },
+	{ PCI_VDEVICE(INTEL, 0x4bbf), elkhartlake },
+	{ PCI_VDEVICE(INTEL, 0x4bc0), elkhartlake },
 	{ 0,}
 };
 MODULE_DEVICE_TABLE(pci, i2_designware_pci_ids);
-- 
2.23.0.rc1

