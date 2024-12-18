Return-Path: <linux-i2c+bounces-8607-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F38719F6DCF
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 20:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DA2A1686C9
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 19:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571291FBE8F;
	Wed, 18 Dec 2024 19:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kTtYtRoB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99C81FA828;
	Wed, 18 Dec 2024 19:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734549031; cv=fail; b=byIGPY4RDzGOzJAOYjxBPr1FCaGBTFub7q1K2TSl+VKUCldHjkcWjSLvn/pW3tEU03dgGHTw9QG8qgNHKJM5j3wgwFkskjryws2eBTrix6OcGmlkUWxXmeLxZi0p2cDsxLSfSe3VRlgOxgJ9v74Z2MVoaX5vk+CmQr9j9q7j2co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734549031; c=relaxed/simple;
	bh=pWIDMhGTv3lBvBc5tHsWF7tFvKoOjAKY07dey9faz5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qw1GtE4/8oae7HA8pAVJjbDV1M1GcPRZcH4VAHWa80jkVDvTt0SwzU8xzc5djeZ4HYtXZqgAFgVeuBMka4UsAzQ0Y+AUV/HLpMwKsO0k48thXK+2uCYJJbsSR65ynUXbFGMsNltMMCzJT6UrQgmVgwt8pxtmrqoqTE6ChfCj1Ac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kTtYtRoB; arc=fail smtp.client-ip=40.107.21.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JST8lDzZcvtG5MIGQQUfII58TXx62tPkfNq9ahcPpB1eYOUFYqwIfmyQPPgVnUkZrbbrcOdjzqZNc6sMKU3QlXYQ9ShetPU0VbjoKX+kTV8m/4U4Xz8+hUMEjjMdRbjneAjjvgEe9ucH8JAwUAl2I9iHyanivW+g5OBuo8NTAcuxuTp2GllucP/6HrRnz9GzEyTyt3HwCYuQMk0Pyv7vnaivEhZADoO+cTOVO1vvRrthN+PphJ/Rjuie40uvXrbIlk6JsPQuyCJcNmSEwrMnDCk1NlR+NMum1PPS7i82A3/FZV9YV4vwRXDtCzzC6iJC5k2s/+7tqHkgrknNuV3AzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/09/AHRuJVVRdfTLw0aOEa1Xn5ripWpsZ9vYWP8fYs=;
 b=y+HzjsByU/UpHaS7kDyPo+nvMx8VvtY7fEWLW4Z2rVQ7J35f3p8VFahK1kqmLyYcn3vM7OYAdRsiVODv49LsET/JmotvFGSszLDAOvF2mzWeeSyYOMjnXyDgDaqZqkxmulftgWtqP40g2jeiW9o+sF5IpchstrUYRE4fwu7j3B2JVg+6E8tbVUiqWnkMZlWdsgqrK1GEquzyRD/SEPH2eOO6vN30SYnlNYMYzX5dDR0VOMTVNr0sI0phP+1aFiGnk7hMh+rxW7UPAyZUzySban1Znp4ZFSM/SAALoJc8/N3IT4Bp9EvhwgtnVfUPhnPIyRWW2DnD9jMBRQA1eTY4jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/09/AHRuJVVRdfTLw0aOEa1Xn5ripWpsZ9vYWP8fYs=;
 b=kTtYtRoBVGu1rK6i3DNnQIXPihvFYUzYVCP4ns4UaQeHtUVTGQ7N8oDb9MfKoivybOd4TNGzKKwe4OBphF9kGFF5f6EF650DeAOwFTV2cKAWxa4pJcyjV7cs1sRSixIwNTdYwIROAhlDE1G0ZUxTCBVNRJ9yhz9D0frEdXfKjkUHnIJ8T+vIsOrgjDSu5olaE5uT2RWDsaWGfmYdKxVswIdZJgXsYra18UF/bYyNkcs2oYVE22XhPZ8VKGkx1oN1wcGOQfIDqmkofEq8AODsXAI0rz8KukZqppA5a7IrVkd1gomhIexJG4K3K5HkFjqMJ9stDKnmdX8P6OFb7+Vngg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB6907.eurprd04.prod.outlook.com (2603:10a6:10:119::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 19:10:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 19:10:22 +0000
Date: Wed, 18 Dec 2024 14:10:14 -0500
From: Frank Li <Frank.li@nxp.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: andi.shyti@kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v3] i2c: imx: add imx7d compatible string for applying
 errata ERR007805
Message-ID: <Z2MeFp8sDfDlqrOc@lizhi-Precision-Tower-5810>
References: <20241218044238.143414-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218044238.143414-1-carlos.song@nxp.com>
X-ClientProxiedBy: BY5PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: c505c7b2-24db-48b3-1fa1-08dd1f979ef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MWxLtB/RfAzoXU69yimt3Zzb6QFSYKHn78EcTPZiM3r8dSTQDvclM7nAdypl?=
 =?us-ascii?Q?Pu3h1uem2gDzZXbZoXBoSPY410vVU+37qgPWdvrgShRSZ/ukgmm3xxAPYv/l?=
 =?us-ascii?Q?5tM0HYwnHX0/UD+pO78FVcMw5jYMaDiF6xTxE55f1Zyd3QDvKDa3nXtQyUD4?=
 =?us-ascii?Q?CsmRlSUJXyCmFWzDhXpcwTt41S1NVIX0P89Sceocu2OtI+5bb6qybhbPbrH6?=
 =?us-ascii?Q?2UmRbScdIDj1H/C54YpctO+bfnBm9RuCCFngBplB8+hAE+IEQJMOAw3rh+Io?=
 =?us-ascii?Q?5iSpKbDbufYmERrkEZYsbNU1eQhvgYRfBQn/A43ooJ1pBdM+AdAHCg1bT+Vy?=
 =?us-ascii?Q?nX+/RpG+9JhsK7lZaViAbFtpqHGBlvylzeXNVOMu9vYHgWLZ3SsO+5C5zk0b?=
 =?us-ascii?Q?f7bso2HhyH8yGhI9KxEEaiDvLEgMtOp+Ph1axvtFvLdN1Mun1f6veH/JWwgQ?=
 =?us-ascii?Q?KRQ+53Kijfvj5CnmU+9/RPGiuXG/BbTfOl+rUgaSIxq5vE2okzay+2pygqqS?=
 =?us-ascii?Q?6I2QFUKsr+UrRMvqyaL39BBTcuJqOc+eP3auW027koNG8KRwdGEbsOPGW0GT?=
 =?us-ascii?Q?r6jHVOQ26aYgkjszAZx1J3p0rgGrM9YPu/1CIsRKofMXA4SBPW32LR+gP36S?=
 =?us-ascii?Q?n0xM4Ewi2SQgOrGTG2oQlcQSVDfxDacIcaE7JnLF4HIOtlcJitcXxkTLj5Jj?=
 =?us-ascii?Q?VXsMiGcVIJtLWbWshu3OnJXvZEbx1rc85zZYXnknW3NriTlb6OVG85hZ9gAO?=
 =?us-ascii?Q?5iQOjqGVJK1QC3JkLuU/CGG6NWdGfUrtt28XQ0Jk6SRwu77wGSBhsyIEwyS4?=
 =?us-ascii?Q?7yzf2Wk8siZ00SloH6mJ5StcMqmGEZcDTg9yZzu0F/xHmyB26pIdMuYY9CGL?=
 =?us-ascii?Q?fcoCehbw47MaPFXRwfaGUsx5uIwcdjzofKcj2NGCuztUTwaJEq/NrBYeCADE?=
 =?us-ascii?Q?QnYIx3Y0zFIdkGxnCyNr5qbk0luEQ4rufCpdzuD7s/emZe2av3x0UlwDi3jY?=
 =?us-ascii?Q?OyoJ7zfVlyA0ysRyNELLyQFuAh3GZDjYrQiKkCyV9hGjSztPHoMmOf87UkZc?=
 =?us-ascii?Q?SJ/VZFE+4fmFD4LInyhzY9atMyjzhj6xhnMRqgf+DUatmNUflTFGpfelj9hY?=
 =?us-ascii?Q?z2NXZsUvDBj6KD7Qn2VDFJXXwyfY+eFuu2lJ4Y08YIUVTOALmZ2bRH7is2nZ?=
 =?us-ascii?Q?pvDQiVeUSZfq2ioYEgEoz3S9xQbdjaRm+rCBvWsV3I5/6NgRcXyNtDTNAfSD?=
 =?us-ascii?Q?ACn/7X3ehAXX0H+NC50S13T7GUCel0LaHQU/FhzzDsSHeevtOLQdyvstNfwj?=
 =?us-ascii?Q?3PPJLWVXsVCo2x9lhvliXnuX+4myQQwMl9+RHS4LGAq461ZKgZqvIn9M1lW/?=
 =?us-ascii?Q?OLJeRDlnqU55BWXs/r9tmPu5J0XgCIyI/Cg7LNYy7Ib+zzHeKWVPzf9EWYj6?=
 =?us-ascii?Q?ujgX9kRPWdm+cmrPIjl3GPwHqXNgxm+M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GKtHfioYmuWrMhMypTa0JIrwetY8ck8afC5nrNkiYjd5K1EB+5lLNSnbeanY?=
 =?us-ascii?Q?6bM7Puz2vStC68YwqmlYvj4mos9fFkrBBmPmleqSVVCDnz7Ajdzfx7gEiQ9L?=
 =?us-ascii?Q?/WoeLQBNKdE0fMiLFsc+996Z3n9P0Oq3K87uRUvBrxBBJLONVj4wCCAtGI6S?=
 =?us-ascii?Q?s0q3F7yiuNJiuRcT6mqad2snEmFPRKFMcAmq4qJdF6dSRCTtTsiDXDwWUdnM?=
 =?us-ascii?Q?MVW0NFrBXFHp1yXrXT2Wf2AyTQvxFDzmSmFaYMbVGQRC83DbHkhM6FALDIDz?=
 =?us-ascii?Q?MDeiZbB0Hm6CLM+umNtWOCaE8y0rDHFA7+fdDKREnJWsZ0ER/vHUd8RdBypI?=
 =?us-ascii?Q?HmlLN8FLjOSYao585emqhcjVUfi6cpcXQG+8Bq+0choW3A6lpTIpIh8v6xyZ?=
 =?us-ascii?Q?1OLjK7qR+IiqOm7vnabtf4WB4GLht+INAVzTUKKchrPZ1LzyHpT1r8Dwug6X?=
 =?us-ascii?Q?+N3t/60tWdGg9ejgPIDDFqio4wgebFj3BnnC7V2VsDlu8V5V7TfPaO/92jC1?=
 =?us-ascii?Q?sxN6WHLvdp90oZ+PHuuFOg2uHYasdJylOB86JrCeHbFJsGwKm5WgDN3jPQ1v?=
 =?us-ascii?Q?vHzchLPB6R41jT9nDYKWPIf5ggzHfTOarl2JL+o7vK/zrsA+yxQHXk5kBk5O?=
 =?us-ascii?Q?MDLwVdOjKqq8sJKIv4iUoofX5pAdHe962Cjax9FuhDQ8p6p9F6hpmZ5rECwg?=
 =?us-ascii?Q?OIxZbtp+ShArD2oknIM/PnR7O8pbs/CobM3DHkT5uwUPWFrEmGHnDPLUSnpm?=
 =?us-ascii?Q?lIYer+845okI2TLdBfusqCi0fd8JwnPUFgs2sS4Zt/Cf56UhEwNtBt1wynUY?=
 =?us-ascii?Q?irXRaifR/Xe2VtqYvv3FzJSQCrryhn2FFl/OLOLF8p0oAY+6LSmbltJT+aAD?=
 =?us-ascii?Q?Ui2shRmgJzVnh4fuP1FrFicDGI9170NZDhd9UhwfFgBDpxjJ3TIrpJKuYPEk?=
 =?us-ascii?Q?GLnb3O8BhmK10jscUSOGN3enDYUX+wPTVcOEce2n/djjGTOg1vVr9XoOHag8?=
 =?us-ascii?Q?3pr+65jFWYVEjyrodnCOb1HQprGNyOT+U3LAYj847x/Cy0GsjDsmFDJsMvDR?=
 =?us-ascii?Q?kUqVXAefy+PWN/7iD4grE5j+d6EsRHX+szYzF4FAYJ8p3XK/fc1YeO4MVQrU?=
 =?us-ascii?Q?n8kI14uDg/aFXzX77AcFFKE8dHNBETr6wK8dnbuwSluJNFtYBzrfkH6+Ak/m?=
 =?us-ascii?Q?ojh0eKknCFnqi/mxkpg2Car6AR+bDWsauD7egteIuIo2vMVbwkmjqZayi75E?=
 =?us-ascii?Q?oylLBAfU1VRrqBkbiR4FQJBHEoLi13gb1DdYU2XUOq6Xt8CzKOSrmcR+marw?=
 =?us-ascii?Q?i9J8mFSaCkHJUO1FaclJR3mkRmLV1veQZwDDczBCmIVPW6yJh21M+FMOH1cc?=
 =?us-ascii?Q?6bZxevstuYFwiVwSCrnzDK5hzxHn9Ls5LILLaymHWOznKE8D9rUdWYSp+hjD?=
 =?us-ascii?Q?lOLk0eccdb3ac/OvHTVv3zM7Ew2zrnERb8fCxPEIQDZC4gv0SoPWgctbLRMw?=
 =?us-ascii?Q?XATiJNtC1rhTOkza5ZrASwjLbuh9wh1Bmp1a1uy/T8aWCm6QLKzo0zP8ADCn?=
 =?us-ascii?Q?zZyq+wfridrtyyx1IPg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c505c7b2-24db-48b3-1fa1-08dd1f979ef7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 19:10:22.6163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xaLCNQ2ARwdiWrvGX5A6ubeDUqmYAovSK7InHrmSjUHIMwSx6e3y1cmFnhvwPdJsNQeMohAvNx/umgEmjqvnCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6907

On Wed, Dec 18, 2024 at 12:42:38PM +0800, Carlos Song wrote:
> Compatible string "fsl,imx7d-i2c" is not exited at i2c-imx driver
> compatible string table, at the result, "fsl,imx21-i2c" will be
> matched, but it will cause errata ERR007805 not be applied in fact.
>
> So Add "fsl,imx7d-i2c" compatible string in i2c-imx driver to apply
> the errata ERR007805(https://www.nxp.com/webapp/Download?colCode=
> IMX7DS_2N09P).
>
> "fsl,imx7d-i2c" already is documented in binding doc. This errata
> fix has been included in imx6_i2c_hwdata and it is the same in all
> I.MX6/7/8, so just reuse it.
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Change for V3:
> - No ACK, so resend this patch.
> Change for V2:
> - I have tried to fix this issue at imx7s.dtsi in V1, according to
>   the community suggestion, I make V2 patch for i2c-imx driver to
>   avoid updating the FDT to fix an errata. Discussion in V1:
>   Subject: [PATCH] ARM: dts: imx7s: change i2c compatible string for applying errata ERR007805
>   Message-ID: <20241021031148.2682015-1-carlos.song@nxp.com> (raw)
> ---
>  drivers/i2c/busses/i2c-imx.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 350346a7892c..9d5caa032c5c 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -335,6 +335,7 @@ static const struct of_device_id i2c_imx_dt_ids[] = {
>  	{ .compatible = "fsl,imx6sll-i2c", .data = &imx6_i2c_hwdata, },
>  	{ .compatible = "fsl,imx6sx-i2c", .data = &imx6_i2c_hwdata, },
>  	{ .compatible = "fsl,imx6ul-i2c", .data = &imx6_i2c_hwdata, },
> +	{ .compatible = "fsl,imx7d-i2c", .data = &imx6_i2c_hwdata, },
>  	{ .compatible = "fsl,imx7s-i2c", .data = &imx6_i2c_hwdata, },
>  	{ .compatible = "fsl,imx8mm-i2c", .data = &imx6_i2c_hwdata, },
>  	{ .compatible = "fsl,imx8mn-i2c", .data = &imx6_i2c_hwdata, },
> --
> 2.34.1
>

