Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 206A62E6BE1
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Dec 2020 00:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729394AbgL1Wzx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Dec 2020 17:55:53 -0500
Received: from mga12.intel.com ([192.55.52.136]:28661 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729381AbgL1UIT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 28 Dec 2020 15:08:19 -0500
IronPort-SDR: qxJEmYEOcl//nJ1CwVeAPYXnzU4tXSCraNWuIPEGpzxLB+AYTZDEx/oe2pvc6L4LsWkt+S3moL
 OnIvLP+xxI0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9848"; a="155625473"
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
   d="scan'208";a="155625473"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 12:06:22 -0800
IronPort-SDR: ns2x00IEq3P4ivZEYLQzzPqlKG2xceSqcgNl6KdngvnTIeYREdndXZdmgVojWnsiASHVPRuOdH
 hqklLaP2pA2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
   d="scan'208";a="459871195"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 28 Dec 2020 12:06:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AFBDF109; Mon, 28 Dec 2020 22:06:19 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] i2c: i801: Refactor mux code since platform_device_unregister() is NULL aware
Date:   Mon, 28 Dec 2020 22:06:18 +0200
Message-Id: <20201228200618.58716-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200618.58716-1-andriy.shevchenko@linux.intel.com>
References: <20201228200618.58716-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

platform_device_unregister() is NULL-aware and thus doesn't required a
duplication check in i801_del_mux(). Besides that it's also error pointer
aware, and we may drop unneeded assignment in i801_add_mux() followed by
conversion to PTR_ERR_OR_ZERO() for the returned value.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-i801.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 7c2569a18f8c..1400a8716388 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1433,7 +1433,7 @@ static int i801_add_mux(struct i801_priv *priv)
 	const struct i801_mux_config *mux_config;
 	struct i2c_mux_gpio_platform_data gpio_data;
 	struct gpiod_lookup_table *lookup;
-	int err, i;
+	int i;
 
 	if (!priv->mux_drvdata)
 		return 0;
@@ -1473,20 +1473,16 @@ static int i801_add_mux(struct i801_priv *priv)
 				PLATFORM_DEVID_NONE, &gpio_data,
 				sizeof(struct i2c_mux_gpio_platform_data));
 	if (IS_ERR(priv->mux_pdev)) {
-		err = PTR_ERR(priv->mux_pdev);
 		gpiod_remove_lookup_table(lookup);
-		priv->mux_pdev = NULL;
 		dev_err(dev, "Failed to register i2c-mux-gpio device\n");
-		return err;
 	}
 
-	return 0;
+	return PTR_ERR_OR_ZERO(priv->mux_pdev);
 }
 
 static void i801_del_mux(struct i801_priv *priv)
 {
-	if (priv->mux_pdev)
-		platform_device_unregister(priv->mux_pdev);
+	platform_device_unregister(priv->mux_pdev);
 	gpiod_remove_lookup_table(priv->lookup);
 }
 
-- 
2.29.2

