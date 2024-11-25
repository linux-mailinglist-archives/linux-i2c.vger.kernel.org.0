Return-Path: <linux-i2c+bounces-8198-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 257239D8835
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 15:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B510B2C025
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 13:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE921199956;
	Mon, 25 Nov 2024 13:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="T6C6ggwd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D8F18C322;
	Mon, 25 Nov 2024 13:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732541689; cv=fail; b=hDhjt5/SXtYxn0Fys8BoGKqcNMlPLCht3lMLs/7IoWja/CQnelIYFXFzI3vYJycacEa3ifB5YB8+cFxHoSnnaJGJygosmzy8KbpcrDTkDSZf4s30iplo1keCDSqqw9ws1IPanJg9LaLYA/gfxJGqymUfkBpu2A8xIMVS8Bh8Csc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732541689; c=relaxed/simple;
	bh=RRnTaF68u7EGb7C19w317NoPWlh0Rp2xpJdd9gBLIcY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jisBd5pklEB+y0ZwhSPGnK/xV25NGmdz5hr7xg2dsfC1O3gRiJmDiNG7+6+OlQRGWFg7dnXGT9kmL5kKcFIARdlCuIWN7vMXQdBQjIuiv84Ql25SVMd9eVResgQsj20eIYysxkVkSiQyXMrYg+j/OAUH2Vug2to66M+BawReAT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=T6C6ggwd; arc=fail smtp.client-ip=40.107.21.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ST9NonN/dee26wMEuC//1TnaCsfKHAO6Cbf2ftzamf8DlS0u9Rm3zIUKaLvaMlYjYxPt3FVMxSTUDDY7ED3d7JAuiNUAUVcgU5i5aMgY0hzFt5KJHXGf2nhBsu/ia1vDmUwdyUS/c0rcqVzhMCNuCyuUpEFLKKy9V6fJWsUhyjSTntobIrgfwkmLva0zy2pgnJidjS3ccmZ4GwLnqk6CoS02YNcZMvS7e94OazCFLAkJ2Fm8GwkpWKfSGWDY1EgomWLowejS+T49iG37TDHC9JBX9Vzxb7l+WWWcOdaXYUCMHLIC3ZJDcNxUrWY4VADxDqZskMCXfVGrxIq19nHCVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ai1v46WTup8sFF2Z2AC6a25GYbSY2ANB9udVAi6sqsM=;
 b=svjnUyvmF8BnfdiJr22TNsSh92fb+KUj7Zyc/Fqn28ge+CJLqitYsR9rryJU1CABMzoXcI6FIy06PXrx06X+b7PeheyH5vCoMUcfcE1pFEd4iejuonw5zra9KIdMY4zLjQg8HbmrVLv2sskPxSZdNWB6IXoh7KXosuW08m3n+WLFsucl15VcVQrqoPhgfbAGTuFppqMj5d3VmmQ7fuhEMecO7wwU2UqnxUd8k290EhCznMazm2oWgIPD075lG5b35oav4CEREM5Ujcmkl0h0fylyhwx3J+FSuqH/4fYf4jcRWCW/8zAHofrnjKHY7+b3KMQK7TIotaeGkfQTmcmuSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ai1v46WTup8sFF2Z2AC6a25GYbSY2ANB9udVAi6sqsM=;
 b=T6C6ggwdsXJGiEdBxMTR5BRJVouR2yhVCcQfm+PrIyabd27GkJas3+kyz9KQjUd13xvR6vbCePSwf65Gd0iYjJ7JTBL25PmZfIxr8KzD8gRc+H57c9bGRZ0kBOEbC4WijShOUP01Ud5wmB+qZtDaG3QZhUkb1z222DwimaBEqz3/CwBX0DVQJw4LT/2E4dzg1KuueWfW41jKDep2q+ZWrfRCr1GB8/a9ghYpYuJaInlROhXGhDJI/zRfAqCG18Cmpy+oWSIFwFQKSsq7BMCfqCH03/AUwA4OWBfsYTeeT46yt1O/ySpWhpdaBCPMpuEjjCRVFU25VVMM7fJkRFIXjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by AS8PR04MB8769.eurprd04.prod.outlook.com (2603:10a6:20b:340::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 13:34:43 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Mon, 25 Nov 2024
 13:34:43 +0000
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
Subject: [PATCH] i2c: imx: switch different pinctrl state in different system power status
Date: Mon, 25 Nov 2024 21:43:22 +0800
Message-Id: <20241125134322.1611845-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0053.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::29) To AM0PR0402MB3937.eurprd04.prod.outlook.com
 (2603:10a6:208:5::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|AS8PR04MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b06f30-20e2-4163-b84d-08dd0d55eb69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ORgCW+PqPlag0PW56SXxThRkTY0PQzBKvKrOxD+L0s3jqTE+Gm+JEohpi8ZL?=
 =?us-ascii?Q?3xdaojEGVSkZ/pLN65HdRQBGwyqemZKOFADnkCOJos/nh5DO/3pQUpZ4dNYg?=
 =?us-ascii?Q?cEY+5d3JWJ0ZxahuiV8dVfkYWsWoEFut0L5NCL84v+WmrlsLcLrQMtLxUbiV?=
 =?us-ascii?Q?wg2de5jdQHl/MsVCbKsS9wqtnVO9fHVJQZ7R9cXSah0cQJnVw5jSFpylKL1Y?=
 =?us-ascii?Q?N6A4qwOI2klBIVJKoMWVLts1nG6s0MiGnqYFVHcFYKGCyowCv7I9DF0sqWMs?=
 =?us-ascii?Q?jFg9zyGKlevVbWwqOXjIMvM0nQx4v+xPgZ6SUvgNL4cOPbiF83mMgGp3lzLi?=
 =?us-ascii?Q?lVaLhf4dwOYsnUPZPnuazJo2+AppFipLAY9Z/GB1bkv+JHwo7+bx3yblSmlN?=
 =?us-ascii?Q?hkAZqdFrYXaR3+g3jee0SN6nM9GHmPNme2/JEZLfIod3EmMwz1TgaXPMHi8d?=
 =?us-ascii?Q?xrwC9DDf5CbFSdTl7hh2JDr9TBtUVycNjbJxdwrNg92avLLIWUgt+SxZi/Vo?=
 =?us-ascii?Q?pnVwLCR2ZzUWQm2g4ZwpietWOVZ3+nUtoSwEzVO5O44AJvAbWJcu/MKHRMer?=
 =?us-ascii?Q?xQlgnkUXo8fSV5kbcgYud3jDYRlRk3WmOCx0DgS6kufooUiShSRKtWB0/ClE?=
 =?us-ascii?Q?kHq5XNI/2KhYERVOpcunyEya/UE8BhiXrJ8lMXJD58lxCEgJB+nOecpjU6kr?=
 =?us-ascii?Q?fVF3LpY5UJN+Nt6zvCkOT23EVPAf1k2KzXDgQDIdSTvls2IXZbuHWOzlkWry?=
 =?us-ascii?Q?E/jFIzhs/1Vj7g6BPOcJveImL8sytJHscwrRwl8qiq+zydfPPfIumbeRExgB?=
 =?us-ascii?Q?KsuU5+vrWNsJmvQXw+GwUMg4FUcaBGVwqpvJEcfd9K6DoJuK2gNFLdgFTM4D?=
 =?us-ascii?Q?0qab0/luYtVzpA/YRSTcE/jsO0HlOZ6oK5QBmH6ZtD6AG4IaKndBHBYVjgwK?=
 =?us-ascii?Q?59AhvlN0r4UBDxDDy9+5VePzAASjsJItIDNf4ZNBl7lqq5J0BbDbuL8QHJJd?=
 =?us-ascii?Q?GApZ0cE75W9uFSEkNv+xdbTE7oTAksbwzUAnqGFw3oDx6ftAYhco04BVQhI3?=
 =?us-ascii?Q?T2L11+g7je3SdgUPdVK0QguDeM7gcrQ/bkKeEAfeHBMcbBzVpNpxTZ8P0GN4?=
 =?us-ascii?Q?nSm9Vrxk9zejWPU4HJVyBqbTS3npmqAU/5xPuMGe9y3scuFu8y2YJEKMQ5Rj?=
 =?us-ascii?Q?nG4FUwCxMLO9/rHm4xXo3AYWaoX9hs8kVJcqYYH0/FN5yttWUw24OvJROgav?=
 =?us-ascii?Q?cihaTVMMZbS2DxE6YHEIg2jM8jADTH3faHqeJs96DUN1h+eNyMIDzcyKjGmc?=
 =?us-ascii?Q?dwuqTRnuHSYHR1+2AM4L/8yM0acwhyQkIOOb3N04aUH+P57IZ/KXUv9t6sLq?=
 =?us-ascii?Q?R03q/eRPrhB63voSOG6MJKLFAGKhd/AauMU+vZquKdiJ0h3iKA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VWmhxbN+c5p7mN/SuuJgy1+m43qHbaxQ394SrbKyQQzYgd4q/q15jQ+hP1hF?=
 =?us-ascii?Q?psL2IbuNjgbWnqa0BktIlo5TXwOf+2bNkkF/iEzevTs5IKU7/mDVUov0cG7k?=
 =?us-ascii?Q?NWH5ZUpL+FK3eXQY/WcfRNueg92xlDTrd3oXUpK5GKD6ZNUbNt/VQevUbFFZ?=
 =?us-ascii?Q?ierm479OlWEJjQNPYS4Fng2s+rwf2WUBeBZQG9oZy7F/udSDqd4mXxPsORVQ?=
 =?us-ascii?Q?gexU8Mev/r2ZcEgbeTKUiSACjxtMrS5ZQqDZctPzHHiyxZKtXrkdpLM+yoen?=
 =?us-ascii?Q?j/ylrTWwD6T7flHtJYnO/UKtgAVwSHnHaFueMDhZgYNyBdtx4I7E67nhlNyR?=
 =?us-ascii?Q?LDRoL1mzBAk+v6c2fDb3TRoMlaA1F8HF7YBvOqS9aUb0KV+QD/oLxWVVhC9N?=
 =?us-ascii?Q?b3EiM7ULSFJR5uH+Qu85qjHxPEzA6IqcWTuPGDQIRylxcEBzZqeJA385x1Va?=
 =?us-ascii?Q?AQMBrf45qlzfN9PXvLiqzQ6QPEyob7TJrGgm6fDhnV1HpWC8+90Va/LVwWh7?=
 =?us-ascii?Q?9rBRJ7oKnP3CKo+rmm57fobUsx3ikeL/VDRrUY5DPnLD+EmuPurm8vemtLr3?=
 =?us-ascii?Q?gDKY2XuyyRovd4uC8cuSj9bazzMxYPuK/qs4PVUjmOCcYthirYK1nk/paBUQ?=
 =?us-ascii?Q?bi8zI8e7CBCWhsHlgrbB8Zz2dXOzd/i7l4QJao1/pZid/FEeuzCG7mjls1DV?=
 =?us-ascii?Q?RkqQaazbRWVpRcxvv4KqM4lxzBNnXnzSWl7O/GjXEpUpGrIEomj040Ex6GCo?=
 =?us-ascii?Q?A89NKOgTdrqpybpw0R/4Vb9yY0USvORM7r/8dHdXI57eJLn2r+kuD9eq4lBY?=
 =?us-ascii?Q?zlJ6TO0HDDIAFBxWSLjkfnPOrQ8MB1JFf17G3yfAwO629lMj2q3D+QTEmhTX?=
 =?us-ascii?Q?hGjjmt40zDIZ348OuO7SWZv/+UB94fEQXsrPadT4+KJbBxPsW1EbZReKceG7?=
 =?us-ascii?Q?o/AN9fKkwuB5ZE/5VSkraF3nu4LBVlS+hVlUIf+sANGUwOyWm6svnDJ9X5VU?=
 =?us-ascii?Q?NODXwJ5jbG4F5mlCaAsxIbcRyEkKfnHjIP/RpsXZgAr0G7tzjbxPSyOWeGTg?=
 =?us-ascii?Q?lBa2yb/N3vjnVBdx1epZm90Hs6SjNaTfoxdHSEYzTLg2DON+Leg8v8eKo3b+?=
 =?us-ascii?Q?VSDiU+spwU5zIhuDch02I5cAGrdO7pLViH1erwv5IFTDl9KJOUMrUey61qL6?=
 =?us-ascii?Q?JbzEzIS2j1CP5JA5Oip8FtZyJ4NNOgF0knVYOjltGtfrAQWDG0bnHcBe5INS?=
 =?us-ascii?Q?u5QARAu9pfcqJ4hJNsrLiL5bFkYf1hP4xF74cwf6JEL1zoJiiOPxMm5vzCb4?=
 =?us-ascii?Q?HJvnfsB9iAstGh5gIZgzJC+tpB00Y24ibumngF9pw2yjXKjcb/74Oupl91Wo?=
 =?us-ascii?Q?b9JA75adALJJzH/6hdirZDCOuEZvzkB3R9lREFCyhLFz5u90AgAc22yauB+v?=
 =?us-ascii?Q?TrHME1A509jl0961ZpS1g4/lMu85gZhbmJSzbFHGaH2pnzsufKrPaAq7hbs9?=
 =?us-ascii?Q?NNKpgAH9xuqKkUOVC1S3+VozhhmhGL+kiibobfR66XMAUc0+1NHCHN61FojX?=
 =?us-ascii?Q?ogamHPn05Djp5Io4MC4yzGYNSVCl09VEyx72K2hN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b06f30-20e2-4163-b84d-08dd0d55eb69
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 13:34:43.3732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QxnpeQVSbIyRQTrTll+XhfudzTrVar+qTlGXXaags+p/yZ3mo946LfXgX8tCU5tC/VsPa/eEN8zw5iqwe4yKRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8769

From: Carlos Song <carlos.song@nxp.com>

Switch different pinctrl state in different system power status.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/i2c/busses/i2c-imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index f751d231ded8..cf8931a8013d 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1859,6 +1859,7 @@ static int i2c_imx_runtime_suspend(struct device *dev)
 	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
 
 	clk_disable(i2c_imx->clk);
+	pinctrl_pm_select_sleep_state(dev);
 
 	return 0;
 }
@@ -1868,6 +1869,7 @@ static int i2c_imx_runtime_resume(struct device *dev)
 	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
 	int ret;
 
+	pinctrl_pm_select_default_state(dev);
 	ret = clk_enable(i2c_imx->clk);
 	if (ret)
 		dev_err(dev, "can't enable I2C clock, ret=%d\n", ret);
-- 
2.34.1


