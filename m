Return-Path: <linux-i2c+bounces-2623-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 629F188CF33
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 21:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19419340ED8
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 20:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FB212AAF7;
	Tue, 26 Mar 2024 20:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFQDzA3p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519BB12AAF2
	for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 20:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711485768; cv=none; b=ckCvU8VKPnviYgq1ZHC3Tv94biY4b446O8JgqbNvVNhVZwYbScPHv17TmnQkXylljGQ6L/BIPBVcqsEqW7erLcr5WbmQGQAZsIexKm/STaLG8YNaoh9OeL1Qb/0ebX0/gdiz0hhSRGkEd22fsleAsOhBzsqNnkCO/DcEVvcurqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711485768; c=relaxed/simple;
	bh=+RnwQ0VBO/curTHY/we39dp0YbY0zC7wGNc0sp+ZyFI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=OwCRlEJyajHywtVW1EveWks4v64r7I9X0TDxG5Z9h4hwiApTvH7ZuAzN4a98Uiykzuo/0Yg2AHibQRPd9HVk5r8LadTEuiEhHCJpNyJyFQsMXZAQAtIGNackmrPgiXuvzjx7Qz0lGc/KUu88oxqSkZoebvnbZ51JqXhOIwaRShw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFQDzA3p; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d6c9678cbdso47437991fa.2
        for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 13:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711485764; x=1712090564; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zH9hbR+yMpLqeiNf9PU91Ju22w2ekQ2w1WQYawtKEP0=;
        b=BFQDzA3pBrkl9WEDQJAxGEpewawrAZClY2PYjqWcA4yx9rKSisXRZdTVKKz+1YQUTx
         nmOGniPbtHm5ULiHPqZRO8B7bCk0rAyO9PfVwN8FbGSeEd0LqRII+0YQeMOwBphYmv01
         g/jG3Nf1Ly/o+pmIADXZ05xfN8+9UFVAldvASLX8/HTjJB5pBeR6rx48jjnkb0SoFjI+
         pr0nl3e88ei+jUolK9/V0J0D7tfsmaX+NjL6fKcrtNQKjiCGANAds/fkE5fmRf8Lu9TL
         Yq2ehnedH8qVu78YAIVvnrWcN31RjJNsPT2BWSU6f1XHAt/CD1YpIHzfLUzlJVW1XghR
         RkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711485764; x=1712090564;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zH9hbR+yMpLqeiNf9PU91Ju22w2ekQ2w1WQYawtKEP0=;
        b=ffT+J5Cj/VbqULtxUHy185n7LIKzKCz5Kfn4Cq8J826EomEodAsEvMSwMTxJ5movyY
         GMq/drreEHJr6nR59RxZzN4jhqCYpw8sle4M9y/DXK9qkIt+d/fLTo1h1v6V9Jv/s5WP
         Txrk1F32gXs9g+SSQcGdxLKZQIdpxn3BjAT25jk+N39oKuTV/VIOJjRNIS/GGbClwrkw
         htWcxDsY1zXHFENhC/vmaOQp1QCBejfH86nJtF+lf4Ysex4Xt1TUrrYcynldLOVAyQzN
         /CcBNhmIanbQexL5bH4BBhooF9t3B8TTRE6Vr5vyFvhWNziAQKvTNvnLOYEkl4+tCmq1
         DJIA==
X-Gm-Message-State: AOJu0YyqR+0czQnhjcPZ6Hvr5d3UdPrJAguvlSEa1umeCryoGhMjhxs3
	1OXxpiq79BQxdWI3uOSNtP0X1UQMZ4/7/zhyT2PkhwpXYWECBU9M
X-Google-Smtp-Source: AGHT+IH40wj+iMdLVaW6LwlrIlTsqrXbZVTRHGAPsA4Hg9BY9vZ/qOsgOt4J9wDjNaak/oL15Giymw==
X-Received: by 2002:a05:651c:1407:b0:2d3:f3bc:bb65 with SMTP id u7-20020a05651c140700b002d3f3bcbb65mr1452116lje.11.1711485763851;
        Tue, 26 Mar 2024 13:42:43 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6f11:a700:a877:8eb2:587c:b36f? (dynamic-2a01-0c22-6f11-a700-a877-8eb2-587c-b36f.c22.pool.telefonica.de. [2a01:c22:6f11:a700:a877:8eb2:587c:b36f])
        by smtp.googlemail.com with ESMTPSA id d2-20020aa7d682000000b005682a0e915fsm4522020edr.76.2024.03.26.13.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 13:42:43 -0700 (PDT)
Message-ID: <f9df04f6-9dc2-4874-bc6c-473dc3d692b9@gmail.com>
Date: Tue, 26 Mar 2024 21:42:44 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jean Delvare <jdelvare@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: Call i2c_register_spd for muxed child segments
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Once the gpio mux driver binds to the "i2c-mux-gpio" platform device,
this creates the i2c adapters for the muxed child segments.
We can use the bus notifier mechanism to check for creation of the
child i2d adapters, and call i2c_register_spd() for them. This allows
to detect all DIMM's on systems with more than 8 memory slots.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
- Rebased version of a RFC patch
- Sent as RFT to lkml, but no feedback after 3 weeks.
  So give it enough time in linux-next before 6.10-rc1.
---
 drivers/i2c/busses/i2c-i801.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 79870dd7a..4294c0c63 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -105,6 +105,7 @@
 #include <linux/ioport.h>
 #include <linux/init.h>
 #include <linux/i2c.h>
+#include <linux/i2c-mux.h>
 #include <linux/i2c-smbus.h>
 #include <linux/acpi.h>
 #include <linux/io.h>
@@ -291,6 +292,7 @@ struct i801_priv {
 #if IS_ENABLED(CONFIG_I2C_MUX_GPIO) && defined CONFIG_DMI
 	struct platform_device *mux_pdev;
 	struct gpiod_lookup_table *lookup;
+	struct notifier_block mux_notifier_block;
 #endif
 	struct platform_device *tco_pdev;
 
@@ -1394,6 +1396,23 @@ static const struct dmi_system_id mux_dmi_table[] = {
 	{ }
 };
 
+static int i801_notifier_call(struct notifier_block *nb, unsigned long action,
+			      void *data)
+{
+	struct i801_priv *priv = container_of(nb, struct i801_priv, mux_notifier_block);
+	struct device *dev = data;
+
+	if (action != BUS_NOTIFY_ADD_DEVICE ||
+	    dev->type != &i2c_adapter_type ||
+	    i2c_root_adapter(dev) != &priv->adapter)
+		return NOTIFY_DONE;
+
+	/* Call i2c_register_spd for muxed child segments */
+	i2c_register_spd(to_i2c_adapter(dev));
+
+	return NOTIFY_OK;
+}
+
 /* Setup multiplexing if needed */
 static void i801_add_mux(struct i801_priv *priv)
 {
@@ -1430,6 +1449,9 @@ static void i801_add_mux(struct i801_priv *priv)
 					       mux_config->gpios[i], "mux", 0);
 	gpiod_add_lookup_table(lookup);
 
+	priv->mux_notifier_block.notifier_call = i801_notifier_call;
+	if (bus_register_notifier(&i2c_bus_type, &priv->mux_notifier_block))
+		return;
 	/*
 	 * Register the mux device, we use PLATFORM_DEVID_NONE here
 	 * because since we are referring to the GPIO chip by name we are
@@ -1451,6 +1473,7 @@ static void i801_add_mux(struct i801_priv *priv)
 
 static void i801_del_mux(struct i801_priv *priv)
 {
+	bus_unregister_notifier(&i2c_bus_type, &priv->mux_notifier_block);
 	platform_device_unregister(priv->mux_pdev);
 	gpiod_remove_lookup_table(priv->lookup);
 }
-- 
2.44.0


