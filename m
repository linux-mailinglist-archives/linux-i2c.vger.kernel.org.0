Return-Path: <linux-i2c+bounces-3754-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 605608D8069
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2024 12:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83B5D1C21B3C
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2024 10:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAB684A4F;
	Mon,  3 Jun 2024 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="prwesZAW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2044.outbound.protection.outlook.com [40.92.52.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDAC84A39;
	Mon,  3 Jun 2024 10:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.52.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717412040; cv=fail; b=nqrEoGhtrgBkQ5OqUGEFrDJkDZ7F0a5HgpWZQB1ELrov7wOBUdAD4JDdwZC3YSEHsb0SJivu/lqSHRAItaRluNcFWHpZdCqVqqZzB9uxCy4nil3oVlArf/T9fpcivM9IVGnFk6ET+pnKWIhmEP5IvP6kFoasggK/a7z01+eL8vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717412040; c=relaxed/simple;
	bh=7D79xH6T6MsAAb7PtR+R+1J9p+hVvpVjtRo4w20Lk4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AgP5W4kNT4s2wt8veb9v0Ptb+siKwa0zm8qbBJx4sVIGwli7vOWNx2rZau93Q0DAQwcL9AmyNRlJda3gS5jJEb2tgOYeBw8QxYt05+X1pzS5sDqlAJxLE8iBG06IjKywHjc2PyT/1qGGHwhgVy5wbTu/LCCuF4laZNq1fgh24ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=prwesZAW; arc=fail smtp.client-ip=40.92.52.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LILJ/VSlzqar6pQdhfWqeNBfsKin4vJZiolkbw8anSwK99ROLcY38ubOnHGkwmiiVSZO6WBm9PokeiSumN/fYdBFc2vl9+X7xYC8FfmCcOpI9U8NxbAi6HwUu9kiXDjD5qwcXRNHisTqUYQiMO6wgI4aNFU/pNG0CDpJnLTYQG5/jx3ok0WRKWZW4zFkLYhzA9iTqzVAf/vDQ4yVjfixtgjCgkYQG00CvjhA9rUSRm44RaQnGxUk45bW1m1IQRpL37bCj5Vv0Two7ricCskeBBUhUnrZIYQLufHDB/jgXrCwCmydRsULsCp+eFs62avtbUhJ5D7ePiKGXw6V5xl/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgOrp6IDolKrXFo8IVsiMeJ4NQ0pwaKCDBJ/m4Mg3Gw=;
 b=Ymh3NLvpO8YGCdULhgYw3zdtG3rbDCX7glJl2kccQiUpMVnFPeuGQL8CH2xxAuhfRRQi7TgrAMm9ELC/0TXBvZ6IYuhrZgxo9JvgmzTfbaXJ+6egPspa2x1AU1nHH1eCdiOgIwwMpdEJe3g11cWz9egUY6++Cyersg4RLsDZwwg+9XVmxwXJaakvDTk8/9zI6HCCGmG3Tq/83GJiCLi2GyZY0DoEwiPcfufIFo88DosumauzM5WoxT8zh+KpPPvu1Dzqbrzb7smDrNQtnYkm3CViD9ncih1Y5/aT7wlrIHVz0w7qEhz05pdyi70zet4YXU5k7Ei8kz0kvNTpTTmgQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgOrp6IDolKrXFo8IVsiMeJ4NQ0pwaKCDBJ/m4Mg3Gw=;
 b=prwesZAWBJAaMVUk2rPFIpNFM+cYcZ/iXAJuJo0b/j46/HoILiXX2amMaiOQj62m/fNizYbdVhbIIV8PmppU4z+6LL7t8n2mUdqmp2n8i3FE+oci1UeTzYZsTWzb+fWLmwkPqVu5YFqhq8sbNe4fprI0unBtri1wO0Y6wRdqvsciVFxqYMIn3p4DcAwEBLBUWGcelMni/7IjrUGPJ4P2ioo97mgtIg8Wg1ohiFrqd0afZHWUpIqbRsrvq4bydc1CoNwPZ3NWefNlix41E728rsfiTS6mlyXbPExfuJeL4NgILdAH/t6M1bOP5jhnA8FPa/bCYpxgSBg+GfbZg0OM0A==
Received: from KL1PR0401MB6491.apcprd04.prod.outlook.com
 (2603:1096:820:b9::14) by TYSPR04MB7967.apcprd04.prod.outlook.com
 (2603:1096:405:88::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Mon, 3 Jun
 2024 10:53:52 +0000
Received: from KL1PR0401MB6491.apcprd04.prod.outlook.com
 ([fe80::d4b1:6b60:841e:2190]) by KL1PR0401MB6491.apcprd04.prod.outlook.com
 ([fe80::d4b1:6b60:841e:2190%5]) with mapi id 15.20.7611.025; Mon, 3 Jun 2024
 10:53:51 +0000
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
	luca.ceresoli@bootlin.com,
	chou.cosmo@gmail.com,
	bhelgaas@google.com,
	lukas@wunner.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Noah Wang <noahwang.wang@outlook.com>
Subject: [v4,2/2] hwmon: add MP2891 driver
Date: Mon,  3 Jun 2024 18:53:06 +0800
Message-ID:
 <KL1PR0401MB64911C4D68B4361C9EA97422FAFF2@KL1PR0401MB6491.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240603105306.180874-1-noahwang.wang@outlook.com>
References: <20240603105306.180874-1-noahwang.wang@outlook.com>
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-TMN: [H2GbzbrXUF8qf9O2WhiDHqmCmLRBbUWj]
X-ClientProxiedBy: TYXPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:403:a::14) To KL1PR0401MB6491.apcprd04.prod.outlook.com
 (2603:1096:820:b9::14)
X-Microsoft-Original-Message-ID:
 <20240603105306.180874-3-noahwang.wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0401MB6491:EE_|TYSPR04MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f8dcf91-a9eb-4783-a5f7-08dc83bb73c3
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|1602099003|3412199016|440099019|1710799017;
X-Microsoft-Antispam-Message-Info:
	dk92tahwF5nfont91z3W7DEla4kCvOpC0J04GTXHbBf+Z+gomxGhdNkLbbI5KpahggLE5moG647pblyyvxVUaptxFW6+2AnMTZWM0TkmnvvcHlOS+uGBh6++TDUd8VxhZjXHtp9+W+N/a2wW9AlocVAjtUzoeDLXmUNgxH9H2bLJCGtW3vl12XGm+oEWN2rjnuncPpZiQctIQs/SJlB5ooECd0svcTI+5qlf8BiNGTpTlbNxJ9fuiwxZbKRLfZM5Vz/vDaC15ZZcFVOk25s/fQ9YqQY517V+dzibz/dvRPiCwzXhh6rFyyTa2r9uql3X9aOMhHnSYXO/5ox4Dwe/NDGfup2ujacIDpmt+pO9/E7vf1uDWnwauzOvQNmR9xF/1ob8qrkkgvhmjVLeyZN0ME59ESL5kLq0Prvb9dGT/CMJlEGTF/Gw3DiBMmVbcYpob4mqf2V+C5BsrII8l3WvFIVS3zJWdPFlZq22RWVTHX1T7y7pIeU3+YjsEOgDAxh0jFq8nAm0ZpsOgrpdkVHIPHR5Q98ygXzvI7CMdY5l0s6Xzww65w+vB0MNsv0c37lEv885aXLyAEUKVIMpfg39UCEYRL88MoW2gaAjyiuCYac2fgAnCZKNniT/s5Rg0VONc6zy5Y7D6iy2izHHSJNMNBVQfWie4A+hKGpjOKWdy3mY0R9S8lF0yGk68eRKALzu
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M9TBjlOBoN/zV7WibrPdB1WKT+rRtxRNkudWlZnH0CYKSvRfDDwVeFH5yaCj?=
 =?us-ascii?Q?0/GBUb2f4Uwax/sJku6DEL6MVjpWGRBfjLArMWv9y5txOY50TbI9n1RgslFE?=
 =?us-ascii?Q?48yRo6HsS/xc9vYKg3HKJqgvx944UYn7PZmtL+olJAifXwOzqjmR3R92jtyj?=
 =?us-ascii?Q?JiKBySEko369635U0aX3aOOFXqX3xoTOpHLi9Pi+gd12Lp1DmlAm9k7VGzpD?=
 =?us-ascii?Q?SlGf5xdjtKT+xZ4YIfGRevx1UBBB9+JqWg5YXmqhKwePca7J/Dfm/hTiP1Jy?=
 =?us-ascii?Q?PN3eHMARgm7keVYg+OYj/yHjzo/9aaVOaZk5lvybkKZLg/h3GxyLKpe6jNjr?=
 =?us-ascii?Q?wVFKjsSO4MKr9ormBedQOx06jk3+GVr91g6NQ8eWMAwNm7SZIEzcGDITdZjs?=
 =?us-ascii?Q?X+1h/MYdeECKnYBpqQdTWloe79DIZpquRg5qZBKVVj9fFXUry/8s8Xh2viuY?=
 =?us-ascii?Q?6TpiED/qElNDiFz/1xSLPCPHqe+Y72uip5TnQi+slVboPc69tcwbfGZXhArv?=
 =?us-ascii?Q?2zzArs9qfpiKuOwMIbnpEduH4DK4nFSD8ukpvGGnHoELBgYzWpkSE2nmN+er?=
 =?us-ascii?Q?2nOmlqbYZrSr0x0GDnlF8mmKs9Um3cOf5IMiNx8DrEC8c4W1xEj9pLPNFXIE?=
 =?us-ascii?Q?MhdbKIzzRSXhLsZUqGCLFqyikWKp/YuKGDVBRv1Uu7mZ2XTobDpMpmUbAObM?=
 =?us-ascii?Q?K+ZdSxojs1GVgSJqy0LCyKHWGUsGfLW19iejQAPiHZFA0Xu4iC5bDikCs1JB?=
 =?us-ascii?Q?FfeRE4DKKjQskWEgf13rvHPIcVyfOv3GDBc6KbYNQrJOBj5Jq0i1l3iORWNL?=
 =?us-ascii?Q?NZnFcXbDvCNWph1pqwPRo5Am1OkN7uhx/fPo+6dj2TTehmXujY7oZPqbNcIc?=
 =?us-ascii?Q?Pxt5XptuqeCKisAdMrAjbiOl2Y6eXZhSClvCXVMpj3uSBPZ2w+xPKy13aXl6?=
 =?us-ascii?Q?ySEIJhx9z0VRwjMZNjOiwSklr/byBRpMMJhTlkHwHP9ujFgE9klLtl95eLfm?=
 =?us-ascii?Q?sNdjyrbIRAhsw9vcY9p9hiyupsJaa36NYQOs/rLV4E93pvZmch1lgrQb4JVc?=
 =?us-ascii?Q?b3wq4Ca+b6wVG+k4PZqn8IYHsZ3vATv2c8lmbuF4KG4aY8VIM5bpFN/GgomX?=
 =?us-ascii?Q?wjFnUWp1fNhpmPImUBEpFz3BWjkTbWzWun2kbQK9W1fStNxqiYBMKpalSVRV?=
 =?us-ascii?Q?N0HrjFIEkmmu0+S8xUkTf6l3NsbayieLV6T8u1/OLNMEQA7fxcFZ5FVv1hc8?=
 =?us-ascii?Q?vkZNcpd4qSW6iuii2uv2?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8dcf91-a9eb-4783-a5f7-08dc83bb73c3
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6491.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 10:53:50.9565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7967

Add support for MPS VR controller mp2891. This driver exposes
telemetry and limit value readings and writtings.

Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
---
v3 -> v4:
    1. add mp2891 to Makefile, Kconfig and MAINTAINERS file
       in alpha order
    2. sort include files in alpha order
    3. fix some issue in annotation
    4. remove info variable in mp2891_probe()
    5. add const attribute to mp2891_info variable

v2 -> v3:
    1. change PSC_VOLTAGE_IN, PSC_CURRENT_IN, PSC_TEMPERATURE,
        and PSC_POWER format from linear to direct
    2. add limit register writtings.
    3. fix some coding style issues

V1 -> V2:
    1. add limit register readings
    2. add status register readings
    3. change PSC_CURRENT_OUT format from linear to direct
    4. add more detailed explanation for special processing
    5. remove useless code
    6. move identify vout_scale, iout_scale function to
        identify() callback
    7. update MP2891 datasheet

 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/mp2891.rst | 179 ++++++++++
 MAINTAINERS                    |   7 +
 drivers/hwmon/pmbus/Kconfig    |   9 +
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/mp2891.c   | 603 +++++++++++++++++++++++++++++++++
 6 files changed, 800 insertions(+)
 create mode 100644 Documentation/hwmon/mp2891.rst
 create mode 100644 drivers/hwmon/pmbus/mp2891.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 03d313af469a..e8413ca7dd96 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -165,6 +165,7 @@ Hardware Monitoring Kernel Drivers
    mlxreg-fan
    mp2856
    mp2888
+   mp2891
    mp2975
    mp5023
    mp5990
diff --git a/Documentation/hwmon/mp2891.rst b/Documentation/hwmon/mp2891.rst
new file mode 100644
index 000000000000..55944d1b5457
--- /dev/null
+++ b/Documentation/hwmon/mp2891.rst
@@ -0,0 +1,179 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp2891
+====================
+
+Supported chips:
+
+  * MPS mp2891
+
+    Prefix: 'mp2891'
+
+  * Datasheet
+
+    Publicly available at the MPS website : https://www.monolithicpower.com/en/mp2891.html
+
+Author:
+
+	Noah Wang <noahwang.wang@outlook.com>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+MP2891 Multi-phase Digital VR Controller.
+
+Device compliant with:
+
+- PMBus rev 1.3 interface.
+
+Device supports direct and linear format for reading input voltage,
+output voltage, input current, output current, input power, output
+power, and temperature.
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
+**in2_min**
+
+**in2_min_alarm**
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
+**in3_min**
+
+**in3_min_alarm**
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
+**curr2_input**
+
+**curr2_label**
+
+**curr2_max**
+
+**curr2_max_alarm**
+
+The driver provides the following attributes for output current:
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
+**curr4_input**
+
+**curr4_label**
+
+**curr4_crit**
+
+**curr4_crit_alarm**
+
+**curr4_max**
+
+**curr4_max_alarm**
+
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
+
+**power1_max**
+
+**power1_alarm**
+
+**power2_input**
+
+**power2_label**
+
+**power2_max**
+
+**power2_alarm**
+
+The driver provides the following attributes for output power:
+
+**power3_input**
+
+**power3_label**
+
+**power4_input**
+
+**power4_label**
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
index e5dbbf1edafd..b0adc07abbc6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15180,6 +15180,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
 F:	drivers/video/backlight/mp3309c.c
 
+MPS MP2891 DRIVER
+M:	Noah Wang <noahwang.wang@outlook.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/mp2891.rst
+F:	drivers/hwmon/pmbus/mp2891.c
+
 MR800 AVERMEDIA USB FM RADIO DRIVER
 M:	Alexey Klimov <klimov.linux@gmail.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 08e82c457356..66a3bad95ab3 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -337,6 +337,15 @@ config SENSORS_MP2888
 	  This driver can also be built as a module. If so, the module will
 	  be called mp2888.
 
+config SENSORS_MP2891
+    tristate "MPS MP2891"
+    help
+      If you say yes here you get hardware monitoring support for MPS
+      MP2891 Dual Loop Digital Multi-Phase Controller.
+
+      This driver can also be built as a module. If so, the module will
+      be called mp2891.
+
 config SENSORS_MP2975
 	tristate "MPS MP2975"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 2279b3327bbf..84e2ff71f7d6 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
 obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
 obj-$(CONFIG_SENSORS_MP2856)	+= mp2856.o
 obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
+obj-$(CONFIG_SENSORS_MP2891)	+= mp2891.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
 obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
diff --git a/drivers/hwmon/pmbus/mp2891.c b/drivers/hwmon/pmbus/mp2891.c
new file mode 100644
index 000000000000..cbf201f43687
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp2891.c
@@ -0,0 +1,603 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for MPS Multi-phase Digital VR Controllers(MP2891)
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+/*
+ * Vender specific registers, the register MFR_SVI3_IOUT_PRT(0x65),
+ * MFR_VOUT_LOOP_CTRL(0xBD), READ_PIN_EST(0x94)and READ_IIN_EST(0x95)
+ * redefine the standard PMBUS register. The MFR_SVI3_IOUT_PRT(0x65)
+ * is used to identify the iout scale and the MFR_VOUT_LOOP_CTRL(0xBD)
+ * is used to identify the vout scale. The READ_PIN_EST(0x94) is used
+ * to read input power per rail. The MP2891 does not have standard
+ * READ_IIN register(0x89), the iin telemetry can be obtained through
+ * the vendor redefined register READ_IIN_EST(0x95).
+ */
+#define MFR_VOUT_LOOP_CTRL	0xBD
+#define READ_PIN_EST	0x94
+#define READ_IIN_EST	0x95
+#define MFR_SVI3_IOUT_PRT	0x65
+
+#define MP2891_TEMP_LIMIT_OFFSET	40
+#define MP2891_PIN_LIMIT_UINT	2
+#define MP2891_IOUT_LIMIT_UINT	8
+#define MP2891_IOUT_SCALE_DIV	32
+#define MP2891_VOUT_SCALE_DIV	100
+#define MP2891_OVUV_DELTA_SCALE	50
+#define MP2891_OV_LIMIT_SCALE	20
+#define MP2891_UV_LIMIT_SCALE	5
+
+#define MP2891_PAGE_NUM	2
+
+#define MP2891_RAIL1_FUNC	(PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | \
+							PMBUS_HAVE_IOUT | PMBUS_HAVE_TEMP | \
+							PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | \
+							PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_VOUT | \
+							PMBUS_HAVE_STATUS_IOUT | \
+							PMBUS_HAVE_STATUS_INPUT | \
+							PMBUS_HAVE_STATUS_TEMP)
+
+#define MP2891_RAIL2_FUNC	(PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT | \
+							PMBUS_HAVE_TEMP | PMBUS_HAVE_POUT | \
+							PMBUS_HAVE_PIN | PMBUS_HAVE_IIN | \
+							PMBUS_HAVE_STATUS_VOUT | \
+							PMBUS_HAVE_STATUS_IOUT | \
+							PMBUS_HAVE_STATUS_INPUT | \
+							PMBUS_HAVE_STATUS_TEMP)
+
+struct mp2891_data {
+	struct pmbus_driver_info info;
+	int vout_scale[MP2891_PAGE_NUM];
+	int iout_scale[MP2891_PAGE_NUM];
+};
+
+#define to_mp2891_data(x) container_of(x, struct mp2891_data, info)
+
+/* Converts a LINEAR11 value to DIRECT format */
+static u16 mp2891_reg2data_linear11(u16 word)
+{
+	s16 exponent;
+	s32 mantissa;
+	s64 val;
+
+	exponent = ((s16)word) >> 11;
+	mantissa = ((s16)((word & 0x7ff) << 5)) >> 5;
+	val = mantissa;
+
+	if (exponent >= 0)
+		val <<= exponent;
+	else
+		val >>= -exponent;
+
+	return val;
+}
+
+static int
+mp2891_identify_vout_scale(struct i2c_client *client, struct pmbus_driver_info *info,
+			   int page)
+{
+	struct mp2891_data *data = to_mp2891_data(info);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_word_data(client, MFR_VOUT_LOOP_CTRL);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * The output voltage is equal to the READ_VOUT(0x8B) register value multiplied
+	 * by vout_scale.
+	 * Obtain vout scale from the register MFR_VOUT_LOOP_CTRL, bits 15-14,bit 13.
+	 * If MFR_VOUT_LOOP_CTRL[13] = 1, the vout scale is below:
+	 * 2.5mV/LSB
+	 * If MFR_VOUT_LOOP_CTRL[13] = 0, the vout scale is decided by
+	 * MFR_VOUT_LOOP_CTRL[15:14]:
+	 * 00b - 6.25mV/LSB, 01b - 5mV/LSB, 10b - 2mV/LSB, 11b - 1mV
+	 */
+	if (ret & GENMASK(13, 13)) {
+		data->vout_scale[page] = 250;
+	} else {
+		ret = FIELD_GET(GENMASK(15, 14), ret);
+		if (ret == 0)
+			data->vout_scale[page] = 625;
+		else if (ret == 1)
+			data->vout_scale[page] = 500;
+		else if (ret == 2)
+			data->vout_scale[page] = 200;
+		else
+			data->vout_scale[page] = 100;
+	}
+
+	return 0;
+}
+
+static int
+mp2891_identify_iout_scale(struct i2c_client *client, struct pmbus_driver_info *info,
+			   int page)
+{
+	struct mp2891_data *data = to_mp2891_data(info);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_word_data(client, MFR_SVI3_IOUT_PRT);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * The output current is equal to the READ_IOUT(0x8C) register value
+	 * multiplied by iout_scale.
+	 * Obtain iout_scale from the register MFR_SVI3_IOUT_PRT[2:0].
+	 * The value is selected as below:
+	 * 000b - 1A/LSB, 001b - (1/32)A/LSB, 010b - (1/16)A/LSB,
+	 * 011b - (1/8)A/LSB, 100b - (1/4)A/LSB, 101b - (1/2)A/LSB
+	 * 110b - 1A/LSB, 111b - 2A/LSB
+	 */
+	switch (ret & GENMASK(2, 0)) {
+	case 0:
+	case 6:
+		data->iout_scale[page] = 32;
+		break;
+	case 1:
+		data->iout_scale[page] = 1;
+		break;
+	case 2:
+		data->iout_scale[page] = 2;
+		break;
+	case 3:
+		data->iout_scale[page] = 4;
+		break;
+	case 4:
+		data->iout_scale[page] = 8;
+		break;
+	case 5:
+		data->iout_scale[page] = 16;
+		break;
+	default:
+		data->iout_scale[page] = 64;
+		break;
+	}
+
+	return 0;
+}
+
+static int mp2891_identify(struct i2c_client *client, struct pmbus_driver_info *info)
+{
+	int ret;
+
+	/* Identify vout scale for rail 1. */
+	ret = mp2891_identify_vout_scale(client, info, 0);
+	if (ret < 0)
+		return ret;
+
+	/* Identify vout scale for rail 2. */
+	ret = mp2891_identify_vout_scale(client, info, 1);
+	if (ret < 0)
+		return ret;
+
+	/* Identify iout scale for rail 1. */
+	ret = mp2891_identify_iout_scale(client, info, 0);
+	if (ret < 0)
+		return ret;
+
+	/* Identify iout scale for rail 2. */
+	ret = mp2891_identify_iout_scale(client, info, 1);
+	if (ret < 0)
+		return ret;
+
+	return ret;
+}
+
+static int mp2891_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VOUT_MODE:
+		/*
+		 * The MP2891 does not follow standard PMBus protocol completely, the
+		 * PMBUS_VOUT_MODE(0x20) in MP2891 is reserved and 0x00 is always
+		 * returned when the register is read. But the calculation of vout in
+		 * this driver is based on direct format. As a result, the format of
+		 * vout is enforced to direct.
+		 */
+		ret = PB_VOUT_MODE_DIRECT;
+		break;
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static int mp2891_read_word_data(struct i2c_client *client, int page,
+				 int phase, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp2891_data *data = to_mp2891_data(info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_READ_VIN:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = ret & GENMASK(9, 0);
+		break;
+	case PMBUS_READ_IIN:
+		/*
+		 * The MP2891 does not have standard PMBUS_READ_IIN register(0x89),
+		 * the iin telemetry can be obtained through the vender redefined
+		 * register READ_IIN_EST(0x95). The MP2891 PMBUS_READ_IIN register
+		 * is linear11 format, But the pout scale is set to 1A/Lsb(using
+		 * r/m/b scale). As a result, the iin read from MP2891 should be
+		 * calculated to A, then return the result to pmbus core.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, READ_IIN_EST);
+		if (ret < 0)
+			return ret;
+
+		ret = mp2891_reg2data_linear11(ret);
+		break;
+	case PMBUS_READ_PIN:
+		/*
+		 * The MP2891 has standard PMBUS_READ_PIN register(0x97), but this
+		 * is not used to read the input power per rail. The input power
+		 * per rail is read through the vender redefined register
+		 * READ_PIN_EST(0x94). The MP2891 PMBUS_READ_PIN register is linear11
+		 * format, But the pout scale is set to 1W/Lsb(using r/m/b scale).
+		 * As a result, the pin read from MP2891 should be calculated to W,
+		 * then return the result to pmbus core.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, READ_PIN_EST);
+		if (ret < 0)
+			return ret;
+
+		ret = mp2891_reg2data_linear11(ret);
+		break;
+	case PMBUS_READ_POUT:
+		/*
+		 * The MP2891 PMBUS_READ_POUT register is linear11 format, and the
+		 * exponent is not a constant value. But the pout scale is set to
+		 * 1W/Lsb(using r/m/b scale). As a result, the pout read from MP2891
+		 * should be calculated to W, then return the result to pmbus core.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = mp2891_reg2data_linear11(ret);
+		break;
+	case PMBUS_READ_VOUT:
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST(ret * data->vout_scale[page], MP2891_VOUT_SCALE_DIV);
+		break;
+	case PMBUS_READ_IOUT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST((ret & GENMASK(10, 0)) * data->iout_scale[page],
+					MP2891_IOUT_SCALE_DIV);
+		break;
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+		/*
+		 * The scale of MP2891 PMBUS_OT_FAULT_LIMIT and PMBUS_OT_WARN_LIMIT
+		 * is 1°C/LSB and they have 40°C offset.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = (ret & GENMASK(7, 0)) - MP2891_TEMP_LIMIT_OFFSET;
+		break;
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+		/*
+		 * The MP2891 PMBUS_VIN_OV_FAULT_LIMIT scale is 125mV/Lsb.
+		 * but the vin scale is set to 31.25mV/Lsb(using r/m/b scale).
+		 * As a result, the limit value should be multiplied by 4.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = (ret & GENMASK(7, 0)) * 4;
+		break;
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		if (FIELD_GET(GENMASK(11, 8), ret))
+			ret = FIELD_GET(GENMASK(7, 0), ret) * MP2891_UV_LIMIT_SCALE -
+				(FIELD_GET(GENMASK(11, 8), ret) + 1) * MP2891_OVUV_DELTA_SCALE;
+		else
+			ret = FIELD_GET(GENMASK(7, 0), ret) * MP2891_UV_LIMIT_SCALE;
+
+		ret = ret < 0 ? 0 : ret;
+		break;
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		if (FIELD_GET(GENMASK(11, 8), ret))
+			ret = FIELD_GET(GENMASK(7, 0), ret) * MP2891_OV_LIMIT_SCALE +
+				(FIELD_GET(GENMASK(11, 8), ret) + 1) * MP2891_OVUV_DELTA_SCALE;
+		else
+			ret = FIELD_GET(GENMASK(7, 0), ret) * MP2891_OV_LIMIT_SCALE;
+		break;
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST((ret & GENMASK(7, 0)) * data->iout_scale[page] *
+						MP2891_IOUT_LIMIT_UINT, MP2891_IOUT_SCALE_DIV);
+		break;
+	case PMBUS_IIN_OC_WARN_LIMIT:
+		/*
+		 * The scale of PMBUS_IIN_OC_WARN_LIMIT is 0.5A/Lsb, but the iin scale
+		 * is set to 1A/Lsb(using r/m/b scale), so the word data should be
+		 * divided by 2.
+		 */
+		ret = pmbus_read_word_data(client, 0, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST((ret & GENMASK(9, 0)), 2);
+		break;
+	case PMBUS_PIN_OP_WARN_LIMIT:
+		/*
+		 * The scale of PMBUS_PIN_OP_WARN_LIMIT is 2W/Lsb, but the pin scale
+		 * is set to 1W/Lsb(using r/m/b scale), so the word data should be
+		 * multiplied by 2.
+		 */
+		ret = pmbus_read_word_data(client, 0, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = (ret & GENMASK(9, 0)) * MP2891_PIN_LIMIT_UINT;
+		break;
+	case PMBUS_READ_TEMPERATURE_1:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+	case PMBUS_VIN_UV_WARN_LIMIT:
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
+static int mp2891_write_word_data(struct i2c_client *client, int page, int reg,
+				  u16 word)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp2891_data *data = to_mp2891_data(info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+		ret = pmbus_write_word_data(client, page, reg,
+					    DIV_ROUND_CLOSEST(word * MP2891_VOUT_SCALE_DIV,
+							      data->vout_scale[page]));
+		break;
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		/*
+		 * The PMBUS_VOUT_UV_FAULT_LIMIT[7:0] is the limit value, and bit8-bit15
+		 * should not be changed.
+		 */
+		ret = pmbus_read_word_data(client, page, 0xff, reg);
+		if (ret < 0)
+			return ret;
+
+		if (FIELD_GET(GENMASK(11, 8), ret))
+			ret = pmbus_write_word_data(client, page, reg,
+						    (ret & ~GENMASK(7, 0)) |
+							FIELD_PREP(GENMASK(7, 0),
+								   DIV_ROUND_CLOSEST(word +
+							(FIELD_GET(GENMASK(11, 8), ret) + 1) *
+								MP2891_OVUV_DELTA_SCALE,
+								MP2891_UV_LIMIT_SCALE)));
+		else
+			ret = pmbus_write_word_data(client, page, reg,
+						    (ret & ~GENMASK(7, 0)) |
+					FIELD_PREP(GENMASK(7, 0),
+						   DIV_ROUND_CLOSEST(word,
+								     MP2891_UV_LIMIT_SCALE)));
+		break;
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+		/*
+		 * The PMBUS_VOUT_OV_FAULT_LIMIT[7:0] is the limit value, and bit8-bit15
+		 * should not be changed.
+		 */
+		ret = pmbus_read_word_data(client, page, 0xff, reg);
+		if (ret < 0)
+			return ret;
+
+		if (FIELD_GET(GENMASK(11, 8), ret))
+			ret = pmbus_write_word_data(client, page, reg,
+						    (ret & ~GENMASK(7, 0)) |
+							FIELD_PREP(GENMASK(7, 0),
+								   DIV_ROUND_CLOSEST(word -
+							(FIELD_GET(GENMASK(11, 8), ret) + 1) *
+								MP2891_OVUV_DELTA_SCALE,
+								MP2891_OV_LIMIT_SCALE)));
+		else
+			ret = pmbus_write_word_data(client, page, reg,
+						    (ret & ~GENMASK(7, 0)) |
+					FIELD_PREP(GENMASK(7, 0),
+						   DIV_ROUND_CLOSEST(word,
+								     MP2891_OV_LIMIT_SCALE)));
+		break;
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+		/*
+		 * The PMBUS_VIN_OV_FAULT_LIMIT[7:0] is the limit value, and bit8-bit15
+		 * should not be changed. The scale of PMBUS_VIN_OV_FAULT_LIMIT is 125mV/Lsb,
+		 * but the vin scale is set to 31.25mV/Lsb(using r/m/b scale), so the word data
+		 * should be divided by 4.
+		 */
+		ret = pmbus_read_word_data(client, page, 0xff, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = pmbus_write_word_data(client, page, reg,
+					    (ret & ~GENMASK(7, 0)) |
+						FIELD_PREP(GENMASK(7, 0),
+							   DIV_ROUND_CLOSEST(word, 4)));
+		break;
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+		/*
+		 * The scale of MP2891 PMBUS_OT_FAULT_LIMIT and PMBUS_OT_WARN_LIMIT
+		 * have 40°C offset. The bit0-bit7 is the limit value, and bit8-bit15
+		 * should not be changed.
+		 */
+		ret = pmbus_read_word_data(client, page, 0xff, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = pmbus_write_word_data(client, page, reg,
+					    (ret & ~GENMASK(7, 0)) |
+				FIELD_PREP(GENMASK(7, 0), word + MP2891_TEMP_LIMIT_OFFSET));
+		break;
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+		ret = pmbus_write_word_data(client, page, reg,
+					    DIV_ROUND_CLOSEST(word * MP2891_IOUT_SCALE_DIV,
+							      MP2891_IOUT_LIMIT_UINT *
+								  data->iout_scale[page]));
+		break;
+	case PMBUS_IIN_OC_WARN_LIMIT:
+		/*
+		 * The scale of PMBUS_IIN_OC_WARN_LIMIT is 0.5A/Lsb, but the iin scale
+		 * is set to 1A/Lsb(using r/m/b scale), so the word data should be
+		 * multiplied by 2.
+		 */
+		ret = pmbus_write_word_data(client, page, reg, word * 2);
+		break;
+	case PMBUS_PIN_OP_WARN_LIMIT:
+		/*
+		 * The scale of PMBUS_PIN_OP_WARN_LIMIT is 2W/Lsb, but the pin scale
+		 * is set to 1W/Lsb(using r/m/b scale), so the word data should be
+		 * divided by 2.
+		 */
+		ret = pmbus_write_word_data(client, page, reg,
+					    DIV_ROUND_CLOSEST(word, MP2891_PIN_LIMIT_UINT));
+		break;
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+	case PMBUS_VIN_UV_WARN_LIMIT:
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
+static const struct pmbus_driver_info mp2891_info = {
+	.pages = MP2891_PAGE_NUM,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_CURRENT_IN] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+
+	/* set vin scale 31.25mV/Lsb */
+	.m[PSC_VOLTAGE_IN] = 32,
+	.R[PSC_VOLTAGE_IN] = 0,
+	.b[PSC_VOLTAGE_IN] = 0,
+
+	/* set temp scale 1000m°C/Lsb */
+	.m[PSC_TEMPERATURE] = 1,
+	.R[PSC_TEMPERATURE] = 0,
+	.b[PSC_TEMPERATURE] = 0,
+
+	.m[PSC_CURRENT_IN] = 1,
+	.R[PSC_CURRENT_IN] = 0,
+	.b[PSC_CURRENT_IN] = 0,
+
+	.m[PSC_CURRENT_OUT] = 1,
+	.R[PSC_CURRENT_OUT] = 0,
+	.b[PSC_CURRENT_OUT] = 0,
+
+	.m[PSC_POWER] = 1,
+	.R[PSC_POWER] = 0,
+	.b[PSC_POWER] = 0,
+
+	.m[PSC_VOLTAGE_OUT] = 1,
+	.R[PSC_VOLTAGE_OUT] = 3,
+	.b[PSC_VOLTAGE_OUT] = 0,
+
+	.func[0] = MP2891_RAIL1_FUNC,
+	.func[1] = MP2891_RAIL2_FUNC,
+	.read_word_data = mp2891_read_word_data,
+	.write_word_data = mp2891_write_word_data,
+	.read_byte_data = mp2891_read_byte_data,
+	.identify = mp2891_identify,
+};
+
+static int mp2891_probe(struct i2c_client *client)
+{
+	struct mp2891_data *data;
+
+	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	memcpy(&data->info, &mp2891_info, sizeof(mp2891_info));
+
+	return pmbus_do_probe(client, &data->info);
+}
+
+static const struct i2c_device_id mp2891_id[] = {
+	{"mp2891", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, mp2891_id);
+
+static const struct of_device_id __maybe_unused mp2891_of_match[] = {
+	{.compatible = "mps,mp2891"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mp2891_of_match);
+
+static struct i2c_driver mp2891_driver = {
+	.driver = {
+		.name = "mp2891",
+		.of_match_table = mp2891_of_match,
+	},
+	.probe = mp2891_probe,
+	.id_table = mp2891_id,
+};
+
+module_i2c_driver(mp2891_driver);
+
+MODULE_AUTHOR("Noah Wang <noahwang.wang@outlook.com>");
+MODULE_DESCRIPTION("PMBus driver for MPS MP2891");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.25.1


