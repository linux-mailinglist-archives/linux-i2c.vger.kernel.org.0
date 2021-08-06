Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49BCC3E30DE
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 23:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237662AbhHFVTb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 17:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237975AbhHFVTb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 17:19:31 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E118BC0613CF
        for <linux-i2c@vger.kernel.org>; Fri,  6 Aug 2021 14:19:13 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id f9-20020a05600c1549b029025b0f5d8c6cso9847659wmg.4
        for <linux-i2c@vger.kernel.org>; Fri, 06 Aug 2021 14:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HvM3lPG2xI8313rRdu83d9EPpxbMXrPiuZRB9e1Nt8U=;
        b=UDWCLeuIOjALS6BJG9A3LVfVYE2SA2T7aBTFbT52QEUp2F2CEKKkkOUAAjOem5B2OM
         0qP3rrVqJqGAvaEOs20Af+pq040+YMRva7w0yDMN/TZhjwAj50rvPwWd6/LjvV0WFW+D
         Xn/JhZWEh0zuzZ7ygraVeOM8DVjLJGwbGjJyA4aqtNeFUmeHr5AgRWlpU/VrsvEoe4B4
         9gTMU8uw4qV2KQUNgJiahhMO4zSejdRq9BAH3SYSQwj1I/KZKl+lhf2f9RpzdAV+4DYv
         PjxaLvVnkIY4D2Lfq8L1eY/0G0aSjU2wH33GXH3MWAaCXsYm/Dvbq9yeNX5EQj+WigD7
         1WLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HvM3lPG2xI8313rRdu83d9EPpxbMXrPiuZRB9e1Nt8U=;
        b=f+/Im6E3CKbq7OuxasPd8nVzaHwo1ALtKvZy7c0iz2+I/oYwDpJG8+WTq1WArETptM
         lwk1YtnUk17ENt+yIQcDXyaEXQSzCvTftVTiEoin4xYEQcXEmrOjQdFQuLi1RCZ9NX/j
         qFuWcqNg/TEtS+kCb5J4HD+e1TGY+415UPMqX/79ZXtd3rAyM6vRknFyEiwItqOh4qak
         BdkEU0DhSSQGPV/RI1CYBReX40wquiWOrZDLUWlG7gJq/hx15CieyCB8G6gZXiFUJrFU
         BGr7m3u+w6wKTRO2N8pnP0ZHf/ihzkhjl2AvX2hCcsAx34t1ibDFHX8C0pvSFiZHvTbW
         YRfA==
X-Gm-Message-State: AOAM530fsYwFnvYjBydRji9XfYzLLtuS9yG9BKr7oA6ENNt0LQfmTAmU
        3P2GC2QuvZBjCBpNto1OuXhswWYrUk97aQ==
X-Google-Smtp-Source: ABdhPJyEYAXD/uxVOZH8GTXl4cTDLw2y+HmfA7wI/RKkHndsNN82KI49o3f/gDS9m5BIwSvD19MUZQ==
X-Received: by 2002:a7b:c254:: with SMTP id b20mr22462388wmj.189.1628284752370;
        Fri, 06 Aug 2021 14:19:12 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:cc6d:4891:c067:bf7b? (p200300ea8f10c200cc6d4891c067bf7b.dip0.t-ipconnect.de. [2003:ea:8f10:c200:cc6d:4891:c067:bf7b])
        by smtp.googlemail.com with ESMTPSA id b20sm10609529wmj.48.2021.08.06.14.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 14:19:12 -0700 (PDT)
Subject: [PATCH v2 4/9] i2c: i801: Improve is_dell_system_with_lis3lv02d
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
Message-ID: <effeb0c0-36cb-afc4-4d9a-7ef348c928ae@gmail.com>
Date:   Fri, 6 Aug 2021 23:15:15 +0200
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

Replace the ugly cast of the return_value pointer with proper usage.
In addition use dmi_match() instead of open-coding it.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
  - avoid assigning potentially dangling pointer to *return_value
---
 drivers/i2c/busses/i2c-i801.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 89ae78ef1..f56060fcf 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1192,7 +1192,7 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
 
 	kfree(info);
 
-	*((bool *)return_value) = true;
+	*return_value = NULL;
 	return AE_CTRL_TERMINATE;
 
 smo88xx_not_found:
@@ -1202,11 +1202,9 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
 
 static bool is_dell_system_with_lis3lv02d(void)
 {
-	bool found;
-	const char *vendor;
+	void *err = ERR_PTR(-ENOENT);
 
-	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
-	if (!vendor || strcmp(vendor, "Dell Inc."))
+	if (!dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
 		return false;
 
 	/*
@@ -1217,11 +1215,9 @@ static bool is_dell_system_with_lis3lv02d(void)
 	 * accelerometer but unfortunately ACPI does not provide any other
 	 * information (like I2C address).
 	 */
-	found = false;
-	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
-			 (void **)&found);
+	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL, &err);
 
-	return found;
+	return !IS_ERR(err);
 }
 
 /*
-- 
2.32.0


