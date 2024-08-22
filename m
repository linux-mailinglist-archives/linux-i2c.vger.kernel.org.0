Return-Path: <linux-i2c+bounces-5676-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C46E495B7F2
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 16:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E39BE1C240FB
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E3A1CBEAC;
	Thu, 22 Aug 2024 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Qdz7HYXC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2076.outbound.protection.outlook.com [40.107.255.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C2C1CBE93;
	Thu, 22 Aug 2024 14:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724335570; cv=fail; b=DbZ/4qbu8CHGiLRYo7eJ+9K2eSl6n+5TpGJdrLsRzVpwEV6O4CZ8zrAYLj5/fywttK4KFzf9PdjXz/YZxYQzC1zSCfaC+9K2z1dXc8ZBwPHqAbYlAWDUksq9CZRSp92iZfiNXakyiLXKE6hTDa1weY4kS6UMuoDWB8hkvwr1Gig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724335570; c=relaxed/simple;
	bh=o81UGAtjWDlRk/lA4vWJRhoCIW+NdC52Xa5p9KaV0r8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SA7HZkma4OJ9xSWyA3JqmR8OWVoH4w2MwjaHGyCTWsBwTZZGQYD/tQ01g9EVjr//4ImsmXzrDU4lTlYzUoxij+xeYYLGLdL5woGkR/Ngvkje1Nz2NzIvpoJf5eyw+HXvoMPvMFOSKmcEAxEdaJD0VLzhJbo68DGgNrKh6iX7qJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Qdz7HYXC; arc=fail smtp.client-ip=40.107.255.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0DgNwcgKAnRiRE2YJEGu8piqQthF5Zthwq5Elf3BAMyI6IdvXvinE4kLR9qmP8odcJ8xD9yD6yQDG5Z71jUHmGs/VMojhC19JU0PMT61NyTQG+nPQOrOk81hQECR4q7LWTiyLG077NmiG0HlAOTUl2anbZwP4H9pv2RYK4l6sdejCXkY9xEwDGtmdLRxp67gm3y0GmibyvUIq0PXumH/FB7XrkhhFjA6NAF8f7OF8plKU2faxkogd248ViRodAGnk+ffu3tO5+YJ8BZ6llKXXG4jqAeOAcKeeQGaYAsOyl8X+DfOGmdhcT696r+BWAYf/ahUq9/YIouqcN8vGVD9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+K4GFLAYa7hscPFFxUTLQlNVnCSpxclHSjUbJWB970=;
 b=Oc4uEoCZgUwdUjQCWokBgOVALyHk0A0MsOMILbHaaQByb8HOJ378fWgIRiMmQ81tNSawXwRnk/4FJIzGo8S3dhjgZMNXP5pLeoDpjemmwejJ6w6bAVr6FYvm/bCV02gjckpqkbmnJY6l9GX2xLFIO3aKIhYxdyRNLPkHlpwfd88B4uGIlZjWZC20gTKLyVIEeBiSLC8EPI1et2RMTG9j7i4+Em+8sI06TT6x9pKcuRw3SUPyClEMeIViooOLfxRBy4YgEnWa8yRPf9Xs1YsUOTWqHQXLX19X0VH5SBUtjlMLEHzU059FkWyCV/FOLlK9sgHC1FCXQcoGTxiRJ6pmgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+K4GFLAYa7hscPFFxUTLQlNVnCSpxclHSjUbJWB970=;
 b=Qdz7HYXC14JLnoEtw86T3bJhhgbYy/QzWhqk81FOQI5uMoxvPCVZcPD060djeLLS8FX2vzugLDzUpl+2GuOy5Je0/liUpeYGGF6zwdD95jZ6+Y1wQ5Ebj8tEkFDvLwDnNjCmq4AQ72EDKgTKF2zlxdwK7/DskoYicnbEIXiJULbK5jJF2iOdV1oWlt7XrJa5jXD/scoV+9nPszvDTAPK3wm97Q5VLSVQzl9UsTBUpIznkH2NtHfRNuqgfaMQ2vzPSOSkE0tzi5bN2bsgISchNV8qEDqO8WtfHa1AEPZbhsXcz6WAic1iGooozLeJ3RyEONmfvJMoMCYvxW8SE0Fktw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEYPR06MB5301.apcprd06.prod.outlook.com (2603:1096:101:82::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.19; Thu, 22 Aug 2024 14:06:06 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 14:06:06 +0000
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
Subject: [PATCH v2 2/3] i2c: emev2: Drop sclk from struct em_i2c_device
Date: Thu, 22 Aug 2024 22:04:11 +0800
Message-Id: <20240822140413.65369-3-rongqianfeng@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8d65d099-e50b-4e3e-dbc1-08dcc2b3906c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S691c6zuIrLLh0SM17WtnDSuS93KyDhiftU28qGiW4vOIYzcC1gM64ACp4px?=
 =?us-ascii?Q?3L8WvVcrhWeXWoBd9s24LpLKPgV5s/mrLBqhefH9B2MVEPoQNQ3QB9CkQiNi?=
 =?us-ascii?Q?HJT3tJip5OLTeQzxO2dJWfhYMq0JsWcsGYzwx/yZFKuiUxa1356fQ3DJ1hGO?=
 =?us-ascii?Q?HzQWntHdpGTfrSnT1MK9jitxl1sbVAeIwAeGNH9+c9MRvIoIxvEDWEJUowQG?=
 =?us-ascii?Q?LZ7CWL00BHyxJf0CrpUoO2xSUs5zvHDk1WBeLaRIY8N3YOuwhqTzmqtxK0Q+?=
 =?us-ascii?Q?K+MZCzywVcsPyf+ESCcX17qi/K7BnSWYZ7weCNw3d4HFvMjPPAD0SD1QEGX9?=
 =?us-ascii?Q?O1mNnQTLPnAdZgKeAUXdxS/ErBUKFaJ9GuC0trt5zZpjsHvZ0gB3lnDaFzpz?=
 =?us-ascii?Q?di0qWO9nagFMhdH+QhXBX979liU+4iKimteQg5vynF2SLy6nfvxeS2AD7X9L?=
 =?us-ascii?Q?wuCvkrpFjSN7DJvaxDFOgE2/WHn9U7w2S9uH0gNIX3NPrGeA6lfLyIyP4oS2?=
 =?us-ascii?Q?XqVkA9iqi7sOcnTrIFcBp2pO2lRJA33lJ8Yy+7HVuEihD7Utw4K3Xb52deHE?=
 =?us-ascii?Q?7pv+Pq0FYz0dIJ/cPa/D+y+9tTYPue/AnIEjeyFasjjqGTc8QTonM+B07zYb?=
 =?us-ascii?Q?Q4AM74Oj0yldcGKIAvlv3k2CGN+NzR0BOlkoo7ZStFpdxE0MNISHtJOUh/wl?=
 =?us-ascii?Q?4hIRKmmR+1eOS85wZHvc5sb5hj5AbSYIxOJqpnkbj/kTiYZuHbkD9x9XW1GG?=
 =?us-ascii?Q?fsZE220yzP0iXpjFcyDUKFWyIuZ6ukeX8oNgNAALhIIs7HqFByAa3969MprK?=
 =?us-ascii?Q?gJOA1e6sIOFqDPEwAGXY58yw52TWgito727daGkxCjOSfgX59S/eTIxrWbtK?=
 =?us-ascii?Q?iZokMn99fyijsAR0lW6bG4DLAaN3RSgJE055p1cOKtYkcXGd4RNJUS5ZnclC?=
 =?us-ascii?Q?Eb8uL5fkdrn9+ciKok6cR5bsL50wbVcB7VUHsVzQTT6vaT0Di/F79bdKv+Op?=
 =?us-ascii?Q?cKyeX+mq0EzJtibcAWYmSNQB7avoQgWVpnOhtkS5F2f0i4ZV7I/QQEvs5jiO?=
 =?us-ascii?Q?qBNnqLxipTuGqanTiHbxVO0fjIY06wtT7FFWDHJSUrzDLoGSkhfc/pJgU1Rp?=
 =?us-ascii?Q?+3JkLH1TQ7iN6lppwESSfXcq79PulwrLYNLFytTGqgJG5T+ilR0fRRSw1koL?=
 =?us-ascii?Q?9KpNblnobsHMf/nX/ojxRA9fa7VU8BgRz/+KSyzzv5Eh3RYHvu3i/+s+ehja?=
 =?us-ascii?Q?CQdWCqSQe39KtIh+9EF9evqZLyksaCoeUG0c4bkkTpihLCC9k6FKW/XJR7IY?=
 =?us-ascii?Q?izkSsXB0OvMayS+fMg/HLyc45sXC336pKBZXN5SJyKg0sI55r5RcXZN2YCFS?=
 =?us-ascii?Q?h7DDD8wciPmxDj++8CyvAEzKOFPe0F5oUsQt3dxx46i05bFxhg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ISK2dd64EwZCReI4lUkgwP3xA+lHnWehRNSHJyVBsdLo1VRq/fMGtfInZc+C?=
 =?us-ascii?Q?NxqquP9N8zHk0vjRqPiceFsnEiVTz+PYHN7LQyjAEGZ2RYCNoJCdq+N/Z+1o?=
 =?us-ascii?Q?Toqeff8EZpnd/3603VNVoaTg4ipg8wZYn4MpGYuZeMT8i52qjK1vQCXll3Ye?=
 =?us-ascii?Q?3rnb0tkiWaebcYbVC5NghlLJsSr3cEnAPXFdW91paw+WmAsHke+e9O7CyMRa?=
 =?us-ascii?Q?+lIaL1vXGM+UvVd0YiaDo4QuPxAX7U6WJMzlR+4bmEYiyW0jQUYBvXkZLv86?=
 =?us-ascii?Q?w6Mm9gKJFwU1DEyz8x2NNTKKllB8NdQkVzixoZiV4ShiR1rrvsD6Bdghw80w?=
 =?us-ascii?Q?IhtcCv4jIJdHCd/rqZ889vYzPSSlJvPqGQZPHxd0kaxu7YSGXkxi6ifd5tlz?=
 =?us-ascii?Q?6OfDUz0b6s46oQmttsLmK7mY7z2SnElm3hwFjMsi1u/7ZLIkdpsqoDG7ddMr?=
 =?us-ascii?Q?ytRoP6L805ZYKs0Og4wqJp7OXlEN68CzGF5KHFGdbITAKJjT/oHprG+P8H4i?=
 =?us-ascii?Q?GkXMJ33NMdKB0IYRCUsZcafki1aMAFbo1bY69nXmCvbvm/ZPhQGKOz4Qcy/L?=
 =?us-ascii?Q?HLGOnBSWSN4BASCyE1A8sbaHyd/IU1musc7kwwA+hfRNpUwWy4uyTXCSGous?=
 =?us-ascii?Q?cxOOy3ol2HUwbI+cJBJshTFIt/+0OsbaAqFjqxa8/A8F5AhWLEJlvtjHtc/X?=
 =?us-ascii?Q?myTkMOK7YsiGseFygIqfPvBz72gHKzGBVsUoVZWIJDWCJzEk7TPWLDw4yF/K?=
 =?us-ascii?Q?p52hLiezPZBivg7pQznrffZsQBhS+SiJy8fVyT7i3ansr1jahXYUWbRUmlqv?=
 =?us-ascii?Q?223JghR4H+uWp6CW/vHwZfJTSLfh6RJhiHtusHn/5fxeX6svx8K5LOTHTR/b?=
 =?us-ascii?Q?wjfq4vTBqGsUYsF1sehJ9dug5e8PBKqAqtdvGb6ZeZYW7O2Udtllm/6oGZ+8?=
 =?us-ascii?Q?a9kefMZlZHTS7RphRSQxQp5c3hCrSsIcph+2SO2R8kiINmKPYF0p3gZgu/55?=
 =?us-ascii?Q?QHVQ0ewNLjbZTHFy0nO1gI7iKWDWiFzs3xbvIuXBlR3LhhkLg6pMk83I9+Tk?=
 =?us-ascii?Q?M5gToUWGzoyJSr4SeaxPl8PQTsH8zOvdxBj2jq75VYsvPQS6GSeyxcb2N0/l?=
 =?us-ascii?Q?xGVkR254zdYnuMRT5OSFI24dtg6MOT9RaihfFGDm2lpIKW+tFcFZI/JFmGCU?=
 =?us-ascii?Q?QcP75ewuVR+Px7vVpbiNlhXrJwoB8e0ya5H7LB1uCeLkyKDQGSAOMBh7+AKw?=
 =?us-ascii?Q?qkBDQlShsdLuP2aU9uDVuwM0edllP34tEprT0mCPHpoyLkjyabZ5kIi9hL2X?=
 =?us-ascii?Q?Xk7eaYeiOuthB0PmyN7hreq3HKXlPUBDjpeXmt6TVmAsPAhkzGVtxn4tcXtz?=
 =?us-ascii?Q?kbcQmDf6RDhCtnXPtIeztu8L/eBxjvOUJttHbx+DEN7vmFWINV+2lgdpu44+?=
 =?us-ascii?Q?5dd8gQtRiaWNArkAoNOQRtph5Q8kG0G01yMRY7QcyEyhNZ8xt7NxyMo7h/Ag?=
 =?us-ascii?Q?clf1bV3W+Hb3zoWR16WNW3ciG/07hHR61QFRuhUPKAczVxM58w4wwtvIAQJ2?=
 =?us-ascii?Q?A52kXM1qzQg+AkWj6WLg+CAH3BrUjhO1+gop2C7C?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d65d099-e50b-4e3e-dbc1-08dcc2b3906c
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 14:06:06.1852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8OjlsEbqyJbw1rt8HRl+E9wo9b4vM3Lg+vuY2rPqNnLHhiMIPtYaxcAJw7iVpi/xsNIFoiYzWIvgxYy+Hp6jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5301

For no need to save clk pointer, drop sclk from struct em_i2c_device.

Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
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


