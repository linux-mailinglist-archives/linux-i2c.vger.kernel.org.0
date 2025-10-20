Return-Path: <linux-i2c+bounces-13683-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 964E2BF240E
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 17:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B40953BFE61
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 15:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D44279DB7;
	Mon, 20 Oct 2025 15:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KxNdwLgh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013009.outbound.protection.outlook.com [52.101.72.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4180B2798FA;
	Mon, 20 Oct 2025 15:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975822; cv=fail; b=NV8nq+mgZhSZe7zEghpVktOcD+SgLFTHMpmypEX7va7cRWHX89FvFWbjdzo85PhDHrRzLLU5+LALzSLZsFjOiToFTC1de9LBJzA5y3uXxVRLfnK6qVPZ5Sr5LmEITWzJpRzXG1uHJ13eUkc2JrFjTTA0amlqlM3Z/l/Chp+vr+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975822; c=relaxed/simple;
	bh=pwxC6YYBTdpxL8xXGbtaUf44hO9Qc/U6w50/mCqigjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EX/DdH/NYHbHu/ZAkFHs1Nf6ltBAHT9aMK8ExTsH000Mevljye/0AeXfXD12J71tbLDBX+3TJ2F2VLhre+HKLEgFOiCQs6euawAfQeLH+3PCSeEp42oCaFmHrhEpxBHEbjlGxgokEcanIMLTKj/Lgh7maGtE8VOSUONuZmuxUbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KxNdwLgh reason="signature verification failed"; arc=fail smtp.client-ip=52.101.72.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQ6sWq14XITRToxaEgC+6BzOmJecwPHp3erPoi8hGy1zgt1Wt9IPdA/YlOGQjEdGVDhXsec3AeE51pnbhgM5MS5SvxieNE1FzcDZcsqh79BfTlqSBXaQzO4iZJA4uyCZK1x/9aYtZF72SyHxpUqZF9lLOX0gSykk61tZuLz4IfLkg7lZXUW8MzKDsnfWCpqrbuU99jMJwMEEX1xwESXbPS1SHb7EKf4X4KZECvsWuq9E6FF3ICMJLlHT5nPNdGqI3Nnw4nkDSvVgE7Nr7Xduf3YHRO/cMbKZaRBeBwHk/DL2P/Xq93dBxyCd/w9sqjoQ/yztgikpA+91bUvd/ILtgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gz0L02bSnHW0HJMg6szLmQsELmDnfXdKwGCYwlSVnn4=;
 b=Ur3mmyIr7SDEwAtcC2ZWOuCWq2TMpiDsgXVXJyhLtt9J0jhT2k6LFw8ZMoECQUGBSAfjovagkz3G87c/hxzUJa0M9SKr98Pus5ZA1lMcpyFHTptNy5nzqUqyflFwyy7li8MIo0i4kI8kdZyZFw/4WMxvZeMZ3SJOCAQB2HdIjCEX2BtQt1K+CoyYD8EBNd4BCfcEFh1ORrUs6degtu0JVMlK4xPPjWD1NAb1kEViU6EjgenOj6Unvl9e665g0vvOb+Zeeg4dpcGiaZyWO8bI+MYSm/euyPlXCqW71tcRXHrE0+W91wrRTUMrj7ZoPDzGMH8Lz04AHdJYGJwKAehXXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gz0L02bSnHW0HJMg6szLmQsELmDnfXdKwGCYwlSVnn4=;
 b=KxNdwLghc44W+5Y61Cff807qv582Cij0nre8YD3dYW9H5hQdpkmoY35FQJ3NBfIk4QvnuSNQ+OpI5Nml7kp6+KreBzSvmE1G62Q26TYUqHh3XmErokKYzaP8+PNJ0d7wjxu+ZPrW0neBeWkQemdFiZaMJsGtroELDggbDsHs2XJUtK6wv7R32DMcq1sKjDuNS9RT6rpGLIRGqbLq1HlGJxM39+kj7LilD65LH3OzUA9djGGqK4R3opvR+47L7m9nHSvumjLo0gHyxLJyUXt7Vg7dWBi6cBOPbWAtVRftMR8Y7TZA6UqAj/xm9XMF+mib55bJJIFvOoKEIRLl/h5cZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by GVXPR04MB10539.eurprd04.prod.outlook.com (2603:10a6:150:21f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:56:51 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9228.014; Mon, 20 Oct 2025
 15:56:50 +0000
Date: Mon, 20 Oct 2025 11:56:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] dma_mapping: Add auto cleanup support
Message-ID: <aPZbuY5bLpkoO2J/@lizhi-Precision-Tower-5810>
References: <CGME20251010185046eucas1p26868b540b74a96e36943066216525bed@eucas1p2.samsung.com>
 <20251010-dmamap_cleanup-v1-0-ec5bc14e82c4@nxp.com>
 <f3fba346-6fdd-4b0e-9414-087a12772a6a@samsung.com>
 <20251019120304.GG6199@unreal>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251019120304.GG6199@unreal>
X-ClientProxiedBy: BY5PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::22) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|GVXPR04MB10539:EE_
X-MS-Office365-Filtering-Correlation-Id: a765d0d7-5d68-45f0-d37d-08de0ff147dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?E9KfyLVaKO10UF4MCC+p1SmlDrtcHXS+Uw4sUNqhl1CRfQ9NanZHbHJYOj?=
 =?iso-8859-1?Q?zjjn5N18hAPQSFXFQPigYoN+tycl2iz+/nOh+JG2lYqFb5ke7Aunva2/Mc?=
 =?iso-8859-1?Q?9CB+nbv6uv35rFnB1Ly2eqfjpvKy5fvuIqmiOCwx1xoahGLCSu8YjqEDdr?=
 =?iso-8859-1?Q?5etf8/+puge3A+ErnfA+XdK18n2dcxOy1GsoJkMExug1pQX10hosNqrv0x?=
 =?iso-8859-1?Q?U8bEQrmNORX+rxf0sM4VoMby/AK7zy7o0aZp3zCd5NjOkFJ9hfD4x0qi2O?=
 =?iso-8859-1?Q?1+SICcfUiobYjD3HB+vTZ9BI7lSJWeKpNENcoaZKhBOjC8lrCRIpUP+MTg?=
 =?iso-8859-1?Q?F1dWeNi/H/3kG3h8Ekafq//7rnM4WMIEJszUJT8h+48TWgOF6fBohaqfYY?=
 =?iso-8859-1?Q?7rkjm44I08UwLUBll5Rmcqbtkpgq2YQ2VyuGcHEWf/CPldTzj/Pzdsbs2F?=
 =?iso-8859-1?Q?ac47MvDkv3+j5J+1iSnqdhzIzyw7Zxqo63NoJvyLYYxYwGy9/lSNrW3DxX?=
 =?iso-8859-1?Q?/FVsyThIA0k6L9YMuGvgfq1mHyuvDgNXI1avOBafLVUQoyH7ZxeSTxRJF7?=
 =?iso-8859-1?Q?tyw4/NH9mZuBBzIccQr9gYSIFmBEwNpHzr9+sGj0dNGdK0sx3JvWG/q4wB?=
 =?iso-8859-1?Q?HymT2SeK4lJ3Bh2oQNalr2NIHJRtsWVMBzNdslYebi1AyBcwq2zDMxErpI?=
 =?iso-8859-1?Q?M7MumxAoYGsB0KKBOaQl3GLyVfhquRRvAyVnmUY9l9gAVINS1x0xtsY2ml?=
 =?iso-8859-1?Q?swfShMszihBUl+gDI8rkEhuoqRUSxSG/lcJfpIbYPLY6aJhNmfgXBm98fy?=
 =?iso-8859-1?Q?bUg4EUkdALSr63OcJ9knEH4zyCwhxrobaW6l/i1jxzpuENoxhSqZAXE5Jw?=
 =?iso-8859-1?Q?Fo8mEf2Kymn/ACkIwMMk0CAZhZrVXged+6RTOK4OpXCfjEKRpIuPN5xn/+?=
 =?iso-8859-1?Q?/RgHJ9qRXuY21gEIjw39L9o/sO3Ra6NywXPw0/B+j3raoqAdx/mfJUrTEz?=
 =?iso-8859-1?Q?Wsbngmmru+uJgnncduWlVpvve9UgIWMHAGyUzU+nPoCoPTrk1K7Gfkq7Bv?=
 =?iso-8859-1?Q?lMrROtiND1bT1k5YK9XeDUc59Va9Ri/oBcSbbNoDGeoPkvbn4JSWCKgqbt?=
 =?iso-8859-1?Q?Zu3IhHLrjnvfSFlDlyOGUAK2RIWjuuemMsC41qoDw9SpCadHrxpXU2WvKn?=
 =?iso-8859-1?Q?16aofFnh6Wg2B6DGI1CYAZ3/Wogy1us5FNe5It55phj6qGI4gjmIixzp6n?=
 =?iso-8859-1?Q?geNMCy5N30hZ2HMisCx0NIEAqcZk8LIADTxJlCesouk9Mw4tm3BSvqaFr0?=
 =?iso-8859-1?Q?ZAJm2WxE7eEbrZz5azE+1vMEB4vsANdUhm2uvSg+qWz2Q19v9f41TPYoF+?=
 =?iso-8859-1?Q?NERG+1m8pL2a9XEaGnDQLQMtfVsUpgTG+oHy3VlBenLzhQVS9QqJMX/nre?=
 =?iso-8859-1?Q?YuhHvKFIPvsUh8Jc888JBrM//k8S6mYKyoOWKoMsXOavrK0j3GKk9OBQQg?=
 =?iso-8859-1?Q?bDG1Fezv0/rHfzCZSgtDarquFRjrFi6KT3kjJTuVywaT6fN0Vp461iSKIN?=
 =?iso-8859-1?Q?0AfqjqJpvx4wZS/e1Zasfxi6ohlk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Kze7iWjfLqfH+mv1g9zD/UdlDSA147fSx0wVPrN1N6SQjTBNiQJOVay1ML?=
 =?iso-8859-1?Q?FyTbHtlkOygOixGIb6fdaAQCNKS/bvmWjWKLmibLGlVyLFn4KZMvZVYCsM?=
 =?iso-8859-1?Q?I8vtb6Z9d7gbTqejPkczEZk3jFfozX4fZQxHXo2aQEeOjFsQoN7aOTge+J?=
 =?iso-8859-1?Q?wIsz1gGhTyMU/d72e7H5tPkSFiJfTJmjSPgfEXW47MF41OA5DBmNxscnmU?=
 =?iso-8859-1?Q?Hz3EM3B6UQTxuB8v9hx57kLeCLk3RBHv+2NjgE7Ki9A0sPAgBIvlL2d/2y?=
 =?iso-8859-1?Q?3v49gtQGwwFWMRg1cp+8d81Q8XxGUp3wHu3SdvHF9tgQHwGpr+1l6xI9/0?=
 =?iso-8859-1?Q?GiWE6pcyJDSg733UWhFWA7I0qBwtTJW0eUEdBYDNeA/It5bRUgfT5erCJK?=
 =?iso-8859-1?Q?Hw5qSh8YTou3p+gQlPEUf5Dtn6z6pwlKjhoXOulWSmR76YWDTnkEdomiOv?=
 =?iso-8859-1?Q?BBxPr+HDKh59sj/YOFl84jGie50QN4oqDNzsxrApIj+eAvIMUx9ty/6iih?=
 =?iso-8859-1?Q?4XpXiXI5JA31+TcGXHe/fg1acJi9VWrLSFPn8fk03JwwMLR3q4vY88QEBH?=
 =?iso-8859-1?Q?YbCwJhqJ7NnBkXoR/C7dzasjeAaQqP36UV0d/+L1knXk6sodvZo3EESUE1?=
 =?iso-8859-1?Q?Kq33qdMRJFx59BKYhBe6TAyfk1oVbqGS3UVma0KkY2SB4DOFFcQX7OftbR?=
 =?iso-8859-1?Q?IwIAAhMKIBDGhgDAVshVxKTMMxKIYy8Be5JXiWIUW8gPopn7lrdt4E/cAK?=
 =?iso-8859-1?Q?C34NeE0Sq+KLyMWyC4ZJpp4jieqhgr7i5QqOpiGVujCsg14iLbr05CPq9H?=
 =?iso-8859-1?Q?+HxaP4hcF12yYgQ4Q10O3AOsuTNY35ceJuXM2N5hLHpRSNxMMaMmLnRgjH?=
 =?iso-8859-1?Q?JYqgZmBI7rKzYjuEe1zzQP55lRIlVoUZ5fSaWBwxaoM8u3GMn5r1u9yDKA?=
 =?iso-8859-1?Q?2nNhcUn7cyQANSY+FAeHJOe9KJGGvC57Ns3wZWVe6kvm/rgjtEYDYWLgfY?=
 =?iso-8859-1?Q?EynIfj7nl1rvQrMnhm4ZhUp+LP7Z9p8cwp7tFp0XO/k74onYB21qApa08h?=
 =?iso-8859-1?Q?ALT6P2rTLVljb/nN99g37aysMfO24gZpo+CnqwSQJNS5mfM6ljMgzq/jz/?=
 =?iso-8859-1?Q?3GQEfzRYKpS5KeIt7XeAeCPWoLV3/oiqCEt8NWdFiurdtfvD/0uMpp6LJ1?=
 =?iso-8859-1?Q?ffWsey/R+W26C/mcw01+KRTDK/7ZBMgYg9O0m42fgctJZe3mxDB0QemjTh?=
 =?iso-8859-1?Q?csGrD3KM6TcOBRNFcqKBL/nUlfDksFmHE8X+yUgnvvjceijRFZ2i3xpQx/?=
 =?iso-8859-1?Q?7VX6Gh1gvjEnFSPb6Y6+S/Jgpub/z69o22ZD0GMjI/ABhnT9WMmB86IAD5?=
 =?iso-8859-1?Q?0bsb6hJQo7Vmac2XPcWLvsxbvwHoEVfsdhETayB9Ig0tdDwbKmpQwDpimd?=
 =?iso-8859-1?Q?Rsb3eqf+z4Dq23Z/QlJmUNU1oof1RlsoyP3Rsgs6RC1rKfstD3tfAyQBYR?=
 =?iso-8859-1?Q?0SS62pXtWgidTbP2WGW0Mqj7k/fyxUBE9vLb7yD0Xt0OCRq6LGXgj7F0es?=
 =?iso-8859-1?Q?y3CLsVT7A04b6XRtJya/U+w2RgcHzwgUMGHQIHW0EVOPyjyYZYR+4XdDBn?=
 =?iso-8859-1?Q?0QvarSRRBWV9NCObT1OoEsd0uZlfUrEOBP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a765d0d7-5d68-45f0-d37d-08de0ff147dc
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:56:50.4900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2JyObuPcNYxH+7HI4j2ceZ5O+KWFZGM+sNxlaGh/OQdvBjMKM0yq8PVrBchWoBanBOeJ7uT32gv9EaSgT1hSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10539

On Sun, Oct 19, 2025 at 03:03:04PM +0300, Leon Romanovsky wrote:
> On Tue, Oct 14, 2025 at 07:54:46AM +0200, Marek Szyprowski wrote:
> > Hi
> >
> > On 10.10.2025 20:50, Frank Li wrote:
> > > There are many below pattern
> > >
> > > 	fun()
> > > 	{
> > > 		...
> > > 		dma_map_single();
> > > 		if (dma_mapping_error)
> > > 			goto err1;
> > >
> > > 		dmaengine_prep_slave_single()
> > > 		if (...)
> > > 			goto err2
> > >
> > > 		dmaengine_submit()
> > > 		if (...)
> > > 			goto err3
> > >
> > > 		wait_for_completion_timeout()
> > > 		if (...)
> > > 			goto err4
> > >
> > > 	err4:
> > > 	err3:
> > > 	err2:
> > > 		dma_umap_single();
> > > 	err1:
> > > 	}
> > >
> > > Use cleanup can simple error handle like guard(), such as guard(mutex).
> > > or __free(kfree) = kmalloc.
> > >
> > > But dma_umap_single() need more argurements. So situation below complex.
> > >
> > > It need pack argurments list into structure.
> > >
> > > 	#define __DEFINE_GUARD_CLASS(_name, _return_type, _list_class_fields)   \
> > > 	typedef struct {                                                \
> > > 	       	 _return_type ret;                                       \
> > > 	        bool    okay;                                           \
> > > 	        struct  {                                               \
> > > 	                __REMOVE(_list_class_fields);                   \
> > > 	        } args;                                                 \
> > > 	} class_##_name##_t;
> > >
> > > So save all arugments to it.
> > >
> > > __DEFINE_GUARD_CLASS(dma_map_single, dma_addr_t, (struct device *dev; void *ptr; size_t size; enum dma_data_direction dir)
> > > will expand to
> > >
> > > 	struct {
> > > 		dma_addr_t ret;
> > > 		bool	okay;
> > > 		struct {
> > > 			struct device *dev;
> > > 			void *ptr;
> > > 			size_t size;
> > > 			enum dma_data_direction dir;
> > > 		}
> > > 	}
> > >
> > > So cleanup function can use saved argurement.
> > >
> > > The above fun will be
> > >
> > > 	fun()
> > > 	{
> > > 		CLASS(dma_map_single, dma)(dev, ...);
> > >
> > > 		...
> > > 		if (...)
> > > 			return err;
> > > 	}
> > >
> > > if funtion return, which need keep map,
> > >
> > > 	submit()
> > > 	{
> > > 		dma_map_single();
> > > 		...
> > > 		dmaengine_submit();
> > > 		if (...)
> > > 			goto err1
> > > 		return;
> > >
> > > 	goto err1:
> > > 		dma_umap_single();
> > > 	}
> > >
> > > Macro retain_and_empty() will clean varible to avoid unmap.
> > >
> > >          ({                                  \
> > >                  __auto_type __ptr = &(t); typeof(t) empty= {};   \
> > >                  __auto_type __val = *__ptr; \
> > >                  __ptr->okay = 0;        \
> > >                  __val.ret;              \
> > >          })
> > >
> > > So
> > >
> > > 	submit()
> > > 	{
> > >         		CLASS(dma_map_single, dma)(dev,...;
> > >
> > > 	        ...
> > > 	        dmaengine_submit();
> > > 		if (...)
> > > 			return err;
> > >
> > > 		//before return;
> > >
> > > 		retain_and_empty(dma)
> > > 	}
> > >
> > > This series just show how to hanndle many agurement at resource alloc/free
> > > functions. Only show dma_map_single. If the over all method is acceptable.
> > > I will more define for dma mapping functions.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >
> > This looks fine from the DMA-mapping API perspective. I think we should
> > also get some feedback from Peter, who authored most of the __cleanup()
> > based infrastructure, so I've added him to the recipients list.
>
> I may represent minority here, but patch "i2c: lpi2c: Use auto cleanup
> for dma_map_single()" looks completely unreadable after this change.
>
> It is perfectly valid to use __cleanup() for simple and scoped things
> like kmalloc, but DMA API is much complicated than that.

Yes, DMA API is much complicated. Actually macro CLASS() is using
__cleanup().


#define CLASS(_name, var)						\
	class_##_name##_t var __cleanup(class_##_name##_destructor) =	\
		class_##_name##_constructor

Frank

>
> Thanks
>
> >
> >
> > > ---
> > > Frank Li (3):
> > >        cleanup: Add DEFINE_GUARD_ARGS_CLASS macro for resource alloc/free functions with multiple arguments
> > >        dma-mapping: Add auto cleanup support dma_map_single()
> > >        i2c: lpi2c: Use auto cleanup for dma_map_single()
> > >
> > >   drivers/i2c/busses/i2c-imx-lpi2c.c | 13 ++++---
> > >   include/linux/cleanup.h            | 73 ++++++++++++++++++++++++++++++++++++++
> > >   include/linux/dma-mapping.h        |  8 +++++
> > >   3 files changed, 87 insertions(+), 7 deletions(-)
> > > ---
> > > base-commit: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
> > > change-id: 20251008-dmamap_cleanup-d0a7f0525a3d
> > >
> > > Best regards,
> > > --
> > > Frank Li <Frank.Li@nxp.com>
> > >
> > >
> > Best regards
> > --
> > Marek Szyprowski, PhD
> > Samsung R&D Institute Poland
> >
> >

