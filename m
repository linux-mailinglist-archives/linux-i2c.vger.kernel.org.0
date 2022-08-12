Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C643A590B36
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Aug 2022 06:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236800AbiHLEdE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Aug 2022 00:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236796AbiHLEdB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Aug 2022 00:33:01 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D319C8CC;
        Thu, 11 Aug 2022 21:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cj94muLMDUx37HWfUrXTGKjZDyGGgwGrfFnyej9J0xJmc7eLVsGFIibIAaEIHDSRKDlICO8F3Pk7imN1oF79Wik/JzBlWkMtW5qFnJHremngEeE0q1QsiUmy+2+B+Ei9enh2iYt8XejMoPFKp5+3pT3pS2c3SWFMHTunsCnU3lvS+ZV5Kaid0jea+bQ1aX/pMDSp2sR7BnNBX3n1hbNXycv0hXZaFMSIorlckQVHmF3P4c7s/1yJ6ye6siOnJhpbM6NfWFMtCPzzIc2WVMO/aUClWTHrtMpe9Wz5GH50TiGNizNVS6PmtURnoh5jxrC3NuYxfv57RAf07wHIcifeWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSsknT/2mIv5Sm6vK0UtjWAc7Dqljg1xtrZ0MhFP7Bg=;
 b=gyYqh/DxEzTL5uWqVvrs9LwK1hDMWwx7wrHNpGifvrPtBPv7NcEpTuzOzE+r1rd4VpQF0KJ2EM3/N4cfR6MxOs1kbflS1SiYp9HgP6O9edQKWg2dNWKQhQmkHkzTvCWZVg9oslecIHMauH6DJxlVfSbVrY8X6HgbGa84x37P2AWWNAqDpD/l1bGfFGO3jVXh/Q0vT/bj8AdvBjdGDe18eDboEj163sdYQ5lu8sismnq+yjp6SBBD1y5F7HhLtuSSHcLcZNu+DfwnBdrAqq3rlIcvT5o2K93dDqsgGWN+leHJ8jBHOMOuHFafyoAcqhZm1Ci4/MwzZL3Sbe/+jktlNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSsknT/2mIv5Sm6vK0UtjWAc7Dqljg1xtrZ0MhFP7Bg=;
 b=Kr4hQFg6Ci6HIsE64AGpVXCoO+9dnytmx6e20hE4YMXa1yyPqSoHdnDIVVTV4lYes2S/0LWF1daFcw3CgEZMdsM6uOwgsB7BAqw7eRp/e34OeH4zHi1QGvFd4pNw6RR8Szl8bRKiZweHrasl0crSIB1Fqtq9v1XGpx+bu8TmmhM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM0PR04MB6243.eurprd04.prod.outlook.com (2603:10a6:208:13b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 04:32:56 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 04:32:56 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/6] dt-bindings: i2c: i2c-imx-lpi2c: add dmas property
Date:   Fri, 12 Aug 2022 12:34:20 +0800
Message-Id: <20220812043424.4078034-3-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812043424.4078034-1-peng.fan@oss.nxp.com>
References: <20220812043424.4078034-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::12) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad9415cb-1453-4fa6-48eb-08da7c1bba4b
X-MS-TrafficTypeDiagnostic: AM0PR04MB6243:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YXcDGdMM8op91EIym74jYrFdyahdWV6EiOlty1cLjUx7BuyZxxKlMPK7qfcEmrdNXzIZyLVnk8bbkUmvLYz5/L+x9gV2fou0jooy5JYSg/KHKCr33//xKVoLHHMEGSTdqbbGfKFF+QLHJAykGIsqhv6YolTLROIwfK3tGVBQ1akZeKTZ3yU02uDUpZTnH6kcTeMAXk0yiAQLcOiTJyzKSM4aFMUWrM7lEzK72E+aWqsFV0DBfWLkKoYZDRH6f9GW6rT8G6J1L9V5AGKgzTRJSjr/iqCxJ119pUYsCIPxp9TRTrm18IqzFXPp2hmH337dLCIk6D+kWwfbx2BgciiSb0TCkMslY7LkVmPnUxL6GztL+NmMBKYEO2zFq7gy6KaO2UFyVeZicAcgGj1Za1lrgvwVwk+hT6oF8G8Ph6ugaDX4RyVUhZ0Z59aJw5Z+VX5buMsmRDRqEfzXviPiOev2Kqc8zre8GOd/UDTy6s6sNgZILQPozzQvGg0XQSemELflLTqRL37mhrLb7LcuccyaV9qg/tfiT+lv7a+4Ai7SZqu+nWFq2FtNWBosa/9txMOLIdSWTKJll9hpRTr3PxBdaLnRqF35UnuMui6yvdrAVg3SEavVwgJUbHMJo2Y+aHsLWgQuNTFv7zgv8ult3PwDEFaMPdnquY0gIVJXnImIg79P2nsy59G6z5kdsX4r4N1Qp0+7ED10rj4+dTzgL6lIcp3hmXGkNgMLLsJNEh8NKaRE+e04aBmN6dCT4WtaeBiSQ+dqqh0YOINQNcAaZKn53NkSA/DAmPhoqHQv9VdjLTlVNpQb96B6RUYsfHTbF6Ne
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(86362001)(52116002)(6666004)(83380400001)(6512007)(1076003)(186003)(2616005)(6506007)(26005)(478600001)(38350700002)(316002)(4744005)(41300700001)(6486002)(66946007)(66556008)(38100700002)(8676002)(8936002)(5660300002)(7416002)(66476007)(4326008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EYzNEGYsBenlxdjP3PgecjV/K8CCYuif73KTWXdwzbWcQKNW3Y6EgckTx4xn?=
 =?us-ascii?Q?s/s9DuRaENCNThauV8sIN5Ac8zE6rJnK7HYXji7Aj9WMl5xDeGiHfNU//cM9?=
 =?us-ascii?Q?tINlkBhp3b5fg3MuH9yAYjGUequ2fApHAIJKtcqfEd4x2TQ7Z3zwvkXsJv51?=
 =?us-ascii?Q?7m3xZ9J202nvB39lp0jtElO6xozsIq8QEQrA8sNCryQy2b4X4E44orh61j8R?=
 =?us-ascii?Q?X6NuUu4l3wZpJtWmPQaIA5kP5OTs8EFZCcfWIX8XaHr5g/Wyo8x7T1jIL1w/?=
 =?us-ascii?Q?AP9oIG9KEVjEymROSYHJKRpMxRDn7mVFJA2bguc5xr46l6Qyri3br42vcCrt?=
 =?us-ascii?Q?TdRdYEdaCjagQ46gUvBFtg5g48Y3NcfWnSiRh4QJKW+VF2JIXZk8VPv7Aqz2?=
 =?us-ascii?Q?/J8CI1GWhxEOApeFzIXL2DGvNO8nq7KKmL7TMEfxp6GpXVSh9lyDCHDeQLlQ?=
 =?us-ascii?Q?PCxYZcrdelfOzshxYw+ibcnJrQcpj4m78jHC+M8Vzr7XtrzOWQ3PvWAqM4Yv?=
 =?us-ascii?Q?w0ZbMTmWO5WK0rMcFJpuqffiX9pnFGLYCpDH5im0JgNDLMJBbQdjhddzz5nR?=
 =?us-ascii?Q?oC5/Yf8TKjDmwMP5BLuznyYVYPnRCa+sFGuL0QKP2Jp6ZmRRPgdeYJmt3u1f?=
 =?us-ascii?Q?991sDYN40NFRp3qLb5OalUXvsbx4S1fL5QZX7H/gK/xCT4b55rNsGh2Nrxa7?=
 =?us-ascii?Q?4HrZAlkByzVlHqWK06VQ7mnAs4v/tnhYKyAKpAlIUOQrWPBXMwRDuaF9cIZx?=
 =?us-ascii?Q?bTAgfyVXLhhQdw/f/DSCPiWoyJv6pwhqXvdXv46P9L6OnlB2Rpqr7vu+2k5D?=
 =?us-ascii?Q?2yUn3Yub+aHr8I/LjSpCBgPj/cXDv0/H/gTlqoYcmC6ubHUZskI7F4wXNAOX?=
 =?us-ascii?Q?BUnIXT2D4Q/Mn6jW+orYXTbAZOam2P+ff3WuIXiIJs9w6T28DsHoxjUdMZ7V?=
 =?us-ascii?Q?KgcwoSHz62MBpNb8NBLaHuZy+AmSSCf+sZ3fanPx3bAsv/gH5tbJuHaUQV5U?=
 =?us-ascii?Q?Ag2c6idZCNDaf7G4FP2qNNETA/IqJTKPOyEwIOHwafo88o9pftk6Hzo3/Qw4?=
 =?us-ascii?Q?tVaEwkQPTp15OhXgELG+C5fB1CcMrXfXSmJ4F2uFe9IgDR31lrmF65LvegAt?=
 =?us-ascii?Q?f1zGI3dGTIwudWoUTAgNbL7xgpqZd6GC5S40IFPJ3sigvmc8/Dvr2YhwsWwr?=
 =?us-ascii?Q?98olkIQ2aS7poJkM6n0rtjFhdk0G/lS9+l4JTYKgKMi1XGYpIHiaJhnNxs8n?=
 =?us-ascii?Q?UNaZA/YaUb0gcFrJvcFiJj09KXg93+cgPpoNaH8ouPP7MLWlcv7NbzVAKa6b?=
 =?us-ascii?Q?LRncpWDhh5spvtu8kldYC2ptUe4EHQNB2xkVecWJuRHosE+O7mRLMCL1wcFw?=
 =?us-ascii?Q?Txk0NRuoE1J0YCKVdmsUcjY6ks1609HLdJpoehkv7dAJPrQzhaTHAIb5/3i0?=
 =?us-ascii?Q?2ZVdZkpR4CRMnncJXW9cP2R/9NtKlT+m+d3mBMgBkUbnILGehOO1PDD7W27g?=
 =?us-ascii?Q?on5rKFvjqZZThhxCASpq0/IA8PVihDSxEuK8D+x2xUZKU31Uls2vtve68HLe?=
 =?us-ascii?Q?FLUHPYnzO7KcX/Q65KSWTyovvRhv88IaY1C28i85?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9415cb-1453-4fa6-48eb-08da7c1bba4b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 04:32:56.1084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLOCZHg9Ma/3Z7M4xIm8MXg725hxYz8P3uks5902XDPQk+gKfUGv6KGuex7gH0ne4xFvYbujKeHW8GOkScNJFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6243
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

