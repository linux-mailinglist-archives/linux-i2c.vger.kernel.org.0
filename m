Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B439949B45A
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 13:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344089AbiAYMxl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 07:53:41 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:30303 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384068AbiAYMuv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jan 2022 07:50:51 -0500
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JjmsL6HhnzbkBp;
        Tue, 25 Jan 2022 20:49:58 +0800 (CST)
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
Subject: [PATCH 2/2] i2c: designware: Add ACPI assisted recovery support
Date:   Tue, 25 Jan 2022 20:49:30 +0800
Message-ID: <20220125124930.50369-3-yangyicong@hisilicon.com>
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

On HiSilicon Kunpeng 920 the SCL/SDA pins are multiplexed with
GPIO. On bus recovery the driver needs to swich the pin mux
to GPIO to recover and switch back on finished. Currently the
pin mux switch is generally implemented by a pinctrl driver
which is unavailable on our platform.

This patch introduces an ACPI method to switch the pin mux of
SCL/SDA during the recovery process. Then the recovery support
can be enabled with the assistance of the ACPI.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/i2c/busses/i2c-designware-core.h    |  2 +
 drivers/i2c/busses/i2c-designware-master.c  | 84 ++++++++++++++++++++-
 drivers/i2c/busses/i2c-designware-platdrv.c |  6 +-
 3 files changed, 86 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 4b26cba40139..bbf4bb9c9d0f 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -297,6 +297,8 @@ struct dw_i2c_dev {
 
 #define ACCESS_INTR_MASK	BIT(0)
 #define ACCESS_NO_IRQ_SUSPEND	BIT(1)
+/* ACPI assists SCL/SDA pin mutiplexing on recovery */
+#define RECOVERY_WITH_ACPI	BIT(2)
 
 #define MODEL_MSCC_OCELOT	BIT(8)
 #define MODEL_BAIKAL_BT1	BIT(9)
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 9177463c2cbb..89fdbc48b4a9 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -818,11 +818,81 @@ static void i2c_dw_unprepare_recovery(struct i2c_adapter *adap)
 	i2c_dw_init_master(dev);
 }
 
+#ifdef CONFIG_ACPI
+#include <linux/acpi.h>
+
+/*
+ * i2c_dw_acpi_pin_mux_change - Change the I2C controller's pin mux through ACPI
+ * @dev: device owns the SCL/SDA pin
+ * @to_gpio: true to switch to GPIO, false to switch to SCL/SDA
+ *
+ * The function invokes the specific ACPI method "PMUX" for changing the
+ * pin mux of I2C controller between SCL/SDA and GPIO. It's not defined by
+ * the ACPI spec but used on some platforms like HiSilicon's Kunpeng 920
+ * server, help on the generic GPIO recovery process.
+ */
+static void i2c_dw_acpi_pin_mux_change(struct device *dev, bool to_gpio)
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
+	acpi_evaluate_integer(handle, "PMUX", &arg_list, &data);
+}
+
+static void i2c_dw_acpi_prepare_recovery(struct i2c_adapter *adap)
+{
+	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	i2c_dw_prepare_recovery(adap);
+	i2c_dw_acpi_pin_mux_change(dev->dev, true);
+}
+
+static void i2c_dw_acpi_unprepare_recovery(struct i2c_adapter *adap)
+{
+	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	i2c_dw_acpi_pin_mux_change(dev->dev, false);
+	i2c_dw_unprepare_recovery(adap);
+}
+
+static int i2c_dw_acpi_init_recovery_info(struct dw_i2c_dev *dev)
+{
+	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
+	struct acpi_device *adev;
+
+	if (acpi_disabled)
+		return -EOPNOTSUPP;
+
+	adev = ACPI_COMPANION(dev->dev);
+	if (!adev || !acpi_has_method(adev->handle, "PMUX"))
+		return -EOPNOTSUPP;
+
+	rinfo->recover_bus = i2c_generic_scl_recovery;
+	rinfo->prepare_recovery = i2c_dw_acpi_prepare_recovery;
+	rinfo->unprepare_recovery = i2c_dw_acpi_unprepare_recovery;
+
+	return 0;
+}
+#else
+static int i2c_dw_acpi_init_recovery_info(struct dw_i2c_dev *dev)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 {
 	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
 	struct i2c_adapter *adap = &dev->adapter;
 	struct gpio_desc *gpio;
+	int ret = 0;
 
 	gpio = devm_gpiod_get_optional(dev->dev, "scl", GPIOD_OUT_HIGH);
 	if (IS_ERR_OR_NULL(gpio))
@@ -835,9 +905,17 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 		return PTR_ERR(gpio);
 	rinfo->sda_gpiod = gpio;
 
-	rinfo->recover_bus = i2c_generic_scl_recovery;
-	rinfo->prepare_recovery = i2c_dw_prepare_recovery;
-	rinfo->unprepare_recovery = i2c_dw_unprepare_recovery;
+	if (dev->flags & RECOVERY_WITH_ACPI) {
+		ret = i2c_dw_acpi_init_recovery_info(dev);
+	} else {
+		rinfo->recover_bus = i2c_generic_scl_recovery;
+		rinfo->prepare_recovery = i2c_dw_prepare_recovery;
+		rinfo->unprepare_recovery = i2c_dw_unprepare_recovery;
+	}
+
+	if (ret)
+		return ret;
+
 	adap->bus_recovery_info = rinfo;
 
 	dev_info(dev->dev, "running with gpio recovery mode! scl%s",
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 2bd81abc86f6..a7070867a07f 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -52,9 +52,9 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ "AMDI0010", ACCESS_INTR_MASK },
 	{ "AMDI0510", 0 },
 	{ "APMC0D0F", 0 },
-	{ "HISI02A1", 0 },
-	{ "HISI02A2", 0 },
-	{ "HISI02A3", 0 },
+	{ "HISI02A1", RECOVERY_WITH_ACPI },
+	{ "HISI02A2", RECOVERY_WITH_ACPI },
+	{ "HISI02A3", RECOVERY_WITH_ACPI },
 	{ "HYGO0010", ACCESS_INTR_MASK },
 	{ }
 };
-- 
2.24.0

