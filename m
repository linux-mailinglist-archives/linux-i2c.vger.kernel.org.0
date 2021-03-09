Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A05332732
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Mar 2021 14:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbhCINcN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Mar 2021 08:32:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbhCINbk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Mar 2021 08:31:40 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D1EC06174A
        for <linux-i2c@vger.kernel.org>; Tue,  9 Mar 2021 05:31:40 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id x7so6039710pfi.7
        for <linux-i2c@vger.kernel.org>; Tue, 09 Mar 2021 05:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DyG9tsfppZ03lD/Lsdb61Vn3isZGeZ0Tr3beWovxaIk=;
        b=AfQRSQarS5Z52+hfWM0kpU4IAa22xv3pg5hjILoTY60722wMV6cpmr7VwrO6Giujfu
         5uKnSty3e+d8uHkUERddX0mRCmaOL5yQDZXE9CFGW+uZRIrEXblYE5H6ncL9gVexd04a
         qKnvOOQ4rZXAO9olhe4iUrmlvgCLhCL9xkjqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DyG9tsfppZ03lD/Lsdb61Vn3isZGeZ0Tr3beWovxaIk=;
        b=HBFbiRYFdGpOw4+fpr7f1dgSng62zyLP/d4D6BwIL/ZUYbaOO0lT2UjQshT+gY6l7u
         FfOCTFk21pRcXU3xc/DI8bAytmEF4KQCFdTTnoX2ovhcvGDKPO+92Qs7NbIKRJGxHrAy
         KopVd8ByV9nZNhS6k0ieSR3EjrR8Q+dghCSFOdrf0XOu/0wa46pEncbrgWHjhvNPTsxI
         e5bXTV874GBQwrntwS+PVJT9nLyMcyohnw+yx1deCOrWCaJaNCwQtd8Dmzx+jxIHwxFL
         tgyLptajYloMCfPHva8q2D+C8arh5XcIKfrHC+rEuNmGiFmFpsFEpIG9oGxGY3w5XCvx
         aRUw==
X-Gm-Message-State: AOAM530ayfeIhOWARKxC5XByIVyglzsf60hbPRJ5E6Xmzt29xxpIbAJA
        4GOpeQJUVAMlhD+TIbleUejUJg==
X-Google-Smtp-Source: ABdhPJzIPe6Fp/qT2P3Fkk0X5hwJIjteYgnXxsElxCeB6yEGx3iMDZCavr7MarZcQawbSDmotY5y0w==
X-Received: by 2002:a65:6493:: with SMTP id e19mr24396789pgv.239.1615296699783;
        Tue, 09 Mar 2021 05:31:39 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:f936:57e5:154d:e0d9])
        by smtp.gmail.com with ESMTPSA id 138sm13678649pfv.192.2021.03.09.05.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 05:31:39 -0800 (PST)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v17 1/3] i2c: core: support bus regulator controlling in adapter
Date:   Tue,  9 Mar 2021 21:31:29 +0800
Message-Id: <20210309133131.1585838-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210309133131.1585838-1-hsinyi@chromium.org>
References: <20210309133131.1585838-1-hsinyi@chromium.org>
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
 drivers/i2c/i2c-core-base.c | 88 +++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h         |  2 +
 2 files changed, 90 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 63ebf722a424..436e498528a8 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -439,12 +439,14 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
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
@@ -510,6 +512,14 @@ static int i2c_device_probe(struct device *dev)
 
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
@@ -550,8 +560,10 @@ static int i2c_device_probe(struct device *dev)
 static int i2c_device_remove(struct device *dev)
 {
 	struct i2c_client	*client = to_i2c_client(dev);
+	struct i2c_adapter      *adap;
 	struct i2c_driver	*driver;
 
+	adap = client->adapter;
 	driver = to_i2c_driver(dev->driver);
 	if (driver->remove) {
 		int status;
@@ -564,6 +576,8 @@ static int i2c_device_remove(struct device *dev)
 	}
 
 	dev_pm_domain_detach(&client->dev, true);
+	if (!pm_runtime_status_suspended(&client->dev) && adap->bus_regulator)
+		regulator_disable(adap->bus_regulator);
 
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
@@ -576,6 +590,79 @@ static int i2c_device_remove(struct device *dev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int i2c_resume_early(struct device *dev)
+{
+	struct i2c_client *client = i2c_verify_client(dev);
+	int err;
+
+	if (!client || !client->adapter->bus_regulator)
+		return 0;
+
+	if (!pm_runtime_status_suspended(&client->dev)) {
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
+	if (!client || !client->adapter->bus_regulator)
+		return 0;
+
+	err = pm_generic_suspend_late(&client->dev);
+	if (err)
+		return err;
+
+	if (!pm_runtime_status_suspended(&client->dev))
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
+	if (!client || !client->adapter->bus_regulator)
+		return 0;
+
+	err = regulator_enable(client->adapter->bus_regulator);
+	if (err)
+		return err;
+	return pm_generic_runtime_resume(&client->dev);
+}
+
+static int i2c_runtime_suspend(struct device *dev)
+{
+	struct i2c_client *client = i2c_verify_client(dev);
+	int err;
+
+	if (!client || !client->adapter->bus_regulator)
+		return 0;
+
+	err = pm_generic_runtime_suspend(&client->dev);
+	if (err)
+		return err;
+
+	return regulator_disable(client->adapter->bus_regulator);
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
@@ -633,6 +720,7 @@ struct bus_type i2c_bus_type = {
 	.probe		= i2c_device_probe,
 	.remove		= i2c_device_remove,
 	.shutdown	= i2c_device_shutdown,
+	.pm		= &i2c_device_pm,
 };
 EXPORT_SYMBOL_GPL(i2c_bus_type);
 
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 56622658b215..ec87758d9f40 100644
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
@@ -721,6 +722,7 @@ struct i2c_adapter {
 	const struct i2c_adapter_quirks *quirks;
 
 	struct irq_domain *host_notify_domain;
+	struct regulator *bus_regulator;
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
-- 
2.30.1.766.gb4fecdf3b7-goog

