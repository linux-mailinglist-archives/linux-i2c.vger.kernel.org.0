Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34617358194
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 13:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbhDHLUT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 07:20:19 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:16832 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbhDHLUT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Apr 2021 07:20:19 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FGJdt58Cxz7tpl;
        Thu,  8 Apr 2021 19:17:54 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 19:19:57 +0800
From:   Yicong Yang <yangyicong@hisilicon.com>
To:     <wsa@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <linux-i2c@vger.kernel.org>, <Sergey.Semin@baikalelectronics.ru>,
        <linux-kernel@vger.kernel.org>
CC:     <digetx@gmail.com>, <treding@nvidia.com>,
        <jarkko.nikula@linux.intel.com>, <rmk+kernel@armlinux.org.uk>,
        <song.bao.hua@hisilicon.com>, <john.garry@huawei.com>,
        <mika.westerberg@linux.intel.com>, <yangyicong@hisilicon.com>,
        <prime.zeng@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v7 5/5] i2c: designware: Switch over to i2c_freq_mode_string()
Date:   Thu, 8 Apr 2021 19:17:21 +0800
Message-ID: <1617880641-664-6-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1617880641-664-1-git-send-email-yangyicong@hisilicon.com>
References: <1617880641-664-1-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Use generic i2c_freq_mode_string() helper to print chosen bus speed.

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index dd27b9d..b64c4c8 100644
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
2.8.1

