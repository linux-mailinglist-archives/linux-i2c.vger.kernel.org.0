Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10C0D14FCEE
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Feb 2020 12:39:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgBBLjn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Feb 2020 06:39:43 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10134 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725995AbgBBLjn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 2 Feb 2020 06:39:43 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id D88236DC300D313DC5E2;
        Sun,  2 Feb 2020 19:39:30 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Sun, 2 Feb 2020 19:39:24 +0800
From:   Hanjun Guo <guohanjun@huawei.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
        <linuxarm@huawei.com>, Sheng Feng <fengsheng5@huawei.com>,
        Hanjun Guo <guohanjun@huawei.com>
Subject: [PATCH 2/2] ACPI / APD: Add clock frequency for Hisilicon Hip08-Lite I2C controller
Date:   Sun, 2 Feb 2020 19:34:15 +0800
Message-ID: <1580643255-38214-2-git-send-email-guohanjun@huawei.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <1580643255-38214-1-git-send-email-guohanjun@huawei.com>
References: <1580643255-38214-1-git-send-email-guohanjun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I2C clock frequency of Designware ip for Hisilicon Hip08 Lite
is 125M, use a new ACPI HID to enable it.

Tested-by: Sheng Feng <fengsheng5@huawei.com>
Signed-off-by: Hanjun Guo <guohanjun@huawei.com>
---
 drivers/acpi/acpi_apd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index 71511ae..ba2612e 100644
--- a/drivers/acpi/acpi_apd.c
+++ b/drivers/acpi/acpi_apd.c
@@ -161,6 +161,11 @@ static int st_misc_setup(struct apd_private_data *pdata)
 	.fixed_clk_rate = 250000000,
 };
 
+static const struct apd_device_desc hip08_lite_i2c_desc = {
+	.setup = acpi_apd_setup,
+	.fixed_clk_rate = 125000000,
+};
+
 static const struct apd_device_desc thunderx2_i2c_desc = {
 	.setup = acpi_apd_setup,
 	.fixed_clk_rate = 125000000,
@@ -243,6 +248,7 @@ static int acpi_apd_create_device(struct acpi_device *adev,
 	{ "CAV9007",  APD_ADDR(thunderx2_i2c_desc) },
 	{ "HISI02A1", APD_ADDR(hip07_i2c_desc) },
 	{ "HISI02A2", APD_ADDR(hip08_i2c_desc) },
+	{ "HISI02A3", APD_ADDR(hip08_lite_i2c_desc) },
 	{ "HISI0173", APD_ADDR(hip08_spi_desc) },
 	{ "NXP0001", APD_ADDR(nxp_i2c_desc) },
 #endif
-- 
1.7.12.4

