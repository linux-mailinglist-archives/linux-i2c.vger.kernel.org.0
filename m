Return-Path: <linux-i2c+bounces-12944-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E9DB56C06
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Sep 2025 22:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 116FB17B5DB
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Sep 2025 20:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B939B2E718B;
	Sun, 14 Sep 2025 20:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sc4VNQm4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959FEEEAB
	for <linux-i2c@vger.kernel.org>; Sun, 14 Sep 2025 20:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757880643; cv=none; b=AdlvgLnpPhmQxJe1cm89NJpJNrJwy14E+hgiO+NVQc72LeeUysGa6snuGoGLTadWGNK7vBekHLqpNBOUYhVDkg/dUxu/uAvz+E6qLXPbgGzTDWZlrLJ+3AHt6cELflOwFvLXqOZDpK5UNiC68WMNG8RMpJaBrwxwQwU9jbL23Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757880643; c=relaxed/simple;
	bh=WCUuRSzqDNeLLsxlymOYpRd76mRuHhlb6VEZID8GazI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=gHaDxh9SP/0pUrIlY4/R6vR4XZvLPOWscSYYEs0dsQTFJIcztPxgat73APt2tWFLEqOsOgDppl5qwQ8TeqfleXiQxJoINwUZWyNvRqbwK454VU+McXL5HRidLhjy39A55vbyskiDAiAilWDochlysRz9d3rDvb/Oyo0DRJpka0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sc4VNQm4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45de1084868so18326765e9.2
        for <linux-i2c@vger.kernel.org>; Sun, 14 Sep 2025 13:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757880640; x=1758485440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WdT7UbZmpWOKZ34G8yOFu9Std58H6KdsbfgYbp0dyyM=;
        b=Sc4VNQm462HYZl4KeedgVy3/fTIStqinhP48gzSJCDqT8AvbjbFHGrwd8DFQS0RrDk
         wYem3cS0/hsEqf2G89K0rQY+slOODT6gSRePLozRZBODEujYkULtk2CJBlXFY0X/sapb
         14dQCQW3RJvIQRD6NRapBYY5mhCeIe2NWlTHjzc9j47F69pIH/RcAnJdHPDrtYpLsL5l
         6S0b1XIs2bzJ6NiqHgrv4RoNqmOo+zgjsXiRpZIZPVlnsi0sCwXzHLup4C2xDQ2n64Mf
         q4gJqLnQfS+e10Bgqvgfdb20JtHoW39sg1c9zI5NY+Zu8YWmem2IKD18kpExWyRODGEv
         9H8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757880640; x=1758485440;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WdT7UbZmpWOKZ34G8yOFu9Std58H6KdsbfgYbp0dyyM=;
        b=h2gks+oB6fJ41jC2S3taQ5XLbi9Xc9kVmWn/IMiF6y4uG/9bCSYl+EhK4u+njsvvXZ
         8chh3rlGlRFb1cTZTbXqpQM2pDVhlHapm16fTihPDB/Ndn09cq5/JKs6M37+ij2SF69m
         5ETWMGdtXHFCK/QewCjCbGxBxivSW2XDlFvjfQYCR+5j2V6NziyOuHvzOwrVf6Wpj61j
         0PAv0ioeeAhiTW9IVEp40qnIhj0QuFTPADyoJn4tFpv9Yox4tLgpxsVKbroO0xfRGl0X
         LnY6qFA0hpgy3mkH4gdvz8oaudwklQfqLQx4v9gQKQV8ClNp3Lrg/WVt/S8BbO7/m8eT
         TFcA==
X-Gm-Message-State: AOJu0YyR9o3OcUAZX8D8ao6T3shvbJL7c2OZxDAwGF5Kh9KTknBT1WVA
	hmujhba9lOMxoqdtEz+SawS1UPxb1R0yQtdHjjsmNRiHu1HOFn/Rm3MU7K0YvQug
X-Gm-Gg: ASbGncvSlBW4CyCv2yPsBOa5yAHyY/oofSHZsfRXHt82ABXd5sUU2NmSaiC4mFD76l2
	Nvn/qte4NFLI198CtZSntL3NBBYoDLdbpXt2ge2CDiKD7imcXdxIP6hUknpgEHxDO0VEuBPoq5M
	H3WbiZAub4WUeMuBmM0UHq31VWMkpRsQvW6HY9aAoYyYZDRIEYZYIIgkF3bjM+oEOR1CtgwG11i
	K7ByPw4pqD0zpjaTcSaJfYSwpJwTeL5/2GscQTiNrScuZKHMGmlW8mplKRx8ICwoWaJYbiFiFtZ
	SQfp66szIwLDXAiW3nlVomH+rB4PFacsoLgy1sS1DiRG9CWy5L4sLo7clwio6eRUHalV6ahv2bP
	ngwvF9HCyJa8UMHZVB12WJwzh3kimStDCWSKVo2hXHdod2DCotaRq06oMn3RX2V8StUlmP4Fqd4
	/shMBF6uQe/ghdg3sV91b2TJs4rbqGmfAyLADgaLfidtYwOHFHjfOkls9bwn4zQBsiNJXPmAsC
X-Google-Smtp-Source: AGHT+IG4BcmQfYIu8CvCUiewhdgbo5jKOuJN3eBZ5kq47Xnt5ZukGDIsBQYcB/ZfYvnMAzLfK2Qriw==
X-Received: by 2002:a05:600c:364b:b0:45d:dae8:b137 with SMTP id 5b1f17b1804b1-45f211f3140mr67070615e9.22.1757880639430;
        Sun, 14 Sep 2025 13:10:39 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f49:dd00:818b:e162:8b70:83cb? (p200300ea8f49dd00818be1628b7083cb.dip0.t-ipconnect.de. [2003:ea:8f49:dd00:818b:e162:8b70:83cb])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45e037c3ce5sm146375555e9.16.2025.09.14.13.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Sep 2025 13:10:39 -0700 (PDT)
Message-ID: <09c81521-1444-4c6d-8ded-4318c95d6bdd@gmail.com>
Date: Sun, 14 Sep 2025 22:10:38 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: core: Switch adapter number assignment from idr to
 xarray
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

IDR API is deprecated, see 85656ec193e9 ("IDR: Note that the IDR API
is deprecated"). So replace it with an xarray here. One benefit is
that xarray includes locking, therefore we can remove taking core_lock
for id operations.

In my tests there was no change in assigned adapter numbers.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/i2c-core-base.c | 62 ++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 38 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ecca8c006..8c3a30082 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -23,7 +23,6 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/i2c-smbus.h>
-#include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -42,6 +41,7 @@
 #include <linux/rwsem.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
+#include <linux/xarray.h>
 
 #include "i2c-core.h"
 
@@ -56,12 +56,10 @@
 
 #define I2C_ADDR_DEVICE_ID	0x7c
 
-/*
- * core_lock protects i2c_adapter_idr, and guarantees that device detection,
- * deletion of detected devices are serialized
- */
+/* core_lock guarantees that device detection, deletion of detected devices are serialized */
 static DEFINE_MUTEX(core_lock);
-static DEFINE_IDR(i2c_adapter_idr);
+
+static DEFINE_XARRAY_ALLOC(i2c_adapter_xa);
 
 static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver);
 
@@ -1613,9 +1611,7 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	device_unregister(&adap->dev);
 	wait_for_completion(&adap->dev_released);
 out_list:
-	mutex_lock(&core_lock);
-	idr_remove(&i2c_adapter_idr, adap->nr);
-	mutex_unlock(&core_lock);
+	xa_erase(&i2c_adapter_xa, adap->nr);
 	return res;
 }
 
@@ -1628,13 +1624,12 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
  */
 static int __i2c_add_numbered_adapter(struct i2c_adapter *adap)
 {
-	int id;
+	int ret;
+	u32 id;
 
-	mutex_lock(&core_lock);
-	id = idr_alloc(&i2c_adapter_idr, adap, adap->nr, adap->nr + 1, GFP_KERNEL);
-	mutex_unlock(&core_lock);
-	if (WARN(id < 0, "couldn't get idr"))
-		return id == -ENOSPC ? -EBUSY : id;
+	ret = xa_alloc(&i2c_adapter_xa, &id, adap, XA_LIMIT(adap->nr, adap->nr), GFP_KERNEL);
+	if (WARN(ret < 0, "couldn't get xa: error %d", ret))
+		return ret;
 
 	return i2c_register_adapter(adap);
 }
@@ -1656,20 +1651,19 @@ static int __i2c_add_numbered_adapter(struct i2c_adapter *adap)
 int i2c_add_adapter(struct i2c_adapter *adapter)
 {
 	struct device *dev = &adapter->dev;
-	int id;
+	int ret;
+	u32 id;
 
-	id = of_alias_get_id(dev->of_node, "i2c");
-	if (id >= 0) {
-		adapter->nr = id;
+	ret = of_alias_get_id(dev->of_node, "i2c");
+	if (ret >= 0) {
+		adapter->nr = ret;
 		return __i2c_add_numbered_adapter(adapter);
 	}
 
-	mutex_lock(&core_lock);
-	id = idr_alloc(&i2c_adapter_idr, adapter,
-		       __i2c_first_dynamic_bus_num, 0, GFP_KERNEL);
-	mutex_unlock(&core_lock);
-	if (WARN(id < 0, "couldn't get idr"))
-		return id;
+	ret = xa_alloc(&i2c_adapter_xa, &id, adapter,
+		       XA_LIMIT(__i2c_first_dynamic_bus_num, UINT_MAX), GFP_KERNEL);
+	if (WARN(ret < 0, "couldn't get xa, error %d", ret))
+		return ret;
 
 	adapter->nr = id;
 
@@ -1761,9 +1755,7 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 	struct i2c_client *client, *next;
 
 	/* First make sure that this adapter was ever added */
-	mutex_lock(&core_lock);
-	found = idr_find(&i2c_adapter_idr, adap->nr);
-	mutex_unlock(&core_lock);
+	found = xa_load(&i2c_adapter_xa, adap->nr);
 	if (found != adap) {
 		pr_debug("attempting to delete unregistered adapter [%s]\n", adap->name);
 		return;
@@ -1817,9 +1809,7 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 	wait_for_completion(&adap->dev_released);
 
 	/* free bus id */
-	mutex_lock(&core_lock);
-	idr_remove(&i2c_adapter_idr, adap->nr);
-	mutex_unlock(&core_lock);
+	xa_erase(&i2c_adapter_xa, adap->nr);
 
 	/* Clear the device structure in case this adapter is ever going to be
 	   added again */
@@ -2607,17 +2597,13 @@ struct i2c_adapter *i2c_get_adapter(int nr)
 	struct i2c_adapter *adapter;
 
 	mutex_lock(&core_lock);
-	adapter = idr_find(&i2c_adapter_idr, nr);
-	if (!adapter)
-		goto exit;
-
-	if (try_module_get(adapter->owner))
+	adapter = xa_load(&i2c_adapter_xa, nr);
+	if (adapter && try_module_get(adapter->owner))
 		get_device(&adapter->dev);
 	else
 		adapter = NULL;
-
- exit:
 	mutex_unlock(&core_lock);
+
 	return adapter;
 }
 EXPORT_SYMBOL(i2c_get_adapter);
-- 
2.51.0


