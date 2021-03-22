Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09415343659
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Mar 2021 02:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbhCVBix (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Mar 2021 21:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbhCVBig (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 Mar 2021 21:38:36 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43DB1C061574;
        Sun, 21 Mar 2021 18:38:36 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id v2so7592995pgk.11;
        Sun, 21 Mar 2021 18:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=qlNbZGIMBNb9SgIMukwug5lwHWy/u/7OkPnoFKIJhWc=;
        b=Caa2gW8HOFDauVViHY8sYagds7MPgYnkyNwAz6tb8IIRTHJ+hAuHzMe6Qk51Js2+oG
         VL9VQtewQzIHhPKci2NAcTq9nX6/Y2U6p3rvkTaoINGp8FTRd03SBu24wDHhJNp42KNv
         Pr3+L4VRSeUrt6MWKqTWAYCFHHL1Is1MbZ3phZ7xK2+JpuORZn8gczbHFilgBmJrITKz
         6GmKNzmt2OAQo/++sXzHB13vO3FivmUiC6J6cN24ZyYHHC+sVVo/l3+nvadB7oUnXMlT
         QroO5vsiz2u/C/RMdIsrmtkK5l4UmXGM084MqppJK57Q+G/qIEfuhN3YHlMAl51DLOQp
         Tncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=qlNbZGIMBNb9SgIMukwug5lwHWy/u/7OkPnoFKIJhWc=;
        b=SEQmMNgIKH17neQT4Mxb3Iq9ejVL0qtiBqneEIQGUwkp/NqW7iDdmoO+E9rdPph6QR
         u2f5jDyXWZjNEpOQmZMyvOujDWW7yRTwF7Bb+SVsL0VIay3+SzcY+SIXSSOR5AcasQzE
         eouT4QW1m04KXpUDQMZIL0lxVdzajMgPH9FP+Gy34iwJSfbPreM/qt9oSIwQfURWAxuT
         PNtpElgL2CpfNDUElkHxmp7AJSsfiS3ctDYPa0uKo9NZXoCNs07VU+SblZbMzBHGubuA
         DHixL7FddATesaUGqb2SnplOTq31/dbUoTGCD/lt1/ax3hGQ3Esr88zbi1sbT7p4YNXG
         vUPQ==
X-Gm-Message-State: AOAM531VsF95JaR8e5LCFAfnTfKXeVOZjCuK04He5kLZZwSNplJYCRKv
        XtmpZKdkaLrWyvIa1xTIb1idowUBJRE=
X-Google-Smtp-Source: ABdhPJy2Z9jhoTkhERKqWQPcWZijOh2LKMt6RqtnAm/8gVX3S7w+GYcFJL+FA28vLbYuKxewZANLcg==
X-Received: by 2002:a63:cd09:: with SMTP id i9mr21091503pgg.407.1616377115745;
        Sun, 21 Mar 2021 18:38:35 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id v18sm11943846pfn.117.2021.03.21.18.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 18:38:34 -0700 (PDT)
Date:   Sun, 21 Mar 2021 18:38:32 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Jeff LaBundy <jeff@labundy.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: ensure timely release of driver-allocated resources
Message-ID: <YFf1GFPephFxC0mC@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

More and more drivers rely on devres to manage their resources, however
if bus' probe() and release() methods are not trivial and control some
of resources as well (for example enable or disable clocks, or attach
device to a power domain), we need to make sure that driver-allocated
resources are released immediately after driver's remove() method
returns, and not postponed until driver core gets around to releasing
resources. To fix that we open a new devres group before calling
driver's probe() and explicitly release it when we return from driver's
remove().

Tested-by: Jeff LaBundy <jeff@labundy.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Note that this problem is not I2C-specific and I will be sending patches
for other buses as well.

 drivers/i2c/i2c-core-base.c | 21 ++++++++++++++++++++-
 include/linux/i2c.h         |  3 +++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 63ebf722a424..b38ecd888b90 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -518,6 +518,13 @@ static int i2c_device_probe(struct device *dev)
 	if (status)
 		goto err_clear_wakeup_irq;
 
+	client->devres_group_id = devres_open_group(&client->dev, NULL,
+						    GFP_KERNEL);
+	if (!client->devres_group_id) {
+		status = -ENOMEM;
+		goto err_detach_pm_domain;
+	}
+
 	/*
 	 * When there are no more users of probe(),
 	 * rename probe_new to probe.
@@ -530,11 +537,21 @@ static int i2c_device_probe(struct device *dev)
 	else
 		status = -EINVAL;
 
+	/*
+	 * Note that we are not closing the devres group opened above so
+	 * even resources that were attached to the device after probe is
+	 * run are released when i2c_device_remove() is executed. This is
+	 * needed as some drivers would allocate additional resources,
+	 * for example when updating firmware.
+	 */
+
 	if (status)
-		goto err_detach_pm_domain;
+		goto err_release_driver_resources;
 
 	return 0;
 
+err_release_driver_resources:
+	devres_release_group(&client->dev, client->devres_group_id);
 err_detach_pm_domain:
 	dev_pm_domain_detach(&client->dev, true);
 err_clear_wakeup_irq:
@@ -563,6 +580,8 @@ static int i2c_device_remove(struct device *dev)
 			dev_warn(dev, "remove failed (%pe), will be ignored\n", ERR_PTR(status));
 	}
 
+	devres_release_group(&client->dev, client->devres_group_id);
+
 	dev_pm_domain_detach(&client->dev, true);
 
 	dev_pm_clear_wake_irq(&client->dev);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 56622658b215..5d1f11c0deaa 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -306,6 +306,8 @@ struct i2c_driver {
  *	userspace_devices list
  * @slave_cb: Callback when I2C slave mode of an adapter is used. The adapter
  *	calls it to pass on slave events to the slave driver.
+ * @devres_group_id: id of the devres group that will be created for resources
+ *	acquired when probing this device.
  *
  * An i2c_client identifies a single device (i.e. chip) connected to an
  * i2c bus. The behaviour exposed to Linux is defined by the driver
@@ -334,6 +336,7 @@ struct i2c_client {
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	i2c_slave_cb_t slave_cb;	/* callback for slave mode	*/
 #endif
+	void *devres_group_id;		/* ID of probe devres group	*/
 };
 #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
 
-- 
2.31.0.rc2.261.g7f71774620-goog


-- 
Dmitry
