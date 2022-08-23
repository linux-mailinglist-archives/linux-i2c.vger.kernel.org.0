Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66F2459CF08
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 05:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239779AbiHWDBW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 23:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239795AbiHWDAw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 23:00:52 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD0F4BD3C;
        Mon, 22 Aug 2022 20:00:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUxpEDK3vifQtaarRfrRlW7fdRlfuBRT8BBkHSQndO1QhIwB1Sjwq4tofvo9udlR4CcAlnYgj7Gin3+9pbc2GapyVOOqqHDPq4eC3qHqYXtqhHTKhGfCXjSCaOJ/b2tB0iljuCo+JYw+RRAT2ESAqW4yxOBiViVCbyW7w/N6q4bx3PTakys6AvFEQEnL9DzIvHICLBNeMBA+4xKL1VE6wHl7ap3dg9xizW4wYnNHfHzhZlT/dLKAy71Jh7+XJaFSK3fq3svgHz/WxiC02QDOg7buFTC/YrUKHP2ajUKYK+xaH9rTA51JUBVfvtcJgQiOJNkKC/fz1Y5MyyAVXIvcYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1Z37SFftJIzl5kACrV2ttMEWtJ32bivkm7GeQc61pg=;
 b=BPG9P7iCNjYPkkYw8XnixAbMIL0FdyBLUHVfQvGWIyUMGTJQbMc+9RHRjlVTTzTYukiYyH5kTRli8iOQMNZVVx43sCsmy6MC6H4cRTChUZvFJnyb3G4a5XIF3TZJcZHtPGQTG2EyZljhjEKmmL/0Q5Z4BEg2nYUEPkTDFLmiyrvKnitG1tpoERRbH9WPuwKk4uBCfVmDxEd5YEURlWkPGe2HlXHR/Y45smntdgkyJAY+pAzosL5xo4WghGOwfJmJmsCzu+vdenTPg7qNCzYDll5Wjs7TzwF5o9F5xK7xV5v/wQ3SG2dosPveRzc+vsBBDnjZMFd2TsAU+miMjXLQvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1Z37SFftJIzl5kACrV2ttMEWtJ32bivkm7GeQc61pg=;
 b=mvYIFRJ4mBCSFppFv+aYZkt6ot8Yn07R75iASO30Y8zKhvGZiyqPvE5pTs4W+g4biXkFSyy4qhGvhARtkR2lmNqtQ6DFriDFe1cV850g8zndUTPu4HN4jRvvEAp9F4BUr/onJYlze//kFfGJ7zui21pQP9v1SCVtxIIXM7ERjxE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 23 Aug
 2022 03:00:45 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 03:00:45 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     wsa@kernel.org, aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 0/7] i2c-imx-lpi2c: add IPG clock
Date:   Tue, 23 Aug 2022 11:02:08 +0800
Message-Id: <20220823030215.870414-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36)
 To DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e198ccc6-e485-45d8-b0ae-08da84b3ac3b
X-MS-TrafficTypeDiagnostic: DU2PR04MB8824:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MuOnIsvIf5eNOon2VwiFNUMjSZz8eVAzb4jwXFSESQwKLBNNvFGab1+mbbqZaPSsfYqEKcLGRS61k5VnxeDKavPPXQ6WJ6E6F9xSzRckOieJMgJinSZfE1GEbIRaCNZnnNxQ3Rhe+OAxKH6TaYiy/QXhl77gLiqJqGZFz3MtJMMqkNbyYyPtlviVT9ocWbHwNhLKqeQUZRdme11+NsR0ikKH1JCIgZVhOHoXrQ9Y4CYE8CJ9+z7Jz1whAnBXhiJ5CZqiaPH+f1Ns4qrpDsvvzydVr9vK+AXBaGOSgmQyieulkSQj2eaPNu7MpnJNprqDAfi/zLQrW5+6Bt7Uh4pxsXc1mrIPCsuI0xUiRkQkfnCAYVQDMTOHTzArAkSDDWpbI4PChu5giqo+QrOPgusQy3aUQz+1kFemMlIp2hQKMIKwKhgr/y+kIiHR6AFzW8AtB4IPq91jT6yQ7S0yNlB/k5k0yZ2m7mRW1iIGioIEiVeWbNBiFmXMJAb+von16mz1OyT4F8OSoVImMafSbglBKOAPNQ8zc6fLwCqn9seLbgm3lYdsPXcx1Drkc/SscUahIRMHcsCdMsdvVwOtm71LVTISDmjiqtY0TJsfEo7VL6o1IA/VHoz0KRkYccWRXb88fQazWSvDrhts7pwyFaGLwFM+322GZFpfpmXURGSz92HKzY44SP4ivpMVZRo5AQ6gLw7xQfQs+4uqF6vSsO0WHby55kPbRzGnomBxoOI/EWp9AKrVoafqXoAHbybpcGjoDQAPHUv+Cc7dNOjG7MnzWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(83380400001)(38350700002)(8676002)(38100700002)(5660300002)(4326008)(66556008)(66476007)(66946007)(186003)(52116002)(8936002)(6486002)(478600001)(7416002)(316002)(26005)(6512007)(6666004)(41300700001)(1076003)(2616005)(6506007)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aQUnQNXkZEN8iQHRIPkxW8Y5cISjdxATmwwkqrKBTIi5Bd4gdTzRQknjEczp?=
 =?us-ascii?Q?CfyK5iGQRFDkEqnOvTmyyrHQoKgUktWWkXXmOjaRC+0TKcTwv2KnRiYzfR0x?=
 =?us-ascii?Q?E9d5HrUaMQVve+syV1BOOXRDZyN1nw3UoCd68T5iYnGZQcLKwGHd4GJR09ck?=
 =?us-ascii?Q?Ui+jcJGUZVl1qmpK6ZKdGmci3mzKLf0P+zc/XIlyqRdQy7Qf+lPpb+OwlHuT?=
 =?us-ascii?Q?tWmNN3Zji7nGLUXC+i/Gryig3E5hnwM5zzYvEvLpL5GGuReNuFW1/73Fx5DU?=
 =?us-ascii?Q?J27LVBoWwTSg/Wmc61/KTMCaLk3nMquPPT9QfCeF0ggNAXb0FeSoC+xSazqK?=
 =?us-ascii?Q?3CvPehUccS2Kvyb4JXF+x94m8ZVtq9uoVweemzhfaaEvFX5dbwUX+/sd3pqq?=
 =?us-ascii?Q?4PcySPeQqgyulECtqojXdLLoBs6Ghfs6cGWKcQXawmg14UowoxoLdWzJy+/S?=
 =?us-ascii?Q?pfUgYHex2TqmueSnUISSP7ihlNb1Y/JnrPGng9IQBwYVOUh+16RF4gsTi9cB?=
 =?us-ascii?Q?F8mYnsBSGt7OVrJV64z6JIchk6K4TdV50XcrYtShDlyMJu6ysp0VRhPdI0OU?=
 =?us-ascii?Q?jesC8PelzJWd6A8rJNbLbpl9b2+zx1C/BVmE06XQdfg1DLXLCwnQFqleCjUo?=
 =?us-ascii?Q?M53uiIXdzNR2nKMF49ogWabvwflZcbgYL3eIPM/99OcTYdMUa7E3LYVRZbYU?=
 =?us-ascii?Q?7Pt3j7qxfkosg5zdNGDhVx753yVwm/goOt3ldOaTzbuYBDM4dL3JtH+xeurb?=
 =?us-ascii?Q?Lo26mq4RfZwBvm0N3NQMVZYFajzM7gd7A4jgTLffaTyD1YuQPwJptpIFzi8E?=
 =?us-ascii?Q?Emyou77G/HoJ3Q+Ti/iHVu3j23GMlv0xUeo/Z9KEvALABHzKJeJMEqZ0SEGT?=
 =?us-ascii?Q?QWVlFeJfQyRAqTIjQgcSlkGYbIygD/xu6EslgDtiVGHe+Tx7LoDkTb4K2OyI?=
 =?us-ascii?Q?ujyRHEJA4TWWv1996+X+H0Uv8e0aJZ8V8lWQY9/fBWHyji/wgsWCYoRooJCr?=
 =?us-ascii?Q?qSQJkOeBj2G3NYyd37fryfx8z786gMgmVa3s7PyFvHNLutI2ULzUJ0pHh1F+?=
 =?us-ascii?Q?m5NkhN55vhUZ7yV/Fcop5sBo/oqgjJI29fBMcNWlbEy61ACEjHYMlMcXw0TQ?=
 =?us-ascii?Q?rlz9dcm/4+PWMD3mOutBakuv0pDb3L7v3k6lykfGGg4dYznYdwdH17V0m0P7?=
 =?us-ascii?Q?p5CKllUtMfZi73XDAFYywlDOr49QVvrLXT+c66xxGd7E+QFiSOXHow0ZWhP1?=
 =?us-ascii?Q?yyPDTpgF5Uk4iW14/7v8xsF5TBolz8ptQGdiALk4VfDbet3v8FtIcNInX3Q0?=
 =?us-ascii?Q?5uiFnX4MXrfi5antgidyrSFRIzb7t+ZtKTJH7xq+lhby4pZQ06gbENw6lTR0?=
 =?us-ascii?Q?OcXp0FOaJAzARl6pvQfHRpal9ujhTFQyr0J3QSNXffFjPvNwGlpRCPCNaXEU?=
 =?us-ascii?Q?MXX0FldoaAnsNYSKcbb1qkbrpIZmzWP59h4HGf4+qi4V1hUAGUCNAyZFp0bX?=
 =?us-ascii?Q?GG1XmvbObVkgj706nQoBKNrgmSjUECXM+Up2BiaUZ+BUMYMInc6+In19Jw8t?=
 =?us-ascii?Q?Zmy27jkV3Zb6ut6ZI1K7sW551xCtMVzQnomg80oK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e198ccc6-e485-45d8-b0ae-08da84b3ac3b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 03:00:45.2295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwWs3ZNRg/+bW8ZRzpRsn/G5EfraEVK6bKcAXxC5kgzorY9Yzzgb0yn4uHnCo7Q1FVrIUSSsp7EBizM+GEcIVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8824
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V3:
 Add R-b
 Correct clk_bulk_disable to clk_bulk_disable_unprepare in patch 7

V2:
 use clk bulk API in driver to support backward compatibility.
 Include a new patch, patch 1.

The i.MX LPI2C needs PER and IPG clock, not just PER or IPG clock.
The current driver/dts/bindings use one CLK. Although it works with
upstream kernel, but it not match the hardware design. If IPG clock is
disabled, the LPI2C will not work.

There are changes made to ARM32 i.MX7ULP dts, ARM64 i.MX8 dts, dt-
bindings, and the lpi2c driver.

The driver is updated to use bulk clk API to avoid break backward
compatibility. But it is hard to avoid dtbs_check pass, because the dts and
binding update are in separate patches.

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

