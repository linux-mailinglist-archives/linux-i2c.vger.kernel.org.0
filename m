Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6591142592C
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Oct 2021 19:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243254AbhJGRU1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Oct 2021 13:20:27 -0400
Received: from mga01.intel.com ([192.55.52.88]:40865 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242959AbhJGRUP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 7 Oct 2021 13:20:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="249634652"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; 
   d="scan'208";a="249634652"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2021 10:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; 
   d="scan'208";a="484592832"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 07 Oct 2021 10:18:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E07AF170; Thu,  7 Oct 2021 20:18:19 +0300 (EEST)
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
Subject: [PATCH v3 3/3] gpiolib: acpi: Replace custom code with device_match_acpi_handle()
Date:   Thu,  7 Oct 2021 20:18:15 +0300
Message-Id: <20211007171815.28336-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007171815.28336-1-andriy.shevchenko@linux.intel.com>
References: <20211007171815.28336-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since driver core provides a generic device_match_acpi_handle()
we may replace the custom code with it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: amended the expression (Rafael)
 drivers/gpio/gpiolib-acpi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 47712b6903b5..985e8589c58b 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -95,10 +95,7 @@ static bool acpi_gpio_deferred_req_irqs_done;
 
 static int acpi_gpiochip_find(struct gpio_chip *gc, void *data)
 {
-	if (!gc->parent)
-		return false;
-
-	return ACPI_HANDLE(gc->parent) == data;
+	return gc->parent && device_match_acpi_handle(gc->parent, data);
 }
 
 /**
-- 
2.33.0

