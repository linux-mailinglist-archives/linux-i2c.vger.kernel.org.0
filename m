Return-Path: <linux-i2c+bounces-14134-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1ABC67E96
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 08:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 984A94F07EA
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 07:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EA12FCC13;
	Tue, 18 Nov 2025 07:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kKO5paLJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010048.outbound.protection.outlook.com [52.101.84.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E2A301027;
	Tue, 18 Nov 2025 07:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763450359; cv=fail; b=u8m9nXMpeZ6JWjhwkWOdG1jQFSMJGzkgOXHpJPBB7aRgBvDBqPCeeoppQNdEniqZg7IazIFb3Hllbs0kRG4+Y/sjN+CNJMpXEEWcULWaPxRS5KKfzYC6nebsCm0GyYvm1Ek0YHf6z9jCi4vVsG4lUboPC6IDziFKe8bl4amC4Rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763450359; c=relaxed/simple;
	bh=AWiTH8SzSVsqg6WnEklfG02iVesIgwofjFiMbqtawio=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=B/cc8Il6d9V4R5WZT8spHf73KfOsCYhejOhFuxj3hYf3UbqEbivr28w7SgfJLTYpRtPhEtvM0trteSMY03izAEbo8GCXKKLFFAuXhG0SLKA4bffkzbT6ec2bG33m6BAlzwoRNYS82W489C1gQsGoM0HMUcW1PbuoMczNpxRw9FM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kKO5paLJ; arc=fail smtp.client-ip=52.101.84.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xiQrkrK1aEwpgJyElKcQFrxyXdoNk4qDjvnFX3ez2rtD30jHYjUpSBlt0ztTAtTaqTC6cuiTbPuxBBeWTMBw4b8VMzlry4zv3eEA2biE1xHVUb4HRbb72VMx+Nfu0yk0ccv0k+Xdtz/a4sl7aFYrtvKTbprZ58PuKO0fQ0SE4RFNayo93ovkNstuBhOEi27Vppw+cDkX0cBkiUjj6f8GSp65h3QPT78+FlviGZpQOLC2syAr5gBi/1jx2cRTImNJ/HRUUgEvQzklNYt2KSmUKmOAFOYKKdhE/rSGcwTy0cfdq/G0Jnrbh2FXY/7ztv8rPDnrk515OWoT+SI75DYm9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWI9Rjducvk/Tpm5RXiMWL0Q96yn4CnXUk1yYNHy+MU=;
 b=Cwhiw2TYoyDI+1pUIwOMyJf2C906LWgDG8jjtdFPHQ6Gi+jH4MOzIWXrusRXqpzv13yGDNXEvQUJqdfa73LZYojhbhTzG296NlbiLd7YNM9auPYSScTaBnYgw+xuBgxnP//Hkc0QuLjnVPFilabuxFzyXL7NHy0EQg/m0n/IXEthQjnohcW1UleUo5tiiJo15zuF4Tjy6IPwftZYUrtzl3Im4U0ioVrfRDyfMIotuOyH8AIaF+cdttbuSVPinjlRK4HpxGaWKFP1oTLA2qXcpxjxENryxVUsLKMbGynbiDniVazwTdriCRchmxk4ObRjeQqgDoDPp3l7Ki1bj3UBAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWI9Rjducvk/Tpm5RXiMWL0Q96yn4CnXUk1yYNHy+MU=;
 b=kKO5paLJN+hJnvNflQuyDPqkW9c6OJd7MH/W1WcaTbliuDs/TD6Fu5h2J/b3Wi60OxtPTVvziguW+soybW+pNy+QG+xR27uvK0XuBWdKjbqnHPjnGRAcr+RGqrCONxWtA3j8YHDdSfcRJ0sfUUz5u4pF7CzIEalB16JdwURgk8gVEB8EVuOcKz7PmiuavQec/Ddxj3iU8lUWziHeWiLCDIUSXJpUZjK/T2p4y0Y90TGLcH9IjcB/lKll9qGPxpa1qHvYnLn9kKSC3Pl3NDoF6GuElK1qMNELULxDpOTln/35wCSNZCGAShx7hhicGF/Q15tDP7GZUI9rhGdU28JHkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by AM9PR04MB8289.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 07:19:13 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 07:19:13 +0000
From: Carlos Song <carlos.song@nxp.com>
To: aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Carlos Song <carlos.song@nxp.com>
Subject: [PATCH] i2c: imx-lpi2c: change to PIO mode in system-wide suspend/resume progress
Date: Tue, 18 Nov 2025 15:18:37 +0800
Message-Id: <20251118071837.1419558-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0022.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::13) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|AM9PR04MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: fb351f40-1b1e-4764-f11e-08de2672c616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?as2kTqgi6MULyqINGxwITaAhZFnSgHUstwhEEqh90rfhZtn/5hZ5rUECz1Ap?=
 =?us-ascii?Q?PkEAomm2V8v/PJbIsl+Ci/h7j299X0AE6Ph6tfyUzO9ivluV7D3lceJEXQHl?=
 =?us-ascii?Q?Hl0yXm8TVudIonRXtT7ltFfM5jiXqZP+KDZLBNtCN++QRrBuGKwZeh8A113I?=
 =?us-ascii?Q?GxCbmsLiDALClhR/PytewNk9qd2Z8e2OdGM2RSFk3UUI8v/4/8bgJE1WHNJs?=
 =?us-ascii?Q?uHSHKl6h45rfYN3z8rpjzF0FZ4oMIHDu2UbUiGnSrvzhoYpNZDeftxRDv0z0?=
 =?us-ascii?Q?OFOFlLefupfoJmFaXcgqlerXyRcmqqtEiKXi3mJnMrDvT4+5lEmuVX51uR70?=
 =?us-ascii?Q?e1Ixzuf7xQCi0T0Ke+a2INUEOkp4hBZjruu5ko0SauO6L/hiPvwVi3y7QhLv?=
 =?us-ascii?Q?SKLPxYRX1ct72xDYP1P5A2DyL2IPDLWQfxdGx6JLP9bL1qwkuiOSYGcQWiKC?=
 =?us-ascii?Q?AJwA5goqRgD51104kNSs8w+D1lR7cJe+bB1tWMpnKrflY2lDTMKhfYRnXHhp?=
 =?us-ascii?Q?pcNJwEL77t5cqVeiGyu32c8DwuY6ewogoBxy+V87WM/UdaQhiP3oeWbbG8G+?=
 =?us-ascii?Q?pjN2RPrn7eg4Ht9doAjgXmZ2J9Ja6Fo0CGyQ9FFcW+7HxDh7Hw9ORw5mk0rm?=
 =?us-ascii?Q?6CttFt/0sjRR4J29HCLN+i0+yjXu45xeN7wk0Q3Ja5g7xox8lKwVpEj5F3lL?=
 =?us-ascii?Q?ICN4bOtAlO+qf64+U7DkvY6x9v7plcdpCHFBphlSXmLbSAIvtUpTxB5EbhBD?=
 =?us-ascii?Q?i7UG0089AGY3DeIk/NDGrQ15EuLrh6zp16uCfelOac8lliUMfU/pr2l2OXg+?=
 =?us-ascii?Q?KjC2B2FMjcdxq4s73cZYPhBwCIfj97iN2Rt2bQsLjpRaogtnpBIybDb8VKMW?=
 =?us-ascii?Q?RTWFCn7OKZlZOnZtST/N3vv2yIaktGPozlqfLXWzn6j1YDOe11/k6L0ZkWE2?=
 =?us-ascii?Q?qQs0AQl5amUXjh4GIvjO2wghjaA/KovxBHCxshbtChK0NgzNfiNEHz/fRnyv?=
 =?us-ascii?Q?lDnaHIoKv3+ocusz3RiGWg4/S9F18U5QWa0+HjRzU6+7o2SSxAsGC+CusNBY?=
 =?us-ascii?Q?P9FgRIRAd6QuKSWnqGSp9pZnjmFK/56mDNmlL/BRCYMAqyc159cEBsZPy3C9?=
 =?us-ascii?Q?riAo63BFbS/rZQ6NLOMy30UDdL+uZQK0798JL4GZ4t7K3zJopPPHczw3R7Cu?=
 =?us-ascii?Q?5kwimPLMoFniv+dpbNsJIGsJZ7IIuw48RzToZQf/2fm48qCQ4me51BKdPw0t?=
 =?us-ascii?Q?oJDtwNUSyccrNcPSxrFlxiNnDWFs+EXM379EvXt+NRe4XQHMtp6VdhmtBsJy?=
 =?us-ascii?Q?zwcc8kbb0/ABb3oA+fsm8+ugCfAZqYBLpcITP951++YtMoRzj7P0Z8WccFPD?=
 =?us-ascii?Q?YTJKnaPa3O95TAt1awwa4SAp0jrEo3Vmg2duueelmr5CwEAghgFnQMXnyUdZ?=
 =?us-ascii?Q?/Kz0H91rcaFh6VlkavTId750Brmci+7pqteG3G+hDWoLgx6xk+Gf7M+kjB1Q?=
 =?us-ascii?Q?YojIpeHXldXzB81V6R/MY/NUhIUcnmDpZxQ/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K2fZJ3ROwKBqhqpEZrDPki5M01ABQPin1Zv6f67Qw9y+o+wvYUoSEwEKW0za?=
 =?us-ascii?Q?vW1iLgtsTjF3ScceIq/UOOTmjTkdTGmCfSROQl/Fsv/p0APKWdvIN3I50OH3?=
 =?us-ascii?Q?8hrH/LpMvPtlbn0Fo29VB1GYG7EYJ9t8EUp+iEsehcGEWz9/7hKD4DOwiwOb?=
 =?us-ascii?Q?OpiD3PXGOV5TaMkvbCKNWyKs2IFuEgNkJ1VmL+WAqXxGp6jMg8094dZqV4wT?=
 =?us-ascii?Q?cW+7cbzf1p5pKgQpWG1EHtHLzqAjvlpmF7T2B2Bf1J1kiZCUNV0DDyKswavt?=
 =?us-ascii?Q?YYZoup1kt8ENl2zlv4Sk52NMN1xigOxkhYbC2tf5/ANvR3m03KI8iIRGh9M6?=
 =?us-ascii?Q?9szX/FmT2Y9z3xciEmlNveGLxPWrzM4hALxBu367bBVS3TWDhOdhc71MOQWS?=
 =?us-ascii?Q?gv204wjj48/ugWd4UY74JksT0yEHnX6MOUpaDi7/UoiYnkgJypKBncU7up5z?=
 =?us-ascii?Q?mQC5XjYeSxLFMohZkTJeJ20dKcf+KwYps04HtBbnxr0jdS7gvG5MWANZ6CPd?=
 =?us-ascii?Q?ElCtYVaX3RWq0X4Le0erNNcCjEPl8TTcQJ8kor+pp9iH7pmCc6wsWnkZUtgo?=
 =?us-ascii?Q?MlJQ+cNItOWML5/86H+Syhgi+P+i0fJCff4PkY1Jkpf8xAGBeOF2V/a1XQfV?=
 =?us-ascii?Q?aGifsjvC62Tp1wT750FZFWoTTJoESCsGL6WDGHcuqQuTstnDlyeTkks7DZkq?=
 =?us-ascii?Q?dAsM/SAOpsH3TCiQn1yE8HOehVc6I+JIWou58TxN9Ki7+Vuqwvbn9tfSbSln?=
 =?us-ascii?Q?BxH6L6HqdEuSG1T8DWghD+/QPBOOEi956TlnO8PHDDyqfcU4bSHyMKt9zMVp?=
 =?us-ascii?Q?aTLPViH5azXKAD/kCOT++SVLBP393pxg6cs/UK3NZpVqOMds76HNx90bBuq6?=
 =?us-ascii?Q?+fSmgaQ8HTVMbyC6yN1r9kMZN7k3qrADWGOZpKsLYHBuiw7uym+RWoRb8TuE?=
 =?us-ascii?Q?srWv9Ow3ovV7/6iXP4M0g1T/ZzS2ncR2ZfGcXqL/VzYFxrW8pVTDo6WlWelO?=
 =?us-ascii?Q?zdkNwxdCYRZCWFgIPGrb/X5f+//YgVEPCm2j2hq2Qpk5YIqBjVmmpbRjlVFC?=
 =?us-ascii?Q?fJz0W86yD90RS6SKYLXy2ZOkYnbfOtj3W/4+0nCH99UKbnnRsyadXF6RRdhc?=
 =?us-ascii?Q?VOKLaj4eTTIiXzt4AvokI2QlCerJxRPbyjRttACLzo+jG1lKswQRQh8o4oQh?=
 =?us-ascii?Q?YAWRBYruldkEIzfHL1JzXV9GXGj4BXWeWgQrXoLR0TW0mJKyZYfrtxe1NwsB?=
 =?us-ascii?Q?KQGuuPzUfhSy1nbnNsspi1qZaLduYU5l+HZ12KzWeAg168ZNFDfPo4Ao03LG?=
 =?us-ascii?Q?nnaTNgEQ1HgsYJedBIOyxeZVOlaKILpNM4NPcwuIxoU4iDXvHuDh6DJEiSFS?=
 =?us-ascii?Q?alL5jHEXPlPK3f4f98Q4kV/dxUHY22Grnd70ScW71rUuus5OIc9maSqYSquc?=
 =?us-ascii?Q?mmdjDAPoadSALUMjCyV17fTveMgiKAnAmQC8eh7JXKM383tgA9a6SdfkQYZ+?=
 =?us-ascii?Q?SHWi+BjHqABncjJwyTuuGYrocEKxsnZ8VGGeYVplSc8qGa5byjnG0Ss8a7sG?=
 =?us-ascii?Q?Eg8bZ7K4QQfWMGv94Tkivu5pqKAoc8y3YkzyQyx7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb351f40-1b1e-4764-f11e-08de2672c616
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 07:19:12.9554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7K+PJRXW3ppaUjtgCBAFyCY3xIs07h+JY2ZI4SzwfvW892IadqAsUWikPiI6T0OLiXVAirlhx/LvZfbLpg5Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8289

If a system-wide suspend or resume transition is in progress. LPI2C should
use PIO to transfer data not DMA to avoid issue caused by not ready DMA HW
resource.

Fixes: a09c8b3f9047 ("i2c: imx-lpi2c: add eDMA mode support for LPI2C")
Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 2a0962a0b441..5050e14a9919 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -592,6 +592,13 @@ static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
 	if (!lpi2c_imx->can_use_dma)
 		return false;
 
+	/*
+	 * When system is in suspend process. LPI2C should use PIO to transfer data to
+	 * avoid issue caused by not ready DMA HW resource.
+	 */
+	if (pm_suspend_in_progress())
+		return false;
+
 	/*
 	 * When the length of data is less than I2C_DMA_THRESHOLD,
 	 * cpu mode is used directly to avoid low performance.
-- 
2.34.1


