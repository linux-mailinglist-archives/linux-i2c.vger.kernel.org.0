Return-Path: <linux-i2c+bounces-5636-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3167A95A613
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 22:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B54C81F22D73
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 20:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B9C16BE18;
	Wed, 21 Aug 2024 20:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJM4eWoe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27621531C2
	for <linux-i2c@vger.kernel.org>; Wed, 21 Aug 2024 20:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724273308; cv=none; b=ExyHY8FWINlYAdJk7mupX2IQJ//1b8ewYvYKJ/32ADEZXdXgvkVJ2DN/IEvmIad5wmDGcSHUgcIap4Zxm10WvJQF0OoWvAuCa7GXBUt5EDMICyzNv1k+oDMiE7T4b878wRexiK1sv8lgaMPyfOe2jJB+2Kvz2bsQ2J85jpnEbrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724273308; c=relaxed/simple;
	bh=c1/EbP80MsrMkt9MKH5IUjfd/aEOTIe1xIsy7kTFXB4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pW78GqCj5W9Bu4uIahwkG0Ygnv4jdgIUCbcX/TNpSRH3bvi6lLMZAOsm0cnPQa1uSq9drbEPEL0MCxRw0uKeOQY8zr542tGELAaR2r6PqGCmVt3bNx5i5hYYswI60fGDXaIXRayMsUmrqlSgWgGBKyJ1smIZTfymu+Fw+JkRhek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJM4eWoe; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7ab5fc975dso10549866b.1
        for <linux-i2c@vger.kernel.org>; Wed, 21 Aug 2024 13:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724273305; x=1724878105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rAelb5cwS0ePMjUPbL8VF2wN80Y7Um3UILRhs3f0Efk=;
        b=DJM4eWoefxicKdxkOzXksK2L0UhsFZ17/b3RjrnDzcug4Ee0jRpbVwubqieIT2FOOP
         yEb0auNAlclCNSbko0nKqhsqjRjp8bTrKEWfNBXgVQy6+gTNHC271rAqsT32bSfDTMy5
         8c29LucEVpUZOObF2T1FBvGx8PZmKpbsuvf9hoRbTHKxFvtpIXLgusMh17wnNNLd4zc4
         zNzZPFC3dqZAghngGyB8914QRPri9ynvbiHH/HfjJDzgv0qj9a2/rNnk98mRdn5yszgQ
         ahP0ZVEG9Soe8L/RxtFDY/rLYdjvoGNHk/vVMJK/v/yFSD03wwzQiYzt6RiiHVsSqL9V
         PqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724273305; x=1724878105;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAelb5cwS0ePMjUPbL8VF2wN80Y7Um3UILRhs3f0Efk=;
        b=B4rn1FWhXrUKxy6OHVOhCgfbGx9yoluFK4yfScnrFgYCb8m9Xe0xzt9YI0XnYO8sma
         Rna0MXT9BA9TlgWrElP3RCTOshntSfqA1W8lHU34pgE25xvLi3Ez9GRb/JU8adiSJebA
         l6jfsR5PTFezgiv52iven7U6fr+AjSn92qsJxtRaNg1vT5p0vieqiLNr+ht58kqVYF6S
         oqtPBWiC5/xsu+5sqaS5aFkFdTSc4M2pZ1AE0d9KW2dcVYQQICM0cVoMkZzGOKGoFmaU
         H4Z13iw84s8EwW2xFtbPxdC//qIprxry31wiOTZnUcIgg6DFzBL/i7bPUgUzKBu+Tgl5
         MiAA==
X-Gm-Message-State: AOJu0Yw82WAHOyb5xw/F+usVIPYl8qfTeJdXsroHz+qK2s4p51QN8vVX
	2vxnJENaWWKTeYuB0Rou0rNtGAoQNMOpSjK/jIivnMCIHJYTAsQJq/sjBw==
X-Google-Smtp-Source: AGHT+IEM+Cuht+ZxyAavDzkPNjlZI9yquTSFyJn45g59yyicnCVjMfegCiqGPU0Ew5dXbIQ0xW8DlQ==
X-Received: by 2002:a17:907:e6e4:b0:a77:abe5:5f47 with SMTP id a640c23a62f3a-a866f9f01eemr272521266b.63.1724273304710;
        Wed, 21 Aug 2024 13:48:24 -0700 (PDT)
Received: from ?IPV6:2a01:c22:76de:5100:1131:aa83:adfe:51dd? (dynamic-2a01-0c22-76de-5100-1131-aa83-adfe-51dd.c22.pool.telefonica.de. [2a01:c22:76de:5100:1131:aa83:adfe:51dd])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a868f28f109sm9329166b.55.2024.08.21.13.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 13:48:24 -0700 (PDT)
Message-ID: <01cef629-5650-4ef2-93db-9a16893ff5a0@gmail.com>
Date: Wed, 21 Aug 2024 22:48:23 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/3] i2c: Remove obsolete members of i2c_adapter and
 i2c_client
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <9fabf29f-2b45-461e-ae6e-4391a40bcaca@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <9fabf29f-2b45-461e-ae6e-4391a40bcaca@gmail.com>
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
index b9f1b1a1b..4224ba6b1 100644
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



