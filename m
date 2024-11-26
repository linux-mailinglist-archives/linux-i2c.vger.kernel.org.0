Return-Path: <linux-i2c+bounces-8220-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF51E9D932B
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 09:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05B56165E04
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 08:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDAB6199E92;
	Tue, 26 Nov 2024 08:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nyHeOYCW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2076.outbound.protection.outlook.com [40.107.104.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C933B13CF82;
	Tue, 26 Nov 2024 08:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732609019; cv=fail; b=gMW9VgkXeITdRJhAU8/E5CNNt7ygg9344e6Vk5sV3K8JLg1zYDd+1MSJHY/UC30gexfYqEykOWUWC9qmbau92NDHY0VxCJcuxyGIaAhTezQqx6TcZt+e1tXeEzdEkZ0o9gIJbu01TFjWW2LIV3lr6vy+idxbdFeizBc79zjVL10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732609019; c=relaxed/simple;
	bh=79ZgT+Dot3UlYcfkDvSFGmmRSyPC7YuYQqPMGIrw+lU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=STUSgYnK6Had2f40qMHp3S69bzNh010XC8O0dE2xuQigA/nIO7om85WRXcKKsn0YHj4pd7gN1KYrjsn0Ia1STCX+wlPWw1OK9P4bFn1b+01O13Q3feRlCIT8RhblidevVCn4xpyuXSkKSky8yyK0XNwz0Qq9kru2bg9u35FV+PY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nyHeOYCW; arc=fail smtp.client-ip=40.107.104.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFvmmh/HLZkx80tJWb15oma2g+NpcjKFWxI75ibpUCAewCn8pneRe1MWz/wphTKpBiiQgsAffGmp9FIo8HcLxBRNiHUaktLlw6HVoBmSuni+fc+68Rjc2Xn2jPqhkuMFuOknwcekO9+zn4IOF1EZo9u9sXeNXxEf4R1AtZ/4bSJvmxDbUf+szZZ5gFLpUjfGg3X3dgTOsDAx2Xt5WY/V3t62LvjBKsvR8CEoT0u/2CEN7TLEx/qAcreC1gSuj+jDceWxxTxCQkJCWStB5fzovv2fyup16NO2JrEcTmYumoZo8POVcoFlPGinUCYFX6+jxlgSv/z7F1TNNZjabLm3Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcOzQnTn7AAWZdy9i9PoNrBjrynS61XCC3rBCG69hFs=;
 b=D+ipF+qj5aDw7yhFBvzGpzXbJsJIq1lAJVEz9jeG2avw1WgOnFIXWDPNH9/F4VpnuBnw2ipS+Eh/BFkRUrKdIlehyCPR76j1/+QcM8FT/5myJ61wa9m8VY/V8CU2Zdjk0+GdoM+LHjAWNZljhTVQjCMKNMNkcHMsSHeUdoctSvoZP4+YYVOsXapSPblHFSgqW7CEQy1/H1xMpkUWg/cgrRJSxpnA2jN4/ewGASu3qWhGXh7eHpE4vskiMCOYoGRdaQzKarXmUt5kbJxhRbTmCS4jxkHEUnV02yTQeByePoovQM7XyyG77pzvqdaq4C97JySTVaNQruYzAORJvPHTBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcOzQnTn7AAWZdy9i9PoNrBjrynS61XCC3rBCG69hFs=;
 b=nyHeOYCWrmHxamvgtsWbCuSIfPKtVJRg6dgBP/pmyaK+SU2Eq/EAKve3sv1J65hAOzrY9Ty2OseXrmsDWM48jbSHUBsFI7GYyyYh4vRi0P+yWIg33vDPjZanQOQMhRbmLZYFBbqS34JaMJcRB5B0o0DJwQw7mC7MHVLRR73edJ4PDxfNgLDKf9K7/u2tm6feBnoYR83+h/gsE3EjK8UOt4+shvh3BNcCyw7cPRCcA7hNGaVQWMpJweMSjwyOMgqH6LQ0tcanivUyGLiQ+jxRhKTOq6WxqPSk0o+Rgv/yiYMp7SXiZP8DatM0IU53Tb++SQNGQRkh0UD9x6Ii5A/Ufg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by PAXPR04MB8286.eurprd04.prod.outlook.com (2603:10a6:102:1cd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 08:16:54 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Tue, 26 Nov 2024
 08:16:54 +0000
From: carlos.song@nxp.com
To: frank.li@nxp.com,
	o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: imx: support DMA defer probing
Date: Tue, 26 Nov 2024 16:25:35 +0800
Message-Id: <20241126082535.1878554-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0240.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::9) To AM0PR0402MB3937.eurprd04.prod.outlook.com
 (2603:10a6:208:5::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|PAXPR04MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: f67392e6-bd7d-4e33-9d2e-08dd0df2af9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0Rd2uWsO8TiC2egotNpRzqBmKbKalVfRMMqn4dKMZaNMun7a5XJ/j+dBrMJ+?=
 =?us-ascii?Q?O0JE8s4F++gSuYdWmPyjSnVlP9aUaaCYYS7M2yZcDrkDBn41aSRyvZNaGnno?=
 =?us-ascii?Q?DH8sUwRf9qg1dqSzTagi4rSVgIoDuHmARL+gVo8/dBvBvLJNraz7qKRy5/n9?=
 =?us-ascii?Q?r4PD2txomACQHEYFf5JcsxZW7FKGGgW2s+OwbasvHI3RqzKfm70XN+34aM/U?=
 =?us-ascii?Q?2b+YxtZWoI88cyPd8m0kl5e6DG2tAgT3BLpHQW+puOtIx2NX3CIg3IzHMD0k?=
 =?us-ascii?Q?zgX7wg/ZjaDKaqymHdvZFL6dajPsWDqtMrEUagCN+mCi9l9fUvl/285i0RZ4?=
 =?us-ascii?Q?LM1GhYjrzvoU8QdnuxgJxCck4C7HtZfwkMPRn09C1/MaQBz4Q8c2Wf6sM9Af?=
 =?us-ascii?Q?cfpOB4Or6XfleaL/Fblkkayp7rJVevLo5nMpRUU0w5mXGyuowY+Nc7/XjQnp?=
 =?us-ascii?Q?6Tk+gTvzuQSa8t9r/uyzjGAYF2UjmjGcxX8EmQLMJXKEprQ/JElB4vjFu5ge?=
 =?us-ascii?Q?y7didnC11CVBLaFkLO4U52ayfrVh2y5+iqKKXyyqN8NV4KFiHh9FiscOP+dK?=
 =?us-ascii?Q?VHj4gabb6kVo80HysLc6Zhq1jS4cbpweyIoOgCRXwbU+f3Y1RYG3w52gM1eh?=
 =?us-ascii?Q?faS2JMdOrJTKgXKCPp5Rjo+D8ynCUyIMz3hAmH8Q+rUmbyLcTKfw0to0kw3e?=
 =?us-ascii?Q?bEaL9IsIhviEO/Y95L+bwpI9t8DsSQ/i9+3jBv+Im7exoQvc8OpUSnoHB7NJ?=
 =?us-ascii?Q?Xw6SGwP4pAB1jigTQErwQut4+ZW+xSCpasI8Tlv1ftzAzCxMmiyBxlemjEMJ?=
 =?us-ascii?Q?tRvprF07f7iMt2jsnRMAARgQDRzCutWZLTLRb0gnlCoCB4YuKC7jzk3ZO8T/?=
 =?us-ascii?Q?vSqjffQ6fC0RDL0PuupYTC2RCrVvEfTB2r+bxgUdqyzzMfl/82C933JKOYvj?=
 =?us-ascii?Q?KVVqFBphc0W3ZEYbHLeeV09nYNQslvsvu+46Y5OyPrtjWGFmbRaQ9iWJTBnq?=
 =?us-ascii?Q?JWzTnKG7dTbCG5bmZ1LMZ8G6r4OduK0OHGjZKNlFB0dQRqgIma+wvNtBe6pu?=
 =?us-ascii?Q?2LqqtgWQ7kx7T88djN+JDqHoJY6vY7ZFaIJKFjMBUdT85nwtZ/DKxns+4oeR?=
 =?us-ascii?Q?R/uKSI5nP0VxoNo8+dEPi/mDjNDOfssk8caBOX8qKhYy5aahbuk39YWGE1nL?=
 =?us-ascii?Q?4gmOB5enGj1FXS0/26289d+uNAIMAdIF8S9p04J70F0U00oMJNCzLwidgrUu?=
 =?us-ascii?Q?ZHYBnAtM8/IT9dYigwo667qXSqUsSzJ4Kao0mhRMcEfWlv4diJ0fqQ/JsxCw?=
 =?us-ascii?Q?hVz1hDQHtglYEkMkpd9pSKqP8h3KpeAE2/zrgRKWrBv0VQTW9SYpB+bGMJvj?=
 =?us-ascii?Q?WubzH/JIxZWTfUbuHdkJwC/8cJkx9ntrX6aWQAn958ECnuVrIg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EEzm323IYslL6sNsNcuQf0bd2JE7UPW1Q2Oo92JsxAYRvj2zbgthT2RG/yuu?=
 =?us-ascii?Q?HQqgClCtXt3YWTxepWaluQ3mf6JEkoxi30gSVz68yun+IueEdHhE8DPx8MUm?=
 =?us-ascii?Q?04Xodrf3thltwCTV/kF0C+YMBSEY+MUgPvG+JGvpqfSrGnFdZ+bV3bjxkzZ3?=
 =?us-ascii?Q?Qwo6EiLarkGpEAk6z2heFvL7qpgFk56ZExZuf61e7Z/ozNb0D/j//rdk/Vr6?=
 =?us-ascii?Q?+j/1mCwM0lrWX7aAwsqFV0A6SQsDTV2GpUzLVRjWDCFw44XgO0L2aZoV5a1A?=
 =?us-ascii?Q?aV+0xrsZMhhOR7beN3BXAkMKWCaNx0e4fz727T5y3D2LDyEwgWWG012hNB9f?=
 =?us-ascii?Q?OmdYuQB8SkpUYZfTBswIkyecr/EOQA0sGafYvfsk3RyBBL3SWjZStsS3+QCr?=
 =?us-ascii?Q?XC+Gnp90LRzQrmOetsirLCyeMg2uluZycTvKWDg1aLnOKYuqW8ryWv/hwyFY?=
 =?us-ascii?Q?JNlSOC9/sljfK4Adu8FSbpKeDAvl5l4oCeiOgxyB2h17Y+Of2N0mBao7+7mW?=
 =?us-ascii?Q?QxRBeunqbJ2XoFeXypJf0yR6Tt6C3gY3qEEFogje9Y2fcH2ElMuiFZDrshRk?=
 =?us-ascii?Q?AL/o5iQAUb1nFCfdo1l8jNKSbvLTiwuRryqKWaV0uDxuRTIupG3yfVCIykzy?=
 =?us-ascii?Q?6hZwZZGajd5d/FAgAXVQETZlh7JNmtJU42cjqC/DekcNn5YbI5DWeMFEoThJ?=
 =?us-ascii?Q?yvCdrdV6FTWv+C8K2D2FqxXdoiMX81FOuOhGLEEYmbBHRdeSJzIS7L/9Yc3w?=
 =?us-ascii?Q?XJgDqVkXapVUeP88SIekUBzGxy3WOeA1zudO9IlwHIy20zra8HQEoVJJ/btY?=
 =?us-ascii?Q?orsps9qVeMha7ya+GW9tHgUYqY/CBZAZqoEVNCaemundvwVao66CBXf8bBug?=
 =?us-ascii?Q?pr1K/iJ9Y+P0gQdZ2xm9ABsuClSLNgkIioPlklwmPM955LNgd/wmmwHoDJy+?=
 =?us-ascii?Q?FwKzwpINqeiJhxKlJfPDAjXylbS+MkMjU+qIOxAJUvxWi3NA0Fg1Yg0iji5f?=
 =?us-ascii?Q?ioOob2JMfjfm3OccKJDdJE1CEmihQcmCRuoIldSjziSP2tDko2sg4kuU2l3S?=
 =?us-ascii?Q?Nh9o0dKMELZi+XC0HgXtWssV5aOv9+donjIncSniTRictnKNRYLZtX4aihf3?=
 =?us-ascii?Q?sXvwEI270peVMegZ/GIa/wjZp7JICikFD4ukvCFAa/Q7a92tlECRZF0xHpZn?=
 =?us-ascii?Q?QlFiyXu2iUZ73sReh++eOirbijiOp8eMpwQpJt34YqH7Omi8lN/Wt4OjHhlA?=
 =?us-ascii?Q?r9/+xM/Tgrdach8XR5NBkJnq4CRCjtXvT6x/5kQiK53dX4LbkbFbxxroHXGL?=
 =?us-ascii?Q?0quAqtGSahJETWPlmH1B2x0Gvt797yyR0okLF5y9vVO6NJYb5FroIhG7ikrd?=
 =?us-ascii?Q?9SbqKoqAOHQAhJWWNpOrHcD4nhb1BNMtxDSeQKmQQXUuAv7G1otCgb3ZkjoF?=
 =?us-ascii?Q?O5C+weSWtEVq3l3KgJVpogGpTkDimAfiOAlc7Pd9w2BZObyeFKoWz0EjK77V?=
 =?us-ascii?Q?lTETm63p6DxUc0iUTRmPDQojyVtvyHCMOv7v6064eooIwgTZhfsFNgzilWu4?=
 =?us-ascii?Q?QUfpghoukbthGTTA7gt3AMr1p/s4I44Y845bTdQY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f67392e6-bd7d-4e33-9d2e-08dd0df2af9b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 08:16:54.0955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUC2TpvhthLcQV0WVImb67/itrlRkicfcSRkFVgk6K4nnixzEyfD8yZD/V3xl882eYb9xsyxafaTCsszDNyGRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8286

From: Carlos Song <carlos.song@nxp.com>

Return -EPROBE_DEFER when dma_request_slave_channel() because DMA driver
have not ready yet.

Move i2c_imx_dma_request() before registering I2C adapter to avoid
infinite loop of .probe() calls to the same driver, see "e8c220fac415
Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()""
and "Documentation/driver-api/driver-model/driver.rst".

Use CPU mode to avoid stuck registering i2c adapter when DMA resources
are unavailable.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
Change for V2:
- According to Frank's comments, wrap at 75 char and Simplify fix code
  at i2c_imx_dma_request().
- Use strict patch check, fix alignment warning at i2c_imx_dma_request()
---
 drivers/i2c/busses/i2c-imx.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 5ed4cb61e262..4e5633166a1e 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -397,17 +397,16 @@ static void i2c_imx_reset_regs(struct imx_i2c_struct *i2c_imx)
 }
 
 /* Functions for DMA support */
-static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
-						dma_addr_t phy_addr)
+static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx, dma_addr_t phy_addr)
 {
 	struct imx_i2c_dma *dma;
 	struct dma_slave_config dma_sconfig;
-	struct device *dev = &i2c_imx->adapter.dev;
+	struct device *dev = i2c_imx->adapter.dev.parent;
 	int ret;
 
 	dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
 	if (!dma)
-		return;
+		return -ENOMEM;
 
 	dma->chan_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->chan_tx)) {
@@ -452,7 +451,7 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
 	dev_info(dev, "using %s (tx) and %s (rx) for DMA transfers\n",
 		dma_chan_name(dma->chan_tx), dma_chan_name(dma->chan_rx));
 
-	return;
+	return 0;
 
 fail_rx:
 	dma_release_channel(dma->chan_rx);
@@ -460,6 +459,8 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
 	dma_release_channel(dma->chan_tx);
 fail_al:
 	devm_kfree(dev, dma);
+
+	return ret;
 }
 
 static void i2c_imx_dma_callback(void *arg)
@@ -1803,6 +1804,13 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	if (ret == -EPROBE_DEFER)
 		goto clk_notifier_unregister;
 
+	/* Init DMA config if supported */
+	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
+	if (ret == -EPROBE_DEFER) {
+		dev_err(&pdev->dev, "DMA not ready, go defer probe!\n");
+		goto clk_notifier_unregister;
+	}
+
 	/* Add I2C adapter */
 	ret = i2c_add_numbered_adapter(&i2c_imx->adapter);
 	if (ret < 0)
@@ -1817,9 +1825,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		i2c_imx->adapter.name);
 	dev_info(&i2c_imx->adapter.dev, "IMX I2C adapter registered\n");
 
-	/* Init DMA config if supported */
-	i2c_imx_dma_request(i2c_imx, phy_addr);
-
 	return 0;   /* Return OK */
 
 clk_notifier_unregister:
-- 
2.34.1


