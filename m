Return-Path: <linux-i2c+bounces-8741-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 640A19FD20A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 09:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF593162856
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 08:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DED347A2;
	Fri, 27 Dec 2024 08:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CZpNAw6L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2066.outbound.protection.outlook.com [40.107.103.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4314114AD3D;
	Fri, 27 Dec 2024 08:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735288609; cv=fail; b=XT8nlf2ZOLCRv+V6vRpqLGyh7G+fcTLIuFu6AxeCgGRJP6w8IRgI1Jgj4Pjshpn1/lVTEfN4vKcWkk6+A/XNruTOYGyyVrmbi/gM0/7qfK8/d/f5iX8D5qh+RctP6j7tq/XRlUa4hZ/QpbMCvh8Amtkk7TnVgXisTjxHAO27Kow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735288609; c=relaxed/simple;
	bh=HUTLeLAcY1hxkHHzJsyTuqFKi2LbARX769FjSYy0LDM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=AO85Uhn969u6dbjYrPr+cMagjMxwFU8tbhNl1vDS4fYAwbWKRHyJhqK8lnAZd0IHgA6SoEilwxc+1bXFPFRTFZ84T3ix289KuNSieFvUg97/9c8X3pK2ZdPAY/Gtd1B6NxtQ4PK7+j0CVXganyi8DGNJuwRMiDD5fCEWRojjeNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CZpNAw6L; arc=fail smtp.client-ip=40.107.103.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUFB2jq9ruRQgPoVSLFSngPKmSsp+Zdnfnk/J6T7TRhkBSDu7O94IGoD0hkFp2Vsu965cOMK1oEFQdbftM8OvmAT7ZGuJ8PjCXcItzwqWsoydD06hH6xIQnh86s5iAgUvzBxToTZmCyP6DrZf/Y0CYZjnalJT5SXYnP6p63VRVgkI+HPeAn3JBqjcYjUUUBmU7N/24qie4RULe/EeOgf6L0JfQYuKhBoFEm/p+ifGXq2euqxJvR7HqzId9grjZHPLYcBqFN6U5RYw6ZYaz5QNTe6WnJrOX0tHdoJJaeH01FtaLfjQcJlxVix7lKQ92D9kZk+4pKc/jw2LhwlxuKhKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPN3yoGReuPyuM5ciF5VqarPj7uyOgBlK396WipObKg=;
 b=jvKfUXC499Y8M3C12EtBuu6t2rMmhxAscmjan8NaRVNzx6g3SwvJm9fZk1RJVj0AiwgCafMO0XMYWRZZ34HOqMzLHJ0ah/igCrdjZxqBo3h+qTou2uqL0NJ4vSSOin0UOnG4I+LVOMtRiSRhOJE9PHQAsg3JjDb9Pf9PZenTPnu3FYuwXxQbaMcnVH1p7ktcdlNtE4Ub6hj7xzbon1xk9CGwxG+/VVRxDQs6a3o2ubjjrhtbIB3hdIwbuesuZbW+IPJIvu0VzYxb9pGzyal1RKXjmLzDJk1DprBIW5oCLx4Kw10yICF3aXCVNjI1XQofkDUZox8+PIGjdQODsZk6fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPN3yoGReuPyuM5ciF5VqarPj7uyOgBlK396WipObKg=;
 b=CZpNAw6LxBsYD/bdWwVx+J2AB17lu5pIH1fgEMzWlReV6bgR0SHQInnwpG9Fu4hKajwYhcWpRISVCTyy9oq4oMeaxRFXspJZWAfr/ElYfT00tcdmCZ9zVw8vhj7DYoWrEGL5hVG6ovRdrIbB/3E3oH1h1u+jFS4cfAbM+sQoV13Dkc4IBN0gr15V6R6xcTa7K7STLIzgtIPr8P++Y57vnbIWcLfkHdmEGpX5oMrocC4DRTmWKtqf4sSCSJDEKOmYOjPrUkdD/ItRYxSrTW9kBoytJSuZob7r2mwiYXJU8FNrimO1kvq72lfv1bj14BGZwW+vMS7ndJdk49SRE/J0UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by DU0PR04MB9443.eurprd04.prod.outlook.com (2603:10a6:10:35b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.15; Fri, 27 Dec
 2024 08:36:40 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8293.000; Fri, 27 Dec 2024
 08:36:40 +0000
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
	Carlos Song <carlos.song@nxp.com>
Subject: [PATCH] i2c: imx-lpi2c: make controller available until the system enters suspend_noirq() and from resume_noirq().
Date: Fri, 27 Dec 2024 16:47:36 +0800
Message-Id: <20241227084736.1323943-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::20) To AM0PR0402MB3937.eurprd04.prod.outlook.com
 (2603:10a6:208:5::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|DU0PR04MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ad1504-8422-4b99-b563-08dd2651957c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/3fJuqdQ6QnBLBr4kmAmmu/EsM97KWp5R83Nm72lnAtM+VDlkXjKoYSnv54N?=
 =?us-ascii?Q?gVemKW4lNpnzjqAzv4zYfhua6ggc8rd2ZknFDqFhMdRHR2CDEV3DUT0tAwDz?=
 =?us-ascii?Q?A4y7xO9fgBriS0LjGoJgfcHNvgueISu9dhVzAtBf+wIHjEOgExBtoQi02RIG?=
 =?us-ascii?Q?ohQBhDO05KyaUsfYFo4aYdmOtk4ecZ9sHcMR2vkh9cBi2Yp6Rpe36vzHM5F2?=
 =?us-ascii?Q?F7T89BTiS+bLDNAzvaCAUlRjANtOoCRjfneNe/pjxw9aUqqNyfI5fyWWVgnh?=
 =?us-ascii?Q?Pg10c5QjgH/3fEkKvRKVeXsra+R9C92qS+E7f0v5OVDnyleecNWquDxNxSjZ?=
 =?us-ascii?Q?SuoJIFZIPKqXNab5hwiqiKuvRdZUsjguH6m7VwTe2WFPfCYHql1xH5n4AnWF?=
 =?us-ascii?Q?iQDNjjaiSU1Lh/VRUGw+Rc9lluPJu8xNiCenPGWidFD5GWV1WVztgvBlAAiG?=
 =?us-ascii?Q?UBPh8CLEVLrWMR1WuWi5NIfULoncP/vFQtQD95kekDG8MhyBgsuIAN+TJ1q0?=
 =?us-ascii?Q?j1uYmgEE0Yjt7UfUx3K1QPMa5ylkxljJrWIpyk1gVK4JUJ7GrR7FwpO5F7db?=
 =?us-ascii?Q?HHgXDgHp353VFuwq4RBKIUGab1QLP/L02tvE2u/f914K7LTzR9YQSvNawZzL?=
 =?us-ascii?Q?ZBA5b+uf5aJ1kCujj0/15ppcTBnYY0VflW55gjcICSUamTTHEk2CLs3foYsG?=
 =?us-ascii?Q?h1P3PH5BtyMrSxhVZxSgQgjzQ2kBkTywNia4h9kO8C2dP+li0e9GR6+gl8j2?=
 =?us-ascii?Q?NUMAC+yaO4IdwFji/uH27zM2D28agYey9dydJPlzogKMjOiUStYCRvm4ZPNj?=
 =?us-ascii?Q?1Gn80iA3O8lmRxLec4q+YPQJ1+s+IyFKWAnIDcLcf489H3V89XW4wlaSPUeY?=
 =?us-ascii?Q?OgfwEKnBB+2GyZ2OVkWupADz6DcPwLvmRJwtT+mup/JrWeSYOcWMsirvFOa3?=
 =?us-ascii?Q?gJlRN8WZRTzoj93Lzmc3Cx1uVCZ4dJx8uuK47QM4O97wj+GeQnxTMeZAtW1h?=
 =?us-ascii?Q?RnOF41T+lEW34hbla8+fXTdKJB3k35yBx38/OxfOXZl3N7Z2t0Uv8ll8N37I?=
 =?us-ascii?Q?ZZ4MFZp+A5vgRMnLtDxcrui79mf+vzvDJ2V4qw7QYogkZkZ/OZUgcSK/XV1a?=
 =?us-ascii?Q?/lr4MOhb2SrYjqgJ/cGjkhMbQeA5RTFEYaPfSYfIT9yCjIow4nGG7+/Iveoy?=
 =?us-ascii?Q?ZAb9fHps+T1kQVKqX3y68NYteLIdaqBv+/UZdyrV+IFsReCxUqXnwO66x70+?=
 =?us-ascii?Q?6Iz9J0ilqHxMUw+lPrF2kXXEomVPGsU50FyKqQWrhKH9UYvoGyanVRCC96Il?=
 =?us-ascii?Q?7mnodC6Hol5jwrulX1yqVlgIN9C3n8VDw1F8dgte04HmSOty9k90SoDYZUaC?=
 =?us-ascii?Q?PojJgXxqXmo4zhgQ1JY0Trh7Fr+Ci3upB0sUpJ8MyOfRDLooO4PW8jMwBCoZ?=
 =?us-ascii?Q?ZEMjlnjIVtVlS0s+WdmCsNADEcfF/Jh1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ewNVJP+zCcG/V/WDKPvWpTAgzFldCiigEn132Ax4XfOGom7SePDAI6NK5ijW?=
 =?us-ascii?Q?kPlfIjwZELmvNYLd5KjM9v/lza9cux4tklf0q9VQ1Am854EEU9NzfIkvCtME?=
 =?us-ascii?Q?ZT52EUIage9r1JRFsZgBa6f9t7fzvYVAwV4LWQcxdTLShlwNZVG7vBEYOwjw?=
 =?us-ascii?Q?90fLyBvNRCdvvXS2cQLm7v7JUvNV+Z9LniRR1p+EQwTqj8EDtAOuamuMFLSe?=
 =?us-ascii?Q?YkQ+Q+Ujx31ty8U5FEWjT5WkL/b+q1xV71nyVRH0tllgIWfhAy68L2QgQCrt?=
 =?us-ascii?Q?VAJFtC1Sap1rEppeCq61GmxJuD92+vJt88RMKtcPV6nMWxCJI0b4yZHMlHvA?=
 =?us-ascii?Q?P18PzN9xoZF49lP9DQ5Ake8jF1geBTmPH8aCArUNgT6M1ZrO82X4DfeqntWB?=
 =?us-ascii?Q?jB1ZAkAbYvkik3SMSP874WiNawMuYDQVTbDpcf9NrhC6rXKx7ZjDRkphTwVo?=
 =?us-ascii?Q?wUPftiEVQ9GpChSLmieY9AW1LJpEDWoyVouXjmaWf1CsT+cMZA8J/EwhQUCf?=
 =?us-ascii?Q?SkcS4uvonEqBTOtP+LdRVIwOQJgsxI2nIaZQBOeJpHZ8Uyz5KZ5L2/GtcA0X?=
 =?us-ascii?Q?99o2MTtLoSboimnMg8v4+iUKe2Oup4smhhpgT74F636c32Io4OBfWSEjIopE?=
 =?us-ascii?Q?DhMgP3yFbNgSwvjT/VhTyR4nsnBQWc4FzisDAdZZJxtlRbu74C8DqpT7nqWj?=
 =?us-ascii?Q?OypQpmRL//Ttwpux+LO+aDRR37u4g424bE5EjsnbpR+oUqYx2q1q/G7zcRmc?=
 =?us-ascii?Q?YLR6m7oONtEBe1uAFapiyPyotawHbkucmA3SKEjAV99mVekxPWDcELYKAA01?=
 =?us-ascii?Q?r7zmXDc4N3Edv4+f451wEgN8/bhEPEM4rTVZpddt5oAflNqF0LAmZJ8iCrSm?=
 =?us-ascii?Q?jPQ144xMz1rRIL12+tX6qH8OayhLNbVGo9kPXa5QpJt0qW8KNVxtTvmcjV5Q?=
 =?us-ascii?Q?Q9jWK4/9vmlOGFUxwB+XPW9m1LbnyAWBkzezaf3Hy6m1PQdjmS3LkGLg0mVS?=
 =?us-ascii?Q?sFy83OPtt2wkYGpb9Cj4VHan6SEv6BxKV7vJntcJ7JyPjEnt+P6D5rwJzBx9?=
 =?us-ascii?Q?jNw15AGZxOBZoeL9+v0WrUSeDBa4fHMlGoRi6vutNx4gyi9wcBltGU00CHXw?=
 =?us-ascii?Q?iSeudNydZtSYQc3rhcpAYJSRMdGs6A0d4qHSRlq7qr8i6T3v70dGuOLlrKOA?=
 =?us-ascii?Q?mnf4gFnrCrFbTjmBbupk074t4kIqg683UsJ4MjNV1pylttZkw4vQaBtre/jB?=
 =?us-ascii?Q?f1VW3BRxgEr40utkGGEgcGocksxsd2XbUgmrpDdOadcQdQ7S8q0Y3UXd0rjt?=
 =?us-ascii?Q?J7/5nuJ+DrDi7Uzq3mc0lZ1MbZfFVTRODbUZEWHEcHT3ApC4Y/wCfFxm3HHv?=
 =?us-ascii?Q?JIrhoeMI/j/nOarPsaQhhU6g0SSmam0EhzYkAZOYSDEDs/vB7oZTm+B9hGOI?=
 =?us-ascii?Q?YpRUc0lk/YywydHBGkUBGqOErcyvIUBkwA9XwmVgDpwD4LR/9pcS3AwO0icB?=
 =?us-ascii?Q?7kk5dpd31R/bm9ufJfbF4hs1NiUkSYdc1q8vxs3W0iOZ0z6EAASnvpS3UoRD?=
 =?us-ascii?Q?AhaZqgNZIBzS/Jvu/TLsn2fWDDarKWjfGZZblVCF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ad1504-8422-4b99-b563-08dd2651957c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2024 08:36:40.2047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJ7UIgJzp9QwfvHUjEHCq6BNdUJm+f4X81SC6PB1C84Dha1fkDNKo9zc/Jdm6jZX+HgzqEkCtrTXmVzqj2wAlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9443

This is a general i2c controller feature. Some I2C devices may need the
I2C controller to remain active during resume_noirq() or suspend_noirq().
If the controller is autosuspended, there is no way to wake it up once
runtime PM disabled (in suspend_late()). During system resume, the I2C
controller will be available only after runtime PM is re-enabled
(in resume_early()). However, this may be too late for some devices.

Wake up the controller in the suspend() callback while runtime PM is
still enabled. The I2C controller will remain available until the
suspend_noirq() callback (pm_runtime_force_suspend()) is called. During
resume, the I2C controller can be restored by the resume_noirq() callback
(pm_runtime_force_resume()). Finally, the resume() callback re-enables
autosuspend. As a result, the I2C controller can remain available until
the system enters suspend_noirq() and from resume_noirq().

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 37 +++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 02361274fcaa..62b3f2cc57fb 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -1318,7 +1318,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret)
 		lpi2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
 
-	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, 0,
+	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, IRQF_NO_SUSPEND,
 			       pdev->name, lpi2c_imx);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "can't claim irq %d\n", irq);
@@ -1447,9 +1447,44 @@ static int lpi2c_resume_noirq(struct device *dev)
 	return 0;
 }
 
+static int lpi2c_suspend(struct device *dev)
+{
+	/*
+	 * Some I2C devices may need the I2C controller to remain active
+	 * during resume_noirq() or suspend_noirq(). If the controller is
+	 * autosuspended, there is no way to wake it up once runtime PM is
+	 * disabled (in suspend_late()).
+	 *
+	 * During system resume, the I2C controller will be available only
+	 * after runtime PM is re-enabled (in resume_early()). However, this
+	 * may be too late for some devices.
+	 *
+	 * Wake up the controller in the suspend() callback while runtime PM
+	 * is still enabled. The I2C controller will remain available until
+	 * the suspend_noirq() callback (pm_runtime_force_suspend()) is
+	 * called. During resume, the I2C controller can be restored by the
+	 * resume_noirq() callback (pm_runtime_force_resume()).
+	 *
+	 * Finally, the resume() callback re-enables autosuspend, ensuring
+	 * the I2C controller remains available until the system enters
+	 * suspend_noirq() and from resume_noirq().
+	 */
+
+	return pm_runtime_resume_and_get(dev);
+}
+
+static int lpi2c_resume(struct device *dev)
+{
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+}
+
 static const struct dev_pm_ops lpi2c_pm_ops = {
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(lpi2c_suspend_noirq,
 				      lpi2c_resume_noirq)
+	SYSTEM_SLEEP_PM_OPS(lpi2c_suspend, lpi2c_resume)
 	SET_RUNTIME_PM_OPS(lpi2c_runtime_suspend,
 			   lpi2c_runtime_resume, NULL)
 };
-- 
2.34.1


