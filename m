Return-Path: <linux-i2c+bounces-4368-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1AF917CBC
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 11:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F3211C221A4
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 09:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1740E16DC05;
	Wed, 26 Jun 2024 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="bDYqTNGZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn2021.outbound.protection.outlook.com [40.92.107.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1317B16D33A;
	Wed, 26 Jun 2024 09:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.107.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719394913; cv=fail; b=LO3bAG+4CFYTvkG3HzxO9LTC8bPYhMeZriW+wcbvyiYXVx0UEU3vGyUfCuU3BNezF9NSBNzrJQP2NMFeEgD08WtlTC7cbU7d1ZDT8c2uCd0dLfA7MrH/uvIURwJfPp6lnvcffRBmjFfMzpCZgHOfhEppMbAeXRRs31HSUUwInag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719394913; c=relaxed/simple;
	bh=50g6sRfgx1/t7QamK3wBhoAI7vzV5xtuU0LXzLiMOiw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AUOT00mbkNsY1LlOyYM5I0V4cRHaVXherdeTxWzinONDa1XOpVtSJ8V7VxT5QVwnfgmMiWFQWGSdfUJr90KHfEPBPyWfvIKvE5QX7ATzbJ85imjchIsZbiCjqE978MBaBrx4DHdPXmZAn8MeTR+ZwEupn+WE3VZ2gJUz2x29S2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=bDYqTNGZ; arc=fail smtp.client-ip=40.92.107.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+aKq6U9Xfr4kYMXheD9aKQ46fSUv06Sw2YV0rau4HpdRSJNGpsIC93aoSXAzjxmnPnE352JX4b3PBoP4RFqg1FwxIlSIgLMKSxHK/2LszBZ/dTZL1YDmWLlY2JAC6Gu2GkQ0ZL57i/+7RsNlGy7LALjrDsF9g1blOMxuuKkkulSKDAcNPDTiGwHgbyDpLK6vksjLXIW75IpyFV2QZ2JXNyvVmd36O7+F93Tj5VNM4Ut0XyNr68Bc1JRK/kB6tdzAXh6vPSR8uEc64+WtLmultls/a3+yTx/Q4yDXXgyrCljpQzyA0YbUCX6MQlqBgUa9AJFEY9uEUlwj6/5FQjhCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bvb1teCh3/N7hnagGkRfo/F/3hifXIp4vV/RoCr9zJs=;
 b=kLAwqGNBoGQQcG8k/Aq2Iwajhp/8IH+ey806s05t9/5xnYv7hQxNr8+QcmsgcMpLD2d8AxsaKyN82TOUe27HKMe/zLny63YNo/yiv43ahBa3OP22FR1kaZhailKVkGAW+oIDr2lEpxzwNtOdVVWwu3XuVYFvkcOQTiT0LjA9Odqf/8xoOPHj2yAcPET8WrU1kXYKPvxGx3kQC68Hgb645/Vo1A0Ni43rzVnXorq8bwTbfkJaPLeP5XMPdnJT+9igsFUA8NRpsCJLdsTwyrZN5TKW5f8pNJnp5NYQYW7Gq14d/Ec5Puqo/C6HCykUTgyyjNaqqu9z1PCOYgde+saMCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bvb1teCh3/N7hnagGkRfo/F/3hifXIp4vV/RoCr9zJs=;
 b=bDYqTNGZOHibfiffhfzFMTsJFiZlF4AjQpnhXiiG9hms2zNFRbYdwXI00iPcCdHXc83dV/LaqV9SwyL4izMmX+L2jB6/gwXDTRUVq7V2quGZ7W8OMALFIZ2OK6LSDh8cUlXT46nmNcIpewtbNuQMmJWsOeFh3BFl/b6p1/vawu+VDlmoPO97EPrUGmrA20Zz8+l9+aH0FfgN00aBAmKL3Y70P/MBxD/Iqka+13GQzho+pQ9n9eZthFlryqZ7bpJbMxABISkw7Q2aZ9C7iOHaw90y3M7kGaJVyARxndtuD0ORpSyTnLLPKDfoO6PL1u7uFKvlAQhQ89f+j0D2ZJ0i1g==
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com (2603:1096:101:be::7)
 by SEZPR04MB6827.apcprd04.prod.outlook.com (2603:1096:101:f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.24; Wed, 26 Jun
 2024 09:41:45 +0000
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5]) by SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5%5]) with mapi id 15.20.7719.014; Wed, 26 Jun 2024
 09:41:45 +0000
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
Subject: [PATCH v5 0/2] hwmon: Add support for MPS mp2891 chip
Date: Wed, 26 Jun 2024 17:41:02 +0800
Message-ID:
 <SEYPR04MB6482EE353C207DA6977C974DFAD62@SEYPR04MB6482.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [5NPxxu6YlqkAoDp5mm7wVMIkacgQ4Q0q]
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To SEYPR04MB6482.apcprd04.prod.outlook.com
 (2603:1096:101:be::7)
X-Microsoft-Original-Message-ID:
 <20240626094102.52007-1-noahwang.wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR04MB6482:EE_|SEZPR04MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: af7da3f9-7bfc-4fb1-3625-08dc95c4313c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199026|3412199023|440099026|1710799026;
X-Microsoft-Antispam-Message-Info:
	lf22tjlxIbW8BGafW+i9kEJvG/W6voRAi0WDoZxQ2mj+CSh/Xjt9jjKtEFmXvAWGG9xzlLbgHJ28ctY50GpiVZcCycSQOs/BQZSdVF/wPRxYoI8L7ffPMrzPEiCZ0gJ6l0VSrV5XASVfnyWJpaDDlutGSeEC5qeH4OXEDG8tJhk6xBAApnU0JApTpf9cPAelz7DbbWnEGmlnKYMYtrVmYj7BTfxMI4nCHiLRHjO9MZ9RxDZDdskC94j8UyCR4A/oa51tt7d4RWlz/KMVkktlVLymKd8midu08ohBNYXIWTLmfNXlvtaLYFx4SZcSrogUAlGck7BQKtFE5us39L8RjfzjQSML+bOihqvyGh2w8sKyJ5QvDf6mftXqOocQea0RTCkAouiAa54Lch7BSokSzgoNw2r31owFuBtwrLtSEsru8NBpOQw03taWEcL0fZVo8bga1eRgiBi4QGm4r70M1EHWgD3QrAE2XjT4pdD7lw6xthDUaTdB1KHab4+VGWtNgMEUPO8aXLXtz6zBoQTh4/3ade9eqkqe3sYqPSUx+UiHAXWikxRwyHasmKKeXLZTaJVh9vHpkChD56EsOwpv1MhEUL48N0jrxsAyhrL3Jbsjw1SBx3cOk0igv0qXWZCU
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lwbi4l9l07sGiaXCVVzXqzkAETdQCOsDXCCIcyNrceAaL0LlW5bBdqqekQ4J?=
 =?us-ascii?Q?i6/WixC4L5VeeCu15oQfuh7BenMW86fKXf2FZrBfBxGHXk/KD2cNePBlzY2D?=
 =?us-ascii?Q?yRWzF9AvL/w0iT4M9Mwv5cbFZeqU3lza8nWYa6XgnQOhXkqc30iki/J5kcH7?=
 =?us-ascii?Q?IvgJWwrah1Sx+APRgKF7TvZeJQl2vzbKDWy7dRjB+6JFHB8Xx8/rYKTyOz96?=
 =?us-ascii?Q?cK/EuxHmw4E5NHfZsEOKhH49WZNKBDjMRkcJT0HWnydkVd3VK5O77PdfWvJH?=
 =?us-ascii?Q?lD+EbgqyqCe0vIBvCPVRvOPRC6NwbL98+jRwlBnwpmtq/ZgHSTifhdh6KZYZ?=
 =?us-ascii?Q?pkatoPsx+gLITampgEkzm7FJekzWlf7aefIltfFE0rPcyVE8MY7nkfX+EUVn?=
 =?us-ascii?Q?ffAA5oTgS3XtulgXLxEP29OsftrydAl/lsG8PV6e0zWcPJgpmcconjANjSjc?=
 =?us-ascii?Q?DJlZWPd9UwYN5+loZzVF+O13YZUa2LRXpU5B43+3JqoP1Go0oIVFZys8i4jP?=
 =?us-ascii?Q?UcBV0qC2bJqBFtUyiQp9+6g/wg9pSzRQatoxcnPessaZ63FVJX+EVkiIdqT1?=
 =?us-ascii?Q?eQxiBkVecE1jDU0t2XX2TFd+3H5X7wy/vKcJlF6hDg468dLx5RwhQFrHQlZ8?=
 =?us-ascii?Q?YnY9V/bPa7tsFVu+mZ8RM+BSU9exppR/AatoZkVSFsMEKSIIsRKN8JJ0zOZp?=
 =?us-ascii?Q?jGfutcpBX/hqSzSG+z2miunsXZW3bE/g8Ric9Fg8rboNUybFjW5mewu7cz6j?=
 =?us-ascii?Q?rIJvOu0qLw9iP1d1tr4C4acIqwtnq64wYBuBkrLZWs6yOcFc8BM7OTqr9Wsr?=
 =?us-ascii?Q?3s+PQGqpQYy03Y7Wbsl71Nba16SwWhjKNiXz6nE1MOoFl7WKSvJ1PGlg8plT?=
 =?us-ascii?Q?FVCPOw4JBJ3BiSaYRjpc0yIFfE0o7NVE5XiLKK/a0T9fChLk09nJJdk4ilPK?=
 =?us-ascii?Q?Q7hqt3spVAXhOGJCcAZ87uYNfckE5+jSUj7MShWYww75rG8RS45B/+Ei/f7T?=
 =?us-ascii?Q?0evBnlTGYtq9Rfd7jGvN+e7JxElgVGGWSp348SX/8wreYaKgIwfvFcPLXf7F?=
 =?us-ascii?Q?2cfi/yYwWru2Fgm3hidycUwFKfyoyYFfktiEK7BBG7kAX7Vp1cwTxv031pE+?=
 =?us-ascii?Q?ty0+CGCw+/BQSRiPalzsIkz0kuEcA2OJxOBcd7N3or1mRBELAh7ho9RSmYp5?=
 =?us-ascii?Q?AFXNxl86X9Pwx46cj7LUJP0hnJiJnZOMN+arb3yb9RtMG5oJk4feGMY9h5Ot?=
 =?us-ascii?Q?AC/vp8Vn8yQnWowUfJNO?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af7da3f9-7bfc-4fb1-3625-08dc95c4313c
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB6482.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:41:45.4387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6827

Add mp2891 driver in hwmon and add dt-bindings for it.

v4 -> v5:
    1. remove useless code in mp2891_identify()
    2. add Rob's Acked-by

v3 -> v4:
    1. add mp2891 to Makefile, Kconfig and MAINTAINERS file
       in alpha order
    2. sort include files in alpha order
    3. fix some issue in annotation
    4. remove info variable in mp2891_probe()
    5. add const attribute to mp2891_info variable
    6. add mp2891 in alpha order

v2 -> v3:
    1. change PSC_VOLTAGE_IN, PSC_CURRENT_IN, PSC_TEMPERATURE,
        and PSC_POWER format from linear to direct
    2. add limit register writtings.
    3. fix some coding style issues
    4. move mp2891 dt-bindings to trivial devices

V1 -> V2:
    1. add limit register readings
    2. add status register readings
    3. change PSC_CURRENT_OUT format from linear to direct
    4. add more detailed explanation for special processing
    5. remove useless code
    6. move identify vout_scale, iout_scale function to
        identify() callback
    7. update MP2891 datasheet
    8. add mp2891 dt-bindings

Noah Wang (2):
  dt-bindings: hwmon: Add MPS mp2891
  hwmon: add MP2891 driver

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/mp2891.rst                | 179 ++++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/mp2891.c                  | 600 ++++++++++++++++++
 7 files changed, 799 insertions(+)
 create mode 100644 Documentation/hwmon/mp2891.rst
 create mode 100644 drivers/hwmon/pmbus/mp2891.c

-- 
2.25.1


