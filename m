Return-Path: <linux-i2c+bounces-14199-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CE862C75552
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 17:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 890F94E875D
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 16:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF71B362144;
	Thu, 20 Nov 2025 16:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="T7IPxRHI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013038.outbound.protection.outlook.com [40.107.162.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31C2337BBA;
	Thu, 20 Nov 2025 16:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763655447; cv=fail; b=Re0tR7J+EdCvkoGhyx3thz5Ihck09x3VUWrOmEQFKpkwtEbmRSQt6M8JDjWPuc2clYqJ8No0x3H99o0dxERm9YtPTOMATE5qwG1EHteTZIP08+EpCa3exYzNiKduAfGaIW2DkX/2Y+NcE7WjhhsYDUm1pZ/ab3twq/e0pFzHSYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763655447; c=relaxed/simple;
	bh=JPh7rmx+j6LHMWs1CLTkL/ixtABlSUg5fNsyuC0OK2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Iof5BlMYikehNqnsP5PiAyIb9x2ZrzvNp1/YIUTyJT64iaBv8GqGLWuOngSj+xa5/AAiK5MtgIneUZV6Ogha7NqR3PzW5J/5q/opfzAm0Q+F1+jknUnCHxA5RA5wPTV1RZDjOKp1xWmdvhPJCkxThynljP4UC+gYBbRivh4p8AY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=T7IPxRHI; arc=fail smtp.client-ip=40.107.162.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSSlW+Vrdfh/T8KzlwmTl2FEKi3INM7A+9iuJVRce5qo2wFBFdPas0hBWJloT0EyWE8H8ljLcLi11tXl7gtwiD9DXkrkJObPhj6mTW6AGQI5lMN1wIimq4a1qs3sp1oV19BpozAy2qrz4HvMcYpL6vxHTxuFNQ9+asHbdzh3MCQGNT+TcWITdHc8ODFfSwpwNFgPOnb9NRIQT/QohEzOe4YrcBK3i/93aWj36EKp4f+yU/VEQxTsP6UsYo+S6XnM5CtlGvgA9Z+0++ZL880oTDcLG+f7RZR6ShJeeV5Dc/RYiIPwlstjBAVhIxfUq8USmf4Xjjjb/tRZGMNuwsQl4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ciIWkC2R2RLYTMDPxt+EQe+XAKuSA8h8c/qWj7cyff8=;
 b=efINmSPwnGRvk0vXSeWnqBHcwthq7Zo/h3jkntPyHS6NbYfxudzLyaay+xsS2ItFaBjLrk6OqzU2W4DcJy3eyQlIuQqH/EfoqD43rNQCHhLu0aHqlf/Dl/p6hCrtKVLvZ140hJGS2yIJUKAbENXiMrjB9hlqsIlvLUAXmCeXgzXJhuyaQVmbvrz7Xt7LpGqjDuZmPtZSvu46R8QV7aPaNjJrqX3yohGqzHGgqXchQyRyV1mJKX3rewvPTgVeeZ/NnHpuljdB8KrwtvgczdrQVhlVPZmjD31fsvRtckSX03FM0YuBzxbzuZuefOSQBxZqiCRVkpqdEAer4ztEeQVlmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciIWkC2R2RLYTMDPxt+EQe+XAKuSA8h8c/qWj7cyff8=;
 b=T7IPxRHIKEjk2fx00x8b1QRpZVPOd5P/yClpaSShUvBm1eFdlhCsaXcfikEVHpcOaZKT8K2QSNZuY+szsB+KYShYtERpOGBrtteGdeln93Iv9AcbntDkVBw9csWRPvvz5oxbjlrtROYE3Md4QBB1tPwJSH4sPt831PBA6EoFNiO0v3yQVVWymCBPTdc+QowCAVYuLaXjv1FP1qewbXGj96/R+TwqoVdx1WJkNfZXN/NTKBJwk5o0L7hLg4WVUGKH0+ykEM/h9lHKrw+xm8WR3zfWy9jlNbPjDBIvi27ADldT0T9zjImjxwhKow0gtW3Yp1+BbE9E/luke7mc5FQLQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV2PR04MB11445.eurprd04.prod.outlook.com (2603:10a6:150:2af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 16:17:18 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 16:17:18 +0000
Date: Thu, 20 Nov 2025 11:17:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"pandy.gao@nxp.com" <pandy.gao@nxp.com>,
	"wsa@kernel.org" <wsa@kernel.org>, "vz@mleia.com" <vz@mleia.com>,
	"B38611@freescale.com" <B38611@freescale.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: imx-lpi2c: support smbus block read feature
Message-ID: <aR8/Bt77UWb9G6oI@lizhi-Precision-Tower-5810>
References: <20251118111323.1452329-1-carlos.song@nxp.com>
 <aR3z4PBN0+0fKqz5@lizhi-Precision-Tower-5810>
 <VI2PR04MB11147CD601B6A9EC8598E13BDE8D4A@VI2PR04MB11147.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI2PR04MB11147CD601B6A9EC8598E13BDE8D4A@VI2PR04MB11147.eurprd04.prod.outlook.com>
X-ClientProxiedBy: PH8P222CA0020.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::32) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV2PR04MB11445:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e7250e5-ea5c-4823-bef8-08de2850467c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J0VfaVFUrmZsXcU9GdmVGJIruRGGMXIHl3zX4KqaRkPzB1jlMxUFuwOloSVF?=
 =?us-ascii?Q?BQCMprxUVueNWraExYVNUJlQIiZTbbISK/m1gA1tGSi65FyiW3lHivbmUPxS?=
 =?us-ascii?Q?6DmTBnkYgpBwMGdPpbkYqTOLD6Q+75Rx+g4m9kCD/QwQDHZpMlYQO16ShbUd?=
 =?us-ascii?Q?Yc6CZ0lAp73c3zkdZTdLKevFeBfBzK0J0cESY2xg3rgEGH/g+i3Yj0VA+dKK?=
 =?us-ascii?Q?SiFot4HIU7hp7Ayfaf72mNaeCm3/5GDQwlR8bvzOPkI7peTsjpodO2+niKuI?=
 =?us-ascii?Q?cxTvvWySNOPE/p9WYtafxcKuRmzS46B04XhzyX9i3uMjTZv8BBW3N0B34fUh?=
 =?us-ascii?Q?HUvNs6zqZKTudNOWsHMz2xysx+n7wllK4XkzTxNkPY6U2IfiLCQpzvLXQYGE?=
 =?us-ascii?Q?dsuZXpiV6T0Ke212zPTtDKwMdu4nWF+lkKglMiLx+6DEJjHXgQU/aBfeQ4we?=
 =?us-ascii?Q?y6XxBPzCmhfxetn2EazmuJxnbky/0YeB6tl9kc3LdWY4oANHExx+aLduANfC?=
 =?us-ascii?Q?b6AP1d1TMnb4D8Vk8pLcHwXWieTigod3rR1x0J2TCnz3Z+hP+R+TVuoRwOq1?=
 =?us-ascii?Q?8ZS+GUEkvNWb2u9q7PdUXLWF6rscYCD9tWdh42VWVTqYyqRlqe9ny53+Z+3d?=
 =?us-ascii?Q?LlxobX4H1G7cGYeJLmugVAHMhxpEz4+NEJnZEl0KLF2UyESI7p+C/3P5TCbb?=
 =?us-ascii?Q?tsIpCcbiZ0RHi2ccJm80L+wDa68N7uwt00dJRB30rl1itWhzktZcVMj3BCTS?=
 =?us-ascii?Q?K6OG/h1fWKxebTPzZxaIaJ5RyujUpzjzCMwAMl1kSKEa+k3G4soVKMpL3L9W?=
 =?us-ascii?Q?O3tJKBLVu3MZl8NNYc4t0+tajzZyVWxEqRSJB31qmgw01PYsKWnisS0MLAXS?=
 =?us-ascii?Q?yzdQhd88+MvHoQW0O3+7z1SkeL4yCxArgCJAfZoLSeN32XgPIxKj+1joKSUW?=
 =?us-ascii?Q?VEP7t58RDx57GxjxrFpyKFAFXCDVefpCBT5s/8F/mJiiQxiGdqLvkHE9s/sY?=
 =?us-ascii?Q?4ewmls9XqMVu42YDSBfxC6PqjC3pdOFRApzCP5c0vOWGXc/b59waKLplPYCh?=
 =?us-ascii?Q?txH1pbQsyK8ncWE7JVIk/MSwF4vdBfOPu65E1gCWdKx3lITNljmdepMlLLNW?=
 =?us-ascii?Q?0skTLtNx9w70PER0xHp890kbUs4O0PTqg8hOHrkoYT5qYtzDnPQiLFu0PRAo?=
 =?us-ascii?Q?P0Ptxjv22c3wyb6AXGy1G+4dvmgGaXXC/GKDbGOhmR1g+xyhrLqaYwVRIIsl?=
 =?us-ascii?Q?lXKO7rG7iRqfQ5UAjt+QCJtV/jaARCQi6EXaQFvPRqP2BO/frjC69mSZQLj6?=
 =?us-ascii?Q?oCPi1Ic+4ZbDnoma1S3Wu18dt8bk+rpR4K5M7bZ1JpJyAHJ7hMiQgSsXPsjM?=
 =?us-ascii?Q?LOq1h0xB0PaThZ21vsDJd1ev6oTh6yU2XUVXCEeVTWAukwLEKDJYIU79TI3v?=
 =?us-ascii?Q?ydkGMB3pP9+UHbbbiLN7yjWiyp50+hKYK5VoffMoJcNm5dhesfh6x2ZeeXBC?=
 =?us-ascii?Q?8T2awce/3pkSNcVfaxTWmAMYc4j66AeC80z5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CNgpvJtwr/wvmwes88dFhk3DFGIovfajfr69FtgFao2ReXMez5FcuLNA05Za?=
 =?us-ascii?Q?zQJK2XtkkCcJrI6BKtGjvCHDP2WcQnza3cJ+4VxtvnfNjJB05rMuHK/BdExy?=
 =?us-ascii?Q?ZA4u1trMMg6XxcZoh0wNTqVmveD6doxigOnnulz1nVv65oPEMT3sDBPHW7TG?=
 =?us-ascii?Q?LGnag1+zh1plYFJkzVHkqvL9V/odWoxO45E3FJzih5n1h+y5yzIy+0dnkeAA?=
 =?us-ascii?Q?xQ2VZrILoj0PT0Vi8sbF9xtGsPZZqCGPzTBiYExqcRjt4qu8bugml1dh0xK5?=
 =?us-ascii?Q?4uOg5qTCiJgKjbbXP6S3LninFzItlAyvevFQgyLBsCTTRWaFiWuQCT/cX/cc?=
 =?us-ascii?Q?Q2BdLbg5mCwihZnvADyKyqIz/WUuocGa214/jId8v8YiGTDAzfXEhlo1QHff?=
 =?us-ascii?Q?8BKVf2zAj+VWWbFrzdbu8aVp5KNLZqi/55z5pjo/PoeHHAVN8fONGHFjNuCe?=
 =?us-ascii?Q?qxxm/p5SfF7qliaUydCdAoqT7U1tk8GxgRGLV9YevhhUDDRChtpKKdB4+jqT?=
 =?us-ascii?Q?ZQKlei0EdOGpxyWbEJ0bPAJ2UqTE99YTKjKyVco9j8rKqaddzMPRiGL+mpLv?=
 =?us-ascii?Q?nGStrPYfPiRBhY8H6VUcS80it9716kGkySHm/wJZsqMUl3i/BTFWNRobixY7?=
 =?us-ascii?Q?MZIR/CnJ+L+J6CbmH7V2KmFHqD+FKFOwC0hiUL2dYTuM+rzVmYFiO/An5MKR?=
 =?us-ascii?Q?7+fJgE85TsqTU5nAGdAIRIX04+0X0UTt2n9CsA/iDPcxYsweQLMke3n6Abdo?=
 =?us-ascii?Q?zx0dY6Ivw+1T0gJFYs/pp2RirBg0HfSbFTnjqaXq7HGOOL3JgNb/qCSLqIi4?=
 =?us-ascii?Q?vdnInBNxo8zBRTRVI7NAdzQA7NrPgquBWV54SKDK6TOc1sV0TeJe3bhI6f4b?=
 =?us-ascii?Q?FgwBW971ZdHmbu7QgIMsOhg1GUKyd28J9Nmmtk91Y55aablO4xHEKIVwQjAN?=
 =?us-ascii?Q?+9ln6jFTcTdrDQB8FkBu/B/Op5y6cV1NrxhdQr1+PcXvONby80iZCcZOB2Xh?=
 =?us-ascii?Q?inGxTewtvbcUzW99P9pYYWO97JGkkURnN7gsqwE0Zqj/RhxwwuN+9g1X34TX?=
 =?us-ascii?Q?TCwZzkoOgGV3Lznd8sIV7qAjFCgjGpLbI97HrWbKWAZ9OdJmEFmd0/a55vOg?=
 =?us-ascii?Q?7WfqDePthqZ/6LjQsiKWGfsu3rOAPOUcCupvVRNVvtweVkw0BWDw74YqV5pT?=
 =?us-ascii?Q?ELQaM26yfC5PxrTp8AvKTGyNQIjpBLq3Ujb0DRonah36mDltvXagXdn7E/94?=
 =?us-ascii?Q?cMN1WprZPetqNBrfA7WIEylQOTO279WL0N/drbDY7VgXCmNLJ/jbATBIep+S?=
 =?us-ascii?Q?p4UzRWOkHWIqlgxb8FSUCda309pdEvjMMczUcITgVyFDrWADXRkjPPpfHTOm?=
 =?us-ascii?Q?wG+LyDVydJb4xeXeqGhVAjbw+d63JAW05lH/PkyiuXmg6slYMQt77Pxx3405?=
 =?us-ascii?Q?W4HyBa15DNPWyt7ufy148xMKPeG2k3tAcXpuxoFeaU2fabU8g3sk9xtCtV/7?=
 =?us-ascii?Q?T0mg6hXpf0jLY8UGrl/de2MClrCc31j3biHQGr9v8QphKGbmf8R1q00KU5Gh?=
 =?us-ascii?Q?VGBgI439IvNrZf+U++JxZWjioFCKvQgiPX6IZokw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7250e5-ea5c-4823-bef8-08de2850467c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 16:17:17.9470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6t3vcGhvAT2HJPqc5AwdBYHduzY1eOJexEEwjdUUCfqTXzF6AVHmTMbcwWGp2MJ7/d9Zf5zfURzP5uXHdKjzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11445

On Thu, Nov 20, 2025 at 03:02:26AM +0000, Carlos Song wrote:
>
>
> > -----Original Message-----
> > From: Frank Li <frank.li@nxp.com>
> > Sent: Thursday, November 20, 2025 12:44 AM
> > To: Carlos Song <carlos.song@nxp.com>
> > Cc: Aisheng Dong <aisheng.dong@nxp.com>; andi.shyti@kernel.org;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > festevam@gmail.com; pandy.gao@nxp.com; wsa@kernel.org; vz@mleia.com;
> > B38611@freescale.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH] i2c: imx-lpi2c: support smbus block read feature
> >
> > On Tue, Nov 18, 2025 at 07:13:23PM +0800, Carlos Song wrote:
> > > The LPI2C controller automatically transmits a NACK on the last byte
> > > of a receive data command. It transmits the NACK unless the next
> > > command in the TXFIFO is also a receive data command. If the transmit
> > > FIFO is empty when a receive data command completes, a NACK is also
> > > automatically transmitted.
> > >
> > > Specially set read 2 bytes command initially. When the RXFIFO receives
> > > count data, controller should immediately read out this value and
> > > update MTDR register to keep the TXFIFO not empty. Set new receive
> > > data command to read other data before the 2nd byte is returned.
> > >
> > > Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> > > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > >
> > > ---
> > > I setup an env to test this feature change:
> > >
> > > On I.MX93-EVK:
> > > LPI2C5 as slave device and use i2ctool to redesign the slave-eeprom mem:
> > >
> > > hexdump -C /sys/bus/i2c/devices/5-1064/slave-eeprom
> > >
...
> > > -	temp |= (RECV_DATA << 8);
> > > -	writel(temp, lpi2c_imx->base + LPI2C_MTDR);
> > > +
> > > +	if (!lpi2c_imx->block_data) {
> > > +		temp = msgs->len > CHUNK_DATA ? CHUNK_DATA - 1 : msgs->len - 1;
> > > +		temp |= (RECV_DATA << 8);
> > > +		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
> > > +	} else {
> > > +		/*
> > > +		 * The LPI2C controller automatically transmits a NACK on the last
> > byte
> > > +		 * of a receive data command.
> >
> > looks like transfer STOP? You get data, it should be ACK when received data.
> >
>
> According to LPI2C RM MTDR register shows:
> When controller need to read data, we should send command word first.
>      Bit10| bit9 | bit8 |          bit7~0
> Receive (DATA[7:0] + 1) bytes    byte counter
>
> DATA[7:0] is used as a byte counter. Receive that many bytes and check each for a data match (if configured) before storing the received data in the receive FIFO.
> We can prefill the bytes count to controller, controller will auto ACK after every bytes until count is exhausted. Then controller send auto NACK.
>

Thank your for your explain. This may IC design choice or bug, look like
I2C controller should stall SCL to wait for new command?

Assume byte counter is 0, (1 bytes transfer)  [0x100]

SCL: 1,  2,  3,  4,  5,  6,  7,  8,  9,
SDA: B0, B1, B2, B3, B4, B5, B6, B7, ACK.
                                     ^ Do you means here is NACK when
MTDR empty?

> > > +		 * command in the TXFIFO is also a receive data command. If the
> > > +		/* Confirm SMBus transfer meets protocol */
> > > +		if (block_len == 0 || block_len > I2C_SMBUS_BLOCK_MAX) {
> > > +			dev_err(&lpi2c_imx->adapter.dev, "Invalid SMBus block read
> > length\n");
> > > +			return;
> > > +		}
> > > +
> > > +		/* If just read 1 byte then read out from fifo. No need new command
> > update */
> > > +		if (block_len == 1) {
> > > +			ret = lpi2c_SMBus_block_read_single_byte(lpi2c_imx);
> > > +			if (ret < 0)
> > > +				dev_err(&lpi2c_imx->adapter.dev, "SMBus read data
> > timeout\n");
> > > +			return;
> > > +		}

If irq/schedule happen here, you may not fill MTDR in time, so MTDR maybe
empty,  You just have 9 SCL time to fill new data to MTDR.

Frank

> > > +
> > > +		/* Block read other length data need to update command again*/
> > > +		writel((RECV_DATA << 8) | (block_len - 2), lpi2c_imx->base +
> > LPI2C_MTDR);
> > > +		lpi2c_imx->msglen += block_len;
> > > +	}
> > >  }
> > >
> > >  static bool lpi2c_imx_read_chunk_atomic(struct lpi2c_imx_struct
> > > *lpi2c_imx) @@ -599,6 +648,10 @@ static bool is_use_dma(struct
> > lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
> > >  	if (pm_suspend_in_progress())
> > >  		return false;
> > >
> > > +	/* DMA is not suitable for SMBus block read */
> > > +	if (msg->flags & I2C_M_RECV_LEN)
> > > +		return false;
> > > +
> > >  	/*
> > >  	 * When the length of data is less than I2C_DMA_THRESHOLD,
> > >  	 * cpu mode is used directly to avoid low performance.
> > > --
> > > 2.34.1
> > >

