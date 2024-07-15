Return-Path: <linux-i2c+bounces-4985-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4288693187D
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jul 2024 18:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF6541F226EB
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jul 2024 16:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35961C69D;
	Mon, 15 Jul 2024 16:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="MB4T8ulE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013001.outbound.protection.outlook.com [52.101.67.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5894E1B7E9;
	Mon, 15 Jul 2024 16:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721061140; cv=fail; b=MiiSdvDK2G0BsVEDOxkO404ezDZ8SqvcqRw1ISUUhZR5ASCXNvLD68JIReUXZnN/t5YkECbzZBENFxDjBvwdWMYbK7KRukUMogRAMufA+e9amVeCus9tsvpZ4R7xLCVK+Q6c8gd2f/mYOddV+oShGI+tecvNOUwmcoFKgScYRdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721061140; c=relaxed/simple;
	bh=ZbvcWqnpoDwLuFTigXeAGfwirZ+lgFsN1fuJtWEfCvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JanqsbSMU8S1YaC8A3fr9jWnwI99OgOjELP+9uYUEP7OBLL+hSQPFUvLnIvxWvUVRHgr2Yoxy0XBtGUzfcublKWPN7iLmJdHWxvkmZhDWM6OWLHWtKuXPnykrOUmIrwHCGF1blgNrI1WAFlzK4zF5d54+62NyDYVBO+gI9iNbY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=MB4T8ulE; arc=fail smtp.client-ip=52.101.67.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2pTJZnOh8eYz9tqIFojZNRev8K22bRo9oKtfumFpXM4s2Xf1pS8wTGtH3Xy9UsHrzJpcJXJ7yRUMprylICOUtUIzurp8F18Ls9yvD6SACkodLwrqbKFLJc0+9MDkKGhE8V4oI2e+GBNXoUO/6Ypt0HXkkPH6nNlVml23rmDMKx67MF7ILtIrjIaJoqA3DxctJPH/PQZOffXRyi5VZZea06IaXWau3GrHi09g1B/uBuTGfNHp/C1JT7KN9tlaLyzuDH7EUE8RkG91xcrsgfom6Dd0oYNtMXR/oqBeH59OzYj3x+TKYF53vmo5AQhf3d1kbzI22+zBobimHhanOOBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5hL2Tc5m1fVt+a2y7VlTRHbLpuOMjoKd/wHJEahkWw=;
 b=I3vc7WYK9ZzcubNxuXD4SUCYWwR4nQoezqZEIGv4jACWBzQ2Bts8w8YvtazBWPA0wTVMqI+v8B45lcaEmuangTkUrQIZ7LMdbHtAepTmHImpoVJaGDO78wO4yfDfpKcnGxBKM0dJex2pQ0TcXp/m6qC710YA2/ZOsZkmoWz5NRTr5tBjL8AmpepuU9pim/6jNsdGOgasP2t8J10JODf2iE6BX2B6fMKy+okEE4Qe5/u64XCgoV2jlr9thKRFidpGozyI2OHlSLy+zK0Z3haq194E34U9wndFendxu164FcJv23w1XAaolI/b7HYW9nzcG7gzqmWxwtnbYXJfClTeNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5hL2Tc5m1fVt+a2y7VlTRHbLpuOMjoKd/wHJEahkWw=;
 b=MB4T8ulEZ2ekUwfj6EscMbuZwqsuzB4TS2D0j1l16Iz8hvypJt3SSw6lfaG3X+1EKO28aX4TcFkgq9ZR4qB5WnVkqR47cGSBNnoHB21R29PCY5u9HEhQJU3SBa4gRbjGdH1aP8UCenGUESlccBg+B1v6SCYBdof+TTwyZguweSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8168.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 16:32:14 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 16:32:14 +0000
Date: Mon, 15 Jul 2024 12:32:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	wsa+renesas@sang-engineering.com, francesco.dolcini@toradex.com,
	joao.goncalves@toradex.com, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 1/3] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <ZpVPBEq/ZHv9r5YW@lizhi-Precision-Tower-5810>
References: <20240715151824.90033-1-eichest@gmail.com>
 <20240715151824.90033-2-eichest@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715151824.90033-2-eichest@gmail.com>
X-ClientProxiedBy: BY5PR17CA0026.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::39) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dba655e-cc90-4a4b-1c25-08dca4ebaf40
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?tmK8Sbilehsaz4mm7IcVjzxNOgwGySSMz8Wn8pcJ9h63LNYAwQxgk1gMRR8J?=
 =?us-ascii?Q?80QT16yh04aICl5lXFkCN4q+jEWG2XlDK7ouJ/rHf1zVP1Fb4tQ7es/rW9xb?=
 =?us-ascii?Q?MLGPalsZiheScHlfk6tBtGQCdlrOmaFSoGD48s4wQUKP6BimDpuy1mLeUC9s?=
 =?us-ascii?Q?R2zPNp/4UcH2vjS/UunwQy1a2jjfhkIjkCi4AEYWBa0bV3iwg9Dz9jZymZn1?=
 =?us-ascii?Q?FPrCU3ZIXxk1xcUV6Fb6xC3EiE4fXyPxrhl1VJsr+zF/aAOb48sJ+iL6uBm4?=
 =?us-ascii?Q?9QsA+1xc3KrD+ShM1gbo1EKhlHRGMVeZkRyaw4KESiepqLEmuCeG1Ad53O0k?=
 =?us-ascii?Q?9EmiBnH+Asj3mTcOjH/n1QJ1SyCnG6IiN1jlDfRkZm6hD+YqOlBDASo7aS0X?=
 =?us-ascii?Q?pv5eJcyaO01yOjqz5qtLR+1TJBBRWDE7p1/YvkwkQ4kiRGbLZifzQWGQi5yu?=
 =?us-ascii?Q?4DWc1YqCciEGB/l0FslL1PvYTm3B4twuLDg57LRciS9hmmn4RFiIQ1flPJoz?=
 =?us-ascii?Q?IsrzJBcusoIlTlshE9CP57DfglmYFV42oypWDlsUE0CKw+M8TfBz/cqgh7Nc?=
 =?us-ascii?Q?qUlXqkTLSioowfVHsw1/HnaFWu5L8J9qcZhf4IUVAvEHaHyJ76On0rGiHujx?=
 =?us-ascii?Q?FdQG21EHw4WTbsIPe9Hiaz2o4xw9I1c4c1sMAXLN41v5MOVws4fD2O9KKGst?=
 =?us-ascii?Q?r+jpeGx/JeNSTTO332CpY5jC7Sjx6+XMD1SpUuc6PjfLMXM6mzlDm2hQmWOw?=
 =?us-ascii?Q?d0BThWbD268EnBwWiOFW+CzK4ml/nO3X25cY/1M/WqlAzlEAYeRgny7hsqOk?=
 =?us-ascii?Q?Ac+NTbQa8YToy8/IrsGi+iIpDwS67UX038/rS8Vzs17hDsSIy8lNVsbiafKf?=
 =?us-ascii?Q?zAT7gHJha3qr4uDiULMpF04HYSXABUORcNQ1+BUk7FUXTirVfZDUJGyM5TdN?=
 =?us-ascii?Q?xc49CNiGDlIqRyUxoz82MBQC89g24ctf+zkNLUcX4C1SGjIs2uYqBAhA3XYs?=
 =?us-ascii?Q?BToRqlHie5XMSFqgOPzD5nv4mI/p6PvwS52qXixE8vtC9emKXCOUBhn2Uge1?=
 =?us-ascii?Q?JvDRdlC4FfdigOsoIZw2N+FxRtpgFGfB9SSSaZQyEO2fMojjgNvlruD06g18?=
 =?us-ascii?Q?R0m1bBMZ8lIhGPxZXziHxt2ST9P8jOloeKYzOg1Abxy76uQmn+8GE9i2xUkQ?=
 =?us-ascii?Q?4L9EvAExCDpanOGIMnN605zR98HXpjkBDNPSw6ZDrgigYC+Y5S+yxLTxXRdv?=
 =?us-ascii?Q?qTbI+EOQhk/U9ukqiH72HnC3ZVATPnnumhi4H7akCzhOV8I99yO2dG1ZbV6E?=
 =?us-ascii?Q?U2FxUXU4kx1mAoDFD0gSl6s0CHMPs+ACGVIjFWRgLfL6oYCqi78U6ZRGgAFn?=
 =?us-ascii?Q?XfhquCTZ6T8prLC5Uv4WJSDUTGuJPIjXTmvnHdxU0JlSUbl2rg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?OAEQpJMEn/x+d8p7CqlXnfa2tTcAt1E8MzyRKtvKWyHxCBHX/RnmZDPPL46o?=
 =?us-ascii?Q?IR7KoccjGsXFJeeTHdcOUe8qSX5xFEqwbydguzU8UvOrWPTluJ7VXXlZNAc+?=
 =?us-ascii?Q?8r6KfJIUlA2aSqjfGDk6dRzb3C4s8UfTzb8KHzYk52Uuw3tw4AOwVPa4U0GD?=
 =?us-ascii?Q?wzgKV44DKPLzswFP+IddTdn5vR+gHT0VXPi70JbUsxIx8L/c+VnbG58vdqjR?=
 =?us-ascii?Q?KR4nkbcOmluayPRqdXi0gfy55XKZYeINKC8HwDI5nZzGpjlFMq4yCEXeJSa3?=
 =?us-ascii?Q?d/CKxoX6csYWAsilZovBZ36hbZLkuVU02pLw738z+JvKvZ/hl5SC1EaYVLQO?=
 =?us-ascii?Q?JQqCEQeBMaiujvxUaE/sbc89+CAVVqqhdnQ7jJP0xBgLzxzyjOQy2FMw4bUF?=
 =?us-ascii?Q?XZpP2M5aDr6QJP8zZ3YtFnJ5TcKKqG1B10ZccYmOE6ysiiHDZ9mzHxVafgXi?=
 =?us-ascii?Q?qIyd1b9mRgZd9KMkTfpmUhpHRd0SpL13UyMLsLFgeBfvy+hggqeoOXhWnEzy?=
 =?us-ascii?Q?r0fxMpllOyGbuY2mwg+tNphYmjEUQeQJNDP7EiCT5VpqIpJ4FKhFhSbLbGjw?=
 =?us-ascii?Q?IJJU1/VEvB/f+itgkfwx6MWfj5SpR134Yes918BsciTFIPPo1O+QGBD54YhY?=
 =?us-ascii?Q?H8gVQKJx/hnKgd5HbxQ6Otm72JKknaYPlDnqlb01LyJxYB8tb1YKI9qcrdKM?=
 =?us-ascii?Q?kG4JRZLu3UJkVHK228d27Bo2kNWHoojpSvKGIDZpY40mQHDRKSsNwlmQiTdX?=
 =?us-ascii?Q?+Oh0yOWiv0qpBqickOA852l7ZzZFOgeYDkoz7kcJp0MlIK2WubwifMDrVe6C?=
 =?us-ascii?Q?x7kDXwDel43C4vcK3CZwhh1NZUYiSEx7ngudJfSx0pVxlXT1eX8NX3BOfBbd?=
 =?us-ascii?Q?vZS0/MCz6WFzfN+oIFSCS5R+kkoFEOpQWykfhAnNnalCujgJN8AjjvoKRckn?=
 =?us-ascii?Q?56oWCPDro1Zv3Ds+d7OO+j4FPPEn/Xwz187wby/9DHLbX5BwQsjc6ndKspm6?=
 =?us-ascii?Q?/nWGbpjF3/iEysEt7krT12HPd+1IMZTZaAoTskTzJ2qKQ1bWLTNVYr+UHRdv?=
 =?us-ascii?Q?Y5zZaMawYyq6f4S3lZJO1qhiRntU+Jaiz9ZwMAIxyyq9LwnjNVyH8EhcvoYV?=
 =?us-ascii?Q?zEB8fw83lKY3FY2bTVV8AiPl0zibOB27aKb+wkLXy+aqV/x9tSpmfuf97DdD?=
 =?us-ascii?Q?zjtYd32/IFQ5LfPUTEBIgyRyMWBwRSZId156RK1QDlQyZEPI2Vs95cTmjnvc?=
 =?us-ascii?Q?QAaOYYdYe8Sf40LI4fSkQ5qxfCXgRckR4DmIvYNwxayMwu6LGOihPpkkmGOp?=
 =?us-ascii?Q?7wmTB80yIFcS+0XWYJp87ZYVch8Sxz4QEvMBDHKsKen75ei0IlBWaNIBigtt?=
 =?us-ascii?Q?+f342674vAcrUEZdONZ6euZQ9i6vnAzj/C1JPZoDYN/hadBkmymRpZX1lI3b?=
 =?us-ascii?Q?TCOmYj2UhtgbXv9MOPfenDVpb6Kkl1nmKouNeRKR5yVVTkuisF1qP8IZYYc1?=
 =?us-ascii?Q?+S9i3Lqeqs1c+kan+Q6H43ck/RFGu16W+USZaXARrowJ5sgYCTpewu9YwuG4?=
 =?us-ascii?Q?dVLBZNUgnveAc3SiFhQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dba655e-cc90-4a4b-1c25-08dca4ebaf40
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 16:32:14.6685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZg9bXpjDctN9tRbxRlyNsHedLBLGTqKZAvsRClBxOuo7tqbiCRptbHU6tcBUngLLeeo1AkMTexnS7Hb0EP3gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8168

On Mon, Jul 15, 2024 at 05:17:51PM +0200, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> According to the reference manual it is only necessary to poll for bus

I supposed it should be "According to i2c spec",

> busy and arbitration lost in multi master mode. This helps to avoid
> rescheduling while the i2c bus is busy and avoids SMBus devices to
> timeout.
> 

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 3842e527116b7..1add946e3bc20 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -216,6 +216,8 @@ struct imx_i2c_struct {
>  	struct i2c_client	*slave;
>  	enum i2c_slave_event last_slave_event;
>  
> +	bool			multi_master;
> +
>  	/* For checking slave events. */
>  	spinlock_t     slave_lock;
>  	struct hrtimer slave_timer;
> @@ -481,6 +483,9 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
>  	unsigned long orig_jiffies = jiffies;
>  	unsigned int temp;
>  
> +	if (!i2c_imx->multi_master)
> +		return 0;
> +
>  	while (1) {
>  		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
>  
> @@ -540,8 +545,8 @@ static int i2c_imx_trx_complete(struct imx_i2c_struct *i2c_imx, bool atomic)
>  		return -ETIMEDOUT;
>  	}
>  
> -	/* check for arbitration lost */
> -	if (i2c_imx->i2csr & I2SR_IAL) {
> +	/* In multi-master mode check for arbitration lost */
> +	if (i2c_imx->multi_master && (i2c_imx->i2csr & I2SR_IAL)) {
>  		dev_dbg(&i2c_imx->adapter.dev, "<%s> Arbitration lost\n", __func__);
>  		i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
>  
> @@ -1468,6 +1473,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  		goto rpm_disable;
>  	}
>  
> +	i2c_imx->multi_master = of_property_read_bool(pdev->dev.of_node, "multi-master");
> +
>  	/* Set up clock divider */
>  	i2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
>  	ret = of_property_read_u32(pdev->dev.of_node,
> -- 
> 2.43.0
> 

