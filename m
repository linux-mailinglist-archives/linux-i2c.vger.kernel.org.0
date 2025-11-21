Return-Path: <linux-i2c+bounces-14207-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 550D0C77261
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Nov 2025 04:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 14D654E63A8
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Nov 2025 03:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973A42E9EAE;
	Fri, 21 Nov 2025 03:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NPHiII20"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010051.outbound.protection.outlook.com [52.101.84.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B853A27FD72;
	Fri, 21 Nov 2025 03:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763695243; cv=fail; b=XEqdKHT0iCE7+OU9hI5HC28bQ4jiI/lZmvW9kyli+vQecPCcLJODwuKLH9B9+RAYi6KP2DZEDJGKhQSjJrVVViKCe+/HVTfALptowjuSDcQ1lPho8H/8FbonlRqA3Ne2p1ZZ9XfXM92OQ+Yadlrgw+7QH0RsYrJGjU8uTCGR68w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763695243; c=relaxed/simple;
	bh=ZkjImVRUjavB3DH15j8TVBc3P+5qRTv99zGpeyU419c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uCp7fNJygtN/jqoKjrvxmkTSsppEXOpPMn+GmdjXapPheu9YbUTldho2yOzWsW5VGTjEZGA5KU53B9CHgYooBFq+prtTBuaFPW+dZmqlYti/81Cw5pf+n2He+MN7eGfXlD6AC/R9LOrgtiTbbGZPs4/xbeY5OEGnAEi/H872DwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NPHiII20; arc=fail smtp.client-ip=52.101.84.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZr2IIO2gXKIo0KvfMgP7GFciwC8tC45WVH0XxOhl+a3t5xgWxEiDqqZZ+YDMeZGvGckp+cRYExaUCqkYdVEhH9qX3rV9r/kkSI8LCok6B/Svn+ytseysCRFP12HN48fE7o4CX3A75mscN+evW+nrl2A6j3PgwEG83FAKXFrXI9lqKTqcE5vtEXxg5m/h1QZGat7+Viqb95RFkBWVG1nATnN4m1FLHtxbXzV6Gq1KHpH4DdgYJED7iOaKZ5nTeF7I72Ssbk3BtlKNyUlLOS3TJPyJOcKVzEoXqTXu9H+KVDqeUENoinW1k193x9vPneEo8P+Sp6z1CKuwn9Btyg8QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1TNcOPu2w9PyKAgIShvqjT14XkYELtaCgdNgaZdBuk=;
 b=OwbRx8ULJVxVj8DhBGCbrstas5SGro5ct5H7I1fsBbFZtqSpbJWTxPOnBeQZsoommcGC5c1nKjDugjPF7EnsrwzhFU3g46V1NzIUsrNt2UrQczAC1bl8HpSnytjVIyfTgrIsmGIlRfQvWF81B5y8hmUFhv/TzMbOq1eqlDM1zxAJ21pVqsQltkDrID7T02YaTPkruqEdp3hS5xD86q/wwT72UuUJvj0JuxxvJiz7POMpdGrKsUi34VGYNw8oTwSE4+P1N++gyjfEmZxfzOiLndw5X/501xuBXulFs2V2c6bPf9tbP2pR3rglrySoKypNYzWoVQ17pQngVUdYvr7uiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1TNcOPu2w9PyKAgIShvqjT14XkYELtaCgdNgaZdBuk=;
 b=NPHiII20UWB2tWgXzGOBmEBPz6Vy76s3PU6pUZb0/7xI1DeJQmHQ4mamNiUVzlTJz3eIpWN/Oa/Gr2Z8ezeF5VpuHqraTDSWS4ZegV7wN7TXc2YXBd4FCvidDkEdfJTR/b7Xrk6DdNUFcj7uE6OsCx/g+E4KHUwcLHMdrzF/fDdaT0OqLtDdn5gtSsIZFu3jxGYDMdrF+y0TeH+WQvhCKoSGFPYV4SbT9bTgGzZ98CohgZ1niWZA98YMJHVU96y0EQPRcV4qvWBPDUep/QtgKngoipi/BFcc8RPbZ6C2CEN7IdVA3kh8BRSvUL6xlvGtICl30Rmj18o55oTKr1rJ2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI0PR04MB10592.eurprd04.prod.outlook.com (2603:10a6:800:266::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 03:20:37 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 03:20:37 +0000
Date: Thu, 20 Nov 2025 22:20:30 -0500
From: Frank Li <Frank.li@nxp.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: aisheng.dong@nxp.com, andi.shyti@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: imx-lpi2c: change to PIO mode in system-wide
 suspend/resume progress
Message-ID: <aR/afqVB3icwsDV/@lizhi-Precision-Tower-5810>
References: <20251121030030.1844530-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121030030.1844530-1-carlos.song@nxp.com>
X-ClientProxiedBy: BY3PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::28) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI0PR04MB10592:EE_
X-MS-Office365-Filtering-Correlation-Id: 929ca7ee-e56e-4593-554c-08de28acf0f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7uyRBkdBPYbzUMjKjOKNwxftCtrll1WGJE66VZZby/GI/vgsVo07XLQhGLON?=
 =?us-ascii?Q?PHapRJZkk9azTxb2IvbeIqHxokdFotPWFlBkQ2lT8nBHjAll8/lhgEI4bMiQ?=
 =?us-ascii?Q?8cISr9FfJ9BZ3CykiML6uyNqV6dbgke/BJm7RW1RzjdzVrLY+2SzcGfg8buO?=
 =?us-ascii?Q?W122szxPx/XZBy+Dvy4uEerHRBoUbU+12xaexRLuhXJCTWQ4QUDsvLfc1vjt?=
 =?us-ascii?Q?nnfDb5cFRBJdDIiYp+uIo+6uNnwZMHP2liCur/oP+d7ShU+ntPQLPsDa+NZD?=
 =?us-ascii?Q?gj+h8vIK/RD+UDK5AgkdpU/yedQdmRBBnOnEso9GLop8zUD2rbZibZIekP0g?=
 =?us-ascii?Q?n8wTJ/pAl0OQm0sRvAAsNMbNwVq222EDW/572aBU01Too4wyYfoURLmjbDZm?=
 =?us-ascii?Q?SYN/DqnrX54yGIe8//+dUH9l0SOteHrJGnpp1Cx1BmPG540KwD7JK82VZR5b?=
 =?us-ascii?Q?xeMP6P38YaVSSnlfcYfRuICOvKKotoRl7XIqXth08JbGpS7xMRSZWH+oE8wY?=
 =?us-ascii?Q?P8hf0+ip4zIKE8OIhiXV6v8ImYhXNXJMWpN3uLUMLtHcfYyzUR92HAp58MRP?=
 =?us-ascii?Q?s44+KMbfG30f6ghPECOYXdYyYZIu1YTPcE7YVEhE14Gy7XnqyGedZ+S0UGli?=
 =?us-ascii?Q?4yuHWu9wpN9GMmfLlDs1u43xzkGQRBZxJy/ew5liOvCpwnUFsyTU4ih9zwO5?=
 =?us-ascii?Q?yjsobFssyPRSr7km1zdrN1rosezswb930Bi4qyBu4rIt1/I0R1MJdoppn1w6?=
 =?us-ascii?Q?AcCAmw5/0jIPGbVZEdPDCzDxiCj9cRVCCOwlX7/awue24jzYKEplhSZ93rV5?=
 =?us-ascii?Q?pWRTUFokai6poS6H9CyAtHQWLDwitoLEGFud9zlRv4ojy8WedPX7tofhhyYO?=
 =?us-ascii?Q?hH0k+02P4roYZYmQ/XI20fyXclJv8/ajEVWi/MB6nei3O8eqfWpoMeAZVMUJ?=
 =?us-ascii?Q?Fk6ndXwtTr0vHLlqD7hNu7ycpcchZxUAXyK/onWp6vzxu92G8ywbCbIJUCaw?=
 =?us-ascii?Q?4CVeyGsTLWvVz75Dd+B2nnOPDox7HPdd/CeJny7h2f8SN0z+A84UPnx36xah?=
 =?us-ascii?Q?0eTxz6uujaFZhpwT2lCNpWHPg5tpFkwBNqtlWwrp9Nez0aqLIiktQmJLDXuV?=
 =?us-ascii?Q?FrE1em8Aen87fJeBN2A3D/RgqKb2kxST2CHQYzagWbMIKkI5wBQYoUec7HUk?=
 =?us-ascii?Q?C9lk/avcldKoLt/XV11kUSvhFsOQZEkQ0/yxzFGbJ/nR7ru5ISba1f1MAvA8?=
 =?us-ascii?Q?cPakHoUNh4xUbkmYLYaL77qlZS7Mxf6JanDO4MXTOWcxGceXYeFy4fB8JNVi?=
 =?us-ascii?Q?Mr6VuAWqvHsjLfcURhroliBvRXU/bcD4R3O6+4pziNEUw24CANpg7vMFwffy?=
 =?us-ascii?Q?csiTM8XOR3v7oV2HaS1EaZcE0t78eyEs78Crf5WbCtE4yRUiCXChDBwLQASI?=
 =?us-ascii?Q?X+zvNpFYpoaLD8QF08Rmx43XbmIThm0JKn4BU5Hlx3NPuegdJeZfh8X24xrj?=
 =?us-ascii?Q?TUW7j62kkl1KvSF6ZTdq0MreuofIJiOt6Zmt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mPBEMnju/0H6Co+X/pgGuvH6TPloXWADrOQsuNS61XYzOtKLtcZwSxSPl6Qq?=
 =?us-ascii?Q?5eynYTJ0g2UIr+iPKhZ0a3N622delztEJkAMlzSwcfEJm0tcmSlvaW0QdMUy?=
 =?us-ascii?Q?m4f1uxzWkBnMTv/J+y1+SnbPXLkWV0qN9SmWNWIO4NsRiJtnywuHcT17ebfa?=
 =?us-ascii?Q?JC9LsgR/3Wu/Aq+A7HCq7LwLFfC9aDb7hY3AOCQMaUmJnPCI8sfdfBLm4yPW?=
 =?us-ascii?Q?Ao+EAgOwQvUo9G9UQlRXqJNHN41WWL5xGVgR5y2NCN8QXz4M9j/B4yDqVZ2F?=
 =?us-ascii?Q?d4EJWJplvpNG/312g6PcCp9C1QaAUMZTKLjNN1NpPjmQaL+hI9xZB/r29fUV?=
 =?us-ascii?Q?xa+t7kCcsAxH4fPeVZ6Q4ve748glaGAEwLHQGxCkmihSSL61SsPSoqtz3nYq?=
 =?us-ascii?Q?hMRTh/l3YZB9SZZFX8jxQIzMH5WXCK9R1TGGRcVu22vWGMqF2YS8QGgtMKxb?=
 =?us-ascii?Q?giW0p7muMElUJl0N6NjPphuwE13ymUgnDW1qeNHbqXoDzqlV1Wh0MbpLV6Qq?=
 =?us-ascii?Q?cLqR+ugjbQ6Ne9afc/KGTK8bkdwloj772xBybhtSCwJ259rMIdX1tZysgQaU?=
 =?us-ascii?Q?B9CLr/4ppwlWyGOijWnMcUeHEcrFmtPFwhuAPhIqoQ8YK9GbBISpzRh6WPeQ?=
 =?us-ascii?Q?2srpqxvPVIpbYbMNlP2WktHCOytb9pnzB3Gf9W0uANbyvpNslEKZCMDGy9cf?=
 =?us-ascii?Q?3tAg8lVHsoFwnnsd0LoS78PdvhMoq87WgEIMmEm0E8Vgh4Afs+qMMZ1a5FMK?=
 =?us-ascii?Q?CmyxCZT2ixs7SwfSS4yPfJkVK0Ewk4cR903x4nUIOX3Y2wrl4FtAucOrk6Ys?=
 =?us-ascii?Q?spsJ6QsNOK56ss0psKobfTqE/j8kH4qkZ7I6O3Drh4kLI4vt/PMaaOZHKSpz?=
 =?us-ascii?Q?10Y02jqNNKSP+Uuxg4t6rJKK/82MmM2Yd9SrfmLM+2eWCcjob7YShTpJDvWz?=
 =?us-ascii?Q?4cQZKxdt23HZnHhMD3XA7MAPCJKEcYptjpdnfSe5Zs0UX3eH67ezbUgywj1Y?=
 =?us-ascii?Q?CtL+yW0ezSnn11h8Z2ssqy6qhktX5EJTsGCKSwzgxOjgsaIpsQCA+hXRXF6V?=
 =?us-ascii?Q?k5amJC9ExFcyQ/3c9yceAXtNQgAPqYuSFtjcWN/fVKA6IxyJCfuZgRQVkdzz?=
 =?us-ascii?Q?Q+xcUJTxgNTSpe/trOXTjcg18j1BjkEPERjx//1mkobb/rUw+Cz49xLZTHLh?=
 =?us-ascii?Q?m8Xz33qfS6MPRLz4TCPj6eYhd9nTacFrSuzHJ3ZuOzjpPu3R62Alwbg5hqGa?=
 =?us-ascii?Q?YhBHOO7PYGH34QAvLebuPeyDxFsp80ljimJF84qiU1mYIkNv7J7AmuY8vBVu?=
 =?us-ascii?Q?kdsx4S8pj2y15cEcf4CRmuikHsujPtAOVP9x+BBILxuPJMhJenlhVAMcJ1sw?=
 =?us-ascii?Q?7lSkTJNpiMy8dkZDQahboAkTEjvQJdDepjiQdWMObYgvEnvx9gdSuldaRN9v?=
 =?us-ascii?Q?gkr3587SKjLOplfAqe0ZMI4aaiB230G3tV9eBTOt/CC/LBof5jeB17EjYihP?=
 =?us-ascii?Q?o5hl+V5QdqV2kdTLiyJwxZJYbKrAi/JbOfCh7jywv3NIQLyO3/tr1VvSRRzS?=
 =?us-ascii?Q?cL5IoDI00Y/gBlj3lQ8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 929ca7ee-e56e-4593-554c-08de28acf0f4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 03:20:37.7097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XeF1fiNpv7JYRFPx+zpM2PiXr+z/keLdetlxOIcBUDvvc+R7oJUkJtCRZq2zXkdR+oChNlq3np9vtHvbOYqz3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10592

On Fri, Nov 21, 2025 at 11:00:30AM +0800, Carlos Song wrote:
> EDMA resumes early and suspends late in the system power transition
> sequence, while LPI2C enters the NOIRQ stage for both suspend and resume.
> This means LPI2C resources become available before EDMA is fully resumed.
> Once IRQs are enabled, a slave device may immediately trigger an LPI2C
> transfer. If the transfer length meets DMA requirements, the driver will
> attempt to use EDMA even though EDMA may still be unavailable.
>
> This timing gap can lead to transfer failures. To prevent this, force
> LPI2C to use PIO mode during system-wide suspend and resume transitions.
> This reduces dependency on EDMA and avoids using an unready DMA resource.
>
> Fixes: a09c8b3f9047 ("i2c: imx-lpi2c: add eDMA mode support for LPI2C")
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes since v2:
> * Updated commit message as per discussion with Frank and improve the
>   commit log by AI
> Changes since v1:
> * Updated commit message as per discussion with Frank.
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 2a0962a0b441..d882126c1778 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -592,6 +592,13 @@ static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
>  	if (!lpi2c_imx->can_use_dma)
>  		return false;
>
> +	/*
> +	 * A system-wide suspend or resume transition is in progress. LPI2C should use PIO to
> +	 * transfer data to avoid issue caused by no ready DMA HW resource.
> +	 */
> +	if (pm_suspend_in_progress())
> +		return false;
> +
>  	/*
>  	 * When the length of data is less than I2C_DMA_THRESHOLD,
>  	 * cpu mode is used directly to avoid low performance.
> --
> 2.34.1
>

