Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB85444E321
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 09:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234711AbhKLIdx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 03:33:53 -0500
Received: from mail-eopbgr80055.outbound.protection.outlook.com ([40.107.8.55]:47679
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234603AbhKLIdu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Nov 2021 03:33:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMJ9P9hx0sMWOtp4CkuoS0hMOuQFDt85A0CeKZmzARcpHZt/QSaCNaNkputY3qTnAM4M8xQBXGUUiYI113l+ZbQ0/ABxh7skqYsosqN74BOdpHM0OPaz6WYZbXGey8jx9/scSfQ9lDMD/+kmHX1tBVLe99xQw6Iz/4yEpVR5j+dnBNLSouFGoHENrRXoJuy0cT1LH+O5/hB2SYroM4ijxrSEycO+3g6bGIaLeyIQvNJ1LiodIcS47wDgObU/8VKbS2wf5+vt98l4u8DBys+uhwE+BNk4cg9hwQ+//J3mTP6VYFZLQTj7Wr/LKp5pml8PNUS+2HdQFOTlrCdLnjx0dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oe/JcqsrMfzf6j4QLugpnSuTHWA/f74Q0N7r8ZrwG8k=;
 b=gOYA2YJhs73kJzu71kHyt5QDfdS24YNYJju4wz0+G4k2v0v7C58P6W/EWVJlLl19Sd1V1SIgLkqFJiyslmAm4onZwXLJjsCeWUeeU4RONwj2CImtq4uSRqJBJZgTlF+YMduAlwLapnP34ZoxJa7SS+Sf74vQE/KfMGzjTTZ0BOHPqz4VTZAWW16x5VJD8EkmWIlJ23Yx3KfvTwbetPhc4AA71Sb8hXLSjK3wl03ffMW7yljxa7jVrkpHHvB2oawIypzTvL2dISkPtgSxouNGAeMjt+qzJdTRYaKayIco0eoLa8ubLk1dNoGgmMDvduImtmF9idCxXq+u0mxtt5+Vyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oe/JcqsrMfzf6j4QLugpnSuTHWA/f74Q0N7r8ZrwG8k=;
 b=g8hZCtyYVljy/xyaPAb15/6Q/8EbOEQEX7qrCC0vxOG3dIFnRF66QL34DgXmR1VNU1YcXjQoLaLWhYfS/62ai3iYwITumE92ByGQAfDkpt8+mwxDXq144tT4KmCTkKtM0yY7/HNnfQcZ9gMDMXDfZQCpUoD4dEk6B+urLC8Vxb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 08:30:56 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 08:30:56 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     robh+dt@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, ulf.hansson@linaro.org, broonie@kernel.org,
        linux@roeck-us.net, wim@linux-watchdog.org, linux@rempel-privat.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Jacky Bai <ping.bai@nxp.com>,
        Rob Herring <robh@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 5/9] dt-bindings: timer: tpm-timer: Add imx8ulp compatible string
Date:   Fri, 12 Nov 2021 16:29:26 +0800
Message-Id: <20211112082930.3809351-6-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112082930.3809351-1-peng.fan@oss.nxp.com>
References: <20211112082930.3809351-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SI2PR01CA0013.apcprd01.prod.exchangelabs.com (2603:1096:4:191::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Fri, 12 Nov 2021 08:30:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64c09ecf-5730-48e1-835b-08d9a5b6bf6d
X-MS-TrafficTypeDiagnostic: DB9PR04MB8493:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8493537588D3AD8E3429DC0BC9959@DB9PR04MB8493.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7UPp4wAME2/R0kdbdtR5k9aNG2O+qNx4iR4xBsl2Rgq3aJpPcKIqZ/3hdUIGpBKcefjgkqmWS5+5lqKCtnZtnzENt+vlkiTZX9u2jCWk5xw5yYkNYetr33fbQJ/9Kd+oQONGeQfdOc78Liec7BizA8BR1znpUoIZp/bCzPXASTnOeE9bXMCvI22sS5Rpf0ZU7k/+5TbD7jrqDgSreU7yRFUtS0c7No9+8TM0+6yuKb6qEDT+tc+ec+rBfsLiRRMSDAFfB5cth8MhMNI4YqGja4RPgAXRsjNMpeWxu3nD/Fuy3701DFa0CummJDjm23WBhQhne8EuuxqcD0GoWgujh6/yZKyi8GgYx0SezmaiVw3BcK9otDgjS1bCAKeGGRcI14ToTA4VTrRLXhzE9v+GYSnFqgNKaDrttBEnSO/pcvsnyIMQ5XmFywVY/6argDk36Lz9V2M7tV0QfNGF0yCKjaLfJnJbXLe4l+JYADhtUV4fviWg5fG0l1D6RHKAzHO9G/3xnTQBfjhQsqljmKh/poQXr5RZO692QKODp2RzBl569QlGtqcN3r424VFykcMm0Rc12Q1OFZ4ugUdwODJU7Bp9Ab7JMw5MXGxzhhjoJXOT6DhGMYH61MZAU1bBraMin3dSuPaWi+VvnaQ5VNnr4wwHIHn0VoDkVx61Q5Iiv0cs4Xowemhs/DVKUUeJ/zYxBI1g4ohLP81jYI0wCtVYgquARodNlgO9MoF7Qv6xmFQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(8676002)(508600001)(186003)(6506007)(1076003)(7416002)(956004)(86362001)(54906003)(6486002)(2906002)(316002)(6512007)(4326008)(5660300002)(6666004)(66556008)(38350700002)(83380400001)(2616005)(52116002)(66946007)(66476007)(38100700002)(8936002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F3BAHjI5Nb9wSobYoM8UfJHzb5jmFhuR54jcBPoOYYb2ezVs/6o8cFV4zs7G?=
 =?us-ascii?Q?SpLRkm79C3mgKhhRtoeUFpHWR7eo7M1U2My2ETECY6qLBGRy9RuKQYBjroxU?=
 =?us-ascii?Q?b6qim8Luqvz9C4HH1rYawq3dMN0dZoGPPCDvs1/9pzxvWqOqFDXuypp5ihM+?=
 =?us-ascii?Q?fYNi5dHzt3QOmPmsqr83LL3mMPvffhY0hfCEHnQXeLeqCDcyAmWsnjcHbrmr?=
 =?us-ascii?Q?ibhYeci9REYYt+p819mxUHEqL7iPfOscJdMKcslrW3tSJOdxyhGGfrzNs/YR?=
 =?us-ascii?Q?mnXkj0zIsNXpqiDBYiDLfZBXZombAI5GgjFt9BUsXQ0n2KK0HrNCHam3OFwr?=
 =?us-ascii?Q?GB69iaIFS6w8WW7y8b1R5yf9/QdYHy7jS6DNvli772dRrJl7INnhFeRosfji?=
 =?us-ascii?Q?OgMXjct1zR0GOzUcCk16acfC7Kk6o/hasebU6E4Bmzz8++ThsVzKYTnsqcDz?=
 =?us-ascii?Q?JQ0TXzTax/G401o9AZy1hKFh7fUdU9QfKAhe4ni1goYnzJSlqn0fwElPa+Gz?=
 =?us-ascii?Q?QWnj0L1xX1h5y3MHQaKvYZAh0d7WVb6H2BgFGA3goQbfcOXmuAt9H2Bo4XWr?=
 =?us-ascii?Q?aj6Oa68wGjBMzvEQtVjyiaPgdJEllQQ5L5VO+coXDYeMYYBGIxtB2sPH9Nzm?=
 =?us-ascii?Q?jCAgRVkZ3QGi/ToD1tTM/yt1ObxSxlsBrnrzXJUK1NihUJtWhDkVAFVa5tq+?=
 =?us-ascii?Q?i8vgDwjf04ZNEffsalEm/mzkYiQX/9XrKopA8uICw2GrwJ8FoCEhiUYk/cT4?=
 =?us-ascii?Q?mchrVkGVBsGSlCanLdWcXYQbBODtf6mWOS0mP5K70u5N/w2x/xesBVKYAA0f?=
 =?us-ascii?Q?GjLw1gg3WIz6eQazFHfgKwgNcNRF9RKvO7/+WC3R/KDvzfUZep5YZT0onHLG?=
 =?us-ascii?Q?rmnVUX0ZbyNW88+KG/pJLHl/6R+8e/+0fKYLeCGU+objWMRuhl7ZV88NOcz/?=
 =?us-ascii?Q?enegXVdLl7akeNOKqhex8iaYOt4Vea72Fk+KHdI+m5EmgfIekXuXtfIYtlJ3?=
 =?us-ascii?Q?CPpQ0FlgvPi+D5nTc2uZoDPKez2ly1hZ3nzGecOaa0w5OXS3mt0ciFMpTH/8?=
 =?us-ascii?Q?RvQ4gD9NoBtl8sU9eLk2y7IplQIWyCqhXF05k4y1/kjzjL2RUXZI8ZVrBmzf?=
 =?us-ascii?Q?SlHFTmxYRzB2qjoVUHRmaF3VT33iAizPpFaDeBbsE/h/Rd7K12eVVW7y9O9Q?=
 =?us-ascii?Q?KqLMeV/Z/ovX4NYk1/9XckbdvjPyNZ/O5li7AvWIi3KRZvh3Le8k36gLmnlK?=
 =?us-ascii?Q?KmyN+AxNKcPest6h2o6F01rtsw2SRs8t2LvAPfhSkramK9KHV7ovmXAUzLIg?=
 =?us-ascii?Q?4SErOqKgXcgm8kDGTeh/HpgpmNkLQTZlxg0mYnTxqMarE8My5bIe9IPe8ouC?=
 =?us-ascii?Q?VfXlv1E0hJ1ayyDPwehc/Q8aI4c/Zhjbyaa7ZYo7P4tlP5aKtUBtiwmbSFDu?=
 =?us-ascii?Q?yHi+ftzeAarbQjHGc5EgyfvX4BgGA/N6tnBAKcOdIoQ8N6/q8dn5VDe2PwSZ?=
 =?us-ascii?Q?b7ecu0tFYmv5qFfUuyTzspCutFBeX0/4UdaXCPPqaGwQNVP8QGKNW6Dtvnvx?=
 =?us-ascii?Q?8GFOeBWvxfa8FcuB8k5qS+B532zX/Y8Z5CWgAB+6FUA42e9sZxXaD80cJp1X?=
 =?us-ascii?Q?8MGnuADMsA2ZxeX6frjDhpE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c09ecf-5730-48e1-835b-08d9a5b6bf6d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 08:30:56.6868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmMI/jqRpGK2TFBchoJHHfIJFphP538e/GyJrPi8TT6E7DmDy2CPuSehTGCXZYVzZujGRcp3DujupMBVCxHPTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jacky Bai <ping.bai@nxp.com>

The tpm timer on i.MX8ULP is derived from i.MX7ULP, it use two
compatible strings, so update the compatible string for it.

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

 - v4 chagnes:
   no

 - v3 chagnes:
   no

 - v2 changes:
   refine the commit message

 Documentation/devicetree/bindings/timer/nxp,tpm-timer.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/nxp,tpm-timer.yaml b/Documentation/devicetree/bindings/timer/nxp,tpm-timer.yaml
index edd9585f6726..f69773a8e4b9 100644
--- a/Documentation/devicetree/bindings/timer/nxp,tpm-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/nxp,tpm-timer.yaml
@@ -19,7 +19,11 @@ description: |
 
 properties:
   compatible:
-    const: fsl,imx7ulp-tpm
+    oneOf:
+      - const: fsl,imx7ulp-tpm
+      - items:
+          - const: fsl,imx8ulp-tpm
+          - const: fsl,imx7ulp-tpm
 
   reg:
     maxItems: 1
-- 
2.25.1

