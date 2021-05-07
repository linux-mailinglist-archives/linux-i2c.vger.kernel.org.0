Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCC43765D8
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 15:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237146AbhEGNPT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 09:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237131AbhEGNPP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 09:15:15 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0908CC061761
        for <linux-i2c@vger.kernel.org>; Fri,  7 May 2021 06:14:15 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id p17so5096609plf.12
        for <linux-i2c@vger.kernel.org>; Fri, 07 May 2021 06:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zc6/3/VfcHCcsyhsjpHk83+1mY6bLdnDzZw5bgOgDug=;
        b=POFBgKAPpYfOQn+zGMU4zVvD61ln1R7Iz0VNQU2NOPqLsRwHWA0+/KzHDjiO1lNzqv
         4J6S2UVlB6iJlyJGqsqZpq3NIO/ApK6zBKw2VG/t8PDkBUxhKDxcGujl0t6c04E1nuLj
         vYdZiHUwIhNPWwUl2zdKlWd2cZwpgEih3zPOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zc6/3/VfcHCcsyhsjpHk83+1mY6bLdnDzZw5bgOgDug=;
        b=GaFAeBGcLvt548mc9DRCl58x2eLp05YjDmhJ2QshB6e9gsRmyVV2sD/Z+uv6rKbSTu
         15X9AWg+3tXUqwrdhRqmxyk2Ezjr1rMsoQhFP8HX+S+3xrvBhL6qPOhrkkDYrhyzKHCr
         KEIsNZia4r0HaLyShIl+vmjhv4ruQGGayRYcWDMyB5mBwU2nU6ISbkpRp0WjvtdSXW3Q
         pWnoDmNuXigGFukdQRpi0xCWjCRzxkY6iR8omxTo9pAu8JFm7iMcSRGlvXRK2PXGXHM1
         9IZYUDVXcgnjoiUyS6k4QNjQ3FrUyGW7nWRZ7oIjG/FnegGj6K+ZCPp/Wl0/UC/bLZf6
         Hcdg==
X-Gm-Message-State: AOAM533WINfZMaMK9NUhyz+rn6tKJs+AJEGkjKnMMd85VpkFOv1ShOHv
        rcgFCbLu4uQOc+7NdPVwb2B5Bg==
X-Google-Smtp-Source: ABdhPJxqT7U6uQjQoBNiFS/tGiuwtuAfj3Zop0aaTEvptjo8FjdlTzjrtlDJlNmeXJAXIlPVuDDk+Q==
X-Received: by 2002:a17:90a:cc11:: with SMTP id b17mr10270349pju.119.1620393254578;
        Fri, 07 May 2021 06:14:14 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:711f:8553:a124:a19])
        by smtp.gmail.com with ESMTPSA id z29sm4656539pga.52.2021.05.07.06.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 06:14:14 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v21 1/5] i2c: core: support bus regulator controlling in adapter
Date:   Fri,  7 May 2021 21:14:02 +0800
Message-Id: <20210507131406.2224177-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210507131406.2224177-1-hsinyi@chromium.org>
References: <20210507131406.2224177-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bibby Hsieh <bibby.hsieh@mediatek.com>

Although in the most platforms, the bus power of i2c
are alway on, some platforms disable the i2c bus power
in order to meet low power request.

We can control bulk regulator if it is provided in i2c
adapter device.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/i2c/i2c-core-base.c | 95 +++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h         |  2 +
 2 files changed, 97 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5a97e4a02fa2..23bc7c269184 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -461,12 +461,14 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
 static int i2c_device_probe(struct device *dev)
 {
 	struct i2c_client	*client = i2c_verify_client(dev);
+	struct i2c_adapter	*adap;
 	struct i2c_driver	*driver;
 	int status;
 
 	if (!client)
 		return 0;
 
+	adap = client->adapter;
 	client->irq = client->init_irq;
 
 	if (!client->irq) {
@@ -532,6 +534,14 @@ static int i2c_device_probe(struct device *dev)
 
 	dev_dbg(dev, "probe\n");
 
+	if (adap->bus_regulator) {
+		status = regulator_enable(adap->bus_regulator);
+		if (status < 0) {
+			dev_err(&adap->dev, "Failed to enable bus regulator\n");
+			goto err_clear_wakeup_irq;
+		}
+	}
+
 	status = of_clk_set_defaults(dev->of_node, false);
 	if (status < 0)
 		goto err_clear_wakeup_irq;
@@ -589,8 +599,10 @@ static int i2c_device_probe(struct device *dev)
 static int i2c_device_remove(struct device *dev)
 {
 	struct i2c_client	*client = to_i2c_client(dev);
+	struct i2c_adapter      *adap;
 	struct i2c_driver	*driver;
 
+	adap = client->adapter;
 	driver = to_i2c_driver(dev->driver);
 	if (driver->remove) {
 		int status;
@@ -605,6 +617,8 @@ static int i2c_device_remove(struct device *dev)
 	devres_release_group(&client->dev, client->devres_group_id);
 
 	dev_pm_domain_detach(&client->dev, true);
+	if (!pm_runtime_status_suspended(&client->dev) && adap->bus_regulator)
+		regulator_disable(adap->bus_regulator);
 
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
@@ -617,6 +631,86 @@ static int i2c_device_remove(struct device *dev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int i2c_resume_early(struct device *dev)
+{
+	struct i2c_client *client = i2c_verify_client(dev);
+	int err;
+
+	if (!client)
+		return 0;
+
+	if (pm_runtime_status_suspended(&client->dev) &&
+		client->adapter->bus_regulator) {
+		err = regulator_enable(client->adapter->bus_regulator);
+		if (err)
+			return err;
+	}
+
+	return pm_generic_resume_early(&client->dev);
+}
+
+static int i2c_suspend_late(struct device *dev)
+{
+	struct i2c_client *client = i2c_verify_client(dev);
+	int err;
+
+	if (!client)
+		return 0;
+
+	err = pm_generic_suspend_late(&client->dev);
+	if (err)
+		return err;
+
+	if (!pm_runtime_status_suspended(&client->dev) &&
+		client->adapter->bus_regulator)
+		return regulator_disable(client->adapter->bus_regulator);
+
+	return 0;
+}
+#endif
+
+#ifdef CONFIG_PM
+static int i2c_runtime_resume(struct device *dev)
+{
+	struct i2c_client *client = i2c_verify_client(dev);
+	int err;
+
+	if (!client)
+		return 0;
+
+	if (client->adapter->bus_regulator) {
+		err = regulator_enable(client->adapter->bus_regulator);
+		if (err)
+			return err;
+	}
+
+	return pm_generic_runtime_resume(&client->dev);
+}
+
+static int i2c_runtime_suspend(struct device *dev)
+{
+	struct i2c_client *client = i2c_verify_client(dev);
+	int err;
+
+	if (!client)
+		return 0;
+
+	err = pm_generic_runtime_suspend(&client->dev);
+	if (err)
+		return err;
+
+	if (client->adapter->bus_regulator)
+		return regulator_disable(client->adapter->bus_regulator);
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops i2c_device_pm = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(i2c_suspend_late, i2c_resume_early)
+	SET_RUNTIME_PM_OPS(i2c_runtime_suspend, i2c_runtime_resume, NULL)
+};
+
 static void i2c_device_shutdown(struct device *dev)
 {
 	struct i2c_client *client = i2c_verify_client(dev);
@@ -674,6 +768,7 @@ struct bus_type i2c_bus_type = {
 	.probe		= i2c_device_probe,
 	.remove		= i2c_device_remove,
 	.shutdown	= i2c_device_shutdown,
+	.pm		= &i2c_device_pm,
 };
 EXPORT_SYMBOL_GPL(i2c_bus_type);
 
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index e8f2ac8c9c3d..953a4eecb88f 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -15,6 +15,7 @@
 #include <linux/device.h>	/* for struct device */
 #include <linux/sched.h>	/* for completion */
 #include <linux/mutex.h>
+#include <linux/regulator/consumer.h>
 #include <linux/rtmutex.h>
 #include <linux/irqdomain.h>		/* for Host Notify IRQ */
 #include <linux/of.h>		/* for struct device_node */
@@ -729,6 +730,7 @@ struct i2c_adapter {
 	const struct i2c_adapter_quirks *quirks;
 
 	struct irq_domain *host_notify_domain;
+	struct regulator *bus_regulator;
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
-- 
2.31.1.607.g51e8a6a459-goog

