Return-Path: <linux-i2c+bounces-5718-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3D395C3E6
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 05:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED52DB2174C
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 03:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F5248CCD;
	Fri, 23 Aug 2024 03:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="lNLpzooA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2059.outbound.protection.outlook.com [40.107.215.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AB14CB37;
	Fri, 23 Aug 2024 03:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724385104; cv=fail; b=Sk8tLRCfdOarmtfxBpiMFQXmCRTrh07m900WKOSBXxDIPHMK3fcW1er+jen7oQQEkz4H1l84BPrIF3KrSUF41Wz/ZmukoNn5P5c1nHQ64iB01Flr5nsmrUDqLUYCwp6Z5lXt0ia/mVfDyLCkpZtCoB85gE1QNCLiOi9qS0lq5Cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724385104; c=relaxed/simple;
	bh=rnEXFiwNKMbpfOjsw+4Sd+pv6oK9+XmnorAPrPZ8Vxo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lvEWFimmS+huA+fW6d7Wkb9CgkV5R2a22nq1aBFiuSK7yg5MJNmeqoDYil2vU4Evxbl36J40u4hdKMD3lY/VaL6Hxzvte1UtPq9ePQTMxQ1J4Kdp7ZBTxxzX025lJLQHnfXSVyfVNZdjCo1V8p1LD03to9l5L0x+izd1MaP3wMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=lNLpzooA; arc=fail smtp.client-ip=40.107.215.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtAVO+yM2ojNjGoRFFQJIrEr/Ku/J8TCvQJxqgHuPMDh4emNode+DUTCvRbqbZpa6syWMf6C17E0aTws5HVIRAL/1/OC20ZyNGN7J1iN/YcS6Wa657TKl18CFkJIo8GCL6rjH64X8VbfHv5x1kqo0He3BD57AmI3TAjNxQX9hWk+fDErBaJyMz+KFOAC0yY1oWGnatjdwrb8JeYQngiKMlNu/pBlD2pASaCUjOYrSLw5HTwso6Gu9e41DlS/QsxGtZYtcTG2DPIW45G+K2q2SPoX2PeqFSQdmyBJQjnv2UA4haCiPoIGFrvsQtDRZJwpjlxAntOdP22LYSgVybFmzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuY0CvjcrvomH6T6H9uNr1HhlcMrjZfipupAykyAugg=;
 b=vg+bqdEfTJ9JKDLSDIdT2bV+UreXifBPpQ5pXFqsUwGRQ/HILEx1hDSjU3Jx/Nngwv0fHUCKBkuHWufmXHbLKgZdkuctF53L1Q4fo9xPntjdH2D4/eOwQO7ZET5vs+jrGqFtLNFDHVDefg8XLMQBSUvSB4u570X7BClmTTTxzvCyXYFkHFcneFQA1nFF6o4Z5w4mjwYo9Z68D6qtXkVw0xiQItumhVMpC3oOS3a6yXK2asxTn9sU50kFTnkaVas6T1oFrjU843/n7BzrSZc7SxepXdIWdm3QK9uS0ya3fUbnxMC+e8oZOSVOc73TsJ6cpwpDN5y8w2e8C3DJ3l9vPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuY0CvjcrvomH6T6H9uNr1HhlcMrjZfipupAykyAugg=;
 b=lNLpzooALni6+DlTo5sOFHUBcgQ5tRulmtxnDP+0XtXz4L5Pbn4rel1ibS57xKth3908qzk8e5SX4AP7J7gghCJd3VypfRjIw3fQnN5XqelR2s5WjtgB0cOuM0VtIEShe9YZlw28O/ghXC4oi1t+3Uj13uZCLmoPEylmcr/yGt0Nb56sJj+Q9oqDnECZvqK/9Fp4aKir3t/AtMWlh0AEq5FjGqiMeygh+Ph6U2SsYyc9oUyGjakFBSyYAcxysv9BFfIMcVMvxLA64M02ivFjGFnI5d8lnslvVDj1ERiv33kQWf3mTOdjprhtNNpSPG66Zb1B5HVBchJGYyKoQRJVzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYZPR06MB5949.apcprd06.prod.outlook.com (2603:1096:400:337::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 23 Aug
 2024 03:51:39 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 03:51:39 +0000
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
Subject: [PATCH v3 2/4] i2c: emev2: drop sclk from struct em_i2c_device
Date: Fri, 23 Aug 2024 11:51:14 +0800
Message-Id: <20240823035116.21590-3-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240823035116.21590-1-rongqianfeng@vivo.com>
References: <20240823035116.21590-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0061.apcprd02.prod.outlook.com
 (2603:1096:404:e2::25) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYZPR06MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 581c6c84-bcc7-4b3e-1a1e-08dcc326e4e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LAweTv7I9JOrAJRTM2WEFY+Vld6ghfxhuyjL5KX0iXGGUOkzTZcjZqCGN+/5?=
 =?us-ascii?Q?KlL+QLCwbArHFPHxKlnCDFcS1rET78aoRomN/5PCiuYtJcnPu1RmsFR74kld?=
 =?us-ascii?Q?VDify370oco2+ux+7TGjBrNcGkO5UPfi4amZXZ1cLP7eMoo493kjT49NDl9H?=
 =?us-ascii?Q?yJfA3ZWfZH6sO3BDoglVu/zqUwqjFGsvGBWdw3WzQq3zj/2QKGjH4W9OV8UM?=
 =?us-ascii?Q?qHo2avm4BY65uhnELqBnZJ5+rl0v23oW3VmfEzoWQwYhkh2jEa7fSgXG8uqj?=
 =?us-ascii?Q?fgXZdRuV8o8t7m9ibAy4VpjoC5W8yv0SJlCMcQJYqGJnPDoTE05tTWXnnqCx?=
 =?us-ascii?Q?ulPisVH2E1auM3DGKOFYCq7b62y79PCIbMYxoo1dXJAe6Wje8qUhRBfz7x8E?=
 =?us-ascii?Q?UtTbBv4PXnVjhJn+0+RONbRfar/zf089xn2p4EjkVBQ2xKWEda8dhZ4HGKYK?=
 =?us-ascii?Q?FkAoH+Qfp0smmpkgvHoCkA/siDawLiC7otCiCsl2C9id4xR3HJlba9N+BkLM?=
 =?us-ascii?Q?n/PcL7z4JHBWD+9W3g97qbM25iemKiPrSbN67FAxUBgwyZYnNKOvKFIIy517?=
 =?us-ascii?Q?XVoQuPeJfUPJivygky2PRmQ++LD3KrqtB7eVK72h/n7+JqDYxXDp5Wt3UYl7?=
 =?us-ascii?Q?YGi0L14luYA65FzWLsEtQDqIVeVkGQStlBp+V33K/GSjLbMeDXe0irs1HbFd?=
 =?us-ascii?Q?S+Ih0wST0qB3oAHyylOgdElwJNe9mJPNmimimK7r9/vQnQuVOHFdTtAbkZ5B?=
 =?us-ascii?Q?xwlw80BWtNtoiznyag4n1KO6eL7t5Ks0imYbiU1ebSHGYORw2NR/r0v5UM/2?=
 =?us-ascii?Q?5at/z52vURkprWHAMrhBxwieliLuvaPL08bRvA7hi8BKgJkQydap5GW9x86j?=
 =?us-ascii?Q?F5ZTsRjiLv8P3q8sprKqz1+k5VPxFebm4uroORLgMc6LH/6Y9Pcg6fS3Tkc4?=
 =?us-ascii?Q?C9+N7hX8fdJwjtiZ0uTdY2OpEQsI2dt4Zkad2Toam9q5N9dA4DkRg2taiXUY?=
 =?us-ascii?Q?tfAHTAxGkPYRGbXL+h6yi5QQCnePcRC2OKOUTH/MUBTauCsRcWrsMtlYzrGF?=
 =?us-ascii?Q?9c5oB/MY+g0TelldvaondFJoCc8e+bU9T6mF7s1AKIlZ8xNhwdJ0eariSkMK?=
 =?us-ascii?Q?T468Wo0QJYImQLPN2kHQr6pxVu6MG/hUOQmIL4qsnTUUKChD5e+tRQsMX0Ow?=
 =?us-ascii?Q?rBSKi66d0Hdt7lDaGssrhOVOZWpzHBSlWLlwJ/cuyiUN4FvLHDDWec6zU7Fr?=
 =?us-ascii?Q?0hvvQTz8XkLQYAoqkXmzFwe9b19qLOTA3k/0dFZdwlTyfHPLMoSv7MFSzOf4?=
 =?us-ascii?Q?IJqv29mVQg3txF/aF18KZD4ji9pa1D6xDi0QSnu7YMliEwigjBCVxd9WaISu?=
 =?us-ascii?Q?jx3wChMe1IuklM6oRIt1+DvHQHpzzA7ZWjI1Gwg3aj659QUJ5w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WVHM9ADR9zQFovm9y3H6+0r/qZPMwWosuE7hZN5Q13QvtrRPsLJwW0y1Dsa2?=
 =?us-ascii?Q?mkhYoUhGq+gMoimMAUSDXd4IXipPt99uhbKMlnreQ6yKqP8vJHdsfVi+k93W?=
 =?us-ascii?Q?5B3ELgXwap778PsqdER63S6Bpl6WoyhoMLi3nW3O8RrQzaNk4Qf6Ml4fuDQj?=
 =?us-ascii?Q?jj/wOcaFPT4giGxDQQJ3Iwc3whAT3u04+89qfaLow+E1WUY/miaB8senUjPC?=
 =?us-ascii?Q?T2LQa5x9Jyxit7Scn6jB0zygfXUrZMZsoRN8TSaRnrzfl0LFlINzRmj2uTav?=
 =?us-ascii?Q?agqx+rjCPJ6mLJrqjf5RMEZeDrVJcDLn0owqXPKfyucivbiJDWs5F1GdixJc?=
 =?us-ascii?Q?1cd2qYI7jBa97cwMQ/xtjduhEV/qX+ZflZeU+0j6gP2NxpCzYJTcifM9ft9h?=
 =?us-ascii?Q?Vj3bcDh1xQVgKLDP9Aww3JgwnrT2ay1AZII8gwjEV1zD/L7pN/hor0+ZYWQ6?=
 =?us-ascii?Q?Jl+CxvjG4bXNqyZYb91RiKMv21LtfEAOpkAxVpRw5o12MHaZCoyNhGofOax9?=
 =?us-ascii?Q?X4QBYz691vXvyilbQARruQ3A9hRup+tqpDwGdEFYGj2W7AH4SBfYYlmFAEiZ?=
 =?us-ascii?Q?AmLFgFLBxJVsSMMp4ZgQ5sM51o575PgeSy0BL1338rLQJk8WYQV1EH+rzdkK?=
 =?us-ascii?Q?OazSL++ajzwYGC9gN+LfpWm20YKjybq8rJs+gP36+1B1Dalew8vNaMEBAF7W?=
 =?us-ascii?Q?/iL09XHW/wJf4UvSGbQmbg2eIe0fSbYB7MKT0uUtnw85wfZmsEBBx/9+Zi88?=
 =?us-ascii?Q?ZzHYYgYS9/Qxa5zzYrZHxcKKVm7esn8Hsd5Wmygv8O5s1Mn0kWk6C7tqMP3/?=
 =?us-ascii?Q?/sf5u8zJbhVWLAjTf0wLs4d5Gbr7UrEKoX/wgrFSfgA58O/miHo/f+0taeKS?=
 =?us-ascii?Q?ZyPAJ6g8lWhsrygvDbcFM4iEISEpIkBgdRg5FffSh0wzVRMmTNMGHDW/K8Ro?=
 =?us-ascii?Q?0gyWzfXR63E6cGI4DECNa7i+LXe95XMGQeQ56uEkSkHyO58Y/kUAfPQOJt0q?=
 =?us-ascii?Q?IVVYn4zIfFWZbTQeu/EGhvV1SL10yFKm+Yb9hPrYzprgDOdwUgIJMRai0a1E?=
 =?us-ascii?Q?gmJCWamgyl0fScw2lyAvFUoctNXDuCnuZkHW0xIJ21+70rLk04wFdfnzjuMa?=
 =?us-ascii?Q?LLlHlWkl+2lHfggbYYnqL64M+4EFg8Oqhi0XyqwpwjlryE6jEJGLKQuXnJ1x?=
 =?us-ascii?Q?ptlif1WcOQct0jRdD3C8cdhHvzCsMXcFrvKXwQauEDrysPgCUZPF6GeeXtwC?=
 =?us-ascii?Q?8yCCjrc5aWlkHaaRtdK9a0Au/GeYmaoA99Aw9eVAlL7PpgotRQfcmP13Gvs+?=
 =?us-ascii?Q?vhLEo/P6YzWVLVa+4ojcpGRZHAAdGeTLn6LIzOzRGMa01QqMH9CAFLgZNKoY?=
 =?us-ascii?Q?vWtcQt1CwJhcS17PKiEiRq9b4AC/1eQ3+BfVIKgfkmExb8JA+33oB6Df8cIo?=
 =?us-ascii?Q?rJ1pQWNd5NLXgkFi5H9Rg1lPLwId3d5MCzAsozoyPjKh/rLYEDwPjmzfavuu?=
 =?us-ascii?Q?x/cI5nMPxu6BQOfnz5YnjBkZtISeicaoZuZQFqVQQXRXvZlXXAgA/EhnKWTQ?=
 =?us-ascii?Q?xK12GMIv5aJtmLd2K7MV4n2n2s4O7KVCmPvplY2D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 581c6c84-bcc7-4b3e-1a1e-08dcc326e4e6
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 03:51:39.8131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHQAd92Un3eTPD714jFxN99R5nX9GfW/mW+xtvhMI9/3YFDefV9h8LmPbgv+8qNnJcYZxB2a5TB0+zThqFJdrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5949

For no need to save clk pointer, drop sclk from struct em_i2c_device.

Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/i2c/busses/i2c-emev2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev2.c
index 20efe0b0cb85..2a5d9d658246 100644
--- a/drivers/i2c/busses/i2c-emev2.c
+++ b/drivers/i2c/busses/i2c-emev2.c
@@ -67,7 +67,6 @@ struct em_i2c_device {
 	void __iomem *base;
 	struct i2c_adapter adap;
 	struct completion msg_done;
-	struct clk *sclk;
 	struct i2c_client *slave;
 	int irq;
 };
@@ -361,6 +360,7 @@ static const struct i2c_algorithm em_i2c_algo = {
 static int em_i2c_probe(struct platform_device *pdev)
 {
 	struct em_i2c_device *priv;
+	struct clk *sclk;
 	int ret;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -373,9 +373,9 @@ static int em_i2c_probe(struct platform_device *pdev)
 
 	strscpy(priv->adap.name, "EMEV2 I2C", sizeof(priv->adap.name));
 
-	priv->sclk = devm_clk_get_enabled(&pdev->dev, "sclk");
-	if (IS_ERR(priv->sclk))
-		return PTR_ERR(priv->sclk);
+	sclk = devm_clk_get_enabled(&pdev->dev, "sclk");
+	if (IS_ERR(sclk))
+		return PTR_ERR(sclk);
 
 	priv->adap.timeout = msecs_to_jiffies(100);
 	priv->adap.retries = 5;
-- 
2.39.0


