Return-Path: <linux-i2c+bounces-11741-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F662AEFF44
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 18:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90D2C1888AB6
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 16:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF0127E052;
	Tue,  1 Jul 2025 16:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="X4t9Qp1C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012040.outbound.protection.outlook.com [52.101.71.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EA126AD9;
	Tue,  1 Jul 2025 16:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386474; cv=fail; b=MYWogtscd9q1eEr/Do8lQBsqWDy8/cudyMcFNMUIbvT8ikVheBJgSeSsGDrZndWg7miQQnbmI+3mO74jfppttO+FcUyqoVQH4WAtRoEgYEFUEj6VH5VEr/GmnTZs4EsHxrhfMPpK/rgtiLsQGJCG9E1+MbhjiWhVSo5I5weUEg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386474; c=relaxed/simple;
	bh=Ck9tVlS0jxHa93aUXqW7Qk2ltG3sZdgR+2o+gJoXl1A=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y7XWc7g0PjxiL6JF93KJNM8jJiOHcJA0Yapbma+RUBNFvPYdiqmdWku14axIsIsIvgq6LYrp2zEhUxvYXizp7+GGDdR7m1kKY6Tmg7CQdahd30N639P+LIhcIQT72Jn6vqStdSxMiKJ7EEDRyhAcbar7l+oFQmQ4X++szl6tCGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=X4t9Qp1C; arc=fail smtp.client-ip=52.101.71.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rI1NU4IfJCzIKXzGfD6OJpqpKWYZq0T5jB6aPrw/8DgfOIZK+SAJ63V1EvIMtl5GwPTFFmJhFg46aYBbodlE9u4a4aZBK+LnCirwjLDX50ZWAs9awqoOPa6yCq10JVZl7AVLXrGERerMYbbKuiXmgeIw+1LPyTwLc41JerRnOyGNZi1vMJIAABL+QDY8HHkOwCOW+zQ6lMx322c3IRGvosa4d+vavpGYq722934QNCLLh7lPbQGx5r1hAQPJYMbzHbzTJd5XtgCizi3Iz+GMsBMlN3ZSkY1O351R6f8fd0d8KQZm42ejnzUVFjzJ+m8JZE+AYkHWSwcbxyIvEP+mDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xsb8k4IMCmipnR9snmGaY/l2ZASseBpznxZbFP4F5Vc=;
 b=UknXR+fMyMKV3sTcvOajiQx4G00XiTVmrq8JTXl8noen6THaRIy+uH5f3yrty1sQdUbCDzqY2YypwDcgRMiWD7ksp2XT6e9fbykKu5wcM5zwAyaxwn2djG0y4QEUEjC6EQS/tBsf4pfKtih0Qj/GhjiRB6g/77VZw9J4KmJNZtmdZE+CHnwVYdIVugZRcNHnU2TKrMcVHmh+llflwJzYo5QZ6nbna0MQNdjSXTEhQ0dm/oeYfm55LN/bnuXljI/xeQzUAbQkPlAatyU3/sPHG++VMCYdVB/uR4Txhid70AEUsAe3LCq6jyUwDVJ2g7+ucPBUSyWMwL28Mvy/evpttQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xsb8k4IMCmipnR9snmGaY/l2ZASseBpznxZbFP4F5Vc=;
 b=X4t9Qp1CC86+odP1kgNIlZx8XPjEf6weFJGXEreu/cDFU4WbiSDSzhpmq/sYikafo/W43gyipd0bJcLi4h6nk4CS2uKTdHvT5Luv0yfZlHyZ4hqy84+PPVFe+Tml5d/1TGZi6xabc3YYU25CJ5y2YNj+mquI4AFS1Ve/1xOoG1s=
Received: from DU7PR01CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::23) by DU0PR02MB8096.eurprd02.prod.outlook.com
 (2603:10a6:10:314::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Tue, 1 Jul
 2025 16:14:28 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::1d) by DU7PR01CA0040.outlook.office365.com
 (2603:10a6:10:50e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.32 via Frontend Transport; Tue,
 1 Jul 2025 16:14:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 16:14:28 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 1 Jul
 2025 18:14:27 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: David Lechner <dlechner@baylibre.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Julien Panis <jpanis@baylibre.com>,
	William Breathitt Gray <wbg@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin
	<peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>, Nuno
 =?utf-8?Q?S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>, Lars-Peter Clausen
	<lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Matteo Martelli
	<matteomartelli3@gmail.com>, Heiko Stuebner <heiko@sntech.de>, "Francesco
 Dolcini" <francesco@dolcini.it>, =?utf-8?Q?Jo=C3=A3o?= Paulo =?utf-8?Q?Go?=
 =?utf-8?Q?n=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, Hugo Villeneuve
	<hvilleneuve@dimonoff.com>, Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>,
	Mudit Sharma <muditsharma.info@gmail.com>, Gerald Loacker
	<gerald.loacker@wolfvision.net>, Song Qiang <songqiang1304521@gmail.com>,
	"Crt Mori" <cmo@melexis.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"Ulf Hansson" <ulf.hansson@linaro.org>, Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>,
	Joel Stanley <joel@jms.id.au>, Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>, Clark
 Wang <xiaoning.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul
	<vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Sebastian
 Reichel <sre@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
	<ukleinek@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Han Xu <han.xu@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Mark
 Brown <broonie@kernel.org>, Avri Altman <avri.altman@wdc.com>, Bart Van
 Assche <bvanassche@acm.org>, "James E.J. Bottomley"
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
	Fabio Estevam <festevam@gmail.com>, <kernel@axis.com>,
	<linux-iio@vger.kernel.org>, <linux-omap@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-input@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<imx@lists.linux.dev>, <netdev@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-scsi@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <sound-open-firmware@alsa-project.org>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH] Remove error prints for devm_add_action_or_reset()
In-Reply-To: <3df2c424-297e-4538-b350-5c465b22fa39@baylibre.com> (David
	Lechner's message of "Tue, 1 Jul 2025 10:16:47 -0500")
References: <pnd7c0s6ji2.fsf@axis.com>
	<3df2c424-297e-4538-b350-5c465b22fa39@baylibre.com>
User-Agent: a.out
Date: Tue, 1 Jul 2025 18:14:26 +0200
Message-ID: <pndy0t76g7x.fsf@axis.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|DU0PR02MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d1a656-5d8a-47a7-c136-08ddb8ba5b19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zbyQLz3O8s4IQT3OW9eGYTNglVofY85uWyQmX0YrFG3g9g09yv5z6wI85IHA?=
 =?us-ascii?Q?7/0hiLROQVENK3tnhnolQBWBpz00tyXNCkgJ8Cvor7m1ssXU1KKmP4i9+1x5?=
 =?us-ascii?Q?eL6hYcpumk0PXOaJv4XSRCefgAcS8XKyv0AKQ8W4cx0ZLMD8NBfRzLdrfKr8?=
 =?us-ascii?Q?L0YNlnbTaSr1blVBMwzWdp7d1M5F0/1rkXyJfkaK+SBwZn4DMxflVNhJQ1Yo?=
 =?us-ascii?Q?2WUzPMhR26if38p6t/uqlFwlZAzXKbR9uxYNlshN++4nvS7AJYPmIID/yji3?=
 =?us-ascii?Q?sW0rx+6CIcFH0MP8KjmXUieHSIoiplJeGq4dDbhQnVnrkqrVTiutvsj63ITX?=
 =?us-ascii?Q?jsvSAUTBKxGOpA93YlPEKxJdoGc6+PelWHgleItG2Kq3fPQuGMcPwxPb/0v7?=
 =?us-ascii?Q?5mAT6KkU+ZzL8QTrMkCs720u2dUfUUsgeRclej+fUkgBI5zemD1XFsISnquw?=
 =?us-ascii?Q?rEFppE2gdxqxDDytgB0SYxQfXo2wJ2chRmAdi1teJQB4BSN3KY+xT386MeoA?=
 =?us-ascii?Q?iA51Y0HyCSKDeTu6KeXkgMBkmqooT5oq/UpQLTq9RJVwWQoPDU1Xp5+d+nXy?=
 =?us-ascii?Q?IqFJI2iMGMgk00MalJIT4CCRUpaTk+55k5Gc8+w52ZMJRR+sDSDGyj92ZF6F?=
 =?us-ascii?Q?dAEvRJadQfJ2pcaKuA5MAGD3mljkMq4EhBrOM0nESzhFYaOKwlWKcXRtaNDM?=
 =?us-ascii?Q?30JlwmX+99Yj3Adne/w2RheYS3sCPnJR779u0aeuZvlWWQh998EODPgxBEVd?=
 =?us-ascii?Q?X/+G9Jqh/5zhtUAWl08V3KHKZhP92hJXc1TR6YD856Z1CIUVAnhLbEpOluCn?=
 =?us-ascii?Q?xl2VDJSOUz3ZH0qfhkz4EmDQED75etewjU8lMcpR6HWeUwhYF26HeHbLpISP?=
 =?us-ascii?Q?tjpoS5nZzF4XOltCjlkzY4eLjebQxjPKl487+TNpOIMr6CVRM7+Gb6nsS5eQ?=
 =?us-ascii?Q?3FO0PqBAzIWdnwdf5XHBlOYggnqojTQ67aKN9GzOncXy0a4efhTy7Ki93a8/?=
 =?us-ascii?Q?NANSv8dSZy4y+NAeLBA55lGTalFvA8kCoVwgQHFghOo4rDQXDsPCZDgiECVx?=
 =?us-ascii?Q?R4oUhHcrcb++QFnju4vbziMs+qrPZK7hl+f8CY2+8rQrlnDHKQueYu6bmIhO?=
 =?us-ascii?Q?B4nUulzVOE6JECh944oKcpUvpq3qdkjfGufW531AvBHNNnA82S8CcT0SeKwI?=
 =?us-ascii?Q?oq3VMclwK64hl0lUDSWhOuXMntlVJKvNdIvpl4/w5go5vv5zVKok4Q8qFhWb?=
 =?us-ascii?Q?YOJQB/CEfam7r0Cf0ThC7lVibbU2kEtsx4/as/DzWr2s7DdpIqH3IZWaizOs?=
 =?us-ascii?Q?9/qdXacBIwcz6oTiFyVamplCOlLOJsH9n9OR2QV1YQv3F6p5IkGQxDBbRy7E?=
 =?us-ascii?Q?7WKJvEGxex1A8fVHq6jJjyKdJx4G89ceV63xSEHGWF2AYCMBpMrSkIBT9f0E?=
 =?us-ascii?Q?9sSlsjM6t7+khcjrkRScasnaxIuoxBLw6kN+DKI1BXt/LbScvPwzZrqD9ndX?=
 =?us-ascii?Q?avcAMqrCzAGFTX3rEfWlwY6e3HxOLuwhfjNn?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 16:14:28.7668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d1a656-5d8a-47a7-c136-08ddb8ba5b19
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8096

On Tue, Jul 01, 2025 at 10:16 -0500 David Lechner <dlechner@baylibre.com> wrote:

> On 7/1/25 10:03 AM, Waqar Hameed wrote:
>> When `devm_add_action_or_reset()` fails, it is due to a failed memory
>> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
>> anything when error is `-ENOMEM`. Therefore, remove the useless call to
>> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
>> return the value instead.
>> 
>> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
>> ---
> I can't speak for all subsystems, but this would probably be acceptable
> in the iio subsystem.
>
> However, I don't think anyone is going to accept a patch that touches
> all of these files at the same time across subsystems.
>
> So I would suggest to split this up into one patch per driver and create
> one series per subsystem. This way, each subsystem isn't bothered by unrelated
> patches that they don't particularly need to care about. And note that some
> subsystems like net have additional expectations, e.g for the patch subject
> so that it gets picked up by automated tools, so be sure to check the docs
> for this.

Thanks for the suggestion David! I will do that then.

(I was contemplating on doing that at first, but gambled on this, since
I saw some other commits patches touching multiple files in different
sub-systems.)

