Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2682622EDE
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Nov 2022 16:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231950AbiKIPRU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Nov 2022 10:17:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231941AbiKIPRT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Nov 2022 10:17:19 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE211D64B
        for <linux-i2c@vger.kernel.org>; Wed,  9 Nov 2022 07:17:18 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id r14so27717004edc.7
        for <linux-i2c@vger.kernel.org>; Wed, 09 Nov 2022 07:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sGIiwR3sqbBs6aJpxwlUWDZYvqdTa1jpXVT1aoGQoI=;
        b=SOvKUYyz1F6SAP/kxbbFDu2GFw838AZSG8XKeVYUsRv1v1+l48ztfrx2oEWUr9GR3q
         8U3n4Nlv4YEPtHvBig5VQr1w1lvQim6iWXxIJ+nl+6jfJ6flB5JV+16zo1UA4KsHxPaj
         eKEbLCuZp4wt7YLoKz5gzmBcPMUiQT+HlJZ7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sGIiwR3sqbBs6aJpxwlUWDZYvqdTa1jpXVT1aoGQoI=;
        b=H8o9zaYrlyWMu06aAoMOwSJMt11THppdjjf98mTLyqT7uiajOdCptKkqSiBvD9vP5i
         gi+IHEoXMA8PKu3iMtFapLYt6qbxeF7jdKPl5s+98ekjgZvtqbF4GiQ5CJvSihnpdYs1
         y6+9NXKGIk3jxr3iUs44nbw4CPoafAUDAz6eNHOMRh04VpKVNHd4JQAyie03pc46SJCu
         VZFibeaiks72vkc8pLUwvHTmnlzPtxIQVpkY00IQWWmSR8wxl33iS1Va0ghfZJFgp394
         BWYRn51uukSglUEIP3CbFg4jj+VZH+K/Zi2MWFFg9pQNsMNgoPLO2opoIZFLhaCKHQYf
         VvcA==
X-Gm-Message-State: ACrzQf3cUg6siD7YRcICdCmKZhhqmdBbZixC02DXeq476UuPl77bnY1J
        uR0fC3r4HYKD7VRhq4zUINHlZQ==
X-Google-Smtp-Source: AMsMyM5eboTIeHyU97WEtmI8XAD50VN655xGVmY85CzGt3I+5E1EN6zuKDeHb8rSGBDw2aJQSZpgiw==
X-Received: by 2002:aa7:c491:0:b0:461:7f0c:c573 with SMTP id m17-20020aa7c491000000b004617f0cc573mr60196695edq.8.1668007036659;
        Wed, 09 Nov 2022 07:17:16 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:7487:46db:8e12:c768])
        by smtp.gmail.com with ESMTPSA id v19-20020aa7dbd3000000b00463c5c32c6esm7052320edt.89.2022.11.09.07.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 07:17:16 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 09 Nov 2022 16:17:06 +0100
Subject: [PATCH v2 1/1] i2c: Restore initial power state when we are done.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221109-i2c-waive-v2-1-07550bf2dacc@chromium.org>
References: <20221109-i2c-waive-v2-0-07550bf2dacc@chromium.org>
In-Reply-To: <20221109-i2c-waive-v2-0-07550bf2dacc@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org,
        Hidenori Kobayashi <hidenorik@google.com>,
        linux-i2c@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.11.0-dev-d93f8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3036; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=VQGhfKuFYOjUIfI7mUL+cgFB+s6H3+3PH3wUHnwwBqY=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBja8R521uqjbrE1joNlq6FefeAEA7HxzyIrcqOEitI
 Ul436TuJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY2vEeQAKCRDRN9E+zzrEiFVwEA
 CggoqJvHVpChOakLkXnM6Oz231J7rWsgakbZyoppOyokceJ+928ZR3Rr2KPuEhXHOYyE938lSqqF7I
 TeL+VgujevHMZ4sJgx4dR8fOsBsQfI0zU/TojJ3JzkDby1BzDyJK2c25dSiehiOel3haltN88M8+pG
 3k9rrJikRx6q/qadszxIDFLnNWA0xjEpFCc4KY4l4rD82JhXURdCVfK/qL3nLlc4bBYyAPcQfK+3n3
 IX7VyW1jauOT+wtZ0ItxsztV0sQCtnxuN3TYcr0ZiwXG4O9Wc+osIZhlQ4UjzrX7z0MSNEvIHJ5KYV
 69/9FwGJDodqz2NKnJChfuArqX8lcFSIwxEAkv347ENohLZ9KLUgbhrinRsaJyuAmWhJNGHZ6D3mbn
 eJyilb/VD12HLtgKqQMadM3QsXY38sYDrTHK7aiImK3/uEWJet6yr2xv4/EhmJOIJ9uR2Zq9nqw0ar
 GC2vn32uiD/uGrn6GF2mW9pm5+lCNOBN/0araY1VlqTMbgJjvGYUUMDrzkPLk6XaiLaxSa/onkSIJt
 Q0aw5ZXSPoTBPxSCAAgbs1MoqxHCoJg16btOA0ieOa+C5z356Ejzuk1ml/UTS8WFEVfQkNk1b6gufr
 crySiobUjbCUoFe9itB1wq3ypsFYtETPLnkNzBz0vNTzT498Xyef4sAe256w==
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
index b4edf10e8fd0..96623e0647bd 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -545,8 +545,9 @@ static int i2c_device_probe(struct device *dev)
 	if (status < 0)
 		goto err_clear_wakeup_irq;
 
+	client->turn_off_on_remove = !i2c_acpi_waive_d0_probe(dev);
 	status = dev_pm_domain_attach(&client->dev,
-				      !i2c_acpi_waive_d0_probe(dev));
+				      client->turn_off_on_remove);
 	if (status)
 		goto err_clear_wakeup_irq;
 
@@ -585,7 +586,7 @@ static int i2c_device_probe(struct device *dev)
 err_release_driver_resources:
 	devres_release_group(&client->dev, client->devres_group_id);
 err_detach_pm_domain:
-	dev_pm_domain_detach(&client->dev, !i2c_acpi_waive_d0_probe(dev));
+	dev_pm_domain_detach(&client->dev, client->turn_off_on_remove);
 err_clear_wakeup_irq:
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
@@ -610,7 +611,7 @@ static void i2c_device_remove(struct device *dev)
 
 	devres_release_group(&client->dev, client->devres_group_id);
 
-	dev_pm_domain_detach(&client->dev, !i2c_acpi_waive_d0_probe(dev));
+	dev_pm_domain_detach(&client->dev, client->turn_off_on_remove);
 
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index f7c49bbdb8a1..6b2dacb0bae1 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -326,6 +326,8 @@ struct i2c_driver {
  *	calls it to pass on slave events to the slave driver.
  * @devres_group_id: id of the devres group that will be created for resources
  *	acquired when probing this device.
+ * @turn_off_on_remove: Record if we have turned on the device before probing
+ *	so we can restore the initial state after remove/probe error.
  *
  * An i2c_client identifies a single device (i.e. chip) connected to an
  * i2c bus. The behaviour exposed to Linux is defined by the driver
@@ -355,6 +357,7 @@ struct i2c_client {
 	i2c_slave_cb_t slave_cb;	/* callback for slave mode	*/
 #endif
 	void *devres_group_id;		/* ID of probe devres group	*/
+	bool turn_off_on_remove;	/* power state when done	*/
 };
 #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
 

-- 
b4 0.11.0-dev-d93f8
