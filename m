Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B49E723EA82
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 11:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbgHGJih (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 05:38:37 -0400
Received: from spam01.hygon.cn ([110.188.70.11]:58222 "EHLO spam2.hygon.cn"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726382AbgHGJib (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Aug 2020 05:38:31 -0400
Received: from MK-DB.hygon.cn ([172.23.18.60])
        by spam2.hygon.cn with ESMTP id 0779b7L1041093;
        Fri, 7 Aug 2020 17:37:07 +0800 (GMT-8)
        (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
        by MK-DB.hygon.cn with ESMTP id 0779b09i079166;
        Fri, 7 Aug 2020 17:37:00 +0800 (GMT-8)
        (envelope-from puwen@hygon.cn)
Received: from ubuntu1604-2.higon.com (172.23.18.44) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Fri, 7 Aug 2020
 17:36:45 +0800
From:   Pu Wen <puwen@hygon.cn>
To:     <rjw@rjwysocki.net>, <lenb@kernel.org>,
        <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <wsa@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, Pu Wen <puwen@hygon.cn>
Subject: [PATCH RESEND] i2c: designware: Add device HID for Hygon I2C controller
Date:   Fri, 7 Aug 2020 17:35:29 +0800
Message-ID: <20200807093529.5343-1-puwen@hygon.cn>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.23.18.44]
X-ClientProxiedBy: cncheex01.Hygon.cn (172.23.18.10) To cncheex01.Hygon.cn
 (172.23.18.10)
X-MAIL: spam2.hygon.cn 0779b7L1041093
X-DNSRBL: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add device HID HYGO0010 to match the Hygon ACPI Vendor ID (HYGO) that
was registered in http://www.uefi.org/acpi_id_list, and the I2C
controller on Hygon paltform will use the HID.

Signed-off-by: Pu Wen <puwen@hygon.cn>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Wolfram Sang <wsa@kernel.org>
---
 drivers/acpi/acpi_apd.c                     | 1 +
 drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index ba2612e9a0eb..f24f6d3f1fa5 100644
--- a/drivers/acpi/acpi_apd.c
+++ b/drivers/acpi/acpi_apd.c
@@ -240,6 +240,7 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
 	{ "AMDI0020", APD_ADDR(cz_uart_desc) },
 	{ "AMD0030", },
 	{ "AMD0040", APD_ADDR(st_misc_desc)},
+	{ "HYGO0010", APD_ADDR(wt_i2c_desc) },
 #endif
 #ifdef CONFIG_ARM64
 	{ "APMC0D0F", APD_ADDR(xgene_i2c_desc) },
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index a71bc58fc03c..0dfeb2d11603 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -55,6 +55,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ "HISI02A1", 0 },
 	{ "HISI02A2", 0 },
 	{ "HISI02A3", 0 },
+	{ "HYGO0010", ACCESS_INTR_MASK },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
-- 
2.23.0

