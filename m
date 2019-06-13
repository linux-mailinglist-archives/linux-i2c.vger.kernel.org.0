Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3CFB445A5
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 18:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392914AbfFMQpc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 12:45:32 -0400
Received: from mga11.intel.com ([192.55.52.93]:58261 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730370AbfFMQpc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 Jun 2019 12:45:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Jun 2019 09:45:32 -0700
X-ExtLoop1: 1
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 13 Jun 2019 09:45:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 95586920; Thu, 13 Jun 2019 19:45:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>
Subject: [PATCH v1 1/3] i2c: i801: Fix kernel crash in is_dell_system_with_lis3lv02d()
Date:   Thu, 13 Jun 2019 19:45:27 +0300
Message-Id: <20190613164529.63482-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The commit

  19b07cb4a187 ("i2c: i801: Register optional lis3lv02d I2C device on Dell machines")

introduced a new check in order to enumerate some slave devices on Dell
machines. Though, it brings a regression on machines where DMI vendor is not set.

 BUG: kernel NULL pointer dereference, address: 0000000000000000
 #PF: supervisor read access in kernel mode
 #PF: error_code(0x0000) - not-present page
 PGD 0 P4D 0
 Oops: 0000 [#1] SMP PTI
 CPU: 8 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc4-next-20190613+ #317
 RIP: 0010:strcmp+0xc/0x20

To fix this crash, check if vendor field is present before accessing to it.

Fixes: 19b07cb4a187 ("i2c: i801: Register optional lis3lv02d I2C device on Dell machines")
Cc: Pali Rohár <pali.rohar@gmail.com>
Cc: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-i801.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 2d9f77ea02e4..694eb636b40b 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1180,7 +1180,7 @@ static bool is_dell_system_with_lis3lv02d(void)
 	const char *vendor;
 
 	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
-	if (strcmp(vendor, "Dell Inc.") != 0)
+	if (!vendor || strcmp(vendor, "Dell Inc."))
 		return false;
 
 	/*
-- 
2.20.1

