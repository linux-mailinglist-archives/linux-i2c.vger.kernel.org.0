Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B115290DB0
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Oct 2020 00:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392705AbgJPWZj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Oct 2020 18:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392703AbgJPWZj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Oct 2020 18:25:39 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E34BC061755
        for <linux-i2c@vger.kernel.org>; Fri, 16 Oct 2020 15:25:39 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ds1so2107000pjb.5
        for <linux-i2c@vger.kernel.org>; Fri, 16 Oct 2020 15:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GUNYTlRoxTShJaXBCFij617nWR8IGqxqOLzeQGRazD4=;
        b=TCAeUBm0XQYi0Dpmq68B8Y5RZD7LT9mGqyTRbYb/T24kBNMVwovZ7uarUCV4zmGNcw
         eNlsTVm7DMIKWnyIg7WefzkTMuvrRxExKmz/EGXyfv5DU7MVNVbyRhP8tzSH1RbSrCyb
         oZcM1KgtQWqr+vOUeEMbt/HeomdelJoU4OLBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GUNYTlRoxTShJaXBCFij617nWR8IGqxqOLzeQGRazD4=;
        b=DjM8XOkia3XI8MPV5EO0h28vw117k10uQT6E9iYAH7bl2blDpGYCNqxOKAkfPrdIqf
         VBPQ0rwdjdrA18PIVWYNJbqFuOyXvvwSBiOoRfMNTmRkKm/djDlb6K3cIbSKQ3tjwvdy
         FH+s/6VS4owQQk+pVKuuA3ZNxGIhykgqxLX5HY6/3g4cWf2GIyP8WA2rNIka3ZN9xFAj
         jICAO5DyIJwOt8nKK9T5RwubXckCsgqoXvhCQFsnnSz25EsHIsanV7eCuwCSnPhtc3JJ
         Qk6w+Xj4ECUvHlS3SjxzGtYV1lHiRyZvFdbufW5A67h5iWLAWg4INEctdJ8cvZUgCHAI
         N4Aw==
X-Gm-Message-State: AOAM531hT5rZ24VL2oiwF/RALGaxVob8FHrrVOyBdjgVyqjqTI+cmxa6
        r4lkekXSQziBQfX3ngd6LCR4HQ==
X-Google-Smtp-Source: ABdhPJzhC3E/gZPPV2SrYHDtPD3saQaduE6/ojJTc+ODPz5xO4kWqtUIO6FobCZX/eWWdzQg5n/vlA==
X-Received: by 2002:a17:90a:3f10:: with SMTP id l16mr6110730pjc.110.1602887138747;
        Fri, 16 Oct 2020 15:25:38 -0700 (PDT)
Received: from evgreen-glaptop.cheshire.ch ([2601:646:c780:1404:a2ce:c8ff:fec4:54a3])
        by smtp.gmail.com with ESMTPSA id t10sm4099304pjr.37.2020.10.16.15.25.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 16 Oct 2020 15:25:38 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Peter Rosin <peda@axentia.se>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Evan Green <evgreen@chromium.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] i2c: i2c-mux-gpio: Enable this driver in ACPI land
Date:   Fri, 16 Oct 2020 15:25:23 -0700
Message-Id: <20201016152454.v3.2.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201016222523.364218-1-evgreen@chromium.org>
References: <20201016222523.364218-1-evgreen@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enable i2c-mux-gpio devices to be defined via ACPI. The idle-state
property translates directly to a fwnode_property_*() call. The child
reg property translates naturally into _ADR in ACPI.

The i2c-parent binding is a relic from the days when the bindings
dictated that all direct children of an I2C controller had to be I2C
devices. These days that's no longer required. The i2c-mux can sit as a
direct child of its parent controller, which is where it makes the most
sense from a hardware description perspective. For the ACPI
implementation we'll assume that's always how the i2c-mux-gpio is
instantiated.

Signed-off-by: Evan Green <evgreen@chromium.org>
---

Changes in v3:
 - Update commit message again (Peter)
 - Added missing \n (Peter)
 - adr64 overflow check (Peter)
 - Don't initialize child (Peter)
 - Limit scope of dev_handle (Peter)

Changes in v2:
 - Make it compile properly when !CONFIG_ACPI (Randy)
 - Update commit message regarding i2c-parent (Peter)

 drivers/i2c/muxes/i2c-mux-gpio.c | 107 +++++++++++++++++++++++--------
 1 file changed, 79 insertions(+), 28 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index caaa782b50d83..bac415a52b780 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -49,35 +49,85 @@ static int i2c_mux_gpio_deselect(struct i2c_mux_core *muxc, u32 chan)
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
+		dev_err(dev, "Cannot get address\n");
+		return -EINVAL;
+	}
+
+	*adr = adr64;
+	if (*adr != adr64) {
+		dev_err(dev, "Address out of range\n");
+		return -ERANGE;
+	}
+
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
 	struct device *dev = &pdev->dev;
-	struct device_node *np = pdev->dev.of_node;
-	struct device_node *adapter_np, *child;
-	struct i2c_adapter *adapter;
+	struct device_node *np = dev->of_node;
+	struct device_node *adapter_np;
+	struct i2c_adapter *adapter = NULL;
+	struct fwnode_handle *child;
 	unsigned *values;
-	int i = 0;
+	int rc, i = 0;
+
+	if (is_of_node(dev->fwnode)) {
+		if (!np)
+			return -ENODEV;
 
-	if (!np)
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
+		acpi_handle dev_handle = ACPI_HANDLE(dev->parent);
 
-	adapter_np = of_parse_phandle(np, "i2c-parent", 0);
-	if (!adapter_np) {
-		dev_err(&pdev->dev, "Cannot parse i2c-parent\n");
-		return -ENODEV;
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
 	values = devm_kcalloc(dev,
 			      mux->data.n_values, sizeof(*mux->data.values),
 			      GFP_KERNEL);
@@ -86,24 +136,25 @@ static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
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
@@ -119,7 +170,7 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (!dev_get_platdata(&pdev->dev)) {
-		ret = i2c_mux_gpio_probe_dt(mux, pdev);
+		ret = i2c_mux_gpio_probe_fw(mux, pdev);
 		if (ret < 0)
 			return ret;
 	} else {
-- 
2.26.2

