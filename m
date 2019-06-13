Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2D23445AA
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 18:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730370AbfFMQpd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 12:45:33 -0400
Received: from mga04.intel.com ([192.55.52.120]:44207 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392913AbfFMQpc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 Jun 2019 12:45:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Jun 2019 09:45:32 -0700
X-ExtLoop1: 1
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 13 Jun 2019 09:45:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A16A6141; Thu, 13 Jun 2019 19:45:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] i2c: i801: Use match_string() helper to simplify the code
Date:   Thu, 13 Jun 2019 19:45:28 +0300
Message-Id: <20190613164529.63482-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613164529.63482-1-andriy.shevchenko@linux.intel.com>
References: <20190613164529.63482-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

match_string() returns the array index of a matching string.
Use it instead of the open-coded implementation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-i801.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 694eb636b40b..03100f5fc0e9 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1164,14 +1164,12 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
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

