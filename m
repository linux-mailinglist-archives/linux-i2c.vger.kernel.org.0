Return-Path: <linux-i2c+bounces-14192-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD4C73761
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 11:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 010432AAA3
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 10:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36CC332C92A;
	Thu, 20 Nov 2025 10:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SBOP8aR/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011046.outbound.protection.outlook.com [40.107.130.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6B732BF3D;
	Thu, 20 Nov 2025 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763634669; cv=fail; b=g0UwX9qB2udnz9Zdfbo008zkAxRxQz0CGW5lN/bErq+m86XAJ+njQB3B3NKzOimb1Y0H1eNJzY/gs69fL0adylA504PcL6kkr+uE0CH2mqLGa+pVD41RjbYXCyt24gXG4IAu321VUWKjNLhJ0arHHMfebh28A9syngZB6SYOUJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763634669; c=relaxed/simple;
	bh=aKwofn+KyoL+2GFEnOqKJ8BxqYq/FmrSMZkgPZwbcwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=iUBB26/I+X2aKWx9okl+Y2NrNSc0G5LtcCI8bdotUNGetiacIOe9g7u1MmTatbByiSy6xoSOz9YU2v/c/MdYVjz7S+Kefi3jKVobYYBLOff9ylM4jmKW4YwJh/6VLUPlbOZK3aaRq4JCyh27Z9FIyYkYx6H9Tso/AjhyjOJykAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SBOP8aR/; arc=fail smtp.client-ip=40.107.130.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5f0UFHdYk7DdkbJ1w9w/feL9+VlFgkkVqV1rpvwHWCF+/uwBqJhN0eBbLFiicfF6RsLqGi8G2PG8iqsa43K/TFhJsnTw1Xa0owJlcDP7VZYjHTdG+mYjtoQdlILNUYoSRPiYd1xWaZhyQhqut1R4TKmpoPBZcu0UCco6EneGwEhPBnRXjA49GucUcR694q+71lo8nayowkO2RqHKNp0lETK4wGEq2qshbAcPUza7+keOkWMq/ROLHDgrNIFN2tDwnEWx7x/mMFnMeMl7sHmHur//aubUU9D6u9vNuLTEwjfzBlG6gDD7w60LE4nylhlGaBv6aAscLBVe1DnlnWfGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Joq+XWqBsP+i+Z6I53ZU6efDB1L3vgEKEAxIPjmxJ7Y=;
 b=Gfr3p+jrPKpaPsrYNnint6L03rNpe5Riy/oGF4ewVEXHmTcjEmwcehAP5y3H7E5ioOXIiwPZkFklHW9yF/trIRxjZiaTTkVzRyjRDg4elSkBnQxcO2uo1GuzX483KZcdEeCyK9qSktiqPsD4mjlgz0E7KS5MjUWf95xnSTr2i4SvpUfGgPg7ShomaTmGmHxsaaqrj7jI377eu2KA2KUli6lgju5NGnMH1HFOqd42vYutGPmxnBtaAKVZ/QFGF/+epCspbbgPzWW7fDXWt9xgXoD4GV8G1GiHS/9ARMh0aNuu9+SxkZEBcH6n7B4GQxwAHauqBTKlWb+9jteecXgoLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Joq+XWqBsP+i+Z6I53ZU6efDB1L3vgEKEAxIPjmxJ7Y=;
 b=SBOP8aR/srC4FQIAQCXug+humCdRv8NoW8baw4XjIdX8UtRW73Cq/nY2nkJcFyos9wrc6pKdkfGbDwM7utamhBmrD2ZGx8ep+ElSfrl+eqZT5gjlVQ+8IqBXTjPztd7e3hmGQ0fH/GLB3dFK1WFunE57/oyM74X6MhS4P3eeF/1ydyup5nUB1isSF8MRlzgAm+up2U7zu+E0hdaKdZhoZjtTAjVyPKLiQU+o5mvdui8A59PNbxNLOIcrZxNJQHKkSZRMm1VmdXRLM16w413046GBaET+84StyzIEwcafrTB47on2pUj2rr2+TMC81f55D6Cuu5AXSRovWTeI6FTuEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by DU7PR04MB11089.eurprd04.prod.outlook.com
 (2603:10a6:10:5b1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Thu, 20 Nov
 2025 10:31:00 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 10:31:00 +0000
From: Carlos Song <carlos.song@nxp.com>
To: aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	carlos.song@nxp.com,
	frank.li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: imx-lpi2c: change to PIO mode in system-wide suspend/resume progress
Date: Thu, 20 Nov 2025 18:30:39 +0800
Message-Id: <20251120103039.1824209-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR10CA0011.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::14) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|DU7PR04MB11089:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ca5e31-9c6b-436b-7c4c-08de281fe5a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HoORF2PwrYX4Viubo6OQk8tQ/dEQ8WdKeaVJ1ngkf+MGNBRuplfbyIlSzjiG?=
 =?us-ascii?Q?htJK4y0XfIWxCxqH1U/NCQ2nIc1xa/4jRMyz/zsQffVx7a/5+crUIobpze+2?=
 =?us-ascii?Q?FP4ovG1TqJe9xxT0Kcs+ufauII82kPaQ0A5qLTocT5C2KjnOopLK8L+qfNDM?=
 =?us-ascii?Q?rdd0C5uq5fboLwv7C0e9RPZhkBaewJfg9BZitfHoI/nIH6q82S76XrjGgY0J?=
 =?us-ascii?Q?aLWG2INjySLyZ1kJYh6rmosrOdBAyUYUDRof2zjzZU1E8ReZpmvorFxmb7JD?=
 =?us-ascii?Q?2Q0FxTFecg/uyJ3w9CdT1aGEp8UsjTYfbOVvVcS+K1ST3TpBAiSuCUX0nXk2?=
 =?us-ascii?Q?SSoOgUdWDdlHQI33ppw3xfsHfHvmgF0dvcV/76H/Y+0bjsBpNgUrXUKHrEXQ?=
 =?us-ascii?Q?QBA5jcDwUbQe6OGw1SHI37EPpWqMr9hbntc9J9Znz2qECBIEE05JuUDiVAL2?=
 =?us-ascii?Q?YCsAVJUvON2KcOwzftkvV3wefHfpCITMjWzpDKn3hPbyLH0jTD0rSojUD4ny?=
 =?us-ascii?Q?S38oaFh0ECWxGwDoeqbwd/lEGs6YHbd21s9XnnMfw76SSR81z8+iNyZAavDX?=
 =?us-ascii?Q?I0Zh4duTCPBxqol2Al6707VAI2Of8efMvRiVDRcUk+stq+DLwuZZLt38Im7+?=
 =?us-ascii?Q?eXg5YgnMibdha9ruLN9Avl3XZaegCaVkTbNNK3UlPFjoyPrK5t/me4GwuYZP?=
 =?us-ascii?Q?a/DO9AAFDDwmcu+ioB1LG3HX6oUn+qh2cYje3/kvi/Phks8IB/JoD82iJWHK?=
 =?us-ascii?Q?MrIlDxyvWw1/DabrQIFC1fOKCDHjDt7UXzBKlePP3lhrDZAzC/WUuTQYoi/G?=
 =?us-ascii?Q?mTdgFADmSeNLkQz3v2O8mJ6iz64Vh5Mq18PdAOQmf7TU0nkweD6NfdSxI/W5?=
 =?us-ascii?Q?MeQCFSGYaS9UI8bVNmuKObpEII5fuGqDOvtCBONn0MN1XyCWIIYKCh8hLUad?=
 =?us-ascii?Q?cV+YMTgmNGZk58az2YAhAgXMiy7Chuas/vi3BsxVTAIOK+9BsrZ35kgCf2gM?=
 =?us-ascii?Q?PxQO4/hbpx3xeq9coFCldD1FZQ92cEoGhxpw0maIAyyTPmu6tqvkM6yMMtEU?=
 =?us-ascii?Q?S42H26RtT9/A+lqHAPiiTZ8xWO5QQemBhz/umIYmMsdvrMcah95DNQ5uFTMG?=
 =?us-ascii?Q?H6Wh2N/gzkxLE8A0/l6q8Qa4WF9a6c174aORIP4XiS6K7v1NjWoUFhSrgQX+?=
 =?us-ascii?Q?R+zilJcR69wzirA7o7nebCgcA1cRcIcd8ny5UIMBIc2LsgxCoqYGk61Xa6lo?=
 =?us-ascii?Q?B304A8Q54dzNBcHybheHiZnrkqg8PWE8a2mnDrbc24xlirCC5EmwVn0LaWyQ?=
 =?us-ascii?Q?qvdM48VP4pBxt5sNPZVzgKmR+jP59hkRZPKE0lOZFE+NGScJLp/4ksFek2YS?=
 =?us-ascii?Q?dePbrsXpdCkwYOqfi96vjcdDqp28s3BWc6DxGbztkpW0L6cpAy8IaZ2gCsL2?=
 =?us-ascii?Q?Hhg4vqZZyB3AOfNuNEAoibzlByn+75yRdTySjahTTKjHt5Zq5588xjbSCevc?=
 =?us-ascii?Q?+q7SJERUJz1lqxoYgDfPFdZLFIfBinjMWfqi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mromIzrhBsPdWIEEuX9V7ybTAS4BmFh1D5doQzYInoBp0DbIp4QQHNWb4KDt?=
 =?us-ascii?Q?HvJotRH6+R92Hth7E/3jwKTWX0J3wfQRFKpIDOA7BBA7vKaJDKAFiaX3oU35?=
 =?us-ascii?Q?m/WinJvtBpIwP632hrkbzHYDGgFr52px9PsBXH8IwT6WBAD4k3LoQgHLURbk?=
 =?us-ascii?Q?fQiqb1oi9wVyMiVuivRlP0z+/vdhe35NoQ6G2jeiMY3NL99suYrVARs7pOy2?=
 =?us-ascii?Q?+fS5sP+j2gdr6a1welaDR5CxK3ce6w5KbJ72nLiwSUOlFVLYJ5SPiv/WoQys?=
 =?us-ascii?Q?gatDgOZjo+o5pJ/KYFuQfQeU5dxgVPBT9jPDnYu6KaLE36yYXMf+6TqvbBvh?=
 =?us-ascii?Q?0muVxYWExpnZvC8lNJIpy4gzei+hC4pKzL3pUaB8HcfZVHQigK0FapIXmyZ/?=
 =?us-ascii?Q?o0RMNmLTKj17Tz015xOhLa/tXfyDphYe3odqUFqE34wxHVWzLiabOBFVSxpa?=
 =?us-ascii?Q?YQp1nvLcuQCw4qIFTLcKBD0RfEM5SsObnc0G8Pp1FdEBBBzUE2PxhHjRv7IL?=
 =?us-ascii?Q?EcF85gd8BJEucyyNMWBYyy703CWkWqtJGR2f5eeWrO65UmlwaUSjOL9QK4fd?=
 =?us-ascii?Q?V9OXMqkgTdH5zN8H5REGzLPCEyYvmkUuc3a0mt121uYq9q3+8x+HPiS69aJB?=
 =?us-ascii?Q?lHcEQW0Mg4P1k7sRLEb+j5EPp8q8SvybuKVzG31UovM3cjjts0ROmijDHJYx?=
 =?us-ascii?Q?Y1/TzDYhOoniHUaLe93K0hMHXn11zGGitJa52MUTQFxmVQWzBnjEt3+nm8R6?=
 =?us-ascii?Q?nhLMH4tEhdVlk5NZ5GhIwwGtJTvl9c8Lz8cAOICCjhefwVGhpCI6FV70jLJX?=
 =?us-ascii?Q?Sa14FGiGicP7rb35qqY2wAHCdlhg+SK8fj69hQFi9opf2XB9X+LoExDrfOa/?=
 =?us-ascii?Q?1o1Zr1jY63BXcrg267lwUmET2TfGFO5EhOU0pdd8Cwa1hfyZV7b/1YXWPcjq?=
 =?us-ascii?Q?HQvg31jbmMOy3IqRJrqJMRyWL85k+dTVxgwjztPkfyASv18H2/3qqG1/yxVG?=
 =?us-ascii?Q?WLijuRx+1v8DJnsdl6eKVrercwR57zNFxFWiz6T61jist7wt0ja0nweYlBOG?=
 =?us-ascii?Q?QhavCCOx9JP9sF+b8DShGUfXpvuNYEuql/q+wHBPzIUAstVCuyOZmtBsDQL+?=
 =?us-ascii?Q?D0tTm6JsWLBH/YdvOpwjYeQXAXlMFyvGuczqVEkfJUPJLHdjIAEpihgPQpTp?=
 =?us-ascii?Q?uiiM/9aeN2yYqNhuGscpDgBZMhnlbD/603sowZxgVh0dGWWk6ukbSRAITp87?=
 =?us-ascii?Q?BKasl1MsYd/kN6XITZKuJ0Zi4updOcBFBoGfRMyAAZ35U8zceJ9I/dGaGqtC?=
 =?us-ascii?Q?1YXywP1R62AyKZeFr5nFcq98cFs03ynVaWtwDXPiMsCTMhAgBCCZPwfnrjjY?=
 =?us-ascii?Q?HCOtOyIaokP/4tehiSTAqSbIB9xKSXvaMpP3SHSKdYh9uVC16gET3W/qcmXL?=
 =?us-ascii?Q?jWvYtazvNuo3jt8h5HSLYVgbs0cj7sPpFvm6mHXWBvT9GNEfiSk1LVhWzxFQ?=
 =?us-ascii?Q?wJfs+U20+Qg5bFowrV8uyNGiQIMO0+R12CgVC1Sfj6ciPtc/X8+Kx5x7r1e3?=
 =?us-ascii?Q?U/TcPB7o12B/MYNZYyj90Yewh/c796NOF4dzFWfF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ca5e31-9c6b-436b-7c4c-08de281fe5a9
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 10:30:59.9571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZATkcZ1EazQsWon7ilzmsfKFPyJisB0Pd8t/Kn1u0dK0/NchqEbhBmuX7cMzbf3F3BQoScgd8F+dK/mu8bL2EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11089

EDMA resume is in early stage and suspend is in late stage, but LPI2C
resume and suspend are in NOIRQ stage. So LPI2C resource become ready
earlier than EDMA. When IRQ enabled, immediately slave will trigger LPI2C
to read data and the length meets the requirements for DMA usage, the DMA
will be needed at this time. Within a very small time window, EDMA is
still not resumed.

If a system-wide suspend or resume transition is in progress. LPI2C should
use PIO to transfer data not DMA to avoid issue caused by not ready DMA HW
resource.

Fixes: a09c8b3f9047 ("i2c: imx-lpi2c: add eDMA mode support for LPI2C")
Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 2a0962a0b441..d882126c1778 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -592,6 +592,13 @@ static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
 	if (!lpi2c_imx->can_use_dma)
 		return false;
 
+	/*
+	 * A system-wide suspend or resume transition is in progress. LPI2C should use PIO to
+	 * transfer data to avoid issue caused by no ready DMA HW resource.
+	 */
+	if (pm_suspend_in_progress())
+		return false;
+
 	/*
 	 * When the length of data is less than I2C_DMA_THRESHOLD,
 	 * cpu mode is used directly to avoid low performance.
-- 
2.34.1


