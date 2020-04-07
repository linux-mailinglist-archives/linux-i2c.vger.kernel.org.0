Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E41E11A0E71
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 15:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbgDGNfW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 09:35:22 -0400
Received: from mga01.intel.com ([192.55.52.88]:26208 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728482AbgDGNfW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Apr 2020 09:35:22 -0400
IronPort-SDR: tj0Y7fLcCrT9IYg1h6u2z+Ld0KflGELg5w5XXPg5bxjUF8BOdR//FuUfjCppojj8XjWds0vovi
 ZfuBmJx4lmQw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 06:35:22 -0700
IronPort-SDR: gbSVAd/v5GwbE2tAIeSvJ2OfxgtRD1JlvObPvxHYgjHrsiISh1MvoJkZbJkqGX0P6NsNK1adjK
 Hh65lif6unsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,354,1580803200"; 
   d="scan'208";a="424748781"
Received: from wwanmoha-ilbpg2.png.intel.com ([10.88.227.42])
  by orsmga005.jf.intel.com with ESMTP; 07 Apr 2020 06:35:20 -0700
From:   Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
To:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com
Cc:     linux-i2c@vger.kernel.org, wan.ahmad.zainie.wan.mohamad@intel.com
Subject: [PATCH 1/2] i2c: designware: Calculate SCL timing parameter for Fast Mode Plus
Date:   Tue,  7 Apr 2020 21:34:38 +0800
Message-Id: <20200407133439.23422-2-wan.ahmad.zainie.wan.mohamad@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407133439.23422-1-wan.ahmad.zainie.wan.mohamad@intel.com>
References: <20200407133439.23422-1-wan.ahmad.zainie.wan.mohamad@intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Custom parameters for HCNT/LCNT are not available for OF based system.
Thus, we will use existing SCL timing parameter calculation functions
for Fast Mode Plus.

Signed-off-by: Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 3a58eef20936..23038d7272da 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -76,14 +76,27 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 	 */
 	if (t->bus_freq_hz == 1000000) {
 		/*
-		 * Check are fast mode plus parameters available and use
-		 * fast mode if not.
+		 * Check are Fast Mode Plus parameters available. Calculate
+		 * SCL timing parameters for Fast Mode Plus if not set.
 		 */
 		if (dev->fp_hcnt && dev->fp_lcnt) {
 			dev->fs_hcnt = dev->fp_hcnt;
 			dev->fs_lcnt = dev->fp_lcnt;
-			fp_str = " Plus";
+		} else {
+			ic_clk = i2c_dw_clk_rate(dev);
+			dev->fs_hcnt =
+				i2c_dw_scl_hcnt(ic_clk,
+						260,	/* tHIGH = 260 ns */
+						sda_falling_time,
+						0,	/* DW default */
+						0);	/* No offset */
+			dev->fs_lcnt =
+				i2c_dw_scl_lcnt(ic_clk,
+						500,	/* tLOW = 500 ns */
+						scl_falling_time,
+						0);	/* No offset */
 		}
+		fp_str = " Plus";
 	}
 	/*
 	 * Calculate SCL timing parameters for fast mode if not set. They are
-- 
2.17.1

