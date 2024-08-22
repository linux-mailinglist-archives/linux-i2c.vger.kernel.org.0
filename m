Return-Path: <linux-i2c+bounces-5675-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF5E95B7EE
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 16:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2D8F283AD4
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0786D1CB320;
	Thu, 22 Aug 2024 14:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="VhnVhGP1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2041.outbound.protection.outlook.com [40.107.117.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6623D1C942B;
	Thu, 22 Aug 2024 14:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724335566; cv=fail; b=eL2T0MLwjnBTuJ9NgeBGBjZIu8Dlp3SnWk2EN1NL33mfz/iUgAaN5THll7mFhMELRnkpLA8QbR/9vA1FyT5Cjpwvi0Fgnl9vvFF9A2jYW8P+lAi3E+yTCoVSdi87YToITC6mfI1YHzCGphwIlGtf5lr5aGYfaPLgfGVg3+T/Wao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724335566; c=relaxed/simple;
	bh=a0zLsE1j2Gf3/rVV9f8v3hrhEfqyf2LjHP7E5KBlJDk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pvgAJCJWuBt1vUItq4aey5hUKgdU3pBJPmLNvBJ1lxOuQDybGODcICwIln07ZeL5rLA/o34dHWSdHBLJtgDCT13FtQKPUfUxX3XkBD4ryLstRJz33bRBEG5xqpxFBlEY3TwqDgXftKl3AxGs8+ZGeL6T89+bTLmgr/wbmtcgSVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=VhnVhGP1; arc=fail smtp.client-ip=40.107.117.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nM1TzP3NZE8srqck8wnsxrF9m7xjYpOZtW+/kswnaqd5+DJWpyKNPlHqJQ5llZ9gSQDWwsOFKk7mqY2C/QuU33wpw+cUkBwyy/xcznu8AISjAJabKzG8oWMpYYfICr6ggHkwVIThh4E3Weoyhm1GtJ7RrLMu3cgEcopjTPPktKKoHlaTVPN3VpXgBhugkAkxAPiwUEYbzv0sGwtR66MsKkJj842tPhMImOsGHZDJUNjw3L6H9NHwyfWmQFoPEAjcUEOvaLZ7+sJClCC+xbNWlPwo55/InNQhzvMNLOF60R/5/kBsmoxumTxxhq+pUyV6JiE1CCY023xhmiT97VaaNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fh6gqHwq0sI6K+2JpXOAiq7ZlnK3XNIqM+42FuvrmE8=;
 b=VQXq2KZdc+714LJuGep7fggPWcvrF6yWH/sqwPd+k0PJrJf4aWF38RznOcjSQtKM8Y7E08audmSsNGQEJYXxstnGwc9ho/UJCqqfV28q7mPXArqYxg5TnK1JpuDF1TbvMWjyIPd7Sa1pei/QVQMU1YB+Eghk44gn9Jy1LkZJIFMX7vqk6PodrkajAgK8pNo8G82Kxo5ncBYK/nT/5iM4tvqqq89WBnaj/75VXKofHZxOD/d6tuduH4VXDraIx4EE8HEunDHB/m00GNw8mNfyI/soNvczam6IXPoBOX0p2VrkkLgkDP/1PVA5x+U3khVkvPJML2fM0kWwMPtm0/9+IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fh6gqHwq0sI6K+2JpXOAiq7ZlnK3XNIqM+42FuvrmE8=;
 b=VhnVhGP135GfpBm80Vg7EfMO7/fsgeIw7aa4uuszRt6pk0L9VGK7XneDo3+evENMmI29/gEkH3HKIuHro2EvfjGvXff4SZ+L1PSNTwtAKUzx8mdh8/gPMLNt5m+jBFvAvlaqccal8xfT+7u5Tlp7RPwzR7eW0VIgzDRl7oMbUMrzlLUvXy5ppCQhc6k8pXz6LCQZaEJX6EY+jX5phAWbrtpKR1rpd8/PF0q2gGhGf/+SA6sJWI8ftcGE+zEvyO145/ydXyvKSb0HvonwdUrfGnVciYYgrzg8LUhU8AqA8qfVemQs0lO9MIO2766K3skEN1U1VtvA3azbzat59rdfDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEYPR06MB5301.apcprd06.prod.outlook.com (2603:1096:101:82::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.19; Thu, 22 Aug 2024 14:06:00 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 14:06:00 +0000
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
Subject: [PATCH v2 1/3] i2c: emev2: Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 22:04:10 +0800
Message-Id: <20240822140413.65369-2-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240822140413.65369-1-rongqianfeng@vivo.com>
References: <20240822140413.65369-1-rongqianfeng@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5fb28585-9554-40dc-b380-08dcc2b38d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PDeDx5SsDV55zf4XkiI3P1RX1vyPWsgFgxbYjkSanJwVuQ7QWWvGAHXAAP2F?=
 =?us-ascii?Q?6WMhRnFvNiG3sCViuhMqErtwLMZiwnTJi85P6cX1nV3kvEYb4eThxHgScKqV?=
 =?us-ascii?Q?7ivGkqim0/+CH1y+T3p9FwJfSbBPPKUTTQe4J5nKefxdAd7ix3o57jmfoIrV?=
 =?us-ascii?Q?RbBwJ03rs57BRorT30WK4lBxgsFMv0WXTabJ5Xrh6iEH+5PGxMjLbjjTDWyP?=
 =?us-ascii?Q?G33l79HzT8bdD1SvRqYYe3knXrmWDtHfUphP5bqqDELKbeS2/PUCWKTjjeZP?=
 =?us-ascii?Q?VBb5OSvLyWkzkL2L4KXn3OO662fWOFG0wQwkkusIDRWYZnEQiXdEFIyCFMfC?=
 =?us-ascii?Q?SRbimEvzVgpbynSKlrHLINpIJMNL5UxQ7UlZo1AqPUNQ7qqgIl81oOKMlf/m?=
 =?us-ascii?Q?HRa55zsP61qY1cF07C1K0yyzT76/DRnDLBp3cvpXkdjXxQV/IkK67qvHDfsV?=
 =?us-ascii?Q?YNg0E/jWhCW4J8T8W2+Lh4h6o2c88VKix2sLMMaitoFvuCYBk7Jr961E0b4N?=
 =?us-ascii?Q?kAhFTwtWwtZiSLJVDvqj6mEU5TUJFd/9GeQm1gD2D+yxY1QEmZLFdvSEAN0n?=
 =?us-ascii?Q?bivPpeQJILbDKQjAYPxDb/ms1pnxqQR312MICkXJGFq6IqG9kPmcSYXmV1F1?=
 =?us-ascii?Q?EQlxCVBFijTubj4+0mIWU0wsqCZiqBmhByV4E1+aNRGYpjKgEJCWvX23/YAE?=
 =?us-ascii?Q?SvFWX/2DmhFMusDiNLq++CoQDILPfl27DXU6PaxzdDs22htSrWeBorbYrVBC?=
 =?us-ascii?Q?JnJ6ni+rzVHLFI0Jp9iNX+GO0NJXs4BQL8asJj+ymphFLjeVosX13KiJJGwF?=
 =?us-ascii?Q?AgOBKSi63jog/uziWTYdR8NUVEakP5j7srSUhnymI9jeD0Lr0V3gp7FqoMMq?=
 =?us-ascii?Q?So+3kUox97Xs3Gz793xlSyhfeuH3mTQzMCYfqxF+tA2tCLLQGyhpVfyaTxJ/?=
 =?us-ascii?Q?rqXfvMfqGhdqYBIw5jCO+UYHHp+DDmB6AM+i0400vOecMuegFzpYhvVkMaHx?=
 =?us-ascii?Q?HEW3KiF23jD/VdKPAfkf1pTolE7N8351OejdcER9xNUYS6harp29uTm7fF1S?=
 =?us-ascii?Q?uxTzrP1TWyH01VPg7u3vTvhG8s/R0P1/fa3XSOZc8KvxKkPMWb0wDr8nTcvT?=
 =?us-ascii?Q?j27F8ZUjq7EZy6EvzpDysGyWfycmo+DhscKfEMwofqd5iFEnGArP/qi6OvUz?=
 =?us-ascii?Q?soa1CC3mK3TomPmlEvIViFqFDXbkRZAEnbZ9LgkusVbXMK9v/zDksN80oaBU?=
 =?us-ascii?Q?g/7o9CPSQyQxpuIl1yejtWpX6pIRFF/38gWKVlZLNV62PcKV/4LT8WrAOMI2?=
 =?us-ascii?Q?V+JuwndNoh0aY7yc3MdJCRxqBn695/7RYnjl6qJfs6upfl2HM5JUWKEbKZ5t?=
 =?us-ascii?Q?BH1AG9W+GBmAe6z7t+xdrCAfykuYbvhD90+VAywBme4nTgC7Xg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u0/ZOMVxP7ZFiIj28AIkgfjducrS1J3p2wODaGfKyAfUZzygwMxaRu6Kl2P/?=
 =?us-ascii?Q?+e6yfa7ZDePAlZDHU4rRahUeT0DtXkL1BzjMskOizuSYdT1dX5UzFZz+Yutl?=
 =?us-ascii?Q?KOVr9WDl3CPeGIP8GQIJKTq9f1a4eWqfE/4OqtvTgjNtoAWRLPsnDH/cxg41?=
 =?us-ascii?Q?T8Sd6dnS6w9wMG99VUcJEUcYrtGAQ/4B5MOMik/RayP2wNiwFcQ7GlWowGnF?=
 =?us-ascii?Q?hGO9vw4LkvGGYShcg8TOIfiHGV4pVA86Xm/6juW7/obnu4BTIRzTAYTLHDyL?=
 =?us-ascii?Q?g4gWQ4U7uqOzsiAZMgsmEfD1/kMbLG37Sp58dzGZYDL4jXBMJeteOKh17vTs?=
 =?us-ascii?Q?joP5kQxeo9QZtY9fBUxlSSDYDDTbkf7dG3c+1tWSErdcPiPqELVIRh8vGEns?=
 =?us-ascii?Q?h1yof7zujTcQ8YnxBSZj9+a9iy0y9rJOb9ElDCTFnpUKQB23H27ufgBWwcy0?=
 =?us-ascii?Q?jD4Vn3rF+WICHipHCazUyub3zp4fqd6CyaBMMUtX6zW9hK4BGVo4IoolQbKf?=
 =?us-ascii?Q?YDg4dzUiwESNyN/TrutOnZsEV5jsS6odeXDGSEc8a7EvXJMIIhbeDDCQ2bBu?=
 =?us-ascii?Q?LZNvU3rndEKbAkENqHVDDPGArhPb6xCMUImeP2kmvDfNI5vGb5+UVKeTabj4?=
 =?us-ascii?Q?JPuff4l4GcbMF+M1E5t9w0IRsYxHRz/s0Rs2HEtL4kbDG+OpdpnvWoNcfPnN?=
 =?us-ascii?Q?Z/GLQzwayeVf3AQZrJ63uQUm5ckzVTpF+D3jIraINtceP5FXE+AYBzrOV0fb?=
 =?us-ascii?Q?0n70liI3SXL+3VvcmWKY/SxqYPDdk8YIbHFxhTeUWNjzGQKK01oaC9ko2+RT?=
 =?us-ascii?Q?PjZ64Ir6kKFwzShxbyzBwdrA8VB4EaiVk/6SBs5KoWc1cV1QiFAVRhcSTwxW?=
 =?us-ascii?Q?cEBYMn645tP4gucH743UfOaM92RahcsXqnGydgc3u4merswt0pkAnUrJ6f0V?=
 =?us-ascii?Q?uS+cUMm7YLOpoaytvo/G0K2NJRWETXQd+7iBjmfmGOt7YtRmkGKlXkX6ZTv8?=
 =?us-ascii?Q?/VeeiqOTLSfiGRJ6/N6g7h12Q/aP4FvxR2ZjbpVcFEErUvz22zflhNEiezi9?=
 =?us-ascii?Q?N7OWrHyl4BUkdP98h4SR3eEQm0ni9FaV47JOqtOTMVQjHiVpy5aNRjQ2dxLF?=
 =?us-ascii?Q?IbnxYcP4lm53Y9r93w6gw7hA9U3ZFKsCUrJsBN4B2S8chLIy684sY9zCBy1C?=
 =?us-ascii?Q?ZFpHwf4ZEcttTH6ShMW+d/9Ibu4jUqjJOOskSuyoiLxOd9YDxTm0NtgCRiuN?=
 =?us-ascii?Q?zp1nwXGPeHyzOtX2yt4cDlc0AssdbmfgfbqNg+pojnIcNnrVZVu5S6UM9H1m?=
 =?us-ascii?Q?szU5iWbiO4Bk/zujql8ZvrlUsHYzCb58McX7eHAsxoOUHIK5GD+QOE3VUbI9?=
 =?us-ascii?Q?VKTLcMB1diYnwUOnmUowCyHf0R0T3GovGOvaOhOSYNqaV1pFd1o/YM1pkU6Z?=
 =?us-ascii?Q?OkKs8ZYGetRxJ2f01in7PeJT+Hqs0oyLmNDgD6T3s6iKlPBpuC4uRpPJ+Zvj?=
 =?us-ascii?Q?R9mKpEUyfKe+47pHn9RtI3yHIpZNkohvaPaWAj8MVCxzZzlUPFKUOlNzYwok?=
 =?us-ascii?Q?sg/RNzkuE1VOfhmz38GAsQVg+RswOEYhH4K80sJp?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb28585-9554-40dc-b380-08dcc2b38d41
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 14:06:00.6603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdPxc4aRtQ/FFMCaChKOh/G17DpuOT0Mx1hxdSPnCGJNJvsZeieb2+pM2Vqe0BRD83oGClOtheoSaVR71HECnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5301

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the calls to clk_disable_unprepare().

Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
---
 drivers/i2c/busses/i2c-emev2.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev2.c
index 557409410445..20efe0b0cb85 100644
--- a/drivers/i2c/busses/i2c-emev2.c
+++ b/drivers/i2c/busses/i2c-emev2.c
@@ -373,14 +373,10 @@ static int em_i2c_probe(struct platform_device *pdev)
 
 	strscpy(priv->adap.name, "EMEV2 I2C", sizeof(priv->adap.name));
 
-	priv->sclk = devm_clk_get(&pdev->dev, "sclk");
+	priv->sclk = devm_clk_get_enabled(&pdev->dev, "sclk");
 	if (IS_ERR(priv->sclk))
 		return PTR_ERR(priv->sclk);
 
-	ret = clk_prepare_enable(priv->sclk);
-	if (ret)
-		return ret;
-
 	priv->adap.timeout = msecs_to_jiffies(100);
 	priv->adap.retries = 5;
 	priv->adap.dev.parent = &pdev->dev;
@@ -397,26 +393,22 @@ static int em_i2c_probe(struct platform_device *pdev)
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto err_clk;
+		return ret;
 	priv->irq = ret;
 	ret = devm_request_irq(&pdev->dev, priv->irq, em_i2c_irq_handler, 0,
 				"em_i2c", priv);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	ret = i2c_add_adapter(&priv->adap);
 
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	dev_info(&pdev->dev, "Added i2c controller %d, irq %d\n", priv->adap.nr,
 		 priv->irq);
 
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(priv->sclk);
-	return ret;
 }
 
 static void em_i2c_remove(struct platform_device *dev)
@@ -424,7 +416,6 @@ static void em_i2c_remove(struct platform_device *dev)
 	struct em_i2c_device *priv = platform_get_drvdata(dev);
 
 	i2c_del_adapter(&priv->adap);
-	clk_disable_unprepare(priv->sclk);
 }
 
 static const struct of_device_id em_i2c_ids[] = {
-- 
2.39.0


