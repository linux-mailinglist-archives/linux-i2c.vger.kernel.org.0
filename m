Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D93D43DCC00
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Aug 2021 16:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232017AbhHAOZG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Aug 2021 10:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbhHAOZF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Aug 2021 10:25:05 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2B9C06175F
        for <linux-i2c@vger.kernel.org>; Sun,  1 Aug 2021 07:24:56 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id m19so8872735wms.0
        for <linux-i2c@vger.kernel.org>; Sun, 01 Aug 2021 07:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=90cjossDjZ5wuuJOAgw+reT5hijgPHcGoK4DK6Lx8iM=;
        b=odk/8uaIH8nlsaNDyRPKDoYoK0ZGCVv404rrJDZErfl4BCeFTOffzti5YzI/fFTGok
         Sw5XqYsGLmH9iVTej/inDT4tPAaBE9jvTsh2m0FC4aslEvc8dG+IfPjPEtlxKWi7fcLu
         fVP+idGtAaJH0AhlY50ZNttMfDc7HHkoInZXpMGxj6bMX7sQ+vxP5yuKvLx2dD9bSNvC
         7B+f7rMaiuLNosfYRaVZR5ZfwRO16IjzcEGvopKsOxUi8cOsDQ8sJaRAUGw01iFEIQmY
         PRBWJ4qCr8pNFY/XYEd4uQT12EOtwAx0CtbUeBxilT2fYQgmmUEVq8fp6mi2mBj3uYvc
         mDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=90cjossDjZ5wuuJOAgw+reT5hijgPHcGoK4DK6Lx8iM=;
        b=dne8yQMNil+acyPuVrkBTuad83QCuwffbzWVBdSvVP4CARqcAWyUVuLtrc4YYGuNnX
         z5Wf9+UpMxqCSANkyK2jhDri90IGyleniWol1Su3e//rhNRNBK5i76k9hpXvjJqUvBr6
         eIHgNYQnJsaAjU4Id7+M2XkLmi0nBU24c0w5lKx1nii/kJAI+yYXSb+R2lInkHBlIfPL
         CwOdhyw6k+hXXY/wFAsziPWAN/Hx1qKWUyyCKtNhg6y8jAeWd2qD31KPuWJE2hXxAWRx
         AyRrsTVbggt6r7c0ocZcvGANJXP0caJy0SJaFfHSv6s79E/TFAiJWrFjhIGumgW/eaBT
         r5IA==
X-Gm-Message-State: AOAM5320KnG6sGNE5Rwx7URcxuuqxr7zC9H8SfVKMycF8gndrTBTEK7o
        W84UY0MPqDknlNiAElV3MPbOQIOTexvcnQ==
X-Google-Smtp-Source: ABdhPJxZkkwNt8ICl0wTaAnDwoGVzweu1Ys2dOelKxaJK1ODDVL7u+aade3P9lfIdsuUSBwUksLk3A==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr12607141wmh.69.1627827895069;
        Sun, 01 Aug 2021 07:24:55 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:9d9e:757:f317:c524? (p200300ea8f10c2009d9e0757f317c524.dip0.t-ipconnect.de. [2003:ea:8f10:c200:9d9e:757:f317:c524])
        by smtp.googlemail.com with ESMTPSA id z17sm8327495wrt.47.2021.08.01.07.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Aug 2021 07:24:54 -0700 (PDT)
Subject: [PATCH 10/10] i2c: i801: Improve handling platform data for tco
 device
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
Message-ID: <cf0ba833-8fdb-42ca-3b6f-b305bf28516a@gmail.com>
Date:   Sun, 1 Aug 2021 16:24:30 +0200
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

The platform data structures are used in the respective i801_add_tco
functions only. Therefore we can make the definitions local to these
functions.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 1ca92a1e0..64217479a 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1464,15 +1464,14 @@ static inline unsigned int i801_get_adapter_class(struct i801_priv *priv)
 }
 #endif
 
-static const struct itco_wdt_platform_data spt_tco_platform_data = {
-	.name = "Intel PCH",
-	.version = 4,
-};
-
 static struct platform_device *
 i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
 		 struct resource *tco_res)
 {
+	static const struct itco_wdt_platform_data pldata = {
+		.name = "Intel PCH",
+		.version = 4,
+	};
 	static DEFINE_MUTEX(p2sb_mutex);
 	struct resource *res;
 	unsigned int devfn;
@@ -1516,22 +1515,20 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
 	res->flags = IORESOURCE_MEM;
 
 	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
-					tco_res, 2, &spt_tco_platform_data,
-					sizeof(spt_tco_platform_data));
+					tco_res, 2, &pldata, sizeof(pldata));
 }
 
-static const struct itco_wdt_platform_data cnl_tco_platform_data = {
-	.name = "Intel PCH",
-	.version = 6,
-};
-
 static struct platform_device *
 i801_add_tco_cnl(struct i801_priv *priv, struct pci_dev *pci_dev,
 		 struct resource *tco_res)
 {
-	return platform_device_register_resndata(&pci_dev->dev,
-			"iTCO_wdt", -1, tco_res, 1, &cnl_tco_platform_data,
-			sizeof(cnl_tco_platform_data));
+	static const struct itco_wdt_platform_data pldata = {
+		.name = "Intel PCH",
+		.version = 6,
+	};
+
+	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
+						 tco_res, 1, &pldata, sizeof(pldata));
 }
 
 static void i801_add_tco(struct i801_priv *priv)
-- 
2.32.0


