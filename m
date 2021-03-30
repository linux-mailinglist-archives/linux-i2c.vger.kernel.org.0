Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A56F34EA44
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 16:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231951AbhC3OWe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 10:22:34 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14641 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232002AbhC3OWK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Mar 2021 10:22:10 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F8s5T4FkhznWLP;
        Tue, 30 Mar 2021 22:19:25 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Tue, 30 Mar 2021 22:21:56 +0800
From:   Yicong Yang <yangyicong@hisilicon.com>
To:     <wsa@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <linux-i2c@vger.kernel.org>, <Sergey.Semin@baikalelectronics.ru>,
        <linux-kernel@vger.kernel.org>
CC:     <digetx@gmail.com>, <treding@nvidia.com>,
        <jarkko.nikula@linux.intel.com>, <rmk+kernel@armlinux.org.uk>,
        <song.bao.hua@hisilicon.com>, <john.garry@huawei.com>,
        <mika.westerberg@linux.intel.com>, <yangyicong@hisilicon.com>,
        <prime.zeng@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v5 2/5] i2c: core: add api to provide frequency mode strings
Date:   Tue, 30 Mar 2021 22:19:23 +0800
Message-ID: <1617113966-40498-3-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
References: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
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

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 include/linux/i2c.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 10bd0b0..6837e64 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -47,6 +47,26 @@ typedef int (*i2c_slave_cb_t)(struct i2c_client *client,
 #define I2C_MAX_HIGH_SPEED_MODE_FREQ	3400000
 #define I2C_MAX_ULTRA_FAST_MODE_FREQ	5000000
 
+static inline const char *i2c_freq_mode_string(u32 bus_freq_hz)
+{
+	switch (bus_freq_hz) {
+	case I2C_MAX_STANDARD_MODE_FREQ:
+		return "Standard Mode(100KHz)";
+	case I2C_MAX_FAST_MODE_FREQ:
+		return "Fast Mode(400KHz)";
+	case I2C_MAX_FAST_MODE_PLUS_FREQ:
+		return "Fast Mode Plus(1.0MHz)";
+	case I2C_MAX_TURBO_MODE_FREQ:
+		return "Turbo Mode(1.4MHz)";
+	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
+		return "High Speed Mode(3.4MHz)";
+	case I2C_MAX_ULTRA_FAST_MODE_FREQ:
+		return "Ultra Fast Mode(5.0MHz)";
+	default:
+		return "Unknown Mode";
+	}
+}
+
 struct module;
 struct property_entry;
 
-- 
2.8.1

