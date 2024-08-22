Return-Path: <linux-i2c+bounces-5705-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2246295BF1E
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 21:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0FDB1F22C05
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 19:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354071D04A1;
	Thu, 22 Aug 2024 19:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQ/6SB4l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEAE17588;
	Thu, 22 Aug 2024 19:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724356173; cv=none; b=RU4kbaaU3vWrMCceP0MTLKhoX/bj3jHnbCxqOEz++BQvcg7azhUMaJkynoCAsMUolo+nGfQYI8kQ7wEAL8JAW3OIoiKDWk2A6SyBDSPHBHiaiwhM0brDkRcHUD6NFVvx/H0DxBSLTgof4wwQFctMh+nWG1Kmv47ybpEOAMEoEAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724356173; c=relaxed/simple;
	bh=WcDtJ1va4cDjijFxFiNXCmNZkbPCYiFpsQHtYa0AGrc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BXITL70wPS0cOHGv2VHxJxqEYWv2f0KukuHWHANLJ8VLJRY8Bc2rUs/VcGk79i2ffOQkv8NjRsnuNWC5ryiPbkpkPBQcIuWhNXr3Sc9R4OMHLTycdS2ztYtoUwhkGaL3OF1fTDHbC4pwxvtEZAACEc1B1b81SJh45peIqCsSa34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQ/6SB4l; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a86859e2fc0so150528366b.3;
        Thu, 22 Aug 2024 12:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724356170; x=1724960970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=01GPZdVAKKYFJ62QaUI43AEcEia2bRfjRuXnWEnsl8E=;
        b=eQ/6SB4loB6PZ/+AV4hVOH6LssHrzUJUMnqe1zyBY71+KlLUeCCRNpjAp1Y/TRPc3u
         kl0oV0x6h9yEStoRGPjI4K3C8yc+T0SrLPRGGRsIaZdoIE5yqtwM0nQvVtRgc4mLv350
         ZrjzVJKI7P/tgRJpJKwfTfJ1kjftbhN6zGK8eM+tZqw1SPuY5RIkbmHm1lbuv1LDyERd
         nMCoMec+/H9CKxP46ZJgxP9cfBC5X1rrt6sTAh4jULDXmcFmQSpCsDbnsE05JGL3chZJ
         F7xKxVqlkKPix6wwFGHddfpBbtI4rFb+PMwqUe+E2+C3OhnngUcyUHA3QtxkLqM0sY4a
         Ji+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724356170; x=1724960970;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01GPZdVAKKYFJ62QaUI43AEcEia2bRfjRuXnWEnsl8E=;
        b=XzcfyK7Y41+jBbcNevJrOiHew2Lo0LOrLYq2zGyeHlESxAmcUK950TEXvQaagKX8pk
         jkxyE1+n+QSZCUBINoQaEuFSv483AXLXZP1KNqWmn2hTKhmyrKlF+crtkimXifiaqGd5
         AEjzwZS/Lz6gKmkgmj4F0LnUzYr6aaSG5/OeU2Q9YKgRNI+Vtqab/J1/wUBBrCut6O7l
         ELrNGgOWUomlGnrGkua6DYRbOKCIX51dL2N9GUCC72GO41a+RS/b82Q2IEEInG2aWwbN
         LAJDOM6Vg84qtO27baOmnFjCtOaww3LDMGwk64JSSP6H9qRzkaT/A0AK2boJA9riucXB
         ZQng==
X-Forwarded-Encrypted: i=1; AJvYcCVG+ZJ/ceRiiRSLRNcrwPtetOSMVntuJZPLQqO+GQiKJWJ82dsGoV7J2sd6jpFE5496LKiuXnAKq0LuhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyumaMXyxMt59vkHoCCHqxKLQPf2SddW+JUvvN5MpfIhrhsGZhy
	lKSvI/HOHIU46SYQK4sQtGZFGFXe00Ggy+9X9Mk0rDADdwpuiYef
X-Google-Smtp-Source: AGHT+IHsIGkqdy2rJX5fdqa2juKWDxuxwOEUWoVO53ZojJFzFpQ2//K/Tgvyrt5UbhezuHARG1/hgw==
X-Received: by 2002:a17:906:bc13:b0:a86:8a89:3d6c with SMTP id a640c23a62f3a-a868a893e64mr281405166b.66.1724356169567;
        Thu, 22 Aug 2024 12:49:29 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9dc4:2200:e9ea:53e6:39db:eab3? (dynamic-2a02-3100-9dc4-2200-e9ea-53e6-39db-eab3.310.pool.telefonica.de. [2a02:3100:9dc4:2200:e9ea:53e6:39db:eab3])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a868f222b23sm160034266b.19.2024.08.22.12.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 12:49:29 -0700 (PDT)
Message-ID: <ddf1ac29-1fe9-4432-be76-574203d185e1@gmail.com>
Date: Thu, 22 Aug 2024 21:49:29 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 4/4] i2c: core: Remove obsolete members of i2c_adapter and
 i2c_client
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 linux-sound@vger.kernel.org
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

After the lists of auto-detected and userspace-created clients have been
removed, we can remove now unused struct members.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/i2c-core-base.c | 2 --
 include/linux/i2c.h         | 6 ------
 2 files changed, 8 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 15281c58a..e633ca215 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1499,8 +1499,6 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	adap->locked_flags = 0;
 	rt_mutex_init(&adap->bus_lock);
 	rt_mutex_init(&adap->mux_lock);
-	mutex_init(&adap->userspace_clients_lock);
-	INIT_LIST_HEAD(&adap->userspace_clients);
 
 	/* Set default timeout to 1 second if not already set */
 	if (adap->timeout == 0)
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index ba2564fe4..ada90df88 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -313,8 +313,6 @@ struct i2c_driver {
  * @dev: Driver model device node for the slave.
  * @init_irq: IRQ that was set at initialization
  * @irq: indicates the IRQ generated by this device (if any)
- * @detected: member of an i2c_driver.clients list or i2c-core's
- *	userspace_devices list
  * @slave_cb: Callback when I2C slave mode of an adapter is used. The adapter
  *	calls it to pass on slave events to the slave driver.
  * @devres_group_id: id of the devres group that will be created for resources
@@ -345,7 +343,6 @@ struct i2c_client {
 	struct device dev;		/* the device structure		*/
 	int init_irq;			/* irq set at initialization	*/
 	int irq;			/* irq issued by device		*/
-	struct list_head detected;
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	i2c_slave_cb_t slave_cb;	/* callback for slave mode	*/
 #endif
@@ -751,9 +748,6 @@ struct i2c_adapter {
 	char name[48];
 	struct completion dev_released;
 
-	struct mutex userspace_clients_lock;
-	struct list_head userspace_clients;
-
 	struct i2c_bus_recovery_info *bus_recovery_info;
 	const struct i2c_adapter_quirks *quirks;
 
-- 
2.46.0



