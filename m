Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC8634E984
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 15:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbhC3Nqq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 09:46:46 -0400
Received: from mga14.intel.com ([192.55.52.115]:6690 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232152AbhC3NqY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Mar 2021 09:46:24 -0400
IronPort-SDR: /J3n23RKS3z/C3QmdVraSquGJQd7N5ulejCySABo9edEXDRURqlFtNbddNZeZ8EXmHXW5jKMHE
 fc3n6He2Li/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="191242471"
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="191242471"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 06:46:23 -0700
IronPort-SDR: uLRJx/z8D/gps1Zyl7f6ZtbScajYLm0i3sFCskqyDytfFnneyrPnOGMm+t6la4ROnhVilynRpJ
 WXtrvHD2pRrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="595470948"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 30 Mar 2021 06:46:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9971AF2; Tue, 30 Mar 2021 16:46:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yicong Yang <yangyicong@hisilicon.com>
Subject: [PATCH v1 1/1] i2c: designware: Switch over to i2c_freq_mode_string()
Date:   Tue, 30 Mar 2021 16:46:33 +0300
Message-Id: <20210330134633.29889-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use generic i2c_freq_mode_string() helper to print chosen bus speed.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
Depends on the "Add support for HiSilicon I2C controller" series.
Message-Id - 1617109549-4013-1-git-send-email-yangyicong@hisilicon.com
Yicong, feel free to attach to your new version of it.

 drivers/i2c/busses/i2c-designware-master.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index dd27b9dbe931..b64c4c8d1421 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -35,10 +35,10 @@ static void i2c_dw_configure_fifo_master(struct dw_i2c_dev *dev)
 
 static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 {
-	const char *mode_str, *fp_str = "";
 	u32 comp_param1;
 	u32 sda_falling_time, scl_falling_time;
 	struct i2c_timings *t = &dev->timings;
+	const char *fp_str = "";
 	u32 ic_clk;
 	int ret;
 
@@ -153,22 +153,10 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 
 	ret = i2c_dw_set_sda_hold(dev);
 	if (ret)
-		goto out;
-
-	switch (dev->master_cfg & DW_IC_CON_SPEED_MASK) {
-	case DW_IC_CON_SPEED_STD:
-		mode_str = "Standard Mode";
-		break;
-	case DW_IC_CON_SPEED_HIGH:
-		mode_str = "High Speed Mode";
-		break;
-	default:
-		mode_str = "Fast Mode";
-	}
-	dev_dbg(dev->dev, "Bus speed: %s%s\n", mode_str, fp_str);
+		return ret;
 
-out:
-	return ret;
+	dev_dbg(dev->dev, "Bus speed: %s\n", i2c_freq_mode_string(t->bus_freq_hz));
+	return 0;
 }
 
 /**
-- 
2.30.2

