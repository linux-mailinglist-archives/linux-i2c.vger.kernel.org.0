Return-Path: <linux-i2c+bounces-3970-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CF690389C
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 12:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B724A281A18
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 10:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A59C17B51D;
	Tue, 11 Jun 2024 10:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="qNOOfkAV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2080.outbound.protection.outlook.com [40.92.52.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4305817B513;
	Tue, 11 Jun 2024 10:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.52.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718100897; cv=fail; b=MtqQrFQmmcn0jid55wH4sBtj/s18116DP/O8sJYhilXs89ZvtWOjd0Sn7XpvQr7x191viiaajVThag3dOhP8YbG4L8ygKNj1ljbVUV1kcEsY2sh8cHVolwBl1sa46Ghi5Xyql6jPOQ4frYeUSwrP7ErAN5iaOPGMl77XEPG4kps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718100897; c=relaxed/simple;
	bh=eHOVz/2RiWAJTp1O4iHV6eJkIvy0FlBDhPs1Zo/MTeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uW+HRk1Y1iO/umAf5bvjqQVcKWMuwWOfm8BBBoPbext3hzLVV4gj0FcQAcR6jMNQ1N4vgr9Rh7xBL+x4C0Je2F/JxvNjNb3hUeZ/A6H5dHSJea3bKVpnu73mWQsxnAeFTlZy4Q5xn3Q6/07FNvGym3xI3jG70zFf78PqilbMT/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=qNOOfkAV; arc=fail smtp.client-ip=40.92.52.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLYAw5zL9BZ+8i5PSI7XAAlOWojZUl999N4hXWAUMv5aDY9BlFAFw5eFGEUgMaSBurIopf1BOoHvUu70CxizLVjth7IAUBLoeLKPAb5r3PNWIHrA7/63SCNyCAg3H0RKxcosoiwPZMCaUlaZNZOz42wetawhqJwsaZhdYgUtFLcYuBrxO0s9nr2ECIsgbErDdSQliYrAo1jvNCtT+AMLgIix7IHDVmR/gU6Fld3g3c5mdon0jqgsRh9H/PeZgL1VRrp+56WE4h2cU7YzIIdsW3g2AidvVba7hGOYghvQSm1I8vF9EwWGR2s4t3FNCgF8ZTaJ1NB2V6IgEzhdBGh9/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDTWhPwFqLtVKUg3P9kCjsCdfZz4YGA4tvsjnY+ngSE=;
 b=Eu9lamLki2FXrF1enWE9THDy9X330eJqTtB6p66FTx3uxn3rxtX+I5HQyCmxPsEqMWkqiSrqC0UB5rXRBl9b7AnwPvtATkexJQDrQQYw7AHNJXFGPZNC6OfXCucUF8YsJ+uPv/Rmm5dx7l36QPUzeS+JpEPqJzlPac6MrvFumpVlkgIb9Hf5/8yQ/eZxeIbBmK+MZ1ylnaRMpiGbM5NOGYh2KAw8QAPebb7/U16vFHqgF9lELd9EoDpV4uCJTId2PJsUZV4AwjiXcXmcFDnB8s78sR+kMb+F5w1+1lc4bFa+ywf4MCp64s4Xqs1bjQOniUl7GeWU2D6KZ+0bQfzFwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDTWhPwFqLtVKUg3P9kCjsCdfZz4YGA4tvsjnY+ngSE=;
 b=qNOOfkAVQN2jdKWq19ln2f0yRQV+04TC/16gotfm9YIy37hOO5W0vwRGEv+L8D9VWfjwU0p6DTP54mkrQKGYFPw87LskXBl435wewuVwwazGcGv6Q+KfUKw6/MI/3d45V8Sv8GatwY6+4xbONa7PpAs6OoeCDtLblL/H62e1Fq4DXO55KtE79Qh7bWDrYpWCfwVq7nCaIwd7dy65UI7QDn2CkCnGF0FsT3+JIjT7t8Pn97/De95xr2dDG+xASjKKiSGxhRzTftYd0KPb/iuiHHCYW7qGyAqE+RbzUYtNGrHLHLVdpHtqEQs5kEgb/z6WxKoiVM/OhBZMBIaHeHjvkg==
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com (2603:1096:101:be::7)
 by TYZPR04MB8231.apcprd04.prod.outlook.com (2603:1096:405:bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 10:14:49 +0000
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5]) by SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 10:14:43 +0000
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
Subject: [PATCH v2 4/4] hwmon: add MP9941 driver
Date: Tue, 11 Jun 2024 18:14:17 +0800
Message-ID:
 <SEYPR04MB648294005D55F70736B519F6FAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611101417.76911-1-noahwang.wang@outlook.com>
References: <SEYPR04MB6482721F71C0527767A149DEFAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>
 <20240611101417.76911-1-noahwang.wang@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [ZiHVcGdksCcvhaPkaBonr4XN/es5OKvX]
X-ClientProxiedBy: TYWP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::6) To SEYPR04MB6482.apcprd04.prod.outlook.com
 (2603:1096:101:be::7)
X-Microsoft-Original-Message-ID:
 <20240611101417.76911-4-noahwang.wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR04MB6482:EE_|TYZPR04MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b0ea650-99ec-4bf8-cfb6-08dc89ff5016
X-MS-Exchange-SLBlob-MailProps:
	qdrM8TqeFBsqf8w0KrBP0QUs/UKQ/ZGbmVPmOtBRCfKhuEQ0ylKv6psW01r8gzWloRvSSlHvprXszoYvrTcNn/JARAIcHg4/5w2NHnxmCK7e59kJBfsjOOy1O05uWG3DZ6iDYPN4uMmNNx8Wu8J8QtCCBPkcRaOjCVBgynVS81upfP3/IcMELOfISZ0gMcsqjGQfLixdpEz/5zwVgNqlscd6+/oon5UtbB/Lq0ggCQSZlKWHwszjK9J1djlqVmhNiNR7eWUpjl322NJzUGwaIdQkInshpAIqAvUXVLCUEB77gZzwuywyS2F+kWEYHFOAHoCJEv4SfoBlnxWbqst14Is90EWKCq7GwqnkwOODPQZiJm/uERe6ts5Pd8liV+LyehJl5wNxkq+Qxi9F/EJ0XpqH0sQk/06wdTgn9CyRvPItHGZw7Q4Xv3Ywui+XZxYNVaGj0KYKZSdmxe6yNcRlSc7wtRQkvtUIm5NwcBS4nakaVgoXtTBFAIV1/HrJZ4tCqdFXUi6MOLjDq5WGdVwVICF9NohnJx/+fGgVv/ZvmeGNkMKnNphllj5spLD6/zENXCIt+IvWE8puIakQ83xIBwyCvdnRw7ZlRwnIEbsDxhOE5JaPEEC1lvCg/dVNK/mdKl62rB5hmsWz7uJnYBY0+5HWGQw9vm4s9UKapBf5RsC4bu75Si8EbxEtwxKpqRgaCTm+XKVx/aseOdV6VUKUf1e/lfQcduLPSGrlRN8VHA+2+UCjKNwrHm1Eis7tDuY4wT7EtcXlcz4VuNfeOki6B53U/LK725CW
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|1602099003|3412199016|440099019|1710799017;
X-Microsoft-Antispam-Message-Info:
	TlQE/MSffsKaWS3QuEu1kc7fTXoMBKRizSuxEyyBx2zgXrEZpHBG082f+W8tGcgwOiTTt44R2knlkebXCOv9FiIkaMbkyWMbN4a+hnO3FddWgNyolGokQoaY3i1zYSHMJV2Ppe4VrealWQmZfgY5onrF4I7Ra1ODGscDngddqJ4mYGwxvAAaGpj4Qm9hB+3zQ74HCJNoGqhDOQn7j4d9vx9fNUpY8GqQMjIgGvSwuWP72M7qWO2sjcB38YLD/EKz/s4BIIGVL7VzQ8q49L0bzvXotT1aX6eeIbsP/gsLex5fmvbi6L97mjYudmrRYtVOMhs71xzXG+SgodV5CMYgyBOPcDggt22sWRfinEky+/woANrPN/BBFnBf4tRKchmYp8EaI1prO1oHzvac7N8phHOuLGlxP0F9XRrPBkI+zRIy09da8BwkUXubQND6+Vu2xdhdxz2lReTykyQMT5fTSaGaC3t8ElXWwu8g+a0v0XXTd7iGtEp3KBBO9fI2FRR91JbvS6ZyJamb4i6VAQ9cxYNYCDH4C7hE9KZ8typUwmleWmF8WXECFolQOyrMfiXNu+TpZLvFvjatx2YUFwrIew/ZHKjkMsdf76Ygyym/DBpn7EYKU9/XSLS2wghxCijAAuSzRs1p9zuD/t8V5pay0phPatp00m4JqyA06hMOYncxUQm2xN1iEl8REWZnoWmv
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B+8y5DFm9ZtnfpylmFDBwQOi18rjY6SkesAIiLnEMytb2Nc7QAqhDV9Y0yOz?=
 =?us-ascii?Q?ix1lqZ1omM3LdwkIT1l22c1Rl9TUm9Os1Vc4D7tagaBy+s9mEJU8pS/1LH2D?=
 =?us-ascii?Q?xKVyBhwBIom6ns7fn18RK6n82yq9f8AYsBjQFufaAsvxFNVGXGzJMuFCKXiy?=
 =?us-ascii?Q?8KHpY0X9wgFUffZQFcwU9AhP2FdSEaKiA3B9I1c5YEX6hx776kV0RkMpuWQf?=
 =?us-ascii?Q?n8JC/+liduIO3brg58+kbdnnzovZVUJzXRcPqNrwkGfMjOrOQ5Ef+vDWGa79?=
 =?us-ascii?Q?inKITC2IMltFML8po4gH1m80lL9TyZDWE0GmmGMg0ZZvjQhuXcEA7sZ3d99K?=
 =?us-ascii?Q?trC40NrJjVY49Sj4ZDYk3Zztx+8eiNkMcLrI4pRyYIzBVEQeQghnPF+/jAV+?=
 =?us-ascii?Q?4br7CLPBnMHuqEYYLN+kIBDWpiLX4hh92zwDg80EQEzgl45pMX1q3TBdtsud?=
 =?us-ascii?Q?6hx+TE/nnTciw/9v2OpfviubVCsyxEBxMef8ULuN7+q/hKeiCLFUWz60RRzp?=
 =?us-ascii?Q?hAv7QYTomCspHjQAjZpDG6pzDJn6nfJDZdrxaaPgh3qyNu0t1LhuREn2VjnV?=
 =?us-ascii?Q?6UuqlITo2Vlv6CfAGZgAhRwoKM7zpaR36J8/Z56IJKvnTV+c0w1mD2FnV4f/?=
 =?us-ascii?Q?FcVd+NJjeg24RIAg0PSUDTI5mJAJdKTzZY4xAcsQ21RIKu7l+nWbTvye1fe7?=
 =?us-ascii?Q?mM39ENom2+9CwbveRMP+7RNmYLdf0rwfJe/8Ytm4y1hjS8crVK89iXVykvqb?=
 =?us-ascii?Q?lxHHLZfSEkc3FzOdT/2PUVxMZoOqgbnbVvkI2YUoNK+umgnW5dwhGSDZ2sOb?=
 =?us-ascii?Q?B6oE+MezRisEjzhKe1zrQUCX32ku5bfOVRkK75sM68+g5md0OiStrcDmcftq?=
 =?us-ascii?Q?87/XaIlmXO1I5qz/pY8Ez0SEM/2agjOFNzU50ZGkyoxUk5qqFnA13J72CeWR?=
 =?us-ascii?Q?cmxAUHjKcSdVj8ihTaMMn/Q8MfpWmXvgnBsjn1PvCQoEo3wFUAc1rLKFLm1k?=
 =?us-ascii?Q?OPC+uJTXoQDI6aXOmrlWBNXdE2Tjs1w4Qjv23P3DXDbUpEhvdAm+w9R/vJD+?=
 =?us-ascii?Q?eajVWvu9VvcHSA9NKHvUzq/4kzqV5zrKUgwS4+YrDmHEKqx9ZIjWxIr3N/rn?=
 =?us-ascii?Q?sFP0VAAA0gufQB+wdQ/Mp+wFznhjpXKoH83pDAG1HDaY/YX+CwQ79tT6laGu?=
 =?us-ascii?Q?kvu9JOCzsv7voldCtO/EF4ksyOf6hclmjibLEvDVssBG9FM8pXMe6+XsNyPJ?=
 =?us-ascii?Q?uNm+yo5zjA27PFVrG0nI?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b0ea650-99ec-4bf8-cfb6-08dc89ff5016
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB6482.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 10:14:43.6447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB8231

Add support for MPS step-down converter mp9941. This driver exposes
telemetry and limit value readings and writtings.

Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
---
V1 -> V2:
    remove useless code in mp9941_set_vout_format(),
    mp9941_identify_iin_scale() and mp9941_identify()

 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/mp9941.rst |  92 ++++++++++
 MAINTAINERS                    |   7 +
 drivers/hwmon/pmbus/Kconfig    |   9 +
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/mp9941.c   | 317 +++++++++++++++++++++++++++++++++
 6 files changed, 427 insertions(+)
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
index 4fdd787b1401..14dfbba64a54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15263,6 +15263,13 @@ S:	Maintained
 F:	Documentation/hwmon/mp2993.rst
 F:	drivers/hwmon/pmbus/mp2993.c
 
+MPS MP9941 DRIVER
+M:	Noah Wang <noahwang.wang@outlook.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/mp9941.rst
+F:	drivers/hwmon/pmbus/mp9941.c
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
index 000000000000..b7b0eda5b552
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp9941.c
@@ -0,0 +1,317 @@
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
+static int mp9941_set_vout_format(struct i2c_client *client)
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
+	return i2c_smbus_write_word_data(client, MFR_RESO_SET, ret);
+}
+
+static int
+mp9941_identify_vid_resolution(struct i2c_client *client, struct pmbus_driver_info *info)
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
+
+	return i2c_smbus_write_word_data(client, MFR_ICC_MAX, ret);
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
+	ret = mp9941_identify_vid_resolution(client, info);
+	if (ret < 0)
+		return ret;
+
+	return mp9941_set_vout_format(client);
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


