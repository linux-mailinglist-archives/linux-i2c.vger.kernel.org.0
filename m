Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B95714FCEC
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Feb 2020 12:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgBBLjd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Feb 2020 06:39:33 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10135 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725995AbgBBLjd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 2 Feb 2020 06:39:33 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id D2E6FBD7F359B7905BC9;
        Sun,  2 Feb 2020 19:39:30 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Sun, 2 Feb 2020 19:39:23 +0800
From:   Hanjun Guo <guohanjun@huawei.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
        <linuxarm@huawei.com>, Sheng Feng <fengsheng5@huawei.com>,
        Hanjun Guo <guohanjun@huawei.com>
Subject: [PATCH 1/2] i2c: designware: Add ACPI HID for Hisilicon Hip08-Lite I2C controller
Date:   Sun, 2 Feb 2020 19:34:14 +0800
Message-ID: <1580643255-38214-1-git-send-email-guohanjun@huawei.com>
X-Mailer: git-send-email 1.7.12.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add ACPI HID HISI02A3 for Hisilicon Hip08 Lite, which has different
clock frequency from Hip08 for I2C controller.

Tested-by: Sheng Feng <fengsheng5@huawei.com>
Signed-off-by: Hanjun Guo <guohanjun@huawei.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 16dd338..3b7d58c 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -130,6 +130,7 @@ static int dw_i2c_acpi_configure(struct platform_device *pdev)
 	{ "APMC0D0F", 0 },
 	{ "HISI02A1", 0 },
 	{ "HISI02A2", 0 },
+	{ "HISI02A3", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
-- 
1.7.12.4

