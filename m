Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318C3289BE2
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Oct 2020 00:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389987AbgJIWna (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Oct 2020 18:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389867AbgJIWna (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Oct 2020 18:43:30 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28136C0613D2
        for <linux-i2c@vger.kernel.org>; Fri,  9 Oct 2020 15:43:30 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d23so5164340pll.7
        for <linux-i2c@vger.kernel.org>; Fri, 09 Oct 2020 15:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZctQKB/Oi7UVTFx6VLWixrx9GFS5G/YDYkR7pedEv+8=;
        b=FP/lcii/5F4D8/AGWT1QnV7v/UPBfe8V/RmYzdofDtnROBgmNoyUHcu52sClWJYQ+s
         DFmsT5MSI7Sj5K5Y4b56z6isNE5K+KEVnioFRl2WRjlBBZ1QYY5mKwvmG/TgY73pWyt5
         M5G3PSXkZQBwGgY24nuUudDfHNxSzBeJ5HmNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZctQKB/Oi7UVTFx6VLWixrx9GFS5G/YDYkR7pedEv+8=;
        b=fUlR7aIHZTltZCzzOKl90jMwrhq7GZeoVSgbtY4NatOutAI8koYXNcGdZ46JVSEtnu
         dhtUVfI65XdqVdWzLjRJD2U9oSOgE9Oofzghg+DBn8aWxM/fNe16AAsyEx90pw1poAnr
         Frwb77VtQIbA36JI8x/KVC7jQpggnUu3GL8vjpz0JvkjakmDYgStN3ckWLxEEADfQZ5D
         1eLduDsyXy3ZxKy52D0YT4fzo0BuBXXbdwt/kwUDmlI3B/xBEFPHwDH6yDZGvnLbusCl
         ZrSHc7SA4zBw8O+niRJcjy7Svk7mS5k2XKu6scwboisIuqNW3HEnWQ3/JY2gaawaTCV8
         0aBw==
X-Gm-Message-State: AOAM531Qs/0PUW/+bq43WcnW9+LCTWDcwnq3QtkRpIuTZz8tB7m32DhT
        IFta2DADWiYQV8Ws130snOyDyg==
X-Google-Smtp-Source: ABdhPJyUaCFbvaaAVREeNTdgdVx0WxA3JB9cO5RHFNTg6vNAE+GQSq5cvErQEi5y0UpiUFBkzcSfaQ==
X-Received: by 2002:a17:902:d896:b029:d2:288e:bafc with SMTP id b22-20020a170902d896b02900d2288ebafcmr14073756plz.43.1602283409638;
        Fri, 09 Oct 2020 15:43:29 -0700 (PDT)
Received: from evgreen-glaptop.cheshire.ch ([2601:646:c780:1404:a2ce:c8ff:fec4:54a3])
        by smtp.gmail.com with ESMTPSA id r23sm2397670pfr.62.2020.10.09.15.43.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 09 Oct 2020 15:43:29 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Peter Rosin <peda@axentia.se>
Cc:     Wolfram Sang <wsa@kernel.org>, Evan Green <evgreen@chromium.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: i2c-mux-gpio: Enable this driver in ACPI land
Date:   Fri,  9 Oct 2020 15:43:20 -0700
Message-Id: <20201009154235.1.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enable i2c-mux-gpio devices to be defined via ACPI. The idle-state
property translates directly to a fwnode_property_*() call. The child
reg property translates naturally into _ADR in ACPI.

The i2c-parent is a little trickier, since of's phandle definition
suggests the i2c mux could live in a completely different part of
the tree than its upstream i2c controller. For now in ACPI,
just assume that the i2c-mux-gpio device will always be a direct
child of the i2c controller. If the additional flexibility of
defining muxes in wildly different locations from their parent
controllers is required, it can be added later.

Signed-off-by: Evan Green <evgreen@chromium.org>
---

 drivers/i2c/muxes/i2c-mux-gpio.c | 77 +++++++++++++++++++++-----------
 1 file changed, 50 insertions(+), 27 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index 4effe563e9e8d..f195e95e8a037 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -49,34 +49,46 @@ static int i2c_mux_gpio_deselect(struct i2c_mux_core *muxc, u32 chan)
 	return 0;
 }
 
-#ifdef CONFIG_OF
-static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
-					struct platform_device *pdev)
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
 	int i = 0;
 
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
@@ -85,24 +97,35 @@ static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
 		return -ENOMEM;
 	}
 
-	for_each_child_of_node(np, child) {
-		of_property_read_u32(child, "reg", values + i);
+	device_for_each_child_node(dev, child) {
+		if (is_of_node(child)) {
+			fwnode_property_read_u32(child, "reg", values + i);
+
+		} else if (is_acpi_node(child)) {
+			unsigned long long adr;
+			acpi_status status;
+
+			status = acpi_evaluate_integer(ACPI_HANDLE_FWNODE(child),
+						       METHOD_NAME__ADR,
+						       NULL, &adr);
+			if (ACPI_SUCCESS(status)) {
+				*(values + i) = adr;
+
+			} else {
+				dev_err(dev, "Cannot get address");
+				return -EINVAL;
+			}
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
@@ -118,7 +141,7 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (!dev_get_platdata(&pdev->dev)) {
-		ret = i2c_mux_gpio_probe_dt(mux, pdev);
+		ret = i2c_mux_gpio_probe_fw(mux, pdev);
 		if (ret < 0)
 			return ret;
 	} else {
-- 
2.26.2

