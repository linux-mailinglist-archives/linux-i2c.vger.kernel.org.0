Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7FEA623FCF
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Nov 2022 11:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbiKJKdI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Nov 2022 05:33:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbiKJKdG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Nov 2022 05:33:06 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F0D2AC48
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 02:33:05 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id a67so2358035edf.12
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 02:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pX92ujEcGAc8NiZI5yHP2jRaPWZN895tzcGmZQPOb4E=;
        b=JR+G3toOdQeXLiy4cVbuSvTKePnWc3sXXfU8gLJ9sFlX1mm7ErpGupPL394P0bRE68
         62O5PakLunRnmyf3N83r4YKVtz6VVdiHaj5koUBYp0s4ZK/8ICkkphJK/iiphh0q1GNK
         fl655RMqPuBj9Ed9A8kcRsydvUDO3i+UE0HoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pX92ujEcGAc8NiZI5yHP2jRaPWZN895tzcGmZQPOb4E=;
        b=L0X8q9dqSUqOl/6U8Nt1roa0YSe3ZhLBTaHh3+q6UpnQQ5/lCmt5pGNZ/HAySB6knl
         p1EJoVJ8EDyLoZrMzdrcpx/U3W2yJrx/5J3lJKFVnxaaQGVFaHFpGnSTSxjEtfeQTjp9
         r7ir9fkrQw8aZFPG5lhBR6fdSS5lHWHY0BscD1lPsRjkOsz2DBLX8db3eRHmHUy5yefC
         7n1GA4sEjazlJqAraFfxr3Kbk02XM4Qwj12c5PQGwTBGq6QDIyKhReQBO1QkDIGy9kP+
         52CMP8ocXeidqUkCLWiHutV9zVQ3bt4NtqTsAJSjpyMLib4Z/MNN1iRX2nb5nlPCAjvU
         Igrw==
X-Gm-Message-State: ACrzQf1/lL217D/sFJ4RhbbDK1c+0OAJT3NgmaiYDNBrvJg5b0IgNk+U
        XAq1y2fEi4MsYPmwJKvtcCVN5ebT5zJK0uWO
X-Google-Smtp-Source: AMsMyM6LvoGh+sIGLalcrB9u9GERWvyAmRjly2hAwkfPiBGErnrbyaCXyqThrrJqsokwurf3GzUItQ==
X-Received: by 2002:a05:6402:4d5:b0:459:2b41:3922 with SMTP id n21-20020a05640204d500b004592b413922mr1968947edw.160.1668076384144;
        Thu, 10 Nov 2022 02:33:04 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:8565:42a1:677d:6677])
        by smtp.gmail.com with ESMTPSA id o5-20020a170906768500b007a1d4944d45sm7137467ejm.142.2022.11.10.02.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 02:33:03 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 10 Nov 2022 11:32:49 +0100
Subject: [PATCH v3 1/1] i2c: Restore initial power state when we are done.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221109-i2c-waive-v3-1-d8651cb4b88d@chromium.org>
References: <20221109-i2c-waive-v3-0-d8651cb4b88d@chromium.org>
In-Reply-To: <20221109-i2c-waive-v3-0-d8651cb4b88d@chromium.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>,
        Hidenori Kobayashi <hidenorik@google.com>
X-Mailer: b4 0.11.0-dev-d93f8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3357; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=4xZlMSZRR+lV69Kk9aqulQA2DYYgaAnAPsqo4aA3H80=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjbNNcGyLgae/UE26tcRQv2oJssl7CVCij7n2Emrbh
 HzE7TraJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY2zTXAAKCRDRN9E+zzrEiO2xD/
 9sAKxxaHA2RfafWakiT1INPYALIsD9D5GLOAWO7nWIj+BVugl++ZqUHSB4qA0X1yi4MpxvvlgkDYFC
 B5qpoYxwElVc28cPQRXEn075JESc8feLMdNDhIZHFnRM1RwUCb2DsKiKWv4vkYvNCo7JquCKGZLZO/
 rJHbWbJ2mDVSTfDZh7QQTyr4Ikfbd7y9Ym99Lw1M7QSYlFAy0/xxkYbEg8fMo1F7FxjxevzjxvtQSs
 UP57e3t8pyN1wOIqSKddxdfKedVDSjiGI9cq8yH8B3O7//Lf7QH0mFt18yGz+8/RkGook5OMd4t5gV
 KZ2PZ0v8HGssgo/A+o7FxDPnHqChxHVqpXKQvMUaWI0VX+kkR1jrpiluwG92bQFlpQSzOvLnYXsDLL
 zR/NghkkQ79LhcJQJTD2kFP27VtgTuFIK7wbkhPrxvRwJGFGH7zsBTwRn7TsVvNWQIu9N44P2n8kL+
 ayiPmaDt89ndCYcu2ltwarip0Cu/SN4cxg5gAH/p//Dcl531qQNsz60ct4oCiLMt07VxPbD9pfAqrl
 i+QOCJOHUi+GQKw4BRi1EhM7t/tWP75LHXxHLsmZsoP6lNKmBOPOzjGOAfbweRfqTvL2PMB0X+JnDg
 nkBg40IP57yU4Dk0Qf4VIEiLDdNqe3aTvBxiHCCuhDlGGzweJHH5Vlg2dv9Q==
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
index b4edf10e8fd0..75da19bcfb2b 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -467,6 +467,7 @@ static int i2c_device_probe(struct device *dev)
 {
 	struct i2c_client	*client = i2c_verify_client(dev);
 	struct i2c_driver	*driver;
+	bool full_power;
 	int status;
 
 	if (!client)
@@ -545,8 +546,8 @@ static int i2c_device_probe(struct device *dev)
 	if (status < 0)
 		goto err_clear_wakeup_irq;
 
-	status = dev_pm_domain_attach(&client->dev,
-				      !i2c_acpi_waive_d0_probe(dev));
+	full_power = !i2c_acpi_waive_d0_probe(dev);
+	status = dev_pm_domain_attach(&client->dev, full_power);
 	if (status)
 		goto err_clear_wakeup_irq;
 
@@ -580,12 +581,14 @@ static int i2c_device_probe(struct device *dev)
 	if (status)
 		goto err_release_driver_resources;
 
+	client->turn_off_on_remove = full_power;
+
 	return 0;
 
 err_release_driver_resources:
 	devres_release_group(&client->dev, client->devres_group_id);
 err_detach_pm_domain:
-	dev_pm_domain_detach(&client->dev, !i2c_acpi_waive_d0_probe(dev));
+	dev_pm_domain_detach(&client->dev, full_power);
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
