Return-Path: <linux-i2c+bounces-8199-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8799D88A6
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 16:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91F2BB44941
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 13:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52EDB2B9B7;
	Mon, 25 Nov 2024 13:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nfic9/aG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3071C191F9E;
	Mon, 25 Nov 2024 13:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732541841; cv=fail; b=LqyCkV6d0vgsyir2kvv5KcIZKdhp07lIcZZzK48L51ngf+Rq81WiWXeaoEIkAOZkswWahrDSdP7/AbEMWNvEeHVxMMKPZebguxt3zMj0zbZhy7IcB+TUnW3z1QodCV3ZEUFZG+sEbLVImbQI9BiEKQzuDV7sincl4VU1mi67k3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732541841; c=relaxed/simple;
	bh=ve5G8rCP3jHxbNoCX2QfMdqcnbMybHDFxAs68fSzDMg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=L3CtuZQZb5iemwDGdpR20tNKvvyaJCyirw3q+ImJRkcOrDLHayTWfFUofZqGvgt+S4BTrllR5SmfuVh/wATmdtF4cp1YjvJYfSkNW/jjxZ7MuZI777a/y4MEQBFbtfCCsgNgIXEGEwvbSbmZ+asxY/ldXCnPYTwFNBjxa13VBvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nfic9/aG; arc=fail smtp.client-ip=40.107.22.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZfd3uYC+V1WK+O47jpo2jtaZhe8nOh95cWhtA8I/dmM1ZYqitztO+YgaJCs/fMNnaG7Za1Xn2H/0r5k4jT1IARNyHHINhh9h9MLNCRjtrzslaINkFl1Nyfh2M77/sF8ybn5EhRUxzuhGyew6HRcsSoulKG2ILHao5OfVrDljlvu5j1XLJJ1SqlzkHJj8jTfIExKz6oz2kk66UtcuRuP9z+WUjddRiPFNchwnurDqcJNLr0O3z8j/WTov0il/cYi63QMHeuXLsh7u1pqo750WzGKFDQFczxirQWKnFi+4RqdTan0MX3UE4dkFJJUYH1hodk0NAlN36kP9HuCq4/ghw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQr3HASoq0wMbzkVTuZl6z24UD/nEwN57QGJoClINhQ=;
 b=AcIfOtwSKzEqwODsnqUw/piBZtNxzPL1gkXsEGuaAnmYyGVw72fsCUiii17I5EL/5UTcoyOU/CRC49zlHPuW+gRISzHKJ6vqoufdMGiSTJYdId39Q/Ps8nozYqBG0kbPdHQe96tHOUytwLIB5zOb6fvixAISqJpkgJ2m5HE3B1jdiY2FwO+GJ3c4KQd653CkMs7MPqPKm44rjxrt4LV0cL7xmfqwGJ4xY/cRyEIkB6sEMLR8ACyElcKEOSxJ5HU8ordHLsMxvbF36RQk1xAsDj6eE9u1Tr6rsF9p7Tkm88yqiIStaE9eSWPYggMssu6jILgkRCbf87767Qz6bGC4Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQr3HASoq0wMbzkVTuZl6z24UD/nEwN57QGJoClINhQ=;
 b=nfic9/aGmR4/0sfJhjMpjmZjdWWTTtYXz3knlmrHK0Ss9dyCmo1lzR+o2ATM/LB4X31BKD1tXdcXrHyRytMJZDYNOoMUfwxqd00Qtxt/PkK82S4GYNt4jCAhCJP1pNYysu5hJKTHYuBX3dDe/v8/Qz6towLVnAt0/tO6zCeMCn4IGqAj2J+fUZ3RmMEpC4lpwpoNWCRiMr3M0W4W7O5fKAsjYQFCn/NbEmXTy4Vvj2Gl0WVNxibGP9zAC4y+jIOSiH1NOjZCKdc+/n0saGqctj+mH60Csy+gUjQvu00NjLx8fiJ5J+aAJO0hohnpvGeQNTm0WCExHHlPxXFImV3L9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by AS8PR04MB8660.eurprd04.prod.outlook.com (2603:10a6:20b:42b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 13:37:14 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Mon, 25 Nov 2024
 13:37:14 +0000
From: carlos.song@nxp.com
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com,
	francesco@dolcini.it
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: imx: add imx7d compatible string for applying errata ERR007805
Date: Mon, 25 Nov 2024 21:45:48 +0800
Message-Id: <20241125134548.1611923-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0037.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::28) To AM6PR0402MB3944.eurprd04.prod.outlook.com
 (2603:10a6:209:1c::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|AS8PR04MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f479a89-7f7c-4613-c279-08dd0d564595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tAoF3TYoVIKWRniLd8BSL+8HngrdxeVKOwdWjOobuB5YxGD2VHvyVw7rKEpZ?=
 =?us-ascii?Q?WU61AXwFuTl3Y2xUiWeFeqCxvt6xaecTBFBd8nALYqLbKJFikc6x4ItdZwpx?=
 =?us-ascii?Q?BGXjMMD+PJ3KtHO+akpfVk/E4ZG/nuUELqDRrggjeZyWNSB5hCRCWQ8ZDQGQ?=
 =?us-ascii?Q?YHCVQssGSrIjlFV+wXsvaPuEcA2asgZLIJiwrdIOqizjnFzOzjbtD7mddGyC?=
 =?us-ascii?Q?3lMlOlXM/mQimIqDzktysL/oFR/G4kK2LXT3kyB2jpXdLsYnVyHEBBKPtfBp?=
 =?us-ascii?Q?BXJHpy+Zg5aDUloTnBVedVIvASYxpspCHyq0Y/KvyWoZ9It9hw0TzSAN8Mk3?=
 =?us-ascii?Q?e1LugLGH0BwVUJm4FROBOHLWrOof3Xs1GdcTrM/lqtwsJXaXFTU7wckcgchR?=
 =?us-ascii?Q?4BpNzMS4qMk6XVea1OshNmaRA5P9r+leMpmfcBtvk/T9RIkPBbFbxH+2GcRh?=
 =?us-ascii?Q?6muebT2ipoFuAgXRneRqn0jSxH9r0MARZv2ezl4jU95729QxFs06/Uf6MQ8D?=
 =?us-ascii?Q?zNOnIVxnt2HxqmSlLsl1QNu0x+Nfj7sZoqUnvzXDCcHvZ18EwXpo++oX0Naz?=
 =?us-ascii?Q?ClAmb6MPQcRqAHoqJqCZ05l1ZJzyMEOlixA5z8TeAMudAcjao+ql/z83Afiz?=
 =?us-ascii?Q?FRM3yuAFCA4SQ95HfT3e48S7gXxZJwegWaMRroo8QCCRFDulybZW8x6P7EHr?=
 =?us-ascii?Q?q6Bcksiqxh2xq/DY7VrNPY/6myK5nckJfiz/3CTmzTtybySWYBk/E0LRkMHU?=
 =?us-ascii?Q?jtI4f+7qv242+res5ezY4CaL4aamprRrWxcYL4EJCvmJEGqkH+21AzSmF9eT?=
 =?us-ascii?Q?Cc5CbqgCO7EhYe893HzL4M6FN3HzfyC5w/8OkFP5fKLVzU/eGMfznspw9l71?=
 =?us-ascii?Q?zx2Yy5Qg7FR33hvGjIgE4xSJyli1hgOLScJo3TwextaWqS7bH4N18nHzkXbw?=
 =?us-ascii?Q?elpZyz3dweKiPiBz2l8g2aOFUOU2g7+MUPKeGm26qjKZ3je7D8eqtlRjxe3U?=
 =?us-ascii?Q?bZHTm71bCifZsx6lAwSVCAtD790kgCLYfN3MpTqu3jni0CqtbfNEe8fQFrW2?=
 =?us-ascii?Q?fMXRfJb//hEx2AWmXjIlgjtpVBPIkqwDQBOfO8gLHVa2FkgRl5wYKojuh6H2?=
 =?us-ascii?Q?/laysgnLeCoUHVWd7+MAgvq+nuQO9s6kOEKqEoSgEF3mkmUqQqZtyHYpaJfC?=
 =?us-ascii?Q?GA7O0oRCZ5leW9zzfugM3QRhUmD4drUBjVX0s1uuwft0ArbkPwUoH0Dm1G4w?=
 =?us-ascii?Q?wFAAXROT/ZQs3DXEVknZLJXFuF4lvkc+Qiz2NPDih+FF7l6hClTGbhRZlbrr?=
 =?us-ascii?Q?TFeN9bzneR/iT40w+imFb9TILjG1h9humd98NTBlAzdQHgdV77bA+JV57fXI?=
 =?us-ascii?Q?EgJEVFY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7A/+1Boc23/N+X/sMf3Tjxf3HIHKlyNBPve2dCBumuT1zDsgi7bX7UiI2igf?=
 =?us-ascii?Q?VhjpfRS6Gs2St3xlIO8bgLztRenn3e2NgGFJ0TmyiYIeSnEfqqQYdvMIwKce?=
 =?us-ascii?Q?aXHz7BTcqw9lXpGsE5g2XtWxBBRQpm3tcO4w8/M9sHvDm417OHUEw+0n3Ej5?=
 =?us-ascii?Q?vRunP5Osxxygi0n6KybwfGIiOVCMp4/1V9698AHrxUezyvPOYrZLMtGubtI7?=
 =?us-ascii?Q?DrCrFqUo8zw+e2l+m8jm87850UHYOPBswuar07yANtimKWjhB455T2m5dVIH?=
 =?us-ascii?Q?nqLStaQV2QIx3X3bptvuMrIDY6LvF33Dg+tvCAOistQAUQjOXzZOY2Yt9sby?=
 =?us-ascii?Q?r3amZwEdVToIQN0MNVjoGXCdjXp+568NyZjCF9Nt9n+kPXptugXY7LWy8kYe?=
 =?us-ascii?Q?9/hAX2n9UJmUbCjGLxzudPfaeeSPcBiS/IOz4M8pG7cSg8agxalVdEcPnoVs?=
 =?us-ascii?Q?Gjt9kRr7Ds/7wNg3IMnfM3WAFsP2Uy2fG5KPqGceyZvFWF+Z7Za8aXpHWZ5S?=
 =?us-ascii?Q?iWI2a/CeulXrGJ2VAM5Z6bPnzAEtxq0oiPn3RVyhwBtIJNCvP6eVIXJjGJXL?=
 =?us-ascii?Q?L23zmy3j6DyDzHxtUKsPcUDrZHQpCsh6AUX8ajfoDZRnNYlQxdMp3t1CElk9?=
 =?us-ascii?Q?iBLTArIZSFGxevrVVTSZkdgN+geNCcLzKxVJqRU+UXpzQBsI2SxNvl71h48A?=
 =?us-ascii?Q?w0j2jGMPlSr0nfcLCvT24uLI+jy2vDL1Z13J1BsMduUUAasP4ya0pXr4W3To?=
 =?us-ascii?Q?l49x18gBOTdFGZN8y6mK9GYzLFrAgLyGdRvK2gxy2/A2UZFbBqIlLlYVDH9H?=
 =?us-ascii?Q?yTxiqB7c5ENmA33SuhNFYtKa+o//uWVf62B7oVuGS27PwPzB23+5nS+jlcFO?=
 =?us-ascii?Q?ZP9JJWBZB2addN3l81sl89gG2FMDaKKWIiLc9CoomaT0jf5HvyQdoJZziDmO?=
 =?us-ascii?Q?mEK5n8JieSrJGgpBMAAkQfbYvR6ZWyeB1FWOTRpITbXWGVs5RsmPub586rfa?=
 =?us-ascii?Q?032zELLsildol/nEbzRCt6HjVdyOCev5lcrFAAJNtPkegLyJghS6HjAq8gwe?=
 =?us-ascii?Q?sOuv1k85fVXUjz16uNkQJkTos6PDB0NE1xvon6eaVYyloZq2WXAZ3PQtY+gU?=
 =?us-ascii?Q?QzNlDHsJ7l93bBG098ew/NTz3EnvEdph4tIzRr1nxBG8IPjN99vNDwbU2qKw?=
 =?us-ascii?Q?9GHMWlDcRnVDzGpOiHQpLHrZIbNcLNzDDFs+jhQo2UB51d2V6W0Qtmo759Ex?=
 =?us-ascii?Q?nb72wbTkffIL542nZbo5DnY+aaW1lCDpfmoj4qQ0MbX09c874HPUlkPGkFHW?=
 =?us-ascii?Q?eCIGwrtzNo7WzsAHV3eUWtn2I5ETto8hmmPIKoLxkhI0T993ZWfypUTh56l3?=
 =?us-ascii?Q?zw/QvzUODlRcxFa4P4g5L/AfGfEeh1CKBjhodona5BsfME49hv3sUz1hgD46?=
 =?us-ascii?Q?VR5zVdbvATwnsSsr2oAROtF8fQeYj/OOKH6Wjmh8Nl5vO9ORCPcsMfF87k+Z?=
 =?us-ascii?Q?xudj/nVFCNM2GnN2ZyjJMVaPS3lLfDH6DY3XqlogjwSb5EsVF3xMIIlrkTbe?=
 =?us-ascii?Q?KSkVG4fUSWtjQJCGNIJDfDnFhRYnnZpmbR/Q/ybh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f479a89-7f7c-4613-c279-08dd0d564595
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3944.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 13:37:14.7111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 50eh0QJ9C81ic4MRlldcrJ2dtaA6BLtfFEkR/IsWOSjBLyrjVKekzpn3LmVH2D4Dz6MZAJ9yp9CEmMhpfOFCpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8660

From: Carlos Song <carlos.song@nxp.com>

Compatible string "fsl,imx7d-i2c" is not exited at i2c-imx driver
compatible string table, at the result, "fsl,imx21-i2c" will be
matched, but it will cause errata ERR007805 not be applied in fact.

So Add "fsl,imx7d-i2c" compatible string in i2c-imx driver to apply
the errata ERR007805(https://www.nxp.com/webapp/Download?colCode=
IMX7DS_2N09P).

"fsl,imx7d-i2c" already is documented in binding doc. This errata
fix has been included in imx6_i2c_hwdata and it is the same in all
I.MX6/7/8, so just reuse it.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Change for V2:
- I have tried to fix this issue at imx7s.dtsi in V1, according to
  the community suggestion, I make V2 patch for i2c-imx driver to
  avoid updating the FDT to fix an errata. Discussion in V1:
  Subject: [PATCH] ARM: dts: imx7s: change i2c compatible string for applying errata ERR007805
  Message-ID: <20241021031148.2682015-1-carlos.song@nxp.com> (raw)
---
 drivers/i2c/busses/i2c-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index cf8931a8013d..2c782cdc26bd 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -335,6 +335,7 @@ static const struct of_device_id i2c_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx6sll-i2c", .data = &imx6_i2c_hwdata, },
 	{ .compatible = "fsl,imx6sx-i2c", .data = &imx6_i2c_hwdata, },
 	{ .compatible = "fsl,imx6ul-i2c", .data = &imx6_i2c_hwdata, },
+	{ .compatible = "fsl,imx7d-i2c", .data = &imx6_i2c_hwdata, },
 	{ .compatible = "fsl,imx7s-i2c", .data = &imx6_i2c_hwdata, },
 	{ .compatible = "fsl,imx8mm-i2c", .data = &imx6_i2c_hwdata, },
 	{ .compatible = "fsl,imx8mn-i2c", .data = &imx6_i2c_hwdata, },
-- 
2.34.1


