Return-Path: <linux-i2c+bounces-14215-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 597EDC7AB22
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Nov 2025 16:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 11DC33445F8
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Nov 2025 15:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF2021771C;
	Fri, 21 Nov 2025 15:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SAWtz44+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011032.outbound.protection.outlook.com [40.107.130.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC392C08C4;
	Fri, 21 Nov 2025 15:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763740757; cv=fail; b=KH+3YOqZdQkvEulxtFmjxGi4OLkN2wf5idsS8XhyWtJBfJx6YaQFTfcZ3EDPofF9vQ7+sf8z/lhajgLiCERl7ZrIF1duioZKBHzJNvFeCMBHBAUvO9Eb3bH4kO0Kq0rbD+eUphY5+zfMLup7cHemHbIqwkGWSTjsz5GlKr8zZwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763740757; c=relaxed/simple;
	bh=iH4ly9eDCz1zvSz3jfImqX7Ai88IN+RGvZD6FPgtSQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J7z7fsd4YXTikjNP3Isy5msYF1v+Saql76JDpyoCpWC2dcCSuvgXhlyBPAv/zwn97RLRGmsxy+kHHKyjY6S9m6xWSghdXOjA9msukLvW7SW9jGefErGdbd4oOloY5wzgwViw2IKvR+pP2gSfVIeOTsbeLUr3S23441Ty41LIPd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SAWtz44+; arc=fail smtp.client-ip=40.107.130.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mb5o6uTGxcFHo4n2kn8uKCxy2yJyOX8hHy9DVDxjxdP+odyMU/v/B6CSE6C1X4oQ/W5ZZgmVQrFcrLdzLwuGDC6cMnDdN0hTgjGvYVvUgaVPxiFNIBtqy/FVTmzH7XAVVsAHJiVHjGW8V7KZlt83opPknJshAOWC/rKuffqBTpDw+FRaUYFfpgfWUnpX2r1/dU1oIScHQkrvK6dDksR8E3KLJtEKNtXrLBFwbJl5k/SofDp3SwMi19aimE6Plt3TeV0GJ/6ftu4iPXnYTLoN6Y1RkDaW3ExWCerByNIgwtNZ6E25rVMu+zrvoBiOEPb+u2D2iZ9MmkL+qyTEE7c7Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dv9JQgYryb07Ad4xUuM13zVMGd2RgB1lKWwID5CBEc=;
 b=DxqLgpJC400/Rjg/hwXMKP1kZvxxjspWeOLA7NZx/YGDzW5ASHMm0xYBdZLq9UMfuSsP27SXb2oj1jL9nAoKGFy2SvNDPxCRE6+3Uuk6B8QVDEvuyX6Twqx1gRGH3rpbUmnOVmTcxRn+vg5XJ5rjS9JBjdZLXm6rpMZqJktGOVGPIa/ZGFHn4sXcqNPbh/Uapn0Se5ieiUiRUyrwdHbV3rPokK2cu5X4LdyJOFKSbgyJUkJ+q4PiM8uN9/0yLmGUhNT21GzVPRLVoE8vFo4dTKDKA7NA2juB+ZNSUVaCCx9Dvt8pv8609ibFpzYrpCO2BxMdw+CuwxgBgv8efuYmbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dv9JQgYryb07Ad4xUuM13zVMGd2RgB1lKWwID5CBEc=;
 b=SAWtz44+w8JpZVHVO139C73c4yjHpTNGcGJkH4RbfKPxNb85gaZpoDupobI1WHujfqQQaLAElnhdSqPvcnjyDylExhrq/cKVXTyH2AmT7xkgJhwlmJBk2P17lgdQppOJV/+REW8C5vpr3A3a+Y37fmJlfBIUnM+4I+1eVd2BlvWMCAjxWXhKXNvEpjX4GnCBjMfBldevqOD7BYFBBKw5JBuEqfRpc0VLh2sudM5UG0hUDIBMbu3v9D36cAqphtL3T4ueRXCbV/x0EGHFd7N/yOVlsCupOoVZv3Gjm7/l3KljiytMapnHzofpkUpK76uYBbcMS2DlJG3Ybuy4bpBRTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU2PR04MB8920.eurprd04.prod.outlook.com (2603:10a6:10:2e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 15:59:12 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:59:12 +0000
Date: Fri, 21 Nov 2025 10:59:05 -0500
From: Frank Li <Frank.li@nxp.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: aisheng.dong@nxp.com, andi.shyti@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	vz@mleia.com, wsa@kernel.org, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: imx-lpi2c: support smbus block read feature
Message-ID: <aSCMSRdQjUJpr5gz@lizhi-Precision-Tower-5810>
References: <20251121110100.1909603-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121110100.1909603-1-carlos.song@nxp.com>
X-ClientProxiedBy: PH0P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::13) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU2PR04MB8920:EE_
X-MS-Office365-Filtering-Correlation-Id: 11538e4f-43d4-44d0-1152-08de2916e9dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4sSun2YkL4W5SfMy5+0O8wUU8pbgM9KpOsUp5VooMjb1GbK808t59qEjHQMl?=
 =?us-ascii?Q?JMOP1T+4hzbol9kbpJx6CFqy/WwZg8O+ry8mFYBx9L7mlU7u7MJNcvLFmitu?=
 =?us-ascii?Q?EiSa8MJiLqA1BZ0p6UXGjobb2i5H7OwtKWM3hA3Pi/X58qkZCtsKig9Vo96x?=
 =?us-ascii?Q?tPgy6dcLpBT2n2hQ1Qo1O6skajRSEg5GD7H3Ym1LJpaqUCMNhrHJxk3BtXHk?=
 =?us-ascii?Q?sIPWP+WUDWc9tCUa5o27cmNNnaVRT0qx2Gut97cnOmPikEPYFp6oYd/5/etw?=
 =?us-ascii?Q?B2ghPg0zbRseWHbfGvrbUJv8rUUjzVFfCcQ4ee8fvoPwtL8fUBvvsMhu753t?=
 =?us-ascii?Q?6TtVlAAaWBSUfK6WVaBMY/lSmRGD8JKvpbHNThgqPVsR4GFQbTR4UdSfm8E6?=
 =?us-ascii?Q?nZq7UBF24TasqW025mrvaZuvgJWC3CTHVgqeg2yoSvegjENiw3KmOjzUiONj?=
 =?us-ascii?Q?Y8k5o4DMjWCl0hcOAhmyqZNT/KYzpLFBBQBlf4jaf1p95ViOhYWltGinvdzG?=
 =?us-ascii?Q?Bnr2yrJm3TTtQJXuRus4ldM8wNPifennaZo97pA6EcRGdy6vYzparzKxOKTI?=
 =?us-ascii?Q?h4/594z4gOgzVCFdbFSj6FwLfgWdSIdx7uw8dJvcwMd9IS4nKVCuuFvU66A0?=
 =?us-ascii?Q?HePDDvObsHXD4Y3zHgMlNGnvrtXv0WVuqggZbxT9Cm+jgsRoiV0owMxMitIQ?=
 =?us-ascii?Q?i1ap2NccmgB5sVudid170uAsEw0AsTYh74vc+Dq0BZL2A/BNNLRRKuLQDz39?=
 =?us-ascii?Q?SxDke5nfOUveUPnuCxi81jTzG7m/jHZi6p8mw8IwNQnK8V4HQVqN4WVUuyDv?=
 =?us-ascii?Q?GxBgCDCIehpcx4jD3+l6fHYj/lhfykwH+5pw+CJB1exDLeRkaRzgGdIDhfOp?=
 =?us-ascii?Q?6oaRacymiPqefcyOe4p9MzlrB5qnC1pPaokrfKZg3rGdfv56yUazWgkKSJ7N?=
 =?us-ascii?Q?pVSLQOcEZnd8e9vJWiStvIslfqrEjp54Rwb9yU2ODGB2D9/o6brJcz10jLRY?=
 =?us-ascii?Q?DUIri8ntn+9IzFt1gaZwfuK2ZN7xn7F1JLovmkYR6w1+18fGm7lsyyo5HcRX?=
 =?us-ascii?Q?6FoOZtRUeubeCc5rEuGtB3ZCb0xlB+EsuzUSXsapDQTID1DniBPnE6Ei06fP?=
 =?us-ascii?Q?bLrdwabwOBz5i2lcDiU6HBmtNVpArXdPzyu3cWfpOKONK41DDyPur6Gaadjv?=
 =?us-ascii?Q?pRjRpuB8hkCIbKbfXpit5I+Op8TdIaIsKDjQ9xcW5+rtA5SG6VqmIxLRHqBM?=
 =?us-ascii?Q?ZrUkOFeBlCJnWJPX9GlEBCb0bO6Ola2OBYQbcBY15sxmoS869S81FrMHATae?=
 =?us-ascii?Q?qyt/ePwoCpCqArUmaqZsiV25K+tqgt4uUPUQnryt5Hpoll45O4N0lMYP+fYa?=
 =?us-ascii?Q?hQJkrZ3nAi+N1rtrRZSjxvX39/NTnqzFNdTwzzOyYQdbaDyvC+vQmpnkBalY?=
 =?us-ascii?Q?EcitfpWtVtYi6PPvHJYe/ebzYoo8iJOwb52qtRnaTOaZ+y6PA93H0u/+mKvS?=
 =?us-ascii?Q?fP2xEZ3booKXjny6dwacFxlNGKV0UMmknWm7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IyQzHLO6zvBc34SEDZlk2qU3HcsGrArPUlngopi567vIiglIKyzr87edgTht?=
 =?us-ascii?Q?at/F/tVhORwSCYqwTb9PPR5n5J9QmqocA+uGyjtO0s1FBJu2rKMYqaoPRU06?=
 =?us-ascii?Q?xtX0iSQ5eDaLVgBw2rWpvbFhUq0itbG/RI1hgxd+LjA9ydSaBM9yNVeMoH3A?=
 =?us-ascii?Q?Zlvscfi79UXJRqPdCteLk7aivBI0RWnNlDQ7ipEYc9FkheWUSqmb0Udf0diO?=
 =?us-ascii?Q?/jloIRS3aBDKlve45NKQyrRhpQyprUi36w83veOXphN8iuXMc6LUrFEv7Vnl?=
 =?us-ascii?Q?to7ICxSSWJzipEO5wj3eBdJTSN4FYNRG54J7X6z8p1I1oCQAf3YSoavQtLpt?=
 =?us-ascii?Q?yJDHeoNFVdN8UN/zKjTJPx5H8N0WaaKGfS5G0WKFv8IHucQ/gPhN9oiKegXz?=
 =?us-ascii?Q?kZU2sevrl89y2CP9+fAx3kLAJtjRdZxWMCC6XxLEU4fmdvLEZE0KKXBkI6+T?=
 =?us-ascii?Q?JxNj/rzXrp7v0M/ZWGUm0NAoKkqNZHv+3Xd30BqlcuLdcxm8omNfYnvFAffI?=
 =?us-ascii?Q?yjZ7H/8TMzHaGQaTpMXfp1M//6o3a6tv3a+CfY+zVuix/EVeI5/Lw07paHgP?=
 =?us-ascii?Q?3+WfD4Dc79OXf5IyMqwxM6CfZr8PN/JuUZLLU2CsKmclPUOR88K5LQcGD8Hd?=
 =?us-ascii?Q?IRJYl97fNZe8hOy1p7ztZXnTVRMfT0fewfnhP5eId3s9BSMsUdDwuNt071II?=
 =?us-ascii?Q?ICIjFPqp7eFOGeZVpsxFAs7ajqnnz0gPvVxHGO8mJE8HqiwDrowjS4uWlTKL?=
 =?us-ascii?Q?GBLjPe3pZ7gnDokTknhoaMkdUlOj9J1yFu0a3SMXNjXNQKX663PhtEWVM/48?=
 =?us-ascii?Q?tYzqv1DgK+/CjQKRbz1MWpxrbtCUnC19R8Y2ED1z4VthY+GkvnoZlh0ViIJX?=
 =?us-ascii?Q?LNYIgqRrlI4r1u7BJBpA/T9+TyYF9vBnmBB9Rnp0t06BkagNuO9fkvggM4ju?=
 =?us-ascii?Q?c83CXDe1Vw43N17HyxV+6Aoj2EIbp5K+fepWaHmV+6E7D04M6opCIFolZmP4?=
 =?us-ascii?Q?aF38PBGu0IeEuIQiFcL3+pY08npYZ7Aupv/NELpBs6qz+oN4aYezSfVodPR3?=
 =?us-ascii?Q?dRv/77hMd55VmfcK/D7Ok6mRSD3gX++zVVrLFRebcqJrD+RWk58m7AJAyLXw?=
 =?us-ascii?Q?DsA3Ihxhgg/eaLZuwr1pjqfBNuRkCm9zUDzgrSPcf8FloeNJzHYkP3U0WIOK?=
 =?us-ascii?Q?rIn5txobcj+ZoVGFlyopciy5GcKkhEB7g2H6LS1S/A8ppkBw8WV9hwcWb17P?=
 =?us-ascii?Q?YS0B8N849nOMzfGL8U3wURGO425SWeJzOWs1AT/ZGeGysm4EgOj8zo3rm+j7?=
 =?us-ascii?Q?9WZiovIbydJI3a7oAvQOrVulQ67vZ0ZNBTAsUjI6Q199UI7/0bszNzhlgLke?=
 =?us-ascii?Q?HUc9UhmF5r25/7LyE3Mfrycp6dXY6uHSeHepr2BwrxTvFAFqvxUfuMFP28Yv?=
 =?us-ascii?Q?7wj3MgAhxeE2FZsJwso65Q5jKIZaWI/YhxWSK9ee2ZaZBNedRL1YeNwVIkee?=
 =?us-ascii?Q?ywSfdVfwgwrugmP/yMc/8MVpKwYwtdeNeJ15uj1yxCEnomWoYKAgsGp0MaPf?=
 =?us-ascii?Q?yKceGFLPouph4BivwIbfkoOwGZ8o1f6rDkAWXBpC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11538e4f-43d4-44d0-1152-08de2916e9dd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:59:12.4758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtV8iW8SlBl2bvJfgx+IpeZHySKK/9WEnBGOjoz/xElWEidkGiABd7kY8b80glOM0WeFihjF2vHjBwDOilhyPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8920

On Fri, Nov 21, 2025 at 07:01:00PM +0800, Carlos Song wrote:
> The LPI2C controller automatically sends a NACK after the last byte of a
> receive command unless the next command in MTDR is also a receive command.
> If MTDR is empty when a receive completes, NACK is transmitted by default.
>
> To comply with SMBus block read, start with a 2-byte read:
> - The first byte is the block length. Once received, update MTDR
>   immediately to keep MTDR non-empty.
> - Issue a new receive command for the remaining data before the second
>   byte arrives ensuring continuous ACK instead of NACK.
>
> Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
> Changes since v1:
> * According to discussion with Frank, improve comment and commit log by AI.
>   This comment and commit log looks more clear.

Needn't mention "by AI" every time.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 94 +++++++++++++++++++++++-------
>  1 file changed, 74 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index d882126c1778..dfacb0aec3c0 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -90,6 +90,7 @@
>  #define MRDR_RXEMPTY	BIT(14)
>  #define MDER_TDDE	BIT(0)
>  #define MDER_RDDE	BIT(1)
> +#define MSR_RDF_ASSERT(x) FIELD_GET(MSR_RDF, (x))
>
>  #define SCR_SEN		BIT(0)
>  #define SCR_RST		BIT(1)
> @@ -461,7 +462,7 @@ static bool lpi2c_imx_write_txfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atom
>
>  static bool lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
>  {
> -	unsigned int blocklen, remaining;
> +	unsigned int remaining;
>  	unsigned int temp, data;
>
>  	do {
> @@ -472,15 +473,6 @@ static bool lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomi
>  		lpi2c_imx->rx_buf[lpi2c_imx->delivered++] = data & 0xff;
>  	} while (1);
>
> -	/*
> -	 * First byte is the length of remaining packet in the SMBus block
> -	 * data read. Add it to msgs->len.
> -	 */
> -	if (lpi2c_imx->block_data) {
> -		blocklen = lpi2c_imx->rx_buf[0];
> -		lpi2c_imx->msglen += blocklen;
> -	}
> -
>  	remaining = lpi2c_imx->msglen - lpi2c_imx->delivered;
>
>  	if (!remaining) {
> @@ -493,12 +485,7 @@ static bool lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomi
>  	lpi2c_imx_set_rx_watermark(lpi2c_imx);
>
>  	/* multiple receive commands */
> -	if (lpi2c_imx->block_data) {
> -		lpi2c_imx->block_data = 0;
> -		temp = remaining;
> -		temp |= (RECV_DATA << 8);
> -		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
> -	} else if (!(lpi2c_imx->delivered & 0xff)) {
> +	if (!(lpi2c_imx->delivered & 0xff)) {
>  		temp = (remaining > CHUNK_DATA ? CHUNK_DATA : remaining) - 1;
>  		temp |= (RECV_DATA << 8);
>  		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
> @@ -536,18 +523,81 @@ static int lpi2c_imx_write_atomic(struct lpi2c_imx_struct *lpi2c_imx,
>  	return err;
>  }
>
> +static unsigned int lpi2c_SMBus_block_read_single_byte(struct lpi2c_imx_struct *lpi2c_imx)
> +{
> +	unsigned int val, data;
> +	int ret;
> +
> +	ret = readl_poll_timeout(lpi2c_imx->base + LPI2C_MSR, val,
> +				 MSR_RDF_ASSERT(val), 1, 1000);
> +	if (ret) {
> +		dev_err(&lpi2c_imx->adapter.dev, "SMBus read count timeout %d\n", ret);
> +		return ret;
> +	}
> +
> +	data = readl(lpi2c_imx->base + LPI2C_MRDR);
> +	lpi2c_imx->rx_buf[lpi2c_imx->delivered++] = data & 0xff;
> +
> +	return data;
> +}
> +
>  static void lpi2c_imx_read_init(struct lpi2c_imx_struct *lpi2c_imx,
>  				struct i2c_msg *msgs)
>  {
> -	unsigned int temp;
> +	unsigned int temp, ret, block_len;
>
>  	lpi2c_imx->rx_buf = msgs->buf;
>  	lpi2c_imx->block_data = msgs->flags & I2C_M_RECV_LEN;
>
>  	lpi2c_imx_set_rx_watermark(lpi2c_imx);
> -	temp = msgs->len > CHUNK_DATA ? CHUNK_DATA - 1 : msgs->len - 1;
> -	temp |= (RECV_DATA << 8);
> -	writel(temp, lpi2c_imx->base + LPI2C_MTDR);
> +
> +	if (!lpi2c_imx->block_data) {
> +		temp = msgs->len > CHUNK_DATA ? CHUNK_DATA - 1 : msgs->len - 1;
> +		temp |= (RECV_DATA << 8);
> +		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
> +	} else {
> +		/*
> +		 * The LPI2C controller automatically sends a NACK after the last byte of a
> +		 * receive command, unless the next command in MTDR is also a receive command.
> +		 * If MTDR is empty when a receive completes, a NACK is sent by default.
> +		 *
> +		 * To comply with the SMBus block read spec, we start with a 2-byte read:
> +		 * The first byte in RXFIFO is the block length. Once this byte arrives, the
> +		 * controller immediately updates MTDR with the next read command, ensuring
> +		 * continuous ACK instead of NACK.
> +		 *
> +		 * The second byte is the first block data byte. Therefore, the subsequent
> +		 * read command should request (block_len - 1) bytes, since one data byte
> +		 * has already been read.
> +		 */
> +
> +		writel((RECV_DATA << 8) | 0x01, lpi2c_imx->base + LPI2C_MTDR);
> +
> +		/* Read the first byte as block len */
> +		block_len = lpi2c_SMBus_block_read_single_byte(lpi2c_imx);
> +		if (block_len < 0) {
> +			dev_err(&lpi2c_imx->adapter.dev, "SMBus read data length timeout\n");
> +			return;
> +		}
> +
> +		/* Confirm SMBus transfer meets protocol */
> +		if (block_len == 0 || block_len > I2C_SMBUS_BLOCK_MAX) {
> +			dev_err(&lpi2c_imx->adapter.dev, "Invalid SMBus block read length\n");
> +			return;
> +		}
> +
> +		/* If just read 1 byte then read out from fifo. No need new command update */
> +		if (block_len == 1) {
> +			ret = lpi2c_SMBus_block_read_single_byte(lpi2c_imx);
> +			if (ret < 0)
> +				dev_err(&lpi2c_imx->adapter.dev, "SMBus read data timeout\n");
> +			return;
> +		}
> +
> +		/* Block read other length data need to update command again*/
> +		writel((RECV_DATA << 8) | (block_len - 2), lpi2c_imx->base + LPI2C_MTDR);
> +		lpi2c_imx->msglen += block_len;
> +	}
>  }
>
>  static bool lpi2c_imx_read_chunk_atomic(struct lpi2c_imx_struct *lpi2c_imx)
> @@ -599,6 +649,10 @@ static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
>  	if (pm_suspend_in_progress())
>  		return false;
>
> +	/* DMA is not suitable for SMBus block read */
> +	if (msg->flags & I2C_M_RECV_LEN)
> +		return false;
> +
>  	/*
>  	 * When the length of data is less than I2C_DMA_THRESHOLD,
>  	 * cpu mode is used directly to avoid low performance.
> --
> 2.34.1
>

