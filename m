Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB51144AB9B
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 11:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245366AbhKIKim (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 05:38:42 -0500
Received: from mga03.intel.com ([134.134.136.65]:4311 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245347AbhKIKil (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Nov 2021 05:38:41 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="232368048"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="232368048"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 02:35:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="503453985"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
  by orsmga008.jf.intel.com with ESMTP; 09 Nov 2021 02:35:53 -0800
From:   lakshmi.sowjanya.d@intel.com
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, wsa@kernel.org,
        jarkko.nikula@linux.intel.com, bala.senthil@intel.com,
        pandith.n@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [PATCH v1 1/2] i2c: designware-pci: Add support for Fast Mode Plus and High Speed Mode
Date:   Tue,  9 Nov 2021 16:05:51 +0530
Message-Id: <20211109103552.18677-1-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Add support to configure HCNT, LCNT values for Fast Mode Plus and High
Speed Mode.

Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 0f409a4c2da0..174938fc7a7e 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -41,8 +41,12 @@ enum dw_pci_ctl_id_t {
 struct dw_scl_sda_cfg {
 	u32 ss_hcnt;
 	u32 fs_hcnt;
+	u32 fp_hcnt;
+	u32 hs_hcnt;
 	u32 ss_lcnt;
 	u32 fs_lcnt;
+	u32 fp_lcnt;
+	u32 hs_lcnt;
 	u32 sda_hold;
 };
 
@@ -306,8 +310,12 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		cfg = controller->scl_sda_cfg;
 		dev->ss_hcnt = cfg->ss_hcnt;
 		dev->fs_hcnt = cfg->fs_hcnt;
+		dev->fp_hcnt = cfg->fp_hcnt;
+		dev->hs_hcnt = cfg->hs_hcnt;
 		dev->ss_lcnt = cfg->ss_lcnt;
 		dev->fs_lcnt = cfg->fs_lcnt;
+		dev->fp_lcnt = cfg->fp_lcnt;
+		dev->hs_lcnt = cfg->hs_lcnt;
 		dev->sda_hold_time = cfg->sda_hold;
 	}
 
-- 
2.17.1

