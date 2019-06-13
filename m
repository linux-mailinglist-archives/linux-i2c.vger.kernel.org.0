Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 522B3445AB
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 18:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392913AbfFMQpf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 12:45:35 -0400
Received: from mga12.intel.com ([192.55.52.136]:56168 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730647AbfFMQpf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 Jun 2019 12:45:35 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Jun 2019 09:45:34 -0700
X-ExtLoop1: 1
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 13 Jun 2019 09:45:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AC95011A4; Thu, 13 Jun 2019 19:45:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] i2c: i801: Remove linux/init.h and sort headers
Date:   Thu, 13 Jun 2019 19:45:29 +0300
Message-Id: <20190613164529.63482-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613164529.63482-1-andriy.shevchenko@linux.intel.com>
References: <20190613164529.63482-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There is no need to include linux/init.h when at the same time
we include linux/module.h.

Remove redundant inclusion.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-i801.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 03100f5fc0e9..5613c1ef1af4 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -85,7 +85,6 @@
 #include <linux/stddef.h>
 #include <linux/delay.h>
 #include <linux/ioport.h>
-#include <linux/init.h>
 #include <linux/i2c.h>
 #include <linux/i2c-smbus.h>
 #include <linux/acpi.h>
-- 
2.20.1

