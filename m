Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE5094508D0
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 16:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236632AbhKOPp7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 10:45:59 -0500
Received: from mga04.intel.com ([192.55.52.120]:10514 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236539AbhKOPpv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Nov 2021 10:45:51 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="232184126"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="scan'208";a="232184126"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 07:42:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="scan'208";a="585306504"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Nov 2021 07:42:52 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 76C861CF; Mon, 15 Nov 2021 17:42:55 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Evan Green <evgreen@chromium.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] i2c: mux: gpio: Use array_size() helper
Date:   Mon, 15 Nov 2021 17:42:01 +0200
Message-Id: <20211115154201.46579-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com>
References: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use array_size() helper to aid in 2-factor allocation instances.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/muxes/i2c-mux-gpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index b09c10f36ddb..73a23e117ebe 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -7,6 +7,7 @@
 
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
+#include <linux/overflow.h>
 #include <linux/platform_data/i2c-mux-gpio.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
@@ -152,7 +153,7 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 
 	muxc = i2c_mux_alloc(parent, &pdev->dev, mux->data.n_values,
-			     ngpios * sizeof(*mux->gpios), 0,
+			     array_size(ngpios, sizeof(*mux->gpios)), 0,
 			     i2c_mux_gpio_select, NULL);
 	if (!muxc) {
 		ret = -ENOMEM;
-- 
2.33.0

