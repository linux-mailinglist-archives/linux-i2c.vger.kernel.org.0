Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6955C4508CC
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 16:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236534AbhKOPpJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 10:45:09 -0500
Received: from mga07.intel.com ([134.134.136.100]:53935 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236674AbhKOPpF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Nov 2021 10:45:05 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="296891655"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="scan'208";a="296891655"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 07:42:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="scan'208";a="454064088"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 15 Nov 2021 07:42:07 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C7D3B173; Mon, 15 Nov 2021 17:42:09 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Evan Green <evgreen@chromium.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] =?UTF-8?q?i2c:=20mux:=20gpio:=C2=A0Replace=20custo?= =?UTF-8?q?m=20acpi=5Fget=5Flocal=5Faddress()?=
Date:   Mon, 15 Nov 2021 17:41:59 +0200
Message-Id: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Recently ACPI gained the acpi_get_local_address() API which may be used
instead of home grown i2c_mux_gpio_get_acpi_adr().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/muxes/i2c-mux-gpio.c | 43 ++------------------------------
 1 file changed, 2 insertions(+), 41 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index bac415a52b78..31e6eb1591bb 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -49,45 +49,6 @@ static int i2c_mux_gpio_deselect(struct i2c_mux_core *muxc, u32 chan)
 	return 0;
 }
 
-#ifdef CONFIG_ACPI
-
-static int i2c_mux_gpio_get_acpi_adr(struct device *dev,
-				     struct fwnode_handle *fwdev,
-				     unsigned int *adr)
-
-{
-	unsigned long long adr64;
-	acpi_status status;
-
-	status = acpi_evaluate_integer(ACPI_HANDLE_FWNODE(fwdev),
-				       METHOD_NAME__ADR,
-				       NULL, &adr64);
-
-	if (!ACPI_SUCCESS(status)) {
-		dev_err(dev, "Cannot get address\n");
-		return -EINVAL;
-	}
-
-	*adr = adr64;
-	if (*adr != adr64) {
-		dev_err(dev, "Address out of range\n");
-		return -ERANGE;
-	}
-
-	return 0;
-}
-
-#else
-
-static int i2c_mux_gpio_get_acpi_adr(struct device *dev,
-				     struct fwnode_handle *fwdev,
-				     unsigned int *adr)
-{
-	return -EINVAL;
-}
-
-#endif
-
 static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
 				 struct platform_device *pdev)
 {
@@ -141,9 +102,9 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
 			fwnode_property_read_u32(child, "reg", values + i);
 
 		} else if (is_acpi_node(child)) {
-			rc = i2c_mux_gpio_get_acpi_adr(dev, child, values + i);
+			rc = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), values + i);
 			if (rc)
-				return rc;
+				return dev_err_probe(dev, rc, "Cannot get address\n");
 		}
 
 		i++;
-- 
2.33.0

