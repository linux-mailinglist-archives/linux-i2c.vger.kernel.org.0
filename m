Return-Path: <linux-i2c+bounces-11045-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE36CABC735
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 20:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D92F71B61F38
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 18:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB9C288C18;
	Mon, 19 May 2025 18:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="czsbNKwq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2077.outbound.protection.outlook.com [40.107.104.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E0126B970;
	Mon, 19 May 2025 18:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747679256; cv=fail; b=S/pn56fO1hxayBgKIpo5ss2VyvyfKGoRFm67HnCjOz6qZG1seGt4yHh2l2tqLtS9Xenvj+H8bJntgDz/Z+l6/kQlorjVlnveHsw/NK9Y89pq7rxpn3FIY7CxXMrtAo0H92gobJAEd/KInMaog8nuNKkdFy8HyDcxaBeDEXtPrgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747679256; c=relaxed/simple;
	bh=npt7bU9KO9WSSw/LUbffOx0zcrIT4f4aPMGEJVPMkZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QOzDXOai64NQ+9eSTbfXXZN3kdvid0u2S0hlzxw7uxiPxHtspEVhArWP66TE86t/TAP4LjFfd2nFZd4ZEsY27Crlk86rIoix26jcq7zM0Yx7Puh+seornwyw4WCj4dofUHQZN1dX4o7CvWx3WI7aOKfsWCC02i/07bEdHuEOWu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=czsbNKwq; arc=fail smtp.client-ip=40.107.104.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GK3dNmw9bKNzd9Zf4jBXSPGZ2v09Z3JCCa/stPAYBfiIHAQvmzjNwnQDJUgKix1SgbwoarFxivJ1k5P861yH8wKmP0DYtIIF0wnaHsjIZSgJlsd4usvbmsD0gDFPQLQYVb2yGN497ORVNk7NMl3M3aVJoLBWZs/9OPc/J2W4qQBex85VF1QhWg/ii2Nuw6BpsFF2Gi2qXmPH3fEPYBs2N+xpXY5toazoBZn2JgtV41Mgkdtcua87QSKUqscCgSz7To3aSK4X1YcQScaa+PP97fgXUoTOeWAYUpO1ljdKFTA98lIv7jO3VY1fVeCZl47JnMHku/o+isYFQ9ceJESvUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bikUH0o0iokBI1lVUzwtRsZui5j08L3pQ0JPOYTmQXQ=;
 b=sKAlSz43uYqXCL8X0fAlx89t5H677r9DK0r0ZxDWiNvyxiuermVQPpmwc3wJYUTavvHEFf1kZayn97lx8sHjjHKuMA23a/+EcCSjVS6xmetSkywoGChrWFbw+o0HbUMscXs4EJHd1UaoEjfLFhxWiW3KoKFWtCF+cnoJzo4lnS8/QItA1Mfkz1PPjpD6k/RhNQUIav5XFg3tDEPJRIplGyVBTtcXBfhoIQabjBbV7bk/MApUP60qOmwVFpJEoNPCdgw74dkb+WwvOUvINRwOqptaPQgz0wnFsY+vLhPc+iSFTCtDM+mMRd+Q0vdAS/nbeoWBNPcDqEDFyQkQOZbWxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bikUH0o0iokBI1lVUzwtRsZui5j08L3pQ0JPOYTmQXQ=;
 b=czsbNKwqa5dYWRw1oLizxtXTWbYat/XNki0lVXdBfQoDU2j8UIiXFpXJ+hpFC6CejmFlpDlBAYVfH2W800oDodTyu0katUIQpoDfoTnbLZUZbMtGpzqzGu6mrDtlw+4dos2sFImEtDWxVVgvym0GVZZvhVnv8cl8BEYy7Q4KN+h6sKPnX6dMEudoIO29AN73F/zsVJa+xGbxj1MHQlbldyqsO+08rCvoOoYYISHAyfMvR/fFapEDY/Q0lj5aC+6LIFjbkDV+8Pp5t4Z2/O+mGk6VMYEDoTQCDSuSvf+zXwWTQUja7YFRDwf/H/LsqnD0ejayrTPLeY8mXRJbW+QMeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8386.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 19 May
 2025 18:27:30 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 18:27:30 +0000
Date: Mon, 19 May 2025 14:27:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Carlos Song <carlos.song@nxp.com>
Subject: Re: [PATCH v3] i2c: lpi2c: implement master_xfer_atomic callback
Message-ID: <aCt4CW6tH3zyySJQ@lizhi-Precision-Tower-5810>
References: <20250519135919.32046-1-francesco@dolcini.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519135919.32046-1-francesco@dolcini.it>
X-ClientProxiedBy: BYAPR21CA0020.namprd21.prod.outlook.com
 (2603:10b6:a03:114::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8386:EE_
X-MS-Office365-Filtering-Correlation-Id: 752c2484-284b-438f-4bae-08dd9702d0a7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?gCrL7wnpgHitnrIwJO86b12KW5MIrf1CZYwoHMS3krr1AQfloEZxbwYXe02q?=
 =?us-ascii?Q?FJiB0x/pGkviEX2FqafIvj8311lghMlM6AKYXHTEqknKm9sV/x00BY6oo2oe?=
 =?us-ascii?Q?GfyoIN7GuhYONL0ycUZEspHPsfV3JaTNpGLcvNDFtmKHLmSajZHmV32VBjXG?=
 =?us-ascii?Q?ID4t3jNMpEMv0XRvXkVtUTrWL59wE4Bu4vVqeK3c4x+FWBj9wseigYQ96wNA?=
 =?us-ascii?Q?xUheoCiJesw+yunQHX84kegzdlryYkTnOpKxU2JPVnITSfCxYCoL4XkuSQXw?=
 =?us-ascii?Q?mrgq2um/0LDiuvMM9AqDzibiINXgPcHiiR9mLt3+7AzH/OjDDCupCxnWlJJ2?=
 =?us-ascii?Q?j+b7qv4nIazyJopsjy/schdhMSwdbqR7Or/VSUBfkDdJG9X8RvxgUNAco9Ko?=
 =?us-ascii?Q?8vNCy3HKM2kKEadAz4RIQsmVddlrT9RaN7IUipZz8qruCvIk47/i2ZkhhRKw?=
 =?us-ascii?Q?RxcNTl8NMkqA3RZEPeBrCkCdhUWGNAMwOXqjqqdy9c2hAhKPuFIeExkYRNaH?=
 =?us-ascii?Q?HSZCFpFFIftors60qaP+9lAWAWG5CCLVafcRxzRLHlANAKCyjxtHZ1XKqIlH?=
 =?us-ascii?Q?QP2WRfIjzaHEVAMb7naAq6dUeYLXmnTNQWC61zeazlSeMFV5jSPkDwTwqfi/?=
 =?us-ascii?Q?tGkAjEhG/XRUyS9ZhJb6jno9lH673zoX5wvy2kd6qAhn/pwzw9vdbGU8fjCE?=
 =?us-ascii?Q?rR7pvTjVvHnugD66XY9XF1nXoAMDgSAPqqioGLI0ow50o17Qk8Ki7AI9cjb7?=
 =?us-ascii?Q?RPb7W1NTFGtRT2XJ0D3asZNhOHIhfqIoDiTnqF1NwBJovIJK5QSjE2hSK16P?=
 =?us-ascii?Q?R4ShRcqdi8K40B4R/N8d5TIz6j4JPV4gLBgvvYhzHx7jxtKe2iFho5U94489?=
 =?us-ascii?Q?u5p73Oop/9h+sSiU1Q7/KZ2U4HwKNRen1HJ1yxtGX1m2toeYOgfg8KSYACbt?=
 =?us-ascii?Q?nh/BsXfPWgZqRNTzXa/5+4FkujFXWibwjItoIn4pVjIlcHU/i5iL7Dz2ow5U?=
 =?us-ascii?Q?WQjVgwQuUiJTOlQUqWCiyl7aoLCZAPUgZQullFsPqRFUat/7+tg4qgPhk7g7?=
 =?us-ascii?Q?qHLUrEG8gQSOSFfxbgLOpE+fyNtsGLgtmAQA/evQOmNpoP0bRb4nOdxocdcW?=
 =?us-ascii?Q?9I7PQj1nTWsoIt/ZT2tnbMo8rN1ksnIDO7FRl6i1TnRt+A0IY9aZ85mCcpoM?=
 =?us-ascii?Q?i/ENBEFswfDLY73AulxHAJTPewZsbxr04qzPB+9qIq4tVM+KswlqHsJQqtxg?=
 =?us-ascii?Q?Y0a80I6aZA5jBua7RI11Y6Nl7Xo2ZTsJahetkSUODGaRWbBV7lw2IwYeSx7i?=
 =?us-ascii?Q?URYsb5ZRAxrALP0nxxCq7MhzTNQPs/Els4D8bAkoGJ1KGLihattSEuPA5InR?=
 =?us-ascii?Q?pd4riVbAGu3IWDLoXq/vWLz9vs10dd4KEOgvL/ngEIdvxqrL5Wz0w1qTzCtf?=
 =?us-ascii?Q?yHFuqVDW4mLmxQjzpKwwZqc8od7i7bzoVAQpEBHJ1WHRU8A24jVinOkMGNcN?=
 =?us-ascii?Q?nSuviEGL1lfnpr0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?txL6th93CepL/qgCjMScuOc+WnjHQ3cQbt5RrBdtp1LMGTaITiyGmhPxeZul?=
 =?us-ascii?Q?6m6qF9vPkXe7ONABWCnkglt8T0eWeyNmkiRvPXDkcAA1Kb0036GMdZKD5lHZ?=
 =?us-ascii?Q?dhIEGPsRrU3+d6wAKvIjBMPafRf5WkicdysMPYVuic1u+wkMKES6KNJuCkFc?=
 =?us-ascii?Q?BEsoVY545AiApxGLEbbs4N0/+AsbrKBxsyi5pD0EIHGspCVRI6C841nxuS/s?=
 =?us-ascii?Q?nMymu6LKWP5QmEwCZrqrgz8spj7hYW03AAXKP4OO6GremR1VEnWVu0+ossrY?=
 =?us-ascii?Q?B+Jev+bRojZrjpHT6KWbQOOa9qQSg8289udvNe27r0/h35c9TThYris1Ptzj?=
 =?us-ascii?Q?4lGyWRgo7PB3W2jgHqIUKuTdijATJ3gHmF62dQLwiiwP2a+XzY56xtQ165UN?=
 =?us-ascii?Q?DVCmFqmMMvecdYIEFk/SxlNurOa1+ViXgHGbwJSnNHMhtUDTLoNF6XITFSll?=
 =?us-ascii?Q?KVEaRIXYxprrpjEqZuNyDCrjCZQX8iPh1COe4RFuXnbKOZCqzBB5FADcoYVX?=
 =?us-ascii?Q?IJ1g03uLznE+UeIWERn/4dfAW7EeJauMrGTlT52j6eeQKJ86C57Focm43f8z?=
 =?us-ascii?Q?Gv3/RLxI5F8PFwW/DR7B7YrrZhUHO1dkg9WCoapAAsrs8z8hb5tqCmIq5OQq?=
 =?us-ascii?Q?CXipn2nQpog37U7bZ8oAULlBtkxebbQrGuywEDRAMa7D5yiN+f86h+gA5UEI?=
 =?us-ascii?Q?BE9wVqqA0F6suIn8SimNbpiuQD0FNeg/bI0pkJ9dV/fq2HNtLTOsycR3ODMa?=
 =?us-ascii?Q?fKGqyGTDhgGIEPC8/yaQaHzMTu7rMYOJAE4HtMGmSrzubl+ben4LFeROE9ta?=
 =?us-ascii?Q?qLuxfz6cw/Yd3KiSTTZUOsgMfmn4LIEhW1FKioDqLfiFjEZJzl8d0o+lPr0q?=
 =?us-ascii?Q?V7RnOP1TjEvp5fGGcSZpdo00o4p77K2pD3uYbL/pqgr/uK2ZM/5P1yqtivcY?=
 =?us-ascii?Q?uPydV1xbz2Ce+C8tgzPhVTsqy9cBmZDwiCsAKno1NN7cozRBZofRYzrg1kdB?=
 =?us-ascii?Q?JuFDr+lIGLkoLy4hAsxlFFP1MLJTAlGU8RLY7wLXFHo9zPqiWydlPG9arbX3?=
 =?us-ascii?Q?6A/1QDW4a/mJZ6e9YLj+yBxuz/Q0YEesFu28Xavt+QcCp8nK2j+e4W+5feLr?=
 =?us-ascii?Q?bdqYHwbyLoRdeLUgiyiGG78tKM6JpGqj0KZFWdVP5x+hXMWeyJsobdGaLzwg?=
 =?us-ascii?Q?3gPbD5puD0d4C/nLofXo1+YTHYIbmtVKOl26VYNhXzaL4OuSKsbPjOUlUUGu?=
 =?us-ascii?Q?s7BvB5elEhzpUAQAyKgdO1fXKcmqjX8NTdKGa2jMJ4ZCG0kLiW39iLvFF/Rv?=
 =?us-ascii?Q?cA3YmzEfsSeASwZG71Y4NN3wnuyk04IaqpPsxB3LbvrzYrPGPEKDGgotVJEi?=
 =?us-ascii?Q?W2c9eRX73HbgotmmR17HJ+Sx9f+hEkVio6P7/l3aSUY0JHkaoi3twzS3ox6B?=
 =?us-ascii?Q?0q94eUSWrq6bG/hacKltkJeLoZ47DVE+7s4GpctACFc4Tnfmi17CkKpkzm6H?=
 =?us-ascii?Q?c2f+ox1UKi933o9QgB02Okh+Ju7VKdtNruvdpCPYig/SgY4WQtKt9CZfIrSx?=
 =?us-ascii?Q?lpHxxl/Wz2TU6aEM4Y+wirWb0W5nKWOzdMvtmqR9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752c2484-284b-438f-4bae-08dd9702d0a7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 18:27:30.4990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nds33GiQav0M0m2wrUn0HkknLnPcf27mqwLSoxh8tZpc8lce11WZwyv84RvyhgNPT18hGfS6PPS38BUDbPgezg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8386

On Mon, May 19, 2025 at 03:59:19PM +0200, Francesco Dolcini wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>
> Rework the read and write code paths in the driver to support operation
> in atomic contexts. To achieve this, the driver must not rely on IRQs
> or perform any scheduling, e.g., via a sleep or schedule routine. Even
> jiffies do not advance in atomic contexts, so timeouts based on them
> are substituted with delays.
>
> Implement atomic, sleep-free, and IRQ-less operation. This increases
> complexity but is necessary for atomic I2C transfers required by some
> hardware configurations, e.g., to trigger reboots on an external PMIC chip.
>
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Reviewed-by: Carlos Song <carlos.song@nxp.com>
> ---
> v2 -> v3
>  - Closes: https://lore.kernel.org/oe-kbuild-all/202505130735.zh3WuTNu-lkp@intel.com/. Using the return value of
>    lpi2c_imx_read_msr_poll_timeout() to check for errors.
>
> v1 -> v2
>  - Rename READL_POLL_TIMEOUT to lpi2c_imx_read_msr_poll_timeout
>  - Remove addr and timeout_us parameters from lpi2c_imx_read_msr_poll_timeout since they are used always with the same value
>  - add r-b tag from Carlos Song
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 260 +++++++++++++++++++----------
>  1 file changed, 175 insertions(+), 85 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 342d47e67586..20eae1842f19 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -16,6 +16,7 @@
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -187,36 +188,38 @@ struct lpi2c_imx_struct {
>  	struct i2c_client	*target;
>  };
>
> +#define lpi2c_imx_read_msr_poll_timeout(atomic, val, cond, delay_us)          \
> +	(atomic ? readl_poll_timeout_atomic(lpi2c_imx->base + LPI2C_MSR, val, \
> +					    cond, delay_us, 500000) :         \
> +		  readl_poll_timeout(lpi2c_imx->base + LPI2C_MSR, val, cond,  \
> +				     delay_us, 500000))
> +
>  static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
>  			      unsigned int enable)
>  {
>  	writel(enable, lpi2c_imx->base + LPI2C_MIER);
>  }
>
> -static int lpi2c_imx_bus_busy(struct lpi2c_imx_struct *lpi2c_imx)
> +static int lpi2c_imx_bus_busy(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
>  {
> -	unsigned long orig_jiffies = jiffies;
> +	int ret;
>  	unsigned int temp;
>
> -	while (1) {
> -		temp = readl(lpi2c_imx->base + LPI2C_MSR);
> -
> -		/* check for arbitration lost, clear if set */
> -		if (temp & MSR_ALF) {
> -			writel(temp, lpi2c_imx->base + LPI2C_MSR);
> -			return -EAGAIN;
> -		}
> +	ret = lpi2c_imx_read_msr_poll_timeout(atomic, temp,
> +					      temp & (MSR_ALF | MSR_BBF | MSR_MBF), 1);
>
> -		if (temp & (MSR_BBF | MSR_MBF))
> -			break;
> +	/* check for arbitration lost, clear if set */
> +	if (temp & MSR_ALF) {
> +		writel(temp, lpi2c_imx->base + LPI2C_MSR);
> +		return -EAGAIN;
> +	}
>
> -		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
> -			dev_dbg(&lpi2c_imx->adapter.dev, "bus not work\n");
> -			if (lpi2c_imx->adapter.bus_recovery_info)
> -				i2c_recover_bus(&lpi2c_imx->adapter);
> -			return -ETIMEDOUT;
> -		}
> -		schedule();
> +	/* check for bus not busy */
> +	if (ret) {
> +		dev_dbg(&lpi2c_imx->adapter.dev, "bus not work\n");
> +		if (lpi2c_imx->adapter.bus_recovery_info)
> +			i2c_recover_bus(&lpi2c_imx->adapter);
> +		return -ETIMEDOUT;
>  	}
>
>  	return 0;
> @@ -242,7 +245,7 @@ static void lpi2c_imx_set_mode(struct lpi2c_imx_struct *lpi2c_imx)
>  }
>
>  static int lpi2c_imx_start(struct lpi2c_imx_struct *lpi2c_imx,
> -			   struct i2c_msg *msgs)
> +			   struct i2c_msg *msgs, bool atomic)
>  {
>  	unsigned int temp;
>
> @@ -254,30 +257,23 @@ static int lpi2c_imx_start(struct lpi2c_imx_struct *lpi2c_imx,
>  	temp = i2c_8bit_addr_from_msg(msgs) | (GEN_START << 8);
>  	writel(temp, lpi2c_imx->base + LPI2C_MTDR);
>
> -	return lpi2c_imx_bus_busy(lpi2c_imx);
> +	return lpi2c_imx_bus_busy(lpi2c_imx, atomic);
>  }
>
> -static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx)
> +static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
>  {
> -	unsigned long orig_jiffies = jiffies;
>  	unsigned int temp;
> +	int ret;
>
>  	writel(GEN_STOP << 8, lpi2c_imx->base + LPI2C_MTDR);
>
> -	do {
> -		temp = readl(lpi2c_imx->base + LPI2C_MSR);
> -		if (temp & MSR_SDF)
> -			break;
> -
> -		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
> -			dev_dbg(&lpi2c_imx->adapter.dev, "stop timeout\n");
> -			if (lpi2c_imx->adapter.bus_recovery_info)
> -				i2c_recover_bus(&lpi2c_imx->adapter);
> -			break;
> -		}
> -		schedule();
> +	ret = lpi2c_imx_read_msr_poll_timeout(atomic, temp, temp & MSR_SDF, 1);
>
> -	} while (1);
> +	if (ret) {
> +		dev_dbg(&lpi2c_imx->adapter.dev, "stop timeout\n");
> +		if (lpi2c_imx->adapter.bus_recovery_info)
> +			i2c_recover_bus(&lpi2c_imx->adapter);
> +	}

Is it more clean by
1 - create patch to change time_after() to poll_timeout() only.
2 - add atomic support

>  }
>
>  /* CLKLO = I2C_CLK_RATIO * CLKHI, SETHOLD = CLKHI, DATAVD = CLKHI/2 */
> @@ -391,28 +387,30 @@ static int lpi2c_imx_pio_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
>  	return time_left ? 0 : -ETIMEDOUT;
>  }
>
> -static int lpi2c_imx_txfifo_empty(struct lpi2c_imx_struct *lpi2c_imx)
> +static u32 txfifo_cnt(struct lpi2c_imx_struct *lpi2c_imx)

lpi2c_imx_txfifo_cnt() to keep consistence with other funciton.

And move it little big far before lpi2c_imx_txfifo_empty() to make patch
to easy to read.

>  {
> -	unsigned long orig_jiffies = jiffies;
> -	u32 txcnt;
> +	return readl(lpi2c_imx->base + LPI2C_MFSR) & 0xff;
> +}
>
> -	do {
> -		txcnt = readl(lpi2c_imx->base + LPI2C_MFSR) & 0xff;
> +static int lpi2c_imx_txfifo_empty(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
> +{
> +	unsigned int temp;
> +	int err;

above use 'ret', try keep consistence.

>
> -		if (readl(lpi2c_imx->base + LPI2C_MSR) & MSR_NDF) {
> -			dev_dbg(&lpi2c_imx->adapter.dev, "NDF detected\n");
> -			return -EIO;
> -		}
> +	err = lpi2c_imx_read_msr_poll_timeout(atomic, temp,
> +					      (temp & MSR_NDF) || !txfifo_cnt(lpi2c_imx), 1);
                                                                                          ^
where "1" from origial codoe


Frank
>
> -		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
> -			dev_dbg(&lpi2c_imx->adapter.dev, "txfifo empty timeout\n");
> -			if (lpi2c_imx->adapter.bus_recovery_info)
> -				i2c_recover_bus(&lpi2c_imx->adapter);
> -			return -ETIMEDOUT;
> -		}
> -		schedule();
> +	if (temp & MSR_NDF) {
> +		dev_dbg(&lpi2c_imx->adapter.dev, "NDF detected\n");
> +		return -EIO;
> +	}
>
> -	} while (txcnt);
> +	if (err) {
> +		dev_dbg(&lpi2c_imx->adapter.dev, "txfifo empty timeout\n");
> +		if (lpi2c_imx->adapter.bus_recovery_info)
> +			i2c_recover_bus(&lpi2c_imx->adapter);
> +		return -ETIMEDOUT;
> +	}
>
>  	return 0;
>  }
> @@ -436,7 +434,7 @@ static void lpi2c_imx_set_rx_watermark(struct lpi2c_imx_struct *lpi2c_imx)
>  	writel(temp << 16, lpi2c_imx->base + LPI2C_MFCR);
>  }
>
> -static void lpi2c_imx_write_txfifo(struct lpi2c_imx_struct *lpi2c_imx)
> +static bool lpi2c_imx_write_txfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
>  {
>  	unsigned int data, txcnt;
>
> @@ -451,13 +449,19 @@ static void lpi2c_imx_write_txfifo(struct lpi2c_imx_struct *lpi2c_imx)
>  		txcnt++;
>  	}
>
> -	if (lpi2c_imx->delivered < lpi2c_imx->msglen)
> -		lpi2c_imx_intctrl(lpi2c_imx, MIER_TDIE | MIER_NDIE);
> -	else
> +	if (lpi2c_imx->delivered < lpi2c_imx->msglen) {
> +		if (!atomic)
> +			lpi2c_imx_intctrl(lpi2c_imx, MIER_TDIE | MIER_NDIE);
> +		return false;
> +	}
> +
> +	if (!atomic)
>  		complete(&lpi2c_imx->complete);
> +
> +	return true;
>  }
>
> -static void lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx)
> +static bool lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
>  {
>  	unsigned int blocklen, remaining;
>  	unsigned int temp, data;
> @@ -482,8 +486,9 @@ static void lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx)
>  	remaining = lpi2c_imx->msglen - lpi2c_imx->delivered;
>
>  	if (!remaining) {
> -		complete(&lpi2c_imx->complete);
> -		return;
> +		if (!atomic)
> +			complete(&lpi2c_imx->complete);
> +		return true;
>  	}
>
>  	/* not finished, still waiting for rx data */
> @@ -501,7 +506,10 @@ static void lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx)
>  		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
>  	}
>
> -	lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE);
> +	if (!atomic)
> +		lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE);
> +
> +	return false;
>  }
>
>  static void lpi2c_imx_write(struct lpi2c_imx_struct *lpi2c_imx,
> @@ -509,11 +517,29 @@ static void lpi2c_imx_write(struct lpi2c_imx_struct *lpi2c_imx,
>  {
>  	lpi2c_imx->tx_buf = msgs->buf;
>  	lpi2c_imx_set_tx_watermark(lpi2c_imx);
> -	lpi2c_imx_write_txfifo(lpi2c_imx);
> +	lpi2c_imx_write_txfifo(lpi2c_imx, false);
>  }
>
> -static void lpi2c_imx_read(struct lpi2c_imx_struct *lpi2c_imx,
> -			   struct i2c_msg *msgs)
> +static int lpi2c_imx_write_atomic(struct lpi2c_imx_struct *lpi2c_imx,
> +				  struct i2c_msg *msgs)
> +{
> +	u32 temp;
> +	int err;
> +
> +	lpi2c_imx->tx_buf = msgs->buf;
> +
> +	err = lpi2c_imx_read_msr_poll_timeout(true, temp,
> +					      (temp & MSR_NDF) ||
> +					      lpi2c_imx_write_txfifo(lpi2c_imx, true), 5);
> +
> +	if (temp & MSR_NDF)
> +		return -EIO;
> +
> +	return err;
> +}
> +
> +static void lpi2c_imx_read_init(struct lpi2c_imx_struct *lpi2c_imx,
> +				struct i2c_msg *msgs)
>  {
>  	unsigned int temp;
>
> @@ -524,8 +550,43 @@ static void lpi2c_imx_read(struct lpi2c_imx_struct *lpi2c_imx,
>  	temp = msgs->len > CHUNK_DATA ? CHUNK_DATA - 1 : msgs->len - 1;
>  	temp |= (RECV_DATA << 8);
>  	writel(temp, lpi2c_imx->base + LPI2C_MTDR);
> +}
>
> -	lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE | MIER_NDIE);
> +static bool lpi2c_imx_read_chunk_atomic(struct lpi2c_imx_struct *lpi2c_imx)
> +{
> +	u32 rxcnt;
> +
> +	rxcnt = (readl(lpi2c_imx->base + LPI2C_MFSR) >> 16) & 0xFF;
> +	if (!rxcnt)
> +		return false;
> +
> +	if (!lpi2c_imx_read_rxfifo(lpi2c_imx, true))
> +		return false;
> +
> +	return true;
> +}
> +
> +static int lpi2c_imx_read_atomic(struct lpi2c_imx_struct *lpi2c_imx,
> +				 struct i2c_msg *msgs)
> +{
> +	u32 temp;
> +	int tmo_us;
> +
> +	tmo_us = 1000000;
> +	do {
> +		if (lpi2c_imx_read_chunk_atomic(lpi2c_imx))
> +			return 0;
> +
> +		temp = readl(lpi2c_imx->base + LPI2C_MSR);
> +
> +		if (temp & MSR_NDF)
> +			return -EIO;
> +
> +		udelay(100);
> +		tmo_us -= 100;
> +	} while (tmo_us > 0);
> +
> +	return -ETIMEDOUT;
>  }
>
>  static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
> @@ -545,14 +606,27 @@ static int lpi2c_imx_pio_xfer(struct lpi2c_imx_struct *lpi2c_imx,
>  {
>  	reinit_completion(&lpi2c_imx->complete);
>
> -	if (msg->flags & I2C_M_RD)
> -		lpi2c_imx_read(lpi2c_imx, msg);
> -	else
> +	if (msg->flags & I2C_M_RD) {
> +		lpi2c_imx_read_init(lpi2c_imx, msg);
> +		lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE | MIER_NDIE);
> +	} else {
>  		lpi2c_imx_write(lpi2c_imx, msg);
> +	}
>
>  	return lpi2c_imx_pio_msg_complete(lpi2c_imx);
>  }
>
> +static int lpi2c_imx_pio_xfer_atomic(struct lpi2c_imx_struct *lpi2c_imx,
> +				     struct i2c_msg *msg)
> +{
> +	if (msg->flags & I2C_M_RD) {
> +		lpi2c_imx_read_init(lpi2c_imx, msg);
> +		return lpi2c_imx_read_atomic(lpi2c_imx, msg);
> +	}
> +
> +	return lpi2c_imx_write_atomic(lpi2c_imx, msg);
> +}
> +
>  static int lpi2c_imx_dma_timeout_calculate(struct lpi2c_imx_struct *lpi2c_imx)
>  {
>  	unsigned long time = 0;
> @@ -947,8 +1021,8 @@ static int lpi2c_imx_dma_xfer(struct lpi2c_imx_struct *lpi2c_imx,
>  	return ret;
>  }
>
> -static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
> -			  struct i2c_msg *msgs, int num)
> +static int lpi2c_imx_xfer_common(struct i2c_adapter *adapter,
> +				 struct i2c_msg *msgs, int num, bool atomic)
>  {
>  	struct lpi2c_imx_struct *lpi2c_imx = i2c_get_adapdata(adapter);
>  	unsigned int temp;
> @@ -959,7 +1033,7 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
>  		return result;
>
>  	for (i = 0; i < num; i++) {
> -		result = lpi2c_imx_start(lpi2c_imx, &msgs[i]);
> +		result = lpi2c_imx_start(lpi2c_imx, &msgs[i], atomic);
>  		if (result)
>  			goto disable;
>
> @@ -971,28 +1045,33 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
>  		lpi2c_imx->tx_buf = NULL;
>  		lpi2c_imx->delivered = 0;
>  		lpi2c_imx->msglen = msgs[i].len;
> -		init_completion(&lpi2c_imx->complete);
>
> -		if (is_use_dma(lpi2c_imx, &msgs[i])) {
> -			result = lpi2c_imx_dma_xfer(lpi2c_imx, &msgs[i]);
> -			if (result && lpi2c_imx->dma->using_pio_mode)
> -				result = lpi2c_imx_pio_xfer(lpi2c_imx, &msgs[i]);
> +		if (atomic) {
> +			result = lpi2c_imx_pio_xfer_atomic(lpi2c_imx, &msgs[i]);
>  		} else {
> -			result = lpi2c_imx_pio_xfer(lpi2c_imx, &msgs[i]);
> +			init_completion(&lpi2c_imx->complete);
> +
> +			if (is_use_dma(lpi2c_imx, &msgs[i])) {
> +				result = lpi2c_imx_dma_xfer(lpi2c_imx, &msgs[i]);
> +				if (result && lpi2c_imx->dma->using_pio_mode)
> +					result = lpi2c_imx_pio_xfer(lpi2c_imx, &msgs[i]);
> +			} else {
> +				result = lpi2c_imx_pio_xfer(lpi2c_imx, &msgs[i]);
> +			}
>  		}
>
>  		if (result)
>  			goto stop;
>
>  		if (!(msgs[i].flags & I2C_M_RD)) {
> -			result = lpi2c_imx_txfifo_empty(lpi2c_imx);
> +			result = lpi2c_imx_txfifo_empty(lpi2c_imx, atomic);
>  			if (result)
>  				goto stop;
>  		}
>  	}
>
>  stop:
> -	lpi2c_imx_stop(lpi2c_imx);
> +	lpi2c_imx_stop(lpi2c_imx, atomic);
>
>  	temp = readl(lpi2c_imx->base + LPI2C_MSR);
>  	if ((temp & MSR_NDF) && !result)
> @@ -1008,6 +1087,16 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
>  	return (result < 0) ? result : num;
>  }
>
> +static int lpi2c_imx_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)
> +{
> +	return lpi2c_imx_xfer_common(adapter, msgs, num, false);
> +}
> +
> +static int lpi2c_imx_xfer_atomic(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)
> +{
> +	return lpi2c_imx_xfer_common(adapter, msgs, num, true);
> +}
> +
>  static irqreturn_t lpi2c_imx_target_isr(struct lpi2c_imx_struct *lpi2c_imx,
>  					u32 ssr, u32 sier_filter)
>  {
> @@ -1070,9 +1159,9 @@ static irqreturn_t lpi2c_imx_master_isr(struct lpi2c_imx_struct *lpi2c_imx)
>  	if (temp & MSR_NDF)
>  		complete(&lpi2c_imx->complete);
>  	else if (temp & MSR_RDF)
> -		lpi2c_imx_read_rxfifo(lpi2c_imx);
> +		lpi2c_imx_read_rxfifo(lpi2c_imx, false);
>  	else if (temp & MSR_TDF)
> -		lpi2c_imx_write_txfifo(lpi2c_imx);
> +		lpi2c_imx_write_txfifo(lpi2c_imx, false);
>
>  	return IRQ_HANDLED;
>  }
> @@ -1268,10 +1357,11 @@ static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
>  }
>
>  static const struct i2c_algorithm lpi2c_imx_algo = {
> -	.master_xfer	= lpi2c_imx_xfer,
> -	.functionality	= lpi2c_imx_func,
> -	.reg_target	= lpi2c_imx_register_target,
> -	.unreg_target	= lpi2c_imx_unregister_target,
> +	.master_xfer		= lpi2c_imx_xfer,
> +	.master_xfer_atomic	= lpi2c_imx_xfer_atomic,
> +	.functionality		= lpi2c_imx_func,
> +	.reg_target		= lpi2c_imx_register_target,
> +	.unreg_target		= lpi2c_imx_unregister_target,
>  };
>
>  static const struct of_device_id lpi2c_imx_of_match[] = {
> --
> 2.39.5
>

