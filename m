Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91A1138AE02
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 14:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbhETMWh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 08:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232583AbhETMWX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 08:22:23 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B45C061346
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 04:14:50 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id i13so18895851edb.9
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 04:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=pFXnknOD0RGFOB6yJ92A5CXt58Rj1RfZKPdZ2LMaXN0=;
        b=mlg20dVlR3cktAF0cxsHoNsw+MdJwAvbV2Bj5ToDAEcJDdu+mUA4gXN4xZOfCGWb0C
         kMZuFlRcZ8k0InwNFDdmRq7+ax34+4413zNN80D9NRbE1j1rXWx2UkW9v+Q7fmUH2tq9
         m6e9ICZUmtFUw5J3erSZt1btOzJwIJeoJt3t4iEfj4gJZQ81WizRW2OlWEMz4LWTM563
         wzxhr4BT3fKbcadp1sNJX/4Jo22FGByj/WE92nmaNisiFyprlFGGVna64DgcYJZqqa2h
         5tTnlS7R8LcZXoVi/wnuR/klqDlsK2P92cNQYas24EQeboUS5+vjldu6/nxEMTsxG0n4
         ayxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=pFXnknOD0RGFOB6yJ92A5CXt58Rj1RfZKPdZ2LMaXN0=;
        b=ZnKE3fcZHcxDZuDMmF+ndgjfPzWzwQ2WLYJrjvfXQsUDGcLnZOQQP+7VpZ7sHXtvzi
         7CVqTve/Yieg1NlCnmTlUDRfR6Ox72w5kEisQZL0P1glh5tYioboeYQkUZsIWNPPlICH
         f7d+xUxrdbYcqfStifPGSqguYjsK8yEwZDHrOtaGKAjN51FhOLv4PBifexXxAk1zfYOd
         i3H1o1C7Of1Sbt0ffixVIDDFoM2KoJfoQ+cOEH5WYsGNvOaJvpUjpLhcmpT2SdBllzkq
         NTiQmuFH0HLiKgkQlxV5fbITzF2oWcevsiY/0WKDp+O4YmtDqPxANY/9ELHUfBwF84om
         ZtKw==
X-Gm-Message-State: AOAM532koXe8rjeF301e6FDcEYOvN/puri0Z9ZDZWFbcGpajHigqnL96
        wl992Iq5wrX4mipNSO/rgLscfvSFV9Suxw==
X-Google-Smtp-Source: ABdhPJwYLIMs+YQIwOTT5vmbgX9xfrVlC7a0QCVEHUjXr2lWEtLxX1b5tgZT8KTNXXcMWaJG36UDIQ==
X-Received: by 2002:aa7:de8b:: with SMTP id j11mr4406667edv.363.1621509288594;
        Thu, 20 May 2021 04:14:48 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f38:4600:658e:1e64:dd7a:c8e? (p200300ea8f384600658e1e64dd7a0c8e.dip0.t-ipconnect.de. [2003:ea:8f38:4600:658e:1e64:dd7a:c8e])
        by smtp.googlemail.com with ESMTPSA id n13sm1210676ejk.97.2021.05.20.04.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 May 2021 04:14:48 -0700 (PDT)
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: Use pm_runtime_forbid to prevent suspending
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Message-ID: <f42094aa-fc5b-ab1f-26fc-7f6bf2d11a35@gmail.com>
Date:   Thu, 20 May 2021 13:14:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

