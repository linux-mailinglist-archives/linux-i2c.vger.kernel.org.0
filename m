Return-Path: <linux-i2c+bounces-14007-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F7EC3CD53
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 18:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BF0A1898AB1
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 17:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC6334EEE4;
	Thu,  6 Nov 2025 17:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C+g5mY2i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011045.outbound.protection.outlook.com [40.107.130.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF8B34E759;
	Thu,  6 Nov 2025 17:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762450074; cv=fail; b=ADrURHDGWKf+MVWkdoMBBqBda4P6HK/wMH60SJGCI5YoOcTPl7nQTsOEzvEBnhxqiR47oSTNF9xstybXCL4DmK7fkKGUE8tWsVJ6POx9uflNKHNTsteUnRJozGNCPuvDKyMTPqyMLDBmqlusqwTxL94iXRmxE9YzgefuS87N0Ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762450074; c=relaxed/simple;
	bh=pc3K3x4LSJDWo2cBGBpblxzHoBM9Y9NNHbif6fAvYyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IAYale8yax4pofPq6kaVTnunVU3BpZ02rT5Rmc1DgryA/bWSiAxwnrBFNwIM3qQLzivVDtE2UicD8CPtM4V4EOxXanT7CxMah+KlLWRigo6DZXvLX4k/WQjMD5EAYy+6iL5X3zqTeMIShabK66zBoSlD8TBVvH2bF1uiqNuqbUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C+g5mY2i reason="signature verification failed"; arc=fail smtp.client-ip=40.107.130.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlYCBBwxidOQR405mIfUHUJFWH89RHzOIXQUttLQi2qtRYmkqpbI7GfGRL48LughRxpN1bGl7E+Kv5/jG8TnTLlG6LFgzJSJKQUY8LI2dpKhdQtxH6s6DXQJIW6LDA38erZs9+LmsotP5vt9D7NZJFKp/HwAz4r+/fzvAk5vUyvNnLYoeckcscu55N7OWG88WMeEH+RAeIiDdorlmDClsbr74SmZAVyeb8Pl9/XEp5+OqUKcrXiqehyn00Gp9Pz5TwI/J0X1p7DMUvKRJ85K5/2l8OKLSruC28mIL+HdMIkn+lSHn1QoEgz3CO3JZTrWAofouaRNwo2mEqNDJdrfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIjo98yLndnJSZOKl1FnXygc313VB5sLq8oljCszA1A=;
 b=O9SWNo4FAsqaveBCRc3BjoIzmuMjDlZPT1qiPu8UjMW/KN0+rUYU0w1E659qUz/Zm6oz1FMRgjOaKYPPzmNk7n9TDufTLGq8Lqxsh6GrBrN0kEjTNdTu3asBDAdyg5FEsjj+sHpaUDY5uAyj6rmH9lmMoY966m1w0oaM9KPZQs2ZTlEBRS0BuXavHuiXEk8ueY/NqSFTBJH7XUbBGGeUy8NqDycCNiex8unIXgtKAClzSG/rA4oczqFCY7Bkn8d2haW7HAA1/1jjdoRYTpWgSPIMPo/3+GAdLo/yYXesaZX3yX457eWaNMpjIWbBSC8kFzDzlRZKBkGX6FdxDH3qIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIjo98yLndnJSZOKl1FnXygc313VB5sLq8oljCszA1A=;
 b=C+g5mY2ij/WmGziaeO1gHMcJQvlR2ZHnMdwSkKCXoQ1jl0PPw06vaajT5y/CaRGLBEXgcox/u4ALrjDOJIiVij/evdka1WZzIgxDBuhyIE3NZ20x+uQwaFBmxrVDNiRqY/iza9uo6KDk3o022nLNrn/8x2/nKeOGqfXhPDKIRHcAVYlIvh4wUYZGP+2Qm8sgZwMmtrCkP/7uAeaaE4sBlhKPfD1l9ij5SRSSgMFXAa+A8xlPq7Th+oh+2pYSxukXXOvkA+0FeaOVUSVjwaEB0+ni+CquT4MvWQtfmslG2uQTL3yZtanG6H6qnO3AF0FuzigAqyY8d0AAF0J2Ln+qnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GV1PR04MB10557.eurprd04.prod.outlook.com (2603:10a6:150:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 17:27:49 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 17:27:49 +0000
Date: Thu, 6 Nov 2025 12:27:39 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] dma_mapping: Add auto cleanup support
Message-ID: <aQzaiwngL/AtdmXo@lizhi-Precision-Tower-5810>
References: <CGME20251010185046eucas1p26868b540b74a96e36943066216525bed@eucas1p2.samsung.com>
 <20251010-dmamap_cleanup-v1-0-ec5bc14e82c4@nxp.com>
 <f3fba346-6fdd-4b0e-9414-087a12772a6a@samsung.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3fba346-6fdd-4b0e-9414-087a12772a6a@samsung.com>
X-ClientProxiedBy: SJ0PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::21) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GV1PR04MB10557:EE_
X-MS-Office365-Filtering-Correlation-Id: b44889f3-d21b-493a-cda9-08de1d59ce86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|19092799006|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?f5Af3GExDklHfxC2JrAE5MyWWHVklkQNDazo2CXLyQrY4IlYvQVBu0mCHt?=
 =?iso-8859-1?Q?o9PLKxSVG9qUvzOFfUut9y/4g1Hg+F71cgb0yuW2Dmmpd/lovibj4WQM2n?=
 =?iso-8859-1?Q?4Pex7EQrS6KSmLr05zMh0lTDMu2LK5tWJMgCh8fE9xfOccwM/hJ+yAdQmZ?=
 =?iso-8859-1?Q?vBXOSZiqfS4rsWCKH9GfjEm0A7iK7i/WKW07G6oA3g9yMbjoUi1XGRJhsd?=
 =?iso-8859-1?Q?lJW5L/COLCIHBcgkRyCPXBXbj1jrgHifvrAqn1lBY0/P9I/EzJrgOT7C9f?=
 =?iso-8859-1?Q?Fus00Vvu8lQQBNASnt82SBluDOn0Hcx0HmeejLrmGLjYkiM06DDL+78hkN?=
 =?iso-8859-1?Q?FmNHytKnyzjaac9sLd9OOvBrfNE3sKeiqatYFgsQZt8IZWmwNxUjiqRnHj?=
 =?iso-8859-1?Q?xiNY5vziFRA/0Dw1CJVsaO6NWGgmYSn4JqsoH/rhe7KJ43eIr4PErxcSlg?=
 =?iso-8859-1?Q?176GJ1/JRJhcKmYuEu6+4B26iIoGo9O9FRxsUMaHykDTrGOwi58om/lk1b?=
 =?iso-8859-1?Q?IkpDbYYuViSnCZ+KjM8fCh05vkpOgVSYUpQfYc6LUIgTtxe/RB/y5kO+uX?=
 =?iso-8859-1?Q?juTMkKVWbVFh7YE6iwshJonu20taJFj3Dm+wZL426XhoNEAA1y76XEoupL?=
 =?iso-8859-1?Q?V3L3ubpYICnNuuo/ye2mMvkzKv8mAbWIR8Pg8D6fTfE/pyTekiRf+s6joy?=
 =?iso-8859-1?Q?H9ceBIbD1uulD2BnPfSDyQduY4gCpQYLnUJKs3NyqR30VkG1VXL4Tvdd1s?=
 =?iso-8859-1?Q?pCayvXfdHevgSNTCf9skNpVyf3CRsS1gnAG/XUTUoC1xxOYmy2wXwOoV2B?=
 =?iso-8859-1?Q?pVcI6JA4QaAQ+66twYtEnu3XaLPCmmTsfPpZAryw/1cdoLGO32qQRVfHHp?=
 =?iso-8859-1?Q?EGaf0O0WV1sGf/tChebGNHh9oQzAJAvS7HAPE0ZfaF3uqty6susue2tAdE?=
 =?iso-8859-1?Q?YF7di3HlkQsc6L2Nhb6SzUMcUJlElnEqVRw8qXiJlqwLa32VYcawG7U3Z3?=
 =?iso-8859-1?Q?1rP6Wim5QIo7atUDDv01cGIK7cIeknpLuGgRS2vtbqnusrTs/ymvEync05?=
 =?iso-8859-1?Q?XwjWYd2FUqPCqgrSEnQoDlVpcStHcaDs1mfTGumaVqI25z3LfBRMybBMrV?=
 =?iso-8859-1?Q?gR7JpmRSEb4OocTKHgr/Z3tYMy46o7ziSgBldmA87hhxJgsV7VWhJ6Ud1/?=
 =?iso-8859-1?Q?f09+YpR1Dt5SwxvsZOx1U51GswjtMopZ4Xf1vQbE8ulgB85UZj5DQHQ/uk?=
 =?iso-8859-1?Q?h7rCgxfe+xiJlV2qQxs5p1XVV5klbGd5EAA1lAglewPqBTBwEWJ7px7QoM?=
 =?iso-8859-1?Q?w6xa5ULy8fb37ZMDS530ue1p8QMLN4dKAB3q4mJ2P4IilKYU7UV8mzT0la?=
 =?iso-8859-1?Q?TCa+AHls5l1V5iBg4eJpMR4EbR8lO/MlYAlBQx1jTp8X3ig17MsekSsDLS?=
 =?iso-8859-1?Q?iO3BJ8eHo6MTv/fpNWKjAPqID2+9uX1YIGvtBLwHcc3N3fhJq445wfpQtj?=
 =?iso-8859-1?Q?KGDKz1K0pNnXmeoQAm62gEpcrr4lS16zdEcuJA+DoTkueS6psemz61cCHS?=
 =?iso-8859-1?Q?OSC3w9a2qg3/TEUyOCEyzfkW6+bJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(19092799006)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?eQTHc71LXQrWkNGpVHXS9MDfjDPUokhH7XH0d1gVJ7+GXfdBDkvpJeG86X?=
 =?iso-8859-1?Q?v+3F8Ba9AIegVdJsJ1nH2lHFnxlPQ1MmzIMmVcJUoBu0gCinJJ0tyd4KcM?=
 =?iso-8859-1?Q?gDlLkTEJEVdWTefmmPmY4PLHboRgE+MWbAhX5hSh8C9CODDaiaAnPjY5Gj?=
 =?iso-8859-1?Q?H3pJ6d8WwZO/5NaA8wtV7M9k28l2rrBA+it52GQ/YgHoT7saR7yYHZg+rU?=
 =?iso-8859-1?Q?NRawx6koqgl2Lg0JyMRYBCxTVnqQz4OfQtv0oHzPTAaGMoHaIPE/kiFi3U?=
 =?iso-8859-1?Q?bKiGdlKFoaYPoUm46KbTkpcfb8/Fs/FWDydEgtzF8CgnlHPWIK6Ug8ceHn?=
 =?iso-8859-1?Q?IfEXIIa2E6DjvsPEuLrgxuI3Hakwm3OGGbOMlL0XcL/QocBvBxaSyiWp3z?=
 =?iso-8859-1?Q?ZPYrVjLXDDk5mhsgkuxwhR+3meBXhLzKmn/kh65jx4sSxx9Riv/70txRSg?=
 =?iso-8859-1?Q?RS7xLJjqMRPTbpC0LVFh1nh3S62SokXldxAjc3akvpX35pD4oCstcF8N/i?=
 =?iso-8859-1?Q?fASuldsG9afmi/RkElAIkB3rjB4UeRRquyH0E0VG9frkpvix7DSXWbGZyE?=
 =?iso-8859-1?Q?vBqcmekg/iDA3FwOD0ndcEYzqkMrCx6I7jLzwSjMo28vOuPQ3roiNXJuwd?=
 =?iso-8859-1?Q?EopI5MsynCh05s8hQqA/nVekSUUMA8kMVpChcavq9N30IrqtTE4B/Qipu+?=
 =?iso-8859-1?Q?7LA3MKyZvfdvTmoDqBNt2L4sUOcIgKVUKFN7mQDENQ7dAh0oIrjdPJC4Ol?=
 =?iso-8859-1?Q?E1IuX0Uk/HEL2Uw7eexIeLYv3TZXRVKphBJP/L07PHBGEnG66Dff9ebOPw?=
 =?iso-8859-1?Q?1n4V5h/rEuC3bQeK05H2X5MwVFHC+GkSo0f8LinpD0Pw4Yel/0zhX6nIOe?=
 =?iso-8859-1?Q?oa4807u+RXEQqO2aFpgvVvZUy31jJRFK5/OsKHe5QZJIR9YDYh6kv9marB?=
 =?iso-8859-1?Q?ZyMIapSizCIp5iQdowg0MxbcdZyJerC4DB77qYQgq9XDOn+gOQMSpjz6oI?=
 =?iso-8859-1?Q?8rCrDHGqIUpKC0dXvt4CrF9MinjyZg3aCJKBQeFxy4KGst4bMAhPLpsjqQ?=
 =?iso-8859-1?Q?+AZZU64YuHhAbyq5EcmjEzU5MIUBgm+2d38cz0RJDMSoE+8AjAa6ZpJCCF?=
 =?iso-8859-1?Q?GBFD1vjqZmiBl5gKAX+QlZ4icnmw3Rqi7ceflbUKd8PStrKOiW8eS4LFn3?=
 =?iso-8859-1?Q?LgjgmElHGydLWJRHHDunTytndTC2tubYnNHDcScWEKNeINzFyVZWbaHDTD?=
 =?iso-8859-1?Q?BuuTe5R34gLXQgO3qpp/qUsRUAtQfml571Pgh1jCQnFlrBLnGpFXAqxc1/?=
 =?iso-8859-1?Q?4XLau2hetXlVSrgAMII0kHTmQ2FYGWbCDZz0NZDqjRuelLy0yBBym8MBE5?=
 =?iso-8859-1?Q?qb4RWl+kMw6min8HF9aNq/3gd2sNd9skNQhnYNJ7Y3jiUt4kVbx7GggSm9?=
 =?iso-8859-1?Q?VKdaGVcKNNW5EQAP/2GNex/Nfa6AJznglbu3qClENoTwV+LQZUR0O7xOeZ?=
 =?iso-8859-1?Q?7Y0pqZK1bY3xx6QTPW5FQDL6ZE5iOIulEvX6jxyWaa7ZiqFJcd8Uh3OrAf?=
 =?iso-8859-1?Q?8AIB8bLMUFPow4zWo1ANXodgH4gJE2Brj+1aingA8k3wOwaGUdWDuP+1G0?=
 =?iso-8859-1?Q?fbDGHWCtftsTA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b44889f3-d21b-493a-cda9-08de1d59ce86
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 17:27:48.8844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADMVzpu1zWXD13H+YFUYMhjDt+wEdjVoTg4RTViwt5XKz5IIPox0klWw3cpv6p0LCEjVS+gkKzkwykBBytirXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10557

On Tue, Oct 14, 2025 at 07:54:46AM +0200, Marek Szyprowski wrote:
> Hi
>
> On 10.10.2025 20:50, Frank Li wrote:
> > There are many below pattern
> >
> > 	fun()
> > 	{
> > 		...
> > 		dma_map_single();
> > 		if (dma_mapping_error)
> > 			goto err1;
> >
> > 		dmaengine_prep_slave_single()
> > 		if (...)
> > 			goto err2
> >
> > 		dmaengine_submit()
> > 		if (...)
> > 			goto err3
> >
> > 		wait_for_completion_timeout()
> > 		if (...)
> > 			goto err4
> >
> > 	err4:
> > 	err3:
> > 	err2:
> > 		dma_umap_single();
> > 	err1:
> > 	}
> >
> > Use cleanup can simple error handle like guard(), such as guard(mutex).
> > or __free(kfree) = kmalloc.
> >
> > But dma_umap_single() need more argurements. So situation below complex.
> >
> > It need pack argurments list into structure.
> >
> > 	#define __DEFINE_GUARD_CLASS(_name, _return_type, _list_class_fields)   \
> > 	typedef struct {                                                \
> > 	       	 _return_type ret;                                       \
> > 	        bool    okay;                                           \
> > 	        struct  {                                               \
> > 	                __REMOVE(_list_class_fields);                   \
> > 	        } args;                                                 \
> > 	} class_##_name##_t;
> >
> > So save all arugments to it.
> >
> > __DEFINE_GUARD_CLASS(dma_map_single, dma_addr_t, (struct device *dev; void *ptr; size_t size; enum dma_data_direction dir)
> > will expand to
> >
> > 	struct {
> > 		dma_addr_t ret;
> > 		bool	okay;
> > 		struct {
> > 			struct device *dev;
> > 			void *ptr;
> > 			size_t size;
> > 			enum dma_data_direction dir;
> > 		}
> > 	}
> >
> > So cleanup function can use saved argurement.
> >
> > The above fun will be
> >
> > 	fun()
> > 	{
> > 		CLASS(dma_map_single, dma)(dev, ...);
> >
> > 		...
> > 		if (...)
> > 			return err;
> > 	}
> >
> > if funtion return, which need keep map,
> >
> > 	submit()
> > 	{
> > 		dma_map_single();
> > 		...
> > 		dmaengine_submit();
> > 		if (...)
> > 			goto err1
> > 		return;
> >
> > 	goto err1:
> > 		dma_umap_single();
> > 	}
> >
> > Macro retain_and_empty() will clean varible to avoid unmap.
> >
> >          ({                                  \
> >                  __auto_type __ptr = &(t); typeof(t) empty= {};   \
> >                  __auto_type __val = *__ptr; \
> >                  __ptr->okay = 0;        \
> >                  __val.ret;              \
> >          })
> >
> > So
> >
> > 	submit()
> > 	{
> >         		CLASS(dma_map_single, dma)(dev,...;
> >
> > 	        ...
> > 	        dmaengine_submit();
> > 		if (...)
> > 			return err;
> >
> > 		//before return;
> >
> > 		retain_and_empty(dma)
> > 	}
> >
> > This series just show how to hanndle many agurement at resource alloc/free
> > functions. Only show dma_map_single. If the over all method is acceptable.
> > I will more define for dma mapping functions.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> This looks fine from the DMA-mapping API perspective. I think we should
> also get some feedback from Peter, who authored most of the __cleanup()
> based infrastructure, so I've added him to the recipients list.

Peter Zijlstra:

	Do you have chance to check this?

Frank

>
>
> > ---
> > Frank Li (3):
> >        cleanup: Add DEFINE_GUARD_ARGS_CLASS macro for resource alloc/free functions with multiple arguments
> >        dma-mapping: Add auto cleanup support dma_map_single()
> >        i2c: lpi2c: Use auto cleanup for dma_map_single()
> >
> >   drivers/i2c/busses/i2c-imx-lpi2c.c | 13 ++++---
> >   include/linux/cleanup.h            | 73 ++++++++++++++++++++++++++++++++++++++
> >   include/linux/dma-mapping.h        |  8 +++++
> >   3 files changed, 87 insertions(+), 7 deletions(-)
> > ---
> > base-commit: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
> > change-id: 20251008-dmamap_cleanup-d0a7f0525a3d
> >
> > Best regards,
> > --
> > Frank Li <Frank.Li@nxp.com>
> >
> >
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>

