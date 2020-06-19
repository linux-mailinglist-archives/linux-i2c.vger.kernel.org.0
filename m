Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F151200B44
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jun 2020 16:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732960AbgFSOVS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Jun 2020 10:21:18 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:61199 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbgFSOVS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Jun 2020 10:21:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1592576477; x=1624112477;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3BtD5L3rMhtF3jyJknfwtkcX+XE7ha/UluG4TWeRxaw=;
  b=Mn15hx3N5/9IGF9wr2FvpJr3D6IrIVs9z7A5VVH61VywNWB6hy45T6VF
   qAzi+Mu6DhaCs1/SkEBSSSQNq2ku6lqEZvBJFKl1D4rSLVUMZDfpALUtf
   7SgWASt8l69r+HvmRBZN9YYv0j16OMrcdiRZknPqlGLLLngrON7Omr1Um
   Ibdqm5fgpXQnfCNFF9Svv4aw9frLPvYSWiAko2iKq1z3kYfCO7mQRxcwt
   CYXilG6kkw66uLTAU/XAvQ9CBM0ImShEDp0SaLojU75P9e2e+WeIbMe38
   SDzCkAzZm0+9ruPbSsP9AKzE2dMqnxr4VxzZ09wVZg9ajeI5h1Lz12Cu4
   A==;
IronPort-SDR: HV6dEpbtUq+XD8J583MyFjaZ+S535NSfzgjI4q2aQPHzybz7UYYq8eZN22CSVxtjY934ZZ6Xvu
 vE+LBrbAwAmg1j6QgSVDjPe29c6Y6sSqV+IaTVhN2R/8XetfvWpnJikubh17gmKkQjz6iCWvf5
 OEaLaQWLSWfvzMRA/OZwFfaKgEHgvf7b4XjltHk3ab1MjaT/N69oKEc99eABmrF1r85Y4tlp0h
 svM+gyICrPYGEKyfcZzfw34m9bM0lSxcJ0H05EHep0zJEBFgo+s9n2G6SazhoOBkB/MqWdPSID
 zsI=
X-IronPort-AV: E=Sophos;i="5.75,255,1589266800"; 
   d="scan'208";a="79101030"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jun 2020 07:21:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 19 Jun 2020 07:21:09 -0700
Received: from rob-ult-m19940.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 19 Jun 2020 07:20:36 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <wsa@kernel.org>, <robh+dt@kernel.org>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [RFC PATCH 3/4] i2c: core: treat EPROBE_DEFER when acquiring SCL/SDA GPIOs
Date:   Fri, 19 Jun 2020 17:19:03 +0300
Message-ID: <20200619141904.910889-4-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
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
 drivers/i2c/i2c-core-base.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 4ee29fec4e93..f8d9f2048ca8 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -368,15 +368,16 @@ static int i2c_gpio_init_recovery(struct i2c_adapter *adap)
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
@@ -392,7 +393,7 @@ static void i2c_init_recovery(struct i2c_adapter *adap)
 			if (gpiod_get_direction(bri->sda_gpiod) == 0)
 				bri->set_sda = set_sda_gpio_value;
 		}
-		return;
+		return 0;
 	}
 
 	if (bri->recover_bus == i2c_generic_scl_recovery) {
@@ -407,10 +408,12 @@ static void i2c_init_recovery(struct i2c_adapter *adap)
 		}
 	}
 
-	return;
+	return 0;
  err:
 	dev_err(&adap->dev, "Not using recovery: %s\n", err_str);
 	adap->bus_recovery_info = NULL;
+
+	return 0;
 }
 
 static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
@@ -1476,7 +1479,9 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 			 "Failed to create compatibility class link\n");
 #endif
 
-	i2c_init_recovery(adap);
+	res = i2c_init_recovery(adap);
+	if (res == -EPROBE_DEFER)
+		goto out_link;
 
 	/* create pre-declared device nodes */
 	of_i2c_register_devices(adap);
@@ -1493,6 +1498,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 
 	return 0;
 
+out_link:
+#ifdef CONFIG_I2C_COMPAT
+	class_compat_remove_link(i2c_adapter_compat_class, &adap->dev,
+				 adap->dev.parent);
+#endif
 out_reg:
 	init_completion(&adap->dev_released);
 	device_unregister(&adap->dev);
-- 
2.25.1

