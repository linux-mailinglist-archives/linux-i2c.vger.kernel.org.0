Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCAD6243E0
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Nov 2022 15:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiKJOL6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Nov 2022 09:11:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbiKJOLy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Nov 2022 09:11:54 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92DAA6DCE3
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 06:11:52 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id a13so3331258edj.0
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 06:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkp0XPPk7E47kVPnJhzqa19PLPmwGlC8Oq4Uz7Z7u5A=;
        b=IRH3Cv7MYrebPcSYLGgcqbB9Y7sDT1CvEqVhzU8yNx1bAesYbpMUBidLYP+/sIE7+I
         qpeun+67ss0TtixIxkG5rmU3qf6lJnALDT8Gsn8urPeE8iE2XSkbo68JQV7FSusOFFkz
         GXNVGyAeUoc1qcDTnn/Lhzm7hqdM0V4GMz2V0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkp0XPPk7E47kVPnJhzqa19PLPmwGlC8Oq4Uz7Z7u5A=;
        b=z5xN/FSQ8QOwRIDK+30ENQBrtXA9DcGNvkrWBNXXsFNulpWPm9qGsqCBjboLFUGkr7
         PecrccYx64JytieQMaKf5La3LTG4mTqTVobGIicJsjIcTOh2CMYa/WpDJHw3NdMlpeEc
         FOb8I7fOIeKyUorVTQQYSG19X0HTYuACD010ksWgiPEart9Nil7IKRwfLn6EIHcTq0UJ
         c3K2Sdg9IqL967HzWQ/hGfBK9AevEzOvzph9Zpmbgx5gclE2NTO77GOV3EXBtxFtcePa
         U+Zm3HBySJsp/UUt6FFsJBfNAXckPb6SLFj4G9rsLb371sHIh/L2KDAU7ZIuaDmQcOpj
         ycHQ==
X-Gm-Message-State: ACrzQf30EAKQRinZJDKaCdJOFqdnZyToBL8gRUf0K01yk7zI2NNiku0S
        s/qqVWUQKbKFiqRRh5DCPUBtBg==
X-Google-Smtp-Source: AMsMyM5o1tC9WW+83bSCSi7jptaGQ29Hc1Rj3Jrgx7h+4MQdXev1zcAp9tFqvecA9uXgW0QBxx/POA==
X-Received: by 2002:aa7:df18:0:b0:45c:fca7:e094 with SMTP id c24-20020aa7df18000000b0045cfca7e094mr2315804edy.314.1668089511090;
        Thu, 10 Nov 2022 06:11:51 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:e41d:ff2f:a5fe:e81e])
        by smtp.gmail.com with ESMTPSA id l2-20020a1709063d2200b0076ff600bf2csm7308383ejf.63.2022.11.10.06.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 06:11:50 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 10 Nov 2022 15:11:43 +0100
Subject: [PATCH v4 1/1] i2c: Restore initial power state when we are done.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221109-i2c-waive-v4-1-e4496462833b@chromium.org>
References: <20221109-i2c-waive-v4-0-e4496462833b@chromium.org>
In-Reply-To: <20221109-i2c-waive-v4-0-e4496462833b@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Hidenori Kobayashi <hidenorik@google.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
X-Mailer: b4 0.11.0-dev-d93f8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3390; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=jzJu/e8IW2lpXEFqlkmAwu3Bxxoe0Daq7C9TI23d9aU=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjbQaj9loSQ7+jCdhvkOsRPfHzMrh7IuT3tG7IX2wZ
 rLmXrrqJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY20GowAKCRDRN9E+zzrEiCTjEA
 CGOQ0GEsDJnjmhi28wakF7AWa43T4cY5XsZxB0j0j5aNXJTDdxXxbz5KTJoFSm4/NPhrR54hjfZ5G/
 SQeuPyyYLqhiykSuJG6yK2k7GApZRmiShz2c8xh/PlMSC08BdPSIwqp3HwVQwIQW7kXnHdcrpNku1S
 qh7NHkGod+f4SkteCRwu6vMdi1lJxOFK4CRosrUQ1fPBI1c/Hl36+3RKb4vuSKov/ER9u4ZYFj0sA6
 jfNHDAJJaeHZAMawheXNYaUetm6Kl4Z/0TOSzPltfIIjcgQmb4xupF8+kiTzlG9gMbWXc0s4URXqNS
 7HKuXVz1XLJyyNzP+oFpWNP2AhQrUnfiFc+sx4UeZGn5lwiCPma5WAUuq8buIlhvChZLuKt3HrcklM
 QBp6HdlFQ+VfhsmYrfdtpPPWLRLpXp/0ftGiVhPTcXsUggcJOBaXNKvHFfXssYl98Uc1SXHL+Sd019
 xjEaqxhal3XeeCyngTolxdI9CY5PmZvDrH0ouzC+JVLgPhvYbt+qwgXIk4HMyK2KlQOHT5XSr7fBfu
 2E0YGD4JZCLFDgNlj1fXXD3kxLtORLeG2lXTtSu+7vXqL5f12J7TqswkVnt6vxvSMvBNv6Hdt/K/jS
 iHh7lwispPtse8bYXOew/LfRWEWGRJgkRSfajNPUTRmlQD/kp+TafKU7L+wg==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

A driver that supports I2C_DRV_ACPI_WAIVE_D0_PROBE is not expected to
power off a device that it has not powered on previously.

For devices operating in "full_power" mode, the first call to
`i2c_acpi_waive_d0_probe` will return 0, which means that the device
will be turned on with `dev_pm_domain_attach`.

If probe fails or the device is removed the second call to
`i2c_acpi_waive_d0_probe` will return 1, which means that the device
will not be turned off. This is, it will be left in a different power
state. Lets fix it.

Fixes: b18c1ad685d9 ("i2c: Allow an ACPI driver to manage the device's power state during probe")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index b4edf10e8fd0..09a6bb89a352 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -467,6 +467,7 @@ static int i2c_device_probe(struct device *dev)
 {
 	struct i2c_client	*client = i2c_verify_client(dev);
 	struct i2c_driver	*driver;
+	bool do_power_on;
 	int status;
 
 	if (!client)
@@ -545,8 +546,8 @@ static int i2c_device_probe(struct device *dev)
 	if (status < 0)
 		goto err_clear_wakeup_irq;
 
-	status = dev_pm_domain_attach(&client->dev,
-				      !i2c_acpi_waive_d0_probe(dev));
+	do_power_on = !i2c_acpi_waive_d0_probe(dev);
+	status = dev_pm_domain_attach(&client->dev, do_power_on);
 	if (status)
 		goto err_clear_wakeup_irq;
 
@@ -580,12 +581,14 @@ static int i2c_device_probe(struct device *dev)
 	if (status)
 		goto err_release_driver_resources;
 
+	client->turn_off_on_remove = do_power_on;
+
 	return 0;
 
 err_release_driver_resources:
 	devres_release_group(&client->dev, client->devres_group_id);
 err_detach_pm_domain:
-	dev_pm_domain_detach(&client->dev, !i2c_acpi_waive_d0_probe(dev));
+	dev_pm_domain_detach(&client->dev, do_power_on);
 err_clear_wakeup_irq:
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
@@ -610,7 +613,7 @@ static void i2c_device_remove(struct device *dev)
 
 	devres_release_group(&client->dev, client->devres_group_id);
 
-	dev_pm_domain_detach(&client->dev, !i2c_acpi_waive_d0_probe(dev));
+	dev_pm_domain_detach(&client->dev, client->turn_off_on_remove);
 
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index f7c49bbdb8a1..412ac2b7cb2e 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -326,6 +326,8 @@ struct i2c_driver {
  *	calls it to pass on slave events to the slave driver.
  * @devres_group_id: id of the devres group that will be created for resources
  *	acquired when probing this device.
+ * @turn_off_on_remove: Record if we have turned on the device before probing
+ *	so we can turn off the device at removal.
  *
  * An i2c_client identifies a single device (i.e. chip) connected to an
  * i2c bus. The behaviour exposed to Linux is defined by the driver
@@ -355,6 +357,8 @@ struct i2c_client {
 	i2c_slave_cb_t slave_cb;	/* callback for slave mode	*/
 #endif
 	void *devres_group_id;		/* ID of probe devres group	*/
+	bool turn_off_on_remove;	/* if device needs to be turned	*/
+					/* off by framework at removal	*/
 };
 #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
 

-- 
b4 0.11.0-dev-d93f8
