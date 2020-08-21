Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEBE24DC7E
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Aug 2020 19:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbgHURDt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Aug 2020 13:03:49 -0400
Received: from mga04.intel.com ([192.55.52.120]:26212 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728690AbgHURDm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Aug 2020 13:03:42 -0400
IronPort-SDR: 3/X06w+ggsKw4lhqA9rYhAWdXL/+NZkNDn0JqT5ad6laI/fxVFr9YFXEqvn+qvcuoPU8fAe9n1
 np/ogU1JfNNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9720"; a="152997099"
X-IronPort-AV: E=Sophos;i="5.76,337,1592895600"; 
   d="scan'208";a="152997099"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2020 10:03:37 -0700
IronPort-SDR: /+WkHO9I2X/MUCFCYAWLRj0Co8UWck+gxfTaXHSPDtS7ck+Sl5P5I19EeF0WFC7KhMJRNYwdz5
 ocKHLByj4qaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,337,1592895600"; 
   d="scan'208";a="321323668"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 21 Aug 2020 10:03:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 42AD873; Fri, 21 Aug 2020 20:03:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-acpi@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] i2c: acpi: Remove dead code, i.e. i2c_acpi_match_device()
Date:   Fri, 21 Aug 2020 20:03:34 +0300
Message-Id: <20200821170334.43555-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200821170334.43555-1-andriy.shevchenko@linux.intel.com>
References: <20200821170334.43555-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We have no users of i2c_acpi_match_device() anymore and seems
will not have them in the future, thus remove dead code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-acpi.c | 10 ----------
 drivers/i2c/i2c-core.h      |  9 ---------
 2 files changed, 19 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 2ade99b105b9..e627d7b2790f 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -276,16 +276,6 @@ void i2c_acpi_register_devices(struct i2c_adapter *adap)
 		dev_warn(&adap->dev, "failed to enumerate I2C slaves\n");
 }
 
-const struct acpi_device_id *
-i2c_acpi_match_device(const struct acpi_device_id *matches,
-		      struct i2c_client *client)
-{
-	if (!(client && matches))
-		return NULL;
-
-	return acpi_match_device(matches, &client->dev);
-}
-
 static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] = {
 	/*
 	 * These Silead touchscreen controllers only work at 400KHz, for
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 94ff1693b391..8ce261167a2d 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -59,20 +59,11 @@ static inline int __i2c_check_suspended(struct i2c_adapter *adap)
 }
 
 #ifdef CONFIG_ACPI
-const struct acpi_device_id *
-i2c_acpi_match_device(const struct acpi_device_id *matches,
-		      struct i2c_client *client);
 void i2c_acpi_register_devices(struct i2c_adapter *adap);
 
 int i2c_acpi_get_irq(struct i2c_client *client);
 #else /* CONFIG_ACPI */
 static inline void i2c_acpi_register_devices(struct i2c_adapter *adap) { }
-static inline const struct acpi_device_id *
-i2c_acpi_match_device(const struct acpi_device_id *matches,
-		      struct i2c_client *client)
-{
-	return NULL;
-}
 
 static inline int i2c_acpi_get_irq(struct i2c_client *client)
 {
-- 
2.28.0

