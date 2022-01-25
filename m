Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5343449B45C
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 13:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349650AbiAYMxm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 07:53:42 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:32119 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384060AbiAYMuv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jan 2022 07:50:51 -0500
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Jjmpw0gvVz8wNC;
        Tue, 25 Jan 2022 20:47:52 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 25 Jan 2022 20:50:48 +0800
From:   Yicong Yang <yangyicong@hisilicon.com>
To:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <yangyicong@hisilicon.com>, <prime.zeng@hisilicon.com>,
        <linuxarm@huawei.com>
Subject: [PATCH 1/2] i2c: hisi: Add generic GPIO bus recovery support
Date:   Tue, 25 Jan 2022 20:49:29 +0800
Message-ID: <20220125124930.50369-2-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220125124930.50369-1-yangyicong@hisilicon.com>
References: <20220125124930.50369-1-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add generic GPIO bus recovery support for i2c-hisi driver
by registering the recovery information with core provided
i2c_generic_scl_recovery() method.

As the SCL/SDA pins are multiplexed with GPIO, we need to
switch the pins mux to GPIO before recovery and switch back
after recovery. It's implemented by the ACPI method in
the i2c_bus_recovery_info->{prepare,unprepare}_recovery()
method.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/i2c/busses/i2c-hisi.c | 78 +++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
index acf394812061..ffc495f426e9 100644
--- a/drivers/i2c/busses/i2c-hisi.c
+++ b/drivers/i2c/busses/i2c-hisi.c
@@ -5,9 +5,11 @@
  * Copyright (c) 2021 HiSilicon Technologies Co., Ltd.
  */
 
+#include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/bitfield.h>
 #include <linux/completion.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -106,6 +108,9 @@ struct hisi_i2c_controller {
 	struct i2c_timings t;
 	u32 clk_rate_khz;
 	u32 spk_len;
+
+	/* Bus recovery method */
+	struct i2c_bus_recovery_info rinfo;
 };
 
 static void hisi_i2c_enable_int(struct hisi_i2c_controller *ctlr, u32 mask)
@@ -424,6 +429,77 @@ static void hisi_i2c_configure_bus(struct hisi_i2c_controller *ctlr)
 	writel(reg, ctlr->iobase + HISI_I2C_FIFO_CTRL);
 }
 
+#ifdef CONFIG_ACPI
+#define HISI_I2C_PIN_MUX_METHOD	"PMUX"
+
+/**
+ * i2c_dw_acpi_pin_mux_change - Change the I2C controller's pin mux through ACPI
+ * @dev: device owns the SCL/SDA pin
+ * @to_gpio: true to switch to GPIO, false to switch to SCL/SDA
+ *
+ * The function invokes the specific ACPI method "PMUX" for changing the
+ * pin mux of I2C controller between SCL/SDA and GPIO in order to help on
+ * the generic GPIO recovery process.
+ */
+static void i2c_hisi_pin_mux_change(struct device *dev, bool to_gpio)
+{
+	acpi_handle handle = ACPI_HANDLE(dev);
+	struct acpi_object_list arg_list;
+	unsigned long long data;
+	union acpi_object arg;
+
+	arg.type = ACPI_TYPE_INTEGER;
+	arg.integer.value = to_gpio;
+	arg_list.count = 1;
+	arg_list.pointer = &arg;
+
+	acpi_evaluate_integer(handle, HISI_I2C_PIN_MUX_METHOD, &arg_list, &data);
+}
+
+static void i2c_hisi_prepare_recovery(struct i2c_adapter *adap)
+{
+	struct hisi_i2c_controller *ctlr = i2c_get_adapdata(adap);
+
+	i2c_hisi_pin_mux_change(ctlr->dev, true);
+}
+
+static void i2c_hisi_unprepare_recovery(struct i2c_adapter *adap)
+{
+	struct hisi_i2c_controller *ctlr = i2c_get_adapdata(adap);
+
+	i2c_hisi_pin_mux_change(ctlr->dev, false);
+}
+
+static void hisi_i2c_init_recovery_info(struct hisi_i2c_controller *ctlr)
+{
+	struct i2c_bus_recovery_info *rinfo = &ctlr->rinfo;
+	struct acpi_device *adev = ACPI_COMPANION(ctlr->dev);
+	struct gpio_desc *gpio;
+
+	if (!acpi_has_method(adev->handle, HISI_I2C_PIN_MUX_METHOD))
+		return;
+
+	gpio = devm_gpiod_get_optional(ctlr->dev, "scl", GPIOD_OUT_HIGH);
+	if (IS_ERR_OR_NULL(gpio))
+		return;
+
+	rinfo->scl_gpiod = gpio;
+
+	gpio = devm_gpiod_get_optional(ctlr->dev, "sda", GPIOD_IN);
+	if (IS_ERR(gpio))
+		return;
+
+	rinfo->sda_gpiod = gpio;
+	rinfo->recover_bus = i2c_generic_scl_recovery;
+	rinfo->prepare_recovery =  i2c_hisi_prepare_recovery;
+	rinfo->unprepare_recovery = i2c_hisi_unprepare_recovery;
+
+	ctlr->adapter.bus_recovery_info = rinfo;
+}
+#else
+static inline void hisi_i2c_init_recovery_info(struct hisi_i2c_controller *ctlr) { }
+#endif /* CONFIG_ACPI */
+
 static int hisi_i2c_probe(struct platform_device *pdev)
 {
 	struct hisi_i2c_controller *ctlr;
@@ -473,6 +549,8 @@ static int hisi_i2c_probe(struct platform_device *pdev)
 	adapter->dev.parent = dev;
 	i2c_set_adapdata(adapter, ctlr);
 
+	hisi_i2c_init_recovery_info(ctlr);
+
 	ret = devm_i2c_add_adapter(dev, adapter);
 	if (ret)
 		return ret;
-- 
2.24.0

