Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C342D24DC7B
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Aug 2020 19:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgHURDq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Aug 2020 13:03:46 -0400
Received: from mga04.intel.com ([192.55.52.120]:26212 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728752AbgHURDi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Aug 2020 13:03:38 -0400
IronPort-SDR: qjspIAUN+RjUqsLB+933GLRFm8vCOUOdtGWtCRYe3UyxnXGaLedBwgJ60ZeDIhPWi5Jg7wI+Wt
 s2kKuoCcXc7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9720"; a="152997098"
X-IronPort-AV: E=Sophos;i="5.76,337,1592895600"; 
   d="scan'208";a="152997098"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2020 10:03:37 -0700
IronPort-SDR: gT4eKFERZhAbbCt3E1i+7wPq5zRhNRH1RNKZlxg/MSffAJqd1PPefWyHsZ3zn6R24emE5f07Il
 Jk3uj6ohH43w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,337,1592895600"; 
   d="scan'208";a="321323667"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 21 Aug 2020 10:03:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 372321FD; Fri, 21 Aug 2020 20:03:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-acpi@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] i2c: core: Don't fail PRP0001 enumeration when no ID table exist
Date:   Fri, 21 Aug 2020 20:03:33 +0300
Message-Id: <20200821170334.43555-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When commit c64ffff7a9d1 ("i2c: core: Allow empty id_table in ACPI case
as well") fixed the enumeration of I²C devices on ACPI enabled platforms
when driver has no ID table, it missed the PRP0001 support.

i2c_device_match() and i2c_acpi_match_device() differently match
driver against given device. Use acpi_driver_match_device(), that is used
in the former, in i2c_device_probe() and don't fail PRP0001 enumeration
when no ID table exist.

Fixes: c64ffff7a9d1 ("i2c: core: Allow empty id_table in ACPI case as well")
BugLink: https://stackoverflow.com/q/63519678/2511795
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 34a9609f256d..5ec082e2039d 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -480,7 +480,7 @@ static int i2c_device_probe(struct device *dev)
 	 * or ACPI ID table is supplied for the probing device.
 	 */
 	if (!driver->id_table &&
-	    !i2c_acpi_match_device(dev->driver->acpi_match_table, client) &&
+	    !acpi_driver_match_device(dev, dev->driver) &&
 	    !i2c_of_match_device(dev->driver->of_match_table, client)) {
 		status = -ENODEV;
 		goto put_sync_adapter;
-- 
2.28.0

