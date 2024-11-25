Return-Path: <linux-i2c+bounces-8200-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 885459D871C
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 14:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DA9DB45D50
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 13:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BADA1AB52F;
	Mon, 25 Nov 2024 13:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Purzo0tN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2049.outbound.protection.outlook.com [40.107.249.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74AF1AB53A;
	Mon, 25 Nov 2024 13:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732542122; cv=fail; b=g1x2LRNju9UDuMwDm91A1Zw85rAZuSAfwy/LrwEdxffJoxBONw22q0v4ysKFr33KNoZRQMahY4Y4BnRvINPQtejI6+xbN/x1YoZyR4CKQUnKP8HiG9jJYrEYAlNcWZrElZgBUv9VpkYUX79Ul/gA4d5oQSMOo6/T7oHuQ4WTszI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732542122; c=relaxed/simple;
	bh=64xt1JO42EliDXzuBpk7+EAtZ4UQ9DBSoQqbg6zCaUM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=L74VXzKNr+2lWAKJEkVa19s7j5dZ1mPQX7NbvQCFP5BKPimDgxeRwMCaVXd6S3FpDMU3RVB9lxc9x44PHcINJaF2ztlSPCTvg6ZqDHEJJSCiVhxr7YXN4s5gIPddjZ0I/d/LE/H+1+RulXWYXnLWrW2E6ai10OgFUlqTRSnbLUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Purzo0tN; arc=fail smtp.client-ip=40.107.249.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXKvIJWeabARajgz0/xcCE+XeL6XY9ihDsjE4VbcqnintRRd4yOj7dM07vCCfJzsQiYw6rHPLJS2DmR/N0JrmkV6xGDjmowl+APALJEkGH4lhFq4AlU/1/Tytaou/2oAs9KpWhpm82gzGKK3D5i1ibb7t1QU/v5h0MoINEZe+JsGfdDDcoEJt+fFbv2f0ZxpNjauOtbXpOSGSXlcTtMsN6QzM3LMHBqlbkR1nHBFNckqEcCXgiSfw57iAnvYdrOjkTrwly2DdmU3FkN2Hrm3cCSTH8oUdDeX0CjMRV1tIUPM3sg+rvA8xAfnTUSxMHfvo22l+VduS9d6CtP0hquzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaIdQrInkRuQ0JQhQUkfXrxuh827knd7KtBLV02hJhQ=;
 b=Gomv+WggUzZgrgZSR7x7+fRZVVU7kVFBcu48MKngv1ulveDlUzkMPxdOF8hYq7eI4Ed+8yPyCNEL0FXPgJav4++EHR27wJkn1JcdId9EvXr8yyOFr87vZlSA2XgKP3szE9zkuRvr802rue8iMmspqgTaid2dKqUMHBroGt+E/ey6pRlT5hfhTWEJmO5Xiqt5/x8uVC27/IUW75WfPJ8iG2gDckuCOlVRXdV5E3MQI3pmL5Yzzp1FcyDRU99Mf+bKf91od26sEaSR39qCw2LBNfQzGsh9GKq+VK8ZGkkuMPvQuM27YxH/AwwYNdMNdjkU6ajXs3/jBx2fpftljDXZXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaIdQrInkRuQ0JQhQUkfXrxuh827knd7KtBLV02hJhQ=;
 b=Purzo0tNJeLkIm3p0jeenw5rmksbtO/d5N1HU2MAA71ut0GXtAOjiGQgTFm2+BnIIF9PrGzC3nfQzyerLMv+BaENr6TTpRxlFh8kvOx2N7pQU6i1946dQsDvH2HRK9rj+0NzNWhgZ1j68vk/s6GtWD2P6ZViWC8+DBfvmOSJdrygjkLaDna+llermx76ocMcVLWQx7sGgeWZEpiaWvGJMUHhlVdhr+LfE9Wx9oZmgkJJNxegHYMcmj1AvMPOt+L1J0BSlztKOhW0ryKLqszOu9Ye38NPoEHDYEq7qik2IL+wmMAgJ8nvRDrHKetrVtxC24jYGDHwK8M+NtaTxBc9Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by GV1PR04MB9117.eurprd04.prod.outlook.com (2603:10a6:150:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 13:41:57 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Mon, 25 Nov 2024
 13:41:57 +0000
From: carlos.song@nxp.com
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: imx: fix divide by zero warning
Date: Mon, 25 Nov 2024 21:50:19 +0800
Message-Id: <20241125135019.1612030-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0044.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::8) To AM6PR0402MB3944.eurprd04.prod.outlook.com
 (2603:10a6:209:1c::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|GV1PR04MB9117:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a8737ef-ad67-49f7-96d6-08dd0d56ee65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kO9ULpYD40hPZLIR1107PdjDSjqShBXSep6da73d2ofyLtmheDP15PkOMINB?=
 =?us-ascii?Q?LnDEUn0vvwpUEx5kKgQwPkp4JsWXQTBpGs/4a2wy+KhAkjlBQraBK3aD2yjV?=
 =?us-ascii?Q?q3X/IrpBn6xgCpvnQFRXVcyBDOYvst5jyGAU5nosdOFTi70XI4ttOaqwfwlW?=
 =?us-ascii?Q?tHliLRGtCvxSEqn63Du8UREnO23aohHndYJ2N18KsyfBC42WDtUv3WgDgMHd?=
 =?us-ascii?Q?dyRW/3kIIPDgLvS+YNeuWhV0ELEVyvBiX03e4BJPF3c3GMoV801UWAVYF4g8?=
 =?us-ascii?Q?3EGb/f7F1wsLm8SF90klTZ75ATnuXlewVrshOf3LnaeEuGZ2HAUHVb3ZKZO0?=
 =?us-ascii?Q?FZiKa2j6BkGa05ZNRghGe9sjp+e8hojZmLj8miycygTCP/ilD0viSYnbPR9a?=
 =?us-ascii?Q?SwLwkgxWRUGyYfY3K+crjL5nXUVTAOc0FbP1cY5s1JxExG3E4EQmGxs7y08l?=
 =?us-ascii?Q?uokY+oymxkXLnr1tK0co5eZ3T2beVBzJvHRoS94x1qjFg7/i/eGWjGCZoiKR?=
 =?us-ascii?Q?pvYG0dMIRqDK64MXV6nOUJa3x5d02FR7NouPQAD6s4gLIoodNkR14ILccPBh?=
 =?us-ascii?Q?rYrSK/3vDMGKdyxLbGBoB1Y/VBURC4tbLXXibXQ8WwrPJK+YRJ/lWY8dFZ7Q?=
 =?us-ascii?Q?1wzWqryr5dLxfHDjcazK56XJruTX3ZdYon4VQ31oBeNQHjUJTvxcE0JLiqLm?=
 =?us-ascii?Q?lzI0mWq/+77bIHNCNtXIlDGmRr6OhA6Yja5wNYDDhX8VFQuk2w+hLdsPMG9P?=
 =?us-ascii?Q?lGHuOctNNTeWfuagfkVW0pu2fQNp8Yes+e0570NnIPFHLo4Tyl7C8Q+TtZ14?=
 =?us-ascii?Q?91PwF8JC99uMPmdLgJl0pWnFyLU/pkzcAlFuzkwMwm78bDPCq2vKnR2tdDL0?=
 =?us-ascii?Q?apl6cn7X5URDHXN0/xwvkNT/SIT2FZnLK0Dk0kd2vPdtJCUUX3KDAYqWJzVI?=
 =?us-ascii?Q?uyRzQYfyIE0JvPtQSb4enHdfOi43fmraWPBfTQHhhbjrmU5nuEy3vSiGJTYY?=
 =?us-ascii?Q?htNdkhd99NNozsPkal22yEd1T5SRidzP/JC1u80JWdcgEGWbe0FLscMyBHCv?=
 =?us-ascii?Q?ZGHGm+6f8wL/hysgJe5ftW0MlgyMPjn43CTmER96Omuvq9q697dHz0hiCZtu?=
 =?us-ascii?Q?votfKPh52qQcCL9XyMRhQV+FvmLqOG+AjCfNhZTGtHGpZqxB9FpxP+/TVfiu?=
 =?us-ascii?Q?pVZViE5ms2kArLVaMf1+YagAZDPk13yFxSiDHL/nCpjf5iu0i31ofw8J4tgW?=
 =?us-ascii?Q?VQwiHAzVpnRfNcB4egezooq+tWIm6yUglMZET/ikp3pOVTO5jwz69TGo+DC2?=
 =?us-ascii?Q?lTOr4jdTSkEjjIPJc3rYW94gIu1kQxVVp4PynemBmCbjrCNb8cgIuNIBeEEz?=
 =?us-ascii?Q?Dg3grG5phqBX/3INXXs6iQ73ELdK8oGObW/k8QatFOA3EnNOmA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TDnYYihu3cImN+moPJlQhuDj1BbFkYwcJchZRPFy8g1C/lQJcEiribanL2WE?=
 =?us-ascii?Q?ow6YeP8eBR1XaktqTbJwAlUW0X5fQw5gC7j9DlN6gFzR1vo7IGF1tOD4qqDU?=
 =?us-ascii?Q?/F+70ySrDsj3KjUkagp7CIQak8r2pR0eW0gOV05y2y0ruVS3QYEqf9pQVZz8?=
 =?us-ascii?Q?336RQ7PKO218/cor++lHoVX+n61UBnTiCc7tBMeBvoiAjXnFK4GAqGA5dAQE?=
 =?us-ascii?Q?zT/55mdGxrd61FyC+toBxJbe8WmXH/ezKluPrX8tGjTdBWwdMLoHbjetOnmG?=
 =?us-ascii?Q?aFSko7PWjz3fpyPnNzTtHLqrthUBsnj47EGCHWvBuEsTU1ciR6nMYFe4WZU6?=
 =?us-ascii?Q?nNMkwjP5aIzf3XI1SVyugR2Dd2MAUj2BqH92bLtljpFOfgdLOWB4QIv6zIK0?=
 =?us-ascii?Q?P3Pl/LxSry9IxX74z3290TA0aGLT2oNDUbu2iizB/7VzRN8ScCaRPIdt/vUt?=
 =?us-ascii?Q?jzwiomGgow5Pa/90zSy4np8jUpVfOBXJBIh/1lflNHmuXiz62txZpIr/qeYu?=
 =?us-ascii?Q?y10s1gF+mufnWZyfmSNurkFmnnQHIhdqqnxOG40Lw++3yT3kdbU/INuwxn38?=
 =?us-ascii?Q?7akrtCTE+OPZI30tn7GQgmG+9XY1jI3A1cQYpdZTQ9bNKRBkt+LCmtkain7D?=
 =?us-ascii?Q?Yz4g+8IKd7sogRY/DLnnLPFBBsfwGxfeh8QKSUvE7CDy6rTFZxz+24LFAdUe?=
 =?us-ascii?Q?79I53L0BkswiJK/Fl6GqdZgkCi1cRlRSIjbNgLfNnCdnTncTzHxoeSh31Sro?=
 =?us-ascii?Q?85/unisBsrzq9Y2XsLqMAjPgX/fR2v/3aIvDS2NIjjBGh7BKfDuj04vrEhmS?=
 =?us-ascii?Q?85Q7ojfh7Zq9or78gu29YFGe3GmE40occGMHW0xyj6mnOx3VKsloVmKHjVHO?=
 =?us-ascii?Q?bFG0U4W58DfJ+sIyV+MESX7WZ8CVSz2flgPhxEFzBeBagUVssTyE3GL8+Jwh?=
 =?us-ascii?Q?otOxy7RKhhpMELuPW1FszuUFRnX12o2xr0YCb/jvlbTlnoAtcGnnEa2hzNoA?=
 =?us-ascii?Q?MuEvgSHMkR8XWujukJlBIHEwNPxpgHFmIHOE+KVpM4nWE1FBU4Qco5/b06Xg?=
 =?us-ascii?Q?Fx/nU4EefHR7l2M2uFTyK5U7YCKZbeDTxvLuzM5jEnYUEf9wyEgJhwTWtgGY?=
 =?us-ascii?Q?15Exg8Au00GLDAJaq2gqhsEXzE44PL0ngXLN+dGGCzCj7BtTV80iODLCbGrA?=
 =?us-ascii?Q?/BAM2Y68llnamNbrVhyuJLY20yXzpOOj6Q33SxF5+3yoe7g0gYLu3z+emtXQ?=
 =?us-ascii?Q?4fgldtEeaQeiVhlzVV2E1Yo7Csex+S65cQUK6ofUhv2v31eqr9gheScOg6G8?=
 =?us-ascii?Q?t3CoeYpOlQv0nb4sGZgHhfPIeuL4gcjd2WYK7xcRWdVeI+qPdonMgNFGPusC?=
 =?us-ascii?Q?BZ2Ragl70UAvqSlEblgeR9wzY4caYksSvPS8zpSxOCwf3FBnQRPTROkqiox8?=
 =?us-ascii?Q?Fjjpc79ctASK1hqgkJi6qh5VVpdYvQKMdvTFXpS7ANnkMbN3oRzoxaI5aqY5?=
 =?us-ascii?Q?hk7Mlo5rmF1l4sxzwHvDlpXexNhjJn5NzpdScd0hUVi5TUMcdFZURaxoBwDf?=
 =?us-ascii?Q?Zs8ITw706jINh1hWGRpsWV13kSfvbG9J/HiA1sUF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8737ef-ad67-49f7-96d6-08dd0d56ee65
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3944.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 13:41:57.8740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjZlEGE9HwkLK4WY4DBBTjwiYdzkMziFpKysfs7bswofeKdb6Zn90boRTF9pXltfV3JVIEYyBkz36L5G2eovZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9117

From: Carlos Song <carlos.song@nxp.com>

Add "i2c_clk_rate / 2" check to avoid "divide by zero warning".
i2c_clk_rate may be zero if i2c clock is disabled.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/i2c/busses/i2c-imx.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 2c782cdc26bd..5ed4cb61e262 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -623,8 +623,8 @@ static int i2c_imx_acked(struct imx_i2c_struct *i2c_imx)
 	return 0;
 }
 
-static void i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
-			    unsigned int i2c_clk_rate)
+static int i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
+			   unsigned int i2c_clk_rate)
 {
 	struct imx_i2c_clk_pair *i2c_clk_div = i2c_imx->hwdata->clk_div;
 	unsigned int div;
@@ -639,7 +639,11 @@ static void i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
 
 	/* Divider value calculation */
 	if (i2c_imx->cur_clk == i2c_clk_rate)
-		return;
+		return 0;
+
+	/* Keep the denominator of the following program always NOT equal to 0. */
+	if (!(i2c_clk_rate / 2))
+		return -EINVAL;
 
 	i2c_imx->cur_clk = i2c_clk_rate;
 
@@ -670,6 +674,8 @@ static void i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
 	dev_dbg(&i2c_imx->adapter.dev, "IFDR[IC]=0x%x, REAL DIV=%d\n",
 		i2c_clk_div[i].val, i2c_clk_div[i].div);
 #endif
+
+	return 0;
 }
 
 static int i2c_imx_clk_notifier_call(struct notifier_block *nb,
@@ -679,11 +685,12 @@ static int i2c_imx_clk_notifier_call(struct notifier_block *nb,
 	struct imx_i2c_struct *i2c_imx = container_of(nb,
 						      struct imx_i2c_struct,
 						      clk_change_nb);
+	int ret = 0;
 
 	if (action & POST_RATE_CHANGE)
-		i2c_imx_set_clk(i2c_imx, ndata->new_rate);
+		ret = i2c_imx_set_clk(i2c_imx, ndata->new_rate);
 
-	return NOTIFY_OK;
+	return notifier_from_errno(ret);
 }
 
 static int i2c_imx_start(struct imx_i2c_struct *i2c_imx, bool atomic)
@@ -1782,7 +1789,11 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		i2c_imx->bitrate = pdata->bitrate;
 	i2c_imx->clk_change_nb.notifier_call = i2c_imx_clk_notifier_call;
 	clk_notifier_register(i2c_imx->clk, &i2c_imx->clk_change_nb);
-	i2c_imx_set_clk(i2c_imx, clk_get_rate(i2c_imx->clk));
+	ret = i2c_imx_set_clk(i2c_imx, clk_get_rate(i2c_imx->clk));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "can't get I2C clock\n");
+		goto clk_notifier_unregister;
+	}
 
 	i2c_imx_reset_regs(i2c_imx);
 
-- 
2.34.1


