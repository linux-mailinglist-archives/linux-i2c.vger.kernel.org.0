Return-Path: <linux-i2c+bounces-11048-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E59E5ABC863
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 22:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E04E51B637F8
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 20:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37D4210F65;
	Mon, 19 May 2025 20:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QdhmB4d1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2089.outbound.protection.outlook.com [40.107.247.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAF12D023
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 20:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747686549; cv=fail; b=Njlan3APrRsPd6FxD/+UACDGN7GpwPA4qicsgq4hP9+wQH0S0EHsrnZQGbMaRF4Eenalrs5RZ+XIZQm3QrR+CcF4ol9cEcKeIoSWCj0luvihoBnoxbec/c2G4GxseN9PZdz2ruiqtmX+3LkoP9bmKtLz9ijPsQeTuBmeibjxuK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747686549; c=relaxed/simple;
	bh=xTKUG/hiYeGho9JGNOve9bHvpuLcuufDxRPydnVMznY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i7pnOZqexQnzGjdMpm0hNev582ddPovkuVkRhDQmBjj3Czen5X/gjR+++hN7/uvg9fEcUEHTAGwoosXZTpCvNsC9NehCujXlbd3sdzTmYyaZ/Gom/K4xkucOZRRlRpNo+Hcyj3psc05SncuYtcC9x2c7oUfLDrwAaiGwVdj/HMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QdhmB4d1; arc=fail smtp.client-ip=40.107.247.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLMHeyTp8/Tim+yqCJJGHBaQe/QCorDphQcmrYthSv84kT3AQV69uf7mzpjjz5nU/0W1xCRSC3ZFwXAcMmjdqtLCRp9jivrxj493xVxi12/dPL0tyxLH6j5PaY5ULbhi0Kw2kOxWC/LZFr2mwUnWJxVysSrBoKBUCbjfLgjYzelgtI9R137w12RMi7Xw8yK/9j1ug+ws1V5Ew2ydoCmpL4yGxImFoqwqSB6ghZceSpD8vZe2dQbYs6jzjcMrYx3hHsYFNiptAOeBl3MQBX9nbj2ESXcgjtp6rpa7Pcat4AfHK7h40LrZHERGZilPvpgCLZ2Qm5d8hPbOv8VFI0+cDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jusq5HweY9UKHPpd0J6gxBANDSuG3IGkOkmRm02zxmM=;
 b=IgcrvTEEnUwG44U+3Eyf3ZhE5sSbyj+BW+6AyTuEZiLhR9nXnatYxOL4Nn2c0/M3D3kkEQAlnF09ew8QfdkuAJj3MQiCr7lftboGSCTcgkXmuHZAxu+A7eScoDCCqppNqr+cpDc8rzEvsMEgjNE0DroY3uCsq/VwP/EW/ZwXoxcpPOKUlAMbulj4OKUP0nKm5lfRs474ITqBiN9C70g3wA5jkQgL8VOs5Oxk8oKQctvv7U38JpeHye1cb2AA6oIkea3ltorVQu0/5bwZ/VCbz4VhwBF13O3GRlO3JzjXVUfaj1YBPrkFRWxfxNedbUI8yVQzd+xLGNCzmv/o5lxd8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jusq5HweY9UKHPpd0J6gxBANDSuG3IGkOkmRm02zxmM=;
 b=QdhmB4d1n5WoKYCIl01KXqIUIpZNsgkOtCdOfWyKtxKzk5wxgnFtFG/xbCNZonffMMImsGNjo1H7t6h0jP+QAWzN5MeU6i2xTJMLSdKcQMpbtdHF22aC0e2gFcITKoWEEaDI4nQtyzV1aRHhxamjUJK9iXeD8xLs7TRECrskFuPloWreu04qf72MClAL2nAnVLy1l6OLdOMQzqrXd80QMSItCVu4Wwz/dgK3Tn9IRIhVeNAp2sFqndEt/rbKUq3NP1zSk2QIGQRE2XFItIsF1XofPpF2ELAsDlZ0iSDaFhiUVN9VhzVVJ1+wxo8oeDipLY2pLu1tXa9VrptIDFH6mA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB8107.eurprd04.prod.outlook.com (2603:10a6:10:243::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 19 May
 2025 20:29:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 20:29:05 +0000
Date: Mon, 19 May 2025 16:29:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] i2c: core: add useful info when defer probe
Message-ID: <aCuUjYsHuoe7N32R@lizhi-Precision-Tower-5810>
References: <20250507102714.3535412-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507102714.3535412-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: AM0PR03CA0097.eurprd03.prod.outlook.com
 (2603:10a6:208:69::38) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a2bd1b0-45ee-4da4-55c1-08dd9713cc8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QANKC3JrCmPd4J5yfAbzQCWnp0W7b2QkX+0HVUNCWsnFjmozw+5W8hl3Ge3+?=
 =?us-ascii?Q?BOAK5aPT8lurDb4Pma6teXD+BcODNOrPw4K1Y/psW3DBavcrN3otQck1lmRQ?=
 =?us-ascii?Q?3zGI+1OFeYf6MZgv0UaOlWGm6MWKEE0E6N3eP+mfP7NOcrx1LHcGPvjbUTMl?=
 =?us-ascii?Q?5LFmnGmGD1WheHr31iQFjahzUwJ9wKudBAW9G22Z4Pb2mcizfVJ/4mlNqy2A?=
 =?us-ascii?Q?l4aQ2/iNB6vB9Sxuyoo5y/FcfbQMpoNUnGekQ91TiO2bNSPQTpKoblJh9dD9?=
 =?us-ascii?Q?mtBnc7SJdUG2by2wDEqF/EB0+JkMaZXZNZk+bGTLiw826mhgJip/o7jERtMf?=
 =?us-ascii?Q?w0gBl0F5L5GU/z3Jyge5XEg0mvzZRvtwX6lHf2yyZsHCltAQ4wTc3wB/rRy2?=
 =?us-ascii?Q?aliNN4Ys4ZBZEK7ISS5CxYKAZuYgqvDFGgs+zK4pycjtDbP9J/Elzg0pqpvU?=
 =?us-ascii?Q?bYWtHJyCzF5OVae9Vywjr9Uv3VG0FogbU6DwPtjh8OXIA7e2CnStGMGOi9Hk?=
 =?us-ascii?Q?jKaglTWXGNfMFbi7YNfzpvhaW8mIm2om8XAEuBN5NwA2/BvD5qm8rS6PRd/F?=
 =?us-ascii?Q?nklq3tDojW4/lMhzBgLTYZq6dKPVRzDfymQ+nHoiUojtoOipGXzmQqWDOmtD?=
 =?us-ascii?Q?WV7XJZuEw/e+y79P928kd+/TfLGY540Rdaow1R0DzO9twuMsHA+DZZkpLUVJ?=
 =?us-ascii?Q?3NovPVLNcnqzKMxO94AND9o9lbR7pGtxUFLU7gMz2si876j1Zghn4Df8n/+W?=
 =?us-ascii?Q?TMfUdUG7KB0/fOfa5qqBQ+qQ2bkIxMO0YyY4zdHIk9OHJ+bOQC2edbx2+tpq?=
 =?us-ascii?Q?WiBzzC3lKsnJTq2XLnWOp4AWEm3anC+oKGCiNGC1OlRL5nmpnqq6RFI5TQYI?=
 =?us-ascii?Q?jlzWB4P0OdHSSZ5Yx/NgXY8OK+GHkj+GKI3XB3V+GIpeq+85Vjj2aweQor63?=
 =?us-ascii?Q?M5sSll1m9mpGSt1jiIx0Ka4ZczUOjpdiizhlwkhipTkJbXNvw/wYy4qu1P3L?=
 =?us-ascii?Q?PGEiBs6aXOXymSB6VmhqBcDrIYOs1GraPIMMgs3bX4eCwQjyliDj6o5YGCnK?=
 =?us-ascii?Q?BrH7lgBDnYdSPKHyPPoLIffCos0WxNg14Q2x+RksECBG5sA04cSda15AHqTp?=
 =?us-ascii?Q?HpOpjRs4GFc5tXuLApHx2bU6wjZlEcq6e2gwydh1hyLpV2Xzl6VNQc/23CcH?=
 =?us-ascii?Q?wyrPqOtpeUTkxSkgMdtceyx22UfLCTs2suxc3jSnfZldDQOewJOK1hZjjjua?=
 =?us-ascii?Q?bGXXO3TVkO4oD13kmLtN+FRNsT/wg4LXI+mSMckpvywde6rruI1hzWWs5lcW?=
 =?us-ascii?Q?yHLwZkNqag1S5T+mwiYMqBS65TemiU73+RXQOfZ6g46SUEcOIcdNmS37oNcG?=
 =?us-ascii?Q?AUP8XUykVChcnh4HmNVY0xCBmLDOpR7qFD6qlXhf8GLN5YRNh/kGcRoduv1w?=
 =?us-ascii?Q?RrePXxo2YJdMKkrbhIS9idYsz6SuRno/VKUUhPFZPJJOO+eogdXczw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mATo4keFx6Gg9O83DChf+s9GXJtTo/j3rnOS0DGn1lwAfNtSh3ZLcpE5YPtb?=
 =?us-ascii?Q?7L6CfKJavJOPCq7sAol1923i7bugJ0Y+7/o8kLXJaTbQ3ABIjiqSgDRB5ALb?=
 =?us-ascii?Q?SKXnwK4VKYV6RutfnxlMcQB3rGguLeSJPeYoyWh2iau0ETguYx1krEi1J7si?=
 =?us-ascii?Q?nAvk+rcko+OTnRCp6/8q1ryJ1rH1DGH1bCLVSjUoj3B2ZNWPomgKHhxHCjGU?=
 =?us-ascii?Q?AODw/ae3cCFhZe+kPz8j4rBKKgLn/vFsNcyfByspv3XHI0sKdg67Y2aLfrup?=
 =?us-ascii?Q?W5C3HUuCUsdf6nljPiZ4XG8xprA5cNu1ZM2KmLoxg+oKiVN6xUpPKfECbIeb?=
 =?us-ascii?Q?vE2NZoq1BDFZ/lO6TqVxz5h9STvmnptPTcN0rV0slOK5EVTqtuOTep4dxBjW?=
 =?us-ascii?Q?z063csGKd1uOdN/rccV5q2oVatrzZ8OVbsuu/5hO773F7NoNMnqHJxdZ+eo9?=
 =?us-ascii?Q?TSWFCCHpM1ZLZjHD3ydl331/wvddFw48nbElaTshf8pLNTW1yNaTFBJmZIse?=
 =?us-ascii?Q?FZ7UO0v7Syp/lEQPiFFvdXKs6HSovc09WJllmW7bY7mkfndUvyYWwfs11w1K?=
 =?us-ascii?Q?l1w7kxLdIjis7WJ8kDcz/sPWzdYZAue3jUVtiu8gbyGpi8G1gzZjJWMUq9QC?=
 =?us-ascii?Q?zts/hqCPNa0tSYvJLrYvWFAhn8l+0fdLD7vNy4xln0c05OCrv9sUyEyyUxTA?=
 =?us-ascii?Q?ednt33DxxwmXM36Mb6zy6ea6GC/X9NWRfsOzgTiqKP6qn72oH5CjIyk40A/e?=
 =?us-ascii?Q?SkSVGEm6VnuB6a7qLdce8Ju3chFmbmrhiA9+OspRACR4hVD/G4lcQCAdO9o3?=
 =?us-ascii?Q?Dw1oXPTqp47/pStSr2YHAx7eigKj7faqc1m3iNxksgeok+pSuvFPLj+21wbY?=
 =?us-ascii?Q?7IEIK9nsBNLiBytxOySaRYBoLW1vL3stCCjQGOEeEUWlD0okFIBhJqe5DIpx?=
 =?us-ascii?Q?H59NWkqrdm+aT1Jt+0XlREQUBJ3e1O/1GT1Rk6SgfRhNye2YAXGczOcPtmVC?=
 =?us-ascii?Q?Vb0XSxuY5Mp1Gx8RwB8tK0CmnLzyhvB4RFl1jlWJCKBL2/lwGVYNYb3PHIZg?=
 =?us-ascii?Q?+wvYjOmBh7NSLOvUAPiP+WxGS16QOLriVA9ju63QwBKJ6MI8XmIhoW3ysNUt?=
 =?us-ascii?Q?fiRJ7f9qDAgPAglQG6bd3hagI6mFV5e3AWjuckMSqFUFDAbOsOlxDKw+vNyq?=
 =?us-ascii?Q?CGgEBKfDczogY97f1hGMINqNrheouifTAcchYIn/4/VF12VccBFxxTqg2GhP?=
 =?us-ascii?Q?LJn1rr9EfWjkL08xLtOjkOnQxqDR0qwB8azqGuMDWYvAptmZAoZv7pogju5M?=
 =?us-ascii?Q?GqDcPtAG7TER3FGPqJhqcXEXkxX9D48wzkn1UDDQAjYZ/EuTX3Nv6hnRRDiK?=
 =?us-ascii?Q?R1ABNGp+X2yA1ru8T9kmIawbRutWSycuXl7Y4zKqptnWB3zykplFt9y6JuDB?=
 =?us-ascii?Q?4bLDhNJkhNynLE0zzkehA5XAIgcI83PQAznMFVUHCLI+Q1M+99X7stX1SNPd?=
 =?us-ascii?Q?P7U7SQkf9g4MTordlfwmk8e3ypK4TWvc/k5Y7e99PgqK/zmvHQQSl57Pnolu?=
 =?us-ascii?Q?4pFCfK8mfiWW/IXsVWpYkzmWEmDH+cwZ+/474Qme?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2bd1b0-45ee-4da4-55c1-08dd9713cc8e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 20:29:05.0356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9h3Z/e3aMhpdOo3tJfoIphlTkLB+0TAx0jCFOQMYKHK5DBliXTsbqUbUx0/Ja08Q80+WSTuFPqcoxzEmmKu0Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8107

On Wed, May 07, 2025 at 06:27:14PM +0800, Xu Yang wrote:
> Add an useful info when failed to get irq/wakeirq due to -EPROBE_DEFER.
>
> Before:
> [   15.737361] i2c 2-0050: deferred probe pending: (reason unknown)
>
> After:
> [   15.816295] i2c 2-0050: deferred probe pending: tcpci: can't get irq
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i2c/i2c-core-base.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index dc3c60a7d382..32ffd12bff9f 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -520,7 +520,7 @@ static int i2c_device_probe(struct device *dev)
>  				client->flags |= I2C_CLIENT_WAKE;
>  		}
>  		if (irq == -EPROBE_DEFER) {
> -			status = irq;
> +			status = dev_err_probe(dev, irq, "can't get irq\n");
>  			goto put_sync_adapter;
>  		}
>
> @@ -548,7 +548,7 @@ static int i2c_device_probe(struct device *dev)
>
>  		wakeirq = fwnode_irq_get_byname(fwnode, "wakeup");
>  		if (wakeirq == -EPROBE_DEFER) {
> -			status = wakeirq;
> +			status = dev_err_probe(dev, wakeirq, "can't get wakeirq\n");
>  			goto put_sync_adapter;
>  		}
>
> --
> 2.34.1
>

