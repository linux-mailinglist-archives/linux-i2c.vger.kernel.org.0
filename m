Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F876AACBE
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Mar 2023 22:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjCDViD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Mar 2023 16:38:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjCDViC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Mar 2023 16:38:02 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD3A3903F
        for <linux-i2c@vger.kernel.org>; Sat,  4 Mar 2023 13:38:01 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id g3so23938920eda.1
        for <linux-i2c@vger.kernel.org>; Sat, 04 Mar 2023 13:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hU5NrdF3UUoPMnrdKfubL7fnXLHwpbAzws99DuquZq8=;
        b=NuG6XR1nMI60feDYc2oupuzd7vR2i0YJ/49Z7RdnIDAFhJUjdLoQmrhDcvuhTtjHvl
         sR4zAf6xiJP6rtsD6Ysl/nyfhpwD9hQuGnxeZVnWwKsSXL8UCgU4QMDHAyNPgOPPBm0G
         4byEo+g3yB23vY9z3d1b8W+Dpn5apHT5hz+SXcRXUffSouYlQERV6R68zXe+QahgpC1z
         xZutFl/gEtFrdKkAd077QWL4JcfEKdVvzww1T3catrQbMoQLtnCm9JeUiAfRnUh5mjRj
         2WwEUL5oUyro+KOI3/i3ItxeJyFhr5hXWcmiVHpdZjGIc4HoWRfB71SiSPT+mLBUabM8
         p/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hU5NrdF3UUoPMnrdKfubL7fnXLHwpbAzws99DuquZq8=;
        b=F04o1d7h42M5P4nGWQx8V44KoIWcSuUtNNRGuPn6ZybWEN4PZvI6z9eUoHExjY72r8
         VTxl69k8agyhSRpjBmrPc6nU/OD2UKpgxQo5b7alcEDKntj3Q3GtbIKvL25aca8HLS3f
         3BmmlIVA5iSsW+QO3loCJ0th08xddmXDRVE5jm+KVqr5117H9Ud6fpd7Sxfud5VVqnsx
         4LhxUpbqO5jFtknY0d6IJ2Lp+KOYYaNaVHnfzWL1S5kv2kY7oONCh2pNwb+GDmlmk0Px
         LlS16Qe85FVoiFdEi9LvFrhP22ZbxD+EvqPF032PbcL+0J+MJmMt5LlENZ7IMMOtkkK7
         BDQg==
X-Gm-Message-State: AO0yUKXf9DmKJcytIomC6r5vdvyKqLfNVgTBjFKdgyABPqYIzGsoM4ej
        lwr7TfUsjlLC6EFcufQisw/d2EhzT5o=
X-Google-Smtp-Source: AK7set+/dNrOOPcUDkT7g6XJe2IWBZxTIS1xE4qz7zoMv3bNBt/I9CBrfeBAVbXV3fMei8FmoeVRFw==
X-Received: by 2002:a17:907:6eab:b0:7c0:efb9:bc0e with SMTP id sh43-20020a1709076eab00b007c0efb9bc0emr7881516ejc.62.1677965879742;
        Sat, 04 Mar 2023 13:37:59 -0800 (PST)
Received: from ?IPV6:2a01:c22:72de:8e00:a559:93c8:8a72:3308? (dynamic-2a01-0c22-72de-8e00-a559-93c8-8a72-3308.c22.pool.telefonica.de. [2a01:c22:72de:8e00:a559:93c8:8a72:3308])
        by smtp.googlemail.com with ESMTPSA id si7-20020a170906cec700b008e68d2c11d8sm2447601ejb.218.2023.03.04.13.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 13:37:58 -0800 (PST)
Message-ID: <1de49847-bb13-38b1-2820-15a7aa0fcb9a@gmail.com>
Date:   Sat, 4 Mar 2023 22:37:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 4/4] i2c: i801: Switch to new macro DEFINE_SIMPLE_DEV_PM_OPS
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
In-Reply-To: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

By using the newer macro DEFINE_SIMPLE_DEV_PM_OPS we can get rid
of the conditional compiling.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index e1350a8cc..bd2349768 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1800,7 +1800,6 @@ static void i801_shutdown(struct pci_dev *dev)
 	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int i801_suspend(struct device *dev)
 {
 	struct i801_priv *priv = dev_get_drvdata(dev);
@@ -1821,9 +1820,8 @@ static int i801_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(i801_pm_ops, i801_suspend, i801_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(i801_pm_ops, i801_suspend, i801_resume);
 
 static struct pci_driver i801_driver = {
 	.name		= DRV_NAME,
@@ -1832,7 +1830,7 @@ static struct pci_driver i801_driver = {
 	.remove		= i801_remove,
 	.shutdown	= i801_shutdown,
 	.driver		= {
-		.pm	= &i801_pm_ops,
+		.pm	= pm_sleep_ptr(&i801_pm_ops),
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
-- 
2.39.2


