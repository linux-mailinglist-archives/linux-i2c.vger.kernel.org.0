Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A00F023B857
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Aug 2020 12:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728867AbgHDKCI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Aug 2020 06:02:08 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:33258 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbgHDKCH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Aug 2020 06:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1596535327; x=1628071327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2QQDoQ+rXHqAJ/jTJVuyzZWARBCmlwXj8iiuOYtPzTE=;
  b=Oy0IlnFRw+9dhPPqybJZKrWYYV3MNd6P2lWjN8Gp1kYi6Zt8OzykOf50
   LY+Mg8uhstEzfG8pfiRAsqOQu+Jh8n0nioKCUh+cG5kGEK2wUIEJmAC+L
   T1G6O6sMx7m4yqLC6aNXHvenLlwhw+cV4qn3qQtRVlL92tpcq9XtgQfKC
   zMpSfhsW+11WDB9+ZNzIGxpnKLlv9/A6bwBwJSQWIQdxL/aNSMu/4teQT
   EWXYo+0bcLv9z9ILcWGHJpIKqte9c3Ug6xIS1BfCG1ZNBrqTgMyWFC1mJ
   pqvJ5u6vDg/pVgih0Ae96L3PFp7d4xZDtPIlLtpIRC7fCF1c38W04IQ0U
   Q==;
IronPort-SDR: ddqle0Lzj7PH1UgxkECezH1kBLn0RgGKentPyLD9rwkpe5YpcRr+/nj1fKE+8sa7Ns5eojhvGI
 nnOuxQeQ1YHfy5pTL/Y0RHRjxqtthOsX3ejqOBrvgUl3JITt0OEobMMvbPwXRA/pnD3sI8afWc
 zA6tVTBnxwzt4tJ1sdvLi0krO0fsB3J4ObHS68J8ObeUD/S+UOySkt3eIrN9yLPm33cT6ygfcb
 YokG7fHcg3+DPcjxifGFacbRaIoije/IpScGw3Zl/NaL0DwMQvHWl4DZJStfVD4zArSVRQWJyM
 MQs=
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; 
   d="scan'208";a="86620572"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Aug 2020 03:02:07 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 4 Aug 2020 03:02:04 -0700
Received: from rob-ult-m19940.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 4 Aug 2020 03:01:21 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <wsa@kernel.org>, <robh+dt@kernel.org>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [PATCH 3/4] i2c: core: treat EPROBE_DEFER when acquiring SCL/SDA GPIOs
Date:   Tue, 4 Aug 2020 12:59:25 +0300
Message-ID: <20200804095926.205643-4-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200804095926.205643-1-codrin.ciubotariu@microchip.com>
References: <20200804095926.205643-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Even if I2C bus GPIO recovery is optional, devm_gpiod_get() can return
-EPROBE_DEFER, so we should at least treat that. This ends up with
i2c_register_adapter() to be able to return -EPROBE_DEFER.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

Changes from RFC:
 - return -EINVAL if i2c_init_recovery() doesn't have the complete
   information;
 - 'else if' added when checking if i2c_generic_scl_recovery() is used;
 - moved i2c_init_recovery() before class-link creation; class-link
   cleanup removed;
 - moved debug print when the adapter is probed after call to
   i2c_init_recovery();

 drivers/i2c/i2c-core-base.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index cf0c5eb152e1..99dbaead269e 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -375,15 +375,16 @@ static int i2c_gpio_init_recovery(struct i2c_adapter *adap)
 	return i2c_gpio_init_generic_recovery(adap);
 }
 
-static void i2c_init_recovery(struct i2c_adapter *adap)
+static int i2c_init_recovery(struct i2c_adapter *adap)
 {
 	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
 	char *err_str;
 
 	if (!bri)
-		return;
+		return 0;
 
-	i2c_gpio_init_recovery(adap);
+	if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
 
 	if (!bri->recover_bus) {
 		err_str = "no recover_bus() found";
@@ -399,10 +400,7 @@ static void i2c_init_recovery(struct i2c_adapter *adap)
 			if (gpiod_get_direction(bri->sda_gpiod) == 0)
 				bri->set_sda = set_sda_gpio_value;
 		}
-		return;
-	}
-
-	if (bri->recover_bus == i2c_generic_scl_recovery) {
+	} else if (bri->recover_bus == i2c_generic_scl_recovery) {
 		/* Generic SCL recovery */
 		if (!bri->set_scl || !bri->get_scl) {
 			err_str = "no {get|set}_scl() found";
@@ -414,10 +412,12 @@ static void i2c_init_recovery(struct i2c_adapter *adap)
 		}
 	}
 
-	return;
+	return 0;
  err:
 	dev_err(&adap->dev, "Not using recovery: %s\n", err_str);
 	adap->bus_recovery_info = NULL;
+
+	return -EINVAL;
 }
 
 static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
@@ -1444,12 +1444,16 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	if (res)
 		goto out_reg;
 
-	dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
-
 	pm_runtime_no_callbacks(&adap->dev);
 	pm_suspend_ignore_children(&adap->dev, true);
 	pm_runtime_enable(&adap->dev);
 
+	res = i2c_init_recovery(adap);
+	if (res == -EPROBE_DEFER)
+		goto out_reg;
+
+	dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
+
 #ifdef CONFIG_I2C_COMPAT
 	res = class_compat_create_link(i2c_adapter_compat_class, &adap->dev,
 				       adap->dev.parent);
@@ -1458,8 +1462,6 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 			 "Failed to create compatibility class link\n");
 #endif
 
-	i2c_init_recovery(adap);
-
 	/* create pre-declared device nodes */
 	of_i2c_register_devices(adap);
 	i2c_acpi_register_devices(adap);
-- 
2.25.1

