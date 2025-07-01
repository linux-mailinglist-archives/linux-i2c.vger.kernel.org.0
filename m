Return-Path: <linux-i2c+bounces-11738-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4A2AEFD9C
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 17:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34941189352F
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 15:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0E2279324;
	Tue,  1 Jul 2025 15:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="mYxOjZNJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011024.outbound.protection.outlook.com [52.101.70.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B0E2C859;
	Tue,  1 Jul 2025 15:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751382222; cv=fail; b=SjDIHNmupPBTYG9aUDtnJ84uBJZu1OZwSimyPnFIx0OvNI0fFROQ0QIL+5iMsXfckg+tHpuorzeaTQS7rl46PurDlF35Zh838G++1eFaJcEwxvUIHWzdo5aybVPHLBKnpvVAujGmhF+hKnB7SghMU/HdJKqLxdPibOSplZ0tNXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751382222; c=relaxed/simple;
	bh=uiQjawCEH2gJNa8Cg5jkQFm/sMr+glPGAN8lOF+bEGw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iCyIcsuiY5AqUse6ryGjqQY3QAmvT540bqGuraAH8jOYz8TT0DtQmUjMh/kMifxXW5/NiScJ818MRid86PJFAPjCnPUreied52jUWcsivRSxS+jsczh4n0fwLnWR0znXtlNGAnvtABoLQexfsOkHxnzCrSR7FrgDqas9rc0e9oo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=mYxOjZNJ; arc=fail smtp.client-ip=52.101.70.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8MOSp7pe9k2H4V5YNRU35tsMd1sXqx6mhVs0xUQrlky3RlLkX4SxN5oX2bE7IAaFIpnLkxYxwQlw+RmLvXb6qYu7fjCkqvZjkcmztbGc08Znp78Qctuw/cwNxcFa0y1AJobiwfsfpXsk3wrUMeACpxuDU3D4IMCt9Bzf4ARVsPNpvzsu5qDB60SStb7bKSrkXHTIjnfAjNEn80ULZhnZcCrPzRcxfaLkTn+7S2dCSU8FlVEqlSWUqV0xO0nmF+pdA2sCQIHe1X5dKBAHnjZQjuJjOtsK2mTAY4nvzMXMUdX2zEO1DwvMEQZinCPUqzICd1ox0ky3DF6vnvItNTP1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cAneGTSKATKMTpzy7/kfCOmcH/oE0TYc+IG4grBVe8=;
 b=DKHjAFitay6diFoAXTGTagi7LuMA/kKWiIErQrqQe7yz87dEx+2STUCDQe/k7UYLuBaNoKeM3OHa8FtlnuDNaOU6QrJqY+O9O8bBUV8Jugyyq1cL9B5DAW2KGEjnbbrLg9YpCB8gf6xR+L+TIJ6fc9twdhsl7Ex37XKM8JDxSE7hqmjqOaQ2SmtjlT0CC6emBOsBhDTzgGiq2pxBRTTlv0ARNuwHV6J4GEy1GzWFmYgxsKiAXyd88Cz7BHfiWRmNn0XBDPcbSpnJPGYcCiZlpZ6fzdfPV0jRRTf277Xb4rYssA4FbDXBXnleQx13vCi0rAcEG/A83CMnD5f5lRIM3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cAneGTSKATKMTpzy7/kfCOmcH/oE0TYc+IG4grBVe8=;
 b=mYxOjZNJrbjF/Uae6VK6SEzC8J0Px0RJS2OT16wRZ8bWRZCdsYSiORWRyuL7rLp0lOuzTHT7WUjFw1vmAOVJIlfc5iZyeYmruM3gabjheYWjkiL3MFflZzD5S3M1DEtG1kgleaGFFMcCd2nCedRCcjwJ2glBFDNrTpWOZaNda+Q=
Received: from PR3P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::24)
 by GV2PR02MB11370.eurprd02.prod.outlook.com (2603:10a6:150:2a2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 15:03:34 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:102:54:cafe::b6) by PR3P191CA0019.outlook.office365.com
 (2603:10a6:102:54::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 15:03:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 15:03:34 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 1 Jul
 2025 17:03:33 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Julien Panis <jpanis@baylibre.com>,
	William Breathitt Gray <wbg@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin
	<peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
	<Michael.Hennerich@analog.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Matteo
 Martelli" <matteomartelli3@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
	Francesco Dolcini <francesco@dolcini.it>,
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Subhajit Ghosh
	<subhajit.ghosh@tweaklogic.com>, Mudit Sharma <muditsharma.info@gmail.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>, Song Qiang
	<songqiang1304521@gmail.com>, Crt Mori <cmo@melexis.com>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, "Karol
 Gugala" <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>,
	Gabriel Somlo <gsomlo@gmail.com>, Joel Stanley <joel@jms.id.au>, "Claudiu
 Manoil" <claudiu.manoil@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
	<kishon@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Sebastian Reichel <sre@kernel.org>,
	=?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Han Xu <han.xu@nxp.com>, Haibo Chen
	<haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Mark Brown
	<broonie@kernel.org>, Avri Altman <avri.altman@wdc.com>, Bart Van Assche
	<bvanassche@acm.org>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, Souradeep Chowdhury
	<quic_schowdhu@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: <kernel@axis.com>, <linux-iio@vger.kernel.org>,
	<linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>, <linux-input@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <imx@lists.linux.dev>, <netdev@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-scsi@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <sound-open-firmware@alsa-project.org>,
	<linux-sound@vger.kernel.org>
Subject: [PATCH] Remove error prints for devm_add_action_or_reset()
User-Agent: a.out
Date: Tue, 1 Jul 2025 17:03:33 +0200
Message-ID: <pnd7c0s6ji2.fsf@axis.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A6:EE_|GV2PR02MB11370:EE_
X-MS-Office365-Filtering-Correlation-Id: d1c626fa-2cf1-4b9a-e4b3-08ddb8b07380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CZ0HQPMSo5LyGmbbgk5k7hxK7WQ0xrWD7nfY85QTZjo4IFtCikp7/DAGu5lG?=
 =?us-ascii?Q?MSMD9HQUU0PKce7iCIu6z9P1ildKGw/vC6cG4QNHgGZOr6yPVxPqWW2AAoBj?=
 =?us-ascii?Q?c2aLgnnTCuqHlwgpb05+zDXazmv/mIoNrmwF38QbXSb6gpeXFE8Et69wyUJK?=
 =?us-ascii?Q?OuE7enVhjjK69WhtGpR6FGNDN0kdkQD4K+nxcwiWDUJNAiN9m/StP5Q6vESy?=
 =?us-ascii?Q?Go/Y98Vn906bzhJASIgq4Eb3pW/XysRSMRpBqxQUBI0HqgYENVBkGB5TTxC3?=
 =?us-ascii?Q?yfAcA1pdupcpeQFot3xdin+En4EJNyFfMju2iGvGqwrRX/5vx2X3jJcoffjE?=
 =?us-ascii?Q?ui3tiNExN5sWiHsUBwXCeGxWWdO7OnJlVEvGTYIMsqoiP4YleuNdGDAT8Gi+?=
 =?us-ascii?Q?rpuOaJvSp3MrZK6gfE72HAZoT2RJnhevNv4AXiLUsYZjZ9gY9lWKKVNLqB+I?=
 =?us-ascii?Q?zRdSFOdf6TjFB5kLZKOLgqSLfL/fzto/JZiXGAr1v6zFFK7BwPJeZo//XdbI?=
 =?us-ascii?Q?Q4QUf/hkaTn7GmFIaV9+przl7qthOEqNzezR8PswWaiIhgQt6wfmDUMFzTwT?=
 =?us-ascii?Q?fjbryFCGPhJPeXsrY0gIEkZe8Nb0y4Sk/xH7eTPiCBQ96GGhg4jzO9D8eMRA?=
 =?us-ascii?Q?OVUWByPuJu7VvNAZfWRVzJHsrS3BqYPqC8eEePflnMvJ7w5q0cXw4Su1Ng0R?=
 =?us-ascii?Q?I4rVR0pT8j2mXryxigBaD01BqqjH211vnVjmmd723i/H2uycKzY/hIKoyuZ2?=
 =?us-ascii?Q?nV28LQO8dYgqTBNhwricNjMPdEm24go1hqT0PPC0CkSBkmEM5qZ/UT6hCiiO?=
 =?us-ascii?Q?gg3anP5dkvKJsbwYj79KBEvS5ET20b54Xdg2LoMgL8V06Wxmf6ICxZ6JnKBy?=
 =?us-ascii?Q?78wxccmXmAvy3roVVTpu3trkTrdYjPtgZZiMryCJ9a/NGU/EjhcGAL+wx9QB?=
 =?us-ascii?Q?/IYwQfc/6ZkKYB6eBpPxnV5hKAax5HyH+9CTff1qgSBSVs/xdRsjJxuKIEc5?=
 =?us-ascii?Q?8kZPKEXz8/Uac6wxK7gx75fiV+T3iN9Ztq2YFmdy5RhIWSisHDhSHmBQ2fZY?=
 =?us-ascii?Q?k1m8Kqc1S4kWXykEItKlaBq2F6ci2qiB4xe8aLPV+jWjzcsM0OnD4djrwx2X?=
 =?us-ascii?Q?QIPaMdEIzWQqnoB0g7yTAdc43eu6WjG3aARLlgx2+VYATqAyHSgiYBWDmmkW?=
 =?us-ascii?Q?POFErlXeuch+vkldpF7T9RnPFFQZbK87JMUD2P94epugIwzCB63eeYbj8gd/?=
 =?us-ascii?Q?5Pqa/iNrwr4YGqojPOx/d2pVy1dalA5QqUeXysHsZEuhTgIINNBqu7P2H2t/?=
 =?us-ascii?Q?2U1DGVwRXzcNq/kjevVTB7HXrmXiFHX8C9hfMD/avjWTGSH+e/NEk7SshWDU?=
 =?us-ascii?Q?746CI2cN7jdmskfpYv6b0xYh3iIfSChCb4Psd4yTCVvWj+eCIyriS+PaPnAw?=
 =?us-ascii?Q?Di3mXonOfn9+g4krYinftFFk2mBEkRqt6KihXGPJNy9kVP+Ss6isndsZ9XKO?=
 =?us-ascii?Q?gUq0hGDO1nGPF9A=3D?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:03:34.7469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c626fa-2cf1-4b9a-e4b3-08ddb8b07380
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB11370

When `devm_add_action_or_reset()` fails, it is due to a failed memory
allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
anything when error is `-ENOMEM`. Therefore, remove the useless call to
`dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
return the value instead.

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
This patch was inspired from a discussion from another patch:

  https://lore.kernel.org/all/pndqzz07v0j.fsf@axis.com/

The calls were identified with

  rgrep -A10 "devm_add_action_or_reset(" | grep -B10 dev_err_probe

The resulting output was then parsed semi-manually and the changes
created with the help of Emacs macros.

 drivers/counter/ti-ecap-capture.c                | 2 +-
 drivers/gpio/gpio-twl4030.c                      | 4 +---
 drivers/i2c/muxes/i2c-mux-mule.c                 | 3 +--
 drivers/iio/accel/msa311.c                       | 2 +-
 drivers/iio/adc/ad4130.c                         | 3 +--
 drivers/iio/adc/ad7124.c                         | 2 +-
 drivers/iio/adc/ad7173.c                         | 3 +--
 drivers/iio/adc/mt6577_auxadc.c                  | 3 +--
 drivers/iio/adc/pac1921.c                        | 3 +--
 drivers/iio/adc/rockchip_saradc.c                | 3 +--
 drivers/iio/adc/ti-ads1119.c                     | 3 +--
 drivers/iio/adc/ti-ads7924.c                     | 6 ++----
 drivers/iio/frequency/adf4350.c                  | 3 +--
 drivers/iio/light/al3000a.c                      | 2 +-
 drivers/iio/light/apds9306.c                     | 2 +-
 drivers/iio/light/bh1745.c                       | 3 +--
 drivers/iio/light/opt4001.c                      | 3 +--
 drivers/iio/light/opt4060.c                      | 3 +--
 drivers/iio/magnetometer/als31300.c              | 2 +-
 drivers/iio/magnetometer/tmag5273.c              | 2 +-
 drivers/iio/proximity/vl53l0x-i2c.c              | 3 +--
 drivers/iio/temperature/mlx90635.c               | 6 ++----
 drivers/input/touchscreen/zforce_ts.c            | 3 +--
 drivers/mmc/host/litex_mmc.c                     | 3 +--
 drivers/net/ethernet/freescale/enetc/enetc4_pf.c | 3 +--
 drivers/phy/samsung/phy-exynos5-usbdrd.c         | 3 +--
 drivers/power/supply/mt6370-charger.c            | 4 ++--
 drivers/power/supply/rt9467-charger.c            | 8 ++++----
 drivers/pwm/pwm-meson.c                          | 3 +--
 drivers/spi/spi-nxp-fspi.c                       | 2 +-
 drivers/ufs/core/ufshcd.c                        | 3 +--
 drivers/usb/misc/qcom_eud.c                      | 3 +--
 sound/soc/sof/imx/imx-common.c                   | 2 +-
 33 files changed, 39 insertions(+), 64 deletions(-)

diff --git a/drivers/counter/ti-ecap-capture.c b/drivers/counter/ti-ecap-capture.c
index 3faaf7f60539..114f2d33f193 100644
--- a/drivers/counter/ti-ecap-capture.c
+++ b/drivers/counter/ti-ecap-capture.c
@@ -528,7 +528,7 @@ static int ecap_cnt_probe(struct platform_device *pdev)
 	/* Register a cleanup callback to care for disabling PM */
 	ret = devm_add_action_or_reset(dev, ecap_cnt_pm_disable, dev);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to add pm disable action\n");
+		return ret;
 
 	ret = devm_counter_add(dev, counter_dev);
 	if (ret)
diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index 0d17985a5fdc..172e7a6283dc 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -596,9 +596,7 @@ static int gpio_twl4030_probe(struct platform_device *pdev)
 
 		ret = devm_add_action_or_reset(&pdev->dev, gpio_twl4030_power_off_action, d);
 		if (ret)
-			return dev_err_probe(&pdev->dev, ret,
-					     "failed to install power off handler\n");
-
+			return ret;
 	}
 
 	return 0;
diff --git a/drivers/i2c/muxes/i2c-mux-mule.c b/drivers/i2c/muxes/i2c-mux-mule.c
index 284ff4afeeac..617ca058d2c9 100644
--- a/drivers/i2c/muxes/i2c-mux-mule.c
+++ b/drivers/i2c/muxes/i2c-mux-mule.c
@@ -91,8 +91,7 @@ static int mule_i2c_mux_probe(struct platform_device *pdev)
 
 	ret = devm_add_action_or_reset(mux_dev, mule_i2c_mux_remove, muxc);
 	if (ret)
-		return dev_err_probe(mux_dev, ret,
-				     "Failed to register mux remove\n");
+		return ret;
 
 	/* Create device adapters */
 	for_each_child_of_node(mux_dev->of_node, dev) {
diff --git a/drivers/iio/accel/msa311.c b/drivers/iio/accel/msa311.c
index c31c53abc3d0..f18b06832c0a 100644
--- a/drivers/iio/accel/msa311.c
+++ b/drivers/iio/accel/msa311.c
@@ -1197,7 +1197,7 @@ static int msa311_probe(struct i2c_client *i2c)
 	 */
 	err = devm_add_action_or_reset(dev, msa311_powerdown, msa311);
 	if (err)
-		return dev_err_probe(dev, err, "can't add powerdown action\n");
+		return err;
 
 	err = pm_runtime_set_active(dev);
 	if (err)
diff --git a/drivers/iio/adc/ad4130.c b/drivers/iio/adc/ad4130.c
index 6cf790ff3eb5..ff778a44323f 100644
--- a/drivers/iio/adc/ad4130.c
+++ b/drivers/iio/adc/ad4130.c
@@ -2035,8 +2035,7 @@ static int ad4130_probe(struct spi_device *spi)
 
 	ret = devm_add_action_or_reset(dev, ad4130_disable_regulators, st);
 	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to add regulators disable action\n");
+		return ret;
 
 	ret = ad4130_soft_reset(st);
 	if (ret)
diff --git a/drivers/iio/adc/ad7124.c b/drivers/iio/adc/ad7124.c
index 92596f15e797..fd86470bd838 100644
--- a/drivers/iio/adc/ad7124.c
+++ b/drivers/iio/adc/ad7124.c
@@ -1306,7 +1306,7 @@ static int ad7124_probe(struct spi_device *spi)
 		ret = devm_add_action_or_reset(&spi->dev, ad7124_reg_disable,
 					       st->vref[i]);
 		if (ret)
-			return dev_err_probe(dev, ret, "Failed to register disable handler for regulator #%d\n", i);
+			return ret;
 	}
 
 	st->mclk = devm_clk_get_enabled(&spi->dev, "mclk");
diff --git a/drivers/iio/adc/ad7173.c b/drivers/iio/adc/ad7173.c
index b3e6bd2a55d7..a7f67d8ee9e0 100644
--- a/drivers/iio/adc/ad7173.c
+++ b/drivers/iio/adc/ad7173.c
@@ -1707,8 +1707,7 @@ static int ad7173_fw_parse_device_config(struct iio_dev *indio_dev)
 
 	ret = devm_add_action_or_reset(dev, ad7173_disable_regulators, st);
 	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to add regulators disable action\n");
+		return ret;
 
 	ret = device_property_match_property_string(dev, "clock-names",
 						    ad7173_clk_sel,
diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
index 3343b54e8e44..fe9e3ece3fda 100644
--- a/drivers/iio/adc/mt6577_auxadc.c
+++ b/drivers/iio/adc/mt6577_auxadc.c
@@ -297,8 +297,7 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
 
 	ret = devm_add_action_or_reset(&pdev->dev, mt6577_power_off, adc_dev);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "Failed to add action to managed power off\n");
+		return ret;
 
 	ret = devm_iio_device_register(&pdev->dev, indio_dev);
 	if (ret < 0)
diff --git a/drivers/iio/adc/pac1921.c b/drivers/iio/adc/pac1921.c
index 72aa4ca2e5a4..35433250b008 100644
--- a/drivers/iio/adc/pac1921.c
+++ b/drivers/iio/adc/pac1921.c
@@ -1279,8 +1279,7 @@ static int pac1921_probe(struct i2c_client *client)
 	ret = devm_add_action_or_reset(dev, pac1921_regulator_disable,
 				       priv->vdd);
 	if (ret)
-		return dev_err_probe(dev, ret,
-			"Cannot add action for vdd regulator disposal\n");
+		return ret;
 
 	msleep(PAC1921_POWERUP_TIME_MS);
 
diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockchip_saradc.c
index 325e3747a134..02d7bf137f2e 100644
--- a/drivers/iio/adc/rockchip_saradc.c
+++ b/drivers/iio/adc/rockchip_saradc.c
@@ -529,8 +529,7 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 	ret = devm_add_action_or_reset(&pdev->dev,
 				       rockchip_saradc_regulator_disable, info);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "failed to register devm action\n");
+		return ret;
 
 	ret = regulator_get_voltage(info->vref);
 	if (ret < 0)
diff --git a/drivers/iio/adc/ti-ads1119.c b/drivers/iio/adc/ti-ads1119.c
index d280c949cf47..bf23b7beb5f8 100644
--- a/drivers/iio/adc/ti-ads1119.c
+++ b/drivers/iio/adc/ti-ads1119.c
@@ -780,8 +780,7 @@ static int ads1119_probe(struct i2c_client *client)
 
 	ret = devm_add_action_or_reset(dev, ads1119_powerdown, st);
 	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to add powerdown action\n");
+		return ret;
 
 	return devm_iio_device_register(dev, indio_dev);
 }
diff --git a/drivers/iio/adc/ti-ads7924.c b/drivers/iio/adc/ti-ads7924.c
index b1f745f75dbe..46255c530cb4 100644
--- a/drivers/iio/adc/ti-ads7924.c
+++ b/drivers/iio/adc/ti-ads7924.c
@@ -399,8 +399,7 @@ static int ads7924_probe(struct i2c_client *client)
 
 	ret = devm_add_action_or_reset(dev, ads7924_reg_disable, data->vref_reg);
 	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to add regulator disable action\n");
+		return ret;
 
 	ret = ads7924_reset(indio_dev);
 	if (ret < 0)
@@ -414,8 +413,7 @@ static int ads7924_probe(struct i2c_client *client)
 
 	ret = devm_add_action_or_reset(dev, ads7924_set_idle_mode, data);
 	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to add idle mode action\n");
+		return ret;
 
 	/* Use minimum signal acquire time. */
 	ret = regmap_update_bits(data->regmap, ADS7924_ACQCONFIG_REG,
diff --git a/drivers/iio/frequency/adf4350.c b/drivers/iio/frequency/adf4350.c
index 47f1c7e9efa9..6665409a9a87 100644
--- a/drivers/iio/frequency/adf4350.c
+++ b/drivers/iio/frequency/adf4350.c
@@ -673,8 +673,7 @@ static int adf4350_probe(struct spi_device *spi)
 
 	ret = devm_add_action_or_reset(&spi->dev, adf4350_power_down, indio_dev);
 	if (ret)
-		return dev_err_probe(&spi->dev, ret,
-				     "Failed to add action to managed power down\n");
+		return ret;
 
 	return devm_iio_device_register(&spi->dev, indio_dev);
 }
diff --git a/drivers/iio/light/al3000a.c b/drivers/iio/light/al3000a.c
index 6f301c067045..9871096cbab3 100644
--- a/drivers/iio/light/al3000a.c
+++ b/drivers/iio/light/al3000a.c
@@ -94,7 +94,7 @@ static int al3000a_init(struct al3000a_data *data)
 
 	ret = devm_add_action_or_reset(dev, al3000a_set_pwr_off, data);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to add action\n");
+		return ret;
 
 	ret = regmap_write(data->regmap, AL3000A_REG_SYSTEM, AL3000A_CONFIG_RESET);
 	if (ret)
diff --git a/drivers/iio/light/apds9306.c b/drivers/iio/light/apds9306.c
index e9b237de180a..7d2f3738b967 100644
--- a/drivers/iio/light/apds9306.c
+++ b/drivers/iio/light/apds9306.c
@@ -1305,7 +1305,7 @@ static int apds9306_probe(struct i2c_client *client)
 
 	ret = devm_add_action_or_reset(dev, apds9306_powerdown, data);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to add action or reset\n");
+		return ret;
 
 	ret = devm_iio_device_register(dev, indio_dev);
 	if (ret)
diff --git a/drivers/iio/light/bh1745.c b/drivers/iio/light/bh1745.c
index 56ab5fe90ff9..613561dd4083 100644
--- a/drivers/iio/light/bh1745.c
+++ b/drivers/iio/light/bh1745.c
@@ -816,8 +816,7 @@ static int bh1745_init(struct bh1745_data *data)
 
 	ret = devm_add_action_or_reset(dev, bh1745_power_off, data);
 	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to add action or reset\n");
+		return ret;
 
 	return 0;
 }
diff --git a/drivers/iio/light/opt4001.c b/drivers/iio/light/opt4001.c
index ba4eb82d9bc2..95167273bb90 100644
--- a/drivers/iio/light/opt4001.c
+++ b/drivers/iio/light/opt4001.c
@@ -428,8 +428,7 @@ static int opt4001_probe(struct i2c_client *client)
 					opt4001_chip_off_action,
 					chip);
 	if (ret < 0)
-		return dev_err_probe(&client->dev, ret,
-				     "Failed to setup power off action\n");
+		return ret;
 
 	return devm_iio_device_register(&client->dev, indio_dev);
 }
diff --git a/drivers/iio/light/opt4060.c b/drivers/iio/light/opt4060.c
index f4085020e03e..e2f42d87760a 100644
--- a/drivers/iio/light/opt4060.c
+++ b/drivers/iio/light/opt4060.c
@@ -1301,8 +1301,7 @@ static int opt4060_probe(struct i2c_client *client)
 
 	ret = devm_add_action_or_reset(dev, opt4060_chip_off_action, chip);
 	if (ret < 0)
-		return dev_err_probe(dev, ret,
-				     "Failed to setup power off action\n");
+		return ret;
 
 	ret = opt4060_setup_buffer(chip, indio_dev);
 	if (ret)
diff --git a/drivers/iio/magnetometer/als31300.c b/drivers/iio/magnetometer/als31300.c
index f72af829715f..928e1378304c 100644
--- a/drivers/iio/magnetometer/als31300.c
+++ b/drivers/iio/magnetometer/als31300.c
@@ -373,7 +373,7 @@ static int als31300_probe(struct i2c_client *i2c)
 
 	ret = devm_add_action_or_reset(dev, als31300_power_down, data);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to add powerdown action\n");
+		return ret;
 
 	indio_dev->info = &als31300_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
diff --git a/drivers/iio/magnetometer/tmag5273.c b/drivers/iio/magnetometer/tmag5273.c
index 2ca5c26f0091..bdb656b031b1 100644
--- a/drivers/iio/magnetometer/tmag5273.c
+++ b/drivers/iio/magnetometer/tmag5273.c
@@ -642,7 +642,7 @@ static int tmag5273_probe(struct i2c_client *i2c)
 	 */
 	ret = devm_add_action_or_reset(dev, tmag5273_power_down, data);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to add powerdown action\n");
+		return ret;
 
 	ret = pm_runtime_set_active(dev);
 	if (ret < 0)
diff --git a/drivers/iio/proximity/vl53l0x-i2c.c b/drivers/iio/proximity/vl53l0x-i2c.c
index ef4aa7b2835e..b92fbd27755b 100644
--- a/drivers/iio/proximity/vl53l0x-i2c.c
+++ b/drivers/iio/proximity/vl53l0x-i2c.c
@@ -352,8 +352,7 @@ static int vl53l0x_probe(struct i2c_client *client)
 
 	error = devm_add_action_or_reset(&client->dev, vl53l0x_power_off, data);
 	if (error)
-		return dev_err_probe(&client->dev, error,
-				     "Failed to install poweroff action\n");
+		return ret;
 
 	indio_dev->name = "vl53l0x";
 	indio_dev->info = &vl53l0x_info;
diff --git a/drivers/iio/temperature/mlx90635.c b/drivers/iio/temperature/mlx90635.c
index f7f88498ba0e..1175c7887ae1 100644
--- a/drivers/iio/temperature/mlx90635.c
+++ b/drivers/iio/temperature/mlx90635.c
@@ -977,8 +977,7 @@ static int mlx90635_probe(struct i2c_client *client)
 	ret = devm_add_action_or_reset(&client->dev, mlx90635_disable_regulator,
 				       mlx90635);
 	if (ret < 0)
-		return dev_err_probe(&client->dev, ret,
-				     "failed to setup regulator cleanup action\n");
+		return ret;
 
 	ret = mlx90635_wakeup(mlx90635);
 	if (ret < 0)
@@ -986,8 +985,7 @@ static int mlx90635_probe(struct i2c_client *client)
 
 	ret = devm_add_action_or_reset(&client->dev, mlx90635_sleep, mlx90635);
 	if (ret < 0)
-		return dev_err_probe(&client->dev, ret,
-				     "failed to setup low power cleanup\n");
+		return ret;
 
 	ret = regmap_read(mlx90635->regmap_ee, MLX90635_EE_VERSION, &dsp_version);
 	if (ret < 0)
diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index df42fdf36ae3..4d000b5b3ae6 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -739,8 +739,7 @@ static int zforce_probe(struct i2c_client *client)
 
 	error = devm_add_action_or_reset(&client->dev, zforce_reset, ts);
 	if (error)
-		return dev_err_probe(&client->dev, error,
-				     "failed to register reset action\n");
+		return error;
 
 	snprintf(ts->phys, sizeof(ts->phys),
 		 "%s/input0", dev_name(&client->dev));
diff --git a/drivers/mmc/host/litex_mmc.c b/drivers/mmc/host/litex_mmc.c
index b338ccfa8f33..08764cb8aa3d 100644
--- a/drivers/mmc/host/litex_mmc.c
+++ b/drivers/mmc/host/litex_mmc.c
@@ -531,8 +531,7 @@ static int litex_mmc_probe(struct platform_device *pdev)
 
 	ret = devm_add_action_or_reset(dev, litex_mmc_free_host_wrapper, mmc);
 	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Can't register mmc_free_host action\n");
+		return ret;
 
 	host = mmc_priv(mmc);
 	host->mmc = mmc;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index b3dc1afeefd1..38fb81db48c2 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -1016,8 +1016,7 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 
 	err = devm_add_action_or_reset(dev, enetc4_pci_remove, pdev);
 	if (err)
-		return dev_err_probe(dev, err,
-				     "Add enetc4_pci_remove() action failed\n");
+		return err;
 
 	/* si is the private data. */
 	si = pci_get_drvdata(pdev);
diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 917a76d584f0..28ba11e42823 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1859,8 +1859,7 @@ static int exynos5_usbdrd_setup_notifiers(struct exynos5_usbdrd_phy *phy_drd)
 					       exynos5_usbdrd_orien_switch_unregister,
 					       phy_drd);
 		if (ret)
-			return dev_err_probe(phy_drd->dev, ret,
-					     "Failed to register TypeC orientation devm action\n");
+			return ret;
 	}
 
 	return 0;
diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
index 98579998b300..29510af4e595 100644
--- a/drivers/power/supply/mt6370-charger.c
+++ b/drivers/power/supply/mt6370-charger.c
@@ -898,7 +898,7 @@ static int mt6370_chg_probe(struct platform_device *pdev)
 	ret = devm_add_action_or_reset(dev, mt6370_chg_destroy_attach_lock,
 				       &priv->attach_lock);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to init attach lock\n");
+		return ret;
 
 	priv->attach = MT6370_ATTACH_STAT_DETACH;
 
@@ -909,7 +909,7 @@ static int mt6370_chg_probe(struct platform_device *pdev)
 
 	ret = devm_add_action_or_reset(dev, mt6370_chg_destroy_wq, priv->wq);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to init wq\n");
+		return ret;
 
 	ret = devm_work_autocancel(dev, &priv->bc12_work, mt6370_chg_bc12_work_func);
 	if (ret)
diff --git a/drivers/power/supply/rt9467-charger.c b/drivers/power/supply/rt9467-charger.c
index e9aba9ad393c..e2ff9c4609ef 100644
--- a/drivers/power/supply/rt9467-charger.c
+++ b/drivers/power/supply/rt9467-charger.c
@@ -1218,25 +1218,25 @@ static int rt9467_charger_probe(struct i2c_client *i2c)
 	ret = devm_add_action_or_reset(dev, rt9467_chg_destroy_adc_lock,
 				       &data->adc_lock);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to init ADC lock\n");
+		return ret;
 
 	mutex_init(&data->attach_lock);
 	ret = devm_add_action_or_reset(dev, rt9467_chg_destroy_attach_lock,
 				       &data->attach_lock);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to init attach lock\n");
+		return ret;
 
 	mutex_init(&data->ichg_ieoc_lock);
 	ret = devm_add_action_or_reset(dev, rt9467_chg_destroy_ichg_ieoc_lock,
 				       &data->ichg_ieoc_lock);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to init ICHG/IEOC lock\n");
+		return ret;
 
 	init_completion(&data->aicl_done);
 	ret = devm_add_action_or_reset(dev, rt9467_chg_complete_aicl_done,
 				       &data->aicl_done);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to init AICL done completion\n");
+		return ret;
 
 	ret = rt9467_do_charger_init(data);
 	if (ret)
diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 8c6bf3d49753..e90d37d4f956 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -520,8 +520,7 @@ static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
 		ret = devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
 					       meson->channels[i].clk);
 		if (ret)
-			return dev_err_probe(dev, ret,
-					     "Failed to add clk_put action\n");
+			return ret;
 	}
 
 	return 0;
diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
index e63c77e41823..1bdc8a51befb 100644
--- a/drivers/spi/spi-nxp-fspi.c
+++ b/drivers/spi/spi-nxp-fspi.c
@@ -1283,7 +1283,7 @@ static int nxp_fspi_probe(struct platform_device *pdev)
 
 	ret = devm_add_action_or_reset(dev, nxp_fspi_cleanup, f);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to register nxp_fspi_cleanup\n");
+		return ret;
 
 	return devm_spi_register_controller(&pdev->dev, ctlr);
 }
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 50adfb8b335b..3be165080a15 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10476,8 +10476,7 @@ int ufshcd_alloc_host(struct device *dev, struct ufs_hba **hba_handle)
 	err = devm_add_action_or_reset(dev, ufshcd_devres_release,
 				       host);
 	if (err)
-		return dev_err_probe(dev, err,
-				     "failed to add ufshcd dealloc action\n");
+		return err;
 
 	host->nr_maps = HCTX_TYPE_POLL + 1;
 	hba = shost_priv(host);
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 83079c414b4f..67832790acad 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -193,8 +193,7 @@ static int eud_probe(struct platform_device *pdev)
 
 	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
 	if (ret)
-		return dev_err_probe(chip->dev, ret,
-				"failed to add role switch release action\n");
+		return ret;
 
 	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base))
diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 62bf707aa909..0ea232a38533 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -404,7 +404,7 @@ static int imx_probe(struct snd_sof_dev *sdev)
 				       imx_unregister_action,
 				       sdev);
 	if (ret)
-		return dev_err_probe(sdev->dev, ret, "failed to add devm action\n");
+		return ret;
 
 	common->ipc_handle = dev_get_drvdata(&common->ipc_dev->dev);
 	if (!common->ipc_handle)
-- 
2.39.5


