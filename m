Return-Path: <linux-i2c+bounces-11742-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BA2AEFF51
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 18:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 913BE4A156F
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 16:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF68127D770;
	Tue,  1 Jul 2025 16:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="d8byZ8S7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011058.outbound.protection.outlook.com [52.101.70.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695522741B3;
	Tue,  1 Jul 2025 16:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386557; cv=fail; b=HqIpPiUujfpSPoCYzqHolEK2tdF2elxUSrPPnmhTlb28i3LZqBx0RZieZG7M0ah/NVRt9qbepZjqycY+n9uWlb05/t72M8eJZYOOSMfVxJ7MHqjo6gJ0kcaoTxQbKro+2cV/me1rXAh1Uu56RzXEERYjBAKnDMaUjJjOZNUXzaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386557; c=relaxed/simple;
	bh=hQ7P2ntSObQjOdUtoLXQN/5jfsoQGPMkvrHC1iauVgs=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZfV8V8c1PIzGKRkmMY2wbqbf7hqPlN8lEl8CUEmqIY7cKAdiQkU98Cgq991hAW84EyCDYeM0UfJoa34HUz2dR92Y1uvaQkCz8aHMnY/Ndef/QTqALImHXVkcztCc0I2ipTRAoiyfc6kpsyU+7WG5MwAfNZxkTufgYTg5cpR/WIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=d8byZ8S7; arc=fail smtp.client-ip=52.101.70.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdZ0aQoiKWMy/+U+OjZ6VgOvZ1kpBWQ7ZlgSFGuIi2fJzt1dV/UrKEdL05O4pT9oatbamoInnas17lQe6BIzTE4BnLZOxQuP5b1/mIWx0KIkzm/ZYt8DW2S7TPxLiPwht6byt5S1vzqpBBVKek/ehBPZ9rGoHH9ZOakp3tM48UWXhbDnMNOAIJ9tn0nicMboHsoo8inGdT5U+8esvhY24haaigBf/xViWUdhiO9h8Iqy12vmsCh5ZlnH/VYjYJ9DYFtBL5/B9IlN71N6kGSick1tK4D7QgQMSZnEo4Pps89O62GU7KYIG2AIidtSs9yNWoGDm7P9SUZZZ2NSbfwEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQ7P2ntSObQjOdUtoLXQN/5jfsoQGPMkvrHC1iauVgs=;
 b=i8iEIE9xEZ0VUBVCEDhxkbpBoQO3t2kYjfO1nClSSGEVgeexcgfcbuUBOh5dWSPOjNXpHJ74+9cwKzqR/79yC9OTT5B9DjE1x0UiSNLldRJ6GrHgu3WitbAOKBJrOGwdaL9NQ7UNdA37S3CPoulIq5OnRGR6ezwNwEXHGkLT6+iCMAZ5wda/6j1t36sxwWLZ2lLw7Z3YwevPqnHrYgSyyGWhX8Du8Xp7yw5BT/Zhqwbd3XYxJCcCbXvvSADYrH3AKs8jtPIFttBI5ZVKMJTnmM2GQtykPDECddHmFjQxq3KFvZrf5mvZh99vkHikj6mUOIf1EpKpsaLABFYhyq4eYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQ7P2ntSObQjOdUtoLXQN/5jfsoQGPMkvrHC1iauVgs=;
 b=d8byZ8S7WUnXp0RLtMoQx/nVuuaigcAC3TzT8KNIzmD7RkNobcGgd+uDg4t7qAo/wgh/nRCVU/M9RpxRHPNEO/i1eh23t9Dri4nKdwPjy4airyYt4EH2JHoGXzjQCUiDP3Xc1tse8feYR5RsxwjvSRnZqozJ/Us1hKHPIa22Q0Q=
Received: from DU2PR04CA0017.eurprd04.prod.outlook.com (2603:10a6:10:3b::22)
 by VI0PR02MB10729.eurprd02.prod.outlook.com (2603:10a6:800:206::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Tue, 1 Jul
 2025 16:15:52 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::93) by DU2PR04CA0017.outlook.office365.com
 (2603:10a6:10:3b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 16:15:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 16:15:52 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 1 Jul
 2025 18:15:51 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Julien Panis <jpanis@baylibre.com>,
	William Breathitt Gray <wbg@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin
	<peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, Nuno =?utf-8?Q?S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
	<Michael.Hennerich@analog.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Matteo
 Martelli" <matteomartelli3@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
	Francesco Dolcini <francesco@dolcini.it>, =?utf-8?Q?Jo=C3=A3o?= Paulo
 =?utf-8?Q?Go?= =?utf-8?Q?n=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Subhajit Ghosh
	<subhajit.ghosh@tweaklogic.com>, Mudit Sharma <muditsharma.info@gmail.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>, Song Qiang
	<songqiang1304521@gmail.com>, Crt Mori <cmo@melexis.com>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, "Karol
 Gugala" <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>,
	Gabriel Somlo <gsomlo@gmail.com>, Joel Stanley <joel@jms.id.au>, "Claudiu
 Manoil" <claudiu.manoil@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, "Andrew
 Lunn" <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, "Kishon Vijay
 Abraham I" <kishon@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, Sebastian Reichel <sre@kernel.org>, Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Han Xu <han.xu@nxp.com>, Haibo Chen
	<haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Mark Brown
	<broonie@kernel.org>, Avri Altman <avri.altman@wdc.com>, Bart Van Assche
	<bvanassche@acm.org>, "James E.J. Bottomley"
	<James.Bottomley@hansenpartnership.com>, "Martin K. Petersen"
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
In-Reply-To: <aGP92Aqcxt-x78nu@geday> (Geraldo Nascimento's message of "Tue, 1
	Jul 2025 12:25:12 -0300")
References: <pnd7c0s6ji2.fsf@axis.com> <aGP92Aqcxt-x78nu@geday>
User-Agent: a.out
Date: Tue, 1 Jul 2025 18:15:51 +0200
Message-ID: <pndsejf6g5k.fsf@axis.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|VI0PR02MB10729:EE_
X-MS-Office365-Filtering-Correlation-Id: bd7d811a-d9a8-44e6-867e-08ddb8ba8cf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?14j9Gc2362zNkZ9kPgdtwQVmz/gFEzVAs3qF7WLLgFezF2FaqY+pxd9i2tpw?=
 =?us-ascii?Q?7Rpcga+vh6c4ki4aPPSTQ0rK6PSSyOP4n3EUaLREu7jVjZXstQRF1sAhz4jV?=
 =?us-ascii?Q?2iCEnPdpiT4aRTiQeNnRKrzwVOnR4NXfhpr07Ai8w8V0++O5l4APNi+ewqMs?=
 =?us-ascii?Q?1r5+/z85keCRoc8f1OLXaEy91t2uamgvti9ys7QCvXFF3IopW8KrfI8wV6bk?=
 =?us-ascii?Q?tQLlRe/td1ohhE5twgd//1VZkeSoKlkrhFY1iOrEUKJG4EROK2iPXkPffE9U?=
 =?us-ascii?Q?OAbjhyIsolMaAJGRINH/QsziNE7EBc6A6CKA1JrW7W8mkw1hChOKckNMwh1k?=
 =?us-ascii?Q?4uYH1Dc9onotaGRXEntot5Z6WYrwqyg24lFI5bJi2m4XjC9nOjxYjrZnKp46?=
 =?us-ascii?Q?yHaPPiuIIfS/pzzAIYwSnbpKRHmMpivjG/Bazk6Br63ufKqqfUAmdZYPwMiD?=
 =?us-ascii?Q?wunMXesIYcnmptCw7d5SNlYieniu5w15yPUmg/FeRFSUH3TwMMql+NcsyZ+L?=
 =?us-ascii?Q?3i6GLyjAlLUaSdVEAWMo7bHOwUcrzAHgJWFW0N1n2LfW1EDU3OKNYBs/+YX8?=
 =?us-ascii?Q?hC48rfZJLJAOOYEMD/FRZhgGrRTU4Zejl0udHZ0xJueMK02nME9x6sBk27Db?=
 =?us-ascii?Q?FYDI+LHfu0cPKCvWce9kL78sZR118sbAmEwR71C7rPmPJtWrfsy5OMJ0v2YK?=
 =?us-ascii?Q?3jLWPxu2FgRl6843NaFFBSyuUHpMebTqCZF4NAL0c9tsI7UcnPJHXKd9LxUW?=
 =?us-ascii?Q?2zqgDtFHUym+UpdZNULVOCZWSmO/jSWKIPWJFkY2+g+ODI1L3pFvoEkNQecy?=
 =?us-ascii?Q?6EXCDc7MCDeqOxRN/miflo/kzA2nAY7HHaqYRiYckpZ/nveLH1+5SkWprqYp?=
 =?us-ascii?Q?YLf55IKeX4yoJSN+NmHK2s3Mh+zig6WC3n2pz3BTL+cHzek2Yo5jSR8ob0iq?=
 =?us-ascii?Q?LJcz9j9LAbEhKJl8lt3U5RrKVpKbV7inz9FduC1d0usMHagNuGkbyusvv798?=
 =?us-ascii?Q?/E7LoMTHVphVPQ0rTEEtVUZ0Dp9LW6NIAj7FJnP4TyAoK7kCtWcunognpMy+?=
 =?us-ascii?Q?rVnY93uwzgcLNU0EyQZ1fKyEDvw5jAKBxDZPxMpOhCdbonbmFhq1pAHUmg0G?=
 =?us-ascii?Q?BGfC/txnN9VQJK19HfOZRIUhgcrCkYhsBrlAJJ4phovWR9lwO9opgj2My6w1?=
 =?us-ascii?Q?3apEOBUxxrxwq9Km8p2YDAGHmDnnWnEyyq0dDwn9ItjdorAjNMdybS8CS18s?=
 =?us-ascii?Q?574YahChvqEQGifaDbjEPWILrq+h02Q8siCLJkX96SNCAaJBxEIaKsO2EQG1?=
 =?us-ascii?Q?gENi0B58E810bl+AoTdmgsi+As5ba0mR/6MetMR5EhcmdDbPlq6TRSTn6lgn?=
 =?us-ascii?Q?u4CZJXMGTpx+oxl4m1OIff10gm8vU2VONFddeVnVPfzDnjiQOprfF6Utp+86?=
 =?us-ascii?Q?LW9vX0del8tgAepWZaQvNry74PIGhDTGi3U3dwKmBXVo3EMFiB1uPIC7XNfi?=
 =?us-ascii?Q?J33ChwFmJ8exVGjjqRxze65hhzwTsUrrgWA7?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 16:15:52.4461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7d811a-d9a8-44e6-867e-08ddb8ba8cf9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10729

On Tue, Jul 01, 2025 at 12:25 -0300 Geraldo Nascimento <geraldogabriel@gmail.com> wrote:

> [Some people who received this message don't often get email from geraldogabriel@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On Tue, Jul 01, 2025 at 05:03:33PM +0200, Waqar Hameed wrote:
>> When `devm_add_action_or_reset()` fails, it is due to a failed memory
>> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
>> anything when error is `-ENOMEM`. Therefore, remove the useless call to
>> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
>> return the value instead.
>
> Hi Waqar,
>
> thank you for the patch. However I personally advise you to split the
> patches per-file and remember to then precede each individual patch
> subject with the proper subsystem and driver touched.
>
> While this looks like a nit-pick, it really isn't, and my suggestion
> will make reviewing much more easier and you'll get your Reviewed-by's
> and Acked-by's much more smoothly.
>
> The cover-letter should probably be preceded by "treewide" instead of
> a specific subsystem.

Thank you for the suggestion Geraldo! I will do that (as also answered
to David).

