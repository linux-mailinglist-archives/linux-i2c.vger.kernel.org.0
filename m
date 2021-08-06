Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE0563E30E0
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 23:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237975AbhHFVTh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 17:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238155AbhHFVTg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 17:19:36 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B8B7C0613CF
        for <linux-i2c@vger.kernel.org>; Fri,  6 Aug 2021 14:19:20 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id b11so12695676wrx.6
        for <linux-i2c@vger.kernel.org>; Fri, 06 Aug 2021 14:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AQvMtFq8Po6vh52QjvN0sEfHzpusUaBiZ8gx3Z9m+QI=;
        b=uBy6XGm0S3KgJpQ0tv+Po7W0GcBYp59FysOH/a/2RciBK4HObvq25KHUrWZYe3t7Ci
         OF7KISbzxmXU3yxtxh2SUe/b8OGdfSDKraxQi+H61/uQouaPJjY0JpNRx/LUJjyKRUC1
         +zC+5rtVkjye43nA7dr2ZyKBs6jrX87DUSMppNYKx+5V4FOult2aWx3i1qcfEqhTOx3F
         Clc2tzhrOjYung8SEVCVt0s6At5CaQuE65JSXFO69qIgYIhRyYQcIYfHxJ0/Xs44n8X0
         USEtIIh29mmXKCkci/s9G1YchXD/nEv2AGEPkORFx53roRKFOdNldk1kxvUEpaJyjcaw
         igZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AQvMtFq8Po6vh52QjvN0sEfHzpusUaBiZ8gx3Z9m+QI=;
        b=Pkc+mEJWTcy/kvMZyV/6hVTTYSauxMdWawJf3nCS4Hh6fTVoK0i4Tcwam9+knCrJ9H
         xfbgV2xrtTbJb5Jkwugjf8+VvSLcCZobKNblINpjrliTekQNZSsRkXCckiPqg0eYYI9n
         oPopmEpihSto4hQxue702yBJ4QKg913dwM+TL+9w1QdUxrUJGl62A7F3IoZnyt+PvpU2
         tLT3hKjNZtdGropwuxxZkuL4YpwZQ8jURAM+t38tx3i0PvHJ47ISaGsTJT5cfdaj21VU
         HQlDWRC88DsRccKu7IS7zHiYxd5smg9qds1LnDZzqFaYCNYhumK4NrGpmgDseRvo0d/s
         O8nw==
X-Gm-Message-State: AOAM5338ej6aqRYtUsVFWuMlrwozUEb9++33nIOeH1vJHraw8vMZvaE3
        EvNhfgEZ0hQF1qWnVzMsArj4aqdj0MYSmg==
X-Google-Smtp-Source: ABdhPJx6WnhNaBO2R8vBPw2+3XprPd963gT4IFrNbj23PruGwhdPwzupToOA2zsF2B22m0FChodTQA==
X-Received: by 2002:adf:e0c4:: with SMTP id m4mr12719217wri.312.1628284758834;
        Fri, 06 Aug 2021 14:19:18 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:cc6d:4891:c067:bf7b? (p200300ea8f10c200cc6d4891c067bf7b.dip0.t-ipconnect.de. [2003:ea:8f10:c200:cc6d:4891:c067:bf7b])
        by smtp.googlemail.com with ESMTPSA id m9sm10462487wrz.75.2021.08.06.14.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 14:19:18 -0700 (PDT)
Subject: [PATCH v2 6/9] i2c: i801: Improve i801_acpi_probe/remove functions
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
Message-ID: <a9a630af-e979-72df-d254-568878dc7ee6@gmail.com>
Date:   Fri, 6 Aug 2021 23:16:33 +0200
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

By using ACPI_HANDLE() the handler argument can be retrieved directly.
Both address space handler functions check the handler argument and
return an error if it's NULL. This allows to further simplify the code.

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 7fa06b85f..bd1db0f0a 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1635,31 +1635,22 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
 
 static int i801_acpi_probe(struct i801_priv *priv)
 {
-	struct acpi_device *adev;
+	acpi_handle ah = ACPI_HANDLE(&priv->pci_dev->dev);
 	acpi_status status;
 
-	adev = ACPI_COMPANION(&priv->pci_dev->dev);
-	if (adev) {
-		status = acpi_install_address_space_handler(adev->handle,
-				ACPI_ADR_SPACE_SYSTEM_IO, i801_acpi_io_handler,
-				NULL, priv);
-		if (ACPI_SUCCESS(status))
-			return 0;
-	}
+	status = acpi_install_address_space_handler(ah, ACPI_ADR_SPACE_SYSTEM_IO,
+						    i801_acpi_io_handler, NULL, priv);
+	if (ACPI_SUCCESS(status))
+		return 0;
 
 	return acpi_check_resource_conflict(&priv->pci_dev->resource[SMBBAR]);
 }
 
 static void i801_acpi_remove(struct i801_priv *priv)
 {
-	struct acpi_device *adev;
-
-	adev = ACPI_COMPANION(&priv->pci_dev->dev);
-	if (!adev)
-		return;
+	acpi_handle ah = ACPI_HANDLE(&priv->pci_dev->dev);
 
-	acpi_remove_address_space_handler(adev->handle,
-		ACPI_ADR_SPACE_SYSTEM_IO, i801_acpi_io_handler);
+	acpi_remove_address_space_handler(ah, ACPI_ADR_SPACE_SYSTEM_IO, i801_acpi_io_handler);
 }
 #else
 static inline int i801_acpi_probe(struct i801_priv *priv) { return 0; }
-- 
2.32.0


