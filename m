Return-Path: <linux-i2c+bounces-4370-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BB7917CD8
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 11:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B30F2856D4
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 09:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C924616EBE5;
	Wed, 26 Jun 2024 09:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="fCOwwe70"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01olkn2021.outbound.protection.outlook.com [40.92.53.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76BF149C52;
	Wed, 26 Jun 2024 09:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.53.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719395200; cv=fail; b=Ekoe6pzAw5VzGmjKpM7dNPDu5CZCpZ/tb2XtzFnXcOzJPpAR5iJXCllji6ruISpF71aheA/Osj+2S3PdDkH/ctvStKyhtStCZNQhql4jecobWK4IBm8A4D+4mtwv9nn+4Cnqw+1ux60zvAfXFzADbtOpx/NgWTBjjmyv8ICmQH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719395200; c=relaxed/simple;
	bh=WKBKxZvU2MK8Soj8F66XkqsJwfIx3yfyp0e8w21OZI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YAhRQ1qgX0EwxoivYq3bnV//s2v2wb5VhoYdqkV8etitdNcbsZVYX1ivJ/cVZV5rK2/duyeEh9/xRhTwkmq1nAdSVILFlsGiMEHSMRBYGJcbauGcc/WyNjgu46//2KJY5ukMm6f1U0TsitrymN2TkDMXitnMchs8Yv4E79TV4SE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=fCOwwe70; arc=fail smtp.client-ip=40.92.53.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4u60ZUrXMKWrw+0IZggSyyLCML98NdY6mJXTzt61Iou2+kZytQcWcxeOw/jFGKBEgyVFvXyiWxhHMdGYayfAPxTJmkysMTgA0jRCmdr5Mm8/4VQPvhwS50Vr7x/yzjU6Xt35cYxPXKCHomyBpYKdP026+Hl+sog3zvTuNE7iqKno10onpuyVxAEzmbgmiP27oddAWBVnCrB8gSlYlLL0r1EBrZz3+w8eJkla3xoxEcd/cWG4RMrYJtBwCDQYBHtOHRgi9cxjv9+1KhXAJGbGJoLExIPrSOBixZBZhUM1rReh6ZXgt1HQQ8DajJSsi37iYQQswLGxMTIy9hCd9tAXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6G143DeHcdyziksGhE1SSodzERSN5oypylaetk5w0l4=;
 b=Kzv+9pXJIzdq83ubCDYoI4OwCaK2dSAwu/U+qItNJOs7qSw83CiOHMHmWERuNG+HjZ1e/YsWgt0ntHysb9btvh0HFnzdSiLvghyQ3KZKtxxsV7Uzm54rfKcnM1Qo7o0lJ11Z+m7RHVKfpVwdqA90bhZ0uOkS3g0CFgf5JrrT02BdjNxrGDqtYxWizY2O2tcaoWS7BgqXYGmQhJJecmx7tVk95lPkM+trLLIQVoP5+a7ZDA6AIRxPt277NlKbCn/CeI2zHOiW0on2JLsyFWgTzTho1GClRN2MseqF+/Uch2uXfEHlqratjAjXMAunWmUGM0J7dCq/yim+pbXx8YhTkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6G143DeHcdyziksGhE1SSodzERSN5oypylaetk5w0l4=;
 b=fCOwwe70Q9gFDKz9ril+J1rs2hLqRHGsZ8ChaLRHjEtavnv/IOKjjg6RczDH+bxtuMdxy+7a2IKSpoHCtEhTdfjRXJfkclZ/GD5OZ/a9fYYsQPCQE//ImiXvnQl4TeNYeIyN13KSsZTYVJjF5aQOLPLMgMM+XgTg27ZYHjiQgdUqUpBfJAThr3ahs8AExt9jabB7gGoskM3hOgPrNOolRIQknoybD8n3SBmdAyrxz66bxEh9BUbei2Fd66dgILPsJXZkWWMVS3rEROPopKbWwxYThqW0MOu3VBBu75H/1MvngTgYUHqPqSYGtVpJYjuelquxkLu4fEQlSY1tTtBJeg==
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com (2603:1096:101:be::7)
 by KL1PR04MB6877.apcprd04.prod.outlook.com (2603:1096:820:cb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.25; Wed, 26 Jun
 2024 09:46:30 +0000
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5]) by SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5%5]) with mapi id 15.20.7719.014; Wed, 26 Jun 2024
 09:46:30 +0000
From: Noah Wang <noahwang.wang@outlook.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net
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
Subject: [PATCH v5 2/2] hwmon: add MP2891 driver
Date: Wed, 26 Jun 2024 17:46:01 +0800
Message-ID:
 <SEYPR04MB64828A352836982C0184AA10FAD62@SEYPR04MB6482.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626094601.52298-1-noahwang.wang@outlook.com>
References: <SEYPR04MB6482EE353C207DA6977C974DFAD62@SEYPR04MB6482.apcprd04.prod.outlook.com>
 <20240626094601.52298-1-noahwang.wang@outlook.com>
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-TMN: [Nbe8HM/6uT10fdkHywp3cYFG81YzsQoD]
X-ClientProxiedBy: SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) To SEYPR04MB6482.apcprd04.prod.outlook.com
 (2603:1096:101:be::7)
X-Microsoft-Original-Message-ID:
 <20240626094601.52298-2-noahwang.wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR04MB6482:EE_|KL1PR04MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f975899-d062-413f-a277-08dc95c4dae9
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199026|1602099010|4302099011|3412199023|440099026|1710799026;
X-Microsoft-Antispam-Message-Info:
	YsbWtozZ+E0FL2yz5LtnBcHZ9jxcy9Zv8XlOkCy4HNkwRRaxr0dyyU11gSZrmzoLwvOWaGKTcqucBUkZfTAo5Eq1Loqglb7Efjmv0rIBVOCqBbXCeZB+GaLs0DqiyGT2BxKNF3R2m5BRkdr3BRlolaDQarnNML6OEVfp0a6UZx4y2RDrVk5kPqltI5CiSNK1UeoWspcM8b2dYx+ym/02TKQcbfn6ZCTTJQ/HIHbCtSyrrQ1eAyowSD6UjBVeoMnihRs6MFFECRKEpS06Mgs/db31uAzuOTZliN0LgAwvTwzvHis9V9LCSartVHIdGwHC/n3eJFAVv2tFFhzUkL2gVJofCYh1laGoScj7rfXYnnF28xqqrIggJgFtocRJ/+JQrniJPkjMhcNnSBxtIXuGerRcBu8kJ11M6OY2l6yjJUsnGgoRmMoctgC0V16cUgheGJ48pDtEbxRWZb3DCgJQrGZRypoM0DferXWkXrBLDnpBO7yH5CtXVGqzQ2jhlKIErBLjgulsouPvZ5SIUVTz75soRCONSEQ5vbnKLK+JkUgdB+ErZQC9OvHsAOoW5pOk3A7TpKYYZpzkf5IQqFWyMyuiIAQHCTxF/bch8boztgEaj+3ySwvxbiJAfs9m2QBUNcvK6xI8QlBm6Pkkpv0o3WwfxfyWgLn/g/+WGE60wXrxVwz8yoElKeH50aUyBmPmrhhiXWTeWUZhKhP3ccerIXbiIx9USfWgSAWr/iO5Rfg=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H0KbyrvvPu7GNmQGgUTN0rbjuqHQ4ApomH8+hACuunjPH9hEfmgQZUL3guYG?=
 =?us-ascii?Q?XHId4KmQ9V+XPb6Lb4al79nVXssHbygnTPdbT0iAcw1nw2aFimxClUrEDt5L?=
 =?us-ascii?Q?SdrYlLCg8TiXoefLsgHEhqMer1l/0ash4PU6icTaaIISYftokrB2GK7BRJ3K?=
 =?us-ascii?Q?6K14BDG0TuWzfMmyMtyicPHdrvfZfreewCEMNGdMZrezr5lWNooXjXP8dd3u?=
 =?us-ascii?Q?6hcZKpAotTc4zcbhxzcwy/zWzucR8+dn/Q41NWtE9PUiEPUVLBNYctxFEarm?=
 =?us-ascii?Q?JeCy4+aqvyf2fyYjYsaVLZkKYb+t1JOUq5rqEBN5saCMMVCwSs6sfp8PK9if?=
 =?us-ascii?Q?f43EWmk/afIjwNKsnfhvEcGpgxVfmd5VVlJdiZB3ucjixQ3EApPwH/tflA+v?=
 =?us-ascii?Q?TRE8Mk8VzdHb+vqNvhmyFVC46jVzLZa+lL4EuilVDOS77+i+ZB7sCO+RaQKF?=
 =?us-ascii?Q?SDg6c7IrGMyXcJy7x1SdpE5SCl7wUWCtopSHeYx7lfhwFU3oQXqNs/2/7uBA?=
 =?us-ascii?Q?k4ZAFrnEnxfUKSExtZfRGalujS2y1d5Vt2ARK5mSuCjDVk87Sxkc0rx15cAh?=
 =?us-ascii?Q?sOWs/WFcvg6Z1mJIPTpN5l9NTjz9ZlXFb0Idub3LmCXAw4Jw6i2RYMw0Rv3H?=
 =?us-ascii?Q?wINuP83k4F7dDXtou/hA3RG2q+NiAK8eQWcWvSyXHNW7SjCRFuIFAKKVRZl1?=
 =?us-ascii?Q?zGR0yGfGZvY2XL/WpBAlXJD3K+ku/6iVrtaDHrrvnNPSLKI2EdbjmMMrryJM?=
 =?us-ascii?Q?nds109I6kwSh/8rxSVP2ew3zlyi/oHgoJvb3GBruoOitayqulb4/e/An+Ymf?=
 =?us-ascii?Q?fhETwN4djjH76gHiQG1Omub4t+9VIuUFWBeCfhN065mKRBsTdjVpxwLpzv9+?=
 =?us-ascii?Q?md6aBOBQwVLwa/TYOEV/XEGfADcUE1I8CVZWjo2oKU/rB3hBkqotD58ufTk6?=
 =?us-ascii?Q?BkkWLQmPUQN9X0QV9xJhVioHiW89ewVIbz6KD3uOOxVZo9U2oDdMu7ynIUv9?=
 =?us-ascii?Q?A+S6qUfIATr1QAS69CpqAb2RHSTb1rQJe1rfuOxSWUNjxB/EXUXMkZaR6BXT?=
 =?us-ascii?Q?7nQr5kws3LPuM3bRnKajFGj0iBgnrgVaaBkYhe5P/p2bxVNpExwo/7xftKqL?=
 =?us-ascii?Q?OHKqfN9cAZqYt2gR2+Y9IvKdIz7tzZEnfKw9n2p82DehgNR83oSDHd57RiHu?=
 =?us-ascii?Q?iv1uHSGQWhMuLZWKgB/9tt2X9DjbHuYirC0PFq0lKO6+3Fr80b8mbwCdNZg6?=
 =?us-ascii?Q?3q3BUf2hLquCVW7q4tdd?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f975899-d062-413f-a277-08dc95c4dae9
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB6482.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:46:30.1652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB6877

Add support for MPS VR controller mp2891. This driver exposes
telemetry and limit value readings and writtings.

Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
---
v4 -> v5:
    1. remove useless code in mp2891_identify()

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
 drivers/hwmon/pmbus/mp2891.c   | 600 +++++++++++++++++++++++++++++++++
 6 files changed, 797 insertions(+)
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
index 2ca8f35dfe03..8aaf4108d24e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15255,6 +15255,13 @@ S:	Maintained
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
index 000000000000..bb28b15a9103
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp2891.c
@@ -0,0 +1,600 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for MPS Multi-phase Digital VR Controllers(MP2891)
+ */
+
+#include <linux/bitfield.h>
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
+	return mp2891_identify_iout_scale(client, info, 1);
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


