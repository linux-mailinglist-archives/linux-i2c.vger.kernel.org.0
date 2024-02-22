Return-Path: <linux-i2c+bounces-1934-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A8086059E
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 23:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AFED289FB3
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 22:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE1312D21F;
	Thu, 22 Feb 2024 22:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ms8RHScz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68A712D21B
	for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 22:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708640744; cv=none; b=czhZa5KYtjUN30/DVkTtTgo1DJHabTG/0iQT47e7pisyHthDbhKhWroFlgzao5faqpuOgl8y+p2n0ajetFVJsUqLMdH+g5P1jD45a95u75bFxZG1sPfxhNmP2CVqB9Tdpn2UgK/8OofKRRBpbLYC2S8DOTLERhxco+xL2Y594Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708640744; c=relaxed/simple;
	bh=1FOw7JeWLA1z9gfr51NOf9TDEq0/hJTcBseKOLWG+Ds=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HN+MaUw8hUfd3ptKUbtejBWz+3v4nsORvre5Uc3+283TcCf7d0cZMRm+fIYfhsSjqLii8ynIxQGx13qwqOU3nHOXzoSe4bsH0i6tRt46hI9+hs4tDLux281pntH18/iy+il0q0ZXLiePjpn7JWS/e50dkgYu/7ak5y4RFPtPqZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ms8RHScz; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a3f5808b0dfso29260566b.1
        for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 14:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708640741; x=1709245541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xgvoF9O/lTDNobFl8uMWrpSfkIE3OdVIRHHFt815fe8=;
        b=ms8RHSczQ0AFxpdA0hblXp+4tN7GAQOCAQiGDE4n2PYMSLJ//3mr+cV+tGI02WCzaJ
         YU6HxSkWAz0NDGsx+pMD60vJjakYXFZMM4/h22D3B19NmHDX7Il13jPsnxVSbB2Ke/pK
         Sex+p4td1TbcSAK+6ZuKiNHXN18e8VFLkYHZZ1HLGvIEeDcb0dafEiveYmpLY0SkqZVi
         u95BOmt1J7FxTcnh5HuMFCi7B9BpVGE3PWwQoZfDTxFtOh2s7jBc87C3z8uM5AuccEua
         +I6/6PA7TFjQHHSurl3BvYjO6XU11JOnkD2KSK2oXAxl33BnzpgeLDPvN2l/BZ86QCxR
         L1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708640741; x=1709245541;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgvoF9O/lTDNobFl8uMWrpSfkIE3OdVIRHHFt815fe8=;
        b=LIZCZxoFkZhwBxJTavSGgyFzOtx5vNsmpqPm7qglZwuDjds/1DfXc53HbbefrBf9LP
         JeyPApaEb/xnOGlrJti5gWE1C0uez2WoorqhsW4pJJWPiCBM/AOkAllv5NN1gVM5+E8g
         r+JM4yAn4PpyDkNx/RxPf9A59tberz7K/6+hGwcsqi/QpvIVbzI9pPWufhFgZV7DgfgN
         D8/iarxBIUlF7IxHGeqwZgQRC5107moKdufGwzbBVogrGRwfA+uln07FLDbHt8Oi7v82
         47tuKgQuwzark6ZzffBjpaIZtTXo0L+U1pHJW1HyOlsRiTuyMZE7IpaVhwHQkd7P1y+E
         lLzg==
X-Gm-Message-State: AOJu0YyoefKDYuhjdRBGtKXFebRnqYaAbXRQOENl0r3BzpwrI1DRhY9J
	LVtTg2t69rJJ0GrQ3fZbSY8cwNppOlnBwOfpKHbBeZUVr+ApDsn6GBtM7UYe
X-Google-Smtp-Source: AGHT+IEVcQIiu05m/sbWrLQ43YXNKOdv8p2dLa1Q1LyPiKjAyo5FyaiFlqbSPC6MxbOFjYFhhJYjfg==
X-Received: by 2002:a17:906:b34a:b0:a3e:8d17:ea94 with SMTP id cd10-20020a170906b34a00b00a3e8d17ea94mr101506ejb.55.1708640741043;
        Thu, 22 Feb 2024 14:25:41 -0800 (PST)
Received: from ?IPV6:2a01:c22:7266:d800:30f8:c84f:4a91:c419? (dynamic-2a01-0c22-7266-d800-30f8-c84f-4a91-c419.c22.pool.telefonica.de. [2a01:c22:7266:d800:30f8:c84f:4a91:c419])
        by smtp.googlemail.com with ESMTPSA id vi11-20020a170907d40b00b00a3fb9f1f10csm145712ejc.161.2024.02.22.14.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 14:25:40 -0800 (PST)
Message-ID: <cf8058db-03d2-4d47-bc39-2645c3d42e10@gmail.com>
Date: Thu, 22 Feb 2024 23:25:43 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH RFC 2/2] i2c: i801: Call i2c_register_spd for muxed child
 segments
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jean Delvare <jdelvare@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <eac54582-44f6-4101-93d9-012eb4ee3241@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <eac54582-44f6-4101-93d9-012eb4ee3241@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Once the gpio mux driver binds to the "i2c-mux-gpio" platform device,
this creates the i2c adapters for the muxed child segments.
We can use the bus notifier mechanism to check for creation of the
child i2d adapters, and call i2c_register_spd() for them. This allows
to detect all DIMM's on systems with more than 8 memory slots.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 8f225cd7b..4b9d04f20 100644
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
 
@@ -1388,6 +1390,23 @@ static const struct dmi_system_id mux_dmi_table[] = {
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
@@ -1425,6 +1444,9 @@ static void i801_add_mux(struct i801_priv *priv)
 	gpiod_add_lookup_table(lookup);
 	priv->lookup = lookup;
 
+	priv->mux_notifier_block.notifier_call = i801_notifier_call;
+	if (bus_register_notifier(&i2c_bus_type, &priv->mux_notifier_block))
+		return;
 	/*
 	 * Register the mux device, we use PLATFORM_DEVID_NONE here
 	 * because since we are referring to the GPIO chip by name we are
@@ -1443,6 +1465,7 @@ static void i801_add_mux(struct i801_priv *priv)
 
 static void i801_del_mux(struct i801_priv *priv)
 {
+	bus_unregister_notifier(&i2c_bus_type, &priv->mux_notifier_block);
 	platform_device_unregister(priv->mux_pdev);
 	gpiod_remove_lookup_table(priv->lookup);
 }
-- 
2.43.2



