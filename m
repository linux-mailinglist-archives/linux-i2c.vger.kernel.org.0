Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91DF02E6BBF
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Dec 2020 00:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729491AbgL1Wzw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Dec 2020 17:55:52 -0500
Received: from mga17.intel.com ([192.55.52.151]:20884 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729382AbgL1UIT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 28 Dec 2020 15:08:19 -0500
IronPort-SDR: 8Z/hSQ77/38OJ3SUz2mfJFD9ejDnW6xAZ75OstJ/hBl53jtVPMdZS+mQhGE5GVvzQZ1TkxrID8
 /1IQegic0eUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9848"; a="156207358"
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
   d="scan'208";a="156207358"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 12:06:23 -0800
IronPort-SDR: W6LKwrETLC3WRbOG5xzlvTpxv26PmDKoRXEDvBUukESFNZjZ0lebjqfAWlPW47AQ006ZvYFJWN
 32pT3crmtVKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
   d="scan'208";a="392869412"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 28 Dec 2020 12:06:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 98C96DE; Mon, 28 Dec 2020 22:06:19 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] gpiolib: Follow usual pattern for gpiod_remove_lookup_table() call
Date:   Mon, 28 Dec 2020 22:06:16 +0200
Message-Id: <20201228200618.58716-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The usual pattern for the remove calls, like gpiod_remove_lookup_table(),
is to be NULL-aware, i.o.w. become a no-op whenever parameter is NULL.
Update gpiod_remove_lookup_table() call to follow this pattern.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b02cc2abd3b6..611d6ea82d75 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3460,6 +3460,10 @@ EXPORT_SYMBOL_GPL(gpiod_add_lookup_table);
  */
 void gpiod_remove_lookup_table(struct gpiod_lookup_table *table)
 {
+	/* Nothing to remove */
+	if (!table)
+		return;
+
 	mutex_lock(&gpio_lookup_lock);
 
 	list_del(&table->list);
-- 
2.29.2

