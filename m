Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB263503CB
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 17:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235499AbhCaPtV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 11:49:21 -0400
Received: from mga14.intel.com ([192.55.52.115]:27968 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235355AbhCaPsu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 11:48:50 -0400
IronPort-SDR: 2x+20VHbG7PjJWXFCimfLFt4XrHj36Qgu+k0xT9HGkgimTo3SHQT8bpQVNuo+H/kQ7+7R2NpRK
 WfYsCDJOuB5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="191514143"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="191514143"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 08:48:50 -0700
IronPort-SDR: lC9xrEGgDPF7L8GrKDfnlXdvRa8rTfeFu+gfW8Dn8Mn1QLa3A8LsVmXS04cA4l2DIHt8a210cH
 kq0jC3RezlJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="438856957"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 31 Mar 2021 08:48:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6C09D269; Wed, 31 Mar 2021 18:49:03 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v1 2/2] i2c: designware: Get rid of legacy platform data
Date:   Wed, 31 Mar 2021 18:48:51 +0300
Message-Id: <20210331154851.8456-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331154851.8456-1-andriy.shevchenko@linux.intel.com>
References: <20210331154851.8456-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Platform data is a legacy interface to supply device properties
to the driver. In this case we don't have anymore in-kernel users
for it. Just remove it for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c  |  7 +------
 include/linux/platform_data/i2c-designware.h | 13 -------------
 2 files changed, 1 insertion(+), 19 deletions(-)
 delete mode 100644 include/linux/platform_data/i2c-designware.h

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 0dfeb2d11603..4b37f28ec0c6 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -22,7 +22,6 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/platform_data/i2c-designware.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
@@ -206,7 +205,6 @@ static const struct dmi_system_id dw_i2c_hwmon_class_dmi[] = {
 
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
-	struct dw_i2c_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct i2c_adapter *adap;
 	struct dw_i2c_dev *dev;
 	struct i2c_timings *t;
@@ -236,10 +234,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	reset_control_deassert(dev->rst);
 
 	t = &dev->timings;
-	if (pdata)
-		t->bus_freq_hz = pdata->i2c_scl_freq;
-	else
-		i2c_parse_fw_timings(&pdev->dev, t, false);
+	i2c_parse_fw_timings(&pdev->dev, t, false);
 
 	i2c_dw_adjust_bus_speed(dev);
 
diff --git a/include/linux/platform_data/i2c-designware.h b/include/linux/platform_data/i2c-designware.h
deleted file mode 100644
index 014c4a5a7e13..000000000000
--- a/include/linux/platform_data/i2c-designware.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright(c) 2014 Intel Corporation.
- */
-
-#ifndef I2C_DESIGNWARE_H
-#define I2C_DESIGNWARE_H
-
-struct dw_i2c_platform_data {
-	unsigned int i2c_scl_freq;
-};
-
-#endif
-- 
2.30.2

