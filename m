Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFB328E9DC
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Oct 2020 03:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387865AbgJOBUG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 21:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388063AbgJOBTi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Oct 2020 21:19:38 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D60C0F26F2
        for <linux-i2c@vger.kernel.org>; Wed, 14 Oct 2020 18:02:31 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id gv6so831028pjb.4
        for <linux-i2c@vger.kernel.org>; Wed, 14 Oct 2020 18:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cN8iWVwIWlPjYidVuxp+wz9oABo5owVEFQAK0K6BKUM=;
        b=E6eOmSNXtAINHXWwPQsrJYWzhKEHOl89Gai9Nl4U9K2LH6/VBV9ard/8xd0yol4x4v
         QT7qxrBRAFleDyiFUJUWlCNmUtRUYdxOVAMXEkZeTXI+nWETl7yyw41yVxM7jCgOlimL
         mIC9+GlbPZEF31Z+LJGrJkjBY2+PWz+WPWpvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cN8iWVwIWlPjYidVuxp+wz9oABo5owVEFQAK0K6BKUM=;
        b=bEOjiWC6+JX0LX2k4snYRGUcAwELLYj8zyO0gf8f6/Z/kGIrZt5LAMhXwwb9lDOLRq
         6powQymElrOHh5U7GfoVUJovtneAWSCN415VD3bZyiOxUcJ+vaF+CNc1FDkCFl5wCrlL
         RWulcfex8g1z0UqdB5cKLadKNBEPWk1csa2O+RGPne+5SPaimbpXrPePYyARkUHJMuqa
         essOIGLTweIcVBkVYRQ07eEbST+BMBxYZGEPncA7mJ9Ig+krrpp6SSezrE3lOQyhY9to
         tbZCdvWpSsAF/pOjZEIKxM/xd8NKsQxYb2dMeSeuP7xnxgPzmEz0bCLC2sSH1XS1wy5k
         rpKg==
X-Gm-Message-State: AOAM532//ItibhfNQjc7eCSnVHwIViEz/tXTpLYTuYgUg4/N2+8zfpwe
        7vxF81XvqLihu6dOw+sV3s4rAg==
X-Google-Smtp-Source: ABdhPJwE5YayqkqKkC9J5klOSEW+82YFUqxanT7y9N0m/WSX3llQw9jqkril6M7RV77Imt5iUhIoQg==
X-Received: by 2002:a17:90b:3103:: with SMTP id gc3mr1827983pjb.158.1602723751210;
        Wed, 14 Oct 2020 18:02:31 -0700 (PDT)
Received: from evgreen-glaptop.cheshire.ch ([2601:646:c780:1404:a2ce:c8ff:fec4:54a3])
        by smtp.gmail.com with ESMTPSA id n12sm826855pjt.16.2020.10.14.18.02.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 14 Oct 2020 18:02:30 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Peter Rosin <peda@axentia.se>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Evan Green <evgreen@chromium.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: i2c-mux-gpio: Enable this driver in ACPI land
Date:   Wed, 14 Oct 2020 18:02:23 -0700
Message-Id: <20201014180137.v2.1.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enable i2c-mux-gpio devices to be defined via ACPI. The idle-state
property translates directly to a fwnode_property_*() call. The child
reg property translates naturally into _ADR in ACPI.

The i2c-parent binding is a relic from the days when all direct children
of an i2c controller in Linux had to be i2c devices. These days that
implementation detail has been worked out, so the i2c-mux can sit
as a direct child of its parent controller, which is where it makes the
most sense from a hardware description perspective. For the ACPI
implementation we'll assume that's always how the i2c-mux-gpio is
instantiated.

Signed-off-by: Evan Green <evgreen@chromium.org>
---

Changes in v2:
 - Make it compile properly when !CONFIG_ACPI (Randy)
 - Update commit message regarding i2c-parent (Peter)

 drivers/i2c/muxes/i2c-mux-gpio.c | 103 ++++++++++++++++++++++---------
 1 file changed, 75 insertions(+), 28 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index 4effe563e9e8d..8e4008f4a9b5d 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -49,34 +49,80 @@ static int i2c_mux_gpio_deselect(struct i2c_mux_core *muxc, u32 chan)
 	return 0;
 }
 
-#ifdef CONFIG_OF
-static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
-					struct platform_device *pdev)
+#ifdef CONFIG_ACPI
+
+static int i2c_mux_gpio_get_acpi_adr(struct device *dev,
+				     struct fwnode_handle *fwdev,
+				     unsigned int *adr)
+
+{
+	unsigned long long adr64;
+	acpi_status status;
+
+	status = acpi_evaluate_integer(ACPI_HANDLE_FWNODE(fwdev),
+				       METHOD_NAME__ADR,
+				       NULL, &adr64);
+
+	if (!ACPI_SUCCESS(status)) {
+		dev_err(dev, "Cannot get address");
+		return -EINVAL;
+	}
+
+	*adr = adr64;
+	return 0;
+}
+
+#else
+
+static int i2c_mux_gpio_get_acpi_adr(struct device *dev,
+				     struct fwnode_handle *fwdev,
+				     unsigned int *adr)
+{
+	return -EINVAL;
+}
+
+#endif
+
+static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
+				 struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
-	struct device_node *adapter_np, *child;
-	struct i2c_adapter *adapter;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	acpi_handle dev_handle;
+	struct device_node *adapter_np;
+	struct i2c_adapter *adapter = NULL;
+	struct fwnode_handle *child = NULL;
 	unsigned *values;
-	int i = 0;
+	int rc, i = 0;
 
-	if (!np)
-		return -ENODEV;
+	if (is_of_node(dev->fwnode)) {
+		if (!np)
+			return -ENODEV;
 
-	adapter_np = of_parse_phandle(np, "i2c-parent", 0);
-	if (!adapter_np) {
-		dev_err(&pdev->dev, "Cannot parse i2c-parent\n");
-		return -ENODEV;
+		adapter_np = of_parse_phandle(np, "i2c-parent", 0);
+		if (!adapter_np) {
+			dev_err(&pdev->dev, "Cannot parse i2c-parent\n");
+			return -ENODEV;
+		}
+		adapter = of_find_i2c_adapter_by_node(adapter_np);
+		of_node_put(adapter_np);
+
+	} else if (is_acpi_node(dev->fwnode)) {
+		/*
+		 * In ACPI land the mux should be a direct child of the i2c
+		 * bus it muxes.
+		 */
+		dev_handle = ACPI_HANDLE(dev->parent);
+		adapter = i2c_acpi_find_adapter_by_handle(dev_handle);
 	}
-	adapter = of_find_i2c_adapter_by_node(adapter_np);
-	of_node_put(adapter_np);
+
 	if (!adapter)
 		return -EPROBE_DEFER;
 
 	mux->data.parent = i2c_adapter_id(adapter);
 	put_device(&adapter->dev);
 
-	mux->data.n_values = of_get_child_count(np);
-
+	mux->data.n_values = device_get_child_node_count(dev);
 	values = devm_kcalloc(&pdev->dev,
 			      mux->data.n_values, sizeof(*mux->data.values),
 			      GFP_KERNEL);
@@ -85,24 +131,25 @@ static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
 		return -ENOMEM;
 	}
 
-	for_each_child_of_node(np, child) {
-		of_property_read_u32(child, "reg", values + i);
+	device_for_each_child_node(dev, child) {
+		if (is_of_node(child)) {
+			fwnode_property_read_u32(child, "reg", values + i);
+
+		} else if (is_acpi_node(child)) {
+			rc = i2c_mux_gpio_get_acpi_adr(dev, child, values + i);
+			if (rc)
+				return rc;
+		}
+
 		i++;
 	}
 	mux->data.values = values;
 
-	if (of_property_read_u32(np, "idle-state", &mux->data.idle))
+	if (fwnode_property_read_u32(dev->fwnode, "idle-state", &mux->data.idle))
 		mux->data.idle = I2C_MUX_GPIO_NO_IDLE;
 
 	return 0;
 }
-#else
-static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
-					struct platform_device *pdev)
-{
-	return 0;
-}
-#endif
 
 static int i2c_mux_gpio_probe(struct platform_device *pdev)
 {
@@ -118,7 +165,7 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (!dev_get_platdata(&pdev->dev)) {
-		ret = i2c_mux_gpio_probe_dt(mux, pdev);
+		ret = i2c_mux_gpio_probe_fw(mux, pdev);
 		if (ret < 0)
 			return ret;
 	} else {
-- 
2.26.2

