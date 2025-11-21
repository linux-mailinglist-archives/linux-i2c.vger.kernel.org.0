Return-Path: <linux-i2c+bounces-14213-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4AFC78A3E
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Nov 2025 12:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 310CA2E5A7
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Nov 2025 11:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0737234847B;
	Fri, 21 Nov 2025 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UAM/qNjH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71463346E43;
	Fri, 21 Nov 2025 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722901; cv=fail; b=KXrV24Cx0ChD8QGzetI9W8g42T1APJUaDcHIkUcGJT2M6zmtjTHaBXlnYmMfzA1ON2n85G51N5y7oJVXSWk9QU4iaf2WvWoBJ9ZCYbTfb6qbDabK/p03kGADUPGXtmIeALS9NTb2P9ASXdX5wj/iEXEVHlo5sQ3M70qBfnTC5bI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722901; c=relaxed/simple;
	bh=ifzexQ1ijEd0VnpUrHZJnoSYuhZtlxoIRk/SKw9hryk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=j5mdTW5bbh08WxgYia4DLY1FoiS4pLpn5Wx3vv8oLZqRzfNSP6U1mPMgGnypoFqQx2edgbL/5I7hhm080qtxL8ByQZ3R7ScFTEIV3Qh5BWRoXB4sNo6n3Cve2mcE54500iIUmsFPJJ6ZUJ8LraLkZ3DC9VC+wCGig740xtlz268=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UAM/qNjH; arc=fail smtp.client-ip=52.101.69.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWcSu8NJoC9PRw/Y0rnkQNjmlc6TlMY/aYkMAlZNtz6GuKxbrzOdrdsVn/T8zerqKMPeQs3Sx/rhS1p0EcBIuWssuX/iScM7ZjScZW5MR15Q6BfaZe8SbcHiJ4XmSIGRtmVnyCASFLeLACfTnmz2jNrdVHbMPUj37qGE73rf6whcORj2BHebv1UhcdlvEoEKUYLAguUgqwB64QUAKms0BBRebnfzoiMWjn9uBL6ik/w4+ivOkUQ+OcFE2li9GYClQCQ3dgjcD9PjBpzrtaDmuYZPb9ZtMDH9wMiC76e7yxYwxoMK+o5kjVYWb8t1wQzrzjj2mlPi3iMBBsC/tyIlMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgSAVCStqC2VS/FHOUxtDsc678yU4VbQngAE23fRQ6U=;
 b=J2d2L6ZQarYXn28ly5LiWdf/L8wX3Jka0xSMl7IUWuZ9TvO6SKpCPkAbTUAmq40KsbcxWy33HJujNdizq8DGIjLdPlNsrcWM8N+HSCof7E5Vx3lQubYiGoRXP69HfeHxFvp7c+C1BaBTmKyyHf7CZzE4uhzaystetxMnNfHUGy/P/k/ENtrLjMAfI3UTcFa+7bhSokPp/eWMw7t7plsUWif8DZ5AXUUa1Yj05tE8bny/ArqNVArUSC3GIhACny7RpbVI95ET6N/wuxtVanQ165iExABPWd+cKhnH1Hy2iMvUbYH78afC8CxGDY9vVRkCMt/IhNBGHN225Ij5WTtJCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgSAVCStqC2VS/FHOUxtDsc678yU4VbQngAE23fRQ6U=;
 b=UAM/qNjH3SBGyB9XTWMPhO5tiF/gjQU1tO1/tJNWYerzMK7P5sWOLylyu/ph30ivw9sjloPA6UA6vxpyrfEf0jM3pw9UmcCk7cQqyRywsRhPcouBrF/W8mzXw+c9Is8xhivirBd+IeeeLSrIweIamYDjBqx9Z/3ZhNyePlvhTrUqeEcT3sVdh9LYRm5UlHA/Rpa13bWGA3jsW2F0RaInrXYSwaVTXOWtUiRRhi66RN/bRmGVcREamXS4O2kFs3C9U8wamAY5lsL2luE+F7p8reZvR7siAmCBgT93hOa/27E0Zn/TK2umPVOIQMFoxZfNRhcSk/Bl/sb+Xxrf70FHLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by GVXPR04MB10755.eurprd04.prod.outlook.com
 (2603:10a6:150:220::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 11:01:33 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 11:01:32 +0000
From: Carlos Song <carlos.song@nxp.com>
To: frank.li@nxp.com,
	aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	vz@mleia.com,
	wsa@kernel.org
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Carlos Song <carlos.song@nxp.com>
Subject: [PATCH v2] i2c: imx-lpi2c: support smbus block read feature
Date: Fri, 21 Nov 2025 19:01:00 +0800
Message-Id: <20251121110100.1909603-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::19) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|GVXPR04MB10755:EE_
X-MS-Office365-Filtering-Correlation-Id: 29183dd1-ccd9-4e8d-a526-08de28ed53f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mIYSI1x7MCh7s21cOKB1pCn/ZjcNuztB2Ehkw8tZ2Dqh3Fc7GugQ7S6TqXA7?=
 =?us-ascii?Q?mmJeq/IicdDZr5kB9HHEqXwSSJXw14TtjhXGUCURExaNs8XGCykbiaQv2cLb?=
 =?us-ascii?Q?TGzHnzViYtHFuYa+op4rSB/mxeOIqypnKo3JXZCO0oiHXMVfbGqAGJpSZL7X?=
 =?us-ascii?Q?bTjiLIFqkX9Ttl+RO/+VRIFHo8TTuMRnPvR2Bun7wvd980+y2CGKak8nLxhF?=
 =?us-ascii?Q?EG8KL7t1qGt9MfmlO/xXT7vBjjOfx7LignzA1fZ48aD64P67naSyLYAoLLmU?=
 =?us-ascii?Q?W1ZRf7WJVpkEJmTPx4MOgY5HOA9eBIYJQrW/ki++MboT56/2JOyEW0i3WllH?=
 =?us-ascii?Q?gVaDX9xOIDS0+vXwNLeO9GuUw1NXtx2LRUz9K3YZM5qXHxmHDUvU7KN3CEI6?=
 =?us-ascii?Q?IWsvj/hFRLgzdOyvXMojNiNcdP5fsA30WYuNBFbgntOINbOjd0EErlj9lc+F?=
 =?us-ascii?Q?xXNdynD4hnPTbZ75PxMfzjljjKaLvvAcuEdecnWKRgZColmFP5jVL6+T3IX/?=
 =?us-ascii?Q?jZOxQ6LZj6oriIW32drWA1K/XEvt7LeZKTTGWml0r1DjLS653tpqHvRMw6Dt?=
 =?us-ascii?Q?vf5Utf6sFQxR8cdDX5TdxPCxdDAqLLMV8On2EA3wFG9vgDq9NUgcqQeuVK8B?=
 =?us-ascii?Q?PLCknQtSrAqqf/4rFRhAao8pp5AR72Z3J5hF24SCUWMN2L9U1Xhj4Y3pjWi9?=
 =?us-ascii?Q?pH0d6V4T9PI/yKWDmktYmyY1WP+FcPfkbwBCjKFUjRBUU/VKPzxztC2cOvut?=
 =?us-ascii?Q?9n5R0NIVyx414wACCa5JVHE4qcSHNA1LkeWSlX0zvUYZEKKfbIsBs+oGJQGO?=
 =?us-ascii?Q?J2aD6rc7nFAu6PgtyQ19gv3NnkE+qNQX3lFDK7+UEm4j8DHGW73mVX8sD3OL?=
 =?us-ascii?Q?5/nypbayC+zxPiQSZt6u/SFicS6yHsFjC7CE5qeEmRfcXo4TDFLWiqweDkgF?=
 =?us-ascii?Q?7WnNw7gcTmOcr8E3SeOZrj755K2zpu5KNZqWM8jRxqEAhC/gF46BrJnPelxh?=
 =?us-ascii?Q?72GFLzLwS8u9lDa62t37ZFRHz6M4cm01RwOq77VU41GCoDcVmKD6qeUKLAKU?=
 =?us-ascii?Q?ZaRl7do4+1qDsk3KCmXOOzrfoTQYyxa9+yjHNQOWlIL6YVe/q/up793KyMGp?=
 =?us-ascii?Q?fu9O3jc1Fr1YfNOY6E7Ign8Jdq5tsyds9S+j180QAMspWBjjqRl1Fpb8mDkc?=
 =?us-ascii?Q?cHpwWI26SNLtn1JnP5M0JA5pEn0l0bgDQngFahyc2nV5U6wUSishjJCNIfhP?=
 =?us-ascii?Q?OvD9A29uvHf2llkJpTfJrOSxb9z6BFJKRHy0duNjY+N/0HWo/4jKgSYtj193?=
 =?us-ascii?Q?3Z2QaRqTaPNaKBzqHHy1qY1lwkxHJPYc47f1VM9uJTDI9v7WksuewFlufV/h?=
 =?us-ascii?Q?XnXdeB+W20WFDGv3dlVE/AJnIzealgZWlx7zBtwTv+qka2qsVLxPf22R3C+j?=
 =?us-ascii?Q?1p4QKt29ps9ihRlFmjG2+2n+nxGMojVOlQvwRJNjMe/4Z9yXlBMoN9fy2gZD?=
 =?us-ascii?Q?GTC6uxUG7NS83BNWZTzxVd3jhp4qS5MbdraC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UOggg6tvREszODGJ0Bq3B79KBEynbXELp7H7vISza7pE65dldEXEsDRHDaKZ?=
 =?us-ascii?Q?/tUR9Ry4NOR3Cz9yyEBBIFDnpnSDlnZl5ruyuEeiT9n1emb/jfCtHAByCEOx?=
 =?us-ascii?Q?sAv8+DuqtFLb4GTtsfQmDdwYygD0QIsDvgwKgTXtuFTDTVON2/qQELib4dGD?=
 =?us-ascii?Q?cYgXSCezffGvoev6S7KRYANb3402sTyKABdsdGFT+6oLaCXgd2HIN0dbr0To?=
 =?us-ascii?Q?trZshN6UR8FnqQHNcj6sC4rfm6o3SL2rpZCQ2ulNgbmBvelP8kWOHDjEipiu?=
 =?us-ascii?Q?/NwrqXy9ZA1aYVTQyyAHTpFPIdyf6mpRaYMfz3U5ZV76kRU9pL/VLzX+jPLy?=
 =?us-ascii?Q?vB2vU5cKCXqie1uNoT6hhhMK3BFNIos47SBgeZ7fVDfT+TGLGZQ7Ap1YV7rl?=
 =?us-ascii?Q?cpeMcukDUq7kO/67nP4inAlXZglY+mQZKzaghIi+1BIz3Ptd2qXXPKLJ7Nq4?=
 =?us-ascii?Q?4sF8YYKJTDoZO9XgwAVOocnhIX81ODcIylOs0sJI07Z6C4CPiHKJqk/D/mTC?=
 =?us-ascii?Q?ZzodC5pSAH/RfzGYUUMxylFuitqeshl3z8YVq6/vn2ENxW8yQS3LddN2KOZq?=
 =?us-ascii?Q?mqje5t4n9UF2G3WL5iXFplOHm0QYN7BJYaYRUNAiPCWHFFdOO+IiqV6CDv22?=
 =?us-ascii?Q?TvSR9dfS2vcWEqecZjLwwltkthGSPBFGf6vva06pGiLPbW6/wXcnJaRCMAel?=
 =?us-ascii?Q?SWAYdxX2dDQvQh6BY03uzAcmVRcVf/eSYH7vCU/nwvAM4bJbCukVsYC0WFDI?=
 =?us-ascii?Q?Vj/IGzS/Zlwjf+ckb5bfim1yWb7tV5CJY9m/T+6iRKqhuR0AIO7xtKfjU69v?=
 =?us-ascii?Q?FaU0ERTfPhg+cDxe/yMrC+INNG4RLfj9kjwHiLuaL9CY7acvAF90k46agbPp?=
 =?us-ascii?Q?sm331nF0dSt85ziO0n5PaBLvWKauC+94kPto2HRD0OQK78gd6zEklqjXtfXF?=
 =?us-ascii?Q?/h2CpaX05fapIdOZTZxirhfSFxrfH/P03rcEePvmwEyG7U3q6WOYK6tnrxjd?=
 =?us-ascii?Q?idiYRiam2ybmfiPC9IEuuFwQsRE81/vugy7fWEaqBNYnyvtNu+oIJ+CbiVbL?=
 =?us-ascii?Q?LiZUIp4RX9Dq8kdnr1Uub5s0kYq3OUC7oIQSxaY6+AP0WKz4wmG8ytQ0xqcm?=
 =?us-ascii?Q?mM/cyLI5Fb80oLWGJlprZXMd9GYGUKIMtWw0vZyOZGnzmS1xRT+qi2oh7ZDO?=
 =?us-ascii?Q?mBXCuWRdK/nihyzSSQTBNoMwhLji1mebkAKztfpPgV+XOHhnEefcb/jDMKyk?=
 =?us-ascii?Q?pp8LyBEVCCor76Lc/jlhh+pZb1P+hzWT2cwx8jEJv52uW+0CBP0G/u9OzZIx?=
 =?us-ascii?Q?8brbib3XjK7KkCO05GGUtUCTel+24Nxd/VBBEuVbjYsTc6TrpKhAZX18c5It?=
 =?us-ascii?Q?cIgWoN+dyVuQDuGvDKNiTtzRX+OwUZruFQ7T3YXzGGDoaj3mlkPwbMueQfht?=
 =?us-ascii?Q?QxOi8RWj1s9JmJw0qz6uIrY+6JIvbxPbVgyshpWd7Om17byOKA8kkiQOkHz6?=
 =?us-ascii?Q?zd534iZjNMGbNzVqtLR/je+QLbjgMxzvYf7gQeVW5O09/XFLt8y+/338yjCx?=
 =?us-ascii?Q?UBYvvj82oo7F+miUitmAaMOlqMKtaC5MYCilnfb2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29183dd1-ccd9-4e8d-a526-08de28ed53f3
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 11:01:31.8379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKth0Mi/chRgOYbDZXDmBI3ZID+iGGCai2OmHp0jlckurpM+O6ztJ+OJ05eHXK8+yNlqB8aWC28mGxdfiPTm7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10755

The LPI2C controller automatically sends a NACK after the last byte of a
receive command unless the next command in MTDR is also a receive command.
If MTDR is empty when a receive completes, NACK is transmitted by default.

To comply with SMBus block read, start with a 2-byte read:
- The first byte is the block length. Once received, update MTDR
  immediately to keep MTDR non-empty.
- Issue a new receive command for the remaining data before the second
  byte arrives ensuring continuous ACK instead of NACK.

Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
Changes since v1:
* According to discussion with Frank, improve comment and commit log by AI.
  This comment and commit log looks more clear.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 94 +++++++++++++++++++++++-------
 1 file changed, 74 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index d882126c1778..dfacb0aec3c0 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -90,6 +90,7 @@
 #define MRDR_RXEMPTY	BIT(14)
 #define MDER_TDDE	BIT(0)
 #define MDER_RDDE	BIT(1)
+#define MSR_RDF_ASSERT(x) FIELD_GET(MSR_RDF, (x))
 
 #define SCR_SEN		BIT(0)
 #define SCR_RST		BIT(1)
@@ -461,7 +462,7 @@ static bool lpi2c_imx_write_txfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atom
 
 static bool lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
 {
-	unsigned int blocklen, remaining;
+	unsigned int remaining;
 	unsigned int temp, data;
 
 	do {
@@ -472,15 +473,6 @@ static bool lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomi
 		lpi2c_imx->rx_buf[lpi2c_imx->delivered++] = data & 0xff;
 	} while (1);
 
-	/*
-	 * First byte is the length of remaining packet in the SMBus block
-	 * data read. Add it to msgs->len.
-	 */
-	if (lpi2c_imx->block_data) {
-		blocklen = lpi2c_imx->rx_buf[0];
-		lpi2c_imx->msglen += blocklen;
-	}
-
 	remaining = lpi2c_imx->msglen - lpi2c_imx->delivered;
 
 	if (!remaining) {
@@ -493,12 +485,7 @@ static bool lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomi
 	lpi2c_imx_set_rx_watermark(lpi2c_imx);
 
 	/* multiple receive commands */
-	if (lpi2c_imx->block_data) {
-		lpi2c_imx->block_data = 0;
-		temp = remaining;
-		temp |= (RECV_DATA << 8);
-		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
-	} else if (!(lpi2c_imx->delivered & 0xff)) {
+	if (!(lpi2c_imx->delivered & 0xff)) {
 		temp = (remaining > CHUNK_DATA ? CHUNK_DATA : remaining) - 1;
 		temp |= (RECV_DATA << 8);
 		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
@@ -536,18 +523,81 @@ static int lpi2c_imx_write_atomic(struct lpi2c_imx_struct *lpi2c_imx,
 	return err;
 }
 
+static unsigned int lpi2c_SMBus_block_read_single_byte(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	unsigned int val, data;
+	int ret;
+
+	ret = readl_poll_timeout(lpi2c_imx->base + LPI2C_MSR, val,
+				 MSR_RDF_ASSERT(val), 1, 1000);
+	if (ret) {
+		dev_err(&lpi2c_imx->adapter.dev, "SMBus read count timeout %d\n", ret);
+		return ret;
+	}
+
+	data = readl(lpi2c_imx->base + LPI2C_MRDR);
+	lpi2c_imx->rx_buf[lpi2c_imx->delivered++] = data & 0xff;
+
+	return data;
+}
+
 static void lpi2c_imx_read_init(struct lpi2c_imx_struct *lpi2c_imx,
 				struct i2c_msg *msgs)
 {
-	unsigned int temp;
+	unsigned int temp, ret, block_len;
 
 	lpi2c_imx->rx_buf = msgs->buf;
 	lpi2c_imx->block_data = msgs->flags & I2C_M_RECV_LEN;
 
 	lpi2c_imx_set_rx_watermark(lpi2c_imx);
-	temp = msgs->len > CHUNK_DATA ? CHUNK_DATA - 1 : msgs->len - 1;
-	temp |= (RECV_DATA << 8);
-	writel(temp, lpi2c_imx->base + LPI2C_MTDR);
+
+	if (!lpi2c_imx->block_data) {
+		temp = msgs->len > CHUNK_DATA ? CHUNK_DATA - 1 : msgs->len - 1;
+		temp |= (RECV_DATA << 8);
+		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
+	} else {
+		/*
+		 * The LPI2C controller automatically sends a NACK after the last byte of a
+		 * receive command, unless the next command in MTDR is also a receive command.
+		 * If MTDR is empty when a receive completes, a NACK is sent by default.
+		 *
+		 * To comply with the SMBus block read spec, we start with a 2-byte read:
+		 * The first byte in RXFIFO is the block length. Once this byte arrives, the
+		 * controller immediately updates MTDR with the next read command, ensuring
+		 * continuous ACK instead of NACK.
+		 *
+		 * The second byte is the first block data byte. Therefore, the subsequent
+		 * read command should request (block_len - 1) bytes, since one data byte
+		 * has already been read.
+		 */
+
+		writel((RECV_DATA << 8) | 0x01, lpi2c_imx->base + LPI2C_MTDR);
+
+		/* Read the first byte as block len */
+		block_len = lpi2c_SMBus_block_read_single_byte(lpi2c_imx);
+		if (block_len < 0) {
+			dev_err(&lpi2c_imx->adapter.dev, "SMBus read data length timeout\n");
+			return;
+		}
+
+		/* Confirm SMBus transfer meets protocol */
+		if (block_len == 0 || block_len > I2C_SMBUS_BLOCK_MAX) {
+			dev_err(&lpi2c_imx->adapter.dev, "Invalid SMBus block read length\n");
+			return;
+		}
+
+		/* If just read 1 byte then read out from fifo. No need new command update */
+		if (block_len == 1) {
+			ret = lpi2c_SMBus_block_read_single_byte(lpi2c_imx);
+			if (ret < 0)
+				dev_err(&lpi2c_imx->adapter.dev, "SMBus read data timeout\n");
+			return;
+		}
+
+		/* Block read other length data need to update command again*/
+		writel((RECV_DATA << 8) | (block_len - 2), lpi2c_imx->base + LPI2C_MTDR);
+		lpi2c_imx->msglen += block_len;
+	}
 }
 
 static bool lpi2c_imx_read_chunk_atomic(struct lpi2c_imx_struct *lpi2c_imx)
@@ -599,6 +649,10 @@ static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
 	if (pm_suspend_in_progress())
 		return false;
 
+	/* DMA is not suitable for SMBus block read */
+	if (msg->flags & I2C_M_RECV_LEN)
+		return false;
+
 	/*
 	 * When the length of data is less than I2C_DMA_THRESHOLD,
 	 * cpu mode is used directly to avoid low performance.
-- 
2.34.1


