Return-Path: <linux-i2c+bounces-10505-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11725A94C6E
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 08:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E405A7A54AA
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 06:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044302586C9;
	Mon, 21 Apr 2025 06:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nFNcApig"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D257F2905;
	Mon, 21 Apr 2025 06:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745215932; cv=fail; b=BW+02K7/6L9mYPu5wPE9675ppFiBCY0MYdm4r4rs5m03jlFLSVRcCZeuwjax0qa5DfaJT1i97HsBxyUL/X7I/1KYOdKhGkjprYxNocVcdyQBE4UIegLEl9YWHdAGGxmhdPz3bA9HynvMwEQIePJQkhDSE3E7q+xvxhoC7rVdG+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745215932; c=relaxed/simple;
	bh=RIrjpxWaAi0WlY5UkMm2ca1Ixyw5O/DEgg4rSMyLM2U=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QnBPM8zXeiwpfD5nIohHu+GrOa6Tw/UCStCN6LOjrn6b5pJYomKhL+K2g1iqXVIBbpuRJsm7VXUhyyVLfsblT2L5bakuK2Pq53wFyEDZJDw285doIuc9wzgTJ6mTHkNylj1F+E16yrxdMkVCmP3JI/gznMVKKI0O3oO+OqaOKEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nFNcApig; arc=fail smtp.client-ip=52.101.69.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdxWz5CL3JHDkoF36gIcxybWvd3TSetaPeV5J8Na0AAYYeCoA/9N1H+u3GilwNf59RJzDaDuxKgCj9JE7vhxlWTHrDkQTyP/PGzAtUNIXeo/4jI1w8hi6m8LU0BtJ73D63Xfq1aO6Do8vxrX+u/KSowAxy4APmfJIm3tznWz9TUyiFD/1QEDE40EYy49xYxaTEES+wYnm4yb0N1B6lw5sJiM2JSaGhzJzhCuR9l735NNH7a/JRQ/aTZq25kVq8YQ057oAcyr6bpaQGepjU5T0VxZxj6vlt/AURN1K05emShMx6jLiHffP6Nkci55EFT867siFp5tA4isVyS0zmuqdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lGe0nxLKI7b9YDpPNtIuaOOr7GJGuQbNH3rKg8df50=;
 b=CkBXHoOrD9+fps5wU1SMmFIZo4GtqOCMtQq1fOjOGKaE6g3HAfrfS/aDyfNkhotFgNGS8VZ3POpI1qTbVJf5UDFCjlHCyHTLWwR8HZIQU1w1QzxMJcME+BjI3I8yiL2DSWqZuWxLuBFRVEL431VqGMsM4HOxndDYktEZI8sy9iCXkBK6Fb/ahTC3fQx4aGHQSaVobK7LUIubV1gHaiGq8Kwha3Dnrn5Me7NHo/cdPSLkgLGNmaRCkld+3udwgtkje78GuNqMe3mxvkHOLR7ZU/CFZDDH/8SLqppMW++eJT0MHYNzeXpr/FHruHOKHLYc9XgoIviVA+x4Z3A2q034VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lGe0nxLKI7b9YDpPNtIuaOOr7GJGuQbNH3rKg8df50=;
 b=nFNcApig+zPDLXdDa2CmhvhhDqWkJe3YbUXBQTEDo1dGns8lfRBY0hl/xH0ctZrU1m7lY5IX6+TK8U+y4XKJoHReWgtXaCWHAzDdH8Jpu5PEUawsio9UBvgQyiHV2dfQhwZK77df/ULgk3areYrFKcxQzXd9agw0sBeH0kaJAmYIqVCXsdOZBSRx+tmLnbbR3w395cyI19x5GvHOzIUh7EJKcCKP9BCLcbGv3aLMEAG2N/IsNJDWhSaPADYo10jdwnmYvTYx8vUeLMSYeiuVkbk8d8XiHEsLAeA+FGKiuKzxnKI5jmtmd0jvvMkS9e8TPVGJLSrX17t1qchSKkNNeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by AM9PR04MB9015.eurprd04.prod.outlook.com
 (2603:10a6:20b:40b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 06:12:08 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 06:12:08 +0000
From: carlos.song@nxp.com
To: aisheng.dong@nxp.com,
	frank.li@nxp.com,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: imx-lpi2c: Fix clock count when probe defers
Date: Mon, 21 Apr 2025 14:23:41 +0800
Message-Id: <20250421062341.2471922-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0234.apcprd06.prod.outlook.com
 (2603:1096:4:ac::18) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|AM9PR04MB9015:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bfc686d-5c59-490f-1206-08dd809b7224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h1/O6Fs/WftACnuOCRZ7ybOvL65eRktAc4w+yd4BKB7u/VgB8xkZRnh+s3+S?=
 =?us-ascii?Q?ynlh8Qm8PIV/MyxHHJkFzTOejUJyj4gkoJJomehEMeV8Vx8KxHl6pZMgMOaO?=
 =?us-ascii?Q?OBU0qv0YAu8GlxsU51F+527agoDOH10neUMJRrExIcS0iQrRqzTcg4XCB7xe?=
 =?us-ascii?Q?cIpeE5B/asQCodDIryoipPAHIG4CJ01cB9opSc6TXeNSN6IbAdFe2NZ0K+eT?=
 =?us-ascii?Q?kqe4sWDNqt3k7Io62EFDw0FRe509kLeEHTx7aoEaryxkLdXTNZS8h70axRRO?=
 =?us-ascii?Q?qXA3drme7IAgNHFc8K5u+4HhO8SKRTEFBa2772tXJAKIxtEz8yWn5S1/lQo8?=
 =?us-ascii?Q?JD0GhHabF2LfvBLI8fRUjrwohYlfCTwd9ACbsyx//Qc8pNlolsXYIkaItwQd?=
 =?us-ascii?Q?8jVZbflRS3oSadVtiQAXqFpAYAl7m8PqicRFD5cDCIiLnxktBGw1jhrart/k?=
 =?us-ascii?Q?eavAP2q2i5BN+BI6baIw5qqviYnC9EZjbcCyDVxq29qnMpCqdPqBjQfLwROa?=
 =?us-ascii?Q?+Ga81pbJw81wDDpINYG6jVbcBM3O8TCloj4pq0TuIW3HDTUYOmQoTYKU8jiL?=
 =?us-ascii?Q?m2oMgKqwPEa2GmJPq+TSJElsvh4vrYNnL9xSvDf4viJUOyHzAQjFY9adJXPo?=
 =?us-ascii?Q?omb7auftEdbAriOl2giqlVAJfBB44JT+HpADcy9nGgL/L9Mf1Uh1IRELF93m?=
 =?us-ascii?Q?mHIXNATbl94qgh7xc1Q8T8VX6wIJQZ/FYUO6T6iAr1o/Ba4RN5AxVu7Vq06c?=
 =?us-ascii?Q?Vaj97W0hK4crJIGgcuVW/V6uF/MabTNh7D2ir2Q70qopIQ1Lretjob2EI5ST?=
 =?us-ascii?Q?ItzSGvanqZ29NffgERwl8K/clBipJB/SXdYrnyQkH3ab2MuItSbzRIXJK5YU?=
 =?us-ascii?Q?7UgI3iPR4cd5/9ZrosoDuZEcCNbU3f1iznqDj5U4unOGZQjUhRcjDYsnqG/0?=
 =?us-ascii?Q?vS6gDpRAxC8bVmCB+URt8LprPzXeFp78fHrSCruspL5dywzKHyKa9Jsor7SW?=
 =?us-ascii?Q?H0zU2BYoDGQIx+bOUci/vAJAd1DR9Rfk2W2R7MI+22MHKNvmJosoho83p1vn?=
 =?us-ascii?Q?/qQSYytHpj0eGl9H+vnHtaLNR6rVLUKVwFaUqdIxiuHWdQAm3/cgjqOjA5pz?=
 =?us-ascii?Q?KS144m15rCxON1tc1PJ8woNmkpOCOkezJzxJz/fPEvpThTFPUPYM09hRcGts?=
 =?us-ascii?Q?2GsH6lU9YGjr0yRu3PvcnmgI4hEcwvWSn2Cbm38VNCpJpA9RGIGNMmro7WAE?=
 =?us-ascii?Q?w0IEjFy7CefzH+uK/9a51kEfv/74viqLykFrx+lvUJYWoTtORadLs0YbzOpA?=
 =?us-ascii?Q?uP53fKNmNZnGbG6Lp1IlzZmldo5zo1yeGWPrtbSwhn8C0EcgLBbBXnAqOfn9?=
 =?us-ascii?Q?rWFcxkGJGg+qh9IAQiqEyXT58qfQX80vsKWwwaDvjumx2lJGzytUVZqBEk6A?=
 =?us-ascii?Q?Pmc94xr9+ZG+AVWVQLIK8UUddHwcZoRL1gLgX3BPIR0vFdQprzVSNmOJg4Mi?=
 =?us-ascii?Q?GOmIe850V2sq3Hg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rzr37+gUfJ2koXEVVM2JWVc6eWMpn/QEcRYPow0QppYc80L3ZIrJ/Vze1sfS?=
 =?us-ascii?Q?SKFq2h7E1nChmn9ogdhmJhx4PQCiZdVAJZAU3eqdZJuoqgVuGY3bbj+8KPso?=
 =?us-ascii?Q?yjyWQeM+zczuMKLh3u3d6dGh9AdHi4lEaheO4kwY4Co0ssI/DC4awM3D1FAT?=
 =?us-ascii?Q?XWTRpsPkXYurItJ2yoGsx6ILYum84H0aS9aUFn4ERu7gBfYqpBm/MpELZfJq?=
 =?us-ascii?Q?FBt0D3+HIj0hY+82QKoJgnNmU/9bpZ6Q5cOWtUQa1DAOFh4yG08qYjSp7UtC?=
 =?us-ascii?Q?/qLVMM/14ZisnsggM4Prid47ETsgu+ZPOl5ByRS6Y4IyKGQ9ODc82imaIBcH?=
 =?us-ascii?Q?HprC9eSbLKdN25Y0icA5mxXUXoiq5jRyvhzgC/mApf3IMJAhEhoQ/kEbvzFZ?=
 =?us-ascii?Q?GM2whShfHHM2mv9obqVGreiD0DS2/7IGEbPYmhzg2V73fGAEF8CW8zYN2Yip?=
 =?us-ascii?Q?BgDWIRIwGN9nGz2XYHe4GRJhHhqHJeKu1eO+KadjcXxuLle0vVDYwjPP/kRp?=
 =?us-ascii?Q?6DdgW/1wh4flT/XJ42aTjNffMif0MVWhFpkTyBZ6lpyoHWPh5qvESBo5jUBd?=
 =?us-ascii?Q?dOi/j3qus2hbFbZCZ5eBDYTR8cw8hyyDYLK5x3jQp34L5XXkBmtKTSsS8iup?=
 =?us-ascii?Q?G4yaaS440yIH+hHBeBu0AZ2Ks4UzbOlmxf0wGK/3HAfLdYXEOp18AqeyRN3M?=
 =?us-ascii?Q?dKjFybaZ75FMwI2ZQZge5pUrRX7DgdQZtsdAbm4HDErVPpHai1lVzyu4LQz+?=
 =?us-ascii?Q?3n7cEXzvPJj9mN4Iao2vYwt5AiRD1m9WUw6HBNultj8+J6i01dh0xkgwPa4x?=
 =?us-ascii?Q?qaCThSkpwfq63CSVtHmPcGfxPwVgSevMJzNSrw3NCf5dQZQYV18xRCTXNJzL?=
 =?us-ascii?Q?fPLWRSGqvtE66KOwKun+/CM14b9GeV2tz3uNMGHVPkaVERBR9Srpl+dYxI0v?=
 =?us-ascii?Q?YqhdwJIdZO67OUnQRshxjhHiFt3gmNzq4VDcP099m/V1R4EsUpLLxwQBqIjb?=
 =?us-ascii?Q?P03H0pR6wcZ4LGhRFk1XRZ8B2Twc0H+kXIak0SBkN6JK/IZit4T0pxCqgZRk?=
 =?us-ascii?Q?d3gKcjqRWrqo0wUEhur1CZ0mQmTgKaeWOQCDsYbebNCHFmtC48UftobnSbqu?=
 =?us-ascii?Q?zwr5vl1aVY7dy9EI8CibJqGrSNd3Vfan7V1u22dNwWrXkRgGcp2Lgw+EHXOF?=
 =?us-ascii?Q?Ti7PxwlPe9Gp83bzFexdDmKD+33PDVrSmTvr4ivi4pHj0VwISlqLh2vhjTNs?=
 =?us-ascii?Q?c0EnghwcnZ6Uh5lp0IHLFT5EkbeyGmrkpOiU4ce9zL9Anys0TD7zLcHN+UpF?=
 =?us-ascii?Q?ceXpYkNDdKDWbFDX6c5hhC4jqe4uQAUHA8JOhGAZr18Ikz58BT0idWaJYAQh?=
 =?us-ascii?Q?muN6KxkUQR4KtCxcbij6lXYt/8sOKok/pRCSHufH5MtrmIudCjJSVReYRLOt?=
 =?us-ascii?Q?JN1z5DvIEFLwTd+evb8+mYSF/dPLQcAvNPgXMwH+Bj+ctFg7INAGu5IuOrwm?=
 =?us-ascii?Q?GMhF0z+aTledWCGmK1lbNO6EWHsFmQbTHQ6qfEcziT5FmDYkMq+cYoTmA02o?=
 =?us-ascii?Q?j5B3qvz6Q0nZOy65IQ/WBS09GWB9ldd4gZUkPXna?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bfc686d-5c59-490f-1206-08dd809b7224
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:12:08.4126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KSLfqinVmCGRQl31n2NaSEO2n9p1PxdaIpE+CeSkynlM3th+P5Qn7oYp2gzJnlZTchCc/pFe92i9eWJM0tqTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9015

From: Clark Wang <xiaoning.wang@nxp.com>

Deferred probe with pm_runtime_put() may delay clock disable, causing
incorrect clock usage count. Use pm_runtime_put_sync() to ensure the
clock is disabled immediately.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Signed-off-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 0d4b3935e687..342d47e67586 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -1380,9 +1380,9 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	return 0;
 
 rpm_disable:
-	pm_runtime_put(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
-- 
2.34.1


