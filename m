Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 340293DCBF8
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Aug 2021 16:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbhHAOY4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Aug 2021 10:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbhHAOY4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Aug 2021 10:24:56 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C6AAC0613D3
        for <linux-i2c@vger.kernel.org>; Sun,  1 Aug 2021 07:24:48 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id k38-20020a05600c1ca6b029025af5e0f38bso1025272wms.5
        for <linux-i2c@vger.kernel.org>; Sun, 01 Aug 2021 07:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4hyQpbhVreYQOXuDjel6lrvdmJq+W33gRDJVao2TEfw=;
        b=n1p2GWIK14gxq9Eb0RoDKKugajxgaJvP4AK+D59RNC+i/zM02HD5TXtRLgnHiKcPoA
         VGiS574d5HfJOrYHJR5g/c9nOSx+9dRD/quPYveccZNPOB4h2Sy/bG8Gu8XnIpkEY1u7
         KcLwJYQzPC8tZXfI7zfAYZ5Liz1Kny34v2yp62aAicHZkPheKGVQ3Cy9Ngri77DgXVBc
         ueL1V7X+u3gPoRNEA2Z//dsVloXPVqnqmBpTSF/C1AukfFcJQ7ZRyiWlYo7nNs+IjLC6
         G7ft3YshYkWAmo1eOVYnTDIrT7vG9VmAbLiKJZdfeahsG1r8ZVpo2KuMsY/86eJxHHfe
         /qVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4hyQpbhVreYQOXuDjel6lrvdmJq+W33gRDJVao2TEfw=;
        b=WK7pBxeouaXDab7C1zHdI/+55JmXRrZW0nSnMqSkbV2ihBPrYx9Awj63Mb4D+jSm9B
         hIdmnOz5kep8wKrdWCT/WEecg5npLzraNjuBDtPutTdnI9xkkMxALfMkYaYND2zSLQQN
         444xGr6Ge3k12HmnsNn1PR97emhn7HLNdTm9nzgqh02nhNmbKSWsGYkc2s9sTVEJaZnH
         XTeo1KLjuVH4RhuH5Fl3aOuFiRyPTxCUBsd8Nx1s4t6hDO7+qK/Ce9HNqEsJfT64s+NZ
         mY+kWVlYP4p6zw0a9EtS//SxSHr01AD07rQhScrDBxSyfooekB1/owhDmdNGDiKqySEM
         3tgw==
X-Gm-Message-State: AOAM532FPBr+pDEjrGfJPi4goqZWy1Fd0+vZ7uRYp3tIHREXTc23PLBD
        XHwmtIsdAqvZJzLzC0W9vlF7U3W+msKe1g==
X-Google-Smtp-Source: ABdhPJxKeSOSbelpieZgYrwX9lsIcqFQe2B4ohpQuSGum222+T27UH9/6QzZGfOsUstD+ob55A39uA==
X-Received: by 2002:a1c:188:: with SMTP id 130mr12846275wmb.122.1627827886912;
        Sun, 01 Aug 2021 07:24:46 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:9d9e:757:f317:c524? (p200300ea8f10c2009d9e0757f317c524.dip0.t-ipconnect.de. [2003:ea:8f10:c200:9d9e:757:f317:c524])
        by smtp.googlemail.com with ESMTPSA id t1sm7395138wma.28.2021.08.01.07.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Aug 2021 07:24:46 -0700 (PDT)
Subject: [PATCH 02/10] i2c: i801: Improve disabling runtime pm
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
Message-ID: <4390254d-fe68-2c7f-c67b-a894cdddd7ae@gmail.com>
Date:   Sun, 1 Aug 2021 16:17:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Setting the autosuspend delay to a negative value disables runtime pm in
a little bit smarter way, because we need no cleanup when removing the
driver. Note that this is safe when reloading the driver, because the
call to pm_runtime_set_autosuspend_delay() in probe() will reverse the
effect. See update_autosuspend() for details.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 362e74761..bdb619bc0 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1628,7 +1628,7 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
 		 * BIOS is accessing the host controller so prevent it from
 		 * suspending automatically from now on.
 		 */
-		pm_runtime_get_sync(&pdev->dev);
+		pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
 	}
 
 	if ((function & ACPI_IO_MASK) == ACPI_READ)
@@ -1668,11 +1668,6 @@ static void i801_acpi_remove(struct i801_priv *priv)
 
 	acpi_remove_address_space_handler(adev->handle,
 		ACPI_ADR_SPACE_SYSTEM_IO, i801_acpi_io_handler);
-
-	mutex_lock(&priv->acpi_lock);
-	if (priv->acpi_reserved)
-		pm_runtime_put(&priv->pci_dev->dev);
-	mutex_unlock(&priv->acpi_lock);
 }
 #else
 static inline int i801_acpi_probe(struct i801_priv *priv) { return 0; }
-- 
2.32.0


