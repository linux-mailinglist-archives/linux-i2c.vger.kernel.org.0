Return-Path: <linux-i2c+bounces-8814-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B9F9FE23E
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 04:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DD687A11A0
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 03:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29971547F0;
	Mon, 30 Dec 2024 03:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eo9zR+/p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950DA1F957;
	Mon, 30 Dec 2024 03:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735529275; cv=fail; b=AuefLj7V7DnfMH2xlMwT3unyt9vtFvgQNVhWPaR5ZMdo8+0nE/VY89tgQijZvVjM2KgOigBSBOPAXzqMmV4kCkSwXC8uOqvbSSdy1Bi1M2ZdvnIcH0KM00PKc6tSkKTmdp5Ha4QA4Y+sE6clXKeKD4zSQeF7EiWc01SiOpRHZa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735529275; c=relaxed/simple;
	bh=pgvOVho9zsSZrIOGrZWHMufxuDrw/08FzhbzWOXHqXY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=R2c1j2sfLfvruVy0EDR3Xjf78SJdJqJK1kdalVlnFFwQQuYXiuHsLDFm4tIu/IWdWZrduCDqki/tT7ob5SHBVXWeAcknn8dH6Z6ULKb54fr14Z9hrJoOXyCNndyQU9k+aqSGRvbhzejHKHnpuMPpf3+Jwcjn8u1/zPTKifkTZbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eo9zR+/p; arc=fail smtp.client-ip=40.107.22.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQpkzxy//mh+L/y6d1MJLc2DM+TZDCReyRxei3OOrVcFXH7BPMsO6OCWsUqSkuzc2+4gQUXQD/+/iBV+Ihkm4g0ahryhmfUUIWj6uJPvyd4Exrg8WJHKycG73TfWJwbPh4F+O247h23OWWWsCDrmF8LKaIup9IYQFex9QsBazZvpp6vCSvC4rZ9epue95epTOsqKLjOZtqTCn476qwXgUTpxaGFSP1zTX5f2uX9nquTV06dRctMp1XLFL/ax8kAndXaaztm9Nu3BT2XvvuFFDB2bK/pCAcPYgvJZlzzzzjyFapulin5mZyx2i/LRLFKL1Z3oIbBMcwH5Nmc6uIvzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvnlrCDbp1vwxe7jXhtnT5AYKGJDZBA6xKqwb+x/mwY=;
 b=Z2Q0YlmqMxEwXpAqneGtf0AOC6J/Z6gxhU52FK87X+VxVsNMdzRopZSpjBmrD99JRu7haXsgBWDie/Jr98RDcU0guAi/pOR7NGkx2Wpbl3/aA2AYYYAdzg7eBUDPoI84VtvE6QODJVZKTiSUFn22DPkjfp4JHo0caxUfCE5lGWIcKJnYmmgoJXKndCxggV98S9T5eFV4FN2W8KB9ho1udHCEw0koA8oUuojzNEqRPhO8embjqmn9a6kOGCsOjDVz8NahKpEpJBJUqpHMyhrVgSdz7/aXn+YBHuHYj4JKdOE9R8xM9TtEVdt3ziAi2EzjTSFuoif+8yIGrXh7rNforA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvnlrCDbp1vwxe7jXhtnT5AYKGJDZBA6xKqwb+x/mwY=;
 b=eo9zR+/pTp77EuHb0eymJGNIdzvwcEycB45zP9q1v2aQHWZysxDKp/bkE+IkvhoO04P4UF2VdkM7MyrIZ9HwVKLOXh3dwdokvg/7VcV9KNUe1WZ4QBFMht/h3KkykYJPXcZ9JQntHwjmMwvb/stI2Gym41c9qu7TruasKvcpwAcUbin5GRWllzUJb/m2BHuPQXAAXDidG/ZfLGpneLnuUmsCDTP+Yw583HZxMkj4jg6xTXxQ521TDZn+oypUnptHGkqiFfAcXf6a2kcC8cjISsu/Lm1i3hA3DF7CFiWV0XJSbfUjMeQnG9IVYBoDGai0IN+rMng26L/MYhxHrUPeUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by DBBPR04MB7707.eurprd04.prod.outlook.com (2603:10a6:10:1f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 03:27:45 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 03:27:45 +0000
From: Carlos Song <carlos.song@nxp.com>
To: andi.shyti@kernel.org,
	frank.li@nxp.com,
	aisheng.dong@nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Carlos Song <carlos.song@nxp.com>
Subject: [PATCH v7] i2c: imx-lpi2c: add target mode support
Date: Mon, 30 Dec 2024 11:38:46 +0800
Message-Id: <20241230033846.2302500-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::10) To AM0PR0402MB3937.eurprd04.prod.outlook.com
 (2603:10a6:208:5::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|DBBPR04MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c9e3de2-e744-4f5f-021a-08dd2881ed13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qPpNZgKN9F/C/QPoTo7Kil+iJvZWJL0cnZf85leK6V3PQ1HFYwF5T+6PkoL1?=
 =?us-ascii?Q?IdVoT7Wf+N77JElnjEeb8SR5HtRjnRmoLNKz9+BqhIAh9MxNIBOLPWayyC6m?=
 =?us-ascii?Q?7+ztFIzd0EAVSk3+TwS/n+5YOop4abT3YBZaPa6iKPU9cDIlapUm6wgoBtSS?=
 =?us-ascii?Q?2SXviAXGVbK4rExX+nitUh125SgRt4/3Q8SRn8QmrD8JB7fx2GHEs0WnAPEW?=
 =?us-ascii?Q?TNT2s481pLhMgecgU/zOR+P9KPMKGb6dcw3rLfifhbPd4tTUmadpBl+RLHhJ?=
 =?us-ascii?Q?yI7F0DUWlLHFb2NhQf2PZlPnJ2jRzZ0SgtHqr7lbOp7QVfGfojbFIZHZSbyz?=
 =?us-ascii?Q?WuCkqAD+6IKhbMqG6YuMzOUm8uGySaAUP9FZy/tfDoS4IE44R1/Gqi0ykJ31?=
 =?us-ascii?Q?e/27+HDtM28YfxlqYk0QseQ7yFQgVxu52AeeeI+oqgoPW1gqtra21t6MHW2C?=
 =?us-ascii?Q?v1EV8cFWPzaCy1kWsaFOl0f4L0CCuSdHTWq5wrQyO4X7WgWvUKfq701opEnM?=
 =?us-ascii?Q?DM4U8gLgjrf1UNFV8nqYRTUn09WFl3UiIujZh/Vqhj9U1f1TdXaW07I4JyDY?=
 =?us-ascii?Q?EZcdyyepQ5XAYQ/7DmDGPIVsDEatdbqi7CA1IQINR267pqDBHSgPRrM3xr5Z?=
 =?us-ascii?Q?I9vBWCUgaq3OUbp7Zo40ydD6rsxKuvBWPkfrGY3wLVJeov1OFQaMd72cxb7F?=
 =?us-ascii?Q?KvFw7q8JZEHud3VZf8DBHOQiTCZNO1XY2NbZV13mgNI3AM6r+mdTAKi570zv?=
 =?us-ascii?Q?olw77Ubj1Ba/Ec4p57bGylnDmT1tctQe7vAOeBwu0osGipUbTTg0aZvX2uEk?=
 =?us-ascii?Q?NFhnYIj068ZlEkEF/cgZigqjESOC/9BrDTBTjmh1pflG+nYG8n2uqNQ72A2/?=
 =?us-ascii?Q?39uOi+G4DvC0oML2HDoLKnZBtIdSO7PyMBLpjZ3LmcqY0KZ47AhtBiuZVHAr?=
 =?us-ascii?Q?k8yFWNVGw7zxHwu+69fpySvJ+JvjM7EgZgZptXWPWT/pLkXmrAuDbFVDKyyL?=
 =?us-ascii?Q?4YWl4me1PWENcHqalNkcvxS0tRlsq0hpgX3vJbKxvH7LqXXGaB/5DZNy3HtZ?=
 =?us-ascii?Q?2dZOO2bDY3LeJU7M3OJY23anDK08eCPSoZMzReiptpYls9GnELrO+RwoeCJM?=
 =?us-ascii?Q?a5yM+fS9lSdgMlpab/BRNU/M2huK30qqHgpd98dA66+WhWx1cdvUaDDgStyx?=
 =?us-ascii?Q?7Z+j3pgxKfe8yglc8vQoPTY0CWVM7MZlLyMnP8+Y5lEfltNtaCEkl7BJmgRw?=
 =?us-ascii?Q?ePy+vX9tIdTh/CLJ9vVWdbl01+gzB52HeOXaOYV2Y56pVKJrsX5jVagPbWLY?=
 =?us-ascii?Q?d5AYs3UlsY1oEkWLjOlDmOKFW00sBxr1tmQsBW0i2smxjvspl1zjhPqZrDnz?=
 =?us-ascii?Q?9TKu155WrTE5zNOgIt3eo1875LFSIPyT5O3d1NnK58qAfZEt3Mb4gjZpO4Lm?=
 =?us-ascii?Q?M+Xv8diq5uQm83dnWmwj8Eb0rivGe+NP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C1VSiQDFb7f1bo2c26iJa+9QiJXM5r2BTE/AF/NyOaa7eumF+wzpvVBjHBP9?=
 =?us-ascii?Q?VhdABpfLx4XfbIvugCfQboOxgONSMMWtMDHTsVMnrO3gXJ93DgYFNtDZmxRx?=
 =?us-ascii?Q?yAOBORAlGcK76bNh4o61pYLRtczYQmJrmKF5mv7SGErl5sOE2mX5mCLEw1Ig?=
 =?us-ascii?Q?uSARUqYJrZKv03CvqlcS2kjh7tPJwE63akR7AErzoMsgp9IKKqc4HWuHhUTW?=
 =?us-ascii?Q?dDKRrPkbikth/v9vUOZ7hUKE3hhqppt5htPU9ok2LnMXahJz17RnRl0U/P6N?=
 =?us-ascii?Q?2E3pqYW1rqINE0hI247BXHSYauHxLxPW+1eUt1DvivRu/ZRxGYtvFtUKvZw9?=
 =?us-ascii?Q?Z7EURaX4Z9oBosiIPfEm3utLIVOG9eQDSHXLK7mCYmIToMqL1qlTadfXAZtv?=
 =?us-ascii?Q?E2lVGPJVOQj5wyJASKa823FAxC5fJfoYtXvECa0umygsZJvgygox37uU0q0W?=
 =?us-ascii?Q?tu4ni/dsxp0osO9Max8+gTFHAy9P/7ju4DEA0Qd52XHZFWYTYEmG0sxb0hk2?=
 =?us-ascii?Q?nLQWhnl4rte7vuoV8HlyrkiuPsrfxNxOmxuVzpqPg9v9p6X/1wg+t306U39+?=
 =?us-ascii?Q?8c/deBm5vmox+ip727Om7ccjRi1HerYgbj9uYdFFhv/d2NEUwm8zv7UV1XpU?=
 =?us-ascii?Q?CRmJJ3bBdwMU5RWVi8OYq81x7rCB+2rVmelNBhOFoR78DAscPc2+th45nvAB?=
 =?us-ascii?Q?PNdlTr/yQC40Dgd6Aaj81cSP/eHpKbS4sI1fLZ7Ra3R4ArD7e6Cewz++tWz4?=
 =?us-ascii?Q?SQD0EcvKQtXBWPuXvMc4l4JxHktkeOgABqwHu6iIvLpQzwAXIACZ2dj7oXAw?=
 =?us-ascii?Q?1EsKL979456TQ/NDvDHRwLFRZdpVv1Ma1uWbOirOkCZsslGZxGeU99qgZ1h4?=
 =?us-ascii?Q?FRVMkTYvfL9/PagAOk7XXT1/3Q+Vn8YPym8MVQpc2qg6BNkXZe8smuhsqZSo?=
 =?us-ascii?Q?uFOaxPsjnjPxO1XnSJl60RMthGKG4f8PU74ywHKJVPEcdcoPgEhRka53SVLY?=
 =?us-ascii?Q?Uzhgn340jfBQJ6Si/GistTaIqcQGBJAFGPtspiY00AVwdcZk2RuY/khNXgvO?=
 =?us-ascii?Q?45/X9Z5aCOig+V8s1TL+Ha9OJ0hYz9FwJDIWpYMxpeyBmet5fTSgtV398pKF?=
 =?us-ascii?Q?/1FfnZbOhpMnbMoDNASc7jMQWS6iADck4wNkPoBmCenRHepr88e0seGkWsEL?=
 =?us-ascii?Q?sy8Ynj1Cvg/pm0C6hyrMZ73xOajoN8cozs1VnkgLi7fBzhdKprs2WdEfjdyP?=
 =?us-ascii?Q?wnhLUcm9LKz0g39JOsptCUcp1H18MVx+7F32s3gDkzGMpppgLd7obGYiTR5K?=
 =?us-ascii?Q?+5am1l6t/hV/NrPEVvddDyjI37QiQnXQGaVz3MvwfsWQzDlYxVj9CFGs6AsW?=
 =?us-ascii?Q?GXdDzzhDXHONwX/LQrW04MZvAkvMbi4Iq20YhZcGZQTI4Ae6AP25M1xGFrwk?=
 =?us-ascii?Q?ZthCNf2XsCSSN5jvslr+3y2wHPhtS9lk4cPS4/2/AW8JsQq9lql7mWIDUOVO?=
 =?us-ascii?Q?MzPqulvIj+GQzCB/2cm/xtQcfGMjumMCpGaNd7ephUZKdd30kGqrsLFIgHud?=
 =?us-ascii?Q?hpZMJiRys5teDc3xsIVrj7Ev6PgEXheio/C3qj7r?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9e3de2-e744-4f5f-021a-08dd2881ed13
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 03:27:45.4142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ytPgJWL8MPYuMwC8/xQ27xNZ6A677cCwtusY8x5FjButHh3jFOY8V0ivOic/Rl7gQU3+QWCivAv5VyT5qLwVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7707

LPI2C support master controller and target controller enabled
simultaneously. Both controllers share the same SDA/SCL lines
and interrupt source but has a separate control and status
registers. When target is enabled and an interrupt has been
triggered, target register status will be checked to determine
IRQ source. Then enter the corresponding interrupt handler
function of master or target to handle the interrupt event.

This patch supports basic target data read/write operations in
7-bit target address. LPI2C target mode can be enabled by using
I2C slave backend. I2C slave backend behaves like a standard I2C
client. For simple use and test, Linux I2C slave EEPROM backend
can be used.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
Change for V7:
- Add __maybe_unused to lpi2c_suspend_noirq()/lpi2c_resume_noirq()
  functions to avoid build warning.
Change for V6:
- Just notice reg_slave and unreg_slave is deprecated, so change
  to reg_target and unreg_target, no function change.
- Simply return pm_runtime_force_suspend at lpi2c_suspend_noirq
  to reduce some redundant code.
Change for V5:
- According to Andi's suggestion, modify commit log to align with
  driver logic.
- Fix syntax errors in some comments.
- Change function names to lpi2c_imx_unregister_target() and
  lpi2c_imx_register_target().
- Using strict codespell to checkpatch and fix codespell and
  alignment error.
Change for V4:
- According to Andi's suggestion, simplify the code, fix alignment,
  remove redundant definitions.
Change for V3:
- According to Andi's suggestion, enrich this patch commit log.
  No code change.
Change for V2:
- remove unused variable 'lpi2c_imx' in lpi2c_suspend_noirq.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 251 ++++++++++++++++++++++++++++-
 1 file changed, 247 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 9778dc8f6d36..dc25d7dfe1ab 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -43,6 +43,20 @@
 #define LPI2C_MTDR	0x60	/* i2c master TX data register */
 #define LPI2C_MRDR	0x70	/* i2c master RX data register */
 
+#define LPI2C_SCR	0x110	/* i2c target control register */
+#define LPI2C_SSR	0x114	/* i2c target status register */
+#define LPI2C_SIER	0x118	/* i2c target interrupt enable */
+#define LPI2C_SDER	0x11C	/* i2c target DMA enable */
+#define LPI2C_SCFGR0	0x120	/* i2c target configuration */
+#define LPI2C_SCFGR1	0x124	/* i2c target configuration */
+#define LPI2C_SCFGR2	0x128	/* i2c target configuration */
+#define LPI2C_SAMR	0x140	/* i2c target address match */
+#define LPI2C_SASR	0x150	/* i2c target address status */
+#define LPI2C_STAR	0x154	/* i2c target transmit ACK */
+#define LPI2C_STDR	0x160	/* i2c target transmit data */
+#define LPI2C_SRDR	0x170	/* i2c target receive data */
+#define LPI2C_SRDROR	0x178	/* i2c target receive data read only */
+
 /* i2c command */
 #define TRAN_DATA	0X00
 #define RECV_DATA	0X01
@@ -76,6 +90,42 @@
 #define MDER_TDDE	BIT(0)
 #define MDER_RDDE	BIT(1)
 
+#define SCR_SEN		BIT(0)
+#define SCR_RST		BIT(1)
+#define SCR_FILTEN	BIT(4)
+#define SCR_RTF		BIT(8)
+#define SCR_RRF		BIT(9)
+#define SSR_TDF		BIT(0)
+#define SSR_RDF		BIT(1)
+#define SSR_AVF		BIT(2)
+#define SSR_TAF		BIT(3)
+#define SSR_RSF		BIT(8)
+#define SSR_SDF		BIT(9)
+#define SSR_BEF		BIT(10)
+#define SSR_FEF		BIT(11)
+#define SSR_SBF		BIT(24)
+#define SSR_BBF		BIT(25)
+#define SSR_CLEAR_BITS	(SSR_RSF | SSR_SDF | SSR_BEF | SSR_FEF)
+#define SIER_TDIE	BIT(0)
+#define SIER_RDIE	BIT(1)
+#define SIER_AVIE	BIT(2)
+#define SIER_TAIE	BIT(3)
+#define SIER_RSIE	BIT(8)
+#define SIER_SDIE	BIT(9)
+#define SIER_BEIE	BIT(10)
+#define SIER_FEIE	BIT(11)
+#define SIER_AM0F	BIT(12)
+#define SCFGR1_RXSTALL	BIT(1)
+#define SCFGR1_TXDSTALL	BIT(2)
+#define SCFGR2_FILTSDA_SHIFT	24
+#define SCFGR2_FILTSCL_SHIFT	16
+#define SCFGR2_CLKHOLD(x)	(x)
+#define SCFGR2_FILTSDA(x)	((x) << SCFGR2_FILTSDA_SHIFT)
+#define SCFGR2_FILTSCL(x)	((x) << SCFGR2_FILTSCL_SHIFT)
+#define SASR_READ_REQ	0x1
+#define SLAVE_INT_FLAG	(SIER_TDIE | SIER_RDIE | SIER_AVIE | \
+			 SIER_SDIE | SIER_BEIE)
+
 #define I2C_CLK_RATIO	2
 #define CHUNK_DATA	256
 
@@ -134,6 +184,7 @@ struct lpi2c_imx_struct {
 	struct i2c_bus_recovery_info rinfo;
 	bool			can_use_dma;
 	struct lpi2c_imx_dma	*dma;
+	struct i2c_client	*target;
 };
 
 static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
@@ -957,9 +1008,56 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 	return (result < 0) ? result : num;
 }
 
-static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
+static irqreturn_t lpi2c_imx_target_isr(struct lpi2c_imx_struct *lpi2c_imx,
+					u32 ssr, u32 sier_filter)
+{
+	u8 value;
+	u32 sasr;
+
+	/* Arbitration lost */
+	if (sier_filter & SSR_BEF) {
+		writel(0, lpi2c_imx->base + LPI2C_SIER);
+		return IRQ_HANDLED;
+	}
+
+	/* Address detected */
+	if (sier_filter & SSR_AVF) {
+		sasr = readl(lpi2c_imx->base + LPI2C_SASR);
+		if (SASR_READ_REQ & sasr) {
+			/* Read request */
+			i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_READ_REQUESTED, &value);
+			writel(value, lpi2c_imx->base + LPI2C_STDR);
+			goto ret;
+		} else {
+			/* Write request */
+			i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_WRITE_REQUESTED, &value);
+		}
+	}
+
+	if (sier_filter & SSR_SDF)
+		/* STOP */
+		i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_STOP, &value);
+
+	if (sier_filter & SSR_TDF) {
+		/* Target send data */
+		i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_READ_PROCESSED, &value);
+		writel(value, lpi2c_imx->base + LPI2C_STDR);
+	}
+
+	if (sier_filter & SSR_RDF) {
+		/* Target receive data */
+		value = readl(lpi2c_imx->base + LPI2C_SRDR);
+		i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_WRITE_RECEIVED, &value);
+	}
+
+ret:
+	/* Clear SSR */
+	writel(ssr & SSR_CLEAR_BITS, lpi2c_imx->base + LPI2C_SSR);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t lpi2c_imx_master_isr(struct lpi2c_imx_struct *lpi2c_imx)
 {
-	struct lpi2c_imx_struct *lpi2c_imx = dev_id;
 	unsigned int enabled;
 	unsigned int temp;
 
@@ -979,6 +1077,124 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = dev_id;
+
+	if (lpi2c_imx->target) {
+		u32 scr = readl(lpi2c_imx->base + LPI2C_SCR);
+		u32 ssr = readl(lpi2c_imx->base + LPI2C_SSR);
+		u32 sier_filter = ssr & readl(lpi2c_imx->base + LPI2C_SIER);
+
+		/*
+		 * The target is enabled and an interrupt has been triggered.
+		 * Enter the target's irq handler.
+		 */
+		if ((scr & SCR_SEN) && sier_filter)
+			return lpi2c_imx_target_isr(lpi2c_imx, ssr, sier_filter);
+	}
+
+	/*
+	 * Otherwise the interrupt has been triggered by the master.
+	 * Enter the master's irq handler.
+	 */
+	return lpi2c_imx_master_isr(lpi2c_imx);
+}
+
+static void lpi2c_imx_target_init(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	u32 temp;
+
+	/* reset target module */
+	writel(SCR_RST, lpi2c_imx->base + LPI2C_SCR);
+	writel(0, lpi2c_imx->base + LPI2C_SCR);
+
+	/* Set target address */
+	writel((lpi2c_imx->target->addr << 1), lpi2c_imx->base + LPI2C_SAMR);
+
+	writel(SCFGR1_RXSTALL | SCFGR1_TXDSTALL, lpi2c_imx->base + LPI2C_SCFGR1);
+
+	/*
+	 * set SCFGR2: FILTSDA, FILTSCL and CLKHOLD
+	 *
+	 * FILTSCL/FILTSDA can eliminate signal skew. It should generally be
+	 * set to the same value and should be set >= 50ns.
+	 *
+	 * CLKHOLD is only used when clock stretching is enabled, but it will
+	 * extend the clock stretching to ensure there is an additional delay
+	 * between the target driving SDA and the target releasing the SCL pin.
+	 *
+	 * CLKHOLD setting is crucial for lpi2c target. When master read data
+	 * from target, if there is a delay caused by cpu idle, excessive load,
+	 * or other delays between two bytes in one message transmission, it
+	 * will cause a short interval time between the driving SDA signal and
+	 * releasing SCL signal. The lpi2c master will mistakenly think it is a stop
+	 * signal resulting in an arbitration failure. This issue can be avoided
+	 * by setting CLKHOLD.
+	 *
+	 * In order to ensure lpi2c function normally when the lpi2c speed is as
+	 * low as 100kHz, CLKHOLD should be set to 3 and it is also compatible with
+	 * higher clock frequency like 400kHz and 1MHz.
+	 */
+	temp = SCFGR2_FILTSDA(2) | SCFGR2_FILTSCL(2) | SCFGR2_CLKHOLD(3);
+	writel(temp, lpi2c_imx->base + LPI2C_SCFGR2);
+
+	/*
+	 * Enable module:
+	 * SCR_FILTEN can enable digital filter and output delay counter for LPI2C
+	 * target mode. So SCR_FILTEN need be asserted when enable SDA/SCL FILTER
+	 * and CLKHOLD.
+	 */
+	writel(SCR_SEN | SCR_FILTEN, lpi2c_imx->base + LPI2C_SCR);
+
+	/* Enable interrupt from i2c module */
+	writel(SLAVE_INT_FLAG, lpi2c_imx->base + LPI2C_SIER);
+}
+
+static int lpi2c_imx_register_target(struct i2c_client *client)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = i2c_get_adapdata(client->adapter);
+	int ret;
+
+	if (lpi2c_imx->target)
+		return -EBUSY;
+
+	lpi2c_imx->target = client;
+
+	ret = pm_runtime_resume_and_get(lpi2c_imx->adapter.dev.parent);
+	if (ret < 0) {
+		dev_err(&lpi2c_imx->adapter.dev, "failed to resume i2c controller");
+		return ret;
+	}
+
+	lpi2c_imx_target_init(lpi2c_imx);
+
+	return 0;
+}
+
+static int lpi2c_imx_unregister_target(struct i2c_client *client)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = i2c_get_adapdata(client->adapter);
+	int ret;
+
+	if (!lpi2c_imx->target)
+		return -EINVAL;
+
+	/* Reset target address. */
+	writel(0, lpi2c_imx->base + LPI2C_SAMR);
+
+	writel(SCR_RST, lpi2c_imx->base + LPI2C_SCR);
+	writel(0, lpi2c_imx->base + LPI2C_SCR);
+
+	lpi2c_imx->target = NULL;
+
+	ret = pm_runtime_put_sync(lpi2c_imx->adapter.dev.parent);
+	if (ret < 0)
+		dev_err(&lpi2c_imx->adapter.dev, "failed to suspend i2c controller");
+
+	return ret;
+}
+
 static int lpi2c_imx_init_recovery_info(struct lpi2c_imx_struct *lpi2c_imx,
 				  struct platform_device *pdev)
 {
@@ -1054,6 +1270,8 @@ static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 static const struct i2c_algorithm lpi2c_imx_algo = {
 	.master_xfer	= lpi2c_imx_xfer,
 	.functionality	= lpi2c_imx_func,
+	.reg_target	= lpi2c_imx_register_target,
+	.unreg_target	= lpi2c_imx_unregister_target,
 };
 
 static const struct of_device_id lpi2c_imx_of_match[] = {
@@ -1204,9 +1422,34 @@ static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused lpi2c_suspend_noirq(struct device *dev)
+{
+	return pm_runtime_force_suspend(dev);
+}
+
+static int __maybe_unused lpi2c_resume_noirq(struct device *dev)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	/*
+	 * If the I2C module powers down during system suspend,
+	 * the register values will be lost. Therefore, reinitialize
+	 * the target when the system resumes.
+	 */
+	if (lpi2c_imx->target)
+		lpi2c_imx_target_init(lpi2c_imx);
+
+	return 0;
+}
+
 static const struct dev_pm_ops lpi2c_pm_ops = {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				      pm_runtime_force_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(lpi2c_suspend_noirq,
+				      lpi2c_resume_noirq)
 	SET_RUNTIME_PM_OPS(lpi2c_runtime_suspend,
 			   lpi2c_runtime_resume, NULL)
 };
-- 
2.34.1


