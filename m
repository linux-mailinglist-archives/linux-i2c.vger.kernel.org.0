Return-Path: <linux-i2c+bounces-5785-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A32295E7C9
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 06:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E7D1B20F75
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 04:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CCD33CE8;
	Mon, 26 Aug 2024 04:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gJ9iiQsk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010016.outbound.protection.outlook.com [52.101.228.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99B44F215;
	Mon, 26 Aug 2024 04:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724648330; cv=fail; b=TBPLdie2Z5eJlt/f6GNnIyOAMSBceL4LUYbDG0XC0Rv39s2RdzGOSE3q/pi8inQRBTrUaialdVf9ka0e1OdGTD3tCsneYM/XSTunU7LhM8YlehU9Rnp6UBCd0It/fHjKfAp4IUGWJbQqYMvrALS8A4vVzgc714evLBhkBZdXq3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724648330; c=relaxed/simple;
	bh=QvW12ypV9r2CEErMvq0mVuUAkR+o//u/9Vj00tic9EI=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=msnDfUcFu68MYHfO0BWyg00K2dptVndt+//A3NzlukiCrl79H7qYCMq1dl4FnqoKuoYVfZWHh2WlRJN7KSW9Bfi2ufhHX6oX9WZWkIiw4gINmaEL2seFFRH8J9H7TGYx+HK1LQyVfj79k6+9liUNNZCORj/Rd57KQzb7Q4f9kRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gJ9iiQsk; arc=fail smtp.client-ip=52.101.228.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErNKkgZ4i/HMbvEAYUAHJAOUbCJ0UfF/N3m0Q2Pz3jzaxVKFaYfilVvjVuasKqc0FOZUSsW7sQR7ArcSg8gmWjk9Go2lf5az2wGrUAMmP8geYiz/KU8z4A0uYOfVb7GeZEc+Crp/uO9bGIckYqOh6C5Yiimq67q5bOoxyNHyqOLAY1J4LzXhpcqNPGvpZZQ/nxJ4P2R1qacpBxG7kmGf7iiAMnQwtiBuMQQ+WQIR3he47hwBNe1cbH+TOyef9S3eKeZ11VZ4rmQH6uSYlbDRJ30WiTiITkUd55HSD85nns1lG8jcRTqRWCWLKXtefj21seuh9P7/pi6ZrVzOQ3lnqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxCeDOB+55QbqsDCFoBnkAhHD8UdnQwyeIDwjL21rWk=;
 b=GJ5jXb4ZPfmf18HfU24AaVz+/RjkaxydgfzP40F/BtTH2PFIVOILmBRkBN+3kzmJWSNtw7/m81QDfoZFkMZWfeRIjt5m9pj3pMROY4WmSxOOwmr+xSQzUv+h61DnzIZD+3IUWOC/qV0ClRyLh77rjF4OTTFKohfkFcZPScplsTj2eKFWGeVggJFLSxyRDU77gT9IvDPKZqwL2u/Xxb9Tp8/L5s5Y6ysvqTTBvtXjpCTFrBwzjoIWKlAPH2N6NVDChKLuXJlqPQzvK1QDDO8YQcOcJjj+KEJUNDSQM7tsBKu0jKov0QYe6IIWw4pLv8ap6DWnJ/Wi/NepE40xi+gLcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxCeDOB+55QbqsDCFoBnkAhHD8UdnQwyeIDwjL21rWk=;
 b=gJ9iiQskHvkTeT5T90+vPyOWHrdQB2PY4cL7YZr7CuaIPBGafUgDPkOSUlCs5BIt/DLOw/9R/5088imOpQ4gkiOoUf9v7snJcwY3x1kg9Azxni32R9tzLD614EMSQE0Bl/E4oOJ0SdQIm6c5SjTxU0qHMDLPyiidy1NUemFVfSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9529.jpnprd01.prod.outlook.com
 (2603:1096:604:1ca::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 04:58:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 04:58:43 +0000
Message-ID: <87r0abq3r0.wl-kuninori.morimoto.gx@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] i2c: rcar: tidyup priv->devtype handling on rcar_i2c_probe()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 26 Aug 2024 04:58:43 +0000
X-ClientProxiedBy: TYBP286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9529:EE_
X-MS-Office365-Filtering-Correlation-Id: cd78dd45-d196-44bb-898a-08dcc58bc285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lLgm1NoSxxHEkpkefxa7q1aErZlolkJSv5ahz1DK6I5VIlkpaT75zhZoxAB6?=
 =?us-ascii?Q?ry1NpGBE9kAKVdagqguhCvD1iT/pwnhlF8WY7PPAoKIzAwP5rk/+ReSvJl82?=
 =?us-ascii?Q?zsH5N5FkZhBTC7nj9juvWjYC3EhGmVTBk7Aq9bksvSJ0QMVniXaGB5q+reLP?=
 =?us-ascii?Q?/YBMgXLbIHeFKO1r8jDq+y1hZXAnipuadc1oqppMPMz2emhypCe7fN3FJ5F+?=
 =?us-ascii?Q?DcTFQ+PU8ZoTOvobNK0LOaD46uM4I8Hf9UQvvR6KnWM6v+BRZ1M/nLUYRYrL?=
 =?us-ascii?Q?wKao42KStGjgYTCeJHWJaGvahFSLUi9KDSNnee31iwIZEPi2IN5l/8hg6TSV?=
 =?us-ascii?Q?v7XqXXit0ZFqvIipBFshjaQ3dNwQ4nhGuEusAys+tqxyk3qkNhx20JncoEN6?=
 =?us-ascii?Q?Dq7QGX8tCfpJZPjvTtrnub6J86ju1Rwt/jKEOZbxZnnZvWVIOGMEbbHi7GVw?=
 =?us-ascii?Q?VgqMXY8xMjX83RlzH9ZK51LFT/FQvnIpmrPzfh4AHhX5YZ1rv9F8LIhO4d48?=
 =?us-ascii?Q?N/uLsJtIJLAKj0KiVVOu5/K3ogbFs61+dKCZL4P0pMmWM1dDlo3JFjF/hJKw?=
 =?us-ascii?Q?XrTULQN+iplyHqiBXBR4Cvyafn0qSrQYWZwR0mVq4Z9dvbmZKVolT1NJaPHZ?=
 =?us-ascii?Q?dD987sBv6h/uGaZMCKbnocYL4pDjtV9ohRDYwBhFYQ3z+FLhVwM/mRtCba8m?=
 =?us-ascii?Q?5ElgaMtTqo6SSa2VbdVq5ATwJY8PkWThsb0u4y4QQAgIglV7ZJm59Kt9iDQv?=
 =?us-ascii?Q?qBiIQlGzz1kp0vv0gtKGkl/L6crkhnCt9sQrjGgCL9TgbiH5ma14jfeppcjM?=
 =?us-ascii?Q?j/AXLlVKOL4JoNbZVbH/aO8y+6o3CEySUbuGDuj7+8hwdb8oMP15OgjHx2IN?=
 =?us-ascii?Q?mdi9ZUP31s0b8pOzza2WbKvXXZ5qs2lH7HPXMgIgiH7VRE2r1tRSiobW974M?=
 =?us-ascii?Q?og2c5FR1qFgyHy+Ru2c89YUqufp000oxdRPg3I43avTxTuctF8s7wgcXyZZw?=
 =?us-ascii?Q?exdHRms3yVqZushRH/4MfzdnaHnLoPPOt4vU2hPSxhhBExc2grWNaP4YR78u?=
 =?us-ascii?Q?77Hq1fHUP6UJz+nCdzKxwAAyIfFNAs19tCqNVSJ+OI8Fnxbwvq1AYokvTa13?=
 =?us-ascii?Q?LnZNQs81NQmgp589pJ1VCI5eWOgC3Ka+ZTfsdk2Ohl8G2DKD1W/JsaBB13IS?=
 =?us-ascii?Q?+q1cHrAZdB4xtkwv3zbWAm7asHxbiOxyDJDqq9ltNNJHGIK/uz63+nkm6Hk/?=
 =?us-ascii?Q?Nrx03t4LIPVBemkSDfpAu/ZxXpxo2aA0/p+3p2ohEuCKoaP8SWTJy4WJN755?=
 =?us-ascii?Q?tzogtUjiKq7bWjSnVt9Oor7W+fmVZU1flaBIGkoYEC/F2kEmMoeuR/QPeF21?=
 =?us-ascii?Q?YwwkNgh2WX1UrNDPb1bp7enZj67rurvp+sTTFwxZxTJALsksmQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cpSYxVcLFmZNiWQBE5IPr/W0M/ICMrQeKRFXbwBVgmtoc/kKaiDphu9VUqt7?=
 =?us-ascii?Q?B99sPbB02l8aa/sNRn/cbDt2CFHh8TtBwy848gW10XVsZIJWn0VpoKt3mGEQ?=
 =?us-ascii?Q?kA+/whLKVU8tzYnc2SMa+sRHKjNPmEdEkHNUsQ2OiNXKA3kckB7URVIrhRLa?=
 =?us-ascii?Q?wQXwGWB2TaloTXb9tSGL4UEu3OURHRHu5yiKluXvzjaCee9TggMPy3g7lki9?=
 =?us-ascii?Q?P2D2IzlJLGmyA+q5JI72/NyFzr3jNDh+ULwxor9iyP/GvUkkBc+vO5XyTrai?=
 =?us-ascii?Q?BYcUiBnV1p8i1UC7eb0bO9vU08gMgRiSezvNoo8gZ15g5YKYQ9HsAYNqaWRH?=
 =?us-ascii?Q?PhA2Kxa5iHv4k+sPIbcKZFn4i8HdZZYUt7EqVhUkZ8Qk9d4JRV47i/NXUyyq?=
 =?us-ascii?Q?X3fQybfKStQq7zqEGBrrjbGjmMi/aPYgb9LykUK48K5S2W0PnCdiR5QQblkc?=
 =?us-ascii?Q?qH0kfFyularnXZmeyDZLleX4lQjLBr3e/1xZDfgvsNOFJenG2RdvMWohdYjp?=
 =?us-ascii?Q?wloEjM6ySA5eAJbpA2b+qGc/fCAKyTrNwJJYLitswFll7rUDowSMosclwwfO?=
 =?us-ascii?Q?jtvWb/muJSf10D2Xu/UD5KMJldxy9I+aHrTAVmGqKFCDV4pwN2d+627sacST?=
 =?us-ascii?Q?KQcI9R3AEbuaAX2/7o23i2esPo7/+ZSLCmuIClmKX/VXcIwHO7qY6vgNf0cG?=
 =?us-ascii?Q?XYLxIibFICCKnmrf+QJ3rsFpHqr39NSawJ5Uv/Q4qJ+c7rZqqsFkd/6m4VWv?=
 =?us-ascii?Q?qocFbWOBQKEPK52r0MBgbiC2MF/M+xlFatUrxku5hWKOpjAmKLmWE6bNdskc?=
 =?us-ascii?Q?vBh2S+XzVgU6j7M5ChrAOd1NMcZiCEyfkiAUPNiWBmUlyRL9Ji8rgzkMs6IG?=
 =?us-ascii?Q?eowtFyH7aCj6skRLe3zTxGSLKwxKcz97SSAUPY/d7l32d+7c6Z8h95m5GGKI?=
 =?us-ascii?Q?XL89Mx9fYz+65ot489rT/Y3HGJLY8n4xy49efUoR5719B/ylUU77WNlh7WeQ?=
 =?us-ascii?Q?8TqgV+ewa5/o4TROhJw2T1ghWr5/4ofqa3XJ3XC7fzVjBPpiWWBxiTXo94ex?=
 =?us-ascii?Q?Af4mWsdEojAtLAv3NWFt82lwsORIdJ/QAMqpY6n7r82fkjRkDB0E+07WY0bI?=
 =?us-ascii?Q?MqRct7/5CSlqWfE/f5nbCzsvrSrnrCGt57Fn+ARCVM/rHRQlzyV5SywtavGD?=
 =?us-ascii?Q?fxEDl1lAKi1/DAXSw61aHS1wR65FrtOd6xjIW6V9kl3DccTi8s+9iIquf6Qw?=
 =?us-ascii?Q?e0wEXWv5hbghHcd1Ar//mMhqaq01wJw/yZEGUBavFGDcf7vCKVwbx9hCkcjS?=
 =?us-ascii?Q?dFsfqTJWz06DJpDlKB9Nz7J09dPyoGdYCDAbJqsAdsDJFogSiyOzNMzNz48V?=
 =?us-ascii?Q?5U+735S+t4TdRu5X94AujDM74hjePLmHlkx29jp5EN71Eu/WlArINjVcEHw3?=
 =?us-ascii?Q?8cS4PMTAD3YgdPxxwS+c2T8K6BDPfvy15BAutcPBU+UKXkSXaZHJe03xVJR/?=
 =?us-ascii?Q?+zx5cxLXk4bBosTHScDI3CVYZ73T3Rnc5Z3Ol7kgpvjJPubzijaeSg7GqA8X?=
 =?us-ascii?Q?Af0I1FYZ2DZ1GKuv3b2+rA7rbBc4TXq9sQkFuLwLIYUISg9YfBWXQj442JPr?=
 =?us-ascii?Q?98nMU514rLRixiehmr3wJ8I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd78dd45-d196-44bb-898a-08dcc58bc285
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 04:58:43.5360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0+H9tEn11xORdyt5C0l6jZcBiPsDe4WXyCz5NdqZnkLc9rpD7a9WuqsjTPViuc+p5hW8T74KFaqnv2rADwCdrTLKdcMripczAihaMUCwzzIU9CCl7BKLg1cZVB27Ro4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9529

rcar_i2c_probe() has priv->devtype operation, but handling (A) and (C)
in same place is more understandable ( (A) and (B) are independent).

(A)	if (priv->devtype < I2C_RCAR_GEN3) {
		...
	}

(B)	...

(C)	if (priv->devtype >= I2C_RCAR_GEN3) {
		...
	}

Let's merge it with if-else

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1 -> v2
	- based on latest linux-next/master branch

 drivers/i2c/busses/i2c-rcar.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index da4b07c0ed4c0..9267df38c2d0a 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1164,11 +1164,6 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	rcar_i2c_init(priv);
 	rcar_i2c_reset_slave(priv);
 
-	if (priv->devtype < I2C_RCAR_GEN3) {
-		irqflags |= IRQF_NO_THREAD;
-		irqhandler = rcar_i2c_gen2_irq;
-	}
-
 	/* Stay always active when multi-master to keep arbitration working */
 	if (of_property_read_bool(dev->of_node, "multi-master"))
 		priv->flags |= ID_P_PM_BLOCKED;
@@ -1178,8 +1173,11 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	if (of_property_read_bool(dev->of_node, "smbus"))
 		priv->flags |= ID_P_HOST_NOTIFY;
 
-	/* R-Car Gen3+ needs a reset before every transfer */
-	if (priv->devtype >= I2C_RCAR_GEN3) {
+	if (priv->devtype < I2C_RCAR_GEN3) {
+		irqflags |= IRQF_NO_THREAD;
+		irqhandler = rcar_i2c_gen2_irq;
+	} else {
+		/* R-Car Gen3+ needs a reset before every transfer */
 		priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 		if (IS_ERR(priv->rstc)) {
 			ret = PTR_ERR(priv->rstc);
-- 
2.43.0


