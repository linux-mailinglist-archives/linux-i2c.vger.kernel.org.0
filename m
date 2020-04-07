Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1490B1A0E74
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 15:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728907AbgDGNfY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 09:35:24 -0400
Received: from mga01.intel.com ([192.55.52.88]:26208 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728862AbgDGNfY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Apr 2020 09:35:24 -0400
IronPort-SDR: pByNN9zuz9tarPvr0WCmH0l1QMONvkLvZIpPrFgGtBBAnGysqMr1/lFJB7rYdoILAhrklaEw8t
 nfqJUefWj4Yw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 06:35:23 -0700
IronPort-SDR: LR1tlzngQeL0ikCO4rSxMMpk3LUxMjQ0FHyNHK2yOqX33DKUL2BlgM+B96Vc+tlzel8FMSPmzp
 kwB8Pb1sItFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,354,1580803200"; 
   d="scan'208";a="424748790"
Received: from wwanmoha-ilbpg2.png.intel.com ([10.88.227.42])
  by orsmga005.jf.intel.com with ESMTP; 07 Apr 2020 06:35:22 -0700
From:   Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
To:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com
Cc:     linux-i2c@vger.kernel.org, wan.ahmad.zainie.wan.mohamad@intel.com
Subject: [PATCH 2/2] i2c: designware: Calculate SCL timing parameter for High Speed Mode
Date:   Tue,  7 Apr 2020 21:34:39 +0800
Message-Id: <20200407133439.23422-3-wan.ahmad.zainie.wan.mohamad@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407133439.23422-1-wan.ahmad.zainie.wan.mohamad@intel.com>
References: <20200407133439.23422-1-wan.ahmad.zainie.wan.mohamad@intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Custom parameters for HCNT/LCNT are not available for OF based system.
Thus, we will use existing SCL timing parameter calculation functions
for High Speed Mode too.

The value for the parameters tSYMBOL and tLOW is taken from DesignWare
DW_apb_i2c Databook v2.01a, section 3.15.4.6. The calculation should
assume higher bus load since it gives slower timing parameter.

Signed-off-by: Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 23038d7272da..b6c17b550d31 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -129,10 +129,22 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 			dev->master_cfg |= DW_IC_CON_SPEED_FAST;
 			dev->hs_hcnt = 0;
 			dev->hs_lcnt = 0;
-		} else if (dev->hs_hcnt && dev->hs_lcnt) {
-			dev_dbg(dev->dev, "High Speed Mode HCNT:LCNT = %d:%d\n",
-				dev->hs_hcnt, dev->hs_lcnt);
+		} else if (!dev->hs_hcnt || !dev->hs_lcnt) {
+			ic_clk = i2c_dw_clk_rate(dev);
+			dev->hs_hcnt =
+				i2c_dw_scl_hcnt(ic_clk,
+						160,	/* tHIGH = 160 ns */
+						sda_falling_time,
+						0,	/* DW default */
+						0);	/* No offset */
+			dev->hs_lcnt =
+				i2c_dw_scl_lcnt(ic_clk,
+						320,	/* tLOW = 320 ns */
+						scl_falling_time,
+						0);	/* No offset */
 		}
+		dev_dbg(dev->dev, "High Speed Mode HCNT:LCNT = %d:%d\n",
+			dev->hs_hcnt, dev->hs_lcnt);
 	}
 
 	ret = i2c_dw_set_sda_hold(dev);
-- 
2.17.1

