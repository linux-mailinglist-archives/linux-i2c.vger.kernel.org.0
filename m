Return-Path: <linux-i2c+bounces-14390-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5368ACA21A0
	for <lists+linux-i2c@lfdr.de>; Thu, 04 Dec 2025 02:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E412D3021FAA
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Dec 2025 01:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33DB221F24;
	Thu,  4 Dec 2025 01:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HZpxbQox"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013025.outbound.protection.outlook.com [40.107.162.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C446221F20;
	Thu,  4 Dec 2025 01:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764811688; cv=fail; b=iuNZ5DL0UKIlmXEuue83zOFnoTPJkw4l7xLNt9rvWi8w1FfsTETwjb1pDSsMJKH7g4ee9VvfwDb+UTBCuLCDx8zA41oEKYPXgJ8JOdVt/Oc/NeZy9jwzymif1Mgy5p1iMmXhuSv/M3j2rNK6Ubb8pIANElwMPtE/4Ln9DdrMhsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764811688; c=relaxed/simple;
	bh=+pG+PX3XlaU4oQxF+/DeIabuaxb86Ww6Sk9dwt3SHDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hWrEX97OnTU7qEGG8SvNrM4wMLhLX6nTmOtdPfymu7ccORzwfRtWRADb+jT0tOOuZwz1ioGKmPv7USEpNvFERxa1yfF934AbuMEZRLBIxCmpjCzPAR3dRD0dJt8NXZQNlB3unUvI+4d+p8ttofEY1O+MBpQiyLBdluAtlRRs0CM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HZpxbQox; arc=fail smtp.client-ip=40.107.162.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWtxyxK5unSledT0h0NjDd5kUXue1bztRaqH13dWms6K4o005eezgQs1hm9xFAioYSBFQGNBtGu+6rj+y0gQXqjkeVvkxULzG+tzyITS3si1vbwb7O+Dvu8wvnXEgFNj2s2i4j55VbOo6Driq5hA+CV+75bKDVuCl6tmPFNn1loXiO+ujE8n9/RB8hjF+zNSco+tiqCACuUXsjGErDVEU/NRb72t512sMSN7oyooc+Xfg9vrk5Hpdc+GmtyIcYoK6Nf3jhPyVc8fN78WC4HMCtGkZpjnIkwD8yCBelVjCm+bXv/jAuCPmGxGVGe2rf0ioiNgRanzDBrKfnAxJzHU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlMnHXNtpX0lctLT53wqx2RQc8bfMDVGsx32K6DT8ew=;
 b=xJ8f3Yy/ZZXKMrMxWEF2tsZjFv+3v7YFn+DiK0UN0sjeF8HYhrVdY/cPacWDrTlTJES8dzyJc/4mZyFuq5U8GyvCwmQgbQ6Oehtxd9wgjcq8fnpf9SafoSuH4VcZ5n5Q+T+qnI0V0p9wugLKhg9cA64tagyeH+Zn1KkEa2I4SOHy1+1ep5CfYBD6gEd8QCetqOnlVAiIcHY5r3K8GNLOs2ebhESplhLyK2DRtNO83JP2lzS66OVBMaAqyh8PG9VdZc3GU8PLtpEobQQpgIz+IRxS4m6vhxwdmWFAExEXB4ic/pi0+co6iJx3hVYUK9o0rEv30vp4sVZfSTtJgsJuFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlMnHXNtpX0lctLT53wqx2RQc8bfMDVGsx32K6DT8ew=;
 b=HZpxbQoxcBFwnFkpC1Y1WFuawPD8YNzUwSqS04Qhp8UI708NznUD6cpIQJRV6kPMfguGpgbqAFW+IvoCq4e8i8z1fxIItz83/x+gZ9AIoHEZCIT/q2/++WXFhwGVIJnu2qjFUzS+CLCX0F8cWsNSOi5dzHU+fJayfZVR1a5jp5QypYTloFzyelhjGufksOf5cHm03CAyRtkEHPuV7enWAkkXov1IikSDLwtCCGjC5uSwxCRC4GC4fZcL9SxHzWIPdN3KMZomSz4Es0aIS0FLllvOdAxYxvOiqL/nhzOLwjEgBi/BBKJDm03wgsLfeRhVp5ZagkX7pMhwPz/gQdxdyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10994.eurprd04.prod.outlook.com (2603:10a6:150:224::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 01:28:02 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 01:28:02 +0000
Date: Wed, 3 Dec 2025 20:27:53 -0500
From: Frank Li <Frank.li@nxp.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	carlos.song@nxp.com
Subject: Re: [PATCH v2 2/2] i2c: lpi2c: Use cleanup helper for
 dma_async_tx_descriptor error handling
Message-ID: <aTDjmdfUk94R3Dyk@lizhi-Precision-Tower-5810>
References: <20251003-dma_chan_free-v2-0-564946b6c563@nxp.com>
 <20251003-dma_chan_free-v2-2-564946b6c563@nxp.com>
 <26b9cb6d-8370-4908-aed9-9c5b07e5fb82@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26b9cb6d-8370-4908-aed9-9c5b07e5fb82@intel.com>
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB10994:EE_
X-MS-Office365-Filtering-Correlation-Id: 850682c1-b243-4a9f-c977-08de32d45dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W/yG1cQ+v3gkVUSoNB0yk8vZyPTM4wpJe9dpTlkQ+XGcLJv7K0CgEBBAvF+C?=
 =?us-ascii?Q?Zu3H3GmEF8wrG1jUTPz/YwU1qWZAht6Tb74MKGKM8G0pbTqXIpMdADBPqcDI?=
 =?us-ascii?Q?bQViqNi/gWZEuNOWHtC5ABuDQW6SYsvjMB7bqnLYfyKgEp12Iw7wqG9Y5K8H?=
 =?us-ascii?Q?wVGP9Ull/btJ0NtNTKZfreOE5FNaw/qsN3tmirVyPgSI+a2787JYu27eK4QA?=
 =?us-ascii?Q?H0PJUGoZ4/EofDprNRJ/Q0JKO3oz957TfgqCxjCxLAkKm3Z6Ludcn58oLMGV?=
 =?us-ascii?Q?NkcRjAJPfAIxkcXpCzBEK7E2zMBwEniqJm9iGOq0v5gvtf/fuRji8AQseRhn?=
 =?us-ascii?Q?THFb1ABspbLL3hbGnlZaUH8tVeMR+K8IfsSG52HoIynt8u7pNNyBO9n5rOvn?=
 =?us-ascii?Q?NcLHlShCsLyJRkdU5sxg/NNJ+l0QdN3SznPiKyqLfYETEfI4ilbbBd5vHSDp?=
 =?us-ascii?Q?OLfROgwVL9DovUABW4/vXOdv9auqduCwbODaatOf7KNe0OVHWd/Xw1SH28uG?=
 =?us-ascii?Q?hGBGe2CP6BDjEiHG3ugZyMURMxfEMfYWRncphjxU6/AuMT8VJ0t9kCARGBhw?=
 =?us-ascii?Q?OQhWsqCVmV6XRtpgDHK5SK3pThpl3Zg/0hebCyHaH3tGX8TYO2BA00r5e7my?=
 =?us-ascii?Q?bbnT7eCu3mq4Hze8OtV7+lrlHpdR8lpF8TrqBo6wD/zzIb8lI8VVOobdKEHO?=
 =?us-ascii?Q?lcOkQcnr2KyIMSvJnuyQC8wCUkBOjYC/d3BgepjrlHmchDpGUkL+u//mvK5M?=
 =?us-ascii?Q?T0o4rMGfZqT2082RjgQuFAJI5t2VOnQcJ+PvpR5ZRNTQr33YMdIp9m6bbWzA?=
 =?us-ascii?Q?trM6lv9kGijqypR/ZHS1f3TQSGGWfkDGYowWvpzBlfMAxly1NXET4OVUQR4P?=
 =?us-ascii?Q?LhW/PmyAEvn/4XKQosgFPkuIsCisLFty7WletJnL1KYS6VA4678GQZzYM5oy?=
 =?us-ascii?Q?+7oACxvus0vnH/TTM0rRolLe0Pve3gbB8M5i7CNJ1h5DjYG0D9DDWO6A4E72?=
 =?us-ascii?Q?NRMZvBU90kSMfW+hTb6FpoTuFjBTju8viLr4TcsQ7QZay+L7+Ac6WW8V196L?=
 =?us-ascii?Q?0VkO0mQRPizo9COpAyVwDTsH1CDuUoJQFvxvo7zBKrutcsb1Uy99+aBOe2sh?=
 =?us-ascii?Q?/8walk1AX85UYWv9O3kLC3SQzPfiQS30krvlx5m2aiZUgoorMqQCBvTqJDK6?=
 =?us-ascii?Q?UXyVccBiMFIlZnZyiHoadJMYohKP3S59/hccwBw1x4g4Zd5CkQA94D/RkFH9?=
 =?us-ascii?Q?arK7kBPyHbMT3xl5qDCz5YOd8+9us6ipXL/VHklEmBbIW3PvydfomQB9Q7NR?=
 =?us-ascii?Q?v0y2OwPoXtI3tFUXQlWqTEzq06TKU3EZ5hiOear2vmH/Wa7Na9KIsOO1yTim?=
 =?us-ascii?Q?RlKYEmKjRB6mF+NTI1DaOuMr08nCcLef7DRhI2CnKDh5JcgGxSPS3PWA58T6?=
 =?us-ascii?Q?GQEJnPPb+Ax8jrz94IZcJnnsyXfTRVaTSM5x51P8uBT5nOJ4SO1mVSD3RxVv?=
 =?us-ascii?Q?Ba2fAXbWHrON0nzBZiQr+E+9/urOtqcCy/pd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b65Jo1z0gxr4ZEou2tQ7fuHTr0ByVDP9+d4E+ZThok/EglpZzQMQnG5OmJ4l?=
 =?us-ascii?Q?2a93ZXekLVJiOqFMIKHtNQpZWbKqAPiKcL+ohm3Yi/r8+jMvzDDa7LW6C/zF?=
 =?us-ascii?Q?tA56FhW4JE2235pYiMYMB68l6wf/ymKSGUJ447KOfyiD1Dad4yPwGSYATqrR?=
 =?us-ascii?Q?Y+K+VhPp0ik14x6l67Lu3LnCAZdMVisKwn0+u9ejGOVGdYXij896biIz2Uxi?=
 =?us-ascii?Q?YK2/vIIfltimZbTm7Q6I81h4VZOTYidj8l8V3aDFIPM58jXDUr92rDYPd9v0?=
 =?us-ascii?Q?2t/Ai89yCLUo2ZN0c8VueqpsQbLwTIZ/QC78C2DjIcCMJXugUcDjFpaxmtUt?=
 =?us-ascii?Q?33/Qp2I5BHWPT7Qr6VvtvN/UGEmTyiXhvVCoC0uMb9iNrV+z7sxdWNDEPkDK?=
 =?us-ascii?Q?iZ5AaKA4zrXhd/7dU5iM3nbJy8hVdPDAQUy3pX+X3Qlrf3tdDqaItWsnZTcA?=
 =?us-ascii?Q?KoQk8UMab/SbDScCxDlIt9fISlkmHCy++yIZDtIaS4LYztFy7Rmj9ut3Unw8?=
 =?us-ascii?Q?KNhaIuItAwMxzoHeHxJyGSXB/w3jGyWQfyJdP+OjWB6MmP7t2YyWEVmqUaMQ?=
 =?us-ascii?Q?eJ+IlTsJgJdVtS/9rZZgRkFQq1TA6YjC0LnhrhBfOdD+lG63DScQKgmuEGZA?=
 =?us-ascii?Q?yQiYY7KHxZBTrTWtqoKwtLUozCapMFNwNnXj0BhXnwb/F0jySzpNvJsz19mr?=
 =?us-ascii?Q?LbsdMisl9ykC7wCNlgEPlbEeQSJHxjo0Z9YD7uZpffYYB/CS/W+cKJq8EKs8?=
 =?us-ascii?Q?E1lEv8nnbAailuHT38t9RuQQdTIWA4rQA5GlvtRcWTzP7ulWqRV8zE74fftf?=
 =?us-ascii?Q?nJW6HY1G0eZLyok5hQCN5yRhMPEbhv4aaj6IoQ0iZ4D8i25G9XQwbP0OHTXX?=
 =?us-ascii?Q?9CgrfTrEhiDYn1hDaMdKaSVpTAVWWl+tyOqpj/wtJxxrBBJZK7o/DDAUrGKE?=
 =?us-ascii?Q?niCuigz2MQJUHSnYrw+Gpq12B54xqVKo7quurcuJz/oINafQSYBZEx4tXxAf?=
 =?us-ascii?Q?nK5v3CGp/YYKmOQDn5XIly+pMuBKa1M4WHgBCzk+EtXrtgHwmOWaoL/4NATG?=
 =?us-ascii?Q?EoBn1kHl0+/rGfzDiT+KiqY0fAaMNH9utaIvO8B3cCogF/95eND5Wc98vsMk?=
 =?us-ascii?Q?ni/EFrcrYod4D/PkB8hOOwdVq2uQ2wrG0RfrQpYstg9DMCkO5QCymhnmt45G?=
 =?us-ascii?Q?XlSxoufkIIFCVgza28vsrYwnyKmzccf3eNFQ3xs6YbBfJm66toiY8lWfFIDi?=
 =?us-ascii?Q?LKMYOIbBD4Hdk4sDehIUTfbKT2OQy+xoxW4s4iWMuOYyxkbQtndgFM6NSPlZ?=
 =?us-ascii?Q?gLfLlrPlcbuUhPX9uGRqdbjZxH6jpdrfR1f9LCcbPhNF3KGQQEYhwSpm+fTI?=
 =?us-ascii?Q?rvZlSMJQxURJfs082fWdIT8nUUkBIiG7eJWecsGiWmBo/ztcwD34QSqJYLjD?=
 =?us-ascii?Q?ylWMb41PpLocdb87W3BipttRWIjPxjR1rPmj89YTq1N9nFsUIsEfS6rowkF6?=
 =?us-ascii?Q?gLUA8cJbXQ/sWz+jDpjYzPRhdxeEm9yir0t+wY7/8JheFAD2qsA9N/Eyy/4d?=
 =?us-ascii?Q?s5oJVlcRuhiWGGFaM3InKHUtmzdDw0C8XztCM3QD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 850682c1-b243-4a9f-c977-08de32d45dde
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 01:28:02.3922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YP+sSxCB2gHWnqnLPTrp0vBtRmQgjNlpyMHbRJtmIdtmebrZVh0lv9gWBp3r8mSQ0jAT47aLrHrJec2HPk3IVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10994

On Wed, Dec 03, 2025 at 03:52:09PM -0700, Dave Jiang wrote:
>
>
> On 10/3/25 9:26 AM, Frank Li wrote:
> > Use the cleanup helper to simplify dma_async_tx_descriptor error handling.
> >
> > No functional change.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change v2
> >  need goto unmap buffer.
> >
> > desc_prepare_err_exit:
> >         dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
> >                          dma->rx_cmd_buf_len, DMA_TO_DEVICE);
> >         return -EINVAL;
> >
> > submit_err_exit:
> >         dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
> >                          dma->rx_cmd_buf_len, DMA_TO_DEVICE);
> >         dmaengine_desc_free(rx_cmd_desc)
> >
> > auto cleanup by __free, so whole error path submit_err_exit can be removed
> > and use desc_prepare_err_exit label.
> > ---
> >  drivers/i2c/busses/i2c-imx-lpi2c.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > index 03b5a7e8c361abe1d75fb4d31f9614bbc6387d93..e31c2d81f59f18a09d34f79896a7fa4bb83c0a12 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -722,7 +722,7 @@ static void lpi2c_dma_callback(void *data)
> >
> >  static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
> >  {
> > -	struct dma_async_tx_descriptor *rx_cmd_desc;
> > +	struct dma_async_tx_descriptor *rx_cmd_desc __free(dma_async_tx_descriptor) = NULL;
> >  	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
> >  	struct dma_chan *txchan = dma->chan_tx;
> >  	dma_cookie_t cookie;
> > @@ -746,10 +746,11 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
> >  	cookie = dmaengine_submit(rx_cmd_desc);
> >  	if (dma_submit_error(cookie)) {
> >  		dev_err(&lpi2c_imx->adapter.dev, "submitting DMA failed, use pio\n");
> > -		goto submit_err_exit;
> > +		goto desc_prepare_err_exit;
>
> Typically if you are introducing cleanup usage, you will want to remove all the goto usages. Otherwise it gets kinda messy having both styles. Although not sure how to do a cleanup macro with dma_unmap_*. Unless a local one where lpi2c_imx_dma also contains a ptr to the device. Then that may be doable.

dma_unmap() patch at
https://lore.kernel.org/imx/aPZbuY5bLpkoO2J%2F@lizhi-Precision-Tower-5810/

The first patch need be pickup and dma umap firstly.  Then I can remove all
goto.

Frank

>
> DJ>  	}
> >
> >  	dma_async_issue_pending(txchan);
> > +	retain_and_null_ptr(rx_cmd_desc);
> >
> >  	return 0;
> >
> > @@ -757,12 +758,6 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
> >  	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
> >  			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
> >  	return -EINVAL;
> > -
> > -submit_err_exit:
> > -	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
> > -			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
> > -	dmaengine_desc_free(rx_cmd_desc);
> > -	return -EINVAL;
> >  }
> >
> >  static int lpi2c_dma_submit(struct lpi2c_imx_struct *lpi2c_imx)
> >
>

