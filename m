Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 003D24243CB
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Oct 2021 19:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239219AbhJFRRW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Oct 2021 13:17:22 -0400
Received: from mga17.intel.com ([192.55.52.151]:32507 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239104AbhJFRRT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Oct 2021 13:17:19 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="206863380"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; 
   d="scan'208";a="206863380"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2021 10:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; 
   d="scan'208";a="568249292"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 06 Oct 2021 10:15:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D4D06159; Wed,  6 Oct 2021 20:15:25 +0300 (EEST)
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
Subject: [PATCH v1 1/3] driver core: Provide device_match_acpi_handle() helper
Date:   Wed,  6 Oct 2021 20:15:15 +0300
Message-Id: <20211006171517.47393-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We have couple of users of this helper, make it available for them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/core.c        | 6 ++++++
 include/linux/device/bus.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index c4a2c97a21a2..18f1f6499246 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -4840,6 +4840,12 @@ int device_match_acpi_dev(struct device *dev, const void *adev)
 }
 EXPORT_SYMBOL(device_match_acpi_dev);
 
+int device_match_acpi_handle(struct device *dev, const void *handle)
+{
+	return ACPI_HANDLE(dev) == handle;
+}
+EXPORT_SYMBOL(device_match_acpi_dev);
+
 int device_match_any(struct device *dev, const void *unused)
 {
 	return 1;
diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
index 062777a45a74..a039ab809753 100644
--- a/include/linux/device/bus.h
+++ b/include/linux/device/bus.h
@@ -143,6 +143,7 @@ int device_match_of_node(struct device *dev, const void *np);
 int device_match_fwnode(struct device *dev, const void *fwnode);
 int device_match_devt(struct device *dev, const void *pdevt);
 int device_match_acpi_dev(struct device *dev, const void *adev);
+int device_match_acpi_handle(struct device *dev, const void *handle);
 int device_match_any(struct device *dev, const void *unused);
 
 /* iterator helpers for buses */
-- 
2.33.0

