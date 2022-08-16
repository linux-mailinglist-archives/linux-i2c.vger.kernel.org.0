Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F064595C69
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 14:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234592AbiHPMyT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 08:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233603AbiHPMyK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 08:54:10 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02ACC6BD6D;
        Tue, 16 Aug 2022 05:54:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLiMfBZMRmH0lstYSLO1n8We0o1o5a+vhMj7kCA7cQkKsMpR3f1yrzgIViMzsEzUJsCnHcQsZgz7TasQFMnT+lLR8mRZTRXzo4OvdpDCAhij1M3jwUs0AJqXO6qQORddy405RYMhquk6w13B7Ruk2zgXh5d+IINp5+bzD77XNhxJRlpePY/4sQSDmvkcY9aAJbpqPi8kE0ejfF8gksVjoTvnamg9A8OttP7OpNIPzscahRj0Jxbv5iRz6xlTdIznhbCQcai/2X9GMALZvE9kFjfqWumNt6b7Ba0WeUGjaa+BUgNrE3/o0DDQz4i0fIf71Ro0wzoa8dmbB4N88TA2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ge8zQOxDQYMyAVbh0ZG2JEIz09zJuFV0DI6I8ZSoz84=;
 b=BV9jSTks5vgzv0MosKmovLA7aA/VXOCuhX5WKroxFAMH37LTx6FdLmkJYpyhSNyUmM28qQgYc+lDTQ4EKiFw3tHn212GTZkaMdyOR8n3MhEkLtXk02E8Ruy8II5/2FnorTmjhwS/0v5HP/GRFyFmBIKi682jG43R+bVaUiAhwmeAXEAUksn5Lc5VM7DzLqDWohYwMpmWwmZ7DfBi5Q5g94hNPqcOqc5RHEpCz8xicn5dtrop5mrgBtlr4wxIiWxwjItCKTDz9PTSV5iee3CWQjZF9ebvmX9eK7DVMt8i3ibYAUNIVTuK5D2AbLgpfIhNDqkIoQChH76wS8jhgiJesw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ge8zQOxDQYMyAVbh0ZG2JEIz09zJuFV0DI6I8ZSoz84=;
 b=Fjrt4V1x9ks7H2Sh+B4eqY/0Gss+QhIYz7f22TVLVqB2KzhicoaBPlhc5THWyQoVyiHt8O6FZAAOggWeVexK/wnVdLXsWZaybWFIVBCRJuGww3Gl7ipP0q7h8d0zN2zmzcHkvKymIfBzCB+k9ByNWNxeL/sUJoCSeJa/CLgr9eI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB8PR04MB6666.eurprd04.prod.outlook.com (2603:10a6:10:108::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.27; Tue, 16 Aug
 2022 12:54:05 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 12:54:05 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V2 3/7] dt-bindings: i2c: i2c-imx-lpi2c: add dmas property
Date:   Tue, 16 Aug 2022 20:55:22 +0800
Message-Id: <20220816125526.2978895-4-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816125526.2978895-1-peng.fan@oss.nxp.com>
References: <20220816125526.2978895-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::32) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74bbf523-ed77-4f27-b402-08da7f866688
X-MS-TrafficTypeDiagnostic: DB8PR04MB6666:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AvZDmfrZqeOKDuTZietnUmZ5Aa+mD2KIcpZM67wDg07DyG+9KgGL5J3E8cdRpFoCJQ00GLrcQP/F0qLUwRuJ7JJqXfkXKmVCorl5wB5PdxwGlb4bGEu5Ag71HJVq+85KlzHeBnluGbfsGHtkZ6gk85rFPJ4Km2BZeY498Icw7Fi2Ascwgz+pNbl6ow1n1ojAYb8zJ0uDNcgPNgj5Z/HqbAs/RqKurxzvEgfgu31Jbzx0naxK96CFEBCM0nOWNR/eW1RuhTbTargl0zQwxGSPJgy8ZN+xsKFIBxvUaUHr4SkGgiZkptIgYKWK1DGiQdQcyh4SPDPkt5frRhF5DGVviBJA653lHii3S3mUmMpp5DmG80DA4LYHt/n62m3AWLbQQWNerTGhny3DL4nogtAJq9rz72IpAqvMTS0vFaYXawlK/qHYRjOy3IcEVgUQ6FJdSALdeSF2AG+Lm3m0BJ13XPkFtQxdqyMo15dELOYaBh6Mv7lumC2KL8OkmZzhzzsUJLkYeb7D/MaO35XbfSk4UD0vp95wxZomXEXJ/pExqggPHmlrgZhHiT2AMPpsFdYblXp4w0Y86g599n6kFSGNbKkAxuW6Fx2FtvvIb7y0mmnQHfCp1bMMhSa/8Fwbj5d5APf2TrMd72fA9kU5L9jz2appkJjKopDkXYtEFsf+2xDXxKgkvIfB8Z7GUQzpjUbzqbs3QVl+uSMPYwa4qrS49q7uKrSVWz5GiK2RsQKuBfqTJfAYfmysHZTtBaxjXlBEoi6jXhgxWzymfrfwxcmOSxwkCtPWTt7FR/b5+cyFrXopqDAmV0W2H2uWd/hwzHaU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(8676002)(316002)(66476007)(54906003)(66556008)(66946007)(4744005)(8936002)(38350700002)(5660300002)(7416002)(38100700002)(4326008)(2906002)(86362001)(478600001)(6666004)(6506007)(52116002)(41300700001)(6486002)(83380400001)(6512007)(2616005)(26005)(1076003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kbVuaZM3Z60gwgvIc8xahdH4elHemvCtHHnePmBNPI52HLYKLr6x5HfPkwk6?=
 =?us-ascii?Q?ClKXih7dgd5l0LYYPDJTaF44iBSNRrhgN44y83huvk23v7C4BDNkRhJzDqDl?=
 =?us-ascii?Q?XLSdZbxXl83eIZgCLqnZfAttEpaqKns2QF9GJK7+6lBvaLLj6VrCVm6biQDG?=
 =?us-ascii?Q?ZuX07nIWnveW70ADhOVYChbIBLo45TzvXqmZuyMdGTXR1kEzEM/zyLnJOVJu?=
 =?us-ascii?Q?n6mhKID4s1JVV7zISbXvrRpghQxCQvuh3wl9XPg5Mc+UPAHWC8HySoM9+a1t?=
 =?us-ascii?Q?O4WRlZBdVJ105fXe9jxSxd3Se9JlpVw50KEBa3lXYk+43zKaJLAH1pUcPsnN?=
 =?us-ascii?Q?qMrh3A5eLw9SfDjGrfbcn0VuTBkAai48S8pAynKlavLFvbsVgRgDNkA9TWjk?=
 =?us-ascii?Q?wm2NWXt7P8mU6KBx5hMjngFnsyLZrqhBfdZR+PNhPjbR4iCEp4lMRbjbPO/6?=
 =?us-ascii?Q?7ARM5u/GgoQFxT4LtPWS6rZtrORbIVXBp/dfLV0T6ya6+BVp2YAXhV2Q9RNP?=
 =?us-ascii?Q?Yhi1Ov2mQjxyjOsclwmFPlgExxFAk4edd0EOzUNVB1FS6NZJmW+PIGGN31X1?=
 =?us-ascii?Q?dv8kk6YD7RMfniY+FNXXlmzaicbhqpR0jXYLHPA0dL9pmCdpN28OqvpdfiDR?=
 =?us-ascii?Q?Sd/X8Mevsj26z8BrXrDfX/YVE1YHRxO4zPmqHllsKakgDpxVC0dWrSerzxnv?=
 =?us-ascii?Q?Ps8h6+NVr+vg2W/0LC8OcshZzcJXj+TVKcj2ACTT7qwxA2k4JJM3OAkqiG6Q?=
 =?us-ascii?Q?NZ+Du/YzCahT4kmSIctnuWEz6Kumcrgk1z6svq84cSVTZEG2jPDI0qVXwO6j?=
 =?us-ascii?Q?A3Kmi+a4HaHiXJRmHejWFtqNMAjdrdWGSWrEBjwl6mN1qN74YSoQdGuOU/Yl?=
 =?us-ascii?Q?M3M0v9UrdV9x/2MR0OlFwvc8MUoKmLeg+nyf0s49Jx7x/CW/s8CBS47Y2aBC?=
 =?us-ascii?Q?Gd0lSRmIk1Bf3fLm0vuR1GFPz5GMgP2WDnFgnu9/6c7tB8MEqjSuFAHPmU5d?=
 =?us-ascii?Q?BE25w9U6zQSIpUSBSx1sEwoqIu/ozuoEVSNpOXBrfyWkNDjkTKmVPzko/mPG?=
 =?us-ascii?Q?1DBrSuhV+wPdl7CN6kXWmKsoioCtYSh9lQEc9vTP0vyl3YPPKF9L7xOrMnCr?=
 =?us-ascii?Q?snX89JwnBN/gcufMyG51xk287rP0HNAhcTqaMdFKc7CrX0iW4E7AJwbDG8f4?=
 =?us-ascii?Q?tI1zSypr6dNJEXp/ZX6kwtIqPziqIIvvC4bSaLxeafUMrHVtbjKDV9I78D1r?=
 =?us-ascii?Q?2QwCd+5ZgG4vF1Q0aWpvsAf57F7Q+MIDi0f7X291MV9BUsPpUbYQ/c/4zM4w?=
 =?us-ascii?Q?lDnEXovxDhnJt0L1/2wwUUubWSaHRKJ13DsliRHaZimaK3NT5p26pqXqx2Yl?=
 =?us-ascii?Q?4mkLmgPOSDXMlKmLpuMVe4xGvz8D9ogqfersKD0FAdjrUhCBIK32C+SMfrbO?=
 =?us-ascii?Q?TAma0Hr7d9s/JpYKn/JBNrAsc/emZ9in1o1o0Eo6i1IU1MaDYUFS9u4ICtsQ?=
 =?us-ascii?Q?sDbV0e2qRGqjRNsJmkonPb0zk18yQcMbWtuz2reckDe2c9IyXIpS+vKtuWZ4?=
 =?us-ascii?Q?3vDX4TWDNqnoJypNaUJb1Kirmwn6cxDtNm0hKMLf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bbf523-ed77-4f27-b402-08da7f866688
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 12:54:05.2051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mm1TTO47sPVHi6rzjj3U6zRr8Xgl12csRAQQYpqpaub3XZ8j3yEU7DMs9vZ94ScSCXrmn36Uv1AGkXq7ZkIWvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6666
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

i.MX LPI2C has dma capability, so add dmas property

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index e42e35003eae..08b81d57d7e1 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -44,6 +44,16 @@ properties:
   clocks:
     maxItems: 2
 
+  dmas:
+    items:
+      - description: DMA controller phandle and request line for TX
+      - description: DMA controller phandle and request line for RX
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
   power-domains:
     maxItems: 1
 
-- 
2.37.1

