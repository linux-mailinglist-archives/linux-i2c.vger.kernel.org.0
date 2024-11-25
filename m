Return-Path: <linux-i2c+bounces-8208-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CEA9D8B26
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 18:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F4D11695AD
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 17:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644631B85D7;
	Mon, 25 Nov 2024 17:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gavDslhU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2070.outbound.protection.outlook.com [40.107.105.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1C21B85D1;
	Mon, 25 Nov 2024 17:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732555107; cv=fail; b=bDvpdWpEKwRZTaemIa5E1wkpvVg6r1ZdxXaDNaGHUDjaxSlsHx+uOgbrGUfZ72hTzTrah5tfvm5nA0tayj5mUA1fAFh0hhOvFUXWgFYl9W0KF5rj944b8UN6y/hq0AxgzpoQPz2kHEZM7WKWkdJfakAf6IYkVf0mr/iZ4BMXnTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732555107; c=relaxed/simple;
	bh=BONuS4oZ47hcVktETXV1UC6k5eQctxX2q5DL3Piyb0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JTw9sXBwR/osKYi2m9zyYzL+w5ytSFKW/kkVE97CGHcejNCDQmQWBkVFabsWhXvxtxHB2oM/7Qx0eiAa8iYlRfiLIXjJfKG8SBTpq7/tDdehRObTYbQH3YUbJcRzXZNWGXrLoERiLKKQVm1TqY4zUoLlVJkT1Adygg5Rw6IxgqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gavDslhU; arc=fail smtp.client-ip=40.107.105.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYGTrEwh6so0pAsQNgu9duhuYSbRurSPMU2iAPnihawCPow1GwkFBBnEMU4APO951yl6AMy/aHDrxQykyQi0wtj2c2rajRykEGZI7td0vhXjd405ztO6eBRNvx2AXKqq+ua2rg2CCx9P4ohpWATE8nivheE4xUePXvlirHd1BK1OT9q+jY12qfQlStc874LAiEIte4UWNez6y23eS5yVGpmTb2qkT/qvwnl8Q53d1OIJxsytdXTCAXrdB+qStZYGr2nfOtP2bmYWYCxrLROVkvVIZo8OmJbgWl6kMoUYd6AXNGhi7Zql+cwIYJ3szkmcDw4tser1uYd4Zw4MTqfheA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcE/GShILeMpVgmJzfpB3ZBGU+dmQmKJjvx/WtMBQ8Y=;
 b=bFdpLDd1jvf00aPZ5THBnrbdHcTzIvbRHk6/z6zwx+ro0WPCacsw4iZHWjYsK/tREZpCtZ2sdLTsVFMBGFP3u1LOn6B6+NQlIjhAQ2Lg8+qVeTnR293RoQ3tikyptXhidJtiYK201nzvCrTTvvVq+kStpPNjL3eLRgA6qI54uhqYKRp9rq3bqUjsp0PdVGJ/lFZYH6m+KEz6CVb0ycvUBlTZ7gZZUDt8ETTyLftx+Cn6IL3PDJFYBzaDOWCVNyObQFhwdDD+kfE7NngrZawk+l3qNNzP9z2eLzMhJeZ4CUXdGdSovjuEYLJm9dLNpOzG53cAJJ9V/5R9JF4d5BQgAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcE/GShILeMpVgmJzfpB3ZBGU+dmQmKJjvx/WtMBQ8Y=;
 b=gavDslhU1YogBUgnod6yw1NvSHMho+U6BHsturCay5YM9FDroTEJcL1lZEDkGP5+EbDeMUFBI5CfilNFjv5woF6tcbzR9FEHFtdF9K6Y6L8FvUGzIdBLA9kftjrbpNOVIYe2P1Ep8Enuc+zEbl6kBm0O2bqupFtDvE28JMwnOm7WcOm+htPKaWHkvjRuOuCwjOWX+Xsz1E7gcYUeLK1Ue05RpFmZxk4Kp9MnVzuO4O9DyRoR3BD3askj32XVC1K16lSnnCb/LtemcitiatysVkYSEaFzfJTdmdHK2ct2CnK4KnisLB6Hc0xFaDdu9LQCDpNABDTBFT4JBRU/66xe+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8338.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 17:18:22 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 17:18:22 +0000
Date: Mon, 25 Nov 2024 12:18:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: carlos.song@nxp.com
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: fix divide by zero warning
Message-ID: <Z0SxUhBmp06ScnfP@lizhi-Precision-Tower-5810>
References: <20241125141521.1612947-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125141521.1612947-1-carlos.song@nxp.com>
X-ClientProxiedBy: BL0PR02CA0111.namprd02.prod.outlook.com
 (2603:10b6:208:35::16) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ad4a23-0c51-486c-1f21-08dd0d7529d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1siESG/RU37MM8sFhWU/+Yw9O0EI8UYYjtfi1bPgDqo+19kalvinCusY4G1j?=
 =?us-ascii?Q?hoVcYNkoTjIyuCECS7mWB7xFGHxPH4HfOFfzKaHpqGTvFEJp+Z1+LuRf0AJ5?=
 =?us-ascii?Q?EGFKp9L9p/gKqb7jYMsTz+WK2eSjJX8hJZOP5f/6Jjewk0ZeJht0UHHUB0rG?=
 =?us-ascii?Q?gqJt0tH/LHmvV0YUsmriiiwXEFxlrYzYneUdmv2GFShhiZ1hTMupoZ3CL8yt?=
 =?us-ascii?Q?yGzcX4kdZjq5EG0h+FfM5rMq6xn40RK3MpGZwy2P/EpyzHhdzQVKTthWrimh?=
 =?us-ascii?Q?Yv1Wd4eE9jfBSs5SyAJUB9sWLI1V/J6L1/3o3WwFZphZnYq9dXZslf0NwKu6?=
 =?us-ascii?Q?MX6YnBDB8I+2V8hPAU3fkUBusw2mgvk8CjmKI//OpRv74kvll8ZuPNJrBRdA?=
 =?us-ascii?Q?yx6Vlep4BPk2ni8GndX6fMUbNfyglP4ir4C4FJ354SoNzDDrHj9DFLUvPR0D?=
 =?us-ascii?Q?lhfCzveuOaWrjZnqFo4lKUgd3xZnYpDW+5XBRbxk64Z5f2dUejT7bIQf+9KK?=
 =?us-ascii?Q?WZ/lBWjLAxGiay/C/xu51bM6ra75i3NnGO3iSiceL3bwIkLlbaOdgO/bK5/4?=
 =?us-ascii?Q?d08UZ1kScDh/oZa+mpMCD6WfWXRx21v2rOQrilEzl6rHNTbkps4Ou5Wv+sRs?=
 =?us-ascii?Q?6W8aaE+M95cdKN3ROthUSawzhDwOaOYf0NB6/KItFQwqFebSyB9NHetIarWM?=
 =?us-ascii?Q?RZWtLPuk1iN/Pq3161Tyx6g6LrC5IrLjml/oQnDwM/QTrr6aU7JhZLKPyUZy?=
 =?us-ascii?Q?1t0jR5duTfOzfa4mVIKvdZwlaESqN34Qw3C945pIlzma8uCkCEaL0nNaD2dF?=
 =?us-ascii?Q?rLym0NMeqq1EerVmwg6iSUuL1TuIBruuHQ4ybPsoSQ+dN8rvMwiJ/PJCnWl/?=
 =?us-ascii?Q?x6lbqMsttgU8zPzqAVV9pPng9e5JtCV0F7a5n2O+My5H8n/W+LZ1D0OUP6ki?=
 =?us-ascii?Q?jV9VDLhWktyUIXEt2tlij58Ymt9j1y/SN9us/bVSILH0j8JIoSOOU885NbHV?=
 =?us-ascii?Q?CM5Y+Mlj+AfwyusQx0Vw+vGfBrWE06fJn0Sk4utZ4AxHc9Q5nz3qFv6ZnZF9?=
 =?us-ascii?Q?zItekamrUPck9338zzvMTVbLisy0o+F+Udv4r29VogUiI7QHFBcCfEHfjXDl?=
 =?us-ascii?Q?UYcUVju1JOEI1fX/NjnOpho0R+rXrEeV2I4r+Cj5wPIO3xxYIpdlFd2UAl2H?=
 =?us-ascii?Q?hiNLDNr0fWtW8W1AlTbn8vzvusPapoNI9O59IoLh2V8iHbIY6bRyh12eZE6q?=
 =?us-ascii?Q?ebMM1K8y6pluSDykfVsv6aOkrCbYcbqzrC3E/k4SsfHyHqskguoeCYohyfDL?=
 =?us-ascii?Q?rH1T1z7wCXl+MysM3e7XNZ58saseVm6slSXmrUnAaksg2lHWzAcBdC8HHlmu?=
 =?us-ascii?Q?fo2bYI5JXHpD4yS1R8mCbApg4Y6TZP6RfqBLCY9hnXqjGf6HAA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kEpUAUbjsr+r+Tai9InA30Alfxgzf9YpbkVuA6tlF3XlRDuf81KAqmy6nGE5?=
 =?us-ascii?Q?t5lI0Eqk3UK/HA6FHhOWXFuiygrYlS/PdzoQQSF/Wnd8qxxI4PGjiXdloWsU?=
 =?us-ascii?Q?pr3qallH+mL9Bx8MY90dsdMxMxzmW8GGl2limFAGMBQ0AclecwYGgVa3E1Ai?=
 =?us-ascii?Q?ERSLGeoNo3Jrei5XvSIA9dxMBy/sYOHaz8bZXRCKUMpNogFU7gsaTQ/E+c1e?=
 =?us-ascii?Q?wszebz0BlTEW2I4JC4dPm6b/p6dPwlwdXQzoF0gI8AkZ07QMblXOtjJe/mz5?=
 =?us-ascii?Q?/BqpyArk+ZBTXJ4crFVNU6AtVwtlxzrvmFcsgvbpD3fF4oM0dSSaUoEaO1uH?=
 =?us-ascii?Q?cEonEe6Eu+yChgzURvlrfdYjY/XUH0u/EPN+BvwippYzeeXA3sICrpCk9Ki8?=
 =?us-ascii?Q?07HUOJUcc/q4OEdhZebJ8ekyFnXAl9s1WwlW+YTYLwU4z93ZNgQlS4DnLBaV?=
 =?us-ascii?Q?wLlO0KrrK+YcL740I5hcyKxBenwk88GVf3decbSz1AUhAIRQmHfiOdB0lUwy?=
 =?us-ascii?Q?AN7ffrLyPoP/q9/ftLLXl0t4+QwTCsXic4J9NfExFuaPrOZ3Jl1Zj5R/te8k?=
 =?us-ascii?Q?rjwk+5XlfluXn4eJaD+qo9ejnBUmkdbRI+FlVA0cGIEEEUL/XqGYRK4UWGMx?=
 =?us-ascii?Q?whOSfj8J5QomL/VxjoyO4norRe5MGi22rFrUKL3Y2IPMAPu/6lchMjbLGYbl?=
 =?us-ascii?Q?3PLuhjekzL0mMhzCeqdPMFEyBpbo0KDqQAE+WPO2SgcM9Ntgg4CevmULa2+I?=
 =?us-ascii?Q?DN5p8zf6sIzFiOSvO8w1p7zaB7tyGKEOF9S42R6xrhaoJSA/1Hx9tA6AFSmN?=
 =?us-ascii?Q?KAjkugs65jtxhxiJ4VRnO7XhL8Ahfigf5QAOLBc5AWJRxSSwzJBnB8KIaRzw?=
 =?us-ascii?Q?F9wf86+6PUSWDZJfKEIlOze34QCj03whQ9EuGMvVISTvdGiP83toGK/eWpO2?=
 =?us-ascii?Q?HgpH9c+aIR+ouUdUU21hnOaJ8mZmBaez+SPPlHRv9KLEmXEcsS9vFq9mX6dO?=
 =?us-ascii?Q?wrh1JzJcGjdB8IS//8MTHsS3JkHNXUjkmWalqIr9umWACoI2hS6ycHGdnmT0?=
 =?us-ascii?Q?JfttRqO8pz63SQmf6cbInekOBgPW1JO/YHyJqiFMollV1vML36JsCNw/60lx?=
 =?us-ascii?Q?1OO6TLthUJbicPr634wxYuzHR13eVRma47ea2V9dlB5wdidn6Fn/Xh4snBvQ?=
 =?us-ascii?Q?vkj2u1Vb7v7ffE0NcMslpi+jJiCCUFGKb4NTXsZTFAm3YxP1L3bTbsAchcAV?=
 =?us-ascii?Q?yNevHDIBTg+B1Yy/xdn5cdx9afdG8Tqqt72onnbufuTpZzQI89k1zb6NDPSe?=
 =?us-ascii?Q?xiPUTFRvoLRyYWQ6nu69N6SrPCu7qilbFpptH+5L0CIsoRvAAqQfdldEtcRn?=
 =?us-ascii?Q?XJlw4dpg2AyVXj/28Wdk30FCydELuiotP8jC2Y8tkJ61jq+wCY1TdvBYFsJa?=
 =?us-ascii?Q?2Q4izvFM4rWkdyY77B6lUs0/mnXNXaEl85cGeVhVFqlXos/MBfl5YvMPBOip?=
 =?us-ascii?Q?6K9CtA3mMthFwFbEwI/W/b0zAOaLWfe9rru3YxsAPIW1hWc86wF3oykWNtQX?=
 =?us-ascii?Q?DhWk8UOjq7o64hoJHj8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ad4a23-0c51-486c-1f21-08dd0d7529d0
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 17:18:22.6399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXK17bn7McvvzYnlD21L7DB+X7SH7bXCREndBSoPToyYBHPoNzaIu7v2poN+AJP5MRvkskL4Lx1bceOis2aOuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8338

On Mon, Nov 25, 2024 at 10:15:21PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
>
> Add "i2c_clk_rate / 2" check to avoid "divide by zero warning".
> i2c_clk_rate may be zero if i2c clock is disabled.
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---

You sent this patch twice?

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i2c/busses/i2c-imx.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 2c782cdc26bd..5ed4cb61e262 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -623,8 +623,8 @@ static int i2c_imx_acked(struct imx_i2c_struct *i2c_imx)
>  	return 0;
>  }
>
> -static void i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
> -			    unsigned int i2c_clk_rate)
> +static int i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
> +			   unsigned int i2c_clk_rate)
>  {
>  	struct imx_i2c_clk_pair *i2c_clk_div = i2c_imx->hwdata->clk_div;
>  	unsigned int div;
> @@ -639,7 +639,11 @@ static void i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
>
>  	/* Divider value calculation */
>  	if (i2c_imx->cur_clk == i2c_clk_rate)
> -		return;
> +		return 0;
> +
> +	/* Keep the denominator of the following program always NOT equal to 0. */
> +	if (!(i2c_clk_rate / 2))
> +		return -EINVAL;
>
>  	i2c_imx->cur_clk = i2c_clk_rate;
>
> @@ -670,6 +674,8 @@ static void i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
>  	dev_dbg(&i2c_imx->adapter.dev, "IFDR[IC]=0x%x, REAL DIV=%d\n",
>  		i2c_clk_div[i].val, i2c_clk_div[i].div);
>  #endif
> +
> +	return 0;
>  }
>
>  static int i2c_imx_clk_notifier_call(struct notifier_block *nb,
> @@ -679,11 +685,12 @@ static int i2c_imx_clk_notifier_call(struct notifier_block *nb,
>  	struct imx_i2c_struct *i2c_imx = container_of(nb,
>  						      struct imx_i2c_struct,
>  						      clk_change_nb);
> +	int ret = 0;
>
>  	if (action & POST_RATE_CHANGE)
> -		i2c_imx_set_clk(i2c_imx, ndata->new_rate);
> +		ret = i2c_imx_set_clk(i2c_imx, ndata->new_rate);
>
> -	return NOTIFY_OK;
> +	return notifier_from_errno(ret);
>  }
>
>  static int i2c_imx_start(struct imx_i2c_struct *i2c_imx, bool atomic)
> @@ -1782,7 +1789,11 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  		i2c_imx->bitrate = pdata->bitrate;
>  	i2c_imx->clk_change_nb.notifier_call = i2c_imx_clk_notifier_call;
>  	clk_notifier_register(i2c_imx->clk, &i2c_imx->clk_change_nb);
> -	i2c_imx_set_clk(i2c_imx, clk_get_rate(i2c_imx->clk));
> +	ret = i2c_imx_set_clk(i2c_imx, clk_get_rate(i2c_imx->clk));
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "can't get I2C clock\n");
> +		goto clk_notifier_unregister;
> +	}
>
>  	i2c_imx_reset_regs(i2c_imx);
>
> --
> 2.34.1
>

