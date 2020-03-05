Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB06E17A952
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Mar 2020 16:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgCEPyT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Mar 2020 10:54:19 -0500
Received: from mga12.intel.com ([192.55.52.136]:36688 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbgCEPyS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Mar 2020 10:54:18 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Mar 2020 07:53:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; 
   d="scan'208";a="352381466"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2020 07:53:53 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CED2B16D; Thu,  5 Mar 2020 17:53:52 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/5] i2c: mux: pca954x: Drop useless validation for optional GPIO descriptor
Date:   Thu,  5 Mar 2020 17:53:50 +0200
Message-Id: <20200305155352.39095-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200305155352.39095-1-andriy.shevchenko@linux.intel.com>
References: <20200305155352.39095-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There is no need to perform a check for optional GPIO descriptor.
If it's NULL, the API can handle it correctly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 2e42a113ef1f..fe4320fc0b91 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -444,12 +444,12 @@ static int pca954x_probe(struct i2c_client *client,
 	gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(gpio))
 		return PTR_ERR(gpio);
-	if (gpio) {
-		udelay(1);
-		gpiod_set_value_cansleep(gpio, 0);
-		/* Give the chip some time to recover. */
-		udelay(1);
-	}
+
+	/* Reset the multiplexer */
+	udelay(1);
+	gpiod_set_value_cansleep(gpio, 0);
+	/* Give the chip some time to recover. */
+	udelay(1);
 
 	data->chip = device_get_match_data(dev);
 	if (!data->chip)
-- 
2.25.1

