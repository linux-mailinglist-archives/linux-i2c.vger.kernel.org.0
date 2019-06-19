Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 029894BC98
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2019 17:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbfFSPM5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jun 2019 11:12:57 -0400
Received: from mga04.intel.com ([192.55.52.120]:11269 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727002AbfFSPM5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jun 2019 11:12:57 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Jun 2019 08:12:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; 
   d="scan'208";a="186485660"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jun 2019 08:12:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A0F3155; Wed, 19 Jun 2019 18:12:54 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH v2 2/2] i2c: i801: Remove linux/init.h and sort headers
Date:   Wed, 19 Jun 2019 18:12:48 +0300
Message-Id: <20190619151248.75618-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190619151248.75618-1-andriy.shevchenko@linux.intel.com>
References: <20190619151248.75618-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There is no need to include linux/init.h when at the same time
we include linux/module.h.

Remove redundant inclusion.

For more details, refer to the commit
  0fd972a7d91d ("module: relocate module_init from init.h to module.h")
where the split had been introduced.

Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index b9c5d7933d12..69c3ccb69669 100644
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

