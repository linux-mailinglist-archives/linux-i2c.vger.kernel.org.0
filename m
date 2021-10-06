Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20355424442
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Oct 2021 19:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238485AbhJFRdR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Oct 2021 13:33:17 -0400
Received: from mga09.intel.com ([134.134.136.24]:57494 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238337AbhJFRdQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Oct 2021 13:33:16 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="225948671"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; 
   d="scan'208";a="225948671"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2021 10:31:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; 
   d="scan'208";a="522311855"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 06 Oct 2021 10:31:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6F1DA170; Wed,  6 Oct 2021 20:31:27 +0300 (EEST)
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
Subject: [PATCH v2 3/3] gpiolib: acpi: Replace custom code with device_match_acpi_handle()
Date:   Wed,  6 Oct 2021 20:31:25 +0300
Message-Id: <20211006173125.84423-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006173125.84423-1-andriy.shevchenko@linux.intel.com>
References: <20211006173125.84423-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since driver core provides a generic device_match_acpi_handle()
we may replace the custom code with it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no changes
 drivers/gpio/gpiolib-acpi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 47712b6903b5..32f1f720b94b 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -95,10 +95,7 @@ static bool acpi_gpio_deferred_req_irqs_done;
 
 static int acpi_gpiochip_find(struct gpio_chip *gc, void *data)
 {
-	if (!gc->parent)
-		return false;
-
-	return ACPI_HANDLE(gc->parent) == data;
+	return gc->parent ? device_match_acpi_handle(gc->parent, data) : false;
 }
 
 /**
-- 
2.33.0

