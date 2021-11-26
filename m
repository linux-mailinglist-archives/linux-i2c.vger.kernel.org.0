Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6B7045E89F
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 08:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359363AbhKZHqO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Nov 2021 02:46:14 -0500
Received: from mail-eopbgr130041.outbound.protection.outlook.com ([40.107.13.41]:41349
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1353060AbhKZHoN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Nov 2021 02:44:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsWd6RA3gZtCm8M19L26geCXOxqrN4LXtTyc+5/LJbHsXD2xqoVpPehNJ03VwDZghElrEe3jkliJErIeR6VqzJQcPusvO3Pa4zH/nuJSPttixn8w3/SG0qdgM/F2WT5TE6rcu8m3FvUslvx3M0Rzh2P06b+VcldlHFEA88tluRZIEeB3FgLHWis5fAI465iXfcw/7EU+/kZc1xIfZeSEbKwppHauvlxkR8GaQw3zKCSmVkbGcQt8OJ4ujAD3RhDf0EOZly9m5G9CdiGnYAlXSA9Ym6F11qObMlXGtR8no1KVmjaCb4IKh4ngXN1Pwv19372Blk8QE0GSznOcmSyHQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6R94N/BUh8RXNcg9LbY9ffNEcXS5XvaNsiH1lS7oO8=;
 b=QSxySTBlpwDZUUxumRBpC/fQ7t+eB65N3pK/1jMOYcbUBbr7GVyVxUdeS8CbdxRw/YIUtcMtaoH6xavvzWQjLEmdmcGf63ekUCaUtLaUp1QiqHCi42I46/E58SAHcRJYpdGX3sQcdY4avaP8y7bfRd+E9TlqRGIHPX77qwvlocKtsGcR47Ty3EIw9xusT1dr0pYo9etpp8jayUUO2AIHpHDNHcyGEyPgn+mjm+e/+26U2mWoyikBikGxBcPI+qdzqEBvcR6uoQD7TQU3BX7wFyIB9Gr65NuFj1d+esfCU6aNgjpudcxtZKKVqLvlXNpeZrbLb3k0ayM0M9XoARCEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6R94N/BUh8RXNcg9LbY9ffNEcXS5XvaNsiH1lS7oO8=;
 b=MSzzZ0DZshAVD3shMSoSBstCMtnqCZ+Uq1vWwhX3haBxaRvk0TcuIgclcul+SaQ4egJ11b19YrVhNQ6D8pnjqHYRYIkjidcz9ZX2mqenEHndIZWRZZuQZR/eMOBJrL1SHEyB8Crn7A55LCuqBfSAohNc2ZqcS41i3Tpo4Ys1l7w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 07:40:55 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4713.027; Fri, 26 Nov 2021
 07:40:55 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     robh+dt@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, ulf.hansson@linaro.org, broonie@kernel.org,
        linux@roeck-us.net, wim@linux-watchdog.org, linux@rempel-privat.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 0/7] dt-bindinds/dts: support i.MX8ULP
Date:   Fri, 26 Nov 2021 15:39:55 +0800
Message-Id: <20211126074002.1535696-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0139.apcprd04.prod.outlook.com
 (2603:1096:3:16::23) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0139.apcprd04.prod.outlook.com (2603:1096:3:16::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend Transport; Fri, 26 Nov 2021 07:40:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53a1dbc5-b2e9-4903-bd6c-08d9b0b01405
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB879070167824185798CFACC9C9639@DU2PR04MB8790.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EhGVejdBIjCpcS/4OQrtMNyi5knYgkcwUhSoLRo+w2+IkhqMdoO4x40qmuwIrSqpb+gsg5kynzXKbccip+SgXu+GIr5Bv5qJxJK+7aMWl+UleXPOV9+dKSLryXi2cuLq3DsgFHb19WWuopkdG4ZLqIEhLlTn27StTXSG1iaTluF49KeWudfEJWfxQmn4Zh+UaSOc7tDS+DAbxDSRFBEZHm7naLMME9jbQnVdhxJwCF+kemhIZWgmqhqYeK8MGuBZQHjJaUZeYtOat6dV4AkJvHItilQJFwNvAwtO4bTObZYxfhrDSowJnvcv38zyDmLZH2yclugbRfjt+7UW4wViJZShWgZyKbEcRaMFDzh0k2v1grdo+l2irU7Vp6FfkdHmlaafKgYV8OgE8FwFozBhZ+TFiGWQlR3sIZwMewmeM+cc5JgtHJHtYaKiQFRSZYa/X8ZYmDm1qCvK2wHiT8CAyEumu30zceQ2ht9r4d9iUA/IgCDpOWf4CMiEYZTQxnGRkgnADGDYMkPo52bERr/xOdOiVmJqbRZW/zwB83tlpsSGmSPuC/+2hpTs40RLzgrGrE3vW3B7jRB2dNfZ3BKwzeFKyHn8PWwK5EDmYhi5SEs7gDETac3kyUBY2xYfZezNuIPR+55PCaAf2V3VuVq3GyzTwYg2MiQig0nbvJbx2dmZoF1Td+nK6h1umE/Qb22ub2xic7LXSX/WvWeuZCvadphOwx9Sdu/LlEeEFHt4Cj2QbgvxIQrp/XW1zXY11SW9HN/bafOwWbtrT29u2W2MiNXGAjlUWEJiEbxL3HpqMR7LjlZdeR/P71uWDTNdUTahHOFNTAEfIpNrXJqqZrqV7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66556008)(83380400001)(966005)(6506007)(66476007)(6512007)(316002)(186003)(956004)(86362001)(66946007)(38100700002)(2906002)(1076003)(508600001)(4326008)(8936002)(6666004)(26005)(8676002)(52116002)(5660300002)(2616005)(38350700002)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?70r/oyAWJ2A16Kimj29Ie3lU/mO3Kk6FBP5pd0VMrfAPEZy1dxcCNkqc2BLB?=
 =?us-ascii?Q?x14KuR3pt11oA/yoI/DEaN+yTauRelSJBKYApZqBjcB3ofyGDFEaQBEW9PyL?=
 =?us-ascii?Q?rWQcjIWtjnkE7nCYMPRem04Dr0exd0RBPyOnXmpOjWLF5y/Y2KbFh9RCAj3u?=
 =?us-ascii?Q?wscAhWOASPU8u4DQTAv0Naa8j/5pQTzVFdsqCOrUml+5ZohDMZfThBqX3F0N?=
 =?us-ascii?Q?lADO5T+V/UAnoEBZNGm3G3z4TdNdxr54C4VIwBe5UelGKRu6YE84ZthdLiQL?=
 =?us-ascii?Q?vqEFrWNSlAKbxcilVc9/X2zpDD3MFLQmDwTF8HNAZEJSSviPf6v2f5o2dx02?=
 =?us-ascii?Q?+1r1n/eC7YCa60A/pPFYCZnXkCI78RobBzD0aCV1Md9E8Yrx8P4YP6xmtjLP?=
 =?us-ascii?Q?F1KTq9Q1qyFifU0KXFcUtcfGHnpRLhN3nXS1Nzt29HAEsWXGd6AdzBUfM1Et?=
 =?us-ascii?Q?HJgpJ7C+MSUXGQuhSZaqmpWKIkrVpkTIWUbcy11qvdyaRFnsHktKCZurjx8P?=
 =?us-ascii?Q?fuYGjLSbDf3sWM9ViKQtSg3cH819OF2Ip50/4xci5gViNMm35133J+4u+B6L?=
 =?us-ascii?Q?LLAeFW6RRO4+VMhO6vesM+9tSP+ZI9vpVeDZcLRvE3+c7l1riqiludFx+TRF?=
 =?us-ascii?Q?XrLzmry/6h/MuE2EL1NJ5Uz0AXlprn0eqCjHhSevr2SMG94qNG7Pl0Ig8cqn?=
 =?us-ascii?Q?ME3zv2m+936tEp3YA8FNXesCkHFj4uB5ggEBQbrGMGx2+6zsrOLyrGj71+TI?=
 =?us-ascii?Q?uQCTLL8CgwPGsqeAqaKRFUK6WUlhxZ00v9BHF2G33y3tDYcLn8RDxEW67PXF?=
 =?us-ascii?Q?/5u/u6xM/f89pQsXYwFZmZI06C8SsGZNDG0rWjAhXJLHnOkYoM07poNbP9m4?=
 =?us-ascii?Q?zF1tZ2yhMk2X/D4AQY7QA1bnbUmTAKBUjrVwUA0AjPKDqJQuLjJAI2VofBGJ?=
 =?us-ascii?Q?HuUcYeVtDUxOkDQHJ+nVeYbAa4dSWkPoIWpjS+cvx7fWYQB1AD6cz2TvdIM0?=
 =?us-ascii?Q?6V3q73bykrxTwo7q/8LyCSnf/pc4u0Eg3y84eueU0k2V24V8E9Fo+qk7K3w8?=
 =?us-ascii?Q?QMjNcGLxcp8AURTGnpyrJAH7u4EOhvsY/6CCX/aEVBjCoaiC3C+c/lqaV5qd?=
 =?us-ascii?Q?Wa3wSSbupsjz6XaJ403aPrbwVZhy42Q8VmpbkEfhKYB2g4LZ7XWXBAUIxER5?=
 =?us-ascii?Q?lRybmGJ+LNe90R+s1p9EX04yEHvyL2M3lfwrIkfGSI+fwT4mvTQvcqCNZ741?=
 =?us-ascii?Q?DOG9HpyRNol5LDrUzXRQsg3wSag8r1ntLF26V/JMrtMQphNWwIp+GTrA+8vo?=
 =?us-ascii?Q?AyCujEHVv+NDY4jCd+nwvzjA640aBpYc5qUb48dRq3D2oVhQVUczmjHos2px?=
 =?us-ascii?Q?RCFVdNfXBqASPgYUC22US8rw38tOh10bJVrZUuNT32/YzGwOlB/KB5E+EJ61?=
 =?us-ascii?Q?QWs6Rf3FdwNHCxKoAOWgEhIKSTX0uBq0Ao/tqJL0Fn1S82WamoAMy/2LGih9?=
 =?us-ascii?Q?oNNpYetBy4G2zFtBDZkpMmxyesZuJ1FHwvUZderjK77TxCNeHZssCDgKIk08?=
 =?us-ascii?Q?xytjdYkuHCP34m0Lq/534ELw88Zrf1PkExHBytZJhVz/hjRLenhyrKI5I9Cs?=
 =?us-ascii?Q?BSpRMUFQ/7/CDuN1dYQ0Zlk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a1dbc5-b2e9-4903-bd6c-08d9b0b01405
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 07:40:55.2262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KuFqoBoqzY91G++XJ2z95PH8blcNhxws2HeE9OXQdpol+d+jajk32Z2dIEsqE9+flhnYExDOqhbFZczpe99fSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8790
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V6:
 Rebase to avoid conflict.

V5:
 only fix patch 8/8 'arm64: dts: imx8ulp: Add the basic dts for imx8ulp evk board'
  - Correct bus-width to 8 for eMMC
  - Drop pinctrl enet which no user
 Drop patch 1/9 in V4, since in merged in linux-next
 Add A-b/R-b tag

V4:
 https://lists.infradead.org/pipermail/linux-arm-kernel/2021-November/696020.html

I just pick-up Jacky's work, rebase and send out V4 based on
Jacky's V3 patchset.

If you prefer to split the patchset and send single patches, I could
resend one by one.

Note: the V3 has a gpio bindings patch, it has been separated and
sent to gpio list in a single one per Linus requested.

This patchset is to add i.MX8ULP in dt-bindings, introduce
basic i.MX8ULP dtsi and basic evk board support.

The detailed version changes are in each patch.

There is checkpatch error in patch 8, but that is for device tree macro
and we could use use "(xx)".

In V4, the changes are in patch 8, 9 when rebasing to linux-next/master
,fix build errors after the clk driver in tree and drop a few nodes
that not have bindings.

Tested with CONFIG_CLK_IMX8ULP and CONFIG_PINCTRL_IMX8ULP enabled.

V3:
 https://lore.kernel.org/linux-arm-kernel/20210625011355.3468586-6-ping.bai@nxp.com/T/
Jacky Bai (7):
  dt-bindings: i2c: imx-lpi2c: Add imx8ulp compatible string
  dt-bindings: serial: fsl-lpuart: Add imx8ulp compatible string
  dt-bindings: timer: tpm-timer: Add imx8ulp compatible string
  dt-bindings: watchdog: imx7ulp-wdt: Add imx8ulp compatible string
  dt-bindings: arm: fsl: Add binding for imx8ulp evk
  arm64: dts: imx8ulp: Add the basic dtsi file for imx8ulp
  arm64: dts: imx8ulp: Add the basic dts for imx8ulp evk board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../bindings/i2c/i2c-imx-lpi2c.yaml           |   1 +
 .../bindings/serial/fsl-lpuart.yaml           |   4 +-
 .../bindings/timer/nxp,tpm-timer.yaml         |   6 +-
 .../bindings/watchdog/fsl-imx7ulp-wdt.yaml    |   7 +-
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts |  64 ++
 .../boot/dts/freescale/imx8ulp-pinfunc.h      | 978 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 396 +++++++
 9 files changed, 1459 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
 create mode 100755 arch/arm64/boot/dts/freescale/imx8ulp-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp.dtsi

-- 
2.25.1

