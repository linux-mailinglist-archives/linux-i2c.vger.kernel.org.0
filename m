Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7735959CEF6
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 05:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239714AbiHWDB0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 23:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239550AbiHWDBD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 23:01:03 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03745C95E;
        Mon, 22 Aug 2022 20:01:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ytdkw6335EKxeu7qf9QyKBR9x33vyc3KG3RGcZYAWiRQS0lOYKwWjMfOdRhc/YdysonFT2WVBd99i/n+VDPdwk8Ib9/Yg4Uk1fthc6mSMYT6SKRKJHc223MR4XqUQ6nfUE1rJQBpNDK0avqBTLkoWJrb6bwsgQ5mEphsfFjPHonqFcVm/5xnNSzUXIr75tebTIAQWCgeet9rzFHXkC79eJgI8sFA4XAcXyDspuR14HyMIZOB3MeNTGnmJEBTzXUBRVKyKGy5yeXZvFjZ48q2+K9QvH4p+l/zppNI8puguUiB89YJQHncg7PjtLFCkqwcvP3uCDC+QWLRuxY+/Uqp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6xs9/SVHolKDtRtLssQ3DvYE1GiZflKw5Uq5wMRruU=;
 b=nXKLS7hjiODLg7leN1rgi5473HD7xUN63hJ8e11xGnUVUeuNBHWRmA9IFn1x6kRMAOb449oH/bf8P+drCgyPQAt5n5PlolY95JkvBzEVywez0MHO7eeAMRXZg0OsZbbpG8Qt3YoJHzcsIdsYms17vmwgMOC72qkbvmDCFpqFwcrhoBjFkxefmTDAp+FvxxQKi7IrgOOteKIjn1iYT1xbVg/27xVKMkKLqoMdNu/ZPrqgz79S3OJ/Q8QcgANTrG3dFkv0612VLmBZBkqCSEO3FqaGsfMoRWUZuYP00VBTAo+xr82Ka/a7isA2GKr+4twYIB0KIIPZFfnUTiztZ/LLJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6xs9/SVHolKDtRtLssQ3DvYE1GiZflKw5Uq5wMRruU=;
 b=jj2G2IkmONhifkbkW61rPgERQDxxg10Gcv1p73IiKUjx/g6XPhLjh5/XRHvQKzZEE+B45I+fs/z4XyIGhdLPdNE37Ivxc2DQasFlmdLIEQDAvS07a1IDfN8NW0oUcszSfSLR1Jt4xzpCjREo9azf8ydumx6k1D5nawky6huYYk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 23 Aug
 2022 03:01:00 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 03:01:00 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     wsa@kernel.org, aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V3 3/7] dt-bindings: i2c: i2c-imx-lpi2c: add dmas property
Date:   Tue, 23 Aug 2022 11:02:11 +0800
Message-Id: <20220823030215.870414-4-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220823030215.870414-1-peng.fan@oss.nxp.com>
References: <20220823030215.870414-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36)
 To DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d42beaf-b27d-4b6e-faed-08da84b3b519
X-MS-TrafficTypeDiagnostic: DU2PR04MB8824:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pZtr79yGbXibnfs+k4yuhV6pf7H7cK7GFHU501/JvP7PQFdK7ZDCIm8Cetsh74qN1z9F1XE2Weq5UURPrnnWdncI3Z4THjL1odSrpnLRS+Io8ang6Yv/m6xZuOs++pYjLl4ftK5aI/Kf1TpmO7wHV5OE6hvdezfVK5Til+PpIhM7Kii0lOvGfNW3xLHYZUz/DCwa0KdQW6n3JZp3Ml7ws2bQg8ebxbIoZYE+Db3GZ7mXfqyJymtpvOIFqYG1uDzhSN5B5UAcK6ph+hFiorlT0dP8ixgd14qu61cnynIeYE4V8YkPU/ZGttD0pOxyamhLFFcLps3rn0H4ZxxNTHpo4atKcBW8epfjSy11h0+KSoU6Z7N64X6iQY6ygfEO5Zsysvnj5a2RozgeuC2B6QVNqvpXnv63QEKw8Z9l0ftJw36zMV+DO/ACKdHyH93bUHtgp3UZNqlO4ltVL8aFwbMOzsx6d4dz0Oj4hCKeJDIDtHI9v1xb72/8dEYabed4L2Q6NCg2RcNHUzuYkxxM3Np8Yn9cbmAQ42pIQL/XHjsy6waV8XcLd6gKroYAH2S16ariuY21/abKEWn5xL3Rs8QYqE0PFlXR/wcfCyPnrG13NMoYzkoduuA1c4u/hCE6L2enEoqOWvc3nidPqEsULrStrFruR0MPW4qgT70TzDkyW4aje78nmS2wIkjXX74msXpu0DRWQI9GDc6QYpRQMNgrBVEVwksA5NwVmqCUVTjotUTkQZijWE2hC5h7uuVO1EOT6k5FhWboX92qycq6bdXPgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(83380400001)(54906003)(38350700002)(8676002)(38100700002)(5660300002)(4326008)(66556008)(66476007)(66946007)(186003)(52116002)(8936002)(6486002)(478600001)(4744005)(7416002)(316002)(26005)(6512007)(6666004)(41300700001)(1076003)(2616005)(6506007)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o2LlA6jLbhHVLseS5YycLxoWTTBPK74+B/wNQ2qQORu5cLuouE78BbGK6kwk?=
 =?us-ascii?Q?r4kwQx4mQXM8DsVzAsTz4FeWcmsPpM0LnJTdvPwxcRgOPPpvRWS7ydVXwknu?=
 =?us-ascii?Q?F/YLmwpu68bSNm3W53AcL6GP/zHE6fHVnGh/RTiZ1Pb0yh+vHIWIN8evD19H?=
 =?us-ascii?Q?1Oz2Kaph+VmiQuri8QYr9fLpxvPAQpq/A6Gav0gMOc92mssuR6AfDzsNzCWp?=
 =?us-ascii?Q?pdiCLOeMvfZkgr/iH9rUz/lUFXXD9E2PJxvk7IVonvH42+bfTDJFVmkM7ZAC?=
 =?us-ascii?Q?xh0j2//UNbRklmT/8Ppk3oOM6Yxj/1ZgSbwOIWFoqfYuimXSY/s168pI/xkV?=
 =?us-ascii?Q?ErneWDN8Sy2fJ3HUO/qjGC1Op55ZfkeL1fU38l2W1ZHQCNZ2ZUyrs/Vdxd7V?=
 =?us-ascii?Q?xq7XDXbsc42sueHZTbd3Dbe7VIbgpAyy/Eakh6tcIWYZz53c1sSbBiB/u90Y?=
 =?us-ascii?Q?ztwM1Odr7HOIjQbZdma+edso6YiXwgfL5moxhzBKaSe/NKHoRsE2Dkmif/BE?=
 =?us-ascii?Q?zlvKnRcA89Xuh3G7guytIQTem6N06hNoTVnwmQDwhoDtQDTLg7K9stI6aHV3?=
 =?us-ascii?Q?pavg5Hmw2j3TAd/eaE1/AEudDnulkgcJ2YQFa7VbUPYvV6OGmNcj5fk4Alhy?=
 =?us-ascii?Q?EdoHPEQ+V2qBwt6MbhwBZ8YRxgodXPzpQgQpXRB1RCYjtNjaTrj3Jvm18bSW?=
 =?us-ascii?Q?ctMVgbVhGuf8qQAQ3LVsja2gNuBku9DCR8Q09gkslZvx+X86jbMirZ2kQy8g?=
 =?us-ascii?Q?xzZjqlx9AeMPx89DirVbAD+hdNDDOqGjxzGzbga46aNlCgHvOGLGtyI+wEU9?=
 =?us-ascii?Q?+cKAV69qTPzIJjbuhyf3J/j3meX3qYBDhpFPEQaMrKDDED0th5rf33pk/brm?=
 =?us-ascii?Q?ei1fev77OW4uRjS+nkqr2T0iapjjtq7IMI8SPbr4T1FFgrVE0jZpcP4S7Qwu?=
 =?us-ascii?Q?0Q9WmyzKvLeeNWzMmJxTS9A1iKt9RY1qiHBe/+5umUm9+BMY8ebIQEarNDe1?=
 =?us-ascii?Q?pyYKB9M9kQ2sS6u+omlS4wp0YvZ/tke2kKedyPTKD+1AG9L/s4IoAcpNobij?=
 =?us-ascii?Q?CiLmrlv7k4qmaU0gkRH0BbqlZk6/ZcbjhXGhLVz54wgPlkUQVroL+Ggr2eCY?=
 =?us-ascii?Q?TwprYHn7dDuI4NHs9SObrIDTYlQoyLcrm4impPM19upj2DcQSjgBzD4mONwL?=
 =?us-ascii?Q?sWOFMohD/gmyWhaM70R0rXNDBG2t8Z3UhHr34+d4ERKQ9QA4QHuWbt37vb2P?=
 =?us-ascii?Q?PuLDlwEIAZtzpeF+Nt0mmYTAtG5OseZbNH9k8/7dkLcRmrn+8wkOe87+MYqn?=
 =?us-ascii?Q?QUqn4visx4EFVFc87+ffEtCfgHi5eSVMSgjWmmBLZjRNreP6k6rhlf/o/t5/?=
 =?us-ascii?Q?K3yK+I/k5vMlpzD4oZ0gyTnHN1ro0Ju21FBnHS/f+rPYAVqfaUBKoKRLMush?=
 =?us-ascii?Q?dFlEA9BwJAqaW9e5VTSsWtV3HIr90s7bKhN5sQEziEQdhnU6PbHaJsCEliqr?=
 =?us-ascii?Q?wwQcGe+MMOhQWITTuakcRpKuvZaWicQOqW1BEtkr36C4BaBUGfwF6Eptx2z3?=
 =?us-ascii?Q?BOONj4/HFpVNEqVpaMM3pOYbfx8BY/z4AwfRlT63?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d42beaf-b27d-4b6e-faed-08da84b3b519
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 03:01:00.2018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mohpWVtEX9/8fLrtYNK9hQhie18Twe2CT70XaM82KuKkAZyE9w1kMcGzUcKZ7f3dDY30Tu8N8o6ldUgQxzhLA==
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

i.MX LPI2C has dma capability, so add dmas property

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

