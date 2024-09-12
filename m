Return-Path: <linux-i2c+bounces-6611-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B618976426
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 10:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 331C7B22CB0
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 08:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D37C191F71;
	Thu, 12 Sep 2024 08:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EjVGDhoA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2045.outbound.protection.outlook.com [40.107.20.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5EA18F2DA;
	Thu, 12 Sep 2024 08:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726128924; cv=fail; b=fEYnh3yBcvGf3gIPz102XpP37B4+9XYguBBHK822SUzfRuUdmeIAV5lfCH8gUeffAJ2WfT+vKmoBmTCylqi7fIKI5wxj350JzlKjxg9qbHmigqHt4Xbn5H3RC/zIu0b8Spwr/bQMn7GOOWI8fbP+bochJSOYn8WF8n1AENOq0Cw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726128924; c=relaxed/simple;
	bh=mc8Y/R4sBoMsbgALTQJ5t8kGp0BrBNNE+j4st/97qMw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=VVG/fQGF4eCNxcbv0VpzXx2WIQST5HoAmmBNDKwurv9cV+HKdH4grVI7vF1u1IbejOFRnVzZX1G2zJEFJQFNjnMMCsmHG3J1oE3VCZvTSr805EJmpP/9LNfFm4da00xnJZU4/pK6cGoqh8nKE4xPugJBWMhxhOEbX1ILsqlZs54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EjVGDhoA; arc=fail smtp.client-ip=40.107.20.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYFRkR3kJANKD+gR53IylDwSDI4zI60UOWvxW22V0IE4AyNhKKd57rL7qbyQmXltcT4h4/5b/XSInW8lWv/uovgs9ANGq/CZH7t8eafqMfOKi+Ai9PgooK2oW5TgEeGti0/w8rwND3AlvvTayioQNbNQ+Z7yBel6NMZQWnK0PoqBVohNXH7gik1aFjN7It4LsfzKgW5AZzGblptnnCAhoqYyqErudvtoMuTNtehLo1pYmUNxNNut0/CKETe6dBM0aRhlO//EhLhpV+WuuDwBDwBg1JrruWp5nWFIhV2CR+9W9s1zhJUDc9bW21iuIybk1r/CinKFS/FIoQZPS+9M8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aJyZ7GIRbTCEhFUvgIMkvJQ5OtGd9szKnOzhPEl4s8=;
 b=a9TJ4MubmRldtDoOQr6zl9MeYXOnqGxwwiQO7jkM/C2gy+QOSHlQWn2nMVZsI/jQiMPuv8JlUNg1ouvekzvJsS3EmK9HwvN7LmEpvJZMX3VmuksHYNjEdtKGvQf3iY1vf0oIWRDSwh6/S1yK4so0HEceCMGQNiebZnREb8qP6ZcAjzTsCOnHYlkBCDK8zP0KkcZ4aOrme+Rm2+6JW883b39/tdOOPonD7kW+4On2vYI/vj5Y08pmRForZzD5NvVRnjK61FgsIcpI1AZgU2DuBQT/c+hnUH1ITZNXQkGZda3Bpd0K8/RkF+0RlTtWIxYB0mdsx6gOFu/O9uYhmRzFvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aJyZ7GIRbTCEhFUvgIMkvJQ5OtGd9szKnOzhPEl4s8=;
 b=EjVGDhoA4LbxlN9QMxtefUOfpgBgmFdpk5m5/ob2P7mOnfZDNWBpP+wRMPsgQVi8b2o9T4QCmlFLN2bwqEBe6fF0Rx/Xo/AsLcbRwX3Gsb3qJhyKtHgTsWUpEXhgA+E3AjxSZ12xsnlJKZrw9hjNP54GNWGZTVXf+/iNv9GOBnTtV7fEcNElPkvC1heA/VjPm/xA5vvfl9CHRBv4PStHmDcpxU6a6+uqAxpyhggyF7tYD0bYjvhAd6Buq3mcIo2nyyllQgmxz30k7TzzPvqBG67l2PQxiJ/vsfytg4LPnt/DsYgYJUou/oTYg3TIirq65eF3SehWiRkgwKvJuoHxLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by PA4PR04MB9437.eurprd04.prod.outlook.com (2603:10a6:102:2a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Thu, 12 Sep
 2024 08:15:17 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb%6]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 08:15:14 +0000
From: carlos.song@nxp.com
To: andi.shyti@kernel.org,
	aisheng.dong@nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4] i2c: imx-lpi2c: add target mode support
Date: Thu, 12 Sep 2024 16:24:13 +0800
Message-Id: <20240912082413.435267-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P195CA0013.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::18) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|PA4PR04MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ba2a0d-cda1-49a1-8048-08dcd30306eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?urGv19FbgYzgVLo265o/IAlLovcteuYb7/oJ2fUJjFZtyUXd9JDHoBT0MQ3y?=
 =?us-ascii?Q?ttqfmyxuXn9Z2BXVvqiE1uf8TUj1DCh8kV6MbmZXHAPyItXITDIsZkODm3ZJ?=
 =?us-ascii?Q?KTgcXPk72sUqR4IXtfjBIzzFMSnGORU+CiCQfZpM4FB1onBq4H2Tk3KvNgZV?=
 =?us-ascii?Q?QkJ98S6OWyeJyFlDH8Wq+JdEesRorQwmKrqeW9YH0ALOjkeY4IUHmLzYbHHo?=
 =?us-ascii?Q?B6xB52gFNm4NT/OFSs8zjz46doGnn7jgEQ5EmgZPm96RclJYz1KyURg8VvKb?=
 =?us-ascii?Q?impn97xGg2Ml3cYa+uCk5K/S+87cMoHYvYzyrTeg8HdnX5qwVXiVp/qVQ+C2?=
 =?us-ascii?Q?KUsrV8LwUo1GwanhxIt05J85dSE6hsUW1eAEL3V+TAtGW1hmYRQND/sPLl7g?=
 =?us-ascii?Q?7KHQwCRAkOgC/YOTCvVFLZNFet9PtCAXeLUlhgJVi6Ut8FRHxRe1JY5uM9M5?=
 =?us-ascii?Q?BpjQs8cPAKRQiPv6rK+oTs7OT0vxQUu9ir+Icf34eaaaTRqEmJ6SjH//sYCJ?=
 =?us-ascii?Q?eudnNgdkWncWrI0yHzxuwTxMzAjkWFD+9XyYrSaAK2Vj3WM/i0dF8xA/4OXK?=
 =?us-ascii?Q?M4jlxAOLvVcB8zhutYDZ6BXSDlI3ixiyTRwEPUwMzjaoSkhJOEcN0coYUTSj?=
 =?us-ascii?Q?TbMFH4Z7wbT2b5zJiEHtjtMQZ3Gzb2gtm1hXwwlhitzBjHUMM/IeBwszlITi?=
 =?us-ascii?Q?6fu7hzMsBsKolMYLzxubLBZNjNn2PiyBIVgbHz6jfdNA9RUkMWPkJ0sCTSrV?=
 =?us-ascii?Q?QTE7Xv01TyTqifUcuRO/Iz341LpWLjqUJnyY9PmQmx7IwMkU4pMkwYXPYpBv?=
 =?us-ascii?Q?TifY3tpKCXthPazpkClpDiwDSnd7IXbSOkGEFHVZvnJGYS/pU2qvDRq5qvgB?=
 =?us-ascii?Q?HfOerQsR6KwV05pMkCJFiUHRiV5yOcp5G9xnNk19uwNdXmWoQu2+236BPN/x?=
 =?us-ascii?Q?gChTgsXKVTf9mu3/SS2DtA4vCZimTTYJDJ7fVhjpQTs3MnCY25ZMmRv706tn?=
 =?us-ascii?Q?HHqlQ0wvjxwfdblWwDNejGagltu6/2oySmpEzHdkxXURuVOLd8cXgkg8aFSl?=
 =?us-ascii?Q?I/sIKFBn5xHENNAuBfRhHDlhDsUzjstNxXjFIsWViq7IZxMHLQANKb5/+r73?=
 =?us-ascii?Q?Bk/0IuqS1V+0ZNuDx9Gjg18v1m3QdU2O6pCMEIr2FdmOdwsLLHBEJ9Amu9PB?=
 =?us-ascii?Q?byxjM9Dv62osl7Sb5Nypr8tQ2YdDUrvaEMNFjJeu2oyHDePjPCYYk6v77T7Y?=
 =?us-ascii?Q?D7aUHlEfz9cKGC4IkPhu8fdTYEkRYvREwFrq/HUSn1xxFDQYezIJmdffk5Lu?=
 =?us-ascii?Q?VI3JqnEdWDraPSfozbulQTYsIOaimeFOVvchoRJRBEVI2te4qvXgRU6wDUwG?=
 =?us-ascii?Q?cLKJRgPQ8e1oA3D7LO5hxtqJbmpX19vjmO9cIy3O9m6x54v1Xg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oCU/Q3AvsPSQzYzPZaS8Nc99yyBO6ArrBCJ98ky4acU/r5c7VpDawi61g6Rl?=
 =?us-ascii?Q?Ch6MRGjdoEi9hr8YP+Cbbn/JcJCD19Kcv7LNd326nukpCo4h2VI202a0hGsV?=
 =?us-ascii?Q?PhKtTFREpp48203tYGwP3haopG5YB8lcgQzvCJFMONyNEkcf+b6L4xEzrv1V?=
 =?us-ascii?Q?FuQNrxRL/B7sjKQTsJ5vHy4JeBWeLvP7N61vEDgb95gpblu41qFvVBDtQLEs?=
 =?us-ascii?Q?Mj8XYtxijDvtagzw0VcF2zeKTDbOQ8qXY9RsMAfXZW1jmk+QACnWAXS4aTYY?=
 =?us-ascii?Q?iXYFopK9NnyGXbVN4MBVCvE44wuPBviV5B7pSmEaLlNIdbaV76npmQnN/y+I?=
 =?us-ascii?Q?SgGX8r+j5mmLEKdw9V3ixC8DyTPCxrhRy+kyp5TtEC7dRGinCKjgMARB1bF1?=
 =?us-ascii?Q?a5CYyaXS5zpkmzgVkMvQRBTU0qb869e1HrM4VCAB5CzkCcllK5YcufXztlTv?=
 =?us-ascii?Q?Ge/0/KZBKtTjFlaiRABMIhO3K8X7TjmRMuA5Oz/am1AHwPTclA72LCZ6aWbX?=
 =?us-ascii?Q?d4EW4Bnh1Y5PEk9rMKbFiQ18rn/W7xxQ1aRAkKDo6Rs67rkAiLBoJldtilW0?=
 =?us-ascii?Q?T8M1qONcx5TBfjtsatBL6/ki1OvEjKo/hw9Omm11TBUSmydwt6DFkd3CAWS4?=
 =?us-ascii?Q?0N3gVO7Tu9ftG7E2QdgqV6qnK/4Ui7g6bXSkdVuZS133GeHWog0IIbUGXhgc?=
 =?us-ascii?Q?vlvI8A+ploGep/nkh95bND8cu7FNDorTOtMjXi3PgB2KUh1xtz6SnnWKqO8P?=
 =?us-ascii?Q?FYrHKBGacckBQVXNPzDxlXgCPPWttcDJhc3da2wHc4OhIA/Z+LzOLN9sFqIt?=
 =?us-ascii?Q?LyobneVDhJGXMTece92IaSBD3GuBsGJG2H5WYy9MV/U6kRgU3H1GwQkcsn4g?=
 =?us-ascii?Q?we/XqO6ZajLbw5cW7qzYr1dGXSZVLr8tx4jKkDCEc4b1wrzCrjgq0OOc7yFX?=
 =?us-ascii?Q?+0YWE+iEnd2ysrjZba9A/USYhjUP1v6XEQ5BqllXvbzsYM8gQvTkJhf/pVpD?=
 =?us-ascii?Q?ouWkxmrOXRVh8Furgj9NJaJrs4HU/CEkiI6S3jKWXH5kA4jX//K/Sx+ez1+5?=
 =?us-ascii?Q?MIMed3yw+IF/27UsduNs9TOiz1nDuEexV4DO9isq1kPTe0JDkAXBAo22MQD9?=
 =?us-ascii?Q?UAHtF74xixAQqYVO0W525uSTa7ZxGbxLQRyqOLm6AEKGYnGzI9ZJI5ZcRFCS?=
 =?us-ascii?Q?wztro2oq7pbMd/8mSWOdE/ORFZ6Besg5Snn/JXMu6QlE/jNPLWiSaGJkxYWM?=
 =?us-ascii?Q?NvIqmy0RVQwQHJwUl27Xzru0bEfYPboFQ0HlHqdYU90pdRr2rHaf3Oya0WDA?=
 =?us-ascii?Q?b4uMVL5CfU7R0k0LOHHsqPXWw2TP4IwDB+hYqYmYp6HXd3CR6LOzl8iuWKZi?=
 =?us-ascii?Q?tZDQfAOC2Te3UtyyMzPKbw4SS0ii2ItrA6Hg8h3ZOD5M5iSMvOu+zY/79UIT?=
 =?us-ascii?Q?3L2WI5WM5rOn3ltkKzy+oKJEHt7kQnRrJ2CXmh72OpLar9cp6W7CgWHbsari?=
 =?us-ascii?Q?qIk0SlnIAR0drkopCIjT6jwiBu3VzWXF7n3HKUmbnknly1QA6KSq7UAayB35?=
 =?us-ascii?Q?eZDeh5MfjCv5cDgLVlYGxs4oXMX8qrnTCG9M1VLY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ba2a0d-cda1-49a1-8048-08dcd30306eb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 08:15:13.9206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czkLmo4h0wWGXp8fI/alSsznDWNEvQryX1+MU/hUNM70h5C9iVwBk8QWo0eZiYh3zukzTqOnl7LerQzvzsijDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9437

From: Carlos Song <carlos.song@nxp.com>

LPI2C support master controller and target controller enabled
simultaneously. Both controllers share same SDA/SCL lines and
interrupt source but has separate control and status registers.
Even if target mode is enabled, LPI2C can still work normally
as master controller at the same time.

This patch supports basic target data read/write operations in
7-bit target address. LPI2C target mode can be enabled by using
I2C slave backend. I2C slave backend behave like a standard I2C
client. For simple use and test, Linux I2C slave EEPROM backend
can be used.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
Change for V4:
- According to Andi's suggestion, simplify the code, fix alignment,
  remove redundant definitions.
Change for V3:
- According to Andi's suggestion, enrich this patch commit log.
  No code change.
Change for V2:
- remove unused variable 'lpi2c_imx' in lpi2c_suspend_noirq.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 250 ++++++++++++++++++++++++++++-
 1 file changed, 246 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index f2bbd9898551..5e4157c47104 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -43,6 +43,20 @@
 #define LPI2C_MTDR	0x60	/* i2c master TX data register */
 #define LPI2C_MRDR	0x70	/* i2c master RX data register */
 
+#define LPI2C_SCR	0x110	/* i2c target contrl register */
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
@@ -958,9 +1009,56 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 	return (result < 0) ? result : num;
 }
 
-static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
+static irqreturn_t lpi2c_imx_target_isr(struct lpi2c_imx_struct *lpi2c_imx,
+					 u32 ssr, u32 sier_filter)
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
 
@@ -980,6 +1078,118 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
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
+		/* Target is enabled and trigger irq then enter target irq handler */
+		if ((scr & SCR_SEN) && sier_filter)
+			return lpi2c_imx_target_isr(lpi2c_imx, ssr, sier_filter);
+	}
+
+	/* Otherwise triggered by master then handle irq in master handler */
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
+	/* Set target addr */
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
+	 * or other delays between two bytes in one message transmission. so it
+	 * will cause a short interval time between the driving SDA signal and
+	 * releasing SCL signal. Lpi2c master will mistakenly think it is a stop
+	 * signal resulting in an arbitration failure. This issue can be avoided
+	 * by setting CLKHOLD.
+	 *
+	 * In order to ensure lpi2c function normally when the lpi2c speed is as
+	 * low as 100kHz, CLKHOLD should be set 3 and it is also compatible with
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
+static int lpi2c_imx_reg_target(struct i2c_client *client)
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
+static int lpi2c_imx_unreg_target(struct i2c_client *client)
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
@@ -1055,6 +1265,8 @@ static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 static const struct i2c_algorithm lpi2c_imx_algo = {
 	.master_xfer	= lpi2c_imx_xfer,
 	.functionality	= lpi2c_imx_func,
+	.reg_slave	= lpi2c_imx_reg_target,
+	.unreg_slave	= lpi2c_imx_unreg_target,
 };
 
 static const struct of_device_id lpi2c_imx_of_match[] = {
@@ -1205,9 +1417,39 @@ static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int lpi2c_suspend_noirq(struct device *dev)
+{
+	int ret;
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int lpi2c_resume_noirq(struct device *dev)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	/*
+	 * If i2c module powered down in system suspend, register
+	 * value will lose. So reinit target when system resume.
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


