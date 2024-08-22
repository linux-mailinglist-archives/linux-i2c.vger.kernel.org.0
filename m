Return-Path: <linux-i2c+bounces-5674-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA28E95B7E5
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 16:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06B301C2345F
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD4F1CB31B;
	Thu, 22 Aug 2024 14:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="oXkf0Qmp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2080.outbound.protection.outlook.com [40.107.255.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EFE1C9ECF;
	Thu, 22 Aug 2024 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724335476; cv=fail; b=mcf2eNxHz+PdXfBrqSvrg75/ScWRXLIdbXwpAjMGGZFWobG0mgWQ57EV0E1+YnqpNxT08P1KOFQOE4Qgft2G3lgupkpJulW+xYLfvaWx/zPeYj7xJ3gtX/7351yPS9xhK1ifetghPmnIOWuFcNJTN4WPeAOn2uIdnEIcZo38Q4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724335476; c=relaxed/simple;
	bh=oAFT1wjcx7SbAC8UTvPiltJMP7xQEfvuaz3+6aqU7wQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=O8HvOt0wnW+5fZrlJEcX7QVfeeZtBq6y4Joowugy15TB5n0E4GoW5YAl8kLiOetcRlIOR4sn8YcYbyOP/D3psE1Bpv08+kmN2hlNO95kKAmzZN2Ra/q/cygVW+9tHj/6g8veHKY1apWw07gDmW8fXqv0X/4qkMpWZylgWjfLpew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=oXkf0Qmp; arc=fail smtp.client-ip=40.107.255.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ur5bGaAlF92IBj5Eq8auxUJvy64TFvaF7CtNSg6SeKYjwaNzOsiztFiUh+RdslRssiP87BQGIIfnpgYa+NPjqTGuM3SJLTR+BtyIDRWEt0cmikqNAL4946b05YZ99UdWyLuDbEoykhPpHENEtrO2Nikb9NxZEu8xsRzXQ0piNGTOlUot0DL4IdwyPbP+C7Hedpuvrv979nF/qcLcTYKVYSuvk0rkCAQo/b+34h7qi7681KQ5Ujem0WWQAQ8E29N15csAA1MJP27Lf6CDzwqNUbLBU7tgizfTEKYNueV1dUfd5CyeDyY2d4IGYQnaXsZ8zWzvC41nIpqL/T/izsJX4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSS4RiyI1a51eACBBfHfRSs5meLzsvX9YYU9KrjnelY=;
 b=zUDYqTrTYE8T/wvWVsy2Y3Zbg/2Rs1C39r2TajmScLuK6ctA842RAMGN77in93gHwSisX7cyFhzUNLwSPFm8y2VzZ4JHuK3uJ+cSUJHXrwXPZwLOU+SR0zA1RVwMbxUzqDrD1I7ZAEqZ7vOdLfpWTNbu5AZl0QzrXZiKjxYfRqSastsZw0L6nn+a+6pOb8oXC9oteuh+b211MKH5X/dIwF4oIxwqUxfCK2TQaQqrTN/oGeYTSDctFtTi1yf8AyJ5TNbr4Pj7iKORab8kz6GUk2OqAuls8dII8v2Rk6wmYSANltQKqMIcUOug6mYLwLqQaVbSiQ04XAf9JV6/RQycEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSS4RiyI1a51eACBBfHfRSs5meLzsvX9YYU9KrjnelY=;
 b=oXkf0QmpDOZSWvRp2pS9ZKeRDBBUvvFeRFPIxrZzE5UMCdL+Q4Phu6GnbRcVjT6brpBQQAOvACxuiEDn0c2NUxJ6h5iG4VvH+8HhT8hLdJEloJg9ZZstBuowL3wO7TVIgFp6hjaSuoV6XRMopl4F0Od0KZRbxh4X9iHgHpmdcqC9nVOqriulDOJjpdbjghAAQo40ZsEl9k8gJRM5ytPdoVJcuk4Tgi78nKHLOQwt4NTQq/dMhDciMzCepTDRiNzUZg67zZHyWKyMWYffWUElyv2S5F2pplRbhODm3uWy0zKpEFfpud2yy36azIKP7smbw9py0a1OAlpiM7qt/5GRPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEYPR06MB5301.apcprd06.prod.outlook.com (2603:1096:101:82::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.19; Thu, 22 Aug 2024 14:04:28 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 14:04:28 +0000
From: Rong Qianfeng <rongqianfeng@vivo.com>
To: biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: [PATCH v2 0/3] Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 22:04:09 +0800
Message-Id: <20240822140413.65369-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0294.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::6) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEYPR06MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f33ca1-9894-40d3-f2f0-08dcc2b355f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xPMoXUzWnPnHvOdaVRUNdVRWKSPlWU+NKeouXnFeInedffKjkBUjJFks9myM?=
 =?us-ascii?Q?IY4zbwkRdL2IPkGPImd/xKRLeaFf41XWX+2SCcFlggnbK/TqDLp51VzZUm1F?=
 =?us-ascii?Q?O0n/R+D98isFR1sY+T18XvW+LfOoKbBV6M3Iz8fp3dvsCvo+tHGsynNmf3yC?=
 =?us-ascii?Q?N9MZipE8ihvNd1RBkJ4DAlmHmh18BJVXAuLEBBJuiGPvXhdScfHWm77u7oY2?=
 =?us-ascii?Q?afANKfj4mwfPOVBNbLKkKKEk8Vl8eXRS7DI8UPlaQ5oMDtd8MTCuMCac5Nsi?=
 =?us-ascii?Q?etY6ox6KcsU5k1x9dbiX6OdrV56q3Bv/fwuK+ayl2joUCjtqwEvseZ12pRoQ?=
 =?us-ascii?Q?Mr1ytG32NZT8k1CksZrLQH02IWb22CvUY6Gw0yzupw0b2+CEE5Swc6F8yute?=
 =?us-ascii?Q?eGYCpATzHZvMybsE25m/fAoSStHBdsqKk2WW/jq+uv9B0y/2c26k0KLWTfey?=
 =?us-ascii?Q?bEz3sufTanUyKCn3iiMtgmzpUOpJa/abDYYD/1Xb0+SN2OW9QXeRi8rrilMW?=
 =?us-ascii?Q?/t5W8OizKMtQprdxLxOZP0WhPBsHeARzA+k70lHd7GixX1tPuQ4yTkAl34FQ?=
 =?us-ascii?Q?uW6TNyT03w37jxjKMmSSxAqC9vszJVy5+tALqJgVd/0zE2szKr5HBrgzvPeI?=
 =?us-ascii?Q?lkMN/fv4KX9N2+adCTmGtcmmiPNgJOkHfW4Wcl1bMnVnfNfa5OrsoFPwwbDH?=
 =?us-ascii?Q?9NOAZwQiS8SYKnKInMhpUc8EQM0/JVealr8iT1cSLb/iljDvYJsfdfIgH868?=
 =?us-ascii?Q?eGS/bhcZM8YyKqvLCCrmlkBzv60+TqfrLcxqF+iop3lpTF62aQRRgVgJL7cW?=
 =?us-ascii?Q?TA6475vJlfHQquBCGTTAgjKcpu+K/9EfguBhHATYsOegGp9h+Z7ENfCwx035?=
 =?us-ascii?Q?yztTmLmn3ydiBcboiLeE5mnBDr2Z0f1vWVd+sxGr+bl4Qgm+iitwMqtKwf+u?=
 =?us-ascii?Q?xWoAA8b+Z7lkF+5htSFWGjwwrsenLJ2KiSAIkro0VCJXyWqTDWaJ7dsPQqG6?=
 =?us-ascii?Q?WfYU7Hh5PXfnXfNwFvTnpDshkLgpe/44Ka7grlhoacexm19LBBS/VvXKtE54?=
 =?us-ascii?Q?UBKzO3qmbVk9DaDwx60kpcM+hZV1Mn4NUGkBJg2B4yUKFmZb8qzsL76Ff8oR?=
 =?us-ascii?Q?NoDLtWTnkNe/S8bUOK8/JT7PMPYn/+EdpOFXvSgnNi0JwvFBuWZRTGtoUVui?=
 =?us-ascii?Q?W0SAxtErBFstAepU2mvUQ7UrVnQi41neVQ3m+DRtCIGMKvZijxrGWfrzg2Vq?=
 =?us-ascii?Q?SaCIkGdsI070FoXl5Hsmj+zybUQQwdm4npTlLUBRw7x3FgAhhHbrk/ERAzbN?=
 =?us-ascii?Q?yvJeJVL5tUovHcI2WqWSMtT1RJ3280t+GsDqzVwsPzodDiYG2fJJ0IjM6ANN?=
 =?us-ascii?Q?1AyBz1Mvg7D07VSIrzuFvcwNPLaoIJYE6zmIwHBgyHCzG3RxLQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?umgBFKqtqhH0Kx2rkCr9hF/qLmjdS0QlHayg2PHmFHI5oII2m7CsW7BTx+R+?=
 =?us-ascii?Q?l+QPU0JIoL8fMWrejQBeBmBTy4QKd/yXB9L4aexgf5XdxcP5ZsrO2fQ6/4pu?=
 =?us-ascii?Q?0cQyQBRWOthVPtTHttq7ph1CPL00+0QBKZcgeVL6b6ddz7DMWBwgbW2n84Po?=
 =?us-ascii?Q?+DSW4ekbN1c2WEWNmt42JL8hRDL7d2L3al2wRaLBfB0WK7cHyh3QkjlzbOgL?=
 =?us-ascii?Q?Hp49J/BqH5R9yjAmCsHphEUeD+pkrpXWi+Di5k1uklyH23Tf2NBROxBW3CFQ?=
 =?us-ascii?Q?V+JyA1FdzLuu58x0vUmYFtDgDdZT/KuAnhzeBP8VEeeMUan6nZNjyev9lCjS?=
 =?us-ascii?Q?TygODcWPykRBJKFBE9aefrYNam2LkT2YUBY8aXN0lmxoUx0OuMdDnrgsFd7t?=
 =?us-ascii?Q?eUyAItwQILlkHXMqxT8HwfqDHE8RH7b7KYgWXmZ6XP3AiaaOFEkvVpHTawd6?=
 =?us-ascii?Q?Rf8XmiAV9x7eVsbcs6XhR/wjsLgs7v/adCY1u+8zVCpIou9NS3NqYuzSTH/K?=
 =?us-ascii?Q?hXO9KCciKfxVQ+RBfNVkA88HD/rYMGwHG9T+apagoZcjCcFYx0uKhEG0ROrx?=
 =?us-ascii?Q?0x7gOWFqmenAe++JiCfqu4Pc6OFoz8iNkH6lXM06kzDCo+LmB595/AZ9JHmH?=
 =?us-ascii?Q?HrSUi8yLFv+868sU+apSoEpliE5aOMW+GFdrNVEu396FUwCnDdcC188vjcGP?=
 =?us-ascii?Q?/h53RZfmVB27gEZExY7SAWlrNjZeoYxPIcKzsZmFacoScQ33dfbpNHuv9s/h?=
 =?us-ascii?Q?2/merhSghNeFL8qGZd89HM5mMmDeDNHEPvXYy0sIEtzPiKaPwcU71YdKuwUS?=
 =?us-ascii?Q?U1soOkUF87iJyPVUaImjSUZO0btVf7hAU2YoEAJCG/2k2oXCGV5Q4s1YfgvS?=
 =?us-ascii?Q?q6afsssH8aZ2S1ZQbYsLx8wm5hTJ86thRo5cNW0hn3g2E+Z4AF1dIfhRrdJD?=
 =?us-ascii?Q?ukAT51hyD1ymDzCCJPKln0cz79JZ0JFVSpr9yLnJmYJzBSIvQWY0wNQD8dl1?=
 =?us-ascii?Q?6+6hC88VRk1zKSJvjXxGB4wKhox3rQThPPXawWiSis8OcolG5Zf+JBu9KHb8?=
 =?us-ascii?Q?8SAEzxcWFleEM5rjXYZPq6rF+jctu8+8QVT+qgs2fNHjJ6nEuzH+9sfGlzw5?=
 =?us-ascii?Q?tMzWMD2LYMiQ7rh8xznJmcWmQTrx/Yw3UkqIazPwzoEygxejixP47ojBjOm8?=
 =?us-ascii?Q?slueXQIhC1SZx5cwOmVZSaGvN0j6A9Uvnfc2/jZfkESHPFNh50cJMZtUQWFF?=
 =?us-ascii?Q?CywxmD9Ua+hKbS9aCmlSvUDQ75drrjN4DYRFv1X1ZbJE3BDtMAbARpA7P8KX?=
 =?us-ascii?Q?gge+loo10niJpN7caRBky+4UWd/O+ylyJTEb5YvkPswrLeUwJIyUGtmA3Yk/?=
 =?us-ascii?Q?6nLqVvGEY15D6FZL8E6lZvLmH0FLLVJ2sULOsio0rpdmc5vUqay7npaBuyFz?=
 =?us-ascii?Q?nqN4x6XlDDT2NYgHPjlk3xzowKiEyecJJRqjmJyoiETT+uDW6+t2wwjR3Xyu?=
 =?us-ascii?Q?VvZ5gye3CU6m1AR++OxbgKMpCSNL+vPKkxkkVkY9MO5SYpPCNG8nlMTBFU4s?=
 =?us-ascii?Q?o+ik958BpD4beGwQT7rMXlFBzGJtoqnUVD3TyNCW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f33ca1-9894-40d3-f2f0-08dcc2b355f6
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 14:04:27.9642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /FMJJX5HfVo7wOn5LD0AeHm/HDsHHgLHsEUMUxpjd/MczhqgSoUrezyiW+3a+hL26wtsziJoyolK7KcFzk909w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5301

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the calls to clk_disable_unprepare().

While at it, no need to save clk pointer, drop sclk from struct
em_i2c_device.

Rong Qianfeng (3):
  i2c: emev2: Use devm_clk_get_enabled() helpers
  i2c: emev2: Drop sclk from struct em_i2c_device
  i2c: jz4780: Use devm_clk_get_enabled() helpers

 drivers/i2c/busses/i2c-emev2.c  | 23 +++++++----------------
 drivers/i2c/busses/i2c-jz4780.c | 21 ++++++---------------
 2 files changed, 13 insertions(+), 31 deletions(-)

-- 
2.39.0


