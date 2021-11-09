Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEC544AB9C
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 11:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245377AbhKIKir (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 05:38:47 -0500
Received: from mga03.intel.com ([134.134.136.65]:4311 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245372AbhKIKio (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Nov 2021 05:38:44 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="232368055"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="232368055"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 02:35:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="503453998"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
  by orsmga008.jf.intel.com with ESMTP; 09 Nov 2021 02:35:56 -0800
From:   lakshmi.sowjanya.d@intel.com
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, wsa@kernel.org,
        jarkko.nikula@linux.intel.com, bala.senthil@intel.com,
        pandith.n@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [PATCH v1 2/2] i2c: designware-pci: Set ideal timing parameters for Elkhart Lake PSE
Date:   Tue,  9 Nov 2021 16:05:52 +0530
Message-Id: <20211109103552.18677-2-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211109103552.18677-1-lakshmi.sowjanya.d@intel.com>
References: <20211109103552.18677-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Set optimal HCNT, LCNT and hold time values for all the speeds supported
in Intel Programmable Service Engine I2C controller in Intel Elkhart
Lake.

Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 174938fc7a7e..3418148f8bb5 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -84,6 +84,19 @@ static struct dw_scl_sda_cfg hsw_config = {
 	.sda_hold = 0x9,
 };
 
+/* Elkhart Lake HCNT/LCNT/SDA hold time */
+static struct dw_scl_sda_cfg ehl_config = {
+	.ss_hcnt = 0x190,
+	.fs_hcnt = 0x4E,
+	.fp_hcnt = 0x1A,
+	.hs_hcnt = 0x1F,
+	.ss_lcnt = 0x1d6,
+	.fs_lcnt = 0x96,
+	.fp_lcnt = 0x32,
+	.hs_lcnt = 0x36,
+	.sda_hold = 0x1E,
+};
+
 /* NAVI-AMD HCNT/LCNT/SDA hold time */
 static struct dw_scl_sda_cfg navi_amd_config = {
 	.ss_hcnt = 0x1ae,
@@ -200,6 +213,7 @@ static struct dw_pci_controller dw_pci_controllers[] = {
 	},
 	[elkhartlake] = {
 		.bus_num = -1,
+		.scl_sda_cfg = &ehl_config,
 		.get_clk_rate_khz = ehl_get_clk_rate_khz,
 	},
 	[navi_amd] = {
-- 
2.17.1

