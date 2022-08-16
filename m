Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1445F595C52
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 14:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbiHPMyA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 08:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231875AbiHPMx6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 08:53:58 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2088.outbound.protection.outlook.com [40.107.104.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14C462A83;
        Tue, 16 Aug 2022 05:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJXSnAxXaC/5SnRubnwxNonjd92VFxyAMGHje6Jz1qvEZIFIkA1+xEd2n7a7AamhWPA9vQjFNs5UhHsVdhqUH4kEhW4IbhHaCEQvngsK9L58z0ct/Pox7aWpfaEhcLHNK6QlI63ZFfuGuhQvKE+9mb/3p+p/n5CpFsZn/yzLXY688m3nOOuqkvVww3uMCTSlYxCH4T0rgJl6ns5O3E2lmniDn2ncD8JzPJFm7oVUsQ2wcuDzReGPQCYZbxYJne3XUPB16RZVCcFBFDbvalWQINI3tZwnV2rUNzfi78gg7sVjfXBolxZTb1afqqqnpwtjzcTHyiXzpRrBg3TGJ8jaPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ip5CG4h0QGUbPYMKyRAr4dBLI2mvqTb9gVapwbWZyoU=;
 b=Nn5+WtRv23W3I4aXmYEFuh59vX2x3+WeYRYuBews/BRVIBosntMWXKB3cyzQoSX+4pyd8bCTjA8qiJlO9MRPRzjtDHH8Q1GcfS3+ZwayBh2Dg5Uil8W3ZApumJGl+Z4NJg2Hk+aMDsdo4VQff54bDjZvDzHYzszbnxhUSPr+knhZaOV7ZbUEqVaJabIk0BTr/959lmz0HZJGiQp9yKf6ToaBo2zSmlYSjU3Dsom9eztzJfeFoG7+gK+QuTH+ebe2PrHtNydx9/WCDZl4xEPPs8q7UENHkbCg0xWVzYnal5kpQbiuklxIctXtb6VSMMeoqRU8j5p6oPetE5b66d+EWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ip5CG4h0QGUbPYMKyRAr4dBLI2mvqTb9gVapwbWZyoU=;
 b=HX07D3+VxQ3stz6aEKJ3keXXZf0WblP+GyLJpNPOPyCnshwpKjbVw0frpMqj69ljqEZyAeRVSnyMKFqVM07QPzmBWhjbCDeiCpDLM8FGBPwQDb3ySOv+qRvCtUXUEv0/HZHymYjAusMptSUT8+yFOVPx6Y8wD3kjAM9nf0u3FKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB7PR04MB4060.eurprd04.prod.outlook.com (2603:10a6:5:23::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Tue, 16 Aug
 2022 12:53:50 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 12:53:50 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 0/7] i2c-imx-lpi2c: add IPG clock
Date:   Tue, 16 Aug 2022 20:55:19 +0800
Message-Id: <20220816125526.2978895-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::32) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaf17b58-af31-407e-39fa-08da7f865dcd
X-MS-TrafficTypeDiagnostic: DB7PR04MB4060:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TbI0EoxZ1DGX3Z5rXtaq8tLHZv2wYZvWJGtJl6qWoTK+cpt8DpXNnYMGjlVKKNtTIWnDu27lRQDdF5Fw1vRnIDBKz0I8VvoHkbPNZcJGMHsRFGyvFvNC48o0e6hDOFTdcwIBWDX70IINTK0qJ5FjYBRbLuq0fYvKIY6R38UPjP67/lIzJRI4PEiNHK2WTlVqZwgm4LqRJIk4znlzjvmxP/+3rOk6cZC8nRei/SaC5nA2BT/o9Ujb68Jkasg+sc9W3+8cuBldPVsiJyRIhnwp8NkRIfAQkV+bvwJn1vnznVKBOz9TqjEChpoi2/PsQj5iRuTmRXffMhHu0GRCRcRzBlSIHV3YunZ9hUNFn5BEIMWObeUZIxm6rrAXrPXCcJKnohVTsfpQ52XnjKuk2PdH3YB4Orn17+2cj1IDtWqio4bu86XzmJXpPcHC7hXZtDWCJ9fXEg7h1Pau8bV1rkip9FcRcezvO/e7lSK4l9PGm3r26eO00WlYCvkr6GzN9/yxE7XILV9FIU6Htq/BbhLknHO/0nKZWFZD1tw3SnV9aNs/7Xwl+msOs5kfP1F/DQZTcaa0YqfVcJBtfshApVP/kEi42r+PMb4ILoZfC1B5qv9qxZ35QrGCZX5x7uIbmz4gkbYAzC5COoKx8iJK/aV6kXbi4L/0G3Jm/uVqOHybn86bVihGjJE1zz0/sH5ld5dvZfmbU8ROnGimTpB+QoC3mAMH+YfMHZksBHdtjmphYp3A7q2lszvR6O0qF2+sjt9TRRdaQ0UJyzA2Iy/yYflTDSv5BoLeMq6wSHFu1TS+OaNv2xdybIkMdwobAZV1zcT+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(26005)(52116002)(186003)(1076003)(2616005)(5660300002)(7416002)(8936002)(6506007)(6512007)(6666004)(41300700001)(6486002)(478600001)(86362001)(83380400001)(316002)(2906002)(38100700002)(38350700002)(66476007)(4326008)(66556008)(66946007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KGuTeD4XKd5C4pZbHeBmw1Ae+wG6nL08AqtWgk7Vfk6hL6IC/Nqj6ui+HpOg?=
 =?us-ascii?Q?em3haNLLYYXBV611AvErQYPVpAludiTuD2gVstiH0Xy/bMWTGNn8VxwH8jMz?=
 =?us-ascii?Q?/y0EVIB8YcU7Z6FtHgQ5vvm8aZd+oMTT3XnQMLjsYQa2PBUJTwLRD4d7mell?=
 =?us-ascii?Q?+pCT3pa7cA9rSst+DdMot0ey1ph9wuFphTaEO9AAfi95GaPfrlUKaqwl7DhS?=
 =?us-ascii?Q?nHFg9nZW5fK7I1hh9js7JnvnEDuOgt+cvYNZReMDUDGKLS2em4wXDdBpy5cE?=
 =?us-ascii?Q?mXfByjSqjd9QwvjCXV2nEFHZBSt72VJLz+TiIgGRu6WiLTwEpwhS0dL4uwUy?=
 =?us-ascii?Q?do0v4T3ctLNBWgX9O0znA4X2XTwc0wIZL8wua/y6jks2H5TaRD44gXy5c5PK?=
 =?us-ascii?Q?ezlICOKIJx8Ho0c3RSqgJaacQ/1RZK0J7g2ZMtqK3hwN+YfCvEm+MMklBFEl?=
 =?us-ascii?Q?K7sgcuj81NWrlX34evtbskMwuZ84Le4Cy48S0IlK6kiVCa9ymhdOMz91xx5S?=
 =?us-ascii?Q?kItlIMKrntJdYlASwilW/h0VOR46GNY0LycaLgX9IpON78BVegF6+f+7X58W?=
 =?us-ascii?Q?rcZe86dBMGH+1yOzQr7a+iVxcDJashE5FrHvHRRku+3wBoiH3PCFivsjW7QH?=
 =?us-ascii?Q?6AunhRq+kT2gnikrXtPnXWH4dPgF0C+XqyXFd8CyuFxZ/S5se+Jek0RglIsV?=
 =?us-ascii?Q?Z0ZfllGmGuISIDJyWhS0OAKCxL/rjhtEEwtPIVSDd5w46PyWcC4xOo/Ip5lv?=
 =?us-ascii?Q?09JJhsYUb2QALWNvmTtCawvTNF+Q7yMNVSGMoeR3SHso+GoMpi/jZXl6MWfw?=
 =?us-ascii?Q?p41xpT+012iJsfTS3FXR2RhEflaj/+/Xf+G8ZgB/CzmgCL+sx1NuspypjzfX?=
 =?us-ascii?Q?dXe/YO3rNUsOdLoUroghldqatlnlySd2hiBLviwK9phlHGFJ7a4XA0NX7G7e?=
 =?us-ascii?Q?LoYvgVk+wYI7TiJyVuAU1r4kzLzRGvEBYwVjcKkkuMzBRzYLdSQds0Tm4p3d?=
 =?us-ascii?Q?EtrFmVoXqU03Ow6wk8C8Z6DbI0YCX2LCllAqoRWp3TbQHl6t8JYNRjQ9CAbD?=
 =?us-ascii?Q?5rdVP+asoGIRRcFCQAzM1Mr1vOhnyT4/YClEz3TZDYHhxed+dE8716chlxWv?=
 =?us-ascii?Q?Fn2YmJucchiXUghkTVE+6BiX3rW91kI8SzDvi34Zna09cR/yUk3HxQYJ99tA?=
 =?us-ascii?Q?8Ik3IS1/4DSpYVARvqDCGWVQjCHDBITUl1ixYTEPNbtBgQf22gHALqk1/xbp?=
 =?us-ascii?Q?ktBwp6F7f16C+J+foWQvnguxxFdUQEh10ZjLk71tDhOrSSyrve2p5ig5sLay?=
 =?us-ascii?Q?YxBX3NgNsufHR8nVfWf9Kh3CTRzWEk9UsBza0wsvmO0YY3UXMlSb+MuDfmiD?=
 =?us-ascii?Q?4EytzRSYLKTqAwz2GJrYx9/iyUQnlHF5cdNzsH7y4xMffN6O5OZtWvjD5Wyw?=
 =?us-ascii?Q?fIx+jER5cUYJgL3xiRSLnIG97dmmtekIuNsc5PQvfUPFrkuQF2ChaSqxK/Cj?=
 =?us-ascii?Q?YEaA6JvNHwockvpa7NfIytpDAveIZPg0ILeaQNIkdIKUZstNE2lLVcYQR9Kc?=
 =?us-ascii?Q?FOCU+vbNfbxee/PoZOd2p2zP0ZI84de21DO4hgyH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf17b58-af31-407e-39fa-08da7f865dcd
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 12:53:50.5703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2j7q8urZmuuNFrfHcVDy6b9uj+yDmhyl6DFGJkQXhN3gZFes7dR9H6kej8WjN7VA9nCQ8OtjWEPp5uXCg0sC/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4060
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V2:
 use clk bulk API in driver to support backward compatibility.
 Include a new patch, patch 1.

The i.MX LPI2C needs PER and IPG clock, not just PER or IPG clock.
The current driver/dts/bindings use one CLK. Although it works with
with upstream kernel, but it not match the hardware design. If IPG
clock is disabled, the LPI2C will not work.

There are changes made to ARM32 i.MX7ULP dts, ARM64 i.MX8 dts, dt-bindings,
and the lpi2c driver.

The driver is updated to use bulk clk API to avoid break backward
compatibility. But it is hard to avoid dtbs_check pass, because the dts
and binding update are in separate patches.

Peng Fan (7):
  ARM: dts: imx7ulp: update the LPI2C clock-names
  dt-bindings: i2c: i2c-imx-lpi2c: add ipg clk
  dt-bindings: i2c: i2c-imx-lpi2c: add dmas property
  dt-bindings: i2c: i2c-imx-lpi2c: add i.MX93
  arm64: dts: imx8-ss-dma: add IPG clock for i2c
  ARM: dts: imx7ulp: Add IPG clock for lpi2c
  i2c: imx-lpi2c: use bulk clk API

 .../bindings/i2c/i2c-imx-lpi2c.yaml           | 20 +++++++++++++---
 arch/arm/boot/dts/imx7ulp.dtsi                | 10 ++++----
 .../arm64/boot/dts/freescale/imx8-ss-dma.dtsi | 20 +++++++++-------
 drivers/i2c/busses/i2c-imx-lpi2c.c            | 24 +++++++++----------
 4 files changed, 47 insertions(+), 27 deletions(-)

-- 
2.37.1

