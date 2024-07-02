Return-Path: <linux-i2c+bounces-4576-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 642EC923D2C
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 14:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 893FC1C22DD0
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 12:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5F515D5BE;
	Tue,  2 Jul 2024 12:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="elyF1KT0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sonic307-32.consmr.mail.ir2.yahoo.com (sonic307-32.consmr.mail.ir2.yahoo.com [87.248.110.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DBE15CD55
	for <linux-i2c@vger.kernel.org>; Tue,  2 Jul 2024 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719921914; cv=none; b=A0wKUzR9g3Vwqgb7L7hgaR8jWZE5rCEgi0/xyhzoiEXRPnwpQ/2InGUY/aSIRA5t0vEHV9nDBdgCOhzagNJFHGPPzKm0b4qH5zPJ+2Ypcvg/QOmcSs4YSqGVyBeaEAYf9Vdl+cy2ZH8yqmvBsSQEjJbZq24TO4ZZsnSwdrt7+jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719921914; c=relaxed/simple;
	bh=Ls+kWqkmPYC9fXCx3BsyLBj5i5X5oE0yDiJ+q6P3lTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ru26Whc6d049xbSWWSE24TPRa6md8DdrXQZpLHZ0Vcq8zpAGT5Xb9uyGOxHItow4AOFa3dLZC/dmQyoZ9mBSENTp51dMxKGZRpKukcM3Wbzqg5nuB2S25Rmyxj3MOn2V1etO7xPjtdg8fR46Ib0EfahodbgSr2+IpqCFCOyOZ9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=elyF1KT0; arc=none smtp.client-ip=87.248.110.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1719921911; bh=piFo6kVJpzA1iUlh3d7Pz7pUkjn8r3+RtA1bJk6PcTo=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=elyF1KT0qF0WIVFyyYYEr6ShsUA9Ak3h1ZTVp/1uyaD6+ubqqHxOgNFzb5JEhfR6pwkesu9e1w+fD3HJj9kVMRXzICmR5cuNMgsVqCsWLqZpFsMb5k4c9qXsJQ8wrRwF0FKCRT08qVfIiiBkEeSRZWXuOOx3ALWOfACpAIRjmzMJxx9FGFb7YAq9VMIeo7fJ9grX/YIR2rXIP43HwmdNyL8AbSwtMAuZqJKLLwfpUAfF+u4Pw2U2yfPGkBigJaJCHj92pF+mgXL2uv9D2IrmcJu6luYoL8mOp/37CdClNgRGWFoxAYvcLp6s/wAJ8YKDQ+CU+oDosT5r+Z41vsTDvA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1719921911; bh=Q813vJH2CeIg8AcnPmzT9PiB1vGcazxmpbR7cBLx66V=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=HZCL+bfXTD5VXc54YdeCClghYTKqzRr9q3465wOe+/lStiSEveW2YzALzr2S0ti3RrzHXR8HEDWelp+oC5aM8BDw7IsHNT0/uSuvyPFPdx2lEhbuT4SRDk1/6/PZuS9SnM4bLQFAhBIiT6zJHhw0LKF/8dKdTXLIhftzeuHR1TltEIL8L9AD4mT8zCUaZas5ULS4W/fJwWN+o/ow6ItKS9OhcUqQ20d0YSkgqHaJXQeVWqw+6rJzaEdg45A0ct7fEYJZ4NQTU+tRGWuG+K81ntXVmvbX1qp0z435W4YWL86NabKcicoCe58OOVAMXecw3OHxB3s5qgvZoA2bKNNZIA==
X-YMail-OSG: XXrJWC4VM1kyTMyKk2ETAPXKEvZN39xeGuWW_IdHVeN9SXqmLVo_c9AnAtK._LZ
 TA_tlMlCpn38A9Utme2QodYCbhp4ui4JbFR4SHZwECru.KhVZ.JrXTJcJs6t4g3GkG8C_0DYxBKc
 jWxKVd2.BGN1lNFUoaVmIa2CjyGtR2cDFJgznC4DAjoLffjWxlzhnhgagg.QWP4O3xFYF4sYjyaB
 .9fWdNfGT9uoE._VHBOiFECy85s1oHRoV4lg0Il0.mwygTu9qOZTEkkkgvHbiWtvltjAr6nNmnnE
 x3fqepYOOztmLwUsRMLR_d68lg4qCaQWYU4.iJPVzqU1cXV1mesU6OLOM8CcG6bOTVEULP0es5IJ
 CCHf5_xfs4SsOK7y_qoCMTwj5TXgNXO6v7tl4ziLYS0ZmrIuZnLk6S513JyVAzuRGZzN086At.34
 3j7ahfmzqeB.4vkRgxpJizJaPFggi9rmieTLdyzFI.HkueGynjvTtBslbW_tGTAlPfpM.fUc_.Q3
 Bqzm.gcUGt5bf4ApHRWjd8pbN4NGfTOZ3bUbKE4s1lSEbUm5ATaGQVwkZEosNTeOq5vpOZfL047F
 qJEm5datQxd6F2H1D6jG7soep8V7z3UcomrXp4RkdcxMosVeHn8oN1IkKJOolUX8gQeuIuAPMzr8
 bhr9xi4qnFGYNXyRkHI8tJZV_fTpHIjCSG34rBAcq9RR4kjYUm4JmTT0UhrXwyLfVp0UVP_cO3v7
 YDnrHvgETL_foep8rHMliYzEBvfp1TX_Xu4PoTyvyIwGufuzk6dtpstUIFu6loPV4N7wpLAGOQq_
 wCW1rOGIAo0eRXaJgubgpC2fGoMcYRw3WFsOc.DZ0BOKANipLVrnYAMtwsH4.oM1WLWEMo2icgUn
 0hirA.c8t9oHvNOLefjTZ_XIwjTBuHd8LcpXg3a4RQ6_xuDvSJZIKtrTzmE2RtSZT0nQcZHqMEZZ
 T2RI6ITjkQDwonwb1JY3RHSeSjIuJ3pKq1LlfSYzF3M9ItonFY3fpqJKnytWoXshDokKR18YnzQb
 dXzhYUyd.BtcBNYJMJY_JYQKeBdqxL1PmnYGboDmX_3pYMcZk_hYjiPQYQO9skAuWxm_I9..81uH
 J.yey_tgdoeLdDaUym2CqunAgA_hkDDXt8RuN.pi4LygWgOaipYIVDdjHsr1SPZUCvGnhbwDG5Nz
 ZjLTBrEEJTQf9guXVThMbf1wOZ6Elu4g0PMNSukwFDkz5PT7wzF03JITYkF8bzOCBLD8GUoUGi1w
 bGbhpJRx3ppj0zdddRmjm.yOhZEPKpNw93Z3u98n.zQsh2tb9NSa1Pa1iebwRfi.x.ra6zbWbJzp
 nRv2C7zvZeqgHNIl2O1qX5qTwXTTbVNwcPcpsvlbYriQct32lqt7P5wzWxDJH9Ym882VOrkURy3_
 4gnZ_I8xaMq2Jy1F44liqGpn.K_QPhzMyMO2nPh4FJJqrNbvbOLvn49TEVr3ZLyelqm6BDw30yUP
 KqVNyo0BQOe8x0Z_4KVJuM.tAkfk1e2.kJrDezIXO0xz1LQUHBVtc66_003d9HthFAI2_AyDyfD2
 Ts3I2dDQtIkA0kylfn6q3B83wB_9bFQyNtsQKqjRYw7mkMrxDTKE9L1FsRw_FQKBqN4tWXxnW4PU
 Vpxi9NPsSIk6oBoR2aF5x4yfYQLX5WErj_gHEmnUvo.gctzXQQUbLg9325CSWg6GjGgs2.vP1s5T
 sMbr4Vhv2owgeyq6UJ6epF15nnOu5e9uG4KvVvpwxnb2J2IYMFFWcbVyfy8de9r05DLUMeqVVsUW
 qRo6SuX.dH6CNVb2me8YppO3vd0HbJfz85qb3pX9rzxF1uq5hbinZhWhKgyW8gcONgNKbvjgFtvF
 DyiLIkh4oC2IzzTKXNLqPAiohYmwkkzpWczz47d5foxLGKy36vDo.QTAnvC8qKFg8jdGgWDvnolu
 rbC.LXIbje6hWMtvXuw2Bi1WMHFqmHOMI1n8734QO9Rj7Kga3mrDt_CZXYOsBTzG_WoWZU894XDm
 n02HiWJ1M9Rgm6qs83o4HzejsFWhrzYZngHPtaFY4I90uzF_B_.8nssJa8waGzeDY9yRE7bxSGfP
 atsY7sbyRbq18TLFswNbpC79v03YumL0mZPpagcJaSChlxu_hGyNdc5Hm1mVEED4OOjY7NXuJldO
 VqYXyki1MvZYzuKy8Nrsen32gHdB8kxSnr_O2ikH4Urp_4qWnG2LKABHBYJk-
X-Sonic-MF: <xzeol@yahoo.com>
X-Sonic-ID: 910b7ae8-af15-475f-b388-310fe9ce7846
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Tue, 2 Jul 2024 12:05:11 +0000
Received: by hermes--production-ir2-85cf877599-mvt7h (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 0dd9cec1d13f3a8113ebc66190b2d374;
          Tue, 02 Jul 2024 11:53:01 +0000 (UTC)
From: Alex Vdovydchenko <xzeol@yahoo.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Alex Vdovydchenko <xzeol@yahoo.com>
Subject: [PATCH v4 2/2] hwmon: add MP5920 driver
Date: Tue,  2 Jul 2024 14:52:51 +0300
Message-ID: <20240702115252.981416-3-xzeol@yahoo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702115252.981416-1-xzeol@yahoo.com>
References: <20240702115252.981416-1-xzeol@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for MPS Hot-Swap controller mp5920. This driver exposes
telemetry and limit value readings and writings.

Signed-off-by: Alex Vdovydchenko <xzeol@yahoo.com>
---
 Documentation/hwmon/index.rst  |  1 +
 Documentation/hwmon/mp5920.rst | 91 +++++++++++++++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig    |  9 ++++
 drivers/hwmon/pmbus/Makefile   |  1 +
 drivers/hwmon/pmbus/mp5920.c   | 93 ++++++++++++++++++++++++++++++++++
 5 files changed, 195 insertions(+)
 create mode 100644 Documentation/hwmon/mp5920.rst
 create mode 100644 drivers/hwmon/pmbus/mp5920.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index e92a3d5c7..9eba7e402 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -168,6 +168,7 @@ Hardware Monitoring Kernel Drivers
    mp2975
    mp2993
    mp5023
+   mp5920
    mp5990
    mp9941
    mpq8785
--- /dev/null
+++ b/Documentation/hwmon/mp5920.rst
@@ -0,0 +1,91 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp5920
+====================
+
+Supported chips:
+
+  * MPS MP5920
+
+    Prefix: 'mp5920'
+
+  * Datasheet
+
+    Publicly available at the MPS website : https://www.monolithicpower.com/en/mp5920.html
+
+Authors:
+
+	Tony Ao <tony_ao@wiwynn.com>
+	Alex Vdovydchenko <xzeol@yahoo.com>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+MP5920 Hot-Swap Controller.
+
+Device compliant with:
+
+- PMBus rev 1.3 interface.
+
+Device supports direct and linear format for reading input voltage,
+output voltage, output current, input power and temperature.
+
+The driver exports the following attributes via the 'sysfs' files
+for input voltage:
+
+**in1_input**
+
+**in1_label**
+
+**in1_rated_max**
+
+**in1_rated_min**
+
+**in1_crit**
+
+**in1_alarm**
+
+The driver provides the following attributes for output voltage:
+
+**in2_input**
+
+**in2_label**
+
+**in2_rated_max**
+
+**in2_rated_min**
+
+**in2_alarm**
+
+The driver provides the following attributes for output current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_crit**
+
+**curr1_alarm**
+
+**curr1_rated_max**
+
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
+
+**power1_max**
+
+**power1_rated_max**
+
+The driver provides the following attributes for temperature:
+
+**temp1_input**
+
+**temp1_max**
+
+**temp1_crit**
+
+**temp1_alarm**
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -371,6 +371,15 @@ config SENSORS_MP5023
 	  This driver can also be built as a module. If so, the module will
 	  be called mp5023.
 
+config SENSORS_MP5920
+	tristate "MPS MP5920"
+	help
+	  If you say yes here you get hardware monitoring support for Monolithic
+	  MP5920.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mp5920.
+
 config SENSORS_MP5990
 	tristate "MPS MP5990"
 	help
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_MP2993)	+= mp2993.o
 obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
+obj-$(CONFIG_SENSORS_MP5920)	+= mp5920.o
 obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
 obj-$(CONFIG_SENSORS_MP9941)	+= mp9941.o
 obj-$(CONFIG_SENSORS_MPQ7932)	+= mpq7932.o
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp5920.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info mp5920_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_VOLTAGE_IN] = 2266,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = -1,
+	.m[PSC_VOLTAGE_OUT] = 2266,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = -1,
+	.m[PSC_CURRENT_OUT] = 546,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = -2,
+	.m[PSC_POWER] = 5840,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = -3,
+	.m[PSC_TEMPERATURE] = 1067,
+	.b[PSC_TEMPERATURE] = 20500,
+	.R[PSC_TEMPERATURE] = -2,
+	.func[0] = PMBUS_HAVE_VIN  | PMBUS_HAVE_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT |
+		PMBUS_HAVE_TEMP,
+};
+
+static int mp5920_probe(struct i2c_client *client)
+{
+	struct device *dev =  &client->dev;
+	int ret;
+	u8 buf[I2C_SMBUS_BLOCK_MAX];
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_READ_WORD_DATA))
+		return -ENODEV;
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read PMBUS_MFR_MODEL\n");
+
+	if (ret != 6 || strncmp(buf, "MP5920", 6)) {
+		return dev_err_probe(dev, -ENODEV, "Model '%.*s' not supported\n",
+				     sizeof(buf), buf);
+	}
+
+	return pmbus_do_probe(client, &mp5920_info);
+}
+
+static const struct of_device_id mp5920_of_match[] = {
+	{ .compatible = "mps,mp5920" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, mp5920_of_match);
+
+static const struct i2c_device_id mp5920_id[] = {
+	{ "mp5920" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(i2c, mp5920_id);
+
+static struct i2c_driver mp5920_driver = {
+	.driver = {
+		.name = "mp5920",
+		.of_match_table = mp5920_of_match,
+	},
+	.probe = mp5920_probe,
+	.id_table = mp5920_id,
+};
+
+module_i2c_driver(mp5920_driver);
+
+MODULE_AUTHOR("Tony Ao <tony_ao@wiwynn.com>");
+MODULE_AUTHOR("Alex Vdovydchenko <xzeol@yahoo.com>");
+MODULE_DESCRIPTION("PMBus driver for MP5920 HSC");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.43.0


