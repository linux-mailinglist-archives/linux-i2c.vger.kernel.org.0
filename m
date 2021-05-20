Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 671E738AE00
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 14:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232085AbhETMVh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 08:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231657AbhETMVX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 08:21:23 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82341C043243
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 04:14:09 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id t15so18904391edr.11
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 04:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=pFXnknOD0RGFOB6yJ92A5CXt58Rj1RfZKPdZ2LMaXN0=;
        b=b48C2unzFdTZjg2u+/oShGI+ijQyS2BBBgIGMghchUWcdkEKjC0S9IN6y5aDydhe2o
         D8lBZrP1P55V72whE5mqFQtTMBLtH2+NJ4jW1xRF4VICkHJg8/1wOrvOBZMj0glIbqNX
         /mKbvsUmxz/7+DceGf+X0oDcCdYCJjM9VPxqzE/QTZajjAi1Xz/IFfjN+ps1wCmXvZ+8
         p5U3w9Bx/YBKteUrM7iFkWbxPbnx0DtXrlD2AT2W6QX/M1WEjcme9gxlA2s0+Xf2hfmW
         U8bgt9s/cogvueadE/EZTUBT2KxvXRa2D2XFKTuijXXSFELjNfg2bXknIVCy54SDnFY2
         g1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=pFXnknOD0RGFOB6yJ92A5CXt58Rj1RfZKPdZ2LMaXN0=;
        b=FF/j2qSFbIEx6vjuh3LBfYFLySOYrb2CAM/Zb8GhH2sdF9lBHsc5G395IiMpwtAOPM
         OcWRDhYaD69SxH6eV6mEQef+Qvx/YPkfNT/G7H9ajhDgu/AzFc2NVasZqPKyEjGHbZ5/
         0gogVhrEx54iaAwEKGybFDtsvFnO71okq9Eraz+BqmcttW7YGoT2F6NOAxemQ2/mkIot
         XnNO7dn30iRTJvY48aQE9Akh7LKo7+JjTBfvoAeXIN93tCqT2kwq6zSnmNAgAHKPeNZj
         r6liEBmdXh/F0ezdYchJ8lNUeZ2s40c0Y/Ahe5vvizp8Sj2/L3TCCFOrbbrVfqWFxwEK
         7wHg==
X-Gm-Message-State: AOAM533kKdAbWDQ4a1HlONvijrSMcdNn3Ab2TLkZU20208S5ypnlRwGm
        g27PISvZH78XFtYqqLT3LBqEX9cBV67d6Q==
X-Google-Smtp-Source: ABdhPJx5EG1cKXovwohENhKvgdOsndpFO9oPRUzjDj3mI2eFMaonAr/PLpYHLz0E/j8U+koZDGefKg==
X-Received: by 2002:a05:6402:7d7:: with SMTP id u23mr4454771edy.196.1621509247672;
        Thu, 20 May 2021 04:14:07 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f38:4600:658e:1e64:dd7a:c8e? (p200300ea8f384600658e1e64dd7a0c8e.dip0.t-ipconnect.de. [2003:ea:8f38:4600:658e:1e64:dd7a:c8e])
        by smtp.googlemail.com with ESMTPSA id i5sm1209499ejv.120.2021.05.20.04.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 May 2021 04:14:07 -0700 (PDT)
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: i2c: i801: Use pm_runtime_forbid to prevent suspending
Message-ID: <75b4f1e6-5cf3-3b1c-5845-a24f20f2024e@gmail.com>
Date:   Thu, 20 May 2021 13:14:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Using pm_runtime_get_sync() here is not the best approach.
pm_runtime_forbid() is better suited and it doesn't require
cleanup activities in the remove callback.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 6b17afb7b..4e8dc2b0d 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1664,7 +1664,7 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
 		 * BIOS is accessing the host controller so prevent it from
 		 * suspending automatically from now on.
 		 */
-		pm_runtime_get_sync(&pdev->dev);
+		pm_runtime_forbid(&pdev->dev);
 	}
 
 	if ((function & ACPI_IO_MASK) == ACPI_READ)
@@ -1704,11 +1704,6 @@ static void i801_acpi_remove(struct i801_priv *priv)
 
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
2.31.1

