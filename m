Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 768404BC99
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2019 17:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbfFSPM5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jun 2019 11:12:57 -0400
Received: from mga14.intel.com ([192.55.52.115]:16538 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbfFSPM5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jun 2019 11:12:57 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Jun 2019 08:12:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; 
   d="scan'208";a="358641562"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 19 Jun 2019 08:12:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9065314B; Wed, 19 Jun 2019 18:12:54 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/2] i2c: i801: Use match_string() helper to simplify the code
Date:   Wed, 19 Jun 2019 18:12:47 +0300
Message-Id: <20190619151248.75618-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

match_string() returns the array index of a matching string.
Use it instead of the open-coded implementation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 694eb636b40b..b9c5d7933d12 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -92,6 +92,7 @@
 #include <linux/io.h>
 #include <linux/dmi.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/wait.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
@@ -1164,14 +1165,12 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
 	if (!hid)
 		return AE_OK;
 
-	for (i = 0; i < ARRAY_SIZE(acpi_smo8800_ids); ++i) {
-		if (strcmp(hid, acpi_smo8800_ids[i]) == 0) {
-			*((bool *)return_value) = true;
-			return AE_CTRL_TERMINATE;
-		}
-	}
+	i = match_string(acpi_smo8800_ids, ARRAY_SIZE(acpi_smo8800_ids), hid);
+	if (i < 0)
+		return AE_OK;
 
-	return AE_OK;
+	*((bool *)return_value) = true;
+	return AE_CTRL_TERMINATE;
 }
 
 static bool is_dell_system_with_lis3lv02d(void)
-- 
2.20.1

