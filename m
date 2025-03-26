Return-Path: <linux-i2c+bounces-10033-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54467A71863
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 15:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F325C168EDC
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 14:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D421F0E5C;
	Wed, 26 Mar 2025 14:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mR1KRFPA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012035.outbound.protection.outlook.com [52.101.71.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5411F1EE01B;
	Wed, 26 Mar 2025 14:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742999030; cv=fail; b=ud9Qx3Ary0ZJCGQF9JvJlIaXRJXJ3HYSNyd2idMHFNU2easuhEeQ8QWwwfsdNELcoxywDICQRNtxWEMcCwWAUYHfY9pOz8+WPdx1oOgpT4zfmI2oWi57+SCJyUYiPZlq75PyyV6FvafxW1fZbkxgpe366w2RI9QUokn1Diwaif0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742999030; c=relaxed/simple;
	bh=ZCNVIFygQ0OOFUNNrQXs22j3J1L0U/rSGwf8T3QE30c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KDydIwhFbPK9nY8ITgerm2UVRvlI/bfC/1imIMuhn/SBXMUvkL8uSO9tpvaQbt3sDV8SaYswa+PVyGMU0lv9DcXOM45fBu9vKvwNSZAwmjcKG1GP1805yvRzvN9N9Yrlu2iEx58GoBFg7aVVUS11nJFkvB33HtnG2ds0YZsAPRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mR1KRFPA; arc=fail smtp.client-ip=52.101.71.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=afmy+QFc+E3PNKU7t4NGHxGYR0Smtc9jB2dUxPROK1D9fzc89ZjHyo9kS3OsOyCaDj5GrwB03+CYOwXaPWVS+MJISOLdrBJW11xqUe6I6i355aI9EYzgEcShjDGr8Uq4RnTfmH1BmDGUiaJ3UpslGbWaNWflBhxkQyzRxC+ERCuAx3YqH4zNoMr+YFscDms3PiSBmmbHMyS4s4mmIfv0+AhjVTq/L8P9Lcwuzp5epiuxLNgx2Y+yzhAr6PovlixP7gfJBHrFJZlGTiRiJ//sKwTqa8M+KcX3DfD8qUSfF84T/aM9Ssh+ZITN8d785aL7jMO0fThZvhcWmz9e4L4p3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FqJ+fIHiLVjr8fHCxyQJCr7aifY6rFAu8wqhuNdey4=;
 b=XSgbe68ntS0lW2b1VXRJShTsrMWy5Ucyo/H85b9+WbiQaLjOt/JNCKKf/GYb0M/TsylOUFY5Z2PDn855zMvZyzAoH9I+EmB9l0v89oj8WceuBvlU95VLnhqVjYhUhMeSmy7hbUEUVRzXIAguBCPwC8G5cM9Ngd/W+4WfpjYPrmrJ1LIepV4syi/7adtRqnmRfxI+4vhwpJPOyqqSO9c9l5QZYxku2xWIjZKm/sy0d6v4st31e+E3EDagUvU4ykttVk+x41olB/26nN5xFxg2XQdhwgf4sNvXI68GQxS/usE6ryCfKo3BFwN+Xw7q2/giSEjcepg1A+ms7OkUxUnRog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FqJ+fIHiLVjr8fHCxyQJCr7aifY6rFAu8wqhuNdey4=;
 b=mR1KRFPAXkFz0fLD9SqH8LOL50TZGGubYozYiag+mHLIUC7MV6cHEAfkKXtyeBV2INmHJu/ekO5UjoQZvRzeFHLF1y4zTE4hjxGRtQo6nXIoWcpwjvd8ar4kr/sCWaEkWZ1Y0zQe6E8EZ5eBWYC3i5UBXMpj0G0xO+QMdmUHNpmsKaESwoLy0xzY7fSce9lyL+H+0VrZ0Cfpm4HnOG6HSuMQG2T7HrJPRCOdLhWlNcuv6t7mEHbHXnBuuXVTnsNMlb2ojUvvTPkXlMcg2QoHHaU98CmY0YoZFLGsJbgm3wByV8urKobKleFL4x5UWYBzwQy+QSv873EBl+flvoDoCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAWPR04MB9807.eurprd04.prod.outlook.com (2603:10a6:102:384::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 14:23:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 14:23:44 +0000
Date: Wed, 26 Mar 2025 10:23:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: imx: add some dev_err_probe calls
Message-ID: <Z+QN5jMuwj7S2L7J@lizhi-Precision-Tower-5810>
References: <20250326084937.3932383-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326084937.3932383-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: PH0P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAWPR04MB9807:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d581b9-6672-441e-c155-08dd6c71d004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sUsArEiMZCxzgNKOk4ULbZFUoYgquGeUPkT/8i7hUJRydd/OU+gkJ7vTIRvH?=
 =?us-ascii?Q?Eg0pI1+Z+EanqchQDT6rZwQXUjNW3uF//Vma+s32zBe4U9Y1Nn60SlhTn1KS?=
 =?us-ascii?Q?lkrcW+rZxa51FSWBY6wNVJs/ZQhzHYt8AE8IcruuvH6FlAdn5Ytw5SgMBwdM?=
 =?us-ascii?Q?Uw2ZZ2hIsrT7rMtuym9m8o0qAHHtfo8Vslo3lW51Yr/g1xw6NkzpLsn7wA8m?=
 =?us-ascii?Q?+XF5KoqmT5OjOvcLixQz0FcolYAdSIAldiYFkdlPLHpQDORtX0kOwL8IOmYw?=
 =?us-ascii?Q?lYHpSnE8uz9VKZn7xfWei+C/L1oCmdUREW5RUhhMUlcilpSN459FNjiZvDX8?=
 =?us-ascii?Q?iWVP4gWs6U+vZ0DqFPgf/2FzKOTPE9XOKoZAiUtG6PapG56FzPlnwBWaAUdv?=
 =?us-ascii?Q?jKdy+1dkt0FzaLEsM/wfp4EP9v3dT4q1DxdvYLUl8ByvAbPM3PcOu6lXQcpw?=
 =?us-ascii?Q?JRayxSQLu1PfwCWEGSrszunCi4g2GJ5FLAdbI9M96BsycFzpYQCIIgiPeQfe?=
 =?us-ascii?Q?9LQG1k2IUK5jW/TJCYPOv7jiSanr9yXbwkioOVcJJCJBg+qbMhC+L92M5Syt?=
 =?us-ascii?Q?m+cEWDz+SIE2qYhbxmXwWnOvpSAv34+yuHiPGNI4+dytEncJQrU4G4DbZg+M?=
 =?us-ascii?Q?PsLb8ASMqSmLJ0DZhrZEQeKrAS8gHAvZQlhCg8kN4vG/Ao8ScjvoFfS/gc8E?=
 =?us-ascii?Q?z1tKNM0BMVl3eqRpFvK0W6eiz0YE5bgdNl3nFmBKaHPhWdJ+olqU3UGoGfA7?=
 =?us-ascii?Q?+f/qPyTkVcqDeK6w7Cg0Tc16fXMJl6JxJRfkhL3Jsui80VgbeughgNbvCicj?=
 =?us-ascii?Q?P9gx8QCjlbfxWxx9+UkOZCG+0kBdRkYuZbI2NaYbVThk0CTHJMHFBKDKwKDn?=
 =?us-ascii?Q?FeDwpGCwd32LZFfb2vMEsk9MD9P+zba0v/RJDvv/5OFMSUzHKmGIz96VIb4B?=
 =?us-ascii?Q?H3WSP5vSPDYuit5vqlQs2XGpBJ7lWXvHz+vahSTBhZvkrJmkJ6SU3fo1WXzG?=
 =?us-ascii?Q?BDkjOX3O0ssRDpYeNzEg0OfAy45Wz8QR4R0b3fSFHBDLa+rGAwQrPd18Sx6H?=
 =?us-ascii?Q?VEhrNP0AXNy7u14MO4aYL1LeNfreOOo3qpKGDkrz3z0W0i3yTrg31kQam2ek?=
 =?us-ascii?Q?oOkRNv0FCMVo3QBEjo2SnsxMkHIM3oNmYZGbsFSV4xyoBACXpEx4VENiwx0G?=
 =?us-ascii?Q?fUx12vUBIwEYgpPsDZ2FoGHaUIaSr1N3LTN9umcMQhpFpb20aUKRixfclcN1?=
 =?us-ascii?Q?NkNVxAs7ldYGjXxNgv8cpKu9YeELH6Ul+w5u2TiPg6wnMJocWlYP16nQf/Lm?=
 =?us-ascii?Q?tL1YDlfnLeq3hBc9zlAB3EtmzMfJBlt1vga7+KP9QRaDiUV4AS+7vxAF8zVE?=
 =?us-ascii?Q?dCG0NYRhm+Wt3AXHkzApCHPSq1vAfqqPSYWxARGSNLli4mPyi6d9tRk/Kvd7?=
 =?us-ascii?Q?+7AgK7PhYtNJ8PZz96okW+W1FJ490Rjq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/eIxhAHEYuWUx7IZ11RsDluQghYihagvsvI3gaY1kgC/h+EPx5PEj7/IRscv?=
 =?us-ascii?Q?AmtEGqGOaMRi7HMcDpr6Gu31ZiWe/q0qKbiBuxCk+0f7wU7Z00nCzLywWm/G?=
 =?us-ascii?Q?W0q+2URNFuWg2XUy05fp98P7rKo0/Rp1yTpQVnDAo6CwrTJ+yWEDRw3VUI3S?=
 =?us-ascii?Q?dpQsC3c9zVkFXiuEeapKIkAYQ72IDJGiQnElESCrygaz9OuwV1jXl0EBeRzQ?=
 =?us-ascii?Q?O4xiiaEDwIAt/HgTh1b0hgq3lF5Av9Uz2QXGc8R0uYXJuQtcKPEcZFlLLp7u?=
 =?us-ascii?Q?d8jrxLMrg0cSvrP75zUR95LThvAJK0oxs0Tp2+00HXpfWS6l+kHnBniRCR5t?=
 =?us-ascii?Q?vj/VhLNe6cWk7Glt1hBNez0wMSHt1EmzO/AsoiiAFrMruFxyNpFZGpdW52AN?=
 =?us-ascii?Q?zEyYMqHgpiJeoAV1+l5wZduYuBa/W5LjFr9q43S8vAE8Yqfq1Je7Q35w8Zuu?=
 =?us-ascii?Q?FwcpPzatqeoQFudhFP0xyD7OzNKrrWnRmS8g0j/i0NtihZm4JncaS77Lba3z?=
 =?us-ascii?Q?/qA2TVeQbQp63iSWrPZzQr98/T0loOArZmgw1bn25rDLA3Usadpl2s2/8wdo?=
 =?us-ascii?Q?5grTvQyd2haCkfk+RYbe0E8AfesKlHpiqxuikh7t5X0/s0nMl3xkKu82qZAY?=
 =?us-ascii?Q?IRW/9Yv+RscqFGR/2JyD3UhYB1s6z94t5cEzrd3rzXuqzz1Ml/t7unOVwTT1?=
 =?us-ascii?Q?UH1bxzRJ5NaDh0YlyR6psCCXOShvXcyGJ5vI5oAzUI5Tvj9gVsKfos8JIJhs?=
 =?us-ascii?Q?1uACsWy+GAkZCo2Js16qmi7J561beLedVVASuxCuX5HIrXMU7qltNWC8hZhC?=
 =?us-ascii?Q?NrlW7xh5/dtrZoHCVxL5kHXrqPip3T6SjZ4pfr++I657Vq/PjLVHjYdbGa40?=
 =?us-ascii?Q?nbhYSmDmoEABNOd8PvJT1acWgANVtolqpJ3OXUsZoaUKFC9ouvFbrCq3WI1L?=
 =?us-ascii?Q?PkOzz+6Xm/kX0TJg40RA8bSZbeCnqCa2iYM5E7F+geEvzLK/QNS1opRNkZxm?=
 =?us-ascii?Q?ZsxVS3TzZbu0W4YTynscgnBJ23G2Rk+J78BcA+r06bkhg59TN2UMEsiFakCq?=
 =?us-ascii?Q?NjuDD9ev73XlNgUeveoIk4DGW/jAQlGxoV/zZytULrYOWIylHd1jOGmVJHTt?=
 =?us-ascii?Q?nZ+tCmw/BH6YvoyZHeE8bazfYL6qE8Yb5g+gBywAm+oIx+KkHw02ezISydHy?=
 =?us-ascii?Q?nfv+DnglTLoYFeHjWkyb+GjlhHig0DhTPtxYk5/cearxsgOnJFCc6df6lyHT?=
 =?us-ascii?Q?Ze2AggtMIkdn4WE1cxJlvL7peCOCmrsqf2FhdjqC+ULnU2546bo8m8TetBIz?=
 =?us-ascii?Q?EF8x4HSocuc4GT5JlY+HthF2sFhGT2I8AVVpSmnefOiBM0L4wEmR8ixbeZq3?=
 =?us-ascii?Q?ImvCG6CIbgGAksF1cRQyFlnoQIlHe6gWG3vHBzeiYWnONncTqOA5U9XXpnbo?=
 =?us-ascii?Q?S3EfBc31FzpXTUFjUa2z3lopu50UHi/Bp1++fuBC9tk+nE8ELNVJfsfhgIZH?=
 =?us-ascii?Q?fD8YCq4jA2PG56H3279O2aP+3niYJunQi2g/pT3+BmCTr7ks/mKYaNiLgUco?=
 =?us-ascii?Q?mV4BbEsEvp7OwVTIIudFcWiD+vWiniR9Bc68Tc8K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d581b9-6672-441e-c155-08dd6c71d004
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 14:23:43.9129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVts7EO0FcPZ2KgpTGayQ7gngEBLnlarBKxh3K1CSK3t/EGXUUy2NjpgIY2ZjwC8uzNJkKlG/fDdFo5o3/BBOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9807

On Wed, Mar 26, 2025 at 09:49:36AM +0100, Alexander Stein wrote:
> Especially DMA channels might not be available. Add some deferred probe
> messages accordingly.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i2c/busses/i2c-imx.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 9e5d454d8318e..e6e09d5a2bbd4 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1711,11 +1711,13 @@ static int i2c_imx_probe(struct platform_device *pdev)
>
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
> -		return irq;
> +		return dev_err_probe(&pdev->dev, irq,
> +				     "can't get IRQ\n");
>
>  	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(base))
> -		return PTR_ERR(base);
> +		return dev_err_probe(&pdev->dev, PTR_ERR(base),
> +				     "can't get IO memory\n");
>
>  	phy_addr = (dma_addr_t)res->start;
>  	i2c_imx = devm_kzalloc(&pdev->dev, sizeof(*i2c_imx), GFP_KERNEL);
> @@ -1810,13 +1812,15 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	 */
>  	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
>  	if (ret) {
> -		if (ret == -EPROBE_DEFER)
> +		if (ret == -EPROBE_DEFER) {
> +			dev_err_probe(&pdev->dev, ret, "can't get DMA channels\n");
>  			goto clk_notifier_unregister;
> -		else if (ret == -ENODEV)
> +		} else if (ret == -ENODEV) {
>  			dev_dbg(&pdev->dev, "Only use PIO mode\n");
> -		else
> +		} else {
>  			dev_warn(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n",
>  				 ERR_PTR(ret));
> +		}
>  	}
>
>  	/* Add I2C adapter */
> --
> 2.43.0
>

