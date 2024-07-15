Return-Path: <linux-i2c+bounces-4987-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8229318EB
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jul 2024 19:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 701B51F224D1
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jul 2024 17:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D36623749;
	Mon, 15 Jul 2024 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="fC8ESP4c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013014.outbound.protection.outlook.com [52.101.67.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7522B481AA;
	Mon, 15 Jul 2024 17:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721063021; cv=fail; b=GVPKapKr2hENuSGRWGjI2JdWfeNHRYj8Qeqyr8E/fbpIS1EOGW6IHwrFR8rpe3CTvouOCkuF5oJvhlvAQVK2P9EVqGTLKOeJKprdzFPiikklmFQiXZh5kGGqApoUmcTbqaiS33oYgFzeg7dUW8RbrIwDkMg5riqNOt+DmPTAyMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721063021; c=relaxed/simple;
	bh=fBksf9CQWYG2z5sW9cddPpHDvGEIoNNK309w3UdarN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Dom5RCu9eYhnMlsgx6FB1x4CmpjG9HQTaPC60QsRDKdCNv9CrdubwQgoazDAyIuZXks6OlEx8iR32JQD4eZiDEZVB0sFp5l63YwZLSBFShvT+m9ERQQeCxUbnx5B7nOxEgEmsjkrglJJsDdMDRKReXXMOBn23UPzExFKCid4hDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=fC8ESP4c; arc=fail smtp.client-ip=52.101.67.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t19WXAY3aAOyMCKXhZ3UmsuAGhUqh9mPbaW/RvwGFtWnwxFLOfMlQDVCFM5F/tcwLmhrsYP33o/zb1TAXMg4XdyNg6qWDX1wq+XP9o9eb+t6EaO7hVavuXF+G3UtkvAPF+kFKu3jqPtiG5wiBBUF/icLubRanNcxYIZDCkBF1PfsKBw7uisuXw1kebqbdWUOoMmKTy6cazSJz44hj/lMjYcvqnK2/qM5kGdXvMROrCcUMuJwIkT4waAxG4eBkCRofcGrbCvR5z4rN2CEYCFWFSEM2JIhWug4jR6W4cWHqoY5CIag69vQ+3FW6yS59MJfar5m6BFTyrCQ2Wz1zf/5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cciN462COIc7mEboaw04cdco3GjJyBypDVqTWt+Lxcc=;
 b=Fg976sE7kJcr4tbO4PJCYdbHnoBj1IL2yh9WtiK9ry8aT4BOOZ+unCMX/E1aLEYTTeK3bECVrwb8AetEl3RAspy+h0NkofiFuDX9pnIQiT6rZRhO6fQeNrOcEP5wGKCfDt1fXcQihdHbsM5Fa4Z604cfL2YhhZMVP+DNmrDPaF1naiDNj+kaK2vZxeqkeFbXURaZutqGy7Cksu4hATkSBu1yyY7QarDuRvRoCSSz2mkDv+WyP/bdejO+y5fQ2jm9+hyDvEuBPur4Ni7SI4XCsl9bivbd/zTmkEQ3A3gO/p8IhrbEtjVPVQg4gLB1yWGPpYJpkTBKg50v/fMGPA/e0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cciN462COIc7mEboaw04cdco3GjJyBypDVqTWt+Lxcc=;
 b=fC8ESP4cekT8zN7YzlvHGsv7ri+ZPICWw7gpSlYaIjhuPw/52Y06RUqEdQKF3IkDqHEIKmA6GnDDSMF4nlpBKlkxW+PU8OVA5VPNw+KfiLCMKPM92cjAhTzYr/Z6SYDox1S1ZcoU1JoLGkQz9zpWq+4x3/++DzmHhHVH9BD0IGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7956.eurprd04.prod.outlook.com (2603:10a6:20b:241::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 17:03:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 17:03:34 +0000
Date: Mon, 15 Jul 2024 13:03:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	wsa+renesas@sang-engineering.com, francesco.dolcini@toradex.com,
	joao.goncalves@toradex.com, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 3/3] i2c: imx: prevent rescheduling in non dma mode
Message-ID: <ZpVWXlR6j2i0ZtVQ@lizhi-Precision-Tower-5810>
References: <20240715151824.90033-1-eichest@gmail.com>
 <20240715151824.90033-4-eichest@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715151824.90033-4-eichest@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:a03:331::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: de4ac69c-3942-41f0-3b85-08dca4f00fc1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?MLsuRcKUCRuzlbIthAykCUNrpl2aF2IDk8ArpEyuEiIeLsKG55dqAYzL42i2?=
 =?us-ascii?Q?9+6/bWFDhBBZo5lDcrCoak87uZCpBZS4JgTNZ2mXpMTdgkatVx/5BHib+I75?=
 =?us-ascii?Q?av6PEDd+CNCdsuZRIl+rpfoBjtcGC3Lzy6FRgA+Zgu2fsycwb9zaA7q2un9B?=
 =?us-ascii?Q?zJx2jwS2j4PTdVB5ATu86OzLu5SdT10zL4jV71LXKJdVjcXzL2liXK2iUsOS?=
 =?us-ascii?Q?vR+PdEQ6sUFUHSB334W+qFe1X0MrfKwHOe7DbYTRKUj2oujJkPc4XXPOofSv?=
 =?us-ascii?Q?I091Xo18YlpF7eFDKnhNpFhrgrQBQg5RGdlAztE8zBUV1IjzxrvBie1d0HBo?=
 =?us-ascii?Q?C5u+y8nuIZgrdvaPQHIWCNibLe9AKZLuDcFYYp0jQTMHouJf6OCm8w6WUu2z?=
 =?us-ascii?Q?HTWWO7WiwzS1A1mD4cogPhWtkiSKPGOPEkycWmdS1eZJzvUYHRwoRJkXPN15?=
 =?us-ascii?Q?hQA6rsOyWzDHOUd1nY1BA9EoiwYVDh4SHXYOtUD5vaSljFs4CUp1266gIuxf?=
 =?us-ascii?Q?APSTbIxcqCVKDYd5TxmR95OiPth3Y8cTVBGa4/q/FLuModlg3/Cmra4wIRhR?=
 =?us-ascii?Q?qVAPOi/rn72/Htnpl26cV5Bx5DSRf5TcKqO+QchoBTYNxI/jXgq1o5JeA6ef?=
 =?us-ascii?Q?8cnCELIE1kZo6wSPEplLVyOzlQ6FS4oq2IMEaCvnVaklBfnEH1q45HxKzSF9?=
 =?us-ascii?Q?Vvu6xxADivcODW6swCF4aW9YUC/hto3Ep1QdDnpHoNwWvp+MIMl2stLMa8Aa?=
 =?us-ascii?Q?SZBo51sD7ZIvykdv/2NKQw9kcQUbFLlLPgU+FvO+Z+Tzb78hkTrH+rXYpA5V?=
 =?us-ascii?Q?qskUeH1m59NFJSpj0BV7nqD3jbnpDfWRSvjuiu7N9oCWS4O8AtWel+cvd6Rh?=
 =?us-ascii?Q?nckrN2QOeUydxaZQJ7vLdVlxTH7k6SDTUjpmBbOieRhdHU7c7Dy50QCLn7J9?=
 =?us-ascii?Q?WBFySCr5sBfLVSnlmfRn8JgsphQEOMFkmMb+hn9CL02YBioAmAtS+so1+xyd?=
 =?us-ascii?Q?P7zr+Fz22cLsV2W4hOn20nTE1FoVt++xobl8iJiuOKpFs1trGkfoxtZ9Bu3m?=
 =?us-ascii?Q?zHMnv2iYbCd2we6XQXy7JjvUX+szQxp2ociBHUluvO7x0YS7ZPNpNuTroCYv?=
 =?us-ascii?Q?vG0tkmM1Cg/WS4COItI/yw0aLDwhBAxBwbI8AmFva0/QBfnC2r+yblU6J9Dr?=
 =?us-ascii?Q?HdDt95Y388i5jBEtwCS7KpykJC5LjDbiXY8T025k/zYsV6K/QW7aBZPPaEKF?=
 =?us-ascii?Q?ZftBjhGZvpstwENCWeXKttiWQViG7zaY8tiXRiiMx1m7W0qHcqG4wXHkk8HK?=
 =?us-ascii?Q?3qLwZ8GHwM9THWG9LvFJ2eFSNCKzg4peA3Dx/VOrMNckbU/y6aOOJIw4/6IZ?=
 =?us-ascii?Q?IaKt5R/E0dj6RPOxHKzNTIMXAogB5NNu4bdLNO43Gb7UdEhycA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?/J6ghJfsp2PWyhXnVQsS/B5BBiZ4dKgqOVMMO0jPzBphvfcYZ2FD9b8umM76?=
 =?us-ascii?Q?Hkyx/kEuXCa7GshAbF3QLXsx+RZUzQy43kkXkJyIhjmygPcm43VTxDoShlhR?=
 =?us-ascii?Q?yA32VCclA9lG9cNKpEL16aOTV6jvqmSO8J77WHQ8UUGYRb92ZNR1PTXtX0zq?=
 =?us-ascii?Q?l7B2m7mfCHCUJ8pwHfHbFL3uM6X3OwQV9nPcOPq/l2H6XQewl4jwZ5o1M2HV?=
 =?us-ascii?Q?bODss7llA2G4iN3U9P3COWBwDGAmwt0beERw1COIEI2zJlqkgJlngkQIYq0y?=
 =?us-ascii?Q?C8dULzrBtdicaWdVGMOeCMKm/mNzwrvTDJew8udFXvufafRWClZYvMIyHHrM?=
 =?us-ascii?Q?zMHeC/6+8ktiHSnqbYeU4R58+k3bp/GP2EfoAt1UyXTiKBk+0W+bOqZYQYYv?=
 =?us-ascii?Q?K7YJP6FLH9gxLxRFPXbMfP2Vfr9L6AxR00h9aJPe2nKFCFPYg9O+4Db94o/o?=
 =?us-ascii?Q?70TiFGUpcMwjMppfyCSw8tsTarWiQyH+XHb0HJCqcmI7tsbhF5taKYHkhZsi?=
 =?us-ascii?Q?GB7lNz7xy4Cw1hzBQullZDWAWqgCt2RgbeKGvZWX18QsGi14Q+TyLDqwFpxX?=
 =?us-ascii?Q?K8LEdgZMIuE0WrBIFkjP1PfsDaeZhk0hB7+qpXqnqgAmrQ7HV4kTT4gA71N+?=
 =?us-ascii?Q?c+Mm8bQl/w5pnYpGu2ahQkskMe2PmYu7QzFFJtsAdASu1JtVvUMbcJ62JqrB?=
 =?us-ascii?Q?alGU1pVkzvofAizN81HIysAisv29XoZC1JPbQTNvbEB02V3a9hNfbggs2Z6w?=
 =?us-ascii?Q?5wmsjhEWi8x+RqZmYUohPnC93oxFqMrF5nrMuVx4CsTLcicAatjULKcvssQr?=
 =?us-ascii?Q?CQzUzjMgllW7W91ZNvqWw/T/GTe+dK3cv/I7UkqWk5r7RBQXeZIq72i9TEXA?=
 =?us-ascii?Q?eC5M/QMc1cdNHuPUcPQUsJztxk7NjwYa74u2UjnEccdU1QBmzTwz9IOQ4tRv?=
 =?us-ascii?Q?aRdA1/VEfJ6W2L0rQA4HQ74L3SsvMqzlkbOKr15KCnTFs+KYh3FPcHXd6mYm?=
 =?us-ascii?Q?1ZMyaookxf7CuSid9BMx0yOMa/w/rAn8z90bHJH4b3U8Xvf1Fuqwe949rLZR?=
 =?us-ascii?Q?eSqgrs95VlGURzFbk5crVBeirhTYfCMuZIPODZzhAPsAmGCtb6q4LUAbxfiP?=
 =?us-ascii?Q?JWt/S2YREqyRQSoAAKzlN/gvGLdKqvY7Ok4H44Pj0d6GeSZQbKLkVeJKUqxk?=
 =?us-ascii?Q?wWh0ztZ4Ae2F7xZ90cyTVAIPVLkDt9Rfmc6EvTa+OxfwVJ5c2LBINUXA0MvY?=
 =?us-ascii?Q?WUeSAqkyKVJDbaY/WrOccATE6P24XCj8LCbyn3CFfQwct+UKbL26+A1nDvWC?=
 =?us-ascii?Q?HGJRPLr8bMXFhODzXwQPFyEHQsH3jYhM2vou7opP9wHaXfm6p1fCltCFMHUw?=
 =?us-ascii?Q?AUzWuLT4WDHGGr+aenX0ZT12ZqU6PzBneYyyYbN4ovAEJlFPXzz/CYOYssb9?=
 =?us-ascii?Q?MNeVIwZf/0KaynSGaQqMX18bRRSzSMEFYRUoLtVANHYY3PVVjGazuZ8/PlOd?=
 =?us-ascii?Q?keChvzPelUV14r9LRgweN+3FXsXK/H2LGw/xbYNuaFDnkU+qFUqvg1tQ3lbd?=
 =?us-ascii?Q?y3pSZyh9o8xvu1UyXWU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de4ac69c-3942-41f0-3b85-08dca4f00fc1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 17:03:34.6154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gx+xBCJZoKw4rCE3WIWJmWBNYDwlbkCp1ih/AOAexqTPBK0Lgs8XREnd/8TBor0mkEEMllBnYczi4Tv4zhAqMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7956

On Mon, Jul 15, 2024 at 05:17:53PM +0200, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> We are experiencing a problem with the i.MX I2C controller when
> communicating with SMBus devices. We are seeing devices time-out because
> the time between sending/receiving two bytes is too long, and the SMBus
> device returns to the idle state. This happens because the i.MX I2C
> controller sends and receives byte by byte. When a byte is sent or
> received, we get an interrupt and can send or receive the next byte.
> 
> The current implementation sends a byte and then waits for an event
> generated by the interrupt subroutine. After the event is received, the
> next byte is sent and we wait again. This waiting allows the scheduler
> to reschedule other tasks, with the disadvantage that we may not send
> the next byte for a long time because the send task is not immediately
> scheduled. For example, if the rescheduling takes more than 25ms, this
> can cause SMBus devices to timeout and communication to fail.
> 
> This patch changes the behavior so that we do not reschedule the
> send/receive task, but instead send or receive the next byte in the
> interrupt subroutine. This prevents rescheduling and drastically reduces
> the time between sending/receiving bytes. The cost in the interrupt
> subroutine is relatively small, we check what state we are in and then
> send/receive the next byte. Before we had to call wake_up, which is even
> less expensive. However, we also had to do some scheduling, which
> increased the overall cost compared to the new solution. The wake_up
> function to wake up the send/receive task is now only called when an
> error occurs or when the transfer is complete.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 257 ++++++++++++++++++++++++++++++++---
>  1 file changed, 235 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index e242166cb6638..ac21c2001596e 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -197,6 +197,17 @@ struct imx_i2c_dma {
>  	enum dma_data_direction dma_data_dir;
>  };
>  
> +enum imx_i2c_state {
> +	IMX_I2C_STATE_DONE,
> +	IMX_I2C_STATE_FAILED,
> +	IMX_I2C_STATE_WRITE,
> +	IMX_I2C_STATE_DMA,
> +	IMX_I2C_STATE_READ,
> +	IMX_I2C_STATE_READ_CONTINUE,
> +	IMX_I2C_STATE_READ_BLOCK_DATA,
> +	IMX_I2C_STATE_READ_BLOCK_DATA_LEN,
> +};
> +
>  struct imx_i2c_struct {
>  	struct i2c_adapter	adapter;
>  	struct clk		*clk;
> @@ -216,6 +227,12 @@ struct imx_i2c_struct {
>  	struct i2c_client	*slave;
>  	enum i2c_slave_event last_slave_event;
>  
> +	struct i2c_msg		*msg;
> +	unsigned int		msg_buf_idx;
> +	int			isr_result;
> +	bool			is_lastmsg;
> +	enum imx_i2c_state	state;
> +
>  	bool			multi_master;
>  
>  	/* For checking slave events. */
> @@ -908,11 +925,150 @@ static int i2c_imx_unreg_slave(struct i2c_client *client)
>  	return ret;
>  }
>  
> +static inline int i2c_imx_isr_acked(struct imx_i2c_struct *i2c_imx)
> +{
> +	i2c_imx->isr_result = 0;
> +
> +	if (imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR) & I2SR_RXAK) {
> +		i2c_imx->state = IMX_I2C_STATE_FAILED;
> +		i2c_imx->isr_result = -ENXIO;
> +		wake_up(&i2c_imx->queue);
> +	}
> +
> +	return i2c_imx->isr_result;
> +}
> +
> +static inline int i2c_imx_isr_write(struct imx_i2c_struct *i2c_imx)
> +{
> +	int result;
> +
> +	result = i2c_imx_isr_acked(i2c_imx);
> +	if (result)
> +		return result;
> +
> +	if (i2c_imx->msg->len == i2c_imx->msg_buf_idx)
> +		return 0;
> +
> +	imx_i2c_write_reg(i2c_imx->msg->buf[i2c_imx->msg_buf_idx++], i2c_imx, IMX_I2C_I2DR);
> +
> +	return 1;
> +}
> +
> +static inline int i2c_imx_isr_read(struct imx_i2c_struct *i2c_imx)
> +{
> +	int result;
> +	unsigned int temp;
> +
> +	result = i2c_imx_isr_acked(i2c_imx);
> +	if (result)
> +		return result;
> +
> +	/* setup bus to read data */
> +	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +	temp &= ~I2CR_MTX;
> +	if (i2c_imx->msg->len - 1)
> +		temp &= ~I2CR_TXAK;
> +
> +	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +	imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR); /* dummy read */
> +
> +	return 0;
> +}
> +
> +static inline void i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
> +{
> +	unsigned int temp;
> +
> +	if ((i2c_imx->msg->len - 1) == i2c_imx->msg_buf_idx) {
> +		if (i2c_imx->is_lastmsg) {
> +			/*
> +			 * It must generate STOP before read I2DR to prevent
> +			 * controller from generating another clock cycle
> +			 */
> +			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +			if (!(temp & I2CR_MSTA))
> +				i2c_imx->stopped =  1;
> +			temp &= ~(I2CR_MSTA | I2CR_MTX);
> +			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +		} else {
> +			/*
> +			 * For i2c master receiver repeat restart operation like:
> +			 * read -> repeat MSTA -> read/write
> +			 * The controller must set MTX before read the last byte in
> +			 * the first read operation, otherwise the first read cost
> +			 * one extra clock cycle.
> +			 */
> +			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +			temp |= I2CR_MTX;
> +			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +		}
> +	} else if (i2c_imx->msg_buf_idx == (i2c_imx->msg->len - 2)) {
> +		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +		temp |= I2CR_TXAK;
> +		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +	}
> +
> +	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);

Why not use loop to read all data from FIFO? I think read_reg use readb(),
suggest change to readb_relaxed(). The similar case for writeb. dma_engine
will use writel() at least once when start DMA. it should be enough for
memory barrier. 

Because it move to irq handle, writex__relaxed() will help reduce some
register access time.

> +}
> +
> +static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_imx)
> +{
> +	u8 len = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +
> +	if ((len == 0) || (len > I2C_SMBUS_BLOCK_MAX)) {
> +		i2c_imx->isr_result = -EPROTO;
> +		i2c_imx->state = IMX_I2C_STATE_FAILED;
> +		wake_up(&i2c_imx->queue);
> +	}
> +	i2c_imx->msg->len += len;
> +}
> +
>  static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned int status)
>  {
> -	/* save status register */
> -	i2c_imx->i2csr = status;
> -	wake_up(&i2c_imx->queue);
> +	switch (i2c_imx->state) {
> +	case IMX_I2C_STATE_DMA:
> +		i2c_imx->i2csr = status;
> +		wake_up(&i2c_imx->queue);
> +		break;
> +
> +	case IMX_I2C_STATE_READ:
> +		if (i2c_imx_isr_read(i2c_imx))
> +			break;
> +		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
> +		break;
> +
> +	case IMX_I2C_STATE_READ_CONTINUE:
> +		i2c_imx_isr_read_continue(i2c_imx);
> +		if (i2c_imx->msg_buf_idx == i2c_imx->msg->len) {
> +			i2c_imx->state = IMX_I2C_STATE_DONE;
> +			wake_up(&i2c_imx->queue);
> +		}
> +		break;
> +
> +	case IMX_I2C_STATE_READ_BLOCK_DATA:
> +		if (i2c_imx_isr_read(i2c_imx))
> +			break;
> +		i2c_imx->state = IMX_I2C_STATE_READ_BLOCK_DATA_LEN;
> +		break;
> +
> +	case IMX_I2C_STATE_READ_BLOCK_DATA_LEN:
> +		i2c_imx_isr_read_block_data_len(i2c_imx);
> +		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
> +		break;
> +
> +	case IMX_I2C_STATE_WRITE:
> +		if (i2c_imx_isr_write(i2c_imx))
> +			break;
> +		i2c_imx->state = IMX_I2C_STATE_DONE;
> +		wake_up(&i2c_imx->queue);
> +		break;
> +
> +	default:
> +		i2c_imx->i2csr = status;
> +		i2c_imx->state = IMX_I2C_STATE_FAILED;
> +		i2c_imx->isr_result = -EINVAL;
> +		wake_up(&i2c_imx->queue);
> +	}
>  
>  	return IRQ_HANDLED;
>  }
> @@ -959,6 +1115,8 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
>  	struct imx_i2c_dma *dma = i2c_imx->dma;
>  	struct device *dev = &i2c_imx->adapter.dev;
>  
> +	i2c_imx->state = IMX_I2C_STATE_DMA;
> +
>  	dma->chan_using = dma->chan_tx;
>  	dma->dma_transfer_dir = DMA_MEM_TO_DEV;
>  	dma->dma_data_dir = DMA_TO_DEVICE;
> @@ -1012,15 +1170,14 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
>  }
>  
>  static int i2c_imx_start_read(struct imx_i2c_struct *i2c_imx,
> -			       struct i2c_msg *msgs, bool atomic,
> -			       bool use_dma)
> +			       struct i2c_msg *msgs, bool use_dma)
>  {
>  	int result;
>  	unsigned int temp = 0;
>  
>  	/* write slave address */
>  	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
> -	result = i2c_imx_trx_complete(i2c_imx, atomic);
> +	result = i2c_imx_trx_complete(i2c_imx, !use_dma);
>  	if (result)
>  		return result;
>  	result = i2c_imx_acked(i2c_imx);
> @@ -1058,7 +1215,9 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
>  	struct imx_i2c_dma *dma = i2c_imx->dma;
>  	struct device *dev = &i2c_imx->adapter.dev;
>  
> -	result = i2c_imx_start_read(i2c_imx, msgs, false, true);
> +	i2c_imx->state = IMX_I2C_STATE_DMA;
> +
> +	result = i2c_imx_start_read(i2c_imx, msgs, true);
>  	if (result)
>  		return result;
>  
> @@ -1139,8 +1298,8 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
>  	return 0;
>  }
>  
> -static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
> -			 bool atomic)
> +static int i2c_imx_atomic_write(struct imx_i2c_struct *i2c_imx,
> +				struct i2c_msg *msgs)
>  {
>  	int i, result;
>  
> @@ -1149,7 +1308,7 @@ static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
>  
>  	/* write slave address */
>  	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
> -	result = i2c_imx_trx_complete(i2c_imx, atomic);
> +	result = i2c_imx_trx_complete(i2c_imx, true);
>  	if (result)
>  		return result;
>  	result = i2c_imx_acked(i2c_imx);
> @@ -1163,7 +1322,7 @@ static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
>  			"<%s> write byte: B%d=0x%X\n",
>  			__func__, i, msgs->buf[i]);
>  		imx_i2c_write_reg(msgs->buf[i], i2c_imx, IMX_I2C_I2DR);
> -		result = i2c_imx_trx_complete(i2c_imx, atomic);
> +		result = i2c_imx_trx_complete(i2c_imx, true);
>  		if (result)
>  			return result;
>  		result = i2c_imx_acked(i2c_imx);
> @@ -1173,19 +1332,40 @@ static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
>  	return 0;
>  }
>  
> -static int i2c_imx_atomic_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs)
> +static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs)
>  {
> -	return i2c_imx_write(i2c_imx, msgs, true);
> +	dev_dbg(&i2c_imx->adapter.dev, "<%s> write slave address: addr=0x%x\n",
> +		__func__, i2c_8bit_addr_from_msg(msgs));
> +
> +	i2c_imx->state = IMX_I2C_STATE_WRITE;
> +	i2c_imx->msg = msgs;
> +	i2c_imx->msg_buf_idx = 0;
> +	/* write slave address and start transmission */
> +	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
> +	wait_event_timeout(i2c_imx->queue,
> +			   i2c_imx->state == IMX_I2C_STATE_DONE ||
> +			   i2c_imx->state == IMX_I2C_STATE_FAILED,
> +			   (msgs->len + 1)*HZ / 10);
> +	if (i2c_imx->state == IMX_I2C_STATE_FAILED) {
> +		dev_err(&i2c_imx->adapter.dev, "<%s> write failed with %d\n",
> +			__func__, i2c_imx->isr_result);
> +		return i2c_imx->isr_result;
> +	}
> +	if (i2c_imx->state != IMX_I2C_STATE_DONE) {
> +		dev_err(&i2c_imx->adapter.dev, "<%s> write timedout\n", __func__);
> +		return -ETIMEDOUT;
> +	}
> +	return 0;
>  }
>  
> -static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
> -			bool is_lastmsg, bool atomic)
> +static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx,
> +			       struct i2c_msg *msgs, bool is_lastmsg)
>  {
>  	int i, result;
>  	unsigned int temp;
>  	int block_data = msgs->flags & I2C_M_RECV_LEN;
>  
> -	result = i2c_imx_start_read(i2c_imx, msgs, atomic, false);
> +	result = i2c_imx_start_read(i2c_imx, msgs, false);
>  	if (result)
>  		return result;
>  
> @@ -1195,7 +1375,7 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
>  	for (i = 0; i < msgs->len; i++) {
>  		u8 len = 0;
>  
> -		result = i2c_imx_trx_complete(i2c_imx, atomic);
> +		result = i2c_imx_trx_complete(i2c_imx, true);
>  		if (result)
>  			return result;
>  		/*
> @@ -1226,7 +1406,7 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
>  				temp &= ~(I2CR_MSTA | I2CR_MTX);
>  				imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
>  				if (!i2c_imx->stopped)
> -					i2c_imx_bus_busy(i2c_imx, 0, atomic);
> +					i2c_imx_bus_busy(i2c_imx, 0, true);
>  			} else {
>  				/*
>  				 * For i2c master receiver repeat restart operation like:
> @@ -1257,10 +1437,43 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
>  	return 0;
>  }
>  
> -static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
> +static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
>  			bool is_lastmsg)
>  {
> -	return i2c_imx_read(i2c_imx, msgs, is_lastmsg, true);
> +	int block_data = msgs->flags & I2C_M_RECV_LEN;
> +
> +	dev_dbg(&i2c_imx->adapter.dev,
> +		"<%s> write slave address: addr=0x%x\n",
> +		__func__, i2c_8bit_addr_from_msg(msgs));
> +
> +	i2c_imx->is_lastmsg = is_lastmsg;
> +
> +	if (block_data)
> +		i2c_imx->state = IMX_I2C_STATE_READ_BLOCK_DATA;
> +	else
> +		i2c_imx->state = IMX_I2C_STATE_READ;
> +	i2c_imx->msg = msgs;
> +	i2c_imx->msg_buf_idx = 0;
> +
> +	/* write slave address */
> +	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
> +	wait_event_timeout(i2c_imx->queue,
> +			   i2c_imx->state == IMX_I2C_STATE_DONE ||
> +			   i2c_imx->state == IMX_I2C_STATE_FAILED,
> +			   (msgs->len + 1)*HZ / 10);
> +	if (i2c_imx->state == IMX_I2C_STATE_FAILED) {
> +		dev_err(&i2c_imx->adapter.dev, "<%s> write failed with %d\n",
> +			__func__, i2c_imx->isr_result);
> +		return i2c_imx->isr_result;
> +	}
> +	if (i2c_imx->state != IMX_I2C_STATE_DONE) {
> +		dev_err(&i2c_imx->adapter.dev, "<%s> write timedout\n", __func__);
> +		return -ETIMEDOUT;
> +	}
> +	if (!i2c_imx->stopped)
> +		return i2c_imx_bus_busy(i2c_imx, 0, false);
> +
> +	return 0;
>  }
>  
>  static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
> @@ -1334,14 +1547,14 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
>  			else if (use_dma && !block_data)
>  				result = i2c_imx_dma_read(i2c_imx, &msgs[i], is_lastmsg);
>  			else
> -				result = i2c_imx_read(i2c_imx, &msgs[i], is_lastmsg, false);
> +				result = i2c_imx_read(i2c_imx, &msgs[i], is_lastmsg);
>  		} else {
>  			if (atomic)
>  				result = i2c_imx_atomic_write(i2c_imx, &msgs[i]);
>  			else if (use_dma)
>  				result = i2c_imx_dma_write(i2c_imx, &msgs[i]);
>  			else
> -				result = i2c_imx_write(i2c_imx, &msgs[i], false);
> +				result = i2c_imx_write(i2c_imx, &msgs[i]);
>  		}
>  		if (result)
>  			goto fail0;
> -- 
> 2.43.0
> 

