Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3DC07A0F89
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 23:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjINVIw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Sep 2023 17:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjINVIu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Sep 2023 17:08:50 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 319C426B2
        for <linux-i2c@vger.kernel.org>; Thu, 14 Sep 2023 14:08:46 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-401b393ddd2so16281025e9.0
        for <linux-i2c@vger.kernel.org>; Thu, 14 Sep 2023 14:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694725724; x=1695330524; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9ss+fb09l2Kl0nlzGdXaOsfDCeuRRwRUHfudVGDDlk=;
        b=KLeZkv7S5q2iW5Jmd1Mj3D5DAVa1QyRcofOFigCqNZURUtniAREqaoSvJvxEaHh+Gd
         aNBPtL8P330tISyB8IwRaC6PzBePuWJR3KCf6djSL8wRXExdpca6XK5/0lfPbdb/5NXu
         tbDgujJfI9+As1cM/nDVGmU04umxxDGHifUmdyRxNEs8GcM1b4guwudHn9H63r0Iqtz4
         TnPjTcL+1Zq8JtVx0+O2aUmvGcmwJBrsmnvtd4e72LLMHPFtjKjS7BrTgIhUGlXLSUjf
         KgL4dLk13EH35b+xODyX3APDuljXQY1K779GfxGiqfPCfuggjpoM59cvVhemxWcenqFp
         +lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694725724; x=1695330524;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z9ss+fb09l2Kl0nlzGdXaOsfDCeuRRwRUHfudVGDDlk=;
        b=AGoO629974ZuH7w7VkpTqur0KY6QyOswWnWzenc+0qOWvbGd3JmAp9qOz5M/omzH6W
         JALL+0C/CRZSrGGjsGoxrUC8WbZN64M9cxmuzPpJVT/LIH2HWyGMs3g5C2vgg6RsYuPK
         NRy8cJ8txK6dDiwAECD5Co2AnGfp16EsHwlsfQE0PNZE+vUjwaG+g8JhYI8ICz9hFVkL
         3BWB/TI+lp8gVu0wYfFELTba1eKJ8lZcoK776S9CNqmkeUsL4G0i30K9Fgz9jtX140Gq
         arDawh6s2DULrZSYkMf/Syccuw60pwBulAxRDPPinn1CM58L+UV2m7XQ+0IY4uRC0DJO
         F/6w==
X-Gm-Message-State: AOJu0YzaJRIYung+et851EjgcD+HoHld95DYSeD1kL+FyULVDGbevSDV
        7QKHHwQtt2WwJymh3zayExg=
X-Google-Smtp-Source: AGHT+IETCUsYThZtIg2/5XjvbJBRBKCH7c0CzDiPhk0pbjeKwg4qXtQLZxD8ROPG8FV2iLou1z4TYw==
X-Received: by 2002:a5d:4530:0:b0:31f:e32f:a503 with SMTP id j16-20020a5d4530000000b0031fe32fa503mr1013994wra.20.1694725724280;
        Thu, 14 Sep 2023 14:08:44 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b8fb:f000:c88d:b899:9013:9bfe? (dynamic-2a01-0c23-b8fb-f000-c88d-b899-9013-9bfe.c23.pool.telefonica.de. [2a01:c23:b8fb:f000:c88d:b899:9013:9bfe])
        by smtp.googlemail.com with ESMTPSA id a4-20020a5d5704000000b0031fc9402b47sm2717481wrv.4.2023.09.14.14.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 14:08:43 -0700 (PDT)
Message-ID: <458b1c8b-1885-6583-f45d-7548ce65bb33@gmail.com>
Date:   Thu, 14 Sep 2023 23:08:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Matt Fleming <matt.fleming@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Lee Jones <lee.jones@linaro.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: unregister tco_pdev in i801_probe() error path
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We have to unregister tco_pdev also if i2c_add_adapter() fails.

Fixes: 9424693035a5 ("i2c: i801: Create iTCO device on newer Intel PCHs")
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index f53be242f..9bd712eaf 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1753,6 +1753,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		"SMBus I801 adapter at %04lx", priv->smba);
 	err = i2c_add_adapter(&priv->adapter);
 	if (err) {
+		platform_device_unregister(priv->tco_pdev);
 		i801_acpi_remove(priv);
 		return err;
 	}
-- 
2.42.0
