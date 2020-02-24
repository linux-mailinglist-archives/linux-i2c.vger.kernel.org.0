Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2127616A99D
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbgBXPPk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:40 -0500
Received: from mga06.intel.com ([134.134.136.31]:59404 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727973AbgBXPPj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:39 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="255604729"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 24 Feb 2020 07:15:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EE7C5687; Mon, 24 Feb 2020 17:15:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v1 21/40] i2c: mv64xxx: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:11 +0200
Message-Id: <20200224151530.31713-21-andriy.shevchenko@linux.intel.com>
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

Cc: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index febb7c7ea72b..e803c6b0a947 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -810,7 +810,7 @@ mv64xxx_of_config(struct mv64xxx_i2c_data *drv_data,
 	tclk = clk_get_rate(drv_data->clk);
 
 	if (of_property_read_u32(np, "clock-frequency", &bus_freq))
-		bus_freq = 100000; /* 100kHz by default */
+		bus_freq = I2C_STANDARD_MODE_FREQ; /* 100kHz by default */
 
 	if (of_device_is_compatible(np, "allwinner,sun4i-a10-i2c") ||
 	    of_device_is_compatible(np, "allwinner,sun6i-a31-i2c"))
@@ -846,14 +846,14 @@ mv64xxx_of_config(struct mv64xxx_i2c_data *drv_data,
 	if (of_device_is_compatible(np, "marvell,mv78230-i2c")) {
 		drv_data->offload_enabled = true;
 		/* The delay is only needed in standard mode (100kHz) */
-		if (bus_freq <= 100000)
+		if (bus_freq <= I2C_STANDARD_MODE_FREQ)
 			drv_data->errata_delay = true;
 	}
 
 	if (of_device_is_compatible(np, "marvell,mv78230-a0-i2c")) {
 		drv_data->offload_enabled = false;
 		/* The delay is only needed in standard mode (100kHz) */
-		if (bus_freq <= 100000)
+		if (bus_freq <= I2C_STANDARD_MODE_FREQ)
 			drv_data->errata_delay = true;
 	}
 
-- 
2.25.0

