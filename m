Return-Path: <linux-i2c+bounces-3899-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B1B8FFEC8
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 11:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62FB31F24300
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 09:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7CB15DBB9;
	Fri,  7 Jun 2024 09:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="KEWzKPRh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2068.outbound.protection.outlook.com [40.92.52.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE4715B54B;
	Fri,  7 Jun 2024 09:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.52.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717751184; cv=fail; b=faMzn8rncBjh2ne22c+xV03yo2+CUAk5mBYq1Vz0zzGoofwKyHPhmz+fnPFpk1vgzVYBQUCD4zHaxkclL0M/Y6oSIrR+OYl2zwhgg8XfcprQszuqit6A2T5oFvZbpFEksXdpEYFvG6NYtyPahNr7PcZNLJ8BH1Oy7PSBu1ZCT1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717751184; c=relaxed/simple;
	bh=+RmJepZ3+TrILGtMLfWqPHHsXgvqOpJ+GELM2VcY0BU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kk9Sfy/3NXBD7PmfgavfeP4bYDSQ7kgn53dd/nHR4fPcCQghGwN67/BbDjvpLL54p+1p7xxvj2aIwpzDRegY9Qqmr7Tho5v7lBNbPj+2onsd0hTQEjobItydRHPhqoAwTyfpAoQjyHw889WNdTRsq+frUF/PlizD40uXjatCHFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=KEWzKPRh; arc=fail smtp.client-ip=40.92.52.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Enys7kP9e2DEd92IGPZ2xu14shk/DPZyNWCjTTGxZzj9c6J5ZQVQ9LhSVm/WK/NYayPhMRHZxMbwbtjyuG5CIfoSUngPaiXE21W/p8wLkb8vn6SqZgbnvPQK3tr26xsa3/sx7h55xx5/8op6fxFUIvhrAukdq3kDwuOTlhLqh+4AgghGFtKuNsjn+X3OMBamt5oq78JF/LEg4xbgIe+OBz6cldiWS9ZLLgS3a8WfjX11E9uHb324y7N6ETEs03aW9llVJvYqmCc0PK2J69DdmAdnUzXd/tIAe0JmOzvfDLFqjYHsFxWvaEGm2IN4dTQP/cF5DFuMGRLtgNk4kZn8uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZGMVNpGzlLiYXB7VC7Z7xEFkvRplRsFxfZ0u96iALY=;
 b=djrEo/cuu2nTHT/I3oO0dbb5NH9UiptrMs+rrwl1nWQECCmO1KiH+g9N854ytUwm23cLmMl63hSpHSu02gFr1Semb63x6BVa/eU75wuSsDr+fpqP+S8/939SLNPm+WM67VxKQDzAf+4EdY4MCAOmstdonK8vmFEEYQ1TRiuF0llwM6MpZz4FJLVnsPVqIQRE1jWP8i2PlF8kBlRfYiSIo2sGXYcAIFMdHEStH2rcloVp7gCyD+7JKXKzDmJmcRr+1VYVumogWgI5Uy+rrNoX0Ablao5YxBh4NoLb71Ubb7YVYXGkVXF1RkqqQ/x2/TRd89kQZX33IYYOXv7MbGZ0QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZGMVNpGzlLiYXB7VC7Z7xEFkvRplRsFxfZ0u96iALY=;
 b=KEWzKPRhyVGS5MXJ54L4JAdebYdbiIQbVzauymg7Z5nSLsRJlWzabENbEUFxaArNqVHItdClTiqiEulVvwzPnKgFyKEOTAy0fSSAB6bNujU5Xkf5mzJ0r++gvN0gynyF79HjNlIMH6uRN7fXApTjwaarDGpIQTVrv59xvFBQodwCh8XNuk7lWFAYOwWAQCFllCCdQ+n2RwU+ROGqUsXq6X+7Qqn7mEh4jJKcXOx0f73i64jKEe0DqweRkrvL6s5SJzD+QXVRkso4270zEC80DxJ9/JzFXhst/04YLAvFPZKr0JchRahUP4f0yamynSZ/aqLFwyqZ6+eB0kfz88X7EQ==
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com (2603:1096:101:be::7)
 by SEZPR04MB8048.apcprd04.prod.outlook.com (2603:1096:101:238::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Fri, 7 Jun
 2024 09:06:15 +0000
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5]) by SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5%5]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 09:06:15 +0000
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
Subject: [PATCH 2/4] hwmon: add MP2993 driver
Date: Fri,  7 Jun 2024 17:05:42 +0800
Message-ID:
 <SEYPR04MB6482D8AB26453B7DF4E98441FAFB2@SEYPR04MB6482.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607090544.466833-1-noahwang.wang@outlook.com>
References: <20240607090544.466833-1-noahwang.wang@outlook.com>
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-TMN: [tPQ2QGgpY7zF1xicZb+XuhiNlqVn2bnV]
X-ClientProxiedBy: TYWP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::12) To SEYPR04MB6482.apcprd04.prod.outlook.com
 (2603:1096:101:be::7)
X-Microsoft-Original-Message-ID:
 <20240607090544.466833-3-noahwang.wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR04MB6482:EE_|SEZPR04MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ff0aab-6879-445c-23e0-08dc86d1160f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|1602099003|440099019|3412199016|1710799017;
X-Microsoft-Antispam-Message-Info:
	sZ9wwZczv8FiVPRjkQAxkzYmnL/8/q7O+9xShPyMweSfRFGR/bC8x4jV967u/b+mrZdhnp+Yhm/hSvbtoMe7B0T/9xopQbVe9XsuArKSQPUbx21fxsa7+oYxz2OBKtom7fc/kkSF2iKRRnSEpeogj+/d3VUhUJ5gDdSuLZLuthu4Ufn0IJu4srMf9C+LdL+L/XgaFZZP1/5Eios3Aa035u12mHREB2TAHEa9CUqNzNZazp+uZEZGMzLwf3Wx2a1b1hW2I21PRYSzqgQmOzxyT4V52i4UClbvZdzsCvAD9WxL9HP63KOikJIvL5FX3dSOMSg3SziL+VSLeLaMnczlERi0jvrZn0dQB37KZxJQVn4v8AzennEQHfl2+pLU3uuWKmVxEuQqRsj9vKF6w6ZTaYLVVdgpJgbl7KhiM4pIHPq4rlvINso0wHqB5XbIyVEOkohafmLwOPbG750dIqc5mCf687FxdIN4zDvMXFIOvB4nYLICF70hxOyZgbQNABqgBEw8QgqQHsyQRZZZmqsTA7EmKEXeluBm818jwVLaf7lCVlq0nAwWaStZqDOI153uRCm8J7TUJ4xtJvmUn8Z7QZRNFmivTTphIWhLvfWpQdyFGDD+FLKLDs83nyz+Ym96Bx7sdNusprUU/S2bbZHMNsFzmczIuzhAjdlambxRm/cnVGBPoOP0/7Q3GYVwEQgv
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Oq4GFcOpZWHpKVCTLE7F0fUGYGnI7Fvay1hDRIWV2f/b5IA2GQvWR8b3y+3q?=
 =?us-ascii?Q?yjF6x1suR24NkmGSZ/y3qJdHUhy8p2e1ZunRZ0RYBmW/N1YP63ttkKwziwUy?=
 =?us-ascii?Q?/afkP5i8LqFBz5cFKGTxUIEXS4vSXgKpmcZcO1dL1oAE9doL5PPr34ZLVWYD?=
 =?us-ascii?Q?9Ae9xas7AFq0YH7yxr94XWcS/ZtKDku5bKffuMssqX40lzMnCgeHd2wpsPWr?=
 =?us-ascii?Q?6nM5160d/9T+0cUfMqtqiaslttN5jyY5lvfhRbIE9Cvmm2qgJxcgqkMG3jpQ?=
 =?us-ascii?Q?w5oRO9AaWYIhAIDlc4nlW2rbeU+Js1nRAoUr9yQFK3HcOXqspY6VEaQCy7Jg?=
 =?us-ascii?Q?+hhhq6tO2nEKDKAz2i8uv48ptAMsucO1kcSBza0FLQM2h9exi+k5HmyG2VR2?=
 =?us-ascii?Q?o/D3bNdZe8zbzO8BPB8vT4O0b9Nyn6A3EVMkzm8faolu/AJjfeaX0r5yPC2d?=
 =?us-ascii?Q?EowmxY505GVvDhgPy5/X/tsmjTNKeLCsvgHoeHUmdRQ7a2a7UgbuE9YYluzD?=
 =?us-ascii?Q?N5riZ+w8J2z0DvDFBJTlqc+YtGRrO3JYHgIDPD7krIMOxvN7BNN4pGBwMZO3?=
 =?us-ascii?Q?CeKwe8VA5wKNsHUYjhA4OCGnUWrSCDZ3zZJSNmxnf3SReZrLCJWelrQ3bkCT?=
 =?us-ascii?Q?Q+OpehGdztFyGhu2ABW+i0iFE09QvZfPn4k+mgJc2Wt66XjmZ0/u/570qWQ3?=
 =?us-ascii?Q?z6CzVNKDUAg0m+pkrsbhaLhQYQAtUn/vFPJM8jJyaoFPbz3vgHeemsfPTze5?=
 =?us-ascii?Q?WrHO6bNybnacd3hwVe7AqQ6n0iwdOp18dOm108tewSc2zCkZjslXe6IOVUx0?=
 =?us-ascii?Q?ET7sFxABXH2xSSWiNp1jb1bHloqB6RHpDDVDbZg0a5M1qpfMu4uoEKDSBeIn?=
 =?us-ascii?Q?PaFc4n7RMIaDbnq/8vSplemrK9uFNG/hScglZdlfi+ONTJ/mv2fondang5Ut?=
 =?us-ascii?Q?IuF9Y16GYslIKmC9RliACtXyc3OGzcED6js95HBsR0a1503Dl3jYf/CeFU+W?=
 =?us-ascii?Q?gu7lOUTvc8UbIsLQMfuYZkK3aGYSU/RHHU28Tph6eZMO6Rk1XYmw+3hhEi/j?=
 =?us-ascii?Q?nW7DoYInwOjqCuZv+9IUjwFZmQZ8MkbWCmIk+VA6sjZ0if4Dl0HnuYCsweBf?=
 =?us-ascii?Q?QddYMt8XVO37T3Ia++F68kNy/x4gswJTENnzxLzUfGFcVPxTyVWT67120ole?=
 =?us-ascii?Q?DeDzQDXfhXVuBHpRHEUeW4fIJAY+sM27Rem1nIVvCC88HVv1u/NxsUMjtiAJ?=
 =?us-ascii?Q?m9d31P8RO6LOsCa2vKHN?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ff0aab-6879-445c-23e0-08dc86d1160f
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB6482.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 09:06:15.8576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB8048

Add support for MPS VR controller mp2993. This driver exposes
telemetry and limit value readings and writtings.

Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/mp2993.rst | 150 ++++++++++++++++++
 MAINTAINERS                    |   7 +
 drivers/hwmon/pmbus/Kconfig    |   9 ++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/mp2993.c   | 269 +++++++++++++++++++++++++++++++++
 6 files changed, 437 insertions(+)
 create mode 100644 Documentation/hwmon/mp2993.rst
 create mode 100644 drivers/hwmon/pmbus/mp2993.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 03d313af469a..9d9d55b889f2 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -166,6 +166,7 @@ Hardware Monitoring Kernel Drivers
    mp2856
    mp2888
    mp2975
+   mp2993
    mp5023
    mp5990
    mpq8785
diff --git a/Documentation/hwmon/mp2993.rst b/Documentation/hwmon/mp2993.rst
new file mode 100644
index 000000000000..a14bb30969f9
--- /dev/null
+++ b/Documentation/hwmon/mp2993.rst
@@ -0,0 +1,150 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp2993
+====================
+
+Supported chips:
+
+  * MPS mp2993
+
+    Prefix: 'mp2993'
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
+MP2993 Dual Loop Digital Multi-phase Controller.
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
+**in1_lcrit**
+
+**in1_lcrit_alarm**
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
+**in2_crit**
+
+**in2_crit_alarm**
+
+**in2_lcrit**
+
+**in2_lcrit_alarm**
+
+**in3_input**
+
+**in3_label**
+
+**in3_crit**
+
+**in3_crit_alarm**
+
+**in3_lcrit**
+
+**in3_lcrit_alarm**
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
+**curr2_crit**
+
+**curr2_crit_alarm**
+
+**curr2_max**
+
+**curr2_max_alarm**
+
+**curr3_input**
+
+**curr3_label**
+
+**curr3_crit**
+
+**curr3_crit_alarm**
+
+**curr3_max**
+
+**curr3_max_alarm**
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
+**power3_input**
+
+**power3_label**
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
+
+**temp2_input**
+
+**temp2_crit**
+
+**temp2_crit_alarm**
+
+**temp2_max**
+
+**temp2_max_alarm**
diff --git a/MAINTAINERS b/MAINTAINERS
index 8754ac2c259d..f47f3e13b004 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15258,6 +15258,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
 F:	drivers/video/backlight/mp3309c.c
 
++MPS MP2993 DRIVER
++M:	Noah Wang <noahwang.wang@outlook.com>
++L:	linux-hwmon@vger.kernel.org
++S:	Maintained
++F:	Documentation/hwmon/mp2993.rst
++F:	drivers/hwmon/pmbus/mp2993.c
+
 MR800 AVERMEDIA USB FM RADIO DRIVER
 M:	Alexey Klimov <klimov.linux@gmail.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 08e82c457356..d875d31ce84c 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -346,6 +346,15 @@ config SENSORS_MP2975
 	  This driver can also be built as a module. If so, the module will
 	  be called mp2975.
 
+config SENSORS_MP2993
+	tristate "MPS MP2993"
+	help
+	  If you say yes here you get hardware monitoring support for MPS
+	  MP2993 Dual Loop Digital Multi-Phase Controller.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mp2993.
+
 config SENSORS_MP2975_REGULATOR
 	depends on SENSORS_MP2975 && REGULATOR
 	bool "Regulator support for MPS MP2975"
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 2279b3327bbf..312d3f0c0540 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
 obj-$(CONFIG_SENSORS_MP2856)	+= mp2856.o
 obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
+obj-$(CONFIG_SENSORS_MP2993)	+= mp2993.o
 obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
 obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
 obj-$(CONFIG_SENSORS_MPQ7932)	+= mpq7932.o
diff --git a/drivers/hwmon/pmbus/mp2993.c b/drivers/hwmon/pmbus/mp2993.c
new file mode 100644
index 000000000000..43432b8d4faf
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp2993.c
@@ -0,0 +1,269 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for MPS Multi-phase Digital VR Controllers(MP2993)
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+#define MP2993_VOUT_OVUV_UINT	125
+#define MP2993_VOUT_OVUV_DIV	64
+#define MP2993_VIN_LIMIT_UINT	1
+#define MP2993_VIN_LIMIT_DIV	8
+#define MP2993_READ_VIN_UINT	1
+#define MP2993_READ_VIN_DIV	32
+
+#define MP2993_PAGE_NUM	2
+
+#define MP2993_RAIL1_FUNC	(PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | \
+							PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT | \
+							PMBUS_HAVE_TEMP | PMBUS_HAVE_PIN | \
+							PMBUS_HAVE_IIN | \
+							PMBUS_HAVE_STATUS_VOUT | \
+							PMBUS_HAVE_STATUS_IOUT | \
+							PMBUS_HAVE_STATUS_TEMP | \
+							PMBUS_HAVE_STATUS_INPUT)
+
+#define MP2993_RAIL2_FUNC	(PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT | \
+							 PMBUS_HAVE_POUT | PMBUS_HAVE_TEMP | \
+							 PMBUS_HAVE_STATUS_VOUT | \
+							 PMBUS_HAVE_STATUS_IOUT | \
+							 PMBUS_HAVE_STATUS_TEMP | \
+							 PMBUS_HAVE_STATUS_INPUT)
+
+/* Converts a linear11 data exponent to a specified value */
+static u16 mp2993_linear11_exponent_transfer(u16 word, u16 expect_exponent)
+{
+	s16 exponent, mantissa, target_exponent;
+
+	exponent = ((s16)word) >> 11;
+	mantissa = ((s16)((word & 0x7ff) << 5)) >> 5;
+	target_exponent = (s16)((expect_exponent & 0x1f) << 11) >> 11;
+
+	if (exponent > target_exponent)
+		mantissa = mantissa << (exponent - target_exponent);
+	else
+		mantissa = mantissa >> (target_exponent - exponent);
+
+	return (mantissa & 0x7ff) | ((expect_exponent << 11) & 0xf800);
+}
+
+static int
+mp2993_set_vout_format(struct i2c_client *client, int page, int format)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_VOUT_MODE, format);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int mp2993_identify(struct i2c_client *client, struct pmbus_driver_info *info)
+{
+	int ret;
+
+	/* Set vout to direct format for rail1. */
+	ret = mp2993_set_vout_format(client, 0, PB_VOUT_MODE_DIRECT);
+	if (ret < 0)
+		return ret;
+
+	/* Set vout to direct format for rail2. */
+	ret = mp2993_set_vout_format(client, 1, PB_VOUT_MODE_DIRECT);
+	if (ret < 0)
+		return ret;
+
+	return ret;
+}
+
+static int mp2993_read_word_data(struct i2c_client *client, int page, int phase,
+				 int reg)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST(ret * MP2993_VOUT_OVUV_UINT, MP2993_VOUT_OVUV_DIV);
+		break;
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+		/*
+		 * The MP2993 ot fault limit value and ot warn limit value
+		 * per rail are always the same, so only PMBUS_OT_FAULT_LIMIT
+		 * and PMBUS_OT_WARN_LIMIT register in page 0 are defined to
+		 * indicates the limit value.
+		 */
+		ret = pmbus_read_word_data(client, 0, phase, reg);
+		break;
+	case PMBUS_READ_VIN:
+		/* The MP2993 vin scale is (1/32V)/Lsb */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST((ret & GENMASK(9, 0)) * MP2993_READ_VIN_UINT,
+					MP2993_READ_VIN_DIV);
+		break;
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+	case PMBUS_VIN_OV_WARN_LIMIT:
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+		/* The MP2993 vin limit scale is (1/8V)/Lsb */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST((ret & GENMASK(7, 0)) * MP2993_VIN_LIMIT_UINT,
+					MP2993_VIN_LIMIT_DIV);
+		break;
+	case PMBUS_READ_IOUT:
+	case PMBUS_READ_IIN:
+	case PMBUS_IIN_OC_WARN_LIMIT:
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+	case PMBUS_READ_VOUT:
+	case PMBUS_READ_PIN:
+	case PMBUS_READ_POUT:
+	case PMBUS_READ_TEMPERATURE_1:
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
+static int mp2993_write_word_data(struct i2c_client *client, int page, int reg,
+				  u16 word)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		ret = DIV_ROUND_CLOSEST(word * MP2993_VOUT_OVUV_DIV, MP2993_VOUT_OVUV_UINT);
+		ret = pmbus_write_word_data(client, 0, reg, ret);
+		break;
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+		/*
+		 * The MP2993 ot fault limit value and ot warn limit value
+		 * per rail are always the same, so only PMBUS_OT_FAULT_LIMIT
+		 * and PMBUS_OT_WARN_LIMIT register in page 0 are defined to
+		 * config the ot limit value.
+		 */
+		ret = pmbus_write_word_data(client, 0, reg, word);
+		break;
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+	case PMBUS_VIN_OV_WARN_LIMIT:
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+		/* The MP2993 vin limit scale is (1/8V)/Lsb */
+		ret = pmbus_write_word_data(client, 0, reg,
+					    DIV_ROUND_CLOSEST(word * MP2993_VIN_LIMIT_DIV,
+							      MP2993_VIN_LIMIT_UINT));
+		break;
+	case PMBUS_IIN_OC_WARN_LIMIT:
+		/*
+		 * The PMBUS_IIN_OC_WARN_LIMIT of MP2993 is linear11 format,
+		 * and the exponent is a constant value(5'b00000)， so the
+		 * exponent of word parameter should be converted to 5'b00000.
+		 */
+		ret = pmbus_write_word_data(client, page, reg,
+					    mp2993_linear11_exponent_transfer(word, 0x00));
+		break;
+		//
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+		/*
+		 * The PMBUS_IOUT_OC_FAULT_LIMIT and PMBUS_IOUT_OC_WARN_LIMIT
+		 * of MP2993 can be regarded as linear11 format, and the
+		 * exponent is a 5'b00001 or 5'b00000. To ensure a larger
+		 * range of limit value, so the exponent of word parameter
+		 * should be converted to 5'b00001.
+		 */
+		ret = pmbus_write_word_data(client, page, reg,
+					    mp2993_linear11_exponent_transfer(word, 0x01));
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static struct pmbus_driver_info mp2993_info = {
+	.pages = MP2993_PAGE_NUM,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_TEMPERATURE] = direct,
+	.format[PSC_POWER] = linear,
+	.format[PSC_VOLTAGE_OUT] = direct,
+
+	.m[PSC_VOLTAGE_OUT] = 1,
+	.R[PSC_VOLTAGE_OUT] = 3,
+	.b[PSC_VOLTAGE_OUT] = 0,
+
+	.m[PSC_VOLTAGE_IN] = 1,
+	.R[PSC_VOLTAGE_IN] = 0,
+	.b[PSC_VOLTAGE_IN] = 0,
+
+	.m[PSC_TEMPERATURE] = 1,
+	.R[PSC_TEMPERATURE] = 0,
+	.b[PSC_TEMPERATURE] = 0,
+
+	.func[0] = MP2993_RAIL1_FUNC,
+	.func[1] = MP2993_RAIL2_FUNC,
+	.read_word_data = mp2993_read_word_data,
+	.write_word_data = mp2993_write_word_data,
+	.identify = mp2993_identify,
+};
+
+static int mp2993_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &mp2993_info);
+}
+
+static const struct i2c_device_id mp2993_id[] = {
+	{"mp2993", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, mp2993_id);
+
+static const struct of_device_id __maybe_unused mp2993_of_match[] = {
+	{.compatible = "mps,mp2993"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mp2993_of_match);
+
+static struct i2c_driver mp2993_driver = {
+	.driver = {
+		.name = "mp2993",
+		.of_match_table = mp2993_of_match,
+	},
+	.probe = mp2993_probe,
+	.id_table = mp2993_id,
+};
+
+module_i2c_driver(mp2993_driver);
+
+MODULE_AUTHOR("Noah Wang <noahwang.wang@outlook.com>");
+MODULE_DESCRIPTION("PMBus driver for MPS MP2993");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.25.1


