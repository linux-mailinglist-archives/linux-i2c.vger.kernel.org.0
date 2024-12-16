Return-Path: <linux-i2c+bounces-8532-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 088A79F362C
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 17:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B262162480
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 16:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56CE21482E1;
	Mon, 16 Dec 2024 16:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VufhfdrQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2064.outbound.protection.outlook.com [40.107.241.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43700175BF;
	Mon, 16 Dec 2024 16:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734366915; cv=fail; b=nVO2BKFIg4huNzUHpDblsX7bceneh/iqj9LEuLjWbK0npPilu28lf0DT/vaS3l/zie0Idf0kBhUZ84+yVvoVJVqBG7Eci0JNnSeVsRgx1bD9I1HcQXl1ATCNEQom+P8oVxO1FvZccpFiLRe+OxF7qZbEMpPdF9j0yh3wa/NMo7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734366915; c=relaxed/simple;
	bh=ZxCj9V5ehCvSlgrSO2cGQ4/FZW6KCK6DYYJ08qWsrzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uaNDtxFCbcEbD0fxuCQeu+oaGwsqJJleMCj2NQCU4wOHQQhgmXXOr5egX5slrOz2MKmk7sx7OXFdxkIfwnz35l5IPjHydAHj2Jxd+kzudmSjbST1v2/7P+R8hoVs9lQmxdpSzOsdCjTyNvNHOsZlD6vHz0UKGfDkuFe4FwauxVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VufhfdrQ; arc=fail smtp.client-ip=40.107.241.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8uLXzJc+/oFW/nIfQJCim3ncCqu3TPsETxrtKhzg/Kl9+tLlNryHPuSaG+498daVqznfsNcMN0JnJwAZwh+TPdQmEzMTIQVRP/ALD+hEV5Bf+cujiaykFWIy6vZenOlodKzq/46THXevQ01lZN2m0DdAiZetYZwewNUVg2r7xni0j6wKeEDtlMmCD4da6ojn5bI8y++fxkL2Xn2TI9xA56VtwTjA1OTR/vYrFoqWy6qPmSr02n9cZdHBteQ1N16lY5G+vrxiHZOds44E101zngel6s8KM/Y6cjSZeFwk7EEJDmLDcnDaE0NZqYOq5U/27Tp8jq9aeU2PPGv1vhYmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niQlhFMBaxhknFDa/9BLR2GZfazI07D/cJAvKKSN+Hk=;
 b=Of2RqavIcL/DpQBgMzOmqsXlonrkwr5rtZPZR0Kd1/ulheI8N73g8qUnzkbzPMqaxHTp2qPw+SFiNFYz/q5r4GBdl/UW1WDCOz/x8FqIbDcy3rA92fBvb1PsIHp1b1rkxM76QKPWkKTjV+QLsysjPs6fzEleLBEsRDBNPk/4Zs/1UdiB4/ib88B5uU2P5x/ip/CtxalZ3FRx5CHXuyToCMbHQj39HMyBr8aurtpzPJ08Dof0Vh8ayd4W3++DCZYfjqfx0CMydKHyB1ZzOT3TQX0pGpuPjJ9yleMZ/aIqwKB7FonVUQO8i9+C6lBJ+UaUFegMYEDwh67kYUTkZoKNmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niQlhFMBaxhknFDa/9BLR2GZfazI07D/cJAvKKSN+Hk=;
 b=VufhfdrQMZ4THSdMJFbKXx15NCe51/5of+t8dPQ8x0APKWrLUypHWpNPygy0UnS+lmerZ2rEtLlpBE6iaCSMZAmgJaa2Q+kEU351cV7a6I7fy++O/AWG8onM188ug3kPvx/LfUSFbQIjvSPD56LFuBqO7AdcBz/gwcgsTErzx8aDEDUZxiKcl+yp1R3j/c/XbEn6ct/7h5bPwKGJ+JUEgaXXlYzcMe69ulWEA6z9h25agxJu3uvVuI6gfeG5EUeFE7ddjixsYqGoJfHEm93UUq0vUh3899ZiI3UdATFrTDcLBn0G4F05rqmww3YtafLqMLy8FvSMRVG6spuOkTSRRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8666.eurprd04.prod.outlook.com (2603:10a6:20b:43d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Mon, 16 Dec
 2024 16:35:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8251.008; Mon, 16 Dec 2024
 16:35:10 +0000
Date: Mon, 16 Dec 2024 11:35:02 -0500
From: Frank Li <Frank.li@nxp.com>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: imx: fix missing stop condition in single-master
 mode
Message-ID: <Z2BWtjPT1sTUCZ82@lizhi-Precision-Tower-5810>
References: <20241216151829.74056-1-eichest@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216151829.74056-1-eichest@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0163.namprd05.prod.outlook.com
 (2603:10b6:a03:339::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8666:EE_
X-MS-Office365-Filtering-Correlation-Id: b7a53332-5474-46d9-a20b-08dd1def9b97
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?5GkZIfSg+INnwNGvP/clD1K7MkZrY5Dv0QW5By8hnifPApp+9pGQEZqldK0x?=
 =?us-ascii?Q?qZ4NOqriraftUbzUnkTQlbzUy/wXn20CkaRN3lJjFsVWX2SNuMcM7DnHel7P?=
 =?us-ascii?Q?BBgfIzPcSeDNIOcztsaSOIivyfMvpfJOMbnONtxsn3ot0Z6IBBi4U3rTV0Nw?=
 =?us-ascii?Q?fwoa4/MLpLECgGCzKGU69mb2jSCUZPtDu4hv/Br6Sk+Mg/5WmBxGRTNOgD8S?=
 =?us-ascii?Q?mupHIbgBqd9e2+MVUHxjN8M5gzZvYpSes09IWVVGYVIddzAJfXjJmZTRCrSQ?=
 =?us-ascii?Q?Mz7Otxtnc6tP684lsDcUCCoM7jywDd7RHaJAgy5YmULY0tO7gY0FFQpoqW+Q?=
 =?us-ascii?Q?r4ZTAx6wKmkEDt+1uKetHp66NfUR+DJSpDRneNDBZs4XIz8w6g+BShuK4KN+?=
 =?us-ascii?Q?v+pVsBENBlV5Fri37dfrtScRBrxL7aW818q5DoPSx46FmvdPeZsOAGXdPG1R?=
 =?us-ascii?Q?vM8eJ91jWa6y7FHWs7KkANaGU1cEPY8Yma6bj2uEDKkA2FGCMhkYb1LbwL06?=
 =?us-ascii?Q?eBcE9ERLvunS58LI+C8caLOEWC6ywOTKM4POh4a83a0DKSc268xprWaFmOna?=
 =?us-ascii?Q?FROtFuX1CghETbPiMvsulUpe/CKDKad3HCHhvT9K+4aVi4aSoSQvBmy6xRlp?=
 =?us-ascii?Q?wO84fUyO/WZBBTOCvlZeyxaurZRTS0Ov6HZz4PzGGZE2gLhkCExlEG7YG5SO?=
 =?us-ascii?Q?vT7IMRPq4GDfIdKvF7iBuWKyKQJiUShr+llYh/aY5Mbs9c7Ye++K+w88stim?=
 =?us-ascii?Q?C6/hODDRZNAeFgmWKUPLfVgs6SBD5KHTqULyH6vJ1vgVepmzqhx4NGQBD09D?=
 =?us-ascii?Q?SjZZBtTmHb6TdTCXyY4rmsJ+x8Ni4RU6JJODXGqluH575y8OLVeoUStVerOZ?=
 =?us-ascii?Q?vK8FYftPj0k71guroSVVYCYQdbr8rue5bXcpZ4+WRyTFK2nWnETdxCLqT4Iw?=
 =?us-ascii?Q?SIYLOytwXh6idBmIS7+I/3tbveQ0T/u5uoMf+gl42zt7IXCWBc66m8WkhtMU?=
 =?us-ascii?Q?A5lKY2A7drgozL42JuZzikIVvwX9IPvfS3IfHT6M1wdKQhyMCN0VTSqLRlVL?=
 =?us-ascii?Q?px7yDsqEhgDh6Hkpwa2NjD4DSbbcB/j71HyDwfq/XrU1Z0iCOjTCP0HmWPIo?=
 =?us-ascii?Q?GAacRcnod2fbC2WkCI78VkjEq9emwXTk2+T3lQcwjn1w8HzYpNBm8POetAka?=
 =?us-ascii?Q?4QWatkcD6kT2gA/dz9dJIAbnxlZLOPJZk0bekLLN9DHzE+k+IER8zJnCJqkI?=
 =?us-ascii?Q?yY/lnGQRrJOPeG0XRzqB0J5O2WhkvQ5xQXr48hAZNcY6DUz4reG2qF1226pk?=
 =?us-ascii?Q?WOH+W6DmjFehmtNJ+JNi9aILxckhk6MgPXWPBLqekuGSUtZiEkhZweLPtL8X?=
 =?us-ascii?Q?gxF8ZGzGJ1geTFwQnIZ2b6U15haWrWLPYyGZj2QSNsouIHhX9NHdjjNajzYa?=
 =?us-ascii?Q?d6bwZGfhAAbgV1+d2CtnU1Z/89GjGo0+?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?njngju0r8fJr8IDlcU/IHMRNSTLUDcyWdpEnWXvwtHqHv+jyFdSdKA6l5u47?=
 =?us-ascii?Q?3TWWOLAElnE7MH6eBa1NyVoyZkTW1706JLxOT8GiI0qAxok7n2F/4uoA0Mc1?=
 =?us-ascii?Q?17jZcw44wM2zXps3wSwTloxO61PVOtewWGAKLhbhM53sAZJMU8y7jgAYVZ+e?=
 =?us-ascii?Q?hGhmOB7QC32vKTHPcEidLbukn/4VKUqNMYmbhm78KHNt+Bi6yDWdZaSRiefs?=
 =?us-ascii?Q?yXg9EhsjkKOVzaRZ94Nh5aHyytak9xmSsH8HgNL3/SX/HoBcxp6Ru2BwmYez?=
 =?us-ascii?Q?0R/9hZHmjy4mjc5DGNGhVQ7GzjFUPpuY4uJrjAOloHUrrxHrWeQMYAXWsn6+?=
 =?us-ascii?Q?VbnqWfQ2DyUnfKJn5S9h9LM9J5Nk2ywgzilASlIPVzR/ZypcL/yUeBx0z7vr?=
 =?us-ascii?Q?NHxISFLfb2cMO9g+c8BYzSDdNwqHTG2KRZHxVtcZViGLwTZccjN/SCiAGf0l?=
 =?us-ascii?Q?kNZU4bsqjBDXV0ttGoXMhck28lCVsRKw/mMM5OQnXwYcS0toDKCzkcLLj4SA?=
 =?us-ascii?Q?TNvw7UEQylSnD/0lSbUCyrBB4rYAarmFLkgKSM0h9roPmCtvoSRtk+c6YZ5L?=
 =?us-ascii?Q?YRzW4FVDSbyuXNhajwjBEhA9kbqI3++WJIKRMsPiZDpDbOldtHf/E3mSdr4g?=
 =?us-ascii?Q?O4sVS1jK5eF1UpjybGxaVLJsZLMtJmoaJcp4Or+7cZ7gN/o5w4Bi8owtlSND?=
 =?us-ascii?Q?VyIhQ3zRgmQA/FWgKJifBf4S3ib8cp5kwe8rf8/iQxb0Jgh+WSe60t6VMqss?=
 =?us-ascii?Q?0ybFnpiYbz34E2CeqpGNMbLPcLReCQSnYpZi5JH+67CqUDq3isOVrLlfE5vk?=
 =?us-ascii?Q?x75fn+r05h+F2FORpT7DDJtH0yxfnHL2jch+fBmbTOXkqU2oqc8bAAPgAagw?=
 =?us-ascii?Q?AI96pL/IfOs+Jlo5g/H71hDgnrdTfcyr+t6xELELM5FnJtlYv0yeHg0Ml0nr?=
 =?us-ascii?Q?lNS4qfimZIjBhfbc98JyfX2TUlreepCvgp07BCAwEgjogtx44K0hs6j9c0Zu?=
 =?us-ascii?Q?Ew4POQ7X5yUp4VDSv4LrCcNaYA0FISxjVyiTW/W4HEsfwjzyoUoly8G5riEo?=
 =?us-ascii?Q?PIEazO12+IM8N4zgrmjYhEbey7D5fGtBWMFtdISlC+qkqiONQiM8zCrwvlGy?=
 =?us-ascii?Q?YegS4y/uzfoLvD1sdBAXT7IhFtRNGeh+JwwnIejfnxVlMx0rLGBrSMcLgyxw?=
 =?us-ascii?Q?wNDagnYEjYkg8Mq7mAm4RccQH2ithtCABaji5ErARU1eXFasj7ZcyTLVXQiI?=
 =?us-ascii?Q?6rIEWdVGcD673YzYcD+I+1KGp0s6Il7+cqan8ut/jmSi3PhZ9Q4sLMfoOnES?=
 =?us-ascii?Q?7eYK6kCPsH1kK1EQInNeYmUQuPrLm6B21G907bPMBYzXpNxcZ1kDQZewMYeS?=
 =?us-ascii?Q?fQiuwoOZ6imzURnFlyYS8kGuBPi7u5j2DgCh3eUWYn6A0dKxbAU7eAaI6QXv?=
 =?us-ascii?Q?ktZ713LHLeJQg2pNHIv3pRAnY3R7MG49SEL/m0bdvzXSTiSLTZOrmgUPcDk3?=
 =?us-ascii?Q?VsAbYLzFBKCVBhP15MWmLo+tq6lcHGinDWLcejOZrQyj1wLwQ96+Q2Axdd3N?=
 =?us-ascii?Q?e+n23jibXtb8Bj+gDytF6WuhW2+3Qs0ikKOGNtCx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a53332-5474-46d9-a20b-08dd1def9b97
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 16:35:10.2995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfZGH3FN/5U3GYci+tCmRVYHYywwJ/oXCe+aKPFTD9/HSAf320fWdLaT58ZOGZszsZpVy+E/sfozJcIMUYsVlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8666

On Mon, Dec 16, 2024 at 04:16:40PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>
> A regression was introduced with the implementation of single-master
> mode, preventing proper stop conditions from being generated. Devices
> that require a valid stop condition, such as EEPROMs, fail to function
> correctly as a result.
>
> The issue only affects devices with the single-master property enabled.
>
> This commit resolves the issue by re-enabling I2C bus busy bit (IBB)
> polling for single-master mode when generating a stop condition. The fix
> further ensures that the i2c_imx->stopped flag is cleared at the start
> of each transfer, allowing the stop condition to be correctly generated
> in i2c_imx_stop().
>
> According to the reference manual (IMX8MMRM, Rev. 2, 09/2019, page
> 5270), polling the IBB bit to determine if the bus is free is only
> necessary in multi-master mode. Consequently, the IBB bit is not polled
> for the start condition in single-master mode.
>
> Fixes: 6692694aca86 ("i2c: imx: do not poll for bus busy in single master mode")
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index f751d231ded8..cbf66a69e20b 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -534,20 +534,18 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
>  {
>  	unsigned long orig_jiffies = jiffies;
>  	unsigned int temp;
> -
> -	if (!i2c_imx->multi_master)
> -		return 0;
> +	bool multi_master = i2c_imx->multi_master;

Move "bool multi_master = i2c_imx->multi_master;" before
"unsigned long orig_jiffies = jiffies;" to keep reverse christmas tree
order.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>  	while (1) {
>  		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
>
>  		/* check for arbitration lost */
> -		if (temp & I2SR_IAL) {
> +		if (multi_master && (temp & I2SR_IAL)) {
>  			i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
>  			return -EAGAIN;
>  		}
>
> -		if (for_busy && (temp & I2SR_IBB)) {
> +		if (for_busy && (!multi_master || (temp & I2SR_IBB))) {
>  			i2c_imx->stopped = 0;
>  			break;
>  		}
> --
> 2.45.2
>

