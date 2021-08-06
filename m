Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 984CB3E30DB
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 23:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235230AbhHFVTW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 17:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232112AbhHFVTV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 17:19:21 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ECCAC0613CF
        for <linux-i2c@vger.kernel.org>; Fri,  6 Aug 2021 14:19:04 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id n12so2614926wrr.2
        for <linux-i2c@vger.kernel.org>; Fri, 06 Aug 2021 14:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0vx1rbwI4jycEuzrfX1hnyKkN3xU8wSDFJs4mv677YQ=;
        b=bLV8Is6GLIU07Ix1u2hXmAChh9fdSGDkAtZaPF6NabfIe3hx4KI8AZCZyFWGosnnp1
         NvPQ/g+hhiXXmch7QlkLhCzQPy11mQH/5siicDPRPL9qdZJhBboOIo5U5RSsPgFyHHBY
         8OctqLllLhiLcJqjbGqfHvOfJK/WXZk8nALl4MzVlrKj5vWScDJlIVh+baLzvZ8N8SYb
         gGsAjnysaopoQr/IZAuaa0CguAy30gaFv932rlYNtcWCBMK/lGy6PPeKo4GnDSIqlO/a
         ou9zjFnnZqjqKrcX9NgT1u5zVdkydfyw7xBv8wtI7rwir6c7hMl7qTgacK7zTA2LIXdl
         o3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0vx1rbwI4jycEuzrfX1hnyKkN3xU8wSDFJs4mv677YQ=;
        b=m5eDNUMdcDLiIEmfWK7oeIN71FWAOCLQCMGZUU0ImH5UHxntYQPFMua86VfelcmO+z
         vVMErdXCUWz/Zq9x9RRGVp+74fTXKDpeiSTW2SqXtCC9JqRxme0wOhk/4naZBXh76cAq
         Q6qYxqDGsBK9YOgiuRDWrWrCjm6Tne4XQJZbyQG9v29aeKfmuUXK7460/mlN2UlsnzVN
         zd3cdN5mInQvOgWfw7gV4MTWUup2ABoqpHS+2zqjwoEO6D4lB/+501Qo2xMP0g957qqx
         hNbXGAo0pRC4WML15MZ6EH4DHRjpPjvRattp6AHQVrJ5z6yTp/Q+tXbGNgYHwtCHYuCS
         nXsg==
X-Gm-Message-State: AOAM530sUSJWldyQw83RN8CYbEUto4KAO5ngIOgNHATKIkcNLXi6Ou95
        +JRKJLCEsZEeB5SZIrVu2Q++C4LikwpeDw==
X-Google-Smtp-Source: ABdhPJyOvNGqufnYa0r+AUlxSNj6im7axBRbgV5sP+g7VWzUt5tvW1cRipSwgxs8BIk7m9EnBsylUA==
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr13076077wrq.204.1628284742839;
        Fri, 06 Aug 2021 14:19:02 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:cc6d:4891:c067:bf7b? (p200300ea8f10c200cc6d4891c067bf7b.dip0.t-ipconnect.de. [2003:ea:8f10:c200:cc6d:4891:c067:bf7b])
        by smtp.googlemail.com with ESMTPSA id c12sm11233013wrm.29.2021.08.06.14.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 14:19:02 -0700 (PDT)
Subject: [PATCH v2 1/9] i2c: i801: Improve disabling runtime pm
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
Message-ID: <10690555-2317-4916-70b8-870708858f9b@gmail.com>
Date:   Fri, 6 Aug 2021 23:12:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
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

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 92ec291c0..ef6dbb531 100644
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

