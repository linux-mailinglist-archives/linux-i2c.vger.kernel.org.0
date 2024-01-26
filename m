Return-Path: <linux-i2c+bounces-1455-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5124E83D55F
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 10:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F377E2829A5
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 09:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0226860DF0;
	Fri, 26 Jan 2024 07:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4GoqyJB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267C860DD9;
	Fri, 26 Jan 2024 07:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706255660; cv=none; b=G9pekEWU053Jp4rTjiTUK3kn5hnsjalWQS4kreKpUZ4UVOj8BT/Ilml7y9kbj2PBVyLwikyIin1azvy/FNVYmRY008bSvjdO/2Qjze9IlUxPwcITQHyW2D9bDXissrdFwWys3SYQKu3WoRX7D+EavotndUSIlx32w3oOZiSrezI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706255660; c=relaxed/simple;
	bh=QLy8rpo2aFsGYgPaUJyeJri3tfhTGpJbxguMHRvE5CI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gMJEBVEBEKMuSGmvoV8Gjhvq7YVEz09f525JfMUt2pWf3QKdCNMn4VPVRB7dPrvInUe9O/6ethjQhXiOsoeekNoOmCipzQiJYN8Rn1SvMRBKDvXeIIfVbbiRZ/HvjNzYroF/HqqxkYgwvcFtOSh5gKJIHRqdK4lSppdD3C3nQqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4GoqyJB; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2906dffd8ddso52664a91.3;
        Thu, 25 Jan 2024 23:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706255658; x=1706860458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dm/mOhAhQ5bbbHGtVXUfdjrGHysSZF3OocQtENCWxBc=;
        b=b4GoqyJBfR3lxil1UyEeK31niQJhX/VUE76pIp4T29ipDejxkZ9tsLPsDVlwfLXXBF
         kY0wcqTM9im0sc9JsRdWYn971b6wDFp53CtLcL+MaPXD80oo4ik5/KG+R9bdg+9/xpbI
         IQA3c1omgeEUKHRk21ZG/ZZXnA7wqkQ/mUVCa4IFeyXhr98m9IAy5izPVrMAgoLqNV2u
         QIsNRMvkHnHfBgp+qBdeKYCCLS9pNiD5N8aWLz7hELy1E8eTekRWmT5oEeXGBrfTGk5j
         PsuaT+PBW0pU/IKQNHD4WfBYnS5JIBuhSQEeos+Fw3jRUoSlCGR/GbGvLoOKK7aYYada
         9MQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706255658; x=1706860458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dm/mOhAhQ5bbbHGtVXUfdjrGHysSZF3OocQtENCWxBc=;
        b=eOJ0QVPHCu/8F6n3LDSQZ1Ez0wtpF3ZW2Xnt5AGEi8Inw5Cgz0X5wLDt7Hgd0jc/AZ
         pV634ImLaT+jiWhp9Dtwe1cR7KxX9Gi+XyP7CMH8IBP4tI3SrXGSzabNmk1OF0Qt4Fvx
         8lb0FPnFB6auMM1ol5nlIJDKYtY5Ik5xNQXZ8VoMFJs+B70dSWuyJCJZGoUeU/U3oMuN
         huTY6mUb6eYqO9i2puY1Oo0x44L1/fc6nNdkcLBAoy+6W7GoOxdG4nUNj+0MphpLR90p
         ZTfGS6DWXrrY08O6NRO8WDCfZ+MYV4r0/qAyVOE+ID5UB5DmpQYRjvZhJiCQbqRuD9JW
         0lmg==
X-Gm-Message-State: AOJu0Yxmfw7AG4B8OjFqVw8Mr/XUrq9BHuk4QkUdHLc3dQiyCq42Noo+
	xfgMZRSv3Ke5dAkNZ9YvwF+ZSavIJp1sGzNcIFp22sP9Bdbn9Sul
X-Google-Smtp-Source: AGHT+IGUe3Hh0ORKr8X0RKsET8O24w9Xajdr3omjEIE2knz3aR9eMtfeUnhqPMTxCuuqasjnug8ckw==
X-Received: by 2002:a17:90a:4206:b0:290:cb61:9ea8 with SMTP id o6-20020a17090a420600b00290cb619ea8mr670199pjg.35.1706255658237;
        Thu, 25 Jan 2024 23:54:18 -0800 (PST)
Received: from charles-System-Product-Name.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id mf4-20020a17090b184400b0028cc9afaae9sm638664pjb.34.2024.01.25.23.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 23:54:17 -0800 (PST)
From: Charles Hsu <ythsu0511@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net,
	Delphine_CC_Chiu@Wiwynn.com,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Charles.Hsu@quantatw.com,
	Charles Hsu <ythsu0511@gmail.com>
Subject: [PATCH v1] hwmon: Add driver for MPS MPQ8785 Synchronous Step-Down Converter
Date: Fri, 26 Jan 2024 15:52:13 +0800
Message-Id: <20240126075213.1707572-1-ythsu0511@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for mpq8785 device from Monolithic Power Systems, Inc.
(MPS) vendor. This is synchronous step-down controller.

Signed-off-by: Charles Hsu <ythsu0511@gmail.com>

---
Change in v1:
    Initial patchset.
---
 Documentation/hwmon/index.rst   |  1 +
 Documentation/hwmon/mpq8785.rst | 86 +++++++++++++++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig     |  9 ++++
 drivers/hwmon/pmbus/Makefile    |  1 +
 drivers/hwmon/pmbus/mpq8785.c   | 55 +++++++++++++++++++++
 5 files changed, 152 insertions(+)
 create mode 100644 Documentation/hwmon/mpq8785.rst
 create mode 100644 drivers/hwmon/pmbus/mpq8785.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index c7ed1f73ac06..085ad6ca9b05 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -163,6 +163,7 @@ Hardware Monitoring Kernel Drivers
    mp2975
    mp5023
    mp5990
+   mpq8785
    nct6683
    nct6775
    nct7802
diff --git a/Documentation/hwmon/mpq8785.rst b/Documentation/hwmon/mpq8785.rst
new file mode 100644
index 000000000000..d8afdf875518
--- /dev/null
+++ b/Documentation/hwmon/mpq8785.rst
@@ -0,0 +1,86 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Kernel driver mpq8785
+=======================
+
+Supported chips:
+
+  * MPS MPQ8785
+
+    Prefix: 'mpq8785'
+
+Author: Charles Hsu <ythsu0511@gmail.com>
+
+Description
+-----------
+
+The MPQ8785 is a fully integrated, PMBus-compatible, high-frequency, synchronous
+buck converter. The MPQ8785 offers a very compact solution that achieves up to
+40A output current per phase, with excellent load and line regulation over a
+wide input supply range. The MPQ8785 operates at high efficiency over a wide
+output current load range.
+
+The PMBus interface provides converter configurations and key parameters
+monitoring.
+
+The MPQ8785 adopts MPS's proprietary multi-phase digital constant-on-time (MCOT)
+control, which provides fast transient response and eases loop stabilization.
+The MCOT scheme also allows multiple MPQ8785 devices to be connected in parallel
+with excellent current sharing and phase interleaving for high-current
+applications.
+
+Fully integrated protection features include over-current protection (OCP),
+over-voltage protection (OVP), under-voltage protection (UVP), and
+over-temperature protection (OTP).
+
+The MPQ8785 requires a minimal number of readily available, standard external
+components, and is available in a TLGA (5mmx6mm) package.
+
+Device compliant with:
+
+- PMBus rev 1.3 interface.
+
+The driver exports the following attributes via the 'sysfs' files
+for input voltage:
+
+**in1_input**
+
+**in1_label**
+
+**in1_max**
+
+**in1_max_alarm**
+
+**in1_min**
+
+**in1_min_alarm**
+
+The driver provides the following attributes for output voltage:
+
+**in2_input**
+
+**in2_label**
+
+**in2_alarm**
+
+The driver provides the following attributes for output current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_alarm**
+
+**curr1_max**
+
+The driver provides the following attributes for temperature:
+
+**temp1_input**
+
+**temp1_max**
+
+**temp1_max_alarm**
+
+**temp1_crit**
+
+**temp1_crit_alarm**
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 294808f5240a..557ae0c414b0 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -377,6 +377,15 @@ config SENSORS_MPQ7932
 	  This driver can also be built as a module. If so, the module will
 	  be called mpq7932.
 
+config SENSORS_MPQ8785
+	tristate "MPS MPQ8785"
+	help
+	  If you say yes here you get hardware monitoring functionality support
+	  for power management IC MPS MPQ8785.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mpq8785.
+
 config SENSORS_PIM4328
 	tristate "Flex PIM4328 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index cf8a76744545..f14ecf03ad77 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
 obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
 obj-$(CONFIG_SENSORS_MPQ7932)	+= mpq7932.o
+obj-$(CONFIG_SENSORS_MPQ8785)	+= mpq8785.o
 obj-$(CONFIG_SENSORS_PLI1209BC)	+= pli1209bc.o
 obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
 obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
new file mode 100644
index 000000000000..a0ebdb1b48b2
--- /dev/null
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for MPS MPQ8785 Step-Down Converter
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info mpq8785_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_VOLTAGE_IN] = 4,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 1,
+	.m[PSC_CURRENT_OUT] = 16,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = 0,
+	.m[PSC_TEMPERATURE] = 1,
+	.b[PSC_TEMPERATURE] = 0,
+	.R[PSC_TEMPERATURE] = 0,
+	.func[0] =
+		PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+};
+
+static int mpq8785_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &mpq8785_info);
+}
+
+static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
+	{ .compatible = "mps,mpq8785", },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, mpq8785_of_match);
+
+static struct i2c_driver mpq8785_driver = {
+	.driver = {
+		   .name = "mpq8785",
+		   .of_match_table = of_match_ptr(mpq8785_of_match),
+	},
+	.probe_new = mpq8785_probe,
+};
+
+module_i2c_driver(mpq8785_driver);
+
+MODULE_AUTHOR("Charles Hsu <ythsu0511@gmail.com>");
+MODULE_DESCRIPTION("MPQ8785 PMIC regulator driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


