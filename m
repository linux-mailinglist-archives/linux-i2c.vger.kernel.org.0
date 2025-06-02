Return-Path: <linux-i2c+bounces-11198-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39986ACAFD5
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Jun 2025 15:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 920C61BA3003
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Jun 2025 13:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DF71DE881;
	Mon,  2 Jun 2025 13:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="G8M05NhT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EFC1F5846;
	Mon,  2 Jun 2025 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872574; cv=fail; b=lRIU8wYvheMzxscHydXSMtvlc7AFlVWTWdiBSGJOk5wFdyOXUp6vL+aVr9lyhQxhZPIBthrJVB3UregHIdjwnqhTgJrtwUjy3OIPBJKC0bicXgo43x5gtamCY0OE8uHjjY2j+Zu/Kc4yo73R6VVeanhVGSxBG7DEGfwGIA5Fsrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872574; c=relaxed/simple;
	bh=RwqUooTXkw8F57xGvgflmywehpL1e/5XxeLRKfszsx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IqOX82ONzJsG26ULrvN8tKVfnsUh8qKL2ze8BEVMQbhWYxJkEg3YQWnud/TYopcIeUOzrvy7PClWWVL2hVc5EdDsPHLEuedVqWw293CgvB/i/aeKsloNqUwB1LaK68/iED4vCauEiUSgUQwme5WB7/towbFU4Vy+NmXnmOU4f7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=G8M05NhT; arc=fail smtp.client-ip=52.101.70.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCakt7GPGye+FYel8QPZK2sNZ/LrzvPxYRjW7RIwPh8lqo2j1xRJPfpos7MavHS6pbC9wb9DxHQ/+hGRyDri68kGLUcYPSrAk+N6HenMJINdrzf4JfPMOw3gAT3R1pHnDt+YFnKqivz1NHVAl6vRv3mcR8A5zQKpDo4/YH1VZGkQyi1oCxATbKAX77AvbDWBbf6XR2Gby83Wsj0DGXTezUM3FOU8UX/fXUhRc1/60BeVmj5dKS2VbvKE09k8ZGDLuIic2xxiiIAlCC1GGvPLw/8JQSDIzqO/xKK4Yd57zp9yWfmDv06KcTK52CFtNOr2udxq4efFYIndlrNfEgrDXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zqgknQgdVoam/iX5xyslGoPOZBbSMneEYw6Jou11dA=;
 b=V+2Bzn0E2sOIpHtBiraHJJgJQo29tLAK/O1ln9xA/gtznNPaeh8h3BSuYLcomUUJWSqInmWjReLIMTYHSZkRqAK18zKuQmph1AL70iBl6PEdwxW3cDlVCbA2u2kjH6NaNmaPrU4ASGPFrxE2j449W97GoYfqv2JNebGXPU2ia1v0yfKIK7AGWjSc/ZckHY5KEem6iRALXgV0h+HfoRZsc8CU6S6cahxI4ECIQCI/Wijwkob8Bll1aC5RWU/FY4D02K3cqrL6GaNol9a662bLivAml4piYur6xzCL0ClzMU5j9P08xEAUeyDdtTBOLCpQZO0DTypd5vHe/x8E49hMSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zqgknQgdVoam/iX5xyslGoPOZBbSMneEYw6Jou11dA=;
 b=G8M05NhTnc6S/z5wf0tzBHwyV+zyEG9Dh1u0QSI/J/94BqqD0CWGNoz0OOAFf62hgf1ZIDKpsxrurFSukspOPrJNXLoQqJwbsinHq7pWJTCE+exV4/pybz23jVy02y9E+pSNhcahtbY6tYKQjMvTlDAa1ZnA++ZbweXT1rg9xo1Jza1AQY0e5uHnmcoTNMJ9xlJUkjTZ179H3z0jrAn5Uj1ARl+yYNiudSxTeVmhmTZJsySleI8KeIXP93CXbqc0b7uw4kKxvquEdIzHh8BR7g+wmqtuVLIon0FEh0AsxapD/x1f7/aNyB94Pty2TNG8w0amfUONWkIMAhgAzluPog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10689.eurprd04.prod.outlook.com (2603:10a6:800:26f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Mon, 2 Jun
 2025 13:56:04 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 13:56:04 +0000
Date: Mon, 2 Jun 2025 09:55:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Yongchao Jia <jyc0019@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Carlos Song <carlos.song@nxp.com>
Subject: Re: [PATCH v4 2/2] i2c: imx: drop master prefix
Message-ID: <aD2taZeLnUadtwy0@lizhi-Precision-Tower-5810>
References: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
 <20250531-i2c-imx-update-v4-2-bfad0c8fd45c@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531-i2c-imx-update-v4-2-bfad0c8fd45c@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0111.namprd03.prod.outlook.com
 (2603:10b6:a03:333::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10689:EE_
X-MS-Office365-Filtering-Correlation-Id: 49551827-63b2-4540-459a-08dda1dd36e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iemvnslyTqGWMV8TNUtLEEgJBaBflHzC7BLES7QRAsRf1Z54jC+uOYVGxB7i?=
 =?us-ascii?Q?Sq7x0h+yctMUGIP4r1Kb2ZFxjMvVthh1g51oohwuHdPLLvJe9H9VJgg++WCD?=
 =?us-ascii?Q?rvomxTgPvn6Zbl+eiXoeEudBUnsg3IClKOkKK1ZgeOeAti8bDm303qgWG9qR?=
 =?us-ascii?Q?/YoydgglKyvPtsJHfVtGRRovdeR05blqRA6atETnKaPq20OALqkpDAbo+k0k?=
 =?us-ascii?Q?qfD8hopHTsTf7ijaOih6jPFwjdmn9Ebv3S6Oj6LPfwxZeisnQJzpdyMdB5Uh?=
 =?us-ascii?Q?PBMoy9jYT/6p+CielJA2TdX1J+Jd96KbPV3x/6ZZh4JPkt37HWMBzm5usNGU?=
 =?us-ascii?Q?v9idMzHJyyDQhLSLgLuf/79auXA1NutN5lwBKvxvYZaTDEjMuJhxz5KHCRLI?=
 =?us-ascii?Q?nayrAbOxTICuLiFru+BxLnPYuyo0xsNOw0+zl0IfUnTkRs0cu0VJAUfNG/Ge?=
 =?us-ascii?Q?PwPcna6kDfeg89efYxKhFylhsmGLICQWQCYZpkmoZY3JFnOTtpnAa8dGZVkw?=
 =?us-ascii?Q?9QoDUCRfDet2iQngu71URqSAtzvQnS4AgR7ijtHI3XbVEiiRkwT+6A4QZECo?=
 =?us-ascii?Q?VR3FuqnsK86vfsO1C0sNuRMIHDAK6GcPs6jKhpNIcIAgF4ZPJHou68PsTnVq?=
 =?us-ascii?Q?xjHPnL/x0bw5iwfsboA8OZPgkT7LgM/xTmqb+aMuFV0kyIg0FXz7KD5DlbPe?=
 =?us-ascii?Q?FjVwjGAyfkJ2GqTYrkN1JSF5EutZWxHP1f37qP2IhaUTB8p5WXBiCaN5Hr9Y?=
 =?us-ascii?Q?0tIoKC8Y4Ez3ha2/ZufBJU5C0y821XsUiwf4wLrpMJx2/3VBD58IWn5jjD58?=
 =?us-ascii?Q?tRbng602vSGrC5BQGTQWwnbPc0Kylj37HfxY4gAXpNJxTVn70rU4YReZ4W7c?=
 =?us-ascii?Q?qMHTUCaaTNWXJCsaQ3HyIVKvB2FgEsUsrmEFlrvGhXYJc1OvBCElprIJyifW?=
 =?us-ascii?Q?l7SAxDtHU3zA5WiaEswJEhaljKJTylDEodKJNRCBXz6ijalcuVr2skEgeOal?=
 =?us-ascii?Q?eYt8kZGtNszn3qmf1gLyA08r6o0Mr82IOTsENk/Wztk8kOq9ko3Y82abgT0Z?=
 =?us-ascii?Q?n7CSjiYtiDRKb9No4giS7NusRuv8AbJiYOqTyhLcpoPEpJq9ixbps3aMo2oH?=
 =?us-ascii?Q?cmJgtbP5W9kUCTEa7D1r14eEmuXlexvSHZIwo13VznXe/QzekF+Y9/71bKe4?=
 =?us-ascii?Q?vQEIetISO0J3qlH2IWJ/sn31Eh0Z4eQW6jW96KJWgFk9BRsb/Ur2GiGq1kv1?=
 =?us-ascii?Q?ym2xlZl4xAUqNIO0AWuTxnbPwzsK/tZCtZaCgJy8ElYFj0FDIzkSEZrYstGu?=
 =?us-ascii?Q?QabdwmIBd7/UqCvMG41XHF1MElQ9GTYQ2RKgzXAp+6w9HjMtPZnvIo+F7L6t?=
 =?us-ascii?Q?1wMb4cNzg2pkgV4UATXm1o4KHZWRK/89IXy6YoVwd92/tcfJLWDPX22qokcu?=
 =?us-ascii?Q?8pUACvwRyK1tjeQwU2SZ4oEE0BGKO7RCET/Qvlt45BXrLl56Eg+Z3P4BdmQL?=
 =?us-ascii?Q?yOu71mp2GQL+zWg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SoUs5ajMoPTwKIAAQLqFqpFJ6UKSLQhbVZoeRYGrYA7chV2uXo+F8DEMx+KD?=
 =?us-ascii?Q?4M99JkOV1UyLIxudQuGEaROF0q9ytpi5hh0WM2NtICzzdq5lYw+fp3NNcw5Y?=
 =?us-ascii?Q?CITywF3FSh/S+2fWITHCALMc5jWBX+CJbwKYa3QX/AeI6XVkklzCjP9+nXoO?=
 =?us-ascii?Q?7zMFws7CbIGCUy/1Xx+QhifSt79+vH2mYFKqBN4ZKM2JvM1A/wd0xfLFzkz5?=
 =?us-ascii?Q?5/A7j82U6n/n7HTzMyfz+LNMxNYdRwOOyoFpvu5tDuTPdPoF96dA7FgjF4lX?=
 =?us-ascii?Q?gGpgAK7J/se5EQSzlb+KpntmY/vGs8n7yGcpLjF2CO4leNy871bI5bLip521?=
 =?us-ascii?Q?ez8RN3aSSEkOFtUKH8AJokZguedV/uObHqrkSpqUbzr0052zlKrvx40/9IE3?=
 =?us-ascii?Q?6PvlB2gX3LFxEg08iJ1Sr8wEIIko7re+LLXnCv+iULY7dy7sSz3cNzGKWnQV?=
 =?us-ascii?Q?IydhxaJfZDHer9TlXrzjy43kijfyLivFRmDQIjm9qA/wXevIyOwZXh763IAy?=
 =?us-ascii?Q?yv/2/TEDMltmpmBnpAK9k1OAIh0wzqVZr4740JnqAE6iAkdoGjUZ/i4STWeN?=
 =?us-ascii?Q?G4Iv8KkFD0CxpZjCl5DuKBVhMeFY5k4QaWDi1m0XZx4Qbq94n6Dj/h+93kwe?=
 =?us-ascii?Q?Das7HCH2nGehkvjCmJ7KjsAhesMC1aQk99CA86/MUOQTltFsep0x9ngnc5Q8?=
 =?us-ascii?Q?PBP+YQD7Zofj7m/Jh5VjWtxhC4etdumBkiK5/4gDpyXBMDgvyPsRbfJk1+is?=
 =?us-ascii?Q?BGraKlqXjk2/q3J7XYCK7uAl+tXwiqnw9OmQvB5HXasFgQZn7qPdVnb3RmUo?=
 =?us-ascii?Q?OVU8YwHSTiUR983S6MuySaZnFN6UZzibodarugJdE5bRznilK4reqjxZeuWP?=
 =?us-ascii?Q?UeUtG+tpY5ek6PA4hUUOp0xaFpuQgpd3u0OFzTS5pE/NCBgzdJxH/2N/4Yus?=
 =?us-ascii?Q?GCkbYQhk/b66iudHjsE8xkiJMqGLGQZhjCsqdCTDRw5XyDWiKqv0L2JIBDiT?=
 =?us-ascii?Q?vyz3yVKX2hkhi35nffsPZ2G/cuRh6xp2QwTdskw29TWCFX5hPsTwTgFNpP1j?=
 =?us-ascii?Q?sVGWjlzDEgoHU1I+2WSuxdhKhbPtrLXTS+ilGGhZ4mUWVUYpEXsFzu6mjyhL?=
 =?us-ascii?Q?ljC1bTbFCfUNC2x5juTRjhXcIUqdy0YL778IzVp3OT0oi96i2PoK1XzvpnUE?=
 =?us-ascii?Q?eaLKKgn1/UJB12LsA2ImFgU1F15jawMkFlCtekptbFkwUSFRT18TiWj+EJuQ?=
 =?us-ascii?Q?D3FQZkxNOMHEzOHFRIRMxi3wnxVEigU86Un+aZpyR05YTj397osWddiykjFC?=
 =?us-ascii?Q?312EHu3R8y1vKs60dcboah5yrGryfonjhbBhCiCqiw4OBddFslEaq05R1wZ0?=
 =?us-ascii?Q?A6W1gZv7QLeY/6yOY/C5Ug7urn1YbvkaQtHSKmaM31Q5oj6O4OHlmOD+bjfx?=
 =?us-ascii?Q?Gba5XypuwB5IW8e9aEKqoFh8+dxoHvzSq+iICiFYtonb0as2mdLsU8aaJbfM?=
 =?us-ascii?Q?/rKONV6zf99eXMeGHG+eUH4INDDMFfHcpi4xDWSj2DCH0RYG958ioHrQPySr?=
 =?us-ascii?Q?7k2eSZ1sF+PHOwRr4Pk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49551827-63b2-4540-459a-08dda1dd36e1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 13:56:04.1414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwY2ecFiEr6Pftrosn+cruuZXGz/XFxFZIt+ALlJaA9fB2Nmr9onWCT5rFHsh2OPWvaE+KGnYrxGbWbxcwHQtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10689

On Sat, May 31, 2025 at 02:57:27PM +0800, Troy Mitchell wrote:
> In light of the recent updates to the i2c subsystem,
> drop master prefix.
>
> Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Reviewed-by: Carlos Song <carlos.song@nxp.com>
> Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i2c/busses/i2c-imx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 5b276e007292..d85adfb73bac 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1687,8 +1687,8 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
>  }
>
>  static const struct i2c_algorithm i2c_imx_algo = {
> -	.master_xfer = i2c_imx_xfer,
> -	.master_xfer_atomic = i2c_imx_xfer_atomic,
> +	.xfer = i2c_imx_xfer,
> +	.xfer_atomic = i2c_imx_xfer_atomic,
>  	.functionality = i2c_imx_func,
>  	.reg_slave	= i2c_imx_reg_slave,
>  	.unreg_slave	= i2c_imx_unreg_slave,
>
> --
> 2.34.1
>

