Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA17635818F
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 13:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbhDHLUR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 07:20:17 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15187 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbhDHLUQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Apr 2021 07:20:16 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGJd73MbhzpWZr;
        Thu,  8 Apr 2021 19:17:15 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 19:19:55 +0800
From:   Yicong Yang <yangyicong@hisilicon.com>
To:     <wsa@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <linux-i2c@vger.kernel.org>, <Sergey.Semin@baikalelectronics.ru>,
        <linux-kernel@vger.kernel.org>
CC:     <digetx@gmail.com>, <treding@nvidia.com>,
        <jarkko.nikula@linux.intel.com>, <rmk+kernel@armlinux.org.uk>,
        <song.bao.hua@hisilicon.com>, <john.garry@huawei.com>,
        <mika.westerberg@linux.intel.com>, <yangyicong@hisilicon.com>,
        <prime.zeng@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v7 2/5] i2c: core: add api to provide frequency mode strings
Date:   Thu, 8 Apr 2021 19:17:18 +0800
Message-ID: <1617880641-664-3-git-send-email-yangyicong@hisilicon.com>
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

Some I2C drivers like Designware and HiSilicon will print the
bus frequency mode information, so add a public one that everyone
can make use of.

Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/i2c/i2c-core-base.c | 21 +++++++++++++++++++++
 include/linux/i2c.h         |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index de9402c..775b8cc 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -76,6 +76,27 @@ void i2c_transfer_trace_unreg(void)
 	static_branch_dec(&i2c_trace_msg_key);
 }
 
+const char *i2c_freq_mode_string(u32 bus_freq_hz)
+{
+	switch (bus_freq_hz) {
+	case I2C_MAX_STANDARD_MODE_FREQ:
+		return "Standard Mode (100 kHz)";
+	case I2C_MAX_FAST_MODE_FREQ:
+		return "Fast Mode (400 kHz)";
+	case I2C_MAX_FAST_MODE_PLUS_FREQ:
+		return "Fast Mode Plus (1.0 MHz)";
+	case I2C_MAX_TURBO_MODE_FREQ:
+		return "Turbo Mode (1.4 MHz)";
+	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
+		return "High Speed Mode (3.4 MHz)";
+	case I2C_MAX_ULTRA_FAST_MODE_FREQ:
+		return "Ultra Fast Mode (5.0 MHz)";
+	default:
+		return "Unknown Mode";
+	}
+}
+EXPORT_SYMBOL_GPL(i2c_freq_mode_string);
+
 const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
 						const struct i2c_client *client)
 {
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 10bd0b0..0813be1 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -51,6 +51,9 @@ struct module;
 struct property_entry;
 
 #if IS_ENABLED(CONFIG_I2C)
+/* Return the Frequency mode string based on the bus frequency */
+const char *i2c_freq_mode_string(u32 bus_freq_hz);
+
 /*
  * The master routines are the ones normally used to transmit data to devices
  * on a bus (or read from them). Apart from two basic transfer functions to
-- 
2.8.1

