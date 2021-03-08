Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B67D3306E3
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 05:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234197AbhCHEgu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Mar 2021 23:36:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234186AbhCHEgT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 7 Mar 2021 23:36:19 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54BDC06175F
        for <linux-i2c@vger.kernel.org>; Sun,  7 Mar 2021 20:36:18 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id y13so2900478pfr.0
        for <linux-i2c@vger.kernel.org>; Sun, 07 Mar 2021 20:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zCUYo1BkJJoqTymCi6hMvf2QLrcDwpw0+n4l7ZEpGN4=;
        b=T4nNWfeEEpfK2XSkki4jbWraVBbxktuRTS2HhXQoYGtkzL34pFQHtqzEHkw+0KMCvW
         IC6Es0tS2VVoolWQLYrOCRxyEd8JnsTdt/8jJd6LWWobrBPilU6YjAZTwAkWNF9VjRS7
         Vc3mhkTOhGGB4yIYCv7eDSY+hCy8bpNX/joSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zCUYo1BkJJoqTymCi6hMvf2QLrcDwpw0+n4l7ZEpGN4=;
        b=udeMLq7reyhihfwam7I2qPlVD7RHqM4Rs80vJUduQqSbLB7cDuYxmh7/PyQgvkIUoI
         clPmE2ZQTlHysY5JJAECE7zZ3Ely9P8EvCouW1QgCmnVkv+2gF40Rs22pvCAXiIzOUWa
         uB7/rLVBEhqxuNfyt3VgLe2NnFUGwNzrLTck1ES70kDvl3fB20mJebTxPIBzws/Gyzne
         rc1/iPM/ZEsgqa4baXhAjYig4yDv6ejhnO/R/AsCAWgdjADy3uR7bPdQvKIEi+D71+6e
         TaciYjltbiekG8IzrtFz1Nf0186NPMveY1l+fj9upxGssRc1r0tXPceY9oKevvo/dLV2
         lQmQ==
X-Gm-Message-State: AOAM530hq5AqhdfV28QCIIBycyaMHJ4F9uE2riEUH+4m1VWv6FoSVlCT
        XJz7IekiJ6ExqCTvIX3oU87eag==
X-Google-Smtp-Source: ABdhPJz6orCjYR3o+ZywlBEuIT4SmHbby45FSbzAS27Gny6Lq5/Vvs7jh8ldq2xhkJ4Ot5U/vCCqXQ==
X-Received: by 2002:aa7:92c7:0:b029:1ee:75b2:2dab with SMTP id k7-20020aa792c70000b02901ee75b22dabmr20048195pfa.61.1615178178182;
        Sun, 07 Mar 2021 20:36:18 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:5da1:da1b:5bcf:2d46])
        by smtp.gmail.com with ESMTPSA id q2sm8191562pfu.215.2021.03.07.20.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 20:36:17 -0800 (PST)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v16 2/2] i2c: core: support bus regulator controlling in adapter
Date:   Mon,  8 Mar 2021 12:36:07 +0800
Message-Id: <20210308043607.957156-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210308043607.957156-1-hsinyi@chromium.org>
References: <20210308043607.957156-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bibby Hsieh <bibby.hsieh@mediatek.com>

Although in the most platforms, the bus power of i2c
are alway on, some platforms disable the i2c bus power
in order to meet low power request.

We get and enable bulk regulator in i2c adapter device.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/i2c/i2c-core-base.c | 93 +++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h         |  2 +
 2 files changed, 95 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 63ebf722a424..667f4a4de7cc 100644
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
@@ -510,6 +512,12 @@ static int i2c_device_probe(struct device *dev)
 
 	dev_dbg(dev, "probe\n");
 
+	status = regulator_enable(adap->bus_regulator);
+	if (status < 0) {
+		dev_err(&adap->dev, "Failed to enable power regulator\n");
+		goto err_clear_wakeup_irq;
+	}
+
 	status = of_clk_set_defaults(dev->of_node, false);
 	if (status < 0)
 		goto err_clear_wakeup_irq;
@@ -550,8 +558,10 @@ static int i2c_device_probe(struct device *dev)
 static int i2c_device_remove(struct device *dev)
 {
 	struct i2c_client	*client = to_i2c_client(dev);
+	struct i2c_adapter      *adap;
 	struct i2c_driver	*driver;
 
+	adap = client->adapter;
 	driver = to_i2c_driver(dev->driver);
 	if (driver->remove) {
 		int status;
@@ -564,6 +574,8 @@ static int i2c_device_remove(struct device *dev)
 	}
 
 	dev_pm_domain_detach(&client->dev, true);
+	if (!pm_runtime_status_suspended(&client->dev))
+		regulator_disable(adap->bus_regulator);
 
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
@@ -576,6 +588,80 @@ static int i2c_device_remove(struct device *dev)
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
+	if (!client)
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
+	if (!client)
+		return 0;
+
+	err = regulator_enable(client->adapter->bus_regulator);
+	if (err)
+		return err;
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
@@ -633,6 +719,7 @@ struct bus_type i2c_bus_type = {
 	.probe		= i2c_device_probe,
 	.remove		= i2c_device_remove,
 	.shutdown	= i2c_device_shutdown,
+	.pm		= &i2c_device_pm,
 };
 EXPORT_SYMBOL_GPL(i2c_bus_type);
 
@@ -1446,6 +1533,12 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	if (res)
 		goto out_reg;
 
+	adap->bus_regulator = devm_regulator_get(&adap->dev, "bus");
+	if (IS_ERR(adap->bus_regulator)) {
+		res = PTR_ERR(adap->bus_regulator);
+		goto out_reg;
+	}
+
 	pm_runtime_no_callbacks(&adap->dev);
 	pm_suspend_ignore_children(&adap->dev, true);
 	pm_runtime_enable(&adap->dev);
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

