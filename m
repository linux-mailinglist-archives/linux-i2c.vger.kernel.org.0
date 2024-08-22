Return-Path: <linux-i2c+bounces-5643-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1D495AB9E
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 05:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 666CD1F255A0
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 03:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20EA43A8D8;
	Thu, 22 Aug 2024 02:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=vivo.com header.i=@vivo.com header.b="By26Ny1b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010065.outbound.protection.outlook.com [52.101.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA9F381B8;
	Thu, 22 Aug 2024 02:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724295242; cv=fail; b=kGfYL+IjxQl/D5pJz3RDQgD9FPjEdVQs5PR2Te0Vrp9JtHoy4vEBE9CY1c0PPtV69p202e67ccRcpHECFpUqUtlPuwl7WBvE2UPiVoU+3Be3w0ovsdg17V4zLB/VHXke6Knp1eoy21BaFekyzf0mneVXC2lkn+4IQQhaNhUPbZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724295242; c=relaxed/simple;
	bh=H1XPgxZBBRRcp1dIDuZ8XlbxxJ3qPuhSSHto1gxnzKs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dniTJh/LIKQtthM1Xpx0Rs8Jp08h1qxojGThByqa9SzLE4MxKN0eMH7tOaxLfLGyLWIp3xL5gm6Z6w/ygnXhh9zE0w2DuM62d9ORyeo9LVZM0KfIRkT+8Do+uNIsfuwM58CoAhQf0zQcpgy40qM24vzWuljLxHcWBEXh8hNxvQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=By26Ny1b; arc=fail smtp.client-ip=52.101.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4gxQh7AeOoXgDDfu6K0AKSpL4qlZepptEwx/YvvNdhVbO6HK9VjagfUzQDvh70u05CtjYARs5Whu+cE6LIx2GQR+5eP6UtXu4T2bMDMG3CpghtVp/YnHdfNRl0UIy3ECUuGiRylbE+KVOEYQOeYRhbB+5GUXKepwdOejqFeSHXPi2X9F4wJOn/UktNIIPPI81vihhY2lzAIF7k4Q96qCROiyZURfkw+3v+r2NfmBk9EYPTkBxnmAWTa8cO8tOUjaYlQBcUWY1N+RhzaaR5bOrILd5FRDS3OIb0jlM4huZ0KdOVMC5K4UgwZGr8AnqaYTpYIlZUYQtv0Sx7sJXSdtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cGJcTdZR7fofBHxvok27aRnVR/l3AwYF8VUk8Rpids=;
 b=oxrSIK72D47scrV/iwcPecovQ26aeQcaMOUO5PHIh2DoQwszwigaIk/U3PcwdQ1mIEOVsTdu4xkxg++wK/eVj26GEHMglURAwt1rTIbI7fn1SxEYGRnMu/WVE2m5tWRZUhpvttM0K21ayizthL1wCXPoUoRakWlHZtbjRDg/N5lac38X6+1mh2tVTQFkZzm34qcUbXJ5UzD4/hF5FDo2WbTrbBB2TybUDz7LjUyf9jPW5ljPggyUEhdoIQ5febO9O3B6pzbdDNlgNG0rw/WxKGwImNXS7wO7wEq21hZkdpdviAfEIItCKG4D0Ap6q4VDqXj7u2PmIWPtTPC6EFhR+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cGJcTdZR7fofBHxvok27aRnVR/l3AwYF8VUk8Rpids=;
 b=By26Ny1b5tvsSuHo3qnkIATPlbxrPsjH9HsB94INu4mkg50eb/JebM7tfxHGe5oalCwfmKHMhLGNd0UAJvrF0CLEHnt0Va0s6Dmph89qk7RAut5Ul2e6/ukQBCVjqvKSNRWb3B8vFT1vYDOuwN3tzrYZ1GPW3cQXP+u75ygyo5LYNynYEPXCn2Qx+AcaCJc2nIWjFc+GhdIrKOmH2B1bq/KeUupxZmyLcxtbOTkbTZYqrNTjcQOFeYf2FxcoQCcxT7iQK8SZmrOioXDc2AzqN+HfL7Gq+1MSxjK5dL+MM+/Ri9pDExhMlDpgFtGX5EOOfosGGnxtstY5hi79CcFHSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB5023.apcprd06.prod.outlook.com (2603:1096:101:47::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.25; Thu, 22 Aug 2024 02:53:56 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 02:53:56 +0000
From: Rong Qianfeng <rongqianfeng@vivo.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: [PATCH 2/2] i2c: jz4780: Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 10:52:58 +0800
Message-Id: <20240822025258.53263-3-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240822025258.53263-1-rongqianfeng@vivo.com>
References: <20240822025258.53263-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0280.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::8) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB5023:EE_
X-MS-Office365-Filtering-Correlation-Id: db56d51a-5390-45e4-d942-08dcc255aa56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cyZKZQWhC3K65eOSoEY8qkqM30/RisEQhtgSrgdbF8a5VvvjdIswDKn6n/SC?=
 =?us-ascii?Q?IXY82TuOHOL5UqdsQJJjM/X14F4nfZNNL/wUK+nn1XKCgLfl4GhJWEE+PDm7?=
 =?us-ascii?Q?2XuA+8kznGRgHWHdCflRzQjbfdrwFF8gf6RBpRekyGbtfTp2VIvsmZbqwqUv?=
 =?us-ascii?Q?AyGU6pCR0yCXQXaxwMSa7ZO71VvH8jxwLi4DPRjZBYVmTmI6FeUVENAEKylm?=
 =?us-ascii?Q?W1F+KhoEvUbtcwbi/F5prDZoQQIpV1yj4zsTyOsDwrLErTkamN/KNCWjgooe?=
 =?us-ascii?Q?A8lotONCA9TJmhoxRoKZrR8DXU6aJEiR4qISb85IqFUQ6Lz9O/0LEdgnNieT?=
 =?us-ascii?Q?1Cu+UuMD3gNutvB2TPxlBIFZJ1QAfmts/FDVb8I7S29FidOzdCrLOYFa4g6L?=
 =?us-ascii?Q?z4fALbQBrqGXhPOX/ZSq27ZfvkAebQi6Pz0Vw2cPz72MdGNw4WfXiDN66Sy7?=
 =?us-ascii?Q?JsEMKtMhtH2V1nhuajfpAeElwdJmhgMjakdHLCB8RiW/WzOZO+CMah+XZZsn?=
 =?us-ascii?Q?1GUXKJl+nx/qBasvdH9HiplmRBRDaIyNsLwCFSgTVHijUSztyZiLbtnIGw6x?=
 =?us-ascii?Q?KCgrwwtnTsg2z28PlAoVbyt7Osg0bZS3g9OdttvRMiybMuOV0jDX7rjrVFxn?=
 =?us-ascii?Q?K+P/7XlO+Cbw+SbgMjokVqcquFrNU2tDnpDD+F4T6779CLfFDtGe5PKluWxx?=
 =?us-ascii?Q?KyoeJ1WijWj82TpQWwGJax+J+fTdeDdlgl90V4X/J4MIhaRDyd65NvK04kUY?=
 =?us-ascii?Q?tGRTBgvxEHOsfWmchyf0kam0DCr5Ha6Q67UgTgkD/jHjMqEmJO73XwFGmgbq?=
 =?us-ascii?Q?QbsMSxRbR8W7SooZcTG8oay831hJ0rwKdZlN2ippltqkN237erX5edKrOzzz?=
 =?us-ascii?Q?RLKHNHVoyPjE3P0esZ1fxOpjD/GPrjMmEbYyNY2/mvT/aB5bP2pW0g4P4nkA?=
 =?us-ascii?Q?10te3TY2fCRPMGHmZEXoduMKswSd7QJi4Br9iJcPo/MvjtBWii7fFJrPcd0Y?=
 =?us-ascii?Q?KODd6ka+jILJ0vvKffuH44vAbz1TZCVNHVi3xPvfKGXoK5y9ko5ujBDW1HTL?=
 =?us-ascii?Q?aX6aarGaEXH+1cqtyQI9KYhD0N9fFXNdiaG6HMT3BmQak1jlasaPobvg9izL?=
 =?us-ascii?Q?FcRghQimZIEl0jEsIRmci9h+9xRW4DQfa2hO0/LFg6RIqI3FN/5010117mMI?=
 =?us-ascii?Q?mfrJiBN6RJzTLxtpipF1Akju9DBBI84PHrt5pJp3ZZOwvQzlG4K6SgSuvD9o?=
 =?us-ascii?Q?Uvp/nUe0sfyZm7XLAXWcFlk7X/yq4PkivNHYOEldkyCDg7SFg/Z1+Bsg+w3v?=
 =?us-ascii?Q?ONERUPAnl2tuT/8r+QDdNYguSDOJdf2wAVfV7vIkxkN0mL8Te+NqjdoaHpUx?=
 =?us-ascii?Q?uhUbAuDqcRGLPDjK4GBUsjsNfEPrqyE9UTaovJ/xYfHfKw4KsQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?95muWdu38CXed3FFAClExYt15XMFJtWeGC0tVoEAZYreCiNnue5Jmq2uTZ2n?=
 =?us-ascii?Q?Hzr47plMU/Zp0wNfMXcKkAbufKf4hY1Hr5c1O9vpZvtgAKd/CjrrMjLWrg2R?=
 =?us-ascii?Q?rOQlfZwb7Vq5rghiFuhF9HAddcRoQl74Csrwzma0MK4+OlFtaLtTCyx1GweX?=
 =?us-ascii?Q?sgDcA0tIwHoI9QyMVryxCNNYdwBa7xp64FdeNAtccJmGlfYTsxyzXXAjyb+p?=
 =?us-ascii?Q?covu5eolQknKqE8SLjJ9MZ99Ol/9X1ZM04IwM+WyxZGsN7WU7Uo3doTGzRGn?=
 =?us-ascii?Q?BGQSWt1PJnetUMLnvaCxF0tPvgTKOzmrkJMt0VT3RAWtLE18HeokURfAOGL3?=
 =?us-ascii?Q?2mRMEAAOH87MuMFrOPjlOTeBECqPs35wFYP2vQ0DGU0u6o4a+A2LL0dTNGGu?=
 =?us-ascii?Q?/8QJuo33s7ZAIxjEtiPv8tj6VVTNxZeASk6sXx0OgJnd3ijohzSkTCWDr1Wy?=
 =?us-ascii?Q?uQyJi2wNUuIt1sZULD8p8Sa1YZ1QwRSX30SRZJJjvTBLvYzh74bvlUKX/Iur?=
 =?us-ascii?Q?2v5uSdR3923JIfa+AvG4yuNoaRN1jd10HXngCyX/ZiGAY5ejLjqD0C2Ac+I+?=
 =?us-ascii?Q?sTbmekLO83uRZDiM7lWez/l9uAe6MUUx/xCE82klbc67oIpt5mXM5s3DKOAN?=
 =?us-ascii?Q?ESSvZh8Xc6Youx5adtoPAeB2tyosxmnpQasoEZuLyIYDIoCpgY8gXJTOGloC?=
 =?us-ascii?Q?sYnNO8YLsc1F8MFnSfQdyhdazg/Qoj5C1R/Zy1JZkmzwsaaxCa2uqCQ1xiSb?=
 =?us-ascii?Q?qu8hQsapKeEgC3zlD5TqZgcen9dtP418CQmxQIbhKiq3xiiZbAXb17+rCbPH?=
 =?us-ascii?Q?QplYKf0WQFehif5CAuQGgXfbTwVH2ClDfDBfZNBPQL12clwj3RqUEjE1bSiA?=
 =?us-ascii?Q?vmEEhAIQQi8L27EK6PEmQZEx/7BdY4yp5xNCMGTH6q6DLyvlUJdMc4+szq/y?=
 =?us-ascii?Q?zkxesKVzTZi3ginvDneG9y+wemS+Uoa7ZdgDWi/lyj1UtwstSPZnjwz2uBJk?=
 =?us-ascii?Q?dBEKeTSlvaenM4AsdUsVDccY32jP1g7ym5yuE1OOSo3CulZcBbiKY9Or2bvL?=
 =?us-ascii?Q?a+De9d/kqCpM36+gbDRsVfgg+h77VR/FKB2vQN2vZQozTvLX2z3/6o6gKCQd?=
 =?us-ascii?Q?FFvUYC+Gh3q27nyLk0Clbowif3S5Q6KaJ3mWBpdql8s9ovWX6B5/8b30u+B+?=
 =?us-ascii?Q?QCqSMTalyML9DmF6Of7em3oPtmNRBla5TT8ihQgrMMp9paJofVB8Kr/8BGxS?=
 =?us-ascii?Q?oYzmEAG0W4GYcC0KRLLAfJPEL1B2jgKAUp41zvqHWfAbQlO/pmfIGYnlH+wJ?=
 =?us-ascii?Q?8zwWl0MhXGXBvWOqBNu+PGsAxrvu4Soe5bnZvA0IaES3i8xvc9Fkeut5BrBt?=
 =?us-ascii?Q?c6hczYl/ls5vrrUtGdPg7VS0mxd0JWWfJfL5Yz9ETNyxMTTWow4mN4ioWCk+?=
 =?us-ascii?Q?MTPzPkiMBK5xecIRujy6JObq97CJtx9ojY9/B/vzWrCIhUVlCuwxYIqpYvrT?=
 =?us-ascii?Q?7nVll+aV+2bRHvcFnoopcunjqTgWvThIcMko/fEfJtJlvzJOS0F1wnOlZKnW?=
 =?us-ascii?Q?/u78T+5pDqH7MTw9sULwjZJlRb4A34CPVH/6ilIj?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db56d51a-5390-45e4-d942-08dcc255aa56
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 02:53:56.8238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFXa4+EDAv/99YLB87w6+y8qk2rvCGY2XTvMnmY2ctRzrMpHjeliHmINJlS9iNN1exfgnA4UZ4gY9CK+kKPkbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5023

The devm_clk_get_enabled() helpers:=0D
    - call devm_clk_get()=0D
    - call clk_prepare_enable() and register what is needed in order to=0D
     call clk_disable_unprepare() when needed, as a managed resource.=0D
=0D
This simplifies the code and avoids the calls to clk_disable_unprepare().=0D
=0D
While at it, remove the goto label "err:", and use its return value to =0D
return the error code.=0D

Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
---
 drivers/i2c/busses/i2c-jz4780.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz478=
0.c
index 4aafdfab6305..f5362c5dfb50 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -792,26 +792,22 @@ static int jz4780_i2c_probe(struct platform_device *p=
dev)
=20
 	platform_set_drvdata(pdev, i2c);
=20
-	i2c->clk =3D devm_clk_get(&pdev->dev, NULL);
+	i2c->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(i2c->clk))
 		return PTR_ERR(i2c->clk);
=20
-	ret =3D clk_prepare_enable(i2c->clk);
-	if (ret)
-		return ret;
-
 	ret =3D of_property_read_u32(pdev->dev.of_node, "clock-frequency",
 				   &clk_freq);
 	if (ret) {
 		dev_err(&pdev->dev, "clock-frequency not specified in DT\n");
-		goto err;
+		return ret;
 	}
=20
 	i2c->speed =3D clk_freq / 1000;
 	if (i2c->speed =3D=3D 0) {
 		ret =3D -EINVAL;
 		dev_err(&pdev->dev, "clock-frequency minimum is 1000\n");
-		goto err;
+		return ret;
 	}
 	jz4780_i2c_set_speed(i2c);
=20
@@ -827,29 +823,24 @@ static int jz4780_i2c_probe(struct platform_device *p=
dev)
=20
 	ret =3D platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto err;
+		return ret;
 	i2c->irq =3D ret;
 	ret =3D devm_request_irq(&pdev->dev, i2c->irq, jz4780_i2c_irq, 0,
 			       dev_name(&pdev->dev), i2c);
 	if (ret)
-		goto err;
+		return ret;
=20
 	ret =3D i2c_add_adapter(&i2c->adap);
 	if (ret < 0)
-		goto err;
+		return ret;
=20
 	return 0;
-
-err:
-	clk_disable_unprepare(i2c->clk);
-	return ret;
 }
=20
 static void jz4780_i2c_remove(struct platform_device *pdev)
 {
 	struct jz4780_i2c *i2c =3D platform_get_drvdata(pdev);
=20
-	clk_disable_unprepare(i2c->clk);
 	i2c_del_adapter(&i2c->adap);
 }
=20
--=20
2.39.0


