Return-Path: <linux-i2c+bounces-3901-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D06C38FFED3
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 11:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2B7C1C21567
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 09:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D466E15B972;
	Fri,  7 Jun 2024 09:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="YHJ3h+ek"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn2037.outbound.protection.outlook.com [40.92.107.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66246158D6C;
	Fri,  7 Jun 2024 09:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.107.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717751215; cv=fail; b=eCpnBU++dD963EmoQXWkBcwlRmRLmPzRS0fkCRiF4+lmOHXaMYw1a7UZYHUp3fZlQzkAoxqLw9DaEDAe8gIeHASmCGjjV7e+wKRHxSSjelmzhl3V3W9EHBGDTxJCj7qZzD+D3l8v9YO7eoYfhn3uNDXALBTUog2aOHkhaEU/5hA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717751215; c=relaxed/simple;
	bh=xp8bMOAxT+H58OWNOzwZwzzdLQxnsOUpxvaiUxoq0yc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qN3pyGGfW0EIU7EVWtUqTkuemeoIxRr/hB9ia3445GDAy0MdYAvbQe3CHtAWrX9/+mhwwAX7LqYaqO1ePuFH04PSDy9qm1cRAgM765n7XSabPdVfeJwn2UZfqUlqpWnIrSmpzTA2i3Q6Fy9lq0TlPeXxNAjmGopVipR6mZx4TI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=YHJ3h+ek; arc=fail smtp.client-ip=40.92.107.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ay8jX5+w+ugDyrC3JvX8WUFqlVbvxdPJhvA7TMA/71Kg5BRNO3aZcGMb2aa526auJzbcB4Ggdvcvg4BjKnPqnVd6AAXMsc0AKymYoq0XB/r2qslMzzPYcrvZrJug3TfbvxU1oGO2BRVzhNsntvgtNK/EOjZ4VPy/sbl3L5a2FiU+jCFeZmCtPdcGjMJYEGvs1CDiaz7wqT92kBaqLy0C0F5Q/5JijmSt4ki4OTQwpgg7QIdElkG60PWDbgirACNESMJljoVKFsSfmq8mFp7GAvhTyioZggGULdSz8Ed6r06jsx2R8TVWG7cPqvohWBKmSYTNf5G/2/3uTln8DXurOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZkPjW1MqwzBEf8UuAS5JuYZDnN139KgKGNc9FFLCOE=;
 b=ZIgkG6xmYGovTPB+I13Eo49V0nxuR9aOOTNg9WNrMIxDlp3f9/UXiAiRGPcWo18+v9tUotoJI7QkjC2bJ1twJvIT2Asxi/Zy2lcZBAnrafMCrtwsrSDj6Tpf3sHfSjopIDu9E2+wNUOf2TnqBPxWJna97vTOigQCQbesvw/oTqHglk/A/lRZapWI+FXA4XaWMqx5simU4kLaswft/2vnoXwFEVGqFTHiyRuOUmJ3ldOePkFcGy/oc/wU8U7gIIUA1FIpYQtX4DUBTkW8q3Q2AxqPSKQ9Gu89RbrSXwixAjZhApr1jq6rktK9bbyMdzYVK9a1aXcQyDRIXEb6QAuYQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZkPjW1MqwzBEf8UuAS5JuYZDnN139KgKGNc9FFLCOE=;
 b=YHJ3h+ekTEpIPOudZL68F3b7aWc6rmYA/ABWliHBSCkfNIIl6ioGp+fa1EoyrlQsgzR+JtQPtxFN42BdpAWjHqWfSzkh2jCrFLFflbaGnXPVRdxyJ0dTL+tXvBKwiW9yOwA9mN1kB8V3Zf6dLPJjv5LY+vNiJPcINTvkGFzZ6QB9h1Dd3Lb5Uq2C5MbkCog/onj+tkLrXDdTdEhniIXmrsXhUmhy3p8K67C6+Y9+jH/9QzfP6mQeJDwuC4Ld3Bu+fPlh63sSorwh1x8twWAsUYWnlbAcnlzsKPVPSaw3P+dDEyryLa5Z6HBSfJiITCy98tIQpawRWxjdpbt7Sy09iQ==
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com (2603:1096:101:be::7)
 by JH0PR04MB8067.apcprd04.prod.outlook.com (2603:1096:990:94::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 09:06:46 +0000
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5]) by SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5%5]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 09:06:46 +0000
From: Noah Wang <noahwang.wang@outlook.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	linux@roeck-us.net,
	conor+dt@kernel.org,
	jdelvare@suse.com
Cc: corbet@lwn.net,
	Delphine_CC_Chiu@Wiwynn.com,
	peteryin.openbmc@gmail.com,
	javier.carrasco.cruz@gmail.com,
	patrick.rudolph@9elements.com,
	bhelgaas@google.com,
	lukas@wunner.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Noah Wang <noahwang.wang@outlook.com>
Subject: [PATCH 4/4] hwmon: add MP9941 driver
Date: Fri,  7 Jun 2024 17:05:44 +0800
Message-ID:
 <SEYPR04MB6482644FAB35EC76FD0CC26CFAFB2@SEYPR04MB6482.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607090544.466833-1-noahwang.wang@outlook.com>
References: <20240607090544.466833-1-noahwang.wang@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [me4Vy+IMEvVY4qMrTCr81RTS78fh/enW]
X-ClientProxiedBy: TYWP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::12) To SEYPR04MB6482.apcprd04.prod.outlook.com
 (2603:1096:101:be::7)
X-Microsoft-Original-Message-ID:
 <20240607090544.466833-5-noahwang.wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR04MB6482:EE_|JH0PR04MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 130f4199-cc9a-46b1-a5e2-08dc86d1285f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|1602099003|440099019|3412199016|1710799017;
X-Microsoft-Antispam-Message-Info:
	a5Ugx/6yXHNkZx2VVhXNezpqfjV7RhBIU1t+sBcMykGq0sW985/vQMo+3El0XhNj1oWSYlnNu29N4LCLG/V9QgW+8jx1tsGu6RXx9acbU/FErjM8WCWPNXln8DhcF2v4u/L/dh85ird0X/63sVusB2ShjcTxAHvf9YVO4pnXXOzBg5vtfTjw+NOm1zKEplE4FCdE46oe9D+IoFxuXx+QPELwr4L4vXhlzvO+n5W0h9tB1fwv5SCLcD/PjK3Msu3L+YH3fZRB7GlKsu0Ub6TrrbKSj/+oXi4KNnNSEJ/G9VCeamhOrVvrD+ozzCHutbgIauxOHUO0ZZqPzZFVPCJHIWmFrXzpOOKzWLEhkzVO+JzKXkUe79lAOzut42deoZAMGbF0vK1cigGe+X4n42mmcaMKOLNCQ/sh/U+yJS1rpCoyOg3vBGAGrjDPz2e2BuknlBqMSpYVqc0zCtj01RE6qe6xlt9L7nsjRRmdy6QCJY0/IkYKrqR9i2hm20zsBBGLsSnfKT103wKKpn9q0sCbknjSFzb9cnXkD8RiQ8Ex3ZDlKKkUJ5RKbdu2jc0wpSHoOO2Fba38GUGsjEjPkbJxLFhXpeVDZMC5nZRv1oejEyqisgoLzszW0ZmGgegcHoUOVXcmJ5afdPMvJyDdqYD96HwMNw2QLY9jPxJreDMCGrNdr4lBxXFmSu+6wG9E30Z9
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MQ3M/mbG6ib4LXunoSiI/SzMb+x/qA9ykHh86SpaVLjHaaFsZxtP/0LKWLMm?=
 =?us-ascii?Q?kBdUxobw1LG8eY3r+1bmjM3gSOiJv1G9wzalAakUPXsQWKWmCMwiC26a99YO?=
 =?us-ascii?Q?3weCj4ZvZ6B7u+TbY9XTAcSC5O1XXhOhBZvGDuCrt/MywsQMbc/KKY0yXJ5X?=
 =?us-ascii?Q?0eZcriszQ9qAqjtF/OksCxauyQP2ttsV6uWSqFfQLfMUYz482sONW528wTHo?=
 =?us-ascii?Q?KRLUlwIMhIFvh6YcvjOpSAZsk6T27WmEWMsv9bV6MX5GGjIioieBSQwMusMP?=
 =?us-ascii?Q?0gXfc5Bqpiw+Xpy8RdY1oW13AyoNCxTFAdVg7KzPTvcSvwM17IRfmH/QJrtY?=
 =?us-ascii?Q?0tANZj2F58F5JtahDXNJVH7k/T2wZWCr4ecnuiyOb+4YmBuDYIxL2wb6tyrs?=
 =?us-ascii?Q?Dz/N5pOSWd4aJar8iMzEL6YOUPPskD+Yf1wRfLnKRtYvUOdEoFStdSMxF0Pk?=
 =?us-ascii?Q?uI7UcaLF1ZhSY6gws2GTSbnvwaAw6wxZrkew98OsyQzmxYXFf1HSPWnITlCs?=
 =?us-ascii?Q?MjQwzkYn64d3k3j4/Ffx3rrQyLEkAfXDbxhhLff13ERB1qLMHR1xIv3fWzbO?=
 =?us-ascii?Q?Atp6oGnzD+c26FARfMGZdSWDJydvUBPFqOZAT5b8d2NCAQ1KPzsuinLk94bW?=
 =?us-ascii?Q?Nvu1bVmqt0v7SrpL5Q6lWAXGf7KwP5lDXUChWXqF4I5NqQG9PiWm6kqe6AUZ?=
 =?us-ascii?Q?vFH4L2KJlJ0eUIENcGqOLIUgmXO1/7CmzR9IP8xGrFyPNVvIPk6D7ijpGCiw?=
 =?us-ascii?Q?qwQGENJe56IYja4ZmHWPrgdafQIUfxe8xgYxaMACaYiA45inzuxSOPULVWCB?=
 =?us-ascii?Q?LWQxZgMjcb4mTnjCSS4rS8Wuxccz11Xr9nlvH94co3xXh1FAQ6KMrj/xfGT/?=
 =?us-ascii?Q?gqXRZrDeFniFfrQ0b6QMZu5ezRnmkWUDsT9vFPr1U4uS0qoNmjv/KXDXnnSo?=
 =?us-ascii?Q?vK8EUu+9tuRNOgpZBBXCkboM+rvvfMcFtC6dXvN4rNHAb3xVwshjCI/MCxPq?=
 =?us-ascii?Q?LD3sBf9NEiFASbA+agukuGdT7uTMu5D1Q5GjWM8rtFhBMl+CfK3k1JWNg6pL?=
 =?us-ascii?Q?iFEO1vPHZHoi06v+lF09I5bm+VzPoSI7vi5xdVgyAkkMe5HiIxl2xzSptqxn?=
 =?us-ascii?Q?MVw+1s6uRsGrwpBg/RplbyVmRS3DYljLGLSgs14kZZbHUPj2jOG0pnkKmfhF?=
 =?us-ascii?Q?75clY5jTP9g7Cb6+JfwKx73L8I0vfTd3G09i81YELGgi8w3RT/7yS4oYSwxp?=
 =?us-ascii?Q?/1bq6B+UijEcsZvBknEH?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 130f4199-cc9a-46b1-a5e2-08dc86d1285f
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB6482.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 09:06:46.5528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB8067

Add support for MPS step-down converter mp9941. This driver exposes
telemetry and limit value readings and writtings.

Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/mp9941.rst |  92 +++++++++
 MAINTAINERS                    |   7 +
 drivers/hwmon/pmbus/Kconfig    |   9 +
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/mp9941.c   | 328 +++++++++++++++++++++++++++++++++
 6 files changed, 438 insertions(+)
 create mode 100644 Documentation/hwmon/mp9941.rst
 create mode 100644 drivers/hwmon/pmbus/mp9941.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 9d9d55b889f2..9ff8149d9a9d 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -169,6 +169,7 @@ Hardware Monitoring Kernel Drivers
    mp2993
    mp5023
    mp5990
+   mp9941
    mpq8785
    nct6683
    nct6775
diff --git a/Documentation/hwmon/mp9941.rst b/Documentation/hwmon/mp9941.rst
new file mode 100644
index 000000000000..1274fa20e256
--- /dev/null
+++ b/Documentation/hwmon/mp9941.rst
@@ -0,0 +1,92 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp9941
+====================
+
+Supported chips:
+
+  * MPS mp9941
+
+    Prefix: 'mp9941'
+
+  * Datasheet
+    https://scnbwymvp-my.sharepoint.com/:f:/g/personal/admin_scnbwy_com/Eth4kX1_J1hMsaASHiOYL4QBHU5a75r-tRfLKbHnJFdKLQ?e=vxj3DF
+
+Author:
+
+	Noah Wang <noahwang.wang@outlook.com>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+MP9941 digital step-down converter.
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
+**in1_crit**
+
+**in1_crit_alarm**
+
+The driver provides the following attributes for output voltage:
+
+**in2_input**
+
+**in2_label**
+
+**in2_lcrit**
+
+**in2_lcrit_alarm**
+
+**in2_rated_max**
+
+**in2_rated_min**
+
+The driver provides the following attributes for input current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_max**
+
+**curr1_max_alarm**
+
+The driver provides the following attributes for output current:
+
+**curr2_input**
+
+**curr2_label**
+
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
+
+The driver provides the following attributes for output power:
+
+**power2_input**
+
+**power2_label**
+
+The driver provides the following attributes for temperature:
+
+**temp1_input**
+
+**temp1_crit**
+
+**temp1_crit_alarm**
+
+**temp1_max**
+
+**temp1_max_alarm**
diff --git a/MAINTAINERS b/MAINTAINERS
index f47f3e13b004..d4600533a3ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15265,6 +15265,13 @@ F:	drivers/video/backlight/mp3309c.c
 +F:	Documentation/hwmon/mp2993.rst
 +F:	drivers/hwmon/pmbus/mp2993.c
 
++MPS MP9941 DRIVER
++M:	Noah Wang <noahwang.wang@outlook.com>
++L:	linux-hwmon@vger.kernel.org
++S:	Maintained
++F:	Documentation/hwmon/mp9941.rst
++F:	drivers/hwmon/pmbus/mp9941.c
+
 MR800 AVERMEDIA USB FM RADIO DRIVER
 M:	Alexey Klimov <klimov.linux@gmail.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index d875d31ce84c..7d32cfc19820 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -380,6 +380,15 @@ config SENSORS_MP5990
 	  This driver can also be built as a module. If so, the module will
 	  be called mp5990.
 
+config SENSORS_MP9941
+	tristate "MPS MP9941"
+	help
+	  If you say yes here you get hardware monitoring support for MPS
+	  MP9941.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mp9941.
+
 config SENSORS_MPQ7932_REGULATOR
 	bool "Regulator support for MPQ7932"
 	depends on SENSORS_MPQ7932 && REGULATOR
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 312d3f0c0540..6c7177fde355 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_MP2993)	+= mp2993.o
 obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
 obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
+obj-$(CONFIG_SENSORS_MP9941)	+= mp9941.o
 obj-$(CONFIG_SENSORS_MPQ7932)	+= mpq7932.o
 obj-$(CONFIG_SENSORS_MPQ8785)	+= mpq8785.o
 obj-$(CONFIG_SENSORS_PLI1209BC)	+= pli1209bc.o
diff --git a/drivers/hwmon/pmbus/mp9941.c b/drivers/hwmon/pmbus/mp9941.c
new file mode 100644
index 000000000000..d24e98671e16
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp9941.c
@@ -0,0 +1,328 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for MPS Multi-phase Digital VR Controllers(MP9941)
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+/*
+ * Vender specific registers. The MFR_ICC_MAX(0x02) is used to
+ * config the iin scale. The MFR_RESO_SET(0xC7) is used to
+ * config the vout format. The MFR_VR_MULTI_CONFIG_R1(0x0D) is
+ * used to identify the vout vid step.
+ */
+#define MFR_ICC_MAX	0x02
+#define MFR_RESO_SET	0xC7
+#define MFR_VR_MULTI_CONFIG_R1	0x0D
+
+#define MP9941_VIN_LIMIT_UINT	1
+#define MP9941_VIN_LIMIT_DIV	8
+#define MP9941_READ_VIN_UINT	1
+#define MP9941_READ_VIN_DIV	32
+
+#define MP9941_PAGE_NUM	1
+
+#define MP9941_RAIL1_FUNC	(PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | \
+							PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT | \
+							PMBUS_HAVE_TEMP | PMBUS_HAVE_PIN | \
+							PMBUS_HAVE_IIN | \
+							PMBUS_HAVE_STATUS_VOUT | \
+							PMBUS_HAVE_STATUS_IOUT | \
+							PMBUS_HAVE_STATUS_TEMP | \
+							PMBUS_HAVE_STATUS_INPUT)
+
+struct mp9941_data {
+	struct pmbus_driver_info info;
+	int vid_resolution;
+};
+
+#define to_mp9941_data(x) container_of(x, struct mp9941_data, info)
+
+static int mp2993_set_vout_format(struct i2c_client *client)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_word_data(client, MFR_RESO_SET);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * page = 0, MFR_RESO_SET[7:6] defines the vout format
+	 * 2'b11 set the vout format as direct
+	 */
+	ret = (ret & ~GENMASK(7, 6)) | FIELD_PREP(GENMASK(7, 6), 3);
+
+	ret = i2c_smbus_write_word_data(client, MFR_RESO_SET, ret);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int
+mp2993_identify_vid_resolution(struct i2c_client *client, struct pmbus_driver_info *info)
+{
+	struct mp9941_data *data = to_mp9941_data(info);
+	int ret;
+
+	/*
+	 * page = 2, MFR_VR_MULTI_CONFIG_R1[4:4] defines rail1 vid step value
+	 * 1'b0 represents the vid step value is 10mV
+	 * 1'b1 represents the vid step value is 5mV
+	 */
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_word_data(client, MFR_VR_MULTI_CONFIG_R1);
+	if (ret < 0)
+		return ret;
+
+	if (FIELD_GET(GENMASK(4, 4), ret))
+		data->vid_resolution = 5;
+	else
+		data->vid_resolution = 10;
+
+	return 0;
+}
+
+static int mp9941_identify_iin_scale(struct i2c_client *client)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_word_data(client, MFR_RESO_SET);
+	if (ret < 0)
+		return ret;
+
+	ret = (ret & ~GENMASK(3, 2)) | FIELD_PREP(GENMASK(3, 2), 0);
+
+	ret = i2c_smbus_write_word_data(client, MFR_RESO_SET, ret);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * page = 2, MFR_ICC_MAX[15:13] defines the iin scale
+	 * 3'b000 set the iout scale as 0.5A/Lsb
+	 */
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_word_data(client, MFR_ICC_MAX);
+	if (ret < 0)
+		return ret;
+
+	ret = (ret & ~GENMASK(15, 13)) | FIELD_PREP(GENMASK(15, 13), 0);
+	ret = i2c_smbus_write_word_data(client, MFR_ICC_MAX, ret);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int mp9941_identify(struct i2c_client *client, struct pmbus_driver_info *info)
+{
+	int ret;
+
+	ret = mp9941_identify_iin_scale(client);
+	if (ret < 0)
+		return ret;
+
+	ret = mp2993_identify_vid_resolution(client, info);
+	if (ret < 0)
+		return ret;
+
+	ret = mp2993_set_vout_format(client);
+	if (ret < 0)
+		return ret;
+
+	return ret;
+}
+
+static int mp9941_read_word_data(struct i2c_client *client, int page, int phase,
+				 int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp9941_data *data = to_mp9941_data(info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_READ_VIN:
+		/* The MP9941 vin scale is (1/32V)/Lsb */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST((ret & GENMASK(9, 0)) * MP9941_READ_VIN_UINT,
+					MP9941_READ_VIN_DIV);
+		break;
+	case PMBUS_READ_IIN:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = ret & GENMASK(10, 0);
+		break;
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+		/* The MP9941 vin ov limit scale is (1/8V)/Lsb */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST((ret & GENMASK(7, 0)) * MP9941_VIN_LIMIT_UINT,
+					MP9941_VIN_LIMIT_DIV);
+		break;
+	case PMBUS_IIN_OC_WARN_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = ret & GENMASK(7, 0);
+		break;
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+	case PMBUS_MFR_VOUT_MIN:
+	case PMBUS_MFR_VOUT_MAX:
+		/*
+		 * The vout scale is set to 1mV/Lsb(using r/m/b scale).
+		 * But the vout uv limit and vout max/min scale is 1VID/Lsb,
+		 * so the vout uv limit and vout max/min value should be
+		 * multiplied by vid resolution.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = ret * data->vid_resolution;
+		break;
+	case PMBUS_READ_IOUT:
+	case PMBUS_READ_POUT:
+	case PMBUS_READ_TEMPERATURE_1:
+	case PMBUS_READ_VOUT:
+	case PMBUS_READ_PIN:
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+		ret = -ENODATA;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int mp9941_write_word_data(struct i2c_client *client, int page, int reg,
+				  u16 word)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp9941_data *data = to_mp9941_data(info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+		/* The MP9941 vin ov limit scale is (1/8V)/Lsb */
+		ret = pmbus_write_word_data(client, page, reg,
+					    DIV_ROUND_CLOSEST(word * MP9941_VIN_LIMIT_DIV,
+							      MP9941_VIN_LIMIT_UINT));
+		break;
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+	case PMBUS_MFR_VOUT_MIN:
+	case PMBUS_MFR_VOUT_MAX:
+		ret = pmbus_write_word_data(client, page, reg,
+					    DIV_ROUND_CLOSEST(word, data->vid_resolution));
+		break;
+	case PMBUS_IIN_OC_WARN_LIMIT:
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+		ret = -ENODATA;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct pmbus_driver_info mp9941_info = {
+	.pages = MP9941_PAGE_NUM,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_CURRENT_IN] = direct,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.format[PSC_TEMPERATURE] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+
+	.m[PSC_TEMPERATURE] = 1,
+	.R[PSC_TEMPERATURE] = 0,
+	.b[PSC_TEMPERATURE] = 0,
+
+	.m[PSC_VOLTAGE_IN] = 1,
+	.R[PSC_VOLTAGE_IN] = 0,
+	.b[PSC_VOLTAGE_IN] = 0,
+
+	.m[PSC_CURRENT_IN] = 2,
+	.R[PSC_CURRENT_IN] = 0,
+	.b[PSC_CURRENT_IN] = 0,
+
+	.m[PSC_VOLTAGE_OUT] = 1,
+	.R[PSC_VOLTAGE_OUT] = 3,
+	.b[PSC_VOLTAGE_OUT] = 0,
+
+	.func[0] = MP9941_RAIL1_FUNC,
+	.read_word_data = mp9941_read_word_data,
+	.write_word_data = mp9941_write_word_data,
+	.identify = mp9941_identify,
+};
+
+static int mp9941_probe(struct i2c_client *client)
+{
+	struct mp9941_data *data;
+
+	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	memcpy(&data->info, &mp9941_info, sizeof(mp9941_info));
+
+	return pmbus_do_probe(client, &data->info);
+}
+
+static const struct i2c_device_id mp9941_id[] = {
+	{"mp9941", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, mp9941_id);
+
+static const struct of_device_id __maybe_unused mp9941_of_match[] = {
+	{.compatible = "mps,mp9941"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mp9941_of_match);
+
+static struct i2c_driver mp9941_driver = {
+	.driver = {
+		.name = "mp9941",
+		.of_match_table = mp9941_of_match,
+	},
+	.probe = mp9941_probe,
+	.id_table = mp9941_id,
+};
+
+module_i2c_driver(mp9941_driver);
+
+MODULE_AUTHOR("Noah Wang <noahwang.wang@outlook.com>");
+MODULE_DESCRIPTION("PMBus driver for MPS MP9941");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.25.1


