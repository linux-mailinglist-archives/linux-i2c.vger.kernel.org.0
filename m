Return-Path: <linux-i2c+bounces-8781-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 865889FD991
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 09:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 223FC163D25
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 08:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D96278F39;
	Sat, 28 Dec 2024 08:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OcPk9vQz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7CB41760;
	Sat, 28 Dec 2024 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735376295; cv=fail; b=QeJr7dSZRT7klB9xx8O0JhBfvMnfHfA/HcZZ84tk21jk+/uub/iPqCffMSqkhfCf8gt9cLDOqJQlCm986dnouuXx/F5p9fzrYj+xpzEDz3H/ROGacwpvBNtiEQXS5Xw5SEnh4xSij7Ru2nF4TEoQjdraADCJ4zMl30U0U+QLVyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735376295; c=relaxed/simple;
	bh=lRzgXviL0G32nqEhaxFJVo7hjk2IZXzGLCirayMCsEo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=umip2gc3SrxbtaRx4KclfYWjafgTOrNy2CnzPytxtNBy4z+sGVGC3zLgcsd7mzUgYByLjk01Z9DV5i7hnGG0y4zDatJqR7RE/5/Hn5tvr3s3UH+f2TuCqSjx6ER6/oLwS4LZxi2WuNjCV/3shoLQcVk+zDa0OBysuM0J3G0fLoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OcPk9vQz; arc=fail smtp.client-ip=40.107.22.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VA4UyY4rW82iKMNbA38cClCxxLgxTDY4xAGabYEITLqyEI9p4gj8omvymaKJMGtENef8FAJlbLl1cPHTmjE4rbDSfwYrux0gEA7w/XKH3wZrwYqrtqUdVYIm/81GTCtvpHUbWxC2AylImVnic2eQM4Vw0rSd6UYx98LcrFP3aXt9F9V8E3X0bjIGCaeykALkZsp3fSpJabS6OTikYhkLgJhqspKIHqvnN5260WA5d71PffYggUTBeFTBqy4NLkwwhQQaBvLdfAdKNNqKDeh5B0RynHJpzn17EzDNPUTBboWiXGjtlbQpTEnSWcWHW+5wo5MuvygX/h6nyCcX9wbcNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEGwca3WB93A+Nfg5ocz9VfG22vlSz4Jvrnj1jN0YI4=;
 b=y+0Zv7cHhKKerWDNtzaL/3SIrX2DqwHeGB4ooatWj0Iwltx6gB+9cjDmsLdVThgJaAqW+GnqBq7DLOdcfqD6Wk/l9sHAtaCdTHwzMW4CNYQZD2jDcClHvyLxG90WXSY4lJe85plz9rHWsoh7FBlGcrjcJjrmnzw2VYspaoaxX51JnlTNZ4jU7BL5cla1wHAkSUd5w5GdvVXqZEjylfQNJacFjvwWkC3zv/IJQoUezvv9J4lc94QqixktMgXyRHQEp3pPW9JQPoKB1Q2VCls2QMOKwNuz3IrOJigRr6G19a5M8EwqYXOAnVoWwgTW5qiyZhTU/OHjilvN6tZ8gxhr5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEGwca3WB93A+Nfg5ocz9VfG22vlSz4Jvrnj1jN0YI4=;
 b=OcPk9vQz2tSTmztua2aHlK47cdGUkgKxiax5bv1e2YoZsCKcP8K5FfhQSsv2XRm0M3GrREYiH6mOUHfb+gmXFkZivWW1fYLKW5S5TxxDwt9e2B65ere5DEozuhCYpYLrQ6uZRA6Fk6pLPwWgMvns0sZcILUINQOamNzDdWUQC5jZqr+FAa/XLXhh7Z/bZAhCm4iv8T0xST88WEH4sKRNkgQUCnkdO8XLJHtGyMngrIG0Ns/Lta+E9noEkJhgnAC4bxi3P4iKGDVm9hKPbptjcW+ugDiphpVMkrne+S6gPihF2lYUTI4kcKswN3PZ1iTk0NS5HfU9sRss6iWxbr44jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by DU2PR04MB8709.eurprd04.prod.outlook.com (2603:10a6:10:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.16; Sat, 28 Dec
 2024 08:57:57 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8293.000; Sat, 28 Dec 2024
 08:57:57 +0000
From: Carlos Song <carlos.song@nxp.com>
To: frank.li@nxp.com,
	aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Carlos Song <carlos.song@nxp.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] i2c: imx-lpi2c: fix build warning "function defined but not used"
Date: Sat, 28 Dec 2024 17:08:52 +0800
Message-Id: <20241228090852.2049321-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:194::18) To AM0PR0402MB3937.eurprd04.prod.outlook.com
 (2603:10a6:208:5::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|DU2PR04MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e3a26e-06ec-4e9b-52c3-08dd271db8e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LDb7Ga4KGiXyVaJ9ADm56MkUZTIDH8IDQDNBznaJbcFZ7MCViZzuUypmAChA?=
 =?us-ascii?Q?OvSn6NzDB+cZNew1fZ2Kg8GI8ixiCrvtwUZUmEqafjJboFdJy0mOwrEtm4oP?=
 =?us-ascii?Q?1GFijSr56vAYgWZ69BeGssatg91/plql7dWsltheKVb9NltGeZR7P67ktrIa?=
 =?us-ascii?Q?tM7C4+IRvE9idToxxQpBB1joYCDuxgV9zt6Eu9FLsEFnMinRXV2JQn5GAxRj?=
 =?us-ascii?Q?omu2QGb2ne3nem9+NBMmYpk2wmOCxLRvUrc1jXxzzqr7yDGrm2PgY7l8Q4/q?=
 =?us-ascii?Q?LHaCpMZ/tPlL1tNWaCAyrqZ+Ekhm6fcxGYLUqlTKDEFotPj7n76T2O9d25+6?=
 =?us-ascii?Q?FRMOS6wl01XqLvEPHraUiWWY45yNWMycPrEGXwVQIoz7zlDNSwblkeGHcHkF?=
 =?us-ascii?Q?Yfixu9wnU1sNpZjbQzi9S7r2UqiVaKftjo/MLMjbN3qHSOJwuP0YsnKUbFqs?=
 =?us-ascii?Q?MJCC1KNROdSuANww27v0XXDnTUAuh5MCcfvmUn0Bj1texu0NVfXHTSq0fcXe?=
 =?us-ascii?Q?gJGmTSYv1hVnysI3lwLDfcvYaAoutZtipccg9XZovECRRbaMHvtaGHoXx9ij?=
 =?us-ascii?Q?kDfJ7svIXe2u6r+q3Fc4Cv/yzcvh2pXqPyrBveBjac5sHHv74GTNN4oq/G0t?=
 =?us-ascii?Q?rIdD/AH0vdJO0wXBYDSc4ldWlsmOlGpHOOTgIt8R6s2/DM46zMsKxsjWm6wh?=
 =?us-ascii?Q?kpPGi8xtB4vf8PMvQbFIr/fDEmrf1KQw4r9iMfB3D6c21VQEUzjP9jAxggO+?=
 =?us-ascii?Q?iR3K5/T99RpcqPk0oj1SlhNZgeNeZqk/uvGcse74UuiCMH0+rVie1huMEOMS?=
 =?us-ascii?Q?yNF3S11cd066+9Ffm/9c4Z+tGSxZsiUCvhJZq6AqbE4T4KARCX5WBGOFKnvn?=
 =?us-ascii?Q?8Tp1MQO9TSdKgAdb1U/Jaa2CmNEINK7Jd+9Sp9WMgzk1YqSL2blujkiQGBj2?=
 =?us-ascii?Q?hPl9Y6KTJ0O+S9zjRoiKfx/X6QCKrvKDc+FXcuIhk4jXjDL7tfDoujj2BJW2?=
 =?us-ascii?Q?SILaCRkDRC4PSdadi3qaw07rOmHSzas3IELaeK2F7b4xxG1LIGtdQSbMVLRU?=
 =?us-ascii?Q?jqhrFUtQA2aVPo48D1IxPWLIhTp1PC06f3uXpsv/AY3Vzq7H0YqVgyG7eFjX?=
 =?us-ascii?Q?+B657d9MPat2MD/AjnvBjtlP4TkAMJ9GjirZpPKlgkVeKWH5N5zKN0ZpgFIC?=
 =?us-ascii?Q?2DFvBQjVVV/zw/xEMG+TQnfZXpHQDklk3euaM3rV1TO4SAcH0pEPFeHCY6Gj?=
 =?us-ascii?Q?0b1IvAMENBzHX/WA3JUUC8sHtSgY2mGE91UV+/eZO0eXAW3TPkTWa7uMZC/0?=
 =?us-ascii?Q?RaRwiPJD7rlCJPLVA6LNTfGjNV2dH028M82uKDr1RA4roOnCPiNSOXww7OmA?=
 =?us-ascii?Q?WvlWTKK4KCOfCOchZsyOIXshpqMdlywGpoLV+yIn5jcjvnC/TX2haroAjqBH?=
 =?us-ascii?Q?01SAdTvToLiTG1DyLqmxIj20WG3/yj+u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wogPxPczrapMkTSksSC51+BHnkT6Jyl3V7MkTVzsckfuMuMr3lSPo0Oq9NvA?=
 =?us-ascii?Q?8scj5UPnsIq7Z9M+TWDt5/X7L7tvvSBT5TnC83HWobPSmqKnxsCghEP+AdJs?=
 =?us-ascii?Q?BJa2rK1wO56shuWmL4Jvu2m/czY2VcQakz69/pzJgRfoRO8Pxgz3Ry/SLccj?=
 =?us-ascii?Q?TjTgXMOgCX8t6rf1mopJJZpbgVrDeCn8DApHTj6hLyNwqXa8Wl38wpyr8hAK?=
 =?us-ascii?Q?utDxFwn2cKtvSug0EjoP73KA449T8x6QTX4e+KwOTFaMffjr5P4BbmfWIYMt?=
 =?us-ascii?Q?elfX5jh2EyevfYOxxyrXE2dfAh3OthzbPKqdFAsMzW3EfcEEV0irht2xlciZ?=
 =?us-ascii?Q?HMPKuBpMnQ9w+QhblilPxDnToBQardCv5KpHBgt+KKwz2ZRuMRR0lRSpaBF3?=
 =?us-ascii?Q?VcpcRN8CDR7376HkAohoaHbGr+B+KEqhvHNDBEonPUtbAVks+xAOWVO7dAvd?=
 =?us-ascii?Q?au9OYoJQ18Oxso5YOhOwrUvv+FbhQwcoQl+MtD3fztkysMN0MPU9AQFjBJzM?=
 =?us-ascii?Q?tT8AtGO2VMVQTo0qIcJF3Sy04fhU4pzOBh/vBRBwKa8RWJBuw05FCQOkaUEu?=
 =?us-ascii?Q?kah4V7Var3spSLjtzO4Bj0XcH2pM6hKnw6+m/3NkNlXtlXjFe4jSPRmMWgmT?=
 =?us-ascii?Q?fcjnwiJpIDp8za7bfXfHO7+ghOFFmYWcM28F3iZkea1JygNsWuc6hK5aARos?=
 =?us-ascii?Q?AgFs2RPQlRWUomEmZHUuHrPeOu3XGThmdIqQxvdC673x9HpEKyKx63yse0Nz?=
 =?us-ascii?Q?v6qJHp/YF8WKVFsKNuC6qlNvkZLaS1SFrijR4F9tGJhknFYUTuo94OoqU8dl?=
 =?us-ascii?Q?5RFqRyk0Wr+5P94mh2fH6Gy1i91stXUml8fFWcWFS4sIM8qYVXPRE4bdXC8/?=
 =?us-ascii?Q?HXFVNRaIZL5ypbC64QCXja6Cb/++MmZFM60QFoPwlIhNiPo2LF/hrzGL30oP?=
 =?us-ascii?Q?TMaSkF3x0WV8LVI8xOgUBtFpk/0yykrGZsvWMpgZ4q7va9Crdl7g1ImKzE0H?=
 =?us-ascii?Q?woXKHPt0Ff1KA7XYnbQOrNd7BrKCK/Fn/+fpGUbLWS4jWGRkNuTJo6MtJL6O?=
 =?us-ascii?Q?kzyCGVEivqQzwpJuwCRWG8CH76lIEXNoZT4fFbczcuzVUU25Mcs25XQ2vgK3?=
 =?us-ascii?Q?Y4WoXHUzj+o2yhiJZyX2A/Mr11X+d8Aa51mDEol9m5cUWlF4zFQYi4Ic+QDr?=
 =?us-ascii?Q?2QdSorJuLs1eg3JZ2f1RuS4SCV50/btXR3G9sZudhti7BG2M/TRLJDWBjZjl?=
 =?us-ascii?Q?9wQ9JQdxNQByaJEVy2aoMU2XCCNBKloCchdlj2ghgtz31bWr9uFq9lud3Wng?=
 =?us-ascii?Q?tWriX9wfy5+AtcD2Z7271tIk6e2zgtYxkMnavap3jTfUqfEtcUJz0mXkzwgQ?=
 =?us-ascii?Q?8ZywmhmDb2YYFuuJjKkan8tRsJ1CgL0u1JAeNQYy7UEEFm/Rq4rwBzuk7FBw?=
 =?us-ascii?Q?067tRjn2sJIiW1/mRKUS0Z20vIoqCRo1RXQmIsrrwBamL/Hc8H9KZ6LM3WJ4?=
 =?us-ascii?Q?yvnlUeBuJ4fTq5eypJ4nvdD9Dklw4zyyL8TSYUOO8k24/3GlV91THWh9clvr?=
 =?us-ascii?Q?uW2MfVyLZ6ojhLw7ScUuIxjqQUG7LDqrprICiTyp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e3a26e-06ec-4e9b-52c3-08dd271db8e6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2024 08:57:57.0141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWip2bMe5Ri7OSYjTngE+cn0SffrTslNBx4fOwV4Py2zhcnTmPr5PVn4e8aI7yMtbt51SRK7Tjj5yjZPIyb/Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8709

lpi2c_resume_noirq() and lpi2c_suspend_noirq() are defined but it maybe
unused, so should add __maybe_unused to both functions to avoid build
warning.

Fixes: fa89723f7a78 ("i2c: imx-lpi2c: add target mode support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412280835.LRAV3z0g-lkp@intel.com/
Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 02361274fcaa..dc25d7dfe1ab 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -1422,12 +1422,12 @@ static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int lpi2c_suspend_noirq(struct device *dev)
+static int __maybe_unused lpi2c_suspend_noirq(struct device *dev)
 {
 	return pm_runtime_force_suspend(dev);
 }
 
-static int lpi2c_resume_noirq(struct device *dev)
+static int __maybe_unused lpi2c_resume_noirq(struct device *dev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
 	int ret;
-- 
2.34.1


