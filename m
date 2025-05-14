Return-Path: <linux-i2c+bounces-10984-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F7BAB6B58
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 14:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D6E34A8571
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 12:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA602777ED;
	Wed, 14 May 2025 12:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="sCPrQkUc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2072.outbound.protection.outlook.com [40.107.247.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C20276033;
	Wed, 14 May 2025 12:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747225359; cv=fail; b=rWHkSXavrRswG5yHQKpARdtguxVFJZUo3V+5Dl5cQ6T1qyT1tH2ycJ8Tg2R0qW/fZUx2hemeNepa053uNtRLiRNco00cFfmql8gkKmTbk3szphXkKWV4FS14g31lnmVtXfC/STdBKBCCJw5TP3JWjf8F++N4t3bbA9S6SCDnuBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747225359; c=relaxed/simple;
	bh=2TvzqW9N3+cKSnMQK7F3e7V9kyyZtH3QvEgFz+4Qk6E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pv6wWlkapVHEsZP08VX+qHGMW3mnLTrWpn0socbZiSheKpPiMBHil1J2rd7AYE9pxVGjP3KzkSY1pvkSCnsppaJkaAqjb8QqPPgX1drZie2fDJM2WEMuZGuxgh/gXrB/8sf+HKH7PkShVJ3oa42KuhoirZ5EJRfyZB9MIZLy2IE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=sCPrQkUc; arc=fail smtp.client-ip=40.107.247.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lxkd00Nvj8rlbfG3iTwPvfST6TZbIsvSf7bsD5JQC0Aw23VT9cJi/+NvO3rEiPwtmSdc5mzWKMwgjFl78k6kT76iOYg7lGkgduyL4aqg0C9J1xSQPARa5UcC96xlx0TSQVfAoplFSUZNPR/BwPAxzguuAbYLkRn+PgHVjipubB69mpMOzpi51liOnHIeeS7ne6hUUQ0W4095efFzq9hazGxucizQKlYkk8dFQxBvPz2aSePFvVkNKvRIIigR+HLCER/1C9DocWOAEJg7i1QhdGgHVS0IotkTDWZqNq+dGj8RlgT5omJWiHpKsuzwlxlCaD9R3kwbHYb/wUrBaHC9wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9KaK2j/jizZifQ71DI0SgeL8R/zpeKvPtev5DfBiO4=;
 b=aWsbr6LUfF8nNNk3cu7kkRM0PMtdT9H4fGwIWDPemvV0kHViolrX4yZRyYvQmFJ+P03jS9Mer+ExPKx+QZ0Z1zFXp6DmxRex8AwmUAytg4NhYtQ8SKxYFQZ/OCH1JcvHso649YM3/1hL1y4BLuanXptXUQ8aVg9b4HUcVkbpuZtA2tcy2oapUSQkCDjlmRAADzhL8x7Wd4ooN6Vl+5yIScL5AvmbSD5K4hijj7xN1Jp5IzpEveHUfxh3y2BfiersXnJWWrk5KglrRshbnlbt0JYbBpCYMtoAa9DJLNx8KnWHqtIczm05Rh8oJUSiwAVoD/yCXKri7hhj2Ep/y4Kfpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9KaK2j/jizZifQ71DI0SgeL8R/zpeKvPtev5DfBiO4=;
 b=sCPrQkUc8KZwabA/ScDI+n0Jh2TZy3DDhAHIoHO5MPNOzgMGy4O/n3JAVRjuzPNeVtT5+Po8jUDwO8Kmv2XdHQUiO2iyykfpeYU2UhREKKwmXvb2JxJ6GLJ3dgYvFeIxqWy7Ni2iEiB8GlK7ZFsnyTmXqZxU2jQBas42d6Shzj++aIpE77v7gDkfv7v5R0jN/E1k2tcS60XAXdnbmiG2uG3aWsGPd47ryjNw50+yBRvVp5tdAKXD+oWDcXMeTgKN4WCSHtGiQRTjf1WGV4WJEsC0x/GSVOyS3301Xct5AWMzHIv1nAhTtG9J6HDI6/BkLLf0DoNwIcj/YYLk2BipTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM0PR0702MB3794.eurprd07.prod.outlook.com
 (2603:10a6:208:19::23) by DU0PR07MB9140.eurprd07.prod.outlook.com
 (2603:10a6:10:404::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 12:22:34 +0000
Received: from AM0PR0702MB3794.eurprd07.prod.outlook.com
 ([fe80::aea5:bbb4:c75:9faa]) by AM0PR0702MB3794.eurprd07.prod.outlook.com
 ([fe80::aea5:bbb4:c75:9faa%2]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 12:22:34 +0000
From: Wojciech Siudy <wojciech.siudy@nokia.com>
To: linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	mariusz.madej@nokia.com,
	Wojciech Siudy <wojciech.siudy@nokia.com>
Subject: [PATCH v6 1/2] i2c: muxes: pca954x: Use reset controller only
Date: Wed, 14 May 2025 14:22:25 +0200
Message-Id: <20250514122226.3267855-2-wojciech.siudy@nokia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514122226.3267855-1-wojciech.siudy@nokia.com>
References: <20250514122226.3267855-1-wojciech.siudy@nokia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::23) To AM0PR0702MB3794.eurprd07.prod.outlook.com
 (2603:10a6:208:19::23)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0702MB3794:EE_|DU0PR07MB9140:EE_
X-MS-Office365-Filtering-Correlation-Id: f7400ac1-218b-40c6-5ebf-08dd92e2017d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bCQubRvfUC9x4ODOrRvFbb4v7O+7FxCiaZAW8J2B0OgF/SV1PG/6hs3nCFN1?=
 =?us-ascii?Q?SYfpLDaK1lBMkAjVVUP6V2q+Gssx0LOBAQFikzuq+08h5P9dEILkIZfburVA?=
 =?us-ascii?Q?iNOujllzSVEAKqTselWNZOIk4HHHS47av5Xtyq4uOED1FjLuwnvwrqpCIxaw?=
 =?us-ascii?Q?djlJ8qSmgMynwF+GNoDj9Dlwqy0NjJsAIVSp2OmgeaMvJw4ALkbfaEv4rO78?=
 =?us-ascii?Q?k878jsjsW/dnOUsZWHtZYJi2PNnAyav/UT2A6HJ3bkPuJ+CNFNMElCx63KyR?=
 =?us-ascii?Q?bgd1jakCE5utm2QqBYdid6CVWg6+0bZ3tNvOJQlW0IjT2pZkB941OYSl61JH?=
 =?us-ascii?Q?YUABUUyo4dxSJ1oWcPQNHMgvZnhaANrO1zmUpig8bivQqyHs08ekLJCNZnof?=
 =?us-ascii?Q?9z/+LD62NvNAJcT2kGu99MrWBcfCQc1b7iIgZQUoNv3FLHcUnlk+yp3HNK9A?=
 =?us-ascii?Q?KUVBRpBngQ50Y0O+V8t2rpk+0P1DyGDlcKW8/KyD4NXE2Pgd71N1hzbGXb9U?=
 =?us-ascii?Q?kFaYk9dRMMJgaZ+cAkeAbOspeVfj/dYNQp6cZ9gnd6YcpYyDemPhd8gQhVTP?=
 =?us-ascii?Q?o+Lh7eB/9B2Ny/V8MgA8iub7+RZQNMkwwKJonj1ZRI85B/F/8B3l86tuIrlg?=
 =?us-ascii?Q?+UsBy3vc7s6JIpRnuKtJSKlxoxHU82B3fG30QJ/KYPKSP6yQJjh0bZyCzv36?=
 =?us-ascii?Q?c2Xeuz4ajycSEphGJOiBrhQwMKnUkJoE2oikAfLmfoBT7ARbi/W/97bCK43Q?=
 =?us-ascii?Q?wqqaE2ZY3M0FaB3X1NW5cfN2EGMDbzojZLdmZ6WTiK6nvetEXU2bcmZTogwf?=
 =?us-ascii?Q?gUxQAETl9SPdjLog2D8KE7TUEtbtB9aBFpinr1H8Sgiob+dGLl8fZsCKd1y+?=
 =?us-ascii?Q?XDlqdW55eDNUgn16dW1Tn8S6iudV6754Qy938RT9Bo27mqTizjM2LfPdddO+?=
 =?us-ascii?Q?U85LtXyFOmd9nCpZ0yCBilnerbrp6gBE0HsaqGG1JuGmZ88/wQBhPqRaQAKr?=
 =?us-ascii?Q?0Nx6XZVPSg0dcQqjvWWvXcN+JYlfpKJmIcTy9Cg+W4b9aOFfcR30/JHCiGhq?=
 =?us-ascii?Q?KNifA4XNDexbSy94cMxeGofQPqN96EKP6XnnORdKaDevKoR+jfZWBbsrJtQV?=
 =?us-ascii?Q?xp+HoMYyAnfbOT6VwNndPYSn/bZzyQUX4QB/VBp8qX4jUL76XEPF+yGCFT3m?=
 =?us-ascii?Q?kRgbTvN4sQM+DjjU+XfU89jrbPBflx0Hut4DlQvQezEmvkxVZKaVRaTLSYwt?=
 =?us-ascii?Q?TVfd3GyR9/mpAXKEE4f9DH933sQz0AoPAkebX6wbbPATQid3KUEq9ZqTsArO?=
 =?us-ascii?Q?5e5sa9v/g7cYrtpD/56JIr+6aMCs6HRE5F9G1sL9ngTmzB/HBwKRxHHO69U4?=
 =?us-ascii?Q?nAYDTw8PNvyJ0CI8uewnMyTgwSmY7n2fb9X+TGg1cJgNuKnPkp+d7SfPn9OW?=
 =?us-ascii?Q?qmOnxIYsqGY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0702MB3794.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pUqd+L9C3M7U4HKEIJGA4bbiFvaMskmyizLrB00V6pz9Qh3dkXuhLWlsgq9C?=
 =?us-ascii?Q?KW+SC2KGi7fbyOUAK3PgcBL0SsUlg1wV/xUtdYZ0geQgBZjnp7mUYi/Nzp8X?=
 =?us-ascii?Q?CyVe4FSUGNah1UFYENE3VIS5yrMY7u9IABQQcz7o02vGrUupEU65lFv5zP8b?=
 =?us-ascii?Q?d0YmyEeExUHff80VGWfxZFHSuTY+Er1WzsOEirKH4A5UkvUbynY0WBsWfJfk?=
 =?us-ascii?Q?6/1NIdSRt20BOsbVtWF8oCegXsTIdllcZTyxxm9Ios6PHK1kh6pFJztD+Tmm?=
 =?us-ascii?Q?laiL7nOAJ1kogcvXLnm3NPwGJ6dc+wZvQFB7qSMigXe5msOcLKyzVpxBUG4I?=
 =?us-ascii?Q?CI1RjSFhs+x6z5viiYgISjmye29bK8xewP7fM+Czi7h0Wj2o3f7MSXGSv2uE?=
 =?us-ascii?Q?xUl3ASaf8CxYrDgV/YIshsrzjx7fehjsJHPixWVk8kpFULkfvqPjPnQPaRcK?=
 =?us-ascii?Q?1E9F+XDIWB1SUBf26b4P2MVVOi+aCmk3cPMfA3bGs++OifSNgbXSw1sUDfaa?=
 =?us-ascii?Q?gBqeQgKMUboWL2asCw6oLrIu/+3WUtWA6JYKuLTCVDcMYVglRRqcfTapuiq5?=
 =?us-ascii?Q?Gnb9bakkOIZfhBqkbNoPS9kB09kP/CpaJbuQ7ZF0r5VtUn5Fw7f0g5dV4V69?=
 =?us-ascii?Q?/Ay67ReTIZPgRm3N8G1LcHUyDjnVdmFqz47p0rIeXe+sBDRWvTo8yZAtFoLG?=
 =?us-ascii?Q?05xj2tiVrIClFPXVvxXbieYPJY98Dzl1eyqSH4DOQost5pG9YCisDaVH35iN?=
 =?us-ascii?Q?+jBimc6m18wHMv6xZ2i2OPOqBg9ZGW4njarybUPrROLkcGSYB6dBKMn4ezjp?=
 =?us-ascii?Q?dZOtm3HeThOs26OtnRKdmDV9sU+NJ7g9lBgmnxBKPxiDsfenfcBdd3xRRs6/?=
 =?us-ascii?Q?0d0JO43mo2ZcS5AigndW2M+6l+ks07cMoCL7+zkrwsNS5n1IwmxziVgqnT6L?=
 =?us-ascii?Q?1QGuHuBC1V0Jdg5VQUIk8+Si6ZS0b0xukflkFKVD/NuVZXFwZ0AI6OP0LIx3?=
 =?us-ascii?Q?9pRF5XMSPp4ajZrzjEWYJheszbyooWUXvzRkTkjfsmJ1Qou58DExD/2l+JiT?=
 =?us-ascii?Q?dxMBCHSE2f1HkduP2byKfkJMwVp9K2WamIeYAaFBkdTdULtbHAnuf6yP8auL?=
 =?us-ascii?Q?vioNEU0nB1Vw44Hd5kBSwYlPyDoaxI4stk1SGorbUt/UIMTMck0CpnaW8xpg?=
 =?us-ascii?Q?7beBddNDATICu1eVg6b3zgr236FoFUtKH2RGxsKQlHgIuhUVYFrd5WTrFaBb?=
 =?us-ascii?Q?ZNfx56mpyDz4Nu89HYYnmAah1nlJEubYUuDTsmTapbbg6cG3UJpipjAE2V7g?=
 =?us-ascii?Q?+Uu9MDkpYJ4cJdNfmwWjbgyuTphZN9Ji1DoiQBP4x/utKtMnh5ViAswZZXL5?=
 =?us-ascii?Q?jNTG2ACWMA/QDGnQW8Z5rnHuH/BhzmNt8KUm3Bx4UBBegwbJzMH3EhJDb/uP?=
 =?us-ascii?Q?g/tQhxn3BjTUSpXTQny1zgWuspwmZi5b/VcSJNYRqfVNzicTQp8+xNl2Avg3?=
 =?us-ascii?Q?Rnd3JmKwXE0Xws5jmb5kf3NLKRrsVOPAtjDuI13IodP2buViNslC8mhOVqRp?=
 =?us-ascii?Q?BzIGHNvrRrNzZLNDu7h39tu0A0AxHovFSkRLgzwgZCcYsfKVcIiuIkqqtzGH?=
 =?us-ascii?Q?Xw=3D=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7400ac1-218b-40c6-5ebf-08dd92e2017d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0702MB3794.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 12:22:34.2776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgMx8ufz6AMXMPpl0IqNxlBPu+gcBdDDZ3XIvNxfVQz15w/3QmIje6oLTPIHVg5VuxMSztusCAlA9/XutWnPWqvb7mXgBBvFaYIyhNqIumY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB9140

Fallback to legacy reset-gpios is no more needed, because the framework
can use reset-gpios properity now as well.

Signed-off-by: Wojciech Siudy <wojciech.siudy@nokia.com>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index db95113a5b49..e09230df7059 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -118,7 +118,6 @@ struct pca954x {
 	raw_spinlock_t lock;
 	struct regulator *supply;
 
-	struct gpio_desc *reset_gpio;
 	struct reset_control *reset_cont;
 };
 
@@ -528,17 +527,6 @@ static int pca954x_get_reset(struct device *dev, struct pca954x *data)
 	if (IS_ERR(data->reset_cont))
 		return dev_err_probe(dev, PTR_ERR(data->reset_cont),
 				     "Failed to get reset\n");
-	else if (data->reset_cont)
-		return 0;
-
-	/*
-	 * fallback to legacy reset-gpios
-	 */
-	data->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(data->reset_gpio)) {
-		return dev_err_probe(dev, PTR_ERR(data->reset_gpio),
-					"Failed to get reset gpio");
-	}
 
 	return 0;
 }
@@ -547,8 +535,6 @@ static void pca954x_reset_deassert(struct pca954x *data)
 {
 	if (data->reset_cont)
 		reset_control_deassert(data->reset_cont);
-	else
-		gpiod_set_value_cansleep(data->reset_gpio, 0);
 }
 
 /*
@@ -590,7 +576,7 @@ static int pca954x_probe(struct i2c_client *client)
 	if (ret)
 		goto fail_cleanup;
 
-	if (data->reset_cont || data->reset_gpio) {
+	if (data->reset_cont) {
 		udelay(1);
 		pca954x_reset_deassert(data);
 		/* Give the chip some time to recover. */
-- 
2.34.1


