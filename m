Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E186457D6B
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Nov 2021 12:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbhKTLi4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Nov 2021 06:38:56 -0500
Received: from mail-eopbgr60054.outbound.protection.outlook.com ([40.107.6.54]:42629
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229592AbhKTLiz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 20 Nov 2021 06:38:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5zUmhKJkKBFBuCWeYBWIovYao94XFqGu18cTQpQsHaUBLonWXUeKUtzqwft6/UHdBosgML5b9cKtvHp3Z67wtpEagUfmbnDBlesZpY5GfR+zP/RDDwVZ0BwGzGvDF2y5IPewXUl9KE7bdpywjbfEhMsqfyAjMKCHzsqaQ9aKVHcNI79+sO3YimINMaN5+lTSR3CP6vS2EVfZWQY8UEnXyfwcY0XvAOSAOLPh2e09447QYI7UBVjK19x+qJKtE6PAka7BcL+VyEKPUPpk/gY8p847ZK5N3aNIiIC4o0vwLcPSAaE896Y6GHyDm/x7liz4y3DWLMGB7hOf8gWUyIQMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIMKTX0uEluVZw9xudeI1mFQArpEM9inKgcYmnSBAEs=;
 b=kqXnBu5AdExDRCfOyRru/bQ4EsJyVSjxxB9KX+89JCO9xxOmpjTJDq2Cdxp+AG+n0DPn1S5wQUBofGGPYBa6d/JrT2AatelzZ/kuY+26j2j1u+unQo5uXVP1cO127gpNfn979ANx554Bq+ye2Hnb02/79X8Pbn9nqvoFKOdyWygEA49rWNhCe8sssLJj72UU6tBaVOx/QAt7uN3onA6PDxJa1KbNyhyBX+bIqmOzM8VeP3QD86QjBc0bTB0lX9ei696SjmWVwT5qktJ/+J3jdsjM1EmxQJoHJBST5rBP0ZX32z6KnsG2t64AgXEg60siUnNrSgHh54YF8e7ws1nffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIMKTX0uEluVZw9xudeI1mFQArpEM9inKgcYmnSBAEs=;
 b=MOR20cZYp5Ndy1LNak8uxqMWV+T4adrYQYEkYLQ2STawyruHvYxuy0xyCVQySHpnuGwIp2XDIjNkvP5YEJ07jZ2QrNVudisR6VOvNH0AsvLkUYS3m1a8tyEqxHpPoaOYbg7x2U/xAoCA/jWWZYLZhMckwv7PIFSfZ2Oaak7KAZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB9308.eurprd04.prod.outlook.com (2603:10a6:10:36c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Sat, 20 Nov
 2021 11:35:48 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Sat, 20 Nov 2021
 11:35:48 +0000
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
Subject: [PATCH V5 0/8] dt-bindinds/dts: support i.MX8ULP
Date:   Sat, 20 Nov 2021 19:34:46 +0800
Message-Id: <20211120113454.785997-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SI2PR01CA0029.apcprd01.prod.exchangelabs.com (2603:1096:4:192::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend Transport; Sat, 20 Nov 2021 11:35:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1832f92c-8e4a-4846-fdd1-08d9ac19e5ce
X-MS-TrafficTypeDiagnostic: DB9PR04MB9308:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB930868D4DF65FB156D799A74C99D9@DB9PR04MB9308.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qGC8phkthjwFhfSw2k7MQDn5ccvxc1pHnex7IktNvdvFyJR5shFKW5zzzre7mjY4IYytDcnTBcC+cZKmmhfvbOX4HrTWsdL8usaQe9QruXF+rL/SUPsNghwIFDaGwa99+WK58aBK/Nq8L+kJwLvAYHXzuQCF7Nizr+SnPVDMBDAHNZIUVRsKoqgS7NTW/jrwIfXpcz8FDpRlFlOFOeHkOFi/zajKTG4xMdmOdbd3yAIuySpmhh9MwZeGfJ4QNMHkfBCliRiljyQ8DbECN8DwAaZGjF5xuIkcQ7U+3VhgK+PBQm0GGcFmnIz2X2HnbzUV8bgvFokVGmrnt0hFxccatV2ClVj9yf28e2mIxYpD5CdFFjuPMVSFCLQ+o3i+yifLq64NGFMOA6HNMiHBy230sFu38HTJ4lu2JJrVP2s8w//508ObZZsuGA9774/pf7OlbW2lZ4WpHa5tFKKfM5bVT2dOQmyOuQlAzDd7vrsc5EwCLybpKdNM9ZKcxg3THJeu0UUz5HcA9u3UScXwAVzzpV9KpcTxiUKMluIDTqDfe7odyPuE5PouwinoPvIc1ZwJU5m9IcbVbEf5GdnX0Th54s0nFubt/VwB/SVX6zwXu9CwKKK3+xpQq95Es2QHvm0f1yXuW0DdRDk7V0WeQM+blm8UuhAYCjxBqn+PjyF5rmc90B1ePJ2NxB9UtvgOq1nHwPYTVFSSAzSgT77tKUVNZK1O2C4cfMTLs0MCOe3t7z9wb9+CRYBNJkwJKpiwgAYZNYs8hniyk01No3J3N0LDgVRhWOwKocJWkvxOvXc4/iLAp71AxVmHYPBwHr2ubVl8qk/dz+lCeRhAWBG3QAcurw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7416002)(26005)(6512007)(66556008)(2906002)(956004)(86362001)(508600001)(966005)(6486002)(66476007)(1076003)(38350700002)(38100700002)(52116002)(66946007)(2616005)(8676002)(8936002)(6506007)(4326008)(5660300002)(186003)(83380400001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gprLij75/gjDs9USjCKRqs/Re51oeyOoEbX78vtnZ0D+4oBWU2gUqyL9Yhkg?=
 =?us-ascii?Q?yPl/VXcvMaXwVV4UEdN6QyCsgZbL6oLSnfr3KcTSlkXrF3igz+Nrbspv8WXE?=
 =?us-ascii?Q?pkKsexsBF8Wm+n0vCp3MOTT2lCsMyHO6hIcwmwLj4tkMeVv07b/QWFCn66dz?=
 =?us-ascii?Q?e46mB8wEhApojL9Vd6Zt+QO3XrTYwIciPtEHC8cUV5ZqobyiKM+3tkvCvOrq?=
 =?us-ascii?Q?+SfGOcRa8adANlWwae3zsCLBJmvsnF0dKcAI3SU5yVB/m1II9LzNCpWpOqZU?=
 =?us-ascii?Q?cHaNpNOlQztqS4M/o7dLa5Te3ey09wyroYOAqP1ENJ8+/lt9dJHOzx/C3QYc?=
 =?us-ascii?Q?HP0riXN74rwReRJOwiCau61SCQkk1tSOqRUGpg9np1DmmJsja5aazHo2EDeg?=
 =?us-ascii?Q?oTiPBFaHQCx7G3Cye79sMkuvouqOgJyKwtSyOta85a4klQypGDbPK/HgamZA?=
 =?us-ascii?Q?5F3iFoHotZu+fqMoxbr1G8CqPEe1v1Iofg6Us4/JaZHW3ADh+/ZgKvoCktx6?=
 =?us-ascii?Q?bKk4XJlLKd/AeNh58A9hej0z5BCYI8KQ6FgNE2htdDF2oEbHcZlyTPTwBqpn?=
 =?us-ascii?Q?X9LEjDzR3uRMBpUs/1kEDjZPIgNXfYNNeWF/KvHMmoJfgymOl1QtktuUxck5?=
 =?us-ascii?Q?+pHDch9KnQO3HQUVEe2KaT7nrUmTiFnUyDSMA8FCBdq/jQPheS91+6snoGJL?=
 =?us-ascii?Q?oAhH3d0/bqYW7lOdGm2QyoX6R/P4wgZE9NoRgkyAt6gyYoSMuFHv9aE01he5?=
 =?us-ascii?Q?IsqIt8eYZV7/e7TuwFb1Ge72OfyAHysbuclG4KBH70i4s+fPe6E/6gQZGzj3?=
 =?us-ascii?Q?QaQrau1E9P4FKrnuP3N89DgRpSmIgGmjG3Z8hiR6TAUzI81+AGoTUsDLo2F9?=
 =?us-ascii?Q?nZ2yOKGU3mv62ZPEDx17QdQD3kdxJ51QTIfWalPTJPqyQQF2Ywg2COtdgn0n?=
 =?us-ascii?Q?+RJWBaAuZr93kizB0GGmhd54TUh5oiy5dwjmqvQCa1Wji1UStPQi5JMqEJRq?=
 =?us-ascii?Q?GgA5gVNSYSixOC1usO4QvW0LcnnQN6WveZbgxHIRXbeH4JZUbClsaMVc4Bts?=
 =?us-ascii?Q?8jqsLuZR9vaOFFTxxQsZh8laNhHTjfSKU98U1oZ18LI+aVxv8NBCCvz2LhPv?=
 =?us-ascii?Q?0cf9BO7XufaxGEyC3tOYz/bW51gXojv8jiXMYfvFsTdsRlJpzZMkZgraSvff?=
 =?us-ascii?Q?9eKIwIP44XiANbkSO1zasL+CZnTDzYPbL7Seu6Tv/MRy8RtOGzZPqlcsP4w+?=
 =?us-ascii?Q?5qlR5cPFweSyE2HajO2XO5lLQcMsxKuowUJlRLbQOBkxokDE45jzXtLCNaTu?=
 =?us-ascii?Q?f7rkWLuvv9d7ZhJhuUju8B2zxpCObAd4ehuGTSsiufYuZk9sd4rS9bSXxTfa?=
 =?us-ascii?Q?XI1CBzBwI2lAvoTDEVdXoPZ4X0pGgvQBRa98yoI0Pepvjcqb1RHaRML0Dz9U?=
 =?us-ascii?Q?9fHw3EuG0MlKZKHMtkAJHq4lY+6cIwSyO3+M4tt7xaxJMAS6Qc8uhO37jMV9?=
 =?us-ascii?Q?IaAIGokhyEGV/dVZHEgXfZY2nA8DQvtgEDomjvqfSIE4o8RWgC3e6OH7FKtN?=
 =?us-ascii?Q?c9W2WqpDWGnOx0e2jKOowvfxllQhqZaZ86iEbe7V3ULEDaFJBh5OOGICjh3w?=
 =?us-ascii?Q?etm2vPfPtSrnTOeeN/a0m4w=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1832f92c-8e4a-4846-fdd1-08d9ac19e5ce
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2021 11:35:48.3704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWhbOqFoQmnK+JRz0TwNtc7BfCG2IdvJ4Fa4+BWByPgOH/xsW2hkZOuYfD5y9+LziwFcWCmR+vo5n1FnHZVDOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9308
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>


V5:
 only fix patch 8/8 "arm64: dts: imx8ulp: Add the basic dts for imx8ulp evk board"
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

Jacky Bai (8):
  dt-bindings: i2c: imx-lpi2c: Add imx8ulp compatible string
  dt-bindings: serial: fsl-lpuart: Add imx8ulp compatible string
  dt-bindings: spi: fsl-lpspi: Add imx8ulp compatible string
  dt-bindings: timer: tpm-timer: Add imx8ulp compatible string
  dt-bindings: watchdog: imx7ulp-wdt: Add imx8ulp compatible string
  dt-bindings: arm: fsl: Add binding for imx8ulp evk
  arm64: dts: imx8ulp: Add the basic dtsi file for imx8ulp
  arm64: dts: imx8ulp: Add the basic dts for imx8ulp evk board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../bindings/i2c/i2c-imx-lpi2c.yaml           |   4 +-
 .../bindings/serial/fsl-lpuart.yaml           |   4 +-
 .../bindings/spi/spi-fsl-lpspi.yaml           |  11 +-
 .../bindings/timer/nxp,tpm-timer.yaml         |   6 +-
 .../bindings/watchdog/fsl-imx7ulp-wdt.yaml    |   7 +-
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts |  64 ++
 .../boot/dts/freescale/imx8ulp-pinfunc.h      | 978 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 396 +++++++
 10 files changed, 1468 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
 create mode 100755 arch/arm64/boot/dts/freescale/imx8ulp-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp.dtsi

-- 
2.25.1

