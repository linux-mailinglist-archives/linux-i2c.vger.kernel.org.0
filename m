Return-Path: <linux-i2c+bounces-4986-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D11229318B0
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jul 2024 18:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BEB11F22901
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jul 2024 16:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BA61CAAF;
	Mon, 15 Jul 2024 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="cQSRT3ce"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19982482FF;
	Mon, 15 Jul 2024 16:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721061877; cv=fail; b=pAFARvNfnLGrq7jfNm4RTAx2YCOajq9vRhcdGMgmHgmycuSFUm1wpmbQx7Cc7DRrtTU5osoiZJ74JpTjPGDzliawS64upSnJvBsK5tpMhFLQwxOALdkIIlkJSdCUgvWCYNtgbYD2OwAxGYh+F9pCn6JtVdwuoCIrgb+27QSlFsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721061877; c=relaxed/simple;
	bh=Q1sBsH7h1590fk142ivE5qsCozYsOhSkUVVTNq8qNCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WjfDmkmMShhO1zl8mzfdp9xt7//N4xxWdO/kk+ft0pV9LjKszKjfKgIAYNESqO4KYgNykyVfhOZkoZQctZNKqN26nE4W4qwYF3TKD7HtczfEXqkkMEcw27xk471YbwoFizp+2bwTuADv48tYFFsHeqn6lJ5z5NY7KZUhewIyaL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=cQSRT3ce; arc=fail smtp.client-ip=52.101.66.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5GyNY9h4MxAE06RM2Yb3N18DDIBfbvA8hJdizkeqz2fLOXB2YfOEH8SvGd/G2XtUI/BIiFkTQYYeMr/Gyw9y2yZR8397qDcvyJ+lH/C1IW9Unsscp11T6f5KuMltMJUXqFWADPptCzlb9k3xv7iSoW8dGPL8OYXypPsM/9u6jrD9QEsZB3o5DvMaiOZcakZx4IODpA+y6Nu7GUQwhLUAC72iVdvqnonMjK6yYupKHDLM0wAkyAabRYaifdQ7PPpO9KmbemUKnJrcnmUk6L0vTndwdKPKViR3MYHImfst79g0zbWwvj08blZiT1Tz1Yl33SGkkPCWUF5z6lv8riurA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eZUCUjghDcTsUv1WUIuJ9vAHbj48Gz7JZjvLdpeByI=;
 b=TZf3qIDMGxDaPkvXLwiifKWY1ZTZqp8Re8KoP+VQiHRdMG/e4FAzGfabulEcgw256cqM4+b0mVZX1jYc+Ef5r9/DOu/upFWW+Ea8Wiv7fk/GJCxdp8U2xIf+KezQKuaj2EcPgapbr21YgNdRvjp+ekIVxpf8dRtDLOYM++7RZW10p0lSu8mJYvzT3VJX5ATqgOxEUgmoo49jPvFOKF62ctora3RaNX20L8nG+pb6ZoBRkFOyjuQGG9/M+oj+JAG/3EYTMbgmlISiWE+U+I8IjHiajd0xjI7KgmJLlYwbKxkHfJUpxawqutRoC+KtRrzd4eJU8noUsLVNTU60zxmAmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eZUCUjghDcTsUv1WUIuJ9vAHbj48Gz7JZjvLdpeByI=;
 b=cQSRT3ceA+Vm6g5a/jmWuWhbBw5fc8UXn/GSVV/QmL/GwSRc1WMEmpRN/+3JbFGi6wD3dcpXdsLlBTYZkwlyXit9hDmwqgDAMtgcRgqptB4g1B75b8ws5XAlla/7mKEyHPhqsBSZrFPqNpTZ859snqm3gGPS440GaYEGChGh1rg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10198.eurprd04.prod.outlook.com (2603:10a6:150:1a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 16:44:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 16:44:29 +0000
Date: Mon, 15 Jul 2024 12:44:20 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	wsa+renesas@sang-engineering.com, francesco.dolcini@toradex.com,
	joao.goncalves@toradex.com, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 2/3] i2c: imx: separate atomic, dma and non-dma use
 case
Message-ID: <ZpVR5NgrYA5T2WAZ@lizhi-Precision-Tower-5810>
References: <20240715151824.90033-1-eichest@gmail.com>
 <20240715151824.90033-3-eichest@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715151824.90033-3-eichest@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:a03:338::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10198:EE_
X-MS-Office365-Filtering-Correlation-Id: 86fdb638-656a-444a-058f-08dca4ed6583
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?c5BGfyl1qrXt1b05k4MfFfOe7Qo+n9/ey1jxffvM7tKuj7AOY9q46rcN+piB?=
 =?us-ascii?Q?qf6U2meet5ECTNqTTkW2n5GYeWlOQY0KSbvkLhwUo9czPk0MzCuKPurQKWGT?=
 =?us-ascii?Q?3BS5GrEqpEqCOp4RdIT2Ezjg8iLb/NwCk4t4nq4GuRsKuG64DFlt+Wr7Yqdh?=
 =?us-ascii?Q?cL8p9TkYUk8FBFkrkLAGzf31gdVWllr4XW/E7uovroycChVJWkV8EyiEwHnf?=
 =?us-ascii?Q?XSckUCRqwluUuru4yiUgcApHUD6jxudb2SdvHIve6/ExWRCBtGuQAPLDUBRL?=
 =?us-ascii?Q?aZdzUWJRZPm4GvRj8dBI2mQVYbdpA8zy6Afn+gUkOB3rdDncmH4nRVGTaO0O?=
 =?us-ascii?Q?byCDOYVKjwq/0PB+F/Jq/awLIoak68ClRzH1srXDtPepE5oz4Nf0gYLntuQC?=
 =?us-ascii?Q?FkaFtDzoOLnynpoln2A0g5l5XpNB5u05NCUHuTjTe7c3akNfE0ortxZKST6j?=
 =?us-ascii?Q?HYsO5EwiGPmT6fMJlqm/ab7IdLkr7KgdH/CH+9RMqI6X5OVPMK/CGRkJtwEh?=
 =?us-ascii?Q?1SEM4I0i8gA+B9zUlx5RVt4Gd/lNE/Bjd41sXg57n3sQA8AV6zSSKe/cPr4m?=
 =?us-ascii?Q?LggL3zI0LcAnU97zMilxtwMESFs122WwCvJpkwDHcW1zZWTpoV8gmMK2UZ3d?=
 =?us-ascii?Q?V4P++UndN2IaeXb3UM4LOfL40XZ7+jYjUObp2QMJ+2Nq0bIwvZ/VEVcK3uec?=
 =?us-ascii?Q?Ah+Aexf/P3KKifMJ/r+UC2c6MDS9qOTQPBhRaNyf9jEASK42fLE2/Mxa/9MU?=
 =?us-ascii?Q?YH/qfmMtsAUlAkS6MtBRPIWgKAqMJsZeDudHv8CiQN3ZxNng4MJ8QbeDT6k/?=
 =?us-ascii?Q?6hReH8aZbHr0FBfdU++MPKm3MbL5u59kItk2DtzFJRJnlnN/wLMZgOVufw0a?=
 =?us-ascii?Q?fOePwn9Su+n2afl7LYWpZTjKuKhrEwq/BjHSv5NNBC2M4zyIfcLrN7oHOugl?=
 =?us-ascii?Q?Jcdot9TLcGlkrmHZTqf4tcu5ON+mfWB9+AmT9bGNDcjUnk2SFnJjnkZreyVc?=
 =?us-ascii?Q?2vkK7vTJfT1975V2/llpb+Khp2SbSPYKw0T+on2oZFQfRFtoKV5WJ7vikLMX?=
 =?us-ascii?Q?cPCe9B9RyfDrlqk7xIcHfOVAcqqj3Kj0Ey4FTleDXDwwy8EnY+8fE/AW67uf?=
 =?us-ascii?Q?AClD6lDJdGggdzvM3pgNDFwToxDZIm9BLTixiMFRlhcJbMyGQhn3TpCzJ4rC?=
 =?us-ascii?Q?DsyphIvyG+oa/rE/e3inX5q40P42xKcPrizG7AKrD+Za4Joa1+DzQHvwZM3M?=
 =?us-ascii?Q?M+cVORooP+opoFYj3xD5JddJKA7xrzZ4wYIGW+66LBTZQlxuAkoMm3Haqbql?=
 =?us-ascii?Q?CfIABPYGYEcd83zj+KKU92DeOXjga34N8qar1T3StpuFIPcKZBQHwryaiavz?=
 =?us-ascii?Q?fCHWjBVi+fCJN1DnCbKnJKlxYf1/F0tXuHwZynGuJDr1DGrcEg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?gRaheaKiG1j/f5D3RVC9FO6M9W5c7viKcSjtQCOBOwRuGzKIAtGFC24rpzSz?=
 =?us-ascii?Q?ONQP19WHBH/qqxWIJtyZl8VO5xmVdzjg1fi5Qi/39qm2YmDL455QfpopS9Hx?=
 =?us-ascii?Q?MHpmNxEVI1nu+38QEgwDxSbxOC4F7WE2MCau4nnmV3NDo+OKDPAmu5T8hP6H?=
 =?us-ascii?Q?LZ7fj7rtmKL8gZx/sTRpGyPfU6uPS+6ixPy/UrdC92Mil++w3CXNdQsf6tYb?=
 =?us-ascii?Q?8J7No+gzSsZHj0MGGDknht8vUor8zx2DV65l0QG+uSNpLz1CnncZY9opt5GJ?=
 =?us-ascii?Q?OTfLL1es0g6jnkBj+kNgQizgnAj8yKh3ni9XgcoSYj1napFE4Ha3ISWkrvTe?=
 =?us-ascii?Q?279Wbwo2sJGyD+rrKvGrMN1AuKRHwFUyltmBTwO+TS5I2T0KYW4yb2BPSEV1?=
 =?us-ascii?Q?TtZ6wfRbERXyJ8kk9e1aWSri4Y+h4s9r5t1sdXDsrzGW3DH0xZtIJEzbYV24?=
 =?us-ascii?Q?i3bqkjyD8SZoGv6KMSk8OqX3Cy5n+7/XNRa0Z0fIVOr+FeGB9FZdokVcdO5X?=
 =?us-ascii?Q?gKzKAoM226L4ysuORTIcw8lkqtXEIimI82aA3VpjA/+Gy4j/G+YmCys25RhS?=
 =?us-ascii?Q?iDLhYigfd1UCVE7UR3dhsAjsC1rOJPlcEayWCbDyHBxb8HXLPY6SCugBZZZn?=
 =?us-ascii?Q?FiNBZUrWQoIdunJbP8XC08YcY2uAV3D21pOvCJfrrLd28qnDddqaHoDNmF9D?=
 =?us-ascii?Q?S/EgVfvUqz1jClL3txeQir3foHPZRXpKVzj5zczDypHN89s6X7fWyRm9/5ta?=
 =?us-ascii?Q?zXe/RlENQBPTtoyfesXwHGY+Z/edIIJB3VO8I0sNpNT96IL2b7Q2xOFVDgPp?=
 =?us-ascii?Q?G8QhFmn9SE3UqXxnYaFgJiKMBxwQJYdTAfQMrEVyzqVV0zqct+QvUSJyuDFP?=
 =?us-ascii?Q?YWUnrqyA146xLyT8DLLg7EZ7VnMMXlV9uTgI3o4qeluJl0Xkti5m2eU7FyD5?=
 =?us-ascii?Q?ZC0UBAIqeFnrZjf1/8PhQivSPnZLbEojpG/3U67mX0qVnpzp3RuS/7dfph9A?=
 =?us-ascii?Q?Xl7/m5xgF88vIIpKStrxqZ4KYyrQuEdNU/L7hI1M4sJZPjycVkf0HoWNg2qC?=
 =?us-ascii?Q?oFMPfkmKuhjdmQZJfLHgN0AiH0wKv0YHJ1AfMoc6Avc9pPAHkTk5NwA06/z8?=
 =?us-ascii?Q?6R9MiAWR/QO4GU0yAEqNCcbs/CYooOe+T1P50QoiOM942WbupuZQfwPlIn9f?=
 =?us-ascii?Q?ivOoyWGQaxaYBXTRFb5952JmE7xhZNSCChWphFGVx+32/zmqErCKQ7NkaHEy?=
 =?us-ascii?Q?39yiTx0pf1yC4EcNbaRIdoaGSDwXvI8JihR9/yedlS3IF6lPMbSWmZPRwwQl?=
 =?us-ascii?Q?+o6SsNLecvxwzUJrZrV2GgdoZYSKYsFUCrnd+1e7K6HAgesCN6cXuEJ0jEe/?=
 =?us-ascii?Q?H4v5IyRIBOYkqZSGi/kfboQA2g/o6N/O0vTkoBx8uw/4sZy0bjZtQQFb7G5m?=
 =?us-ascii?Q?G9Tp2D3LuZTAWpt+ExnmYlXEV0kyt8VC8QEbKVLrmaFxeVobw8TyQyycslW1?=
 =?us-ascii?Q?nuMeAN9FxaIEpa0P/JqGP0NyQkiY78Kt69dZDCgGtXgjQaW2u2ARIlbfqtlE?=
 =?us-ascii?Q?MEMBT8UICngXZKDidSY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86fdb638-656a-444a-058f-08dca4ed6583
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 16:44:29.8291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2zS5wn37Gllqvo7gJOweSxhSrGYJ7fTLYlAtlnkM/6igrZzbfLu/AN30AOYmckAyp7VokhmtB4LLTlmfRWwQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10198

On Mon, Jul 15, 2024 at 05:17:52PM +0200, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Separate the atomic, dma and non-dma use case as a preparation step for
> moving the non-dma use case to the isr to avoid rescheduling while a
> transfer is in progress.
> 

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 107 +++++++++++++++++++++++------------
>  1 file changed, 70 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 1add946e3bc20..e242166cb6638 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1011,6 +1011,43 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
>  	return i2c_imx_acked(i2c_imx);
>  }
>  
> +static int i2c_imx_start_read(struct imx_i2c_struct *i2c_imx,
> +			       struct i2c_msg *msgs, bool atomic,
> +			       bool use_dma)
> +{
> +	int result;
> +	unsigned int temp = 0;
> +
> +	/* write slave address */
> +	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
> +	result = i2c_imx_trx_complete(i2c_imx, atomic);
> +	if (result)
> +		return result;
> +	result = i2c_imx_acked(i2c_imx);
> +	if (result)
> +		return result;
> +
> +	dev_dbg(&i2c_imx->adapter.dev, "<%s> setup bus\n", __func__);
> +
> +	/* setup bus to read data */
> +	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +	temp &= ~I2CR_MTX;
> +
> +	/*
> +	 * Reset the I2CR_TXAK flag initially for SMBus block read since the
> +	 * length is unknown
> +	 */
> +	if (msgs->len - 1)
> +		temp &= ~I2CR_TXAK;
> +	if (use_dma)
> +		temp |= I2CR_DMAEN;
> +
> +	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +	imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR); /* dummy read */
> +
> +	return 0;
> +}
> +
>  static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
>  			struct i2c_msg *msgs, bool is_lastmsg)
>  {
> @@ -1021,6 +1058,11 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
>  	struct imx_i2c_dma *dma = i2c_imx->dma;
>  	struct device *dev = &i2c_imx->adapter.dev;
>  
> +	result = i2c_imx_start_read(i2c_imx, msgs, false, true);
> +	if (result)
> +		return result;
> +
> +	dev_dbg(&i2c_imx->adapter.dev, "<%s> read data\n", __func__);
>  
>  	dma->chan_using = dma->chan_rx;
>  	dma->dma_transfer_dir = DMA_DEV_TO_MEM;
> @@ -1131,50 +1173,24 @@ static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
>  	return 0;
>  }
>  
> +static int i2c_imx_atomic_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs)
> +{
> +	return i2c_imx_write(i2c_imx, msgs, true);
> +}
> +
>  static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
>  			bool is_lastmsg, bool atomic)
>  {
>  	int i, result;
>  	unsigned int temp;
>  	int block_data = msgs->flags & I2C_M_RECV_LEN;
> -	int use_dma = i2c_imx->dma && msgs->flags & I2C_M_DMA_SAFE &&
> -		msgs->len >= DMA_THRESHOLD && !block_data;
>  
> -	dev_dbg(&i2c_imx->adapter.dev,
> -		"<%s> write slave address: addr=0x%x\n",
> -		__func__, i2c_8bit_addr_from_msg(msgs));
> -
> -	/* write slave address */
> -	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
> -	result = i2c_imx_trx_complete(i2c_imx, atomic);
> +	result = i2c_imx_start_read(i2c_imx, msgs, atomic, false);
>  	if (result)
>  		return result;
> -	result = i2c_imx_acked(i2c_imx);
> -	if (result)
> -		return result;
> -
> -	dev_dbg(&i2c_imx->adapter.dev, "<%s> setup bus\n", __func__);
> -
> -	/* setup bus to read data */
> -	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> -	temp &= ~I2CR_MTX;
> -
> -	/*
> -	 * Reset the I2CR_TXAK flag initially for SMBus block read since the
> -	 * length is unknown
> -	 */
> -	if ((msgs->len - 1) || block_data)
> -		temp &= ~I2CR_TXAK;
> -	if (use_dma)
> -		temp |= I2CR_DMAEN;
> -	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> -	imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR); /* dummy read */
>  
>  	dev_dbg(&i2c_imx->adapter.dev, "<%s> read data\n", __func__);
>  
> -	if (use_dma)
> -		return i2c_imx_dma_read(i2c_imx, msgs, is_lastmsg);
> -
>  	/* read data */
>  	for (i = 0; i < msgs->len; i++) {
>  		u8 len = 0;
> @@ -1241,6 +1257,12 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
>  	return 0;
>  }
>  
> +static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
> +			bool is_lastmsg)
> +{
> +	return i2c_imx_read(i2c_imx, msgs, is_lastmsg, true);
> +}
> +
>  static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
>  			       struct i2c_msg *msgs, int num, bool atomic)
>  {
> @@ -1248,6 +1270,7 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
>  	int result;
>  	bool is_lastmsg = false;
>  	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(adapter);
> +	int use_dma = 0;
>  
>  	/* Start I2C transfer */
>  	result = i2c_imx_start(i2c_imx, atomic);
> @@ -1300,15 +1323,25 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
>  			(temp & I2SR_SRW ? 1 : 0), (temp & I2SR_IIF ? 1 : 0),
>  			(temp & I2SR_RXAK ? 1 : 0));
>  #endif
> +
> +		use_dma = i2c_imx->dma && msgs[i].len >= DMA_THRESHOLD &&
> +			msgs[i].flags & I2C_M_DMA_SAFE;
>  		if (msgs[i].flags & I2C_M_RD) {
> -			result = i2c_imx_read(i2c_imx, &msgs[i], is_lastmsg, atomic);
> +			int block_data = msgs->flags & I2C_M_RECV_LEN;
> +
> +			if (atomic)
> +				result = i2c_imx_atomic_read(i2c_imx, &msgs[i], is_lastmsg);
> +			else if (use_dma && !block_data)
> +				result = i2c_imx_dma_read(i2c_imx, &msgs[i], is_lastmsg);
> +			else
> +				result = i2c_imx_read(i2c_imx, &msgs[i], is_lastmsg, false);
>  		} else {
> -			if (!atomic &&
> -			    i2c_imx->dma && msgs[i].len >= DMA_THRESHOLD &&
> -				msgs[i].flags & I2C_M_DMA_SAFE)
> +			if (atomic)
> +				result = i2c_imx_atomic_write(i2c_imx, &msgs[i]);
> +			else if (use_dma)
>  				result = i2c_imx_dma_write(i2c_imx, &msgs[i]);
>  			else
> -				result = i2c_imx_write(i2c_imx, &msgs[i], atomic);
> +				result = i2c_imx_write(i2c_imx, &msgs[i], false);
>  		}
>  		if (result)
>  			goto fail0;
> -- 
> 2.43.0
> 

