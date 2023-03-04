Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70F776AACBC
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Mar 2023 22:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjCDVh7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Mar 2023 16:37:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjCDVh6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Mar 2023 16:37:58 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5FF4C03
        for <linux-i2c@vger.kernel.org>; Sat,  4 Mar 2023 13:37:57 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id da10so23926804edb.3
        for <linux-i2c@vger.kernel.org>; Sat, 04 Mar 2023 13:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qRPpO6yXh0IkTHQKpLrAy/xC5GnYFGhT+3l0PShNvPg=;
        b=evRA0dswDSpbMSuBclCytREeaKtS8xQ1HNpBg8WUwXxpfFq+KnAVpr9Axs3YD5tK6d
         sUi0hEYCK3lVCKt0P4oEI6xZ73/gQgJLlrcUaCKgQV8ukXAWSzwO+gXsVtveQDkfZm+r
         2d5p41n+yQKqKHgA4O8VaS0KduLnOX8LVueQeG10nlUORqT23q6TnFJWLAFkZSNcBMnf
         0c7TqeKcrvAYqtYYh3mUXOdN3cDxdnVFhLkdfswpftrXllVWWDE09jAg8bXY/0Fo4Te6
         gg5O97QpJ64JoEZu6o+M7coOedt7C54bQAG1YJVmNHCXEUcU26vJLkF0d8eaD4BTHagm
         /fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qRPpO6yXh0IkTHQKpLrAy/xC5GnYFGhT+3l0PShNvPg=;
        b=T2TV19/foN0627GaeCJcF9VTCkELf8Ofqaqkjn+L1ncTvKAN6FC0iMkV89IgAsOBRx
         KZXdtEy2MHa5QZ6CYcEZ9PRVgSgnjQQJwyZejTe+fhKrL3qCd8J4gg02RRhajM2WKQ1R
         tdisLuWBlzO3xNTJ8TWJskJjo9xRhfaWPi+buckuqMn8o6xYqft9dGE0BeVLe1BzH4ry
         s/xWdf8MyN6fDP04I5hx6ofVxnjKhs1iPK1DWcvZGvF+ZOVG2BEjnZULI9r5jaG5Ip9g
         y8W1FbXZVTPMJIXlhXZYq9hnyBcjvMjN53g9wXexUPRj+q8OFW7TOSr9vKLQgPSZ8QdC
         LK9g==
X-Gm-Message-State: AO0yUKVv1JIliyDTlZpUC/BN7s4EN8qnw+FKuLoCzrfRV6lkgke0XR6R
        Hwhqqko2W+KA5uLh6PtOCg8poMzEARU=
X-Google-Smtp-Source: AK7set8ejFhXntBAc6Q5gYnRz3fP+t+3480/8T5IrwqocTjtxYbXMmC/PC+DM//8Rtw1uJGS/gosrw==
X-Received: by 2002:a17:906:498e:b0:909:4a93:d9d2 with SMTP id p14-20020a170906498e00b009094a93d9d2mr6013211eju.2.1677965875643;
        Sat, 04 Mar 2023 13:37:55 -0800 (PST)
Received: from ?IPV6:2a01:c22:72de:8e00:a559:93c8:8a72:3308? (dynamic-2a01-0c22-72de-8e00-a559-93c8-8a72-3308.c22.pool.telefonica.de. [2a01:c22:72de:8e00:a559:93c8:8a72:3308])
        by smtp.googlemail.com with ESMTPSA id j22-20020a1709066dd600b008e6bd130b14sm2475602ejt.64.2023.03.04.13.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 13:37:54 -0800 (PST)
Message-ID: <8f88906f-c7da-eb3a-2f14-0f4d46202517@gmail.com>
Date:   Sat, 4 Mar 2023 22:33:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 2/4] i2c: i801: Replace acpi_lock with I2C bus lock
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

I2C core ensures in i2c_smbus_xfer() that the I2C bus lock is held when
calling the smbus_xfer callback. That's i801_access() in our case.
I think it's safe in general to assume that the I2C bus lock is held
when the smbus_xfer callback is called.
Therefore I see no need to define an own mutex.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index d6a0c3b53..7641bd0ac 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -289,10 +289,9 @@ struct i801_priv {
 
 	/*
 	 * If set to true the host controller registers are reserved for
-	 * ACPI AML use. Protected by acpi_lock.
+	 * ACPI AML use.
 	 */
 	bool acpi_reserved;
-	struct mutex acpi_lock;
 };
 
 #define FEATURE_SMBUS_PEC	BIT(0)
@@ -871,11 +870,8 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 	int hwpec, ret;
 	struct i801_priv *priv = i2c_get_adapdata(adap);
 
-	mutex_lock(&priv->acpi_lock);
-	if (priv->acpi_reserved) {
-		mutex_unlock(&priv->acpi_lock);
+	if (priv->acpi_reserved)
 		return -EBUSY;
-	}
 
 	pm_runtime_get_sync(&priv->pci_dev->dev);
 
@@ -916,7 +912,6 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 
 	pm_runtime_mark_last_busy(&priv->pci_dev->dev);
 	pm_runtime_put_autosuspend(&priv->pci_dev->dev);
-	mutex_unlock(&priv->acpi_lock);
 	return ret;
 }
 
@@ -1566,7 +1561,7 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
 	 * further access from the driver itself. This device is now owned
 	 * by the system firmware.
 	 */
-	mutex_lock(&priv->acpi_lock);
+	i2c_lock_bus(&priv->adapter, I2C_LOCK_SEGMENT);
 
 	if (!priv->acpi_reserved && i801_acpi_is_smbus_ioport(priv, address)) {
 		priv->acpi_reserved = true;
@@ -1586,7 +1581,7 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
 	else
 		status = acpi_os_write_port(address, (u32)*value, bits);
 
-	mutex_unlock(&priv->acpi_lock);
+	i2c_unlock_bus(&priv->adapter, I2C_LOCK_SEGMENT);
 
 	return status;
 }
@@ -1640,7 +1635,6 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	priv->adapter.dev.parent = &dev->dev;
 	ACPI_COMPANION_SET(&priv->adapter.dev, ACPI_COMPANION(&dev->dev));
 	priv->adapter.retries = 3;
-	mutex_init(&priv->acpi_lock);
 
 	priv->pci_dev = dev;
 	priv->features = id->driver_data;
-- 
2.39.2


