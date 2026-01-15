Return-Path: <linux-i2c+bounces-15172-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA740D21DD8
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 01:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8457D300A784
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 00:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5455418E025;
	Thu, 15 Jan 2026 00:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="FCmE2Pnv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C766612FF69
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 00:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768437331; cv=none; b=RGTysz6TCFvFLUMhaGtNDXWSOhWFyyP5ajRl0gDtrRIdDEh+spuypzIPFwggBbADqExghFqBcH8EOz6fYwohj8dhw11iHsIk07ULrFULMMNH1QBHxTweciFmavK3WAz0HRdpM0RuzIOr7JeN2sRcar95GtPtrGSEJDcioNSDH9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768437331; c=relaxed/simple;
	bh=D+o9vPZSG/d10yirYMKAstqJxZqhz1gw+/PomftMNAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZhYCe1e/x8Fwmxquo28u23cCttoZ0qckROEaKLr6GzEfOKd9wdfWnKucn8AW8v6Hh32a13yAseoQvW4vnS9NH68AmNDP74GsRG5pHx6Ok+84y2DXJY+hnvluPWDo4AgendQ2wehkWxL741d6P4ddRlgxHH0O0kcgejYjPLfsNDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=FCmE2Pnv; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1232d9f25e9so702988c88.0
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 16:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768437329; x=1769042129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=10mA/zkrWdYHsfLbKNdwoYiN3H67w2t23OWy9hIoOK4=;
        b=FCmE2PnvOxJ6QCofsPSa6UCfwhcn4l4u8xMdiVxjhB0//RXWaPtEJvTwnHaBHXoquH
         ZargPB++MXQ8D3IJ3iZPBy9y5F/o06xBmG+ITr7uZMyUvAqxd/3U3S3o35PYibMC07mL
         CjS/B8hdW7eJ9rWHId1WBL2uKph3VdxT+YHhp8YWV2QTDBNPhNMlF1uU98NQmL9Dit1F
         KeF9GzDgweEfxH6jApqmRGYjQ4zn4XwRXt6kFTQZQ4R2plD6V/kiZCPcCIbizoIChaaO
         TYdMdDgMEZBQ+KLuU79EyD4xLjcmlWLCAFfJ3oUTO3xI4qeLbwDA99lviPBEW6e8QYaC
         fJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768437329; x=1769042129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10mA/zkrWdYHsfLbKNdwoYiN3H67w2t23OWy9hIoOK4=;
        b=eGss/eo0X8tBqDOr59cz3L+ghlONcxN7uJ1y8zLOFGTSoMUtXf5wGLdC2KhM2iG2Nt
         YM1jhGz0HUYJApbaBRAsplr8HULcUoYOT9Yqsf6ACjgpoMRZzWq+fFp3OyxIaMrGVGF8
         eMpGlcpoes2hPhHVtPJG0UoMLOk0RCrvuIQ5B25OHXZVohbXsHEATxaGq6rayF02S3Gs
         MXsFX595gpjiCJjg7r/eUT8fFDW/+41xYzULj0NlY0cHodYdxRjzVluk1FjT5jBYpdvG
         dh4tz3HQJaL5vjfoYOzI5Pr3oHYKQdr/VjhLlyZPSMAVxtQD8DBpXIJhZSFoFRH4y5IK
         g2Zg==
X-Gm-Message-State: AOJu0YxrCzD+jD+9kIqVFW8dN0p3APKfS1UAbW0ankXGdsq3ZgZeEKB0
	KxeDeKdHzhcf8KToIchGUzY9CX/DqjpAgfJvflkfTRseJ0ocjzvn1cQbSD8NwcwG4FI=
X-Gm-Gg: AY/fxX6jd5yYtnETW7Y08wjTQ8Vz2IIGjzGbqQv8pOzwDtLfgYK9mmrWRklcbxPSkwH
	y5v7F6pVsxb/8GZ3NNmPXIIwppndl52Hm3ozn0ANeJP+iZ+/q3pjLDpvCYmR4sxe9rZqDYEpVeS
	hmGF5OtUHyD92bmlt5IAYJDlA+BpiNDtn2K+sHeifJl4tMt4h+xScPtDsd/MVUljhwTKW/mmpdu
	3Pwz/mabEMyO7MXAKv0rxo9ZSBIBuJmkT/GXGfSn46tMB6EypQO4tlPSCNtesh5NuCmTruRxVU3
	MHgddkwUJGHXrxzz/7PaAO2pPST9ezQzEq4ZRFklBQd4jtPGNym45L8ZKJU5eycqmPRImBECSrW
	ACcsWr0p58t7px6FAOsJGxPho8J9ZbFlZlHPrWtFl+wQcj7FU72YMsLxR0n/JeR8hrGx4x1gs9S
	Fl2a3Nk47JvWM=
X-Received: by 2002:a05:7022:109a:b0:119:e56b:957c with SMTP id a92af1059eb24-123376ca859mr3733235c88.1.1768437328759;
        Wed, 14 Jan 2026 16:35:28 -0800 (PST)
Received: from localhost ([50.145.100.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f24346b5sm33527379c88.3.2026.01.14.16.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 16:35:28 -0800 (PST)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Peter Rosin <peda@axentia.se>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH] i2c: mux: reg: use device property accessors
Date: Thu, 15 Jan 2026 00:35:23 +0000
Message-ID: <20260115003523.26660-1-abdurrahman@nexthop.ai>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the driver work on non-OF platforms.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/muxes/i2c-mux-reg.c | 96 ++++++++++++---------------------
 1 file changed, 33 insertions(+), 63 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-reg.c b/drivers/i2c/muxes/i2c-mux-reg.c
index 1e566ea92bc9..48d7b3f740ad 100644
--- a/drivers/i2c/muxes/i2c-mux-reg.c
+++ b/drivers/i2c/muxes/i2c-mux-reg.c
@@ -11,7 +11,6 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
 #include <linux/platform_data/i2c-mux-reg.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -75,83 +74,59 @@ static int i2c_mux_reg_deselect(struct i2c_mux_core *muxc, u32 chan)
 	return 0;
 }
 
-#ifdef CONFIG_OF
-static int i2c_mux_reg_probe_dt(struct regmux *mux,
-				struct platform_device *pdev)
+static int i2c_mux_reg_probe_fw(struct regmux *mux, struct device *dev)
 {
-	struct device_node *np = pdev->dev.of_node;
-	struct device_node *adapter_np, *child;
+	struct fwnode_handle *fwnode, *child;
 	struct i2c_adapter *adapter;
-	struct resource res;
 	unsigned *values;
-	int i = 0;
+	int ret, i = 0;
 
-	if (!np)
+	if (!dev_fwnode(dev))
 		return -ENODEV;
 
-	adapter_np = of_parse_phandle(np, "i2c-parent", 0);
-	if (!adapter_np) {
-		dev_err(&pdev->dev, "Cannot parse i2c-parent\n");
+	fwnode = fwnode_find_reference(dev_fwnode(dev), "i2c-parent", 0);
+	if (IS_ERR(fwnode)) {
+		dev_err(dev, "missing 'i2c-parent' property\n");
 		return -ENODEV;
 	}
-	adapter = of_find_i2c_adapter_by_node(adapter_np);
-	of_node_put(adapter_np);
+
+	adapter = i2c_get_adapter_by_fwnode(fwnode);
+	fwnode_handle_put(fwnode);
 	if (!adapter)
 		return -EPROBE_DEFER;
 
 	mux->data.parent = i2c_adapter_id(adapter);
 	put_device(&adapter->dev);
 
-	mux->data.n_values = of_get_child_count(np);
-	if (of_property_read_bool(np, "little-endian")) {
-		mux->data.little_endian = true;
-	} else if (of_property_read_bool(np, "big-endian")) {
-		mux->data.little_endian = false;
-	} else {
-#if defined(__BYTE_ORDER) ? __BYTE_ORDER == __LITTLE_ENDIAN : \
-	defined(__LITTLE_ENDIAN)
-		mux->data.little_endian = true;
-#elif defined(__BYTE_ORDER) ? __BYTE_ORDER == __BIG_ENDIAN : \
-	defined(__BIG_ENDIAN)
-		mux->data.little_endian = false;
-#else
-#error Endianness not defined?
-#endif
-	}
-	mux->data.write_only = of_property_read_bool(np, "write-only");
+	mux->data.n_values = device_get_child_node_count(dev);
+	mux->data.little_endian = !device_is_big_endian(dev);
+	mux->data.write_only = device_property_read_bool(dev, "write-only");
 
-	values = devm_kcalloc(&pdev->dev,
-			      mux->data.n_values, sizeof(*mux->data.values),
+	values = devm_kcalloc(dev, mux->data.n_values, sizeof(*mux->data.values),
 			      GFP_KERNEL);
 	if (!values)
 		return -ENOMEM;
 
-	for_each_child_of_node(np, child) {
-		of_property_read_u32(child, "reg", values + i);
+	device_for_each_child_node(dev, child) {
+		if (is_of_node(child)) {
+			fwnode_property_read_u32(child, "reg", values + i);
+		} else if (is_acpi_node(child)) {
+			ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), values + i);
+			if (ret) {
+				fwnode_handle_put(child);
+				return dev_err_probe(dev, ret, "Cannot get address\n");
+			}
+		}
+
 		i++;
 	}
 	mux->data.values = values;
 
-	if (!of_property_read_u32(np, "idle-state", &mux->data.idle))
+	if (!device_property_read_u32(dev, "idle-state", &mux->data.idle))
 		mux->data.idle_in_use = true;
 
-	/* map address from "reg" if exists */
-	if (of_address_to_resource(np, 0, &res) == 0) {
-		mux->data.reg_size = resource_size(&res);
-		mux->data.reg = devm_ioremap_resource(&pdev->dev, &res);
-		if (IS_ERR(mux->data.reg))
-			return PTR_ERR(mux->data.reg);
-	}
-
-	return 0;
-}
-#else
-static int i2c_mux_reg_probe_dt(struct regmux *mux,
-				struct platform_device *pdev)
-{
 	return 0;
 }
-#endif
 
 static int i2c_mux_reg_probe(struct platform_device *pdev)
 {
@@ -169,26 +144,21 @@ static int i2c_mux_reg_probe(struct platform_device *pdev)
 		memcpy(&mux->data, dev_get_platdata(&pdev->dev),
 			sizeof(mux->data));
 	} else {
-		ret = i2c_mux_reg_probe_dt(mux, pdev);
+		ret = i2c_mux_reg_probe_fw(mux, &pdev->dev);
 		if (ret < 0)
-			return dev_err_probe(&pdev->dev, ret,
-					     "Error parsing device tree");
+			return ret;
 	}
 
 	parent = i2c_get_adapter(mux->data.parent);
 	if (!parent)
 		return -EPROBE_DEFER;
 
-	if (!mux->data.reg) {
-		dev_info(&pdev->dev,
-			"Register not set, using platform resource\n");
-		mux->data.reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-		if (IS_ERR(mux->data.reg)) {
-			ret = PTR_ERR(mux->data.reg);
-			goto err_put_parent;
-		}
-		mux->data.reg_size = resource_size(res);
+	mux->data.reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(mux->data.reg)) {
+		ret = PTR_ERR(mux->data.reg);
+		goto err_put_parent;
 	}
+	mux->data.reg_size = resource_size(res);
 
 	if (mux->data.reg_size != 4 && mux->data.reg_size != 2 &&
 	    mux->data.reg_size != 1) {
-- 
2.52.0


