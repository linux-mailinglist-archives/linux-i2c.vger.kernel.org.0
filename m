Return-Path: <linux-i2c+bounces-8206-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 706AB9D8B12
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 18:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31D8A285D8B
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 17:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63ECC1B81B8;
	Mon, 25 Nov 2024 17:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TRmmCUQG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2079.outbound.protection.outlook.com [40.107.241.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621A41B6D01;
	Mon, 25 Nov 2024 17:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732554638; cv=fail; b=PtthcgeWUhWHTlz96GmmyBQSdMv8SqaJjFKRynAlJWHowryLiJSD6jRpRJb4SStRjB4yfV1y6plJYP4fItnkXSACK2Kwhj3NvtK9NS3tGASnOhRpnpz9T/I8YaC+J2NyS1BuhLvOSVp7JoXw6Dmg8tGkxSpQLKtETO7bmUSYD18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732554638; c=relaxed/simple;
	bh=h6jI21PEjbhQ0sfuEB0qZimB9vXs65jNY3Cey4tYJiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hY7W8Pn+CZLtAcqwTXFYdjRPJbThUvLXI8m0WsADdXu/puKc6738iJggr+lewcZuhJxzwVT6nPy4ggGh2VXmG9uasfQPGOHmkm0z8P7TeZOcHcdaBKqQnlrCNWp7Wjntggiht0uzllDHC+6Fy33ZxyzQGNVwoJcYQTDFTGLMaV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TRmmCUQG; arc=fail smtp.client-ip=40.107.241.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOfs+PAqK4RppauZhUgYTa0Q5vfRweAwFySREHma7ZEAaJFIw7wiGhBfBCJ4S1ZWskZKHsnVZZG5rkjfxaTw1kMjGGuJrv3QeAr+BggRDN5OJuMmLXBsfoSDOAb9pmFoCV+E10F4fYizqCU7mqgITAbVzIyoXyd9v8JkvDjT+oQeiFEgWW4FyaIDSqeVEWd8tpMwwcF6jvQCwKgeUTDASGRL7lK/lTaDk7UNBlZU+vbaYZAwGfgA4IGAfvcdykWBIFELvXfGOFPYiqrFgoLzMIs0j1iHM0Pk1Kx3xkMBTn7LLfe60URWWqlSCtXsFjfAKKYRhZZ8jXrSvcqoQc5M5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcQNawZakCZi9hjMQaubeEMLs55IXSH4/rwC/+jBlI8=;
 b=kRfNgtXwVsK0vAKhFWnz4hHRHDmIWAIvcWISQt5eyyHn37CYIpWGWyoXek1rnFMjfM0yOpWFZA+qc4Y7gQ7dP8r5RAEkXiLTtqoefPs8WFaYTGpeaEkrmlrqICg/TWdmhRPCwUOAyZ+Hdel6kBE4V4Xs2t3LZ7Ve5/5Z0+S7FchslevQmrdET7zsDH6glqFKY4HJ3x8VA75bRtwrTyhNZ2/Zn39F1Ajo4nP9DNqG5338c6+kmCqbUCITjBJHsIWvkh0BYF12h4hBgyoJOqjjlrEZcjUc6JgrA8Qyo0kr0RoYfSVz2iJ2AecJhLk7omSRvD84LI5dOQT9mzv0rhNJ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcQNawZakCZi9hjMQaubeEMLs55IXSH4/rwC/+jBlI8=;
 b=TRmmCUQG75gcYpeueefRa8qseJSUSU3tcqfllT0NKWrnHGv203PqZvUrdPJ3H5VqMhIUBDyMlTG6GQXpMQrT1QZB8xUrs7lDDGRWL3FB5TmZB0ZLJsukDSm149e3YXW7LPHU8XUkNHQRPnzobtFh6Ikl6l5XN2HiUdezcKb8Pqgq7P/SUpUrVpsEc8nMolwMj7exMpzQN/ful+LeUGvXg3wb78GYPX+zontRwrpHnF8e89v3HobaBcHWCvplYXPit8H3NSoavclzujyL0vv9Gg/02p2K/Zn0HXKBtRo3V8wuwpXecwNXhDY6TOBCMgRnz+TOAYCQGzATtk7SlKI7Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8452.eurprd04.prod.outlook.com (2603:10a6:20b:348::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 17:10:30 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 17:10:30 +0000
Date: Mon, 25 Nov 2024 12:10:25 -0500
From: Frank Li <Frank.li@nxp.com>
To: carlos.song@nxp.com
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: switch different pinctrl state in different
 system power status
Message-ID: <Z0SvgdJGs6ccAk4W@lizhi-Precision-Tower-5810>
References: <20241125134322.1611845-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125134322.1611845-1-carlos.song@nxp.com>
X-ClientProxiedBy: BN0PR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:408:142::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: faf7799e-f629-4841-7709-08dd0d7410cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sUJvgxFBE2APi0hrUy3hWZSz0g4sjDjrBCUQdUVO8n7rK/W8/VB9wf/UJbwm?=
 =?us-ascii?Q?sdRJ96H2oE/seDyX8uRJblRqrxEUFnOvFktJxPSsPnT3p+PhxnWgB4DmK3wM?=
 =?us-ascii?Q?4WZIV+/dAVocDpA9ezSiwNfav5qdnHh+zzBxDYO17B05jxTRLQ26cjU64UlQ?=
 =?us-ascii?Q?/jLDywbnxouOAbjEhtt8jjNZP9jHZaB6utUxD66aYbmaZaOWRfN3FkWo1CNN?=
 =?us-ascii?Q?/HVXDC57bZL7FtAt/QDH0nZttQDA8ifc42DJss+kLvxy8FhN/QCTvaqS3nnT?=
 =?us-ascii?Q?Nhyuh6dyvXnuV5pwnhTAOsNjqOVeceBJzaem/80TUkbyuhauRSC9nLUIL6Fu?=
 =?us-ascii?Q?uhbXTNMOMM9SYDQHe11PlfP5QMTXUakFp6THn4pJ7i7jl+zVyvXU7/tPtteE?=
 =?us-ascii?Q?dbxeKa/Gh0Ta/dFVrM0+9MQTtWYb+2dassNDfc5VAd7ZBDR5/HIXlUTUHd9d?=
 =?us-ascii?Q?LC9rmyCuRZkS8kBKz4HlUWxG7ywWtyre/eJS2lqoxna0RyMP/OzP1qtQ0axJ?=
 =?us-ascii?Q?CVhCws7VoJVu2DYdIbR9DfSxrIjDsI0FxV2bSi6fhC2+hJgW81Smech0MZUh?=
 =?us-ascii?Q?ePK/anBtINfxRwlJhApRw6l8s720fyDb2ZNI8jr9XjuVTK/4f5BhQshAHNDO?=
 =?us-ascii?Q?CaJtiA2IgI2Shnj+qhaKgoNL/emrz2tLyaugJbqkStTGauzILzoElKOM+Iq7?=
 =?us-ascii?Q?epN8JYPXHeyB1L9QavIrVHYl85k2uNy3Zj281dpsyUT3VqZXMtRQy02Jf8ry?=
 =?us-ascii?Q?BZfNssMel5g0BYIfKaBjRggdd6Qw2X2eiRYfUbgsozRuVDNMMNFn+ztr+UYd?=
 =?us-ascii?Q?G+eDuD6pFRgNUgbR1nIhwFnpr9yuFi/PQscunzJ2qWZrjOa3RevCxAQp4Urq?=
 =?us-ascii?Q?jdSU0VZPqWN5//ylvCEAEHv9CL6wQEk8btZjlpWo+wme5bNKAA6tf3bK1GBx?=
 =?us-ascii?Q?GBQzAzUX8p0v1l+ovaW8my3Opdp7mSf48t6XkgYOqMoFVOAdqaNugKTJKnMI?=
 =?us-ascii?Q?Dn6IbDJKPYVeKk4h/IP0nVHGZV8VbHNokHWnTRJrMt4jGfzg/cUPZHPl1ncO?=
 =?us-ascii?Q?yXiWkzFLD+Tnd+LnlswaFDNUYmhoWvGzEX/IkOOEceeUphli0n2osOk5QhPJ?=
 =?us-ascii?Q?Bw7gn5rmBAeDThDolGWcjyfw0WE8TmpDkC7YdFBnt53fbaDxT1Aqg/8Or/gR?=
 =?us-ascii?Q?ft6Bw5wKAs6AUM/pKRCG2sv3RyDcaACeaKjbgZpOZtxX+uVwwKrHWO0qNXXC?=
 =?us-ascii?Q?VniZ7S8rTOOdxJtRCvg1IFBSE0f+mRUkSm2YDDiLRocHuZIt5kZUtQ1uHNZ1?=
 =?us-ascii?Q?/I2fv6/YzNNKJ5gLUEU9hM9/goA2nW+b8yJ3U20DGspIWJGkiUFHyalYE9+p?=
 =?us-ascii?Q?PfrrBqhdDJzkLQXYkLTp2/oGB2k/em8n+hTS+x72roHRderNwg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7B86ATpzSw4fXKWxm/C4EHkrfcyMCqoiOJ2blFcZPyNv+m+vIpDMdmDq5p4q?=
 =?us-ascii?Q?zak0HCL+7sni2ZWfjoeaaBTWWYFU4x2znMdHmVx5BBLcGzH5Nerh88MyQ+sM?=
 =?us-ascii?Q?Nj52S4fNFLuv14vqexiT2bjrKhlzlyVi8J+lSKH3TOaBHPPKReawj76tc04V?=
 =?us-ascii?Q?oWwa7B8Q9aigEP/9rknWfAYdXRRjI30pX7LEtXx26ngwyrF4wcWE6X2X/3td?=
 =?us-ascii?Q?cRxp1MNowFz357KnCAyYPGA7P6ljGF78ylQa1ENNWw86UksoHSuSy1un8T0g?=
 =?us-ascii?Q?0QwMJ1aHOq9c+tqAd7uIZj78VMyIsyYSb9OPZoKju0Xiq91sAUIODfYRJDzH?=
 =?us-ascii?Q?eExZE8tIuIiAE99zwt+mldy3JlwUZF4s0uUGxlMAfNuiGd5zxEBHvWrNwp3a?=
 =?us-ascii?Q?LSj2ilHWGzDHYS6h1qMEsvYPwYygrspzZxOQ30a0zUPL1M848VfPzk/N2uJh?=
 =?us-ascii?Q?yFZ7wLOshujYPjPh0gdKgyxg3FOfLtdkmlIkkO8tvJnijlAZiAoMbk+PiQA5?=
 =?us-ascii?Q?rhHTFX4iLMT82jy1A8l139d9Se8lp01kBvPaf7+xKO3XxK8iKs6V2M17Lq0R?=
 =?us-ascii?Q?AkNke9EpBiy4jXVeUBov+/uqVkxe7WtQN09s564j+Z6IuKLZKRzj61OxfmhZ?=
 =?us-ascii?Q?kEfD4Gqd0rEydm1jNaUtGEtW+FnSAhciQYPbt/A/WwvFjBfKLqXyrkkhT/z2?=
 =?us-ascii?Q?TfXZKyKl4VP7WiU34M4F4IZCUYQT32tTHdAA8I6qnlb3xket0K+OpiHukEGO?=
 =?us-ascii?Q?Ckm7WiGWr6ebgpMxzNpcUzxIYyapz05UZ/k6dF2E2YAD7cF97H2DwrO7BJkw?=
 =?us-ascii?Q?uWZeB5pTw8ytyjPwU1XSy8M7JxuPJoJ2BAiM5izKV5wGbEBQPT01Nl5E1iPz?=
 =?us-ascii?Q?F4e6Qe+F1NkXFDzris2IaTieymIcotNKBTjL3Rsca92IED2TA5HeIYDsoddI?=
 =?us-ascii?Q?8o2nFs9eKHiJHv2fEDarGEDHsBoprLmc3HSyy87z5aexFuoy6+TiJYRY3wk/?=
 =?us-ascii?Q?MOkXo4jW/F+Ed68eihDWSu8MeupORh5CXhAyC+UQu0j0CoPD2HKiOjqUKKU5?=
 =?us-ascii?Q?QPr5zYp+OPHJ4HmSsI+2inNWlRexeFl/cgiC5V1Fyp9CY59SChTT9lowAg4v?=
 =?us-ascii?Q?5SRmiynkeBaOxPEOT5Nwi2MOe2MunIPsNRh+5d9XuFfjVGy//kb1E4xnYQNd?=
 =?us-ascii?Q?GtS1Dr9zxiQ78Bhy8PMPLQmhY4xlg1QFZbCaw9z+1pWOyJnXTFKN77MDmv6n?=
 =?us-ascii?Q?iBUb7im/eWH09y/xQcIoxg/UUH3nISfnk+z8co7uPMhAVfIYTKg+ouXOImxZ?=
 =?us-ascii?Q?NkT6O6QCtcYllhoRyNsv7ArH/M6YrpdL04VdpO419CMXtaf6tVCuu9gGXmg1?=
 =?us-ascii?Q?ouUkTJvVlj0WSQ51af5U855ov2TZat3b5+Axctxa9IL5eqwZdqwut4KDP5bt?=
 =?us-ascii?Q?DKdRRK8IZC0bBmWK1Pu4KKl8xXxM1ItBcuFEjiZ30F0YLTb2FpBragc54caM?=
 =?us-ascii?Q?2SK1YyMCG599Ly4LL/S41HGcQRalvHN1ymjziil1wcUtWxmsixJSJy/Zgh36?=
 =?us-ascii?Q?Jy0CSzZNfHdapByBcUs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faf7799e-f629-4841-7709-08dd0d7410cd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 17:10:30.6956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5B2sHKImck1rmTI6IJJ/y7P19RFDag6WjYp8L/Gu7I1+95iF2comrj7UESDNMJlpsGN/MSsAk9dSFrK+Wy3vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8452

On Mon, Nov 25, 2024 at 09:43:22PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
>
> Switch different pinctrl state in different system power status.
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i2c/busses/i2c-imx.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index f751d231ded8..cf8931a8013d 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1859,6 +1859,7 @@ static int i2c_imx_runtime_suspend(struct device *dev)
>  	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
>
>  	clk_disable(i2c_imx->clk);
> +	pinctrl_pm_select_sleep_state(dev);
>
>  	return 0;
>  }
> @@ -1868,6 +1869,7 @@ static int i2c_imx_runtime_resume(struct device *dev)
>  	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
>  	int ret;
>
> +	pinctrl_pm_select_default_state(dev);
>  	ret = clk_enable(i2c_imx->clk);
>  	if (ret)
>  		dev_err(dev, "can't enable I2C clock, ret=%d\n", ret);
> --
> 2.34.1
>

