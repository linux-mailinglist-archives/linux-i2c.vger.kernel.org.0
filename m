Return-Path: <linux-i2c+bounces-3720-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B408D5B5E
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 09:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C588D1F26080
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 07:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8815E81204;
	Fri, 31 May 2024 07:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="e7l3iujf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2057.outbound.protection.outlook.com [40.92.52.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAD725569;
	Fri, 31 May 2024 07:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.52.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717140396; cv=fail; b=Rl/7HkFLvp2j70g/PJTttOh0D+tFcG5XFP9o23Wn7igydi2gFJAMGmyIR+5T2JIUVJJjJOl2VAg12db6uvcS5B852wtCnMQiSlWiPWjuAdyREqQJ2bPEjjLiMQEbCKCFoVJKIiRcntGMWxePVi3jTcx1Jr1fpJNYtPQZzHkQ5aE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717140396; c=relaxed/simple;
	bh=RnMuNJLUk8+QVjjxlC8cjG891LGBy7d9iWf/3cGma1w=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KTxftLmrbeoOb+xXMZG3MTO6ocNJ3dInEU2HBXRYoHliPKuR/Ons5/JM/uJ5QxEP12JDnM6688HZNzzUnZ8rx2VWpBNaK3fIo5UKL2KR5/9LEqtJxx8Hgmlmsc+h4PiNH2bIMj3yEPleP/8poU0CrFC68db/CanVPi33dG4m+1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=e7l3iujf; arc=fail smtp.client-ip=40.92.52.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnWb5BS86NANeK0Oo2y9/1b5ojzjdf65Ka9dtJYrzPK2WlVnp+89944/6NupaOUOPe5/P7kHsE7zHAzxEvEIxwb/K8U+PG76ua9ofip2lCzdivxXQ5DtAVquRL1VG225JBhZo2+iPwQmXPjAzd3DwJe6h3eTupebnfIsR4evU4IMjPlUMKT+625lSkVK/m5O0+tJUYosMnQ7HYnx0OBvwQSSqVO69LfmJzvmwzKdbnS8WJCK7rSMaG9tdHF0fmeqQfrmI02sCi+G6E7AU8wrgP1ZR3BXXXJPYtQjKm6nlIpVCKf1MR5kryZOO/CypGNQ64NEZqiYcUZm9u5LAIfQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uipMKBHyGv2Q/SUiJWiJPUgu0wvwZTwAtmLYnZuMzOk=;
 b=Sm/8ePbzSL7myDEjSMbIoIArsqZReJcONWfVLv+pQUrUNfLD/LzDO0Hlz677q7qzi+YNqAZhYQQxHFRHRlFvcFI2RRmRPFtJu5OaSYgFL1cPsXinBCQmX4g7ThWUpbHoLRIViTwvGmVHELWpXexscN/odOttqEtIvqTBGUPBpKQlFwIV3QtOx9sR+ChfAffINEG0yHMFMX+9HnqzSkPiEqX4AaNiCJx9zKevL30/4Is2omPNIFYKtgpzOoJaXAu4jR1udfWc5JiYpfYX75b3gNZSi/TGhDeMT/KlSUYT+IN3YWkd5qYxnxouEYQFnSQGEet1NLnfM9uN52tw5ygwzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uipMKBHyGv2Q/SUiJWiJPUgu0wvwZTwAtmLYnZuMzOk=;
 b=e7l3iujf0HBy7EVlIQquDJLKeHXUF7u/Lv3Q1V6hjW0QUcPq9zUIKvUUwsOYOfRoZA++l0wsCZMw1NlQzfPx4fB3Jli7rfdZSflR2WHL1U0bLGDgHK0yVvn59lTyQQLpU95442tsXcTU3TxCZ4UHU3hNrxxab9sJts6xPCgZWoJARamPizAyh9RaQm2dGwHMjqhk1N9HDwPNglU0VopKDKpWt3QeBkvUraZFGnQN//HbNNhWl2ka4Og/OxfYnKSAHZGtYlkPpJsaHNs7Vc1Tx0ELQartob3llv1ctkKtnbTzg82f36kYacwTcpisEjx9J8bPc+erV7HcEI/suGev+Q==
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com (2603:1096:101:be::7)
 by TYSPR04MB8003.apcprd04.prod.outlook.com (2603:1096:405:92::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 31 May
 2024 07:26:27 +0000
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5]) by SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5%5]) with mapi id 15.20.7611.025; Fri, 31 May 2024
 07:26:27 +0000
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
Subject: [v3,1/2] hwmon: add MP2891 driver
Date: Fri, 31 May 2024 15:26:01 +0800
Message-ID:
 <SEYPR04MB648253BF01D42B24A72B0027FAFC2@SEYPR04MB6482.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-TMN: [QB5JNecdz82l9BYUIoFGw9XcI0WWmjmu]
X-ClientProxiedBy: SGAP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::23)
 To SEYPR04MB6482.apcprd04.prod.outlook.com (2603:1096:101:be::7)
X-Microsoft-Original-Message-ID:
 <20240531072602.4806-1-noahwang.wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR04MB6482:EE_|TYSPR04MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: a3eadd60-fea3-4404-3adf-08dc8142fb76
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|3412199016|440099019|1602099003|1710799017;
X-Microsoft-Antispam-Message-Info:
	+jJASjCUHDtyqEDP3M0FjTtIwapGtQOL7y2zJzDGL7Anz40zDSam3+jBSnd9HWVgQgdsZ8iRt3lNElNoSQhQlelsafPXvQy3FR85wE9kN1TEX3A/s0gwQLDD3kiFtGY6jNukVVP96R88300ROvaoXPR9G8cP9JkBDkEk8i/ldbODkuBeNnwZRbpje88oqbQ5ujQ2SksaTRbYrOaciM0l5mmwHf77DoIiLldpcvVJR93P7D6lmRQ23VeXawW3ieZ1V5rMLgBsMrnTRvvd3HGHzhUdSMXQwyzl4I70aSE/HAWQtKYyQ0om3i+q9zJScnoVqC5/L7KJymN6CD/K0rdrJAuE6Mm2buFtBGcYL1FfdPKwKSyo9mQuBDOe8tOy0gzDpy8DHBdaikdStXcqInh0L95b1tpqx2pB080KVOBMKSjdRMN27eCWGsPlz719PQ0ndZ8G4ZeifyGwTzCidXg6DRVuMEh5mPvC/8mSYsZpQpbGC8oxZwRebY63KN1zJih7WeovARLJjBCo/1yhBUwvX+POAVod7Uoh2V7B/m46dwTPc5fBzaxmMkj4xK0ZTuyi4h0umLEa9y/pFLc0IR37cMaKR4OCAJXrfN61xXrtUwyUbEeuqmdh5UQFX4oR6oRN5zIjJzoLwkmNDKKCBeR3PegyRu0+fcvxWyKFmYKl+t3X8vv9UnhaGOXkOeWSeCEk
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/W/W4Tekx41LT92sJR55z7ceQJDw+m6x1ZkwYxmnib6bmPY/QkpdfHDDsBjT?=
 =?us-ascii?Q?Z0ZQQESj2tvSLqC/xOQ0huLr/w/kEdCXPNTyfNT9aVirV7EcLiiM0IxdHwVh?=
 =?us-ascii?Q?qQRoVFuJTH5W7/XfJLUVrizcVX83gosHXLpj0PtzSh3TeYezIs8pQVZN7fQQ?=
 =?us-ascii?Q?28qUoRVgOmtHiHqKzJsvIo/eQvOWzG3Yf8C+ib7p22XwPlEnCKcR9SABSf/U?=
 =?us-ascii?Q?kPdDSKX++NW66YmT9aHfTg5cDnxTiijkga+sG9CRepOPjYZV3LaqFqnFoqm9?=
 =?us-ascii?Q?DounxJDbxmMn9wE5Zj/rdoUk5m6Z+RPds2LybtujYpdftUgnoJJhzKoy4rA0?=
 =?us-ascii?Q?B5knz1FgfGAUKLmM6KoRMkhMKa+YAOpUnfLErJtq1N6RMol8tAZQ431pmuIQ?=
 =?us-ascii?Q?1fm+Rq4aw9TBPBS46W4EEP4tD19i/q+YFf1MkBcQGFW4u3oOjBux79jBtwku?=
 =?us-ascii?Q?2SKl6yv86uaDywoGbQDmFz9JvOYJJqy+t8FGGcfxEqf/1W2d886kfwalMB8C?=
 =?us-ascii?Q?I2G49ZYjZGm4G/uSu2zapRnxDGMyYt+fmWnxoNi/0JzitnkNc+6rgWQTQ56V?=
 =?us-ascii?Q?lT1dLC3Y37DlBdpWfAZFX3A+kUbNWU0xH4hAijZgdUgkT997CNF0QuOJ8NdZ?=
 =?us-ascii?Q?CTzzNpahcPnXiXhT2MAEHEKSxQ4tPPmfeaKja2IDtWuc6rSa7dOW0zAGmSJI?=
 =?us-ascii?Q?VtP1GB3/95WRLbTk3R5DJT2SsGDTugLE0DVWUvA3PcrWE/9v2rv8JU4gy8db?=
 =?us-ascii?Q?5G6E6TSG8YzwjVjZMg3Obr9o6eBlzbWCXa98ohM85+tbeIpikl3TXRl4fuxe?=
 =?us-ascii?Q?XThSoY94dS7aWxQpb5U5tSTr+rrbzPuhKfWAWpEjy4R8pbKUq3v9k/SGdZyT?=
 =?us-ascii?Q?4bZcIdImjZzFoF2NLOy1C3FFk3hd9n50GI4E/f+lpZw8NcY4A/iiM+hMxihx?=
 =?us-ascii?Q?WYQ6xw6LCZ9BSS7ykYyt6JYrgjfsiNEhwdV2vJtk5SseJizjRRT1bkDGcOYW?=
 =?us-ascii?Q?kZCeGRq0d1ynUZTIAQJmLG+CZfOlgpEQ2x5csENB/KXuQjC76kBlIL47Qee6?=
 =?us-ascii?Q?Pkqh0OEph8lkV2t182LYrasxY5zJjjYg152avXv0YRa/siepZYy8h9b67mK3?=
 =?us-ascii?Q?wqUPr1ziSj7MVWtihezDxR2RolerfTORqPv3XXFLPRG+KXwlRY7tl1iLaez5?=
 =?us-ascii?Q?pEtZyVw7P6Q5GwgI1E4qKB7i2gP6GJO3rURq0+hjNsr2NO+LLeXtoBhpLmPH?=
 =?us-ascii?Q?GEDa8UjwALOcgKn0OFTo?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3eadd60-fea3-4404-3adf-08dc8142fb76
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB6482.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 07:26:27.1785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB8003

Add support for MPS VR controller mp2891. This driver exposes
telemetry and limit value readings and writings.

Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
---
v2 -> v3:
    1. change PSC_VOLTAGE_IN, PSC_CURRENT_IN, PSC_TEMPERATURE,
        and PSC_POWER format from linear to direct
    2. add limit register writings.
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
 drivers/hwmon/pmbus/mp2891.c   | 608 +++++++++++++++++++++++++++++++++
 6 files changed, 805 insertions(+)
 create mode 100644 Documentation/hwmon/mp2891.rst
 create mode 100644 drivers/hwmon/pmbus/mp2891.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 03d313af469a..88f70ef60f34 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -168,6 +168,7 @@ Hardware Monitoring Kernel Drivers
    mp2975
    mp5023
    mp5990
+   mp2891
    mpq8785
    nct6683
    nct6775
diff --git a/Documentation/hwmon/mp2891.rst b/Documentation/hwmon/mp2891.rst
new file mode 100644
index 000000000000..a487d5ee8e1d
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
+output voltage, input currect, output current, input power, output
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
index e5dbbf1edafd..45a37918f1ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22683,6 +22683,13 @@ S:	Maintained
 F:	Documentation/hwmon/tps546d24.rst
 F:	drivers/hwmon/pmbus/tps546d24.c
 
++MPS MP2891 DRIVER
++M:	Noah Wang <noahwang.wang@outlook.com>
++L:	linux-hwmon@vger.kernel.org
++S:	Maintained
++F:	Documentation/hwmon/mp2891.rst
++F:	drivers/hwmon/pmbus/mp2891.c
+
 TQ SYSTEMS BOARD & DRIVER SUPPORT
 L:	linux@ew.tq-group.com
 S:	Supported
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 08e82c457356..c0cc673a69ff 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -371,6 +371,15 @@ config SENSORS_MP5990
 	  This driver can also be built as a module. If so, the module will
 	  be called mp5990.
 
+config SENSORS_MP2891
+    tristate "MPS MP2891"
+    help
+      If you say yes here you get hardware monitoring support for MPS
+      MP2891 Dual Loop Digital Multi-Phase Controller.
+
+      This driver can also be built as a module. If so, the module will
+      be called mp2891.
+
 config SENSORS_MPQ7932_REGULATOR
 	bool "Regulator support for MPQ7932"
 	depends on SENSORS_MPQ7932 && REGULATOR
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 2279b3327bbf..4f680bf06639 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
 obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
+obj-$(CONFIG_SENSORS_MP2891)	+= mp2891.o
 obj-$(CONFIG_SENSORS_MPQ7932)	+= mpq7932.o
 obj-$(CONFIG_SENSORS_MPQ8785)	+= mpq8785.o
 obj-$(CONFIG_SENSORS_PLI1209BC)	+= pli1209bc.o
diff --git a/drivers/hwmon/pmbus/mp2891.c b/drivers/hwmon/pmbus/mp2891.c
new file mode 100644
index 000000000000..5ebde3e70646
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp2891.c
@@ -0,0 +1,608 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for MPS Multi-phase Digital VR Controllers(MP2891)
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/bitfield.h>
+#include "pmbus.h"
+
+/*
+ * Vender specific registers, the register MFR_SVI3_IOUT_PRT(0x65),
+ * MFR_VOUT_LOOP_CTRL(0xBD), READ_PIN_EST(0x94)and READ_IIN_EST(0x95)
+ * redefine the standard PMBUS register. The MFR_SVI3_IOUT_PRT(0x65)
+ * is used to identify the iout scale and the MFR_VOUT_LOOP_CTRL(0xBD)
+ * is used to identify the vout scale. The READ_PIN_EST(0x94) is used
+ * to read input power of per rail. The MP2891 does not have standard
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
+	 * The output voltage is equal to the READ_VOUT(0x8B) register value multiply
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
+	 * multiply by iout_scale.
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
+		 * PMBUS_VOUT_MODE(0x20) in MP2891 is reserved and 0x00 is always be
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
+		 * is not used to read the input power of per rail. The input power
+		 * of per rail is read through the vender redefined register
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
+		 * As a result, the limit value should multiply by 4.
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
+		 * is set to 1A/Lsb(using r/m/b scale), so the word data should divide
+		 * by 2.
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
+		 * is set to 1W/Lsb(using r/m/b scale), so the word data should multiply
+		 * by 2.
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
+		 * should divide by 4.
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
+		 * is set to 1A/Lsb(using r/m/b scale), so the word data should multiply
+		 * by 2.
+		 */
+		ret = pmbus_write_word_data(client, page, reg, word * 2);
+		break;
+	case PMBUS_PIN_OP_WARN_LIMIT:
+		/*
+		 * The scale of PMBUS_PIN_OP_WARN_LIMIT is 2W/Lsb, but the pin scale
+		 * is set to 1W/Lsb(using r/m/b scale), so the word data should divide
+		 * by 2.
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
+static struct pmbus_driver_info mp2891_info = {
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
+	struct pmbus_driver_info *info;
+	struct mp2891_data *data;
+
+	data = devm_kzalloc(&client->dev, sizeof(struct mp2891_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	memcpy(&data->info, &mp2891_info, sizeof(*info));
+	info = &data->info;
+
+	return pmbus_do_probe(client, info);
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


