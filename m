Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254953DCBFD
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Aug 2021 16:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbhHAOZB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Aug 2021 10:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232000AbhHAOZB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Aug 2021 10:25:01 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93CBEC0613D3
        for <linux-i2c@vger.kernel.org>; Sun,  1 Aug 2021 07:24:53 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id i10-20020a05600c354ab029025a0f317abfso2411350wmq.3
        for <linux-i2c@vger.kernel.org>; Sun, 01 Aug 2021 07:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RtKvxFwfRPKLm7OELVP+Bl55ZgNk4VFlkYGAmJZWKok=;
        b=Nz4q8KOUvjdBeUWmUGzrqM1P/04dJGorbWgdAyFyHY1oavvVTLVhhIQRpJGvbDEmt5
         J0rrRVtclopDvKQpzJdAq9paxRqyZCLv1ID6n4BTark1vKrwGEqGxZ/HzdBLSbD8rIHd
         NxYLAYjiNdCGGjk+1kc2o4DHnw+9Kn/DDDpp4YJskDtsM4UldH6zoN/o4ZpUJKonONEz
         PTTM3BXloOGzmb++iVKVWxDycUaHNubD+yfXOE1O172BT/vKiRmkWUHD2/0W3SAoXGip
         WSCsjIA6jnDjKIyHCz4nSv4tWZEl2NvMKeREaBDaGLt0uccqlg9M+IIXL33vzRj5rASZ
         QGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RtKvxFwfRPKLm7OELVP+Bl55ZgNk4VFlkYGAmJZWKok=;
        b=NzM5qVCS+0AkYrDxShvng7qcCMypYJC2G/WoxgJamPaprpaFMcmzLG1Nqa2qBl976I
         2KPXpuOeRf6AhqXpYQy2r3MBFWY5YUyqDYQ6b0xcwqQlkb0aNcvQ+DystNmigZHXy3m+
         0ZgesNVh4yBPhdc3WTcfb+w4F3uFNPLchedZOkIyPg4F9o1tfOkWk8leKlf9Kx71jYEW
         dD6oalLcEnljG0QM8IGWsZ81p8P3+yE5sOmI91ePIYK1O0RlB6FpouphKQxY3hv1/F51
         7+0kRKuRa9CzqDst9R+LF2YwOnP8nWv8DQSKYEVF7B08V1IqJfiwbCrWTJFb2ynWpOww
         WMwg==
X-Gm-Message-State: AOAM531VdhJ0Asgn8M05662j+Xq6fMmxrluYTEGB7Git9BIy0rG+IT87
        3gvvoalG/EoOLAC2anbqvhKiJkK3j3TS3Q==
X-Google-Smtp-Source: ABdhPJzBqdmgZb3GQXgIuKONOpMCP+IBhZvXBCM0NN9OIOq/IbdCBkLkcGlcgvJ/fkTrFYKL3xX1iw==
X-Received: by 2002:a1c:1f10:: with SMTP id f16mr3106692wmf.140.1627827891987;
        Sun, 01 Aug 2021 07:24:51 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:9d9e:757:f317:c524? (p200300ea8f10c2009d9e0757f317c524.dip0.t-ipconnect.de. [2003:ea:8f10:c200:9d9e:757:f317:c524])
        by smtp.googlemail.com with ESMTPSA id a16sm8312093wrx.7.2021.08.01.07.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Aug 2021 07:24:51 -0700 (PDT)
Subject: [PATCH 07/10] i2c: i801: Improve i801_acpi_probe/remove functions
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
Message-ID: <064c1f0b-9f79-3fb2-cac1-35ef26c33296@gmail.com>
Date:   Sun, 1 Aug 2021 16:21:54 +0200
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

By using ACPI_HANDLE() the handler argument can be retrieved directly.
Both address space handler functions check the handler argument and
return an error if it's NULL. This allows to further simplify the code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 5b9eebc1c..5fa8dc1cb 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1633,31 +1633,22 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
 
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


