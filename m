Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80ABE16A9BA
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgBXPPw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:52 -0500
Received: from mga17.intel.com ([192.55.52.151]:53971 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727948AbgBXPPi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="260368577"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 24 Feb 2020 07:15:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 947E03C0; Mon, 24 Feb 2020 17:15:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH v1 12/40] i2c: digicolor: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:02 +0200
Message-Id: <20200224151530.31713-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since we have generic definitions for bus frequencies, let's use them.

Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-digicolor.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-digicolor.c b/drivers/i2c/busses/i2c-digicolor.c
index 3adf72540db1..79bf187a90b1 100644
--- a/drivers/i2c/busses/i2c-digicolor.c
+++ b/drivers/i2c/busses/i2c-digicolor.c
@@ -18,7 +18,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
-#define DEFAULT_FREQ		100000
 #define TIMEOUT_MS		100
 
 #define II_CONTROL		0x0
@@ -300,7 +299,7 @@ static int dc_i2c_probe(struct platform_device *pdev)
 
 	if (of_property_read_u32(pdev->dev.of_node, "clock-frequency",
 				 &i2c->frequency))
-		i2c->frequency = DEFAULT_FREQ;
+		i2c->frequency = I2C_STANDARD_MODE_FREQ;
 
 	i2c->dev = &pdev->dev;
 	platform_set_drvdata(pdev, i2c);
-- 
2.25.0

