Return-Path: <linux-i2c+bounces-3968-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1035090388D
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 12:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43E3328285A
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 10:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31E717A931;
	Tue, 11 Jun 2024 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="aJYNfCmB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2017.outbound.protection.outlook.com [40.92.52.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E2F4502C;
	Tue, 11 Jun 2024 10:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.52.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718100886; cv=fail; b=n7VghFPepE7unbODenGFulzuCe5EFrheAV3RAJSx09O3H5Ptq7Cnh6m8ZjHlHFHUdmr3Ocu8IQo7hm8g46qXDGodLHuEyontNwI0TCti0q2sCmxeR9XRA5iSauHQZImqkmDBvDKSFN5BPqaSd8zgaNLjtmMVSHO0cQKAqlR90P0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718100886; c=relaxed/simple;
	bh=+sCMPVo0cEuvet+cHNZ5ErhsOVJvmpyDQT59iLPC6jY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o83ySufXPou/IpADjxs4+ZZKiwhtTXrpN0SHKRRSe5asFLUAcxPXC21y5beUSchWJi2WsEsR/8G2aE9I1gPfYvYYtsBx2K/WxmjLxxaM7kcc1P3lwCreculSC5GlYrke5dbGY+d/O2qX4h92Kau/7AUQQG09gd9MV85BOdaKOmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=aJYNfCmB; arc=fail smtp.client-ip=40.92.52.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hA+yFVC8uz3Or4rRZtHMyid/0mj9jN4NCYy3F8pv2/ka7TuwjVIbjtL36uYqhmyGpo6vN1WmafoKu8og7AdfH9EodSf48zGj+Q8pmWEXo8LhUhwWcNGKasTgRQFL2wYZdkHKzKWFFeWPwmMR/euquLzRaHl1SjS8CwgAlR/ubozOO8QRlXQoAQO8T0Cd4Bjx+xiKKrqDLkyfDi+nPaOS/a4Rn8WWmZjqEzmnidMpXWWfI4HELrosrlE+qMZ6lh6X1skg8jceBsaoDtv7MvwZ5Ni5gVE5hAxcV1uE4A0pLBrPzWnlgmBWIIIi7nv9HHikGauPT39kIDTKBvb/9XbGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VDJywhhjxWZW0EKDPcoOcFkpmJYEzXHy62Aa27agVA=;
 b=lc99//7MIrff4OL7qL417hBMt9AcSyQalk39MUa8ol28oIEzTm6bVIxFKmReFSrgkNroNJPmgWZhapYuCJAgwar6+d6ToX0OPh3OEt6ltvul/erU3VMTF0SoMHeVjLnI2LTF300kswgad/BtqNJWq6FPWa2rh0JJfcJIT1tJclcHIuoAcwnTPMCUuwDRMI7aipsZhuIp+iWpJ3DBUnDLzUz3sOV61e7BHFxvb4aJekECXqPjXM0/S4JGAN6Q9j2o+mAkASIcuIejVMnZIuThhBIWHeo+7cTFRAtzxPDHJVdnvWmMDmlK+6WgdkhsO4cUHf04cIXbmbHCqxmpAspc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VDJywhhjxWZW0EKDPcoOcFkpmJYEzXHy62Aa27agVA=;
 b=aJYNfCmBFGlAe/fb/uNriLDhhYKRO23nXm+Q2/GIH9tjXBR8wocPfWwngH2EKwZhM1VMgrJ9oN7Ao9aKPWSFEoMQZCBldIerkf5NEmgbGvm10XRh0DHY20gVkKrFSwrhklEt0FnFGuE336Ltzq9iY433ZhFMUnSZSKjW3DToC2ncBpvZJOrKqaSWXafFI0P5/DRgD5ZcfuuIXk3pugzwAXpNLj0g/6BOpqLR4uuWEo4I8lYV/HIs8L5m/JHuZbU2VCajJo5ya7qR4Ot3/RF1ZhYVoEFQ6oO+n8jR/MC4rtr6E69dEqKN8+HZSNk9BCPcV8t30zxCNb3bTwsCOxCF/g==
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com (2603:1096:101:be::7)
 by TYZPR04MB8231.apcprd04.prod.outlook.com (2603:1096:405:bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 10:14:38 +0000
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5]) by SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 10:14:31 +0000
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
Subject: [PATCH v2 2/4] hwmon: add MP2993 driver
Date: Tue, 11 Jun 2024 18:14:15 +0800
Message-ID:
 <SEYPR04MB648203DC017A514837DB1204FAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611101417.76911-1-noahwang.wang@outlook.com>
References: <SEYPR04MB6482721F71C0527767A149DEFAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>
 <20240611101417.76911-1-noahwang.wang@outlook.com>
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-TMN: [8WcDs76hdovHwHvKlLPpWJYnJ0OfccK/]
X-ClientProxiedBy: TYWP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::6) To SEYPR04MB6482.apcprd04.prod.outlook.com
 (2603:1096:101:be::7)
X-Microsoft-Original-Message-ID:
 <20240611101417.76911-2-noahwang.wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR04MB6482:EE_|TYZPR04MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: 44301c17-7467-4a7b-b1ef-08dc89ff48d3
X-MS-Exchange-SLBlob-MailProps:
	Z68gl6A5j29w+MUqrYiRAJIXXGNm0UHYn4joByviJEbWsoL/R0oenA9qGDBENq74bDJtWUieAIwdVK1uap7WLn02TQ1qb9K9qCa2od0htkelbp9w/UlhRmjhI02KRBOuexOZw1gmOzTGq7FPtvz6kXHq/TLOqqWtTHB1aymTp3rYsXOcNEZEnSVmxtmPJaYk0lv9bVqJyhD7+rWZPXqDMGkXvE3l4QM2yeMElU73WOyfnXXpkdplYoucl3dlefhMPA+bT97CXyhvMsI+lIO+08OfCR/KtT4pKzAmFUef2soFTQRFHD66/E3yS6YnWKnQze7Nsl/UMIjT9jXfF+kNG66BII/O9BNS6Hw33SVW9LMapt7Nf/UQ4V56gYFGrkAcMvlpvzkFFea0+2WqXx3KfkC4FabLK0zLdO6WkpNGaVsp8+KokQVdQNbskpJz4BCpijDHheM2vLuOKqYfJXmRZiy5sUY+Bgl6qGg2fBgfBdYpuxi76AWvLe3QS3aL4nt3fumJwTWCxE2Cupps092a9KJwC7n1kseQ2NE1VtLbM2BmCvRYOXWUh26o0G3Cb21ewjKZb5d70xYmW1xCPhf0wQvakpZuu/ZkD2dbrZOhzIjNJ+B3aIxxmQuXRL6Id9FzCc7gb52Jcs8ffa995z8wcHqbIfesfIG2xO2I3/2HIemuE/NI0kt5IzfvirsOGBlHqiZ/+unmy/DLkBENOahjw1JNqmsU4yCMtZWPaeO8V6wNs7RxtKH5FR7GkxmZS726gESRBQJzequgZ+ed4NCeejzoL2ZhoPI9YjQiGvkM1l6i0H8beNINVCQ+uwmGxjzr
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|1602099003|3412199016|440099019|1710799017;
X-Microsoft-Antispam-Message-Info:
	kCbuE055W3zMPsyNJi6CM7gRkcg/h5CfjpbgcKvxqNPwYZK/wAv43288w0Js+nklpGlAi5JLrmCI8j69ZPLanifGWd1QF95quhCm/p9AA1GF0CaoMaZhcTkFqFYCzMZZuow3c7KxxYwoVB/PXJjfbX6NltVC+xe9HO2foAXB6Dib0+Iu30LZkgt11oC2O7kVAeu3yDQJuTxkvxkznc0/jJTEcbuif3OIECQQe7BvyWnAVAVYkHj+W5KasDZTJ5oqgsDeuqKtmcYgRUjZBjH3eIU0SAGfsXL10PyHsWihjtEEw41TdQ1LzufUFf57EBiAbB+Zk3duNW+oJ9tTCMo8QehI8jM/QYarfU64IFRlynmdrFMhRiKfkkyAXT+xLikIWAtsjPfHRe7VcregHbZa37UjITzWb0uAks5eM7HDheHLiyTuiOyXR/N+9fgiPOMt/sH1kQHjBamFynjbQQvA5+qPtUoV2Pq4nYFvqzs7l8h4YZkEn8ddEvQkoK5GPQzlsAJYLKYftbKo9WWSitRF3AsxkN8alFbnALqGpepeA0VU5op/HxV8vhsR4Q8x3dP2/wHn3Con8dpGLmdTOsaLKy7szXdJPOfmkTM78RvCSeb7HrnXSfIIpnPuGQ7ahe7+T84WHpXVCDaMflivHqYx2z6kPAzXXrtVZpPeeObx+dVCNUH6ghSljIrqrfFqyKFR
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x2AL7HarkxpqaomhhmRdi5PJ6Xwf8t0HlQiWEBjCDjEQom6lKnuMc7oqTY/E?=
 =?us-ascii?Q?z2G5bORsUMTI2rjf1wsWyEE/tUoVTRkNpF3KDzrAE/Mc20fGnHpIANysXP22?=
 =?us-ascii?Q?ca9pUvX2lniyblnr4iWN3Z7c53RaxORbTrWpErdJ0hHyaObRMzWvyRy76VbE?=
 =?us-ascii?Q?lW2M+dIXpMJ8y3yEblor/8L5ZXGteH/iRxCOq/5ccy+GKMYI/2ZiycWo7ILv?=
 =?us-ascii?Q?GiwgHYY3F4maVLObSxfnljLKJCvw9rBR3NgWIgncwPT2VQLK419XRVlLttpk?=
 =?us-ascii?Q?FqiH5J9NJJgFZ80McdQIUckAx2kD5OVKwbHwGckC6sr4i2I5qs02FB33Cw1+?=
 =?us-ascii?Q?kDX161gy0wbMvASFqpjYHDszDCXhvxjNIn92Ht87NYmzMHxt6YhG6lF+ZTlR?=
 =?us-ascii?Q?6FYoXHQLT4NwPBZQNMl4wCVGo53PUCpBp22OqJ1yjbhYhc+NLy+DgM0JRKKg?=
 =?us-ascii?Q?+uXQXsRPRsZvjioTH10HKFmUd3NCeMl1rjZKmaIDgQYWXyDUpxuhu8NK9c8i?=
 =?us-ascii?Q?vAamcMisn0T9AUpeTjCn/nZX+zQbWlDxSlZG8BttysLYhDF9xAPZ8qEhoMwn?=
 =?us-ascii?Q?gHb1lv0bPTnA0IalHSDZAa2YiZ6rG16mzkmeUUgQ5aWM0x1ACjnCLT43WUX0?=
 =?us-ascii?Q?9gZjMN3nOTJA5d9Q+owbc5IMNA/+A9nBtqjDg8WwVXJwbXY8CsPLblZxNVQH?=
 =?us-ascii?Q?knTzqEgSy07XZ5Sxix7wIRMqC0mwvv7YMsQKXsEUmHqpBwRibLsDaZMDx3QX?=
 =?us-ascii?Q?LNkisiSuWw3uGq3Ooh3lAT5FJVmkKg9UVekHtIIRetNZorcXFXaUdT/P+8Ut?=
 =?us-ascii?Q?1IIxFYrMQnTON05NjGn3GgL6QEehy/K1A4X8+GQHfgmS2nRkmOxaZWNIyji5?=
 =?us-ascii?Q?xPcitg2ryDbsRiZ1GffThjRvljcHGRKludeWlU8GYSl+akL/1rtWX9IUHHgS?=
 =?us-ascii?Q?BiqPh2eNYgS5JoC7GrgHDVyKiuIwyWi2VTrNwP4DN3o2u2yaQhpzD87GWgjz?=
 =?us-ascii?Q?8J8wB/dR8erwJpUEWMBltj5ZvNohBivAUpRTMVtMxONMxjNYD7fp79SKCKQJ?=
 =?us-ascii?Q?hppoGHiJZ8+XnNXWfI5z133iTnk0kuC8NnoSJgmFsZILwcVTEmalPiDTiLP+?=
 =?us-ascii?Q?dNfrjjgWmfLKfhfT0gkX6qSwD2LvO7UW3I2qgsP/PNnmND8GABGyDrtZgXyY?=
 =?us-ascii?Q?NEvwa7Tz5l7D1zY2kib5ViGZA6TlNtgYDj8Wa4kO2OgZoec8v7bgchhcORPn?=
 =?us-ascii?Q?tqQu7ZASfos+F7W22xsw?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44301c17-7467-4a7b-b1ef-08dc89ff48d3
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB6482.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 10:14:31.4578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB8231

Add support for MPS VR controller mp2993. This driver exposes
telemetry and limits value readings and writtings.

Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
---
V1 -> V2:
    remove useless code in mp2993_set_vout_format() and
    mp2993_identify()

 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/mp2993.rst | 150 +++++++++++++++++++
 MAINTAINERS                    |   7 +
 drivers/hwmon/pmbus/Kconfig    |   9 ++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/mp2993.c   | 261 +++++++++++++++++++++++++++++++++
 6 files changed, 429 insertions(+)
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
index 000000000000..7a4fe0d946e0
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
index aacccb376c28..4fdd787b1401 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15256,6 +15256,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
 F:	drivers/video/backlight/mp3309c.c
 
+MPS MP2993 DRIVER
+M:	Noah Wang <noahwang.wang@outlook.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/mp2993.rst
+F:	drivers/hwmon/pmbus/mp2993.c
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
index 000000000000..944593e13231
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp2993.c
@@ -0,0 +1,261 @@
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
+	return i2c_smbus_write_byte_data(client, PMBUS_VOUT_MODE, format);
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
+	return mp2993_set_vout_format(client, 1, PB_VOUT_MODE_DIRECT);
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


