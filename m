Return-Path: <linux-i2c+bounces-7739-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D739B9AAF
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 23:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52955B21C75
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 22:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4D71E571D;
	Fri,  1 Nov 2024 22:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlp39ud3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87330140E34;
	Fri,  1 Nov 2024 22:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730499154; cv=none; b=WnZpBPAiivg8SWzbcFn13GWvXdA/AOXCrsYKET6c3JVIlqnIvRv9xXptnkIRx/ylZf9d9em7XJZSk7FR+HXQJFWYs++Qi8FUxoN4wCqHUUkcf7Z7wpatZ0QkQ+k975wRT9vHNszFAg/zNJGEMV2GFQeeiFB+oQBsm62nV80oaZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730499154; c=relaxed/simple;
	bh=Isa3y+7fan9RtWtq6m080K6phf2ClQ7hWCxy61obMJQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BQ0XQLkwERiQtXk9buAlOUSxSiHJTYQ0g1g7VOqZ6yNGIdcvrLJj1FDBDPXxtXh1raUOovuTBk9wtr6l5Lj/9FXPGA1iEscwC9HkfCIbEEPSlk7bpsf40Ob2nWjOk+3TJImgIM3iTvvAFrL1WuH73ErxybSL4P/Yu54g49yH0d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlp39ud3; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a99f3a5a44cso321337166b.3;
        Fri, 01 Nov 2024 15:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730499151; x=1731103951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a3QMI16GFQtgLYx2O7jhdDk/qMOj0cUXZKRxEAXJaQ4=;
        b=nlp39ud3TSQiRC6qPV3Kk3xxI3d1Vvj4nzDuy0zl3Dwf8V3XOBdZOrl9t0IUOJBF8W
         rI9zDU/i4Jwh8KVNLaa1TjvQz9yMfuLqjR1UmPY8qne/utwrWH0qBuOR/N2JcB1RHYbk
         XuNuQ5lT5lbON0m8o0ZkA8qg22kPlVaAjaEjPfKx8XeKXBRmCLGsW2KOhS9AQo96TB1Q
         HNU5G5QBMKchznXnzWarQWE80cYJvf06qdG0RIw+gWGiD5bPp6NrMZaP6cy5vTuNNwfu
         NpnBODqFjoR/CO3WJ4l33meMginbruGg31AkmAyUW+Qk5KWHYz0MbUUDTBY1yq1qfXP3
         H8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730499151; x=1731103951;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3QMI16GFQtgLYx2O7jhdDk/qMOj0cUXZKRxEAXJaQ4=;
        b=IxZDkUd7cnmKS3cBpmBiOYPUKYIxwul0z0GBwlUl/uYLUJ3L/TATeesgnYWOzB1TVS
         1MXQHzuB42t1yLci/tvP+M4aoHjx13Pt838+aRn/UKXdKHZUrW43uADF10QXqpjilOta
         b9xpyWFlUXZw/b/XZqp6qFzyZQNkBGl/vEqlob8FMvANS3zhYY77zadExflZkm/m7GSZ
         Aq3AohAGxWXvSj1n23J4d7xdREJK7lawxEXTOgMd58sRoIAHCzSD/j1Y/uKOxhC6JaHN
         o2k94MIVLBULTdsG9UL6RyyCnkw3KLvLQFJGuBr7bpqF+gS1/fMP6odpTFMg273cd0a3
         5XbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMn1Jd2bVHlTrco7n217G4YJObJE1p37FoJOun1CMfyT5sMwGogMWJSSCE2tivnZe+vaHesN7Tdk1SIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyF6qJOcHutUEnz35BB+OYcheptH+amSjlVUxE3DZG2rOtjI9VL
	yqmksSlu1rtnmVI4ziNK19jJmg9otwU0GmJI+8OuE1mVV5mXBinXTxDCzw==
X-Google-Smtp-Source: AGHT+IH4ZOTAVJiP+r9p3Vp84IPINvLCnkdppwkZQXSZXyNJM9zWXUrU12GSavHJZmGub7jfHmccog==
X-Received: by 2002:a17:907:96a9:b0:a9a:a88a:466c with SMTP id a640c23a62f3a-a9de632e59emr2259423766b.61.1730499150473;
        Fri, 01 Nov 2024 15:12:30 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9dbc:bd00:c5db:e5ed:512d:1904? (dynamic-2a02-3100-9dbc-bd00-c5db-e5ed-512d-1904.310.pool.telefonica.de. [2a02:3100:9dbc:bd00:c5db:e5ed:512d:1904])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9e56645ecesm236391766b.178.2024.11.01.15.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 15:12:29 -0700 (PDT)
Message-ID: <9052426e-2503-4f5e-aeba-74b78da5f3b1@gmail.com>
Date: Fri, 1 Nov 2024 23:12:29 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 4/4] i2c: core: Remove obsolete members of i2c_adapter and
 i2c_client
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 linux-sound@vger.kernel.org
References: <97970201-24fd-473d-b20a-d21d2cd468f3@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <97970201-24fd-473d-b20a-d21d2cd468f3@gmail.com>
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
index 15397cfaa..32929ca96 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1530,8 +1530,6 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	adap->locked_flags = 0;
 	rt_mutex_init(&adap->bus_lock);
 	rt_mutex_init(&adap->mux_lock);
-	mutex_init(&adap->userspace_clients_lock);
-	INIT_LIST_HEAD(&adap->userspace_clients);
 
 	/* Set default timeout to 1 second if not already set */
 	if (adap->timeout == 0)
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 376136b18..42de42807 100644
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
2.47.0



