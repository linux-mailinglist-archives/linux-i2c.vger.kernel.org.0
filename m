Return-Path: <linux-i2c+bounces-8207-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB479D8B2B
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 18:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CCB6B30FF6
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 17:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E431B415F;
	Mon, 25 Nov 2024 17:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="avxBlc0u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2044.outbound.protection.outlook.com [40.107.105.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6EE1B4152;
	Mon, 25 Nov 2024 17:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732555031; cv=fail; b=c3k4MHDYH4hGbf44WK5mQfVu+pIUoUEQzhHtklI5NuF9wOZO5YWP7+ZfxRYoRPXKZceO0KRz+mNLevaFNoGSxh7ECHFga+EjOn0miuggYd69LnAS/YTJhnUkvfwUstF7fbNY1XhgIVD7EP0aZiyJRDltHduKLUPU3XiK1GJSro8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732555031; c=relaxed/simple;
	bh=3kXguzlkM9Ct2ODOWQhYX18e9+uiYEoE2Lc38d5cyIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kDnSeOF0lV5iJMjrb5UY9oXoGpgBdflJClWxWHpO+Y25wDHzdwMKnEuwttiSh++wIQ/iI3tjNPGMudeDvVQUVdOFhu/QRz88wY/e/LqnItUfpHoZqMJekjTlxsJaPQqlmVsZkBqcLRWpZR2laufTMivECUdVMXhn8eflhmP1NAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=avxBlc0u; arc=fail smtp.client-ip=40.107.105.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzxJD2ROby0PlQq/sxlrJ+wK9RgD3afipbcIZNXkBuN8xWEApLLzME56UsUljn/yi8kTHqh5tt0fc1k99kyeoDEwKEbWVL3XDJDs/+P8Ht/WbNJSRTV5XFwGRrhM2TP1JAKHih69Ywfng2NVLRpAtxiwkCaBqmEej6hA7bjtzAulx/lOZo0AZa8ywz6Q6HOnTp+7YkT+/nGbkPu/cr59oLutH5jo3QdkO0w2uvw0rQYHPBdYPWnMIZVm6Qcg6BQ2rkuSdGBVHDwb1wCrV16cMdL/FJyc0kSyT8YKPRRQL5K6peu+mqTyyvK7DTSsNlUJ7EpPSHSVWKstKesB1CKhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsM45Wex9cVXXvdshuRLhipzRL9qfcdPt8T9vXEfUvU=;
 b=BFE0LnQaeU9FdlG2Ey4zcUDu+YioI8cLdr/qHk8o9gdGUhM1jEIc4+1Z6+aYwrNG4Gx80qPP9iMb1SjeMMeLY9GeDT3Q7+UjlI97b6K0axcTqln3lX73j7eolAe6YPOrKbXeF3j+cWbwHjVfebXTKwoX7WJCcxdwpRPIvbN56f85MxIoCHkXHe9ziHBNOzMKcLpzDxtqSAvoPell1BzOH3LEezgxWjDrgDp/0Se8ric0JtP8cGYB2QpjZPo336bhDqOIuFCBGD5KVWzmhNwIXmpfyRG7ZwOSmknN3Rjerv331M015eY7r4UReHUnPUAF76YTiCP5MFSltZ20EqbRQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsM45Wex9cVXXvdshuRLhipzRL9qfcdPt8T9vXEfUvU=;
 b=avxBlc0uaRVS6S2wU8Pl1TtOq+X33nA0UetxRB4x9zyBpBpCVAeMFeWYs82Ja94Cf2sWKKRIkDG4oUzguKEtzBGfiNVgCKfYcQnG1S/HqSErRpBPQPkly+S5VW0Lz2Ze/SMT+OrbYgWqNZRbeSUK97jM9mYXiMFC4oiQ67CPXPl+Thl3JW5NAul+saduW1UGHxszLGeORCbA6gGTxWdUjGaMIbb6MsHvUeV0gcaBAs9y2H+NmV95SwyGCS2GCghpNZSADW6PCCGDL72Dkww9eVn67ofiyYarYDuwHBsQ3e3QKL5UCv+xRFI7+Z9wGnyzL+nqFhGmugcwvUa3p+EdSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8338.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 17:17:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 17:17:07 +0000
Date: Mon, 25 Nov 2024 12:16:57 -0500
From: Frank Li <Frank.li@nxp.com>
To: carlos.song@nxp.com
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: support DMA defer probing
Message-ID: <Z0SxCcnPOPA60i26@lizhi-Precision-Tower-5810>
References: <20241125135243.1612098-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125135243.1612098-1-carlos.song@nxp.com>
X-ClientProxiedBy: MW4PR04CA0122.namprd04.prod.outlook.com
 (2603:10b6:303:84::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c1ef96-3b9e-4e73-d460-08dd0d74fd0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UaOgYLluRpzbWE4xvTbcCMOEQZ/NxDHHY95LDyxrI364cvm5+WNHyVU4sabO?=
 =?us-ascii?Q?CrRsqXhBzilqCYQ1FeUiVAscd/JPhopIBtEBF2iQNfEANAL2B1rMnmCCwT3e?=
 =?us-ascii?Q?qaV5nbjEkBOZ2T4HCqnPil4Gr5JEtgPT1MNNGdX4WgWQrk4C9dDyPi57J1UJ?=
 =?us-ascii?Q?ZP7XVhjes5MbAseIKnS5uhWwATmFVhB+DvWqzmpON4xt4clQ7BhBP+i13g4r?=
 =?us-ascii?Q?01RrTcNJcrt5y5UHm7pDPfy4WVAnGKkjCJmEv3XTZStu0vRoeSH7no7oktDc?=
 =?us-ascii?Q?G3ynYioNanGCTy8pSkPx+Cfg7kabvJJY+qYGbnqg72yTh3rXbcGV2yk1bU5S?=
 =?us-ascii?Q?DFss2kJO9UZbP7iPyUyu+544JDpz2fTlI1Og8bzNc/+U1P8XxpyWaKLnbZuf?=
 =?us-ascii?Q?JVy+E5EESF47/IvYIyLpL4nW/Lvcj7AFJcWnxAjXXuIQt2zMWyL2i7RnTBRq?=
 =?us-ascii?Q?BJX1Ne5wTQzAWqW+krqMbK4VDVz3948SlUoSkBPGuuwx882DPGt7v2rMvUBu?=
 =?us-ascii?Q?CA5tDLOvCLHvp1KaYVr9K4zpEYi2ZehmACc/eXmof1NOqZvnTOXJgYB1/FKR?=
 =?us-ascii?Q?io2f8WRekiv5fdssfXYJ5su5KKWIVaZ2tMEXVtUqhxUtMkhqqFJYaiMGnyLY?=
 =?us-ascii?Q?a8AZ+CcQT9B4I5YJ/6wWnjFbQtLbVQ/FPW9W4A9+oC5gdl8JY1mzEyGyGEhc?=
 =?us-ascii?Q?XxoI1NwYElNRGPqoHvEQ5He2h9rAai1a/ELX3Nm2ZXKUy5yyfN01OeAIs3IT?=
 =?us-ascii?Q?dFMsEZdHAAgOto9JINkkT8AEYfUEz78+EGiHImkV48CIw9lb0Oxy6bZyUvhw?=
 =?us-ascii?Q?0zI4gPzALXAyA1Ien0H4Su7+pWi/BU7yQ1BTrdxJnH0Cprq3OrTq99UWouzL?=
 =?us-ascii?Q?oQBAukCaSDXfqSuFy4F8U6YW2TY5kDPNH+Z6fA4ox9kMv3x+PU1fDMunml/U?=
 =?us-ascii?Q?M2hfqmWCN7sY+OlB1ltWH8pbyJ/XngUkqnbrDnDb8wHT4THM/5KncY090y0u?=
 =?us-ascii?Q?J82Nu2JCI4dpj1n3fzUFkhOL+BeqChwdNEBqSXjmm18lDvgGVKX4LbjvxYDa?=
 =?us-ascii?Q?dS4mstFKPgirI+x0RzDGULOWhslpzA1XOeguRzQeJjGz5qD7Rb45Ri/b4K3D?=
 =?us-ascii?Q?MoR3sQcojYbD+EGl7oTvmbWxlzh4N222vS9npj92ghJOJHUpfS8T3LNaMQPC?=
 =?us-ascii?Q?0c4BImjY3/Fx+dPnfLTBA0IN5DDUqrHiubeSfQ02xBhUEIO61byNgtuRyxdx?=
 =?us-ascii?Q?RoBCiyl9MPU9HINsfqG2893AlNbMfLDdx5V2Bc+6N8MwdjeblBKslTI57krY?=
 =?us-ascii?Q?CQjmb2nVMTlfsIQY5tuE0Y/o0W+HMElT/4Cn0S5oeBNY46DERpO5StYnHzW6?=
 =?us-ascii?Q?+jPtormWhb5bF/khDa7qySGYZmKx62ipoRTBkWQJr/1USdX2Gg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zJQ6q20Ct25Q6Ia0DY6VGgwIa4yKfTbpxGKpLUHLorJih9Na1kuAHhGew+xU?=
 =?us-ascii?Q?IzedhTyREs7LJ6XBIx6/aPh7IVtdvfj29JxCyrIPglsOVYQ8SssWYTy5p4+L?=
 =?us-ascii?Q?71RESlFd29pWyLFody/Py9eE/lwORyB6mgRI93C/TQiuQ6aMmxH+SN427P6X?=
 =?us-ascii?Q?liKQnA6fCwf9OwhyoboVZv3EKqOlU+IBqpduiu+g8hQbiw9KrfLIh7J5lz6C?=
 =?us-ascii?Q?g+aow/+OTwqrC4/jQt3uZBtPggvDt6Sy1JQgjwQszh9gwAiBW6RB11u0Q7pP?=
 =?us-ascii?Q?8g1LNi86Bq2qN8nJRg87y2Iq5QXYAB6klHHG9zikLGzcmlVqhPhKSoWv7ngU?=
 =?us-ascii?Q?w21Ncm2fc0x8/gg5KG9r7u7hX1oO8b36cjvfdW8KDmt1dWnAJMTTvnYng3ey?=
 =?us-ascii?Q?M7wPLtKnL3GYeswiwArWcZBiKNdJUDwGeGuk+pZ7FVD9NV8cHgB1s9Meq0ZZ?=
 =?us-ascii?Q?wHKk/FiO4wXxB1uoxvUfnwfBs9N6tRXDKUzg2B+s59bquLt2GpbSOpHILkI7?=
 =?us-ascii?Q?PWy56qS0QB8MQvJ2XUjemve+SS2nfltphvXe0fkFuJHD7kyX8wHCNgY/sUss?=
 =?us-ascii?Q?DyJ5RLrjraUTk1F2qkmCYG7nWod8v6+V7ReW2AwIYt2iJw4ijN4pyRfV6YnD?=
 =?us-ascii?Q?6ivcRLvm31R81UGGr3cd7YbjrZsx4eSGolaQOu2UNvy2Z3pltgkIIx71oBoM?=
 =?us-ascii?Q?tA6zyThnUc+HvZioXA1Oow1eaxhmE3UFfayBQpA9eSesSLHo8V2hJyM7G9a5?=
 =?us-ascii?Q?+1lkcMTcEPmgtYHTjheyZB+cyC2dSiu24uHKP5cxetuaxrTg5IghuiWc0X3h?=
 =?us-ascii?Q?KlSrJv68p+j7eT20paqQ9Fa4jjTmuMr9gNAaNjewPHYMoTctp7B3lHbBcvP0?=
 =?us-ascii?Q?RiR48dH//uzYPgEI33KJ1Tvp77d326Nt6Tormdz8N0znT2BE6v2my9ihm6LN?=
 =?us-ascii?Q?qP+ujbdai7OHx20O7l2fvMhl7IgvQA9gV5USCRcGQWJZ5/WDxcHGLmIRcMN7?=
 =?us-ascii?Q?XwooYF+bVXE1TbRUlNQ77rUXG/vxLoatJNyg3KG0vgw1OLrMlyViRk/7Ow8i?=
 =?us-ascii?Q?9zDAWLOOBEimwxV7CKz4c/FF8PI+nlsxPdXdi5qy81hH3cN+2lKbJvwuYqWi?=
 =?us-ascii?Q?b+3Q6Et0dz0irrY+g7B3lXSL4wViNls/BBcbV9vX+7VKSvRxexmJBKYxnwXs?=
 =?us-ascii?Q?TMzX4POIIwZhg3ahgJrJsria1gctAyqsks6ng8F6gl+nujZfQnzM7O1NAK/q?=
 =?us-ascii?Q?Wf+TCxohIfhxIC2tgUAjUtm3NJRiDo5Jol/kiUlDXanC6+AC2BeKAxqGCgA0?=
 =?us-ascii?Q?VaMIMOm4FaJ9aT0N98cvZ4ljoYYPVFBVpdq0FEYBCajjkQFSfZU93vA5YYI5?=
 =?us-ascii?Q?OgMyZ52KEzErCbiFoxAooEMs2jpWApG6ovy6SVcWgjuovdtOXb74eRjg99Cb?=
 =?us-ascii?Q?0TM6+ACu5HqAj5eq05sJ0cMVi8eH/w9JZKyzTMmIObJa5SlOZidmQmuj/lxe?=
 =?us-ascii?Q?LFGWjbWVlybTMnT7RAkBG4DHwqV2x/S3HNub/hvL2Tx0J4xB7PEwjr7JMClL?=
 =?us-ascii?Q?/BKa0YdZtfl9kvvjikY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c1ef96-3b9e-4e73-d460-08dd0d74fd0d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 17:17:07.0763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnkEhfyZfHmfO6QZuqKpzeuD6Dzu/PxU9Pr9dCXzOSqHqHVQtwg100hA0zyky1th2KfzZXYUlWj155Xr+UdQ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8338

On Mon, Nov 25, 2024 at 09:52:43PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
>
> Return -EPROBE_DEFER when dma_request_slave_channel() because
> DMA driver have not ready yet.

wrap at 75 char.

>
> Move i2c_imx_dma_request() before registering I2C adapter to avoid
> infinite loop of .probe() calls to the same driver, see "e8c220fac415
> Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()""
> and "Documentation/driver-api/driver-model/driver.rst".
>
> Use CPU mode to avoid stuck registering i2c adapter when DMA resources
> are unavailable.
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 5ed4cb61e262..ee7070ee9e6e 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -397,17 +397,16 @@ static void i2c_imx_reset_regs(struct imx_i2c_struct *i2c_imx)
>  }
>
>  /* Functions for DMA support */
> -static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
> -						dma_addr_t phy_addr)
> +static int i2c_imx_dma_request(struct device *dev, dma_addr_t phy_addr)
>  {

Not sure why you change "struct imx_i2c_struct *i2c_imx" to
"struct device *dev"

> +	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
>  	struct imx_i2c_dma *dma;
>  	struct dma_slave_config dma_sconfig;
> -	struct device *dev = &i2c_imx->adapter.dev;
>  	int ret;
>
>  	dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
>  	if (!dma)
> -		return;
> +		return -ENOMEM;
>
>  	dma->chan_tx = dma_request_chan(dev, "tx");
>  	if (IS_ERR(dma->chan_tx)) {
> @@ -452,7 +451,7 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
>  	dev_info(dev, "using %s (tx) and %s (rx) for DMA transfers\n",
>  		dma_chan_name(dma->chan_tx), dma_chan_name(dma->chan_rx));
>
> -	return;
> +	return 0;
>
>  fail_rx:
>  	dma_release_channel(dma->chan_rx);
> @@ -460,6 +459,8 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
>  	dma_release_channel(dma->chan_tx);
>  fail_al:
>  	devm_kfree(dev, dma);
> +
> +	return ret;
>  }
>
>  static void i2c_imx_dma_callback(void *arg)
> @@ -1803,6 +1804,13 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	if (ret == -EPROBE_DEFER)
>  		goto clk_notifier_unregister;
>
> +	/* Init DMA config if supported */
> +	ret = i2c_imx_dma_request(&pdev->dev, phy_addr);
> +	if (ret == -EPROBE_DEFER) {
> +		dev_err(&pdev->dev, "DMA not ready, go defer probe!\n");
> +		goto clk_notifier_unregister;
> +	}
> +
>  	/* Add I2C adapter */
>  	ret = i2c_add_numbered_adapter(&i2c_imx->adapter);
>  	if (ret < 0)
> @@ -1817,9 +1825,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  		i2c_imx->adapter.name);
>  	dev_info(&i2c_imx->adapter.dev, "IMX I2C adapter registered\n");
>
> -	/* Init DMA config if supported */
> -	i2c_imx_dma_request(i2c_imx, phy_addr);
> -
>  	return 0;   /* Return OK */
>
>  clk_notifier_unregister:
> --
> 2.34.1
>

