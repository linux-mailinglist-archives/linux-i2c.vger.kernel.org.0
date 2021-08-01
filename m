Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 807C03DCBFA
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Aug 2021 16:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbhHAOZA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Aug 2021 10:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbhHAOY7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Aug 2021 10:24:59 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91DB7C06175F
        for <linux-i2c@vger.kernel.org>; Sun,  1 Aug 2021 07:24:51 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id l34-20020a05600c1d22b02902573c214807so6719332wms.2
        for <linux-i2c@vger.kernel.org>; Sun, 01 Aug 2021 07:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=THrbrie+Vh0KKkuFl0McSHXgJQC8/w5Pw5ZKEogEChI=;
        b=uzIh3+GxNBwfFMa3vVWWKSG3IxyJFCgXWDnfwm7lwW88dz1z4VuJHPGYi2MF0nu6k+
         XiHMeyOfk8dFZUE9xT3/IM5uRbbzGvX9nBG1xWmKuR07yJGHIL6EF63BJcBbisZSovfq
         1yBGiN0dA+inhq/rlgcxmSpGPpASkmNXO+vq/hqTSUAoXuGALswLwF1Qo5HO4X+19ySN
         tcVfyza5R7kcFzpKfdCwhECzblhXhGbR+sQB7xuW4mSsL8D3sbMVijHUR1/EPLTdgU/H
         inJiXkimfJH93MlqVW1DE1NkyPGMKUKzmmnBxxADGukQzKzS6FJM5hGA2bBkqx413fOJ
         o3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=THrbrie+Vh0KKkuFl0McSHXgJQC8/w5Pw5ZKEogEChI=;
        b=gJnkFoKQrpfpXIpThxmAHy9hC0uP4JwjpGaAFjlwD18cuvR9NVA85iivxKxOh7BxnC
         7FJvsjz1ptovEqrLD+fYykk0Epf8Jp7TZ41m5TzlRNlbJSZdW4F8oRxPQ5QEMRv+nun5
         7JwRhsMI6DLfMZZZQvGu3Rf3q8vtpUWRP6JGLSzUSbSEa/fiPmKqJ2vuPc3RU9ku2QJF
         05EWrO4+KH8OHZiwtTHwX90HsSoyLWrdP839zCuVltnGezxrwN/ka7/H6XCGI+seI0oS
         J8gkiTdbVgEJ2zR9Rj5j4dogArU4IRUOqPOatXIjEdiCy8da0Qijfqw2cB5fF87b58g/
         bjFA==
X-Gm-Message-State: AOAM533lCFiwrsRuAQ50HvpJfUp1XDvfAHb4YsHJyUh11I38QYg06yNX
        P+b4REaQnx3eQG2+9eIF/ZLTST75GqCPeQ==
X-Google-Smtp-Source: ABdhPJwUai6IY/DbjwJ6GdV+UjgmPZepbaqtFsJjd8KmVd9nXrasUYuHL+2Huc0BdsPyotUp5fnPFg==
X-Received: by 2002:a7b:c749:: with SMTP id w9mr12422390wmk.98.1627827889914;
        Sun, 01 Aug 2021 07:24:49 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:9d9e:757:f317:c524? (p200300ea8f10c2009d9e0757f317c524.dip0.t-ipconnect.de. [2003:ea:8f10:c200:9d9e:757:f317:c524])
        by smtp.googlemail.com with ESMTPSA id d67sm8944562wmd.9.2021.08.01.07.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Aug 2021 07:24:49 -0700 (PDT)
Subject: [PATCH 05/10] i2c: i801: Improve is_dell_system_with_lis3lv02d
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
Message-ID: <f2477399-62df-0036-7d35-4e8634afad9c@gmail.com>
Date:   Sun, 1 Aug 2021 16:20:19 +0200
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

Replace the ugly cast of the return_value pointer with proper usage.
In addition use dmi_match() instead of open-coding it.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index d971ee20c..a6287c520 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1191,7 +1191,7 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
 
 	kfree(info);
 
-	*((bool *)return_value) = true;
+	*return_value = obj_handle;
 	return AE_CTRL_TERMINATE;
 
 smo88xx_not_found:
@@ -1201,13 +1201,10 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
 
 static bool is_dell_system_with_lis3lv02d(void)
 {
-	bool found;
-	const char *vendor;
+	acpi_handle found = NULL;
 
-	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
-	if (!vendor || strcmp(vendor, "Dell Inc."))
+	if (!dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
 		return false;
-
 	/*
 	 * Check that ACPI device SMO88xx is present and is functioning.
 	 * Function acpi_get_devices() already filters all ACPI devices
@@ -1216,9 +1213,7 @@ static bool is_dell_system_with_lis3lv02d(void)
 	 * accelerometer but unfortunately ACPI does not provide any other
 	 * information (like I2C address).
 	 */
-	found = false;
-	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
-			 (void **)&found);
+	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL, &found);
 
 	return found;
 }
-- 
2.32.0


