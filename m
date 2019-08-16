Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22CE5902BB
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 15:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfHPNRI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 09:17:08 -0400
Received: from mga01.intel.com ([192.55.52.88]:60896 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726597AbfHPNRI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Aug 2019 09:17:08 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Aug 2019 06:17:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,393,1559545200"; 
   d="scan'208";a="177180450"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 16 Aug 2019 06:17:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8EA02190; Fri, 16 Aug 2019 16:17:05 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Jean Delvare <jdelvare@suse.de>
Subject: [PATCH v1] i2c: i801: Avoid memory leak in check_acpi_smo88xx_device()
Date:   Fri, 16 Aug 2019 16:17:05 +0300
Message-Id: <20190816131705.77750-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

check_acpi_smo88xx_device() utilizes acpi_get_object_info() which in its turn
allocates a buffer. User is responsible to clean allocated resources. The last
has been missed in the original code. Fix it here.

While here, replace !ACPI_SUCCESS() with ACPI_FAILURE().

Fixes: 19b07cb4a187 ("i2c: i801: Register optional lis3lv02d I2C device on Dell machines")
Cc: Pali Rohár <pali.rohar@gmail.com>
Cc: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-i801.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 09b7e27ca97b..1e4cde64293b 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1194,19 +1194,28 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
 	int i;
 
 	status = acpi_get_object_info(obj_handle, &info);
-	if (!ACPI_SUCCESS(status) || !(info->valid & ACPI_VALID_HID))
+	if (ACPI_FAILURE(status))
 		return AE_OK;
 
+	if (!(info->valid & ACPI_VALID_HID))
+		goto smo88xx_not_found;
+
 	hid = info->hardware_id.string;
 	if (!hid)
-		return AE_OK;
+		goto smo88xx_not_found;
 
 	i = match_string(acpi_smo8800_ids, ARRAY_SIZE(acpi_smo8800_ids), hid);
 	if (i < 0)
-		return AE_OK;
+		goto smo88xx_not_found;
+
+	kfree(info);
 
 	*((bool *)return_value) = true;
 	return AE_CTRL_TERMINATE;
+
+smo88xx_not_found:
+	kfree(info);
+	return AE_OK;
 }
 
 static bool is_dell_system_with_lis3lv02d(void)
-- 
2.23.0.rc1

