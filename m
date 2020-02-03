Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE6615004C
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2020 02:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbgBCBlj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Feb 2020 20:41:39 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10136 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726733AbgBCBli (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 2 Feb 2020 20:41:38 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id E3D2BBEEF0DB7470E538;
        Mon,  3 Feb 2020 09:41:35 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Mon, 3 Feb 2020 09:41:27 +0800
From:   Hanjun Guo <guohanjun@huawei.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
        <linuxarm@huawei.com>, Sheng Feng <fengsheng5@huawei.com>,
        Hanjun Guo <guohanjun@huawei.com>
Subject: [PATCH v2 2/2] i2c: designware: Add ACPI HID for Hisilicon Hip08-Lite I2C controller
Date:   Mon, 3 Feb 2020 09:36:07 +0800
Message-ID: <1580693767-5185-2-git-send-email-guohanjun@huawei.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <1580693767-5185-1-git-send-email-guohanjun@huawei.com>
References: <1580693767-5185-1-git-send-email-guohanjun@huawei.com>
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

