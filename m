Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B38F642DAB6
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Oct 2021 15:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbhJNNuF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Oct 2021 09:50:05 -0400
Received: from mga04.intel.com ([192.55.52.120]:33255 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231388AbhJNNuF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Oct 2021 09:50:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="226447913"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="scan'208";a="226447913"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2021 06:48:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="scan'208";a="659972121"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 14 Oct 2021 06:47:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6791B2E4; Thu, 14 Oct 2021 16:48:04 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v4 2/3] i2c: acpi: Replace custom function with device_match_acpi_handle()
Date:   Thu, 14 Oct 2021 16:47:55 +0300
Message-Id: <20211014134756.39092-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211014134756.39092-1-andriy.shevchenko@linux.intel.com>
References: <20211014134756.39092-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since driver core provides a generic device_match_acpi_handle()
we may replace the custom one with it. This unifies code to find
an adapter with the similar one which finds a client.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Wolfram Sang <wsa@kernel.org>
---
v4: added tag (Wolfram)
 drivers/i2c/i2c-core-acpi.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 7ea2ac712a57..0aea776cd4c9 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -398,24 +398,20 @@ u32 i2c_acpi_find_bus_speed(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(i2c_acpi_find_bus_speed);
 
-static int i2c_acpi_find_match_adapter(struct device *dev, const void *data)
-{
-	struct i2c_adapter *adapter = i2c_verify_adapter(dev);
-
-	if (!adapter)
-		return 0;
-
-	return ACPI_HANDLE(dev) == (acpi_handle)data;
-}
-
 struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
 {
+	struct i2c_adapter *adapter;
 	struct device *dev;
 
-	dev = bus_find_device(&i2c_bus_type, NULL, handle,
-			      i2c_acpi_find_match_adapter);
+	dev = bus_find_device(&i2c_bus_type, NULL, handle, device_match_acpi_handle);
+	if (!dev)
+		return NULL;
+
+	adapter = i2c_verify_adapter(dev);
+	if (!adapter)
+		put_device(dev);
 
-	return dev ? i2c_verify_adapter(dev) : NULL;
+	return adapter;
 }
 EXPORT_SYMBOL_GPL(i2c_acpi_find_adapter_by_handle);
 
-- 
2.33.0

