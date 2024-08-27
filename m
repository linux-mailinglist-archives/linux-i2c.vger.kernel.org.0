Return-Path: <linux-i2c+bounces-5820-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BFA95FFF6
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 05:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FC2DB2210A
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 03:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E1618AE4;
	Tue, 27 Aug 2024 03:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="VAejKCaP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010041.outbound.protection.outlook.com [52.101.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002ED1103;
	Tue, 27 Aug 2024 03:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724730542; cv=fail; b=M1M52escvlUbNK7rH+yD1oDXU41EyLFmxPwi1nEvyDCdX654ho+y8twojjUPRnM0SYh3g7EfKFfq9iU29KddBfCo5JFd9ot8hEDLz/C0eg7l50FUoN5gTAAIyxN9nkoL8gufmEYLYRGdMFxvF2lp4i0rnB/sgA+wfoBa4PBtIR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724730542; c=relaxed/simple;
	bh=vJJS7ekdcQYn7LxkVlm6QEDVn6+hpeVj0b2prhVhr1E=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=s1xVvKfpVhWKRNLinq9YIG85hSCqVIZYzoQneqPEzhh+WgFxsZXrvYjJnrRHvHp38oRBVHIcHRDh3ZgSYPrccQLJ8VlCH/5UsQZQYmOxCTScOWd9d1S9FlYiHJOHojeRycttfFJRseXbPb8p8KcwFJkf2GfYG7K/qELaSSVFM3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=VAejKCaP; arc=fail smtp.client-ip=52.101.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W33+XFJPEms9Gp0uQuxzMdS+ZrxoxOpBjb+KtjgsE9Pu4mlC8q1TjunfayiGybN+K1rX0xut6qB4VsCNHQJKWz2EaEMn0mmQ+kApyl5cRcYb8SGb+JGerz4M+jZ/V1gwfd1Q6HLVQ7FpYeerJCYXt3W1aCO0jyl5xCmygevfYuRMwK7kPpu4lSwNeTjYHh4enBJYD/ECF1eEGhoKXbfBxta/DjzquRlr4PWDmlasILxxAvxlkY+dQg+rsiMI4aPYnM7ubTjRLKxjp0ZHlTg3/uLbX2564TfP2YxJcpfq/5FDXKIk/PcCJ8QxZAIKHlrIP+O9xaIZANzoxf0D4hONGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uaje1ky2wAkjdvCUX5mni1c9xPod5TjU9Fun4I8inY=;
 b=uM8WAXaPTnIlH0ABVydqfAUxsGVjsai5s7qUd5Oem5b1AapdxjS6QyBSg9QOUuit3GkQNiTsYiSH/vrbAG9COjc3ypbGS890QmvjNogZFpbW57pqMylRR7OwiE/nXZUCCFr4ULXEDLgGgQiXvrRUHfoytiPTozrNo8/EsP7QO/qm1hUmHbn+D+NkvLEFAEGBxLt1PvgkoePEReygqI/9FE/FrDHg+5titCBJXpui68bZcNgeLBILPax2ppRgRkC7793ZunPdW/pwmKVxyMbUhh7sb8tbu1eVUZcn3DbwQA/NZ97fYcd2nuOSEXVW6yBD8MVuhz2YP9zlJF7KT3AAEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1uaje1ky2wAkjdvCUX5mni1c9xPod5TjU9Fun4I8inY=;
 b=VAejKCaPUKaQWY0slVW/jL8jhouCWwUNwHs0opSAj0pb1+wLSniNFgkUqCgVZ9B388ky4nQCkXLjvazQ5+R+wE27pGRuTUILE+PSWmB0eoWNFau3Za0dau+elQFjVX0B0kZtIMLzjYun7PcqNrZ3uHkflWfsuGCuL/yhFv0c5Fc8REfPV4QA6zMM3zzBFCb3HlV6DbM9aUOBxcSYjNC8mIZuL1VOGvGW8wKPHOxLlJLj2pShtazThYpncOCD049TlBXrA07xMeiM7mhKXqf/1w5iQkzcuLJmojn2gA2Aj61DjlEwJR/YL/NhN9aBU+jWyNQKVE5D6LR4ifgfqioamQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB6531.apcprd06.prod.outlook.com (2603:1096:101:184::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 03:48:55 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 03:48:54 +0000
From: Rong Qianfeng <rongqianfeng@vivo.com>
To: andriy.shevchenko@intel.com,
	biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: [PATCH v4 0/3] i2c: Use devm_clk_get_enabled() helpers
Date: Tue, 27 Aug 2024 11:48:38 +0800
Message-Id: <20240827034841.4121-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0131.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::19) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 9acaf5e4-437a-4777-bf3a-08dcc64b2c1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dD91LzV1KFrxRGBA5yPVU2B80sfdSgn9g8tGY325+sxZxek8wYe92cOSZxPh?=
 =?us-ascii?Q?g0KNPdxCpZQ+kH3BgjZuua0lxkBfn7lrr44lVYb3e3UFvhzKlDx+D0N1djHt?=
 =?us-ascii?Q?uVn2unDRpI9yI6l48HKngZvJmGaVo5kfKpJlecKHKEv5tvFQiTSSGc4s5SlR?=
 =?us-ascii?Q?YrRWho/vJDGwrfxzRYgK6WxVxqdzxaghgWI/RJ4IKRtiE6IKvyr0RTTq3cMe?=
 =?us-ascii?Q?/haTOsMZv8rVxLZNJDxWOAvBfKba3qf1duf/7dgDyCX9Ol1Ie08FKNp0mx1a?=
 =?us-ascii?Q?Qeo947bOUtU5SyootcN8fzM04zb0Qn2w9d6yQTZppy485BEBypOIJxM89gxn?=
 =?us-ascii?Q?iKinaGSBrfL5Mmo919ebcA5m0kjnLzhhC1tzyVGw6D2Hy/CvtPJ0h0BjyN/4?=
 =?us-ascii?Q?p8fY4HRkMYS6oG5xS+P59w3wtUHdjounuTN1jrdwoCgoFWGrI3Qh+G/NMAqw?=
 =?us-ascii?Q?R8E2KqJURku+jq1SUMfPCJtZnwqW6XjUfqsUdPArRNAB94J8hhEV9GMAHtpf?=
 =?us-ascii?Q?qKd3HMfo4Oj8D0/isJM500+V/cxqS+TbZxQbXUpm393u5UNgHdBtNjTZsLf7?=
 =?us-ascii?Q?d1xn7OsF2vzaewky9L2XkYkHxKz7elyDL3GAElLr4YZQUR4mBIIKZsQDCJoM?=
 =?us-ascii?Q?kqbDsOH7vVyjnm8zzoLoh9zkKbSm/E4wU6ct3VaY2uNJkos5eeKoefC4Ecc1?=
 =?us-ascii?Q?E+jKWCMj6C5ZKtDz6GOskvbRh+aGU7r1RTHcZ6IlizyiNMHqYigYeiFCx76S?=
 =?us-ascii?Q?mQDrzC8IlHCrygty4FJ2c+xh5lrOYhAs9e89GOA7z3hJnzXWQrO2SeRbqjdV?=
 =?us-ascii?Q?MHhZ+FfzJkFj4Qj/sWKOc6Ge4vJmqMf8T8mC2gsBabyKrXwQ1bRFPLB6wcva?=
 =?us-ascii?Q?N933oofYuir+6sJxqEGCIOp4IvYbc28G2KqTPGP/oqOVcxLaG+uz58y3q//e?=
 =?us-ascii?Q?78rErhmLmmrLIyywem6iN40s/udLEhrpAYP9dljaSgHQv1M6edynaX3u1ER6?=
 =?us-ascii?Q?DcgzcVbsbi34HopzAmgUD/eyyCBkuhQ9OF3C9WVZZcM+84a6PD7up9idqYYc?=
 =?us-ascii?Q?i1wEiYgbQVo7lk0DYIV36LIyKaVzshGinWPb7lKnRby0zwmrSAU5yMUkngH1?=
 =?us-ascii?Q?rH/wWzpdWdSmkBru5mI6PScD30aj3z190ECVCL6wRt5lBsh1hwE/oQDo6CKz?=
 =?us-ascii?Q?s132vFqAVPEQB1RwKSwFQofc+yFnKsZxbZFh05Bg3LhGvf1IsPEnjjAMnWmt?=
 =?us-ascii?Q?0j++v5tzTZcy69fROqjjpTIxHjbHxWpIxGoB50sJwAo62Z6TAkLg+VWup1kU?=
 =?us-ascii?Q?KX9yJ7ZfKOHB7q88G18Hws80ksyf4Ogk9lI84f0ZI84ge+/rLrPIyApFANEb?=
 =?us-ascii?Q?A4S1syB475NdnE1SJ6DfER4yb3hxRYb1pSPo6j80uYYxZ6oj1g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VPcwextltq9THHP0TBoDRfRt5rHYbW+C6OFuIBJDymIUjuuDzdflngWvlwn1?=
 =?us-ascii?Q?k22rUk5NfvgElaGOIHr+UAS0cLgB8HoOBMcUg8vN9IbvRaz4EOglm2SF81YL?=
 =?us-ascii?Q?YDxFX2gXTbZ3b3rIXaqGjLgtWj+k4qsG2aT3B7J3XmsH1lcY+ToknvsYWmQI?=
 =?us-ascii?Q?z+5z7nbJftUa5L7HlxiDnw/L7trvx4M2rNTm49nicBBuT4+2zftkXnsIuiW+?=
 =?us-ascii?Q?tnq5qbn7YOFouCqDy+Gg3+LIlCajVsstC8dmzrkslVs0auRBbbtVMdRGE6l9?=
 =?us-ascii?Q?N5b/Fz3gK1nD46sQ4IpAqmfFlOTbsykONdYGmI5TGwb+2SmM2OndnBANJ8Op?=
 =?us-ascii?Q?yJTDtuwRMPcj08cTppdySIc0mqzGszm7Tdqcra+rC+aIdsfEg6INgBhJAOhi?=
 =?us-ascii?Q?cFY6H4QYRhR1D4u3TG8GonxRsz3bxaMZ0a2c8WmnTZS9+pXJTqZWf/STo3+4?=
 =?us-ascii?Q?WmWTUlNiaT+yAul2vmRLE97EjGdBc3bdFZuZ4gL4LKo5UqhbP8skNnhvS39/?=
 =?us-ascii?Q?1lPMZ/n0OYffvU+1n+IUART1t7AcAcD1zqh42xQOpxxSO5lai3d/lB/58/e0?=
 =?us-ascii?Q?waU7CI4gPfJI9e2CNfcuTTABvEuvYXXhyTHxJTGqgdwj05RBkm/ifb8QVe0V?=
 =?us-ascii?Q?lwIyQwrUGkgSFJyxOlMRMQx4Y3nD9BY9ZqCBVMP6fkn42au2D0eeqh+5qQ/J?=
 =?us-ascii?Q?F9g0agnJAMpTeS3MMDqrxDIThS3oIu4kv2ySWyAkq0GM1/IYN3l6xZOCRtY6?=
 =?us-ascii?Q?wKNCVSdG7Xc639NG3zC1cjDsy058rt996GCg4F0f5+92UW0kxEFZJlIHkgah?=
 =?us-ascii?Q?/NNNJYwkdoPHQldPnYJezxUes5ua+Ycn3gm7UWmTmWAuncTOGtDeXszG++u8?=
 =?us-ascii?Q?H+g6jWIvGf2GBUOSKBoF4b/I+wsnp8hS/Pyxl/sJR5i7af/m8I+I30FviE7H?=
 =?us-ascii?Q?TOCGIOtYHd9zpkXDsUP/wDxabNTfNQa+0Bd/276bPKHkuugqSoDxUTteU6UN?=
 =?us-ascii?Q?4wRmtiqsAStv/JH+VEY1TLA7zwlnt/Id1CPqFy3CH1rUhItE4hRqwQZbp0pr?=
 =?us-ascii?Q?C2Z1ChXqW/F8K/uTJgV739tznrAp6oBgRPMdrtPp+jjERFnqaQ8wtExs0Vm6?=
 =?us-ascii?Q?agDP3SB7Y+3esITe2ZoceZjs6zp3UtHSgzidRFnIbGF3b6TnZjHoS1Fkv53q?=
 =?us-ascii?Q?JPvBq6DkroUFY4Ai9AoBHGIClXMZGYNovkmjgwWv61Vy7qvJzKOXUZGKec9r?=
 =?us-ascii?Q?HZjfYSHwZsQC9Uh2wni+PUIFzfnbLQy1Ii0SgDHM8AGGxa7/BURgf3zPdSRi?=
 =?us-ascii?Q?0er9B7WqGRuk03GgWrv9lAOzsvtCkowZpRNivU/4N2xJEerrcrG186/tt3FI?=
 =?us-ascii?Q?BaHiOX7ASewELK6xf220WLmQ0qEl44M6c2oSShkyEV63CU3w2dICWXl7rwMM?=
 =?us-ascii?Q?9WZF8PhL5qPIdCXIlWP0Llo+q7akl6LMmS1ck8gYay8DacC0SFgqMIWAelBn?=
 =?us-ascii?Q?hNw852578KZUP5frGe2ZofogQON5BVQvp0MmDCR4GH18kGCIV3Ya8QLRUjIk?=
 =?us-ascii?Q?ZegJd++2gsDGnUOf802rkUfAvpJxYWiwWKmwYW0i?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acaf5e4-437a-4777-bf3a-08dcc64b2c1e
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 03:48:54.7569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atRbnY3xFBx3L2GjN90qiOX0dXcf0wDWfDchX58vqFQ391WgYXHE4FTZsSP+XekXrjPCX+LQs5cjwyPMYafvHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6531

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the calls to clk_disable_unprepare().

-v4:
 *Use struct dev *dev to replace &pdev->dev to further simplify
  the code according to Andy Shevchenko.
 *Use HZ_PER_KHZ to replace 1000 according to Andy Shevchenko.
 *Add or reduce blank lines in some places to make the code more
  compliant as suggested by Andy Shevchenko.

-v3:
 *Add another patch to use dev_err_probe() in jz4780_i2c_probe()
  according to Biju and Paul.

-v2:
 *drop sclk from struct em_i2c_device according to Biju.

Rong Qianfeng (3):
  i2c: emev2: Use devm_clk_get_enabled() helpers
  i2c: jz4780: Use devm_clk_get_enabled() helpers
  i2c: jz4780: Use dev_err_probe()

 drivers/i2c/busses/i2c-emev2.c  | 25 +++++----------
 drivers/i2c/busses/i2c-jz4780.c | 54 ++++++++++++++-------------------
 2 files changed, 31 insertions(+), 48 deletions(-)

-- 
2.39.0


