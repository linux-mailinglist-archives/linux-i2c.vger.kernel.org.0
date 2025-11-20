Return-Path: <linux-i2c+bounces-14197-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0AAC75231
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 16:52:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B9F54E9A2B
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 15:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFDC2848BA;
	Thu, 20 Nov 2025 15:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OUyu0KYm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013059.outbound.protection.outlook.com [40.107.162.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21B82DCF43;
	Thu, 20 Nov 2025 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763653191; cv=fail; b=e5PzrBeudrzWLxhre+NwN+KZfBDtq84e8Qn8KH8I87F9me5jyAbE0YnpbxIjh/e3zBQvEoUqg21jQceyO3SM7zftJfk89ZxEtngChjtxT8OSzMKxEx1syzT6p+ICxidnoIiJiKB1uDlMehu3Kh5Bsas0J2uVIJZ2f4BC5/Dxa/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763653191; c=relaxed/simple;
	bh=zUV7YnBdX773Dp7+th3XGUomnqXSWnEXbz4ivqk6UhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oCVduzCGsPAHSFl9Nl6J5KtzuBjsnQw6ecDrimsBkOAUZQ8Y1qW+QRmx3K+IFnDOnaoEyT24c0wnLYgq7uOBuXCIVSEcz0kpr6d71Z48oQ1BVDOBuEff26KdX0xaXVHrAUyEgMq+IlpuXEybtP74K3SmCOg/VD94qol04V56ECM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OUyu0KYm; arc=fail smtp.client-ip=40.107.162.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYc03BqJbCLPMp9XA0lxXoxH7fu0LOKuwWcYqXiaLpsoy1r/vY4A04yJYGmtViHE6f3jFi0+JRW9Ye4IzG8F2aChcoQ3ZxKJ010vrcsME55hzBJVw8Un2P13eD58JbAgHpUHuf8Ri9jtJByQr7ZCL/XFILoJbplElVCjE2w9RLBazfAneuP//HYX/DFKYxawAk7eVwSqovPbDaQhUFvx39lMR/RmP3ahpfnl2WVAUFpt3yiMLAhgSVRg2NI/26dQvOndm1KcEZO6jb24FF+Pv9O3qY8+SkthWr/0XvdX2AF4lF2lh9pfPKifudFcwZIzYL42YJ32hTkY5NrELxMZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+P3fD17C1qeMkh8EfodVAcAYGjmL5fsto9yVCca558o=;
 b=fbE3RMUfMwBD6kPHQyNiBBNYLoESxVK1GSc6Q9lY8tHqZfuC8lGVozeh2rK5pNnbKYLfd4xHNwn7d8yK+Xq4BneaCBjUGtvONBpmp3+7942s++ybG+0Asncnl/P0L+LC4oIBz/SruPTQ+BpaRfJb3M0jJSqHlimCVnXy1M9tKO/DkZQyBcg/k2MG2fO9opUEyCw4PCMWAHOXcq7hgUG6VB3n4deV4APdLpX48vby9Rsd44OO8FsjhwTSchueUn11sTTOkh7VVlxJc976k6FyvhmRZff2GbMUoo3TEuA8dn9HdLArLbtEiZ7yC8NzrX6a3nkPTFWAum94oT0hUqjopg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+P3fD17C1qeMkh8EfodVAcAYGjmL5fsto9yVCca558o=;
 b=OUyu0KYm0PT/AKi++w22/5g3q9cwXb+/cL+3UWHje667/xXmlVtZGFZt2KoMLS3V+smDg/rxXqZwjnsy92JxDe4/7QMXu4EmTWZq1hvx2WX5GIBUn+ciA4X26OlMXurmhJm67XwhuoKqPkNPwohKoVEg+1iaQi0NELaHfI+9mq9upk8aHx2Ag5HtbY9+2p0uYiz53P2p4/o+2+Eg31HQN6xuvmp7ubQILCDWBzoH5kyGvU58ILMNbhVzuDzbQSVjH+S9OIkYfgtkzFZogisQeojJ4blvWXxS14/K0ZpZUwyY41umB6tdf6nwN8h952h2hCcMbL3mASV7+K+DbJsYZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB9022.eurprd04.prod.outlook.com (2603:10a6:102:20e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 15:39:45 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 15:39:45 +0000
Date: Thu, 20 Nov 2025 10:39:37 -0500
From: Frank Li <Frank.li@nxp.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: aisheng.dong@nxp.com, andi.shyti@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: imx-lpi2c: change to PIO mode in system-wide
 suspend/resume progress
Message-ID: <aR82OaSHDEl+87+/@lizhi-Precision-Tower-5810>
References: <20251120103039.1824209-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120103039.1824209-1-carlos.song@nxp.com>
X-ClientProxiedBy: PH8PR21CA0012.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::6) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB9022:EE_
X-MS-Office365-Filtering-Correlation-Id: b67a807e-be62-42a0-df5b-08de284b07e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZIAlkZN9lvqMu2/X69hkY2bEOmMXGDFEA2E1OVHTpMqV8NfYp4t0qw+uIkWF?=
 =?us-ascii?Q?HvGbK7+Y0kNoWFzp+7e0wu3AHl8CpHRL1JaqH5gK1Ri9tcP5YXeX6O8fi7Hk?=
 =?us-ascii?Q?DLlOYRzm+nlecJqAiVsOTMERFCAraUj9lxajEljQDjckmdaBXBgIAqCXCU5a?=
 =?us-ascii?Q?CEDtZsR9EGjQ0A+MFvvI+oQ19JUf07T7YLK5GA5ihJ1ObQ+kWULcrAOnX36+?=
 =?us-ascii?Q?PeeOZ2etiyhc2OtoAhaUU6S55C83Jj8CZW4aBQJdNHexrmvvtKslyOemTFtU?=
 =?us-ascii?Q?VKWk4XY1KxcaUQ/9S3KvDcH3LCK+aqemPQkbMOwGA8pW24pwK/qiHQhkzyBg?=
 =?us-ascii?Q?4eRJmhRAJ1JHJdNODzZwjsfd6gkAEWTaQhN83hYHIQx0f6v+y8SxDyn6TdNJ?=
 =?us-ascii?Q?ki26h+fgxkJHT+4ehTbnb+/nO1+sLOrz0BfoJDOMnkI2nsCZecg1b6vRVD3G?=
 =?us-ascii?Q?wGPLmLWWdWhSL19VD9lU09UJKH6Un0+R0NJ7mPSFUYjRCFZB7myNjTiS2f/0?=
 =?us-ascii?Q?HRlM4EdLpLYCO7W1N0VDLkzZz3ufeXTaFiIRR9qFkhnADfSL8oTx0nHoL+l9?=
 =?us-ascii?Q?LiWmgwb9cxP6OXULBJAKklxk3juIfUF5PAyj0CdGbSGCCLDiWQCihOe3HQ8m?=
 =?us-ascii?Q?kJbOHqNTMjSzkQ8LpnLlEa/gbdbGPMj7pC9ahJv0xmlz+FUqfU5KMqZsJ7Rd?=
 =?us-ascii?Q?eCp+Tpp4UlLeu9M2SBsjoLDM16/Ag24mLrsrc6f2qX7r1yAdEQcTMW9IGfrp?=
 =?us-ascii?Q?qaYk3ITMgdxgyOu/C7NiyPmQ5Mkr+d0mjanG3ZE41S+AtLi2IFqQpFkokUmK?=
 =?us-ascii?Q?CmM1aRi0LMubnEGBftl+tzeRHfn3SQNd+CHMc2SnhBqeJ3nD1fytZfh2auRs?=
 =?us-ascii?Q?D2xALvITzMwVAO2m5UufZqtzLyvDuA2IXOjplsYGIAqZxR/gUZnXd5jna+a+?=
 =?us-ascii?Q?f//31xSF1/csY9jbk31HsdSbdXNR8oDLUhYa1EthfIQVcrW1ejq7spH1fuvI?=
 =?us-ascii?Q?jI91w/l+ck/1LazeycNkoSuhTUCFLexl0g7wbQaqrNcnnJTNpupwsvc1RGkI?=
 =?us-ascii?Q?FD58/435K2bCGJJe8ubP+cwSiD2SqTncIKOjq4Ct4+/jklMvmULeUH155+Lw?=
 =?us-ascii?Q?dhkM8pQLBoH6ZTBLj8ubI0LTBmoxb/XxKTbzAB/4arrZf6lg2FrdIRk6sduf?=
 =?us-ascii?Q?kve+dUfC99krYCCAWKk8nOIpURwBekVqB/uxADrUdjDG959MEC0wj6ZkWp9p?=
 =?us-ascii?Q?26odypYFk7/T4LzUYf1L3Y8KQ5q0ESYwgz62l052gY/KhirJJshvHV4oNGl5?=
 =?us-ascii?Q?PM5EyD9g9lzyMrsquY6ZTMU0A3JyIj9caRb8mJFXNoqkXsOPqBkYe/sBQBOS?=
 =?us-ascii?Q?iqEzpbVaRLXEfeEb53I8QGxjl7IK2bNS3N4S7wPO5mVmpNB+7lDX7LVMhSZ6?=
 =?us-ascii?Q?dfWyaqEjkw2l0rg+FqzORtBz3M4y9FDWuOer25j5HSC33ia7VyybgP+d2hCn?=
 =?us-ascii?Q?gJoc+f3la0x/FmMirqO8b4zOTEJu3rtaUgd8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/yKRG2YQKD5v/Hb0gdMQLzYGGzW/fG1Jh4ldcu0GnW6ad6qHNKvTrtGppyb0?=
 =?us-ascii?Q?SduCpBN2vP2d/pXX6+uw+SIDIuPmuLphFiHXaf8zD0FLBGj+nzXuAdDa6kZ3?=
 =?us-ascii?Q?B1i2ZCIa3zgZxBLvzf17PGcikH0MUBTvud6/za/7ssMC4F0ISY5MGkS1QPQc?=
 =?us-ascii?Q?9SyggJaAQpneJ41wgwgjO8qDmkeuLs0ceAVpn39lmXwlbOueJUTfHjHWXp1o?=
 =?us-ascii?Q?n4FWTTT+T5LkL+Go9Z5J4BE+V9mAAmpmL5lSoC6PgItQbGgu+JxI198FX6Ce?=
 =?us-ascii?Q?MVnsI74/8mUwDg68Dw9OFmCInKOGaG+8oyVePK0wHZM+qCFZNLpZF72w0Xyd?=
 =?us-ascii?Q?RUeV63kSFAvSp7UEa/wDlGB8rRoRA3sBRHgcVDKRyNC7EaHl676HIKC1vJ0u?=
 =?us-ascii?Q?Qt98v6Kk1n8N+fLWmIQUALwL5fwN5OSlZ4amnDAS72xq9pb7VhOM/0/N89yM?=
 =?us-ascii?Q?PIR3HvNZTUKlDKeyy4vIo/E6VlNIY+n3+VCD8qbq3sS9P/E9cgiuA8BVp1hq?=
 =?us-ascii?Q?JjHVnGCTxWphF+13QpfrqBlFQs6XDmzpggMW38qhxgc3CH8/FSZhGZ+B8jg1?=
 =?us-ascii?Q?6GiQy/A7eJoVCSyY2Kw0egD+idBn3qC9GSiadAZ6a4BL80jT01BKEwzCHcZv?=
 =?us-ascii?Q?dBJ6McUBTRFo0c9U8dRiI+QcdFZQTL/VRboCQVhp+Ghz0flZQiYVUBjLLn+f?=
 =?us-ascii?Q?hpfC88lyaK324ELhvSeV7uPbk5iLo5Pjj0I/jcQouoJdaCgxsVpXKB+aQ/4G?=
 =?us-ascii?Q?PS+wsclc4Fg6hs1Wbu18DGKB1u/YezJGtz1sm5Y5xP8xQn9hwQyNdUPw3VHT?=
 =?us-ascii?Q?beWCgMl7chCGxi+mWzE/80EiJke0iI7tconi7DydNH8pSUTLfD/+FudZABjJ?=
 =?us-ascii?Q?aDpeSrZLvDOAW+I6S50h/IeEnGg1hQAozpWUBzEOdB5+V5y192jLQWyB2S4/?=
 =?us-ascii?Q?Gbu9WCZUjVVtkRYUJ5vgqbrqw+YUBU10s04WW05pzBP2D15uohrb2sd0np85?=
 =?us-ascii?Q?MYcdT52OHN2dKZSk2NCcV0mBLIw03mgq8ZJlZ3V+sTxulj9nFBL6/BR4/dll?=
 =?us-ascii?Q?ghlbM/UpZcSNvyK0IWhB/lpGmGcoMe2WMc3i02l46B+frpkXx84be/rS9Ap3?=
 =?us-ascii?Q?m4+9t3IwL1GSYxmjOMpFj88QtLlQpLbroof8fUlbBlnTD6d4AZYdhykCaD8h?=
 =?us-ascii?Q?TCUi3b4SBWM9wpG8rN0rsrjyMWbZg+l0eto1+3pmTh38/Vx/yiCYwrq+Ojsr?=
 =?us-ascii?Q?sSKbg4goWhxMOU9BI125FXb+kPE/ZQ9uK6ops8QkG2fUaldb5cR6nIwJY7OF?=
 =?us-ascii?Q?1x8cx2N/Ncxk/D48e7lxnOBHYLz1IPBC7StLhQEaS5sBaX9uk4RDrX9ewR+N?=
 =?us-ascii?Q?UCPQnmiTo+ufVFAPKRV7bStUzZRBxsQfXxXFZzIt9SJdJqVzMmHuuSAK91FK?=
 =?us-ascii?Q?Tpd0+uJer0q0/SFPhhKYfPASQHhZbpa1HMrrrhfik0f1Py/ubqJakgMQQPYK?=
 =?us-ascii?Q?uTWYN9w/nYCxWYh4TIJ749yfH+oj8glC03vOK1jy5GNOAtcuTSv73RtaNWHt?=
 =?us-ascii?Q?cozV5P6wnLvJGjycUMbdnkKmKhUFmgGvL0DOTzn3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b67a807e-be62-42a0-df5b-08de284b07e8
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:39:45.5721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1PQywxhmu3BYx5PqSQ7ROzqiMXLyeKQYoxyfRllRCYmL7gIvKrGw++CtdB51EiwrjyL9RMnWKPNaw46fgUqkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9022

On Thu, Nov 20, 2025 at 06:30:39PM +0800, Carlos Song wrote:
> EDMA resume is in early stage and suspend is in late stage, but LPI2C
> resume and suspend are in NOIRQ stage. So LPI2C resource become ready
> earlier than EDMA. When IRQ enabled, immediately slave will trigger LPI2C
> to read data and the length meets the requirements for DMA usage, the DMA

"the length meets the requirements for DMA usage" is condition to trigger
DMA, reader easily miss this and confuse.

> will be needed at this time. Within a very small time window, EDMA is
> still not resumed.
>
> If a system-wide suspend or resume transition is in progress. LPI2C should
> use PIO to transfer data not DMA to avoid issue caused by not ready DMA HW
> resource.

You can use AI help rephrase.

EDMA resume happens in the early stage and suspend in the late stage, while
LPI2C resume and suspend run in the NOIRQ stage. This causes the LPI2C
resources to become available earlier than EDMA. When IRQs are enabled, a
slave device may immediately trigger LPI2C to read data. If the transfer
length meets the DMA requirements, the driver will attempt to use EDMA even
though EDMA may not yet be resumed.

Within this small timing window, EDMA is unavailable, leading to transfer
failures. Force PIO mode for LPI2C during system suspend and resume
transitions to reduce system dependency and avoid using an unready EDMA
resource.

Frank
>
> Fixes: a09c8b3f9047 ("i2c: imx-lpi2c: add eDMA mode support for LPI2C")
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 2a0962a0b441..d882126c1778 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -592,6 +592,13 @@ static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
>  	if (!lpi2c_imx->can_use_dma)
>  		return false;
>
> +	/*
> +	 * A system-wide suspend or resume transition is in progress. LPI2C should use PIO to
> +	 * transfer data to avoid issue caused by no ready DMA HW resource.
> +	 */
> +	if (pm_suspend_in_progress())
> +		return false;
> +
>  	/*
>  	 * When the length of data is less than I2C_DMA_THRESHOLD,
>  	 * cpu mode is used directly to avoid low performance.
> --
> 2.34.1
>

