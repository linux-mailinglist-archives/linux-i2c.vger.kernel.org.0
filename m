Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5191A4508D2
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 16:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236500AbhKOPqI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 10:46:08 -0500
Received: from mga05.intel.com ([192.55.52.43]:57842 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236685AbhKOPqH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Nov 2021 10:46:07 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="319673560"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="scan'208";a="319673560"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 07:42:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="scan'208";a="471945761"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 15 Nov 2021 07:42:52 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id ADDBB173; Mon, 15 Nov 2021 17:42:54 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Evan Green <evgreen@chromium.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] i2c: mux: gpio: Don't dereference fwnode from struct device
Date:   Mon, 15 Nov 2021 17:42:00 +0200
Message-Id: <20211115154201.46579-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com>
References: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We have a special helper to get fwnode out of struct device.
Moreover, dereferencing it directly prevents the fwnode
modifications in the future.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/muxes/i2c-mux-gpio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index 31e6eb1591bb..b09c10f36ddb 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -53,6 +53,7 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
 				 struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct device_node *np = dev->of_node;
 	struct device_node *adapter_np;
 	struct i2c_adapter *adapter = NULL;
@@ -60,7 +61,7 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
 	unsigned *values;
 	int rc, i = 0;
 
-	if (is_of_node(dev->fwnode)) {
+	if (is_of_node(fwnode)) {
 		if (!np)
 			return -ENODEV;
 
@@ -72,7 +73,7 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
 		adapter = of_find_i2c_adapter_by_node(adapter_np);
 		of_node_put(adapter_np);
 
-	} else if (is_acpi_node(dev->fwnode)) {
+	} else if (is_acpi_node(fwnode)) {
 		/*
 		 * In ACPI land the mux should be a direct child of the i2c
 		 * bus it muxes.
@@ -111,7 +112,7 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
 	}
 	mux->data.values = values;
 
-	if (fwnode_property_read_u32(dev->fwnode, "idle-state", &mux->data.idle))
+	if (device_property_read_u32(dev, "idle-state", &mux->data.idle))
 		mux->data.idle = I2C_MUX_GPIO_NO_IDLE;
 
 	return 0;
-- 
2.33.0

