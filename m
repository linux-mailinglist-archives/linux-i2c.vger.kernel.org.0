Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B75A845E8CF
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 08:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359359AbhKZHsR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Nov 2021 02:48:17 -0500
Received: from mail-eopbgr130041.outbound.protection.outlook.com ([40.107.13.41]:41349
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1359361AbhKZHqP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Nov 2021 02:46:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCdm33CWDwlOqG7wJ2w5bkjuR2vzorjpOj2Ol1anA0BOS19oNhGyRkkddm6KGCZQgZ5eVwFv/FubluVEsKtzuHVedE5bE3cFdVi4r22Tr/c4VwHdgAzNgk795e4Ze2GJf4qxHUMFfoeW7L/rZlKG0BaX+SAv9SstdyDf/YDcruUYHwO+eStMvVDH//PaxMGvk6pAbH/BR6SKJAON8Sn9TlnVbDVgIU3DfOfUo/Vy4V+XlJVvf6KsQdo952+lnqNkix/UqGBV+BUymNh6FFOQ7Af1cNORYcT/1+g54bwc5ywMMHKJ91dObzV7URaZbPmZ/AWZ2612SHaDXkSjhXPhvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VMZ+XXQYTR7fSXglhObWCy6u0ktzcJjKdgKl7A6QCo=;
 b=UKjf6LzUV/IaF0x99csdsEAkgDX9JyCSuZY0Mr61Ltq/EbcFo1DDdoJs6WvgwjulyJTiireK04jgNBFnahPRIz7BrMCZrEk06CH9QOOp0tcjsmmoORGifXigN7lXcFuqRYNsmTHf7rvZIMN/cxUF5OQ8p0cVGsAIr83s0n93E/GVj7YVWdbAUiKl3Z/Yz2F8U/jY6gtQVHMH51VtrZniOz/c05ENLZNq+kLuLAu7rB3sYF0I2QwCF+tabZjUOxI9ygY/N3axKnko5Bsv3W8oJZgusHqKx7JwbZbJTU4R0qo204naLfmb5BP10X1Ti8XMYpv7D7BUamvY8lcATNMTGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VMZ+XXQYTR7fSXglhObWCy6u0ktzcJjKdgKl7A6QCo=;
 b=YzJOZGrRBkfCPiC1KfUjshdePuA8hcOtJUwyso0+QlDc1O3N38uVIU2nC/J9C3iNXKKPYzzDjnNXT6BOs37dRRk5VTjYMDQaViuhpP0iRXmzv+mlB7Jdq331Jt+3dVJdiD47Ey3c/zoc9y195IX5DKDnmNmgJQTwyMxhFTNZsog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 07:41:23 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4713.027; Fri, 26 Nov 2021
 07:41:23 +0000
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
Subject: [PATCH V6 4/7] dt-bindings: watchdog: imx7ulp-wdt: Add imx8ulp compatible string
Date:   Fri, 26 Nov 2021 15:39:59 +0800
Message-Id: <20211126074002.1535696-5-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126074002.1535696-1-peng.fan@oss.nxp.com>
References: <20211126074002.1535696-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0139.apcprd04.prod.outlook.com
 (2603:1096:3:16::23) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0139.apcprd04.prod.outlook.com (2603:1096:3:16::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend Transport; Fri, 26 Nov 2021 07:41:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fb19470-3127-498e-b9b9-08d9b0b02506
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8790054F3A3088CEB6436549C9639@DU2PR04MB8790.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i97PJpkE9fzIc5b8mzH9x6S7ePHrLgPfipU/XPv3zbQ/LrvPXIOmK6JDCEkvAfXnZZ8blisHchsCMCS0UmfP+hl/Iwf7Cwrkhxll3YPj4ZBso0xhX+2l9SXWfkc2htupv+Pu5qKUj5tFJOAvOrCcrckMKZvJ4DL0P+CnNSvzFlVVfLGKSq/ZbBnUVmnIUQkv2i6kboKHdTdiYhjB+3yqlmbl70UmR0gdHGXkhP/6W5BL2rw0Bm2zyPVEwXeIxZb/JsnJ3S7AnArQxtQuT6BpAj8i7XGey9iao+BCpeIkI7uTxP7CYshzreTtIDvsQHShp3mVf474XWkVwIjn2iIhu9l6BGvjirh/xtG58SKIZDRa9gE2Vil2DFWhJyExbfUrTuSyyZC7PKiBbwCzyy2TyQRicdDPX2fbDKCwnaRGTBhCIv+x7eK5FlxYepyeTq0/BLdcO/7jh69hnn7uJZE/O08mMfmG8zrrs9P49jWDd5i9z7SJbnbO0NN4g+8111cEMpALOQUfCBVu2QFv6VVnE3qx09+r/EmmCn/s13TaHtsr7kBDPpC6KIoeVrdiArobxRpDVC0KHnbSuArnQ23YPJH+pMvmvMzXxiJ87jtKCF3byZkCJUksahaq1yqI5jmSmnIHvgQBJKaGSOZuLlj3RjVHdDi5qUOrUD12b2HMrYaBZS7TT1fN9W9wVW27cO9WlFPpvzjUIyYsH2Is0OGB150a4JCL887fPcYJeIX88dM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66556008)(83380400001)(6506007)(66476007)(6512007)(316002)(186003)(956004)(86362001)(66946007)(38100700002)(2906002)(1076003)(508600001)(4326008)(8936002)(6666004)(26005)(54906003)(8676002)(52116002)(5660300002)(2616005)(38350700002)(7416002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IY6PBEhruaFYvIpjasdU+XlrE9NARHdIpmHpjKZfVva55w/3Fbf8ydChOKCL?=
 =?us-ascii?Q?/Gi1Xp0sfN2hspXnPHgQOSIWN/NZ1yJUcoA3tThbgFRKOCHSagFbZBQwXQI0?=
 =?us-ascii?Q?BbGZNjUIq+hqpFGZkuiTUht/RVZ2iovTNelTony14kRXdxEFhWBmXSAocCOr?=
 =?us-ascii?Q?Fk276kM2UKkxfw0QItOhVnqH4eiiDmiTLFOM/AtmgyX6s7e9rkHIqveVbSie?=
 =?us-ascii?Q?oG3zq1BMys+6Xw57fcAt+Bm5+o4d7Auo3FKhwstvZhjhG+j0Q3yL7KzS2KXs?=
 =?us-ascii?Q?S2cBwvTp2hb64CB6ovu+4+0+3fiZSJeBqqcgvzWINDoWt7dd1AaJ+oI3n0SO?=
 =?us-ascii?Q?DX0X4C2BIq0IKN2JgN2DWrym5LJSKtqHnQNc/+JvLi+da/erzLaehx+VRfad?=
 =?us-ascii?Q?6RtkKQWGYhrWmO7V3CYLbq39yKImc1Lw14Bk5/nSIm1dreRK+K16IIxOprDT?=
 =?us-ascii?Q?/9Lar5nWWF/JJYfrOH4SiV0kOBOQDSAif0dCFSLUcPJmri+dWwLQNXAj4S04?=
 =?us-ascii?Q?Q+YgDOGdzfUaxN9zti6bD+JQIUSYY9Nr4OKL3MoEwu/H83txtpLzI+igK0wF?=
 =?us-ascii?Q?onB9UAZoVXTGOpJ17ZPY65RPV0qznICiI+L3qZ93A+mG/cjCJUEOhO7mpjE0?=
 =?us-ascii?Q?+BO6XWRuaJU5f1HIFWFtzUOZ9Yd2FgE7g19XypX5c6TFusUt0pkoSMtNsK13?=
 =?us-ascii?Q?8BRmVbPv9ranvekktzjAIG6UQnpbmK47JlE326YBcREW6nCkmeWf4I7phiPc?=
 =?us-ascii?Q?aVU+1sL+DEcAGnlxgYjhn4MbI4RP+I80Q35FoBIGvmU9Brts9/GZj/d/Rk66?=
 =?us-ascii?Q?o6VE0o/x7yApkWUEdm+VdHIwtfUukcNvlH+F8cB5GNZ338d3r+mTTrOLMB7w?=
 =?us-ascii?Q?XWRoiFD6fofM5+H8mEuk0h5TtSunDq8iWIwWPEyVZZy8BiDk9LH4mO9FOp4F?=
 =?us-ascii?Q?8r9yP2fIls5HCN3nV9r3E/W18dy2iANpLwLDgtZAePwdvEoGTf8j1pC94FqS?=
 =?us-ascii?Q?Fwh6mXny9sD9cGPfJEceZ8LDQpEvGqrFw+v22U+fuft4USbZzqUgcC4ACBXK?=
 =?us-ascii?Q?5JMlowpLVTq51+bUFgdccCt5jdSJ+oYCBlAavS+QMEtJIDlBz7XthLAlYrLh?=
 =?us-ascii?Q?D/bmBity7GsyzLZ0Pya10Re4alo7leLIHJO5miyYiQO+Ci9y4XfEc4aKZc23?=
 =?us-ascii?Q?t5ANCtiloXlFm1xjMMqb4lygGQtj5uilBzsE+5wa9bCdEoT5Yc6GMb6MFqd9?=
 =?us-ascii?Q?ykYLXbZLljeUhj3BBmyxgPmW0GwTKoZRjgO9bTLYDxVweadsm05TJOeg0NtP?=
 =?us-ascii?Q?BV43yr3ZtO110VSINB9dzIerg6B6ySQNq8Q27oaMj01HTnMFH3MB/d9ccEcT?=
 =?us-ascii?Q?xlfVbQnD4B4rKD1aK4UEJk/EtA5URcXgTr7cYn9TzVUXrmaJ6onK0H76RvjJ?=
 =?us-ascii?Q?VLx3rYNwd2eofOm/aBQVqpm/Tj4o1kFZc2D4u/bAeeVCr/A0HKs/3Uxz0M0T?=
 =?us-ascii?Q?mRmq1qKI8I+skQl7TUY6HfGdEhqjzKFtx7mNYe+9c/w+6hLYJWw3pbvIb57R?=
 =?us-ascii?Q?H6ulv40Mr6JWopSpLKnwOnan65PaxpPMsnuqo5YzvmQV+akaJYP8CT5trZQS?=
 =?us-ascii?Q?wkE/xOjffK42pnMMsiDeoWo=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb19470-3127-498e-b9b9-08d9b0b02506
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 07:41:23.4981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqX+UxFfTzXVE/0HhrUJVzt5CWbZ5sEOpOrC528FiyQDpBlXMeX0NcS+bcllyZyio7sD3N7f12qFmWfV5M6l/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8790
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jacky Bai <ping.bai@nxp.com>

The wdog on i.MX8ULP is derived from i.MX7ULP, it uses two compatible
strings, so update the compatible string for i.MX8ULP.

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 - v6 changes:
   rebase

 - v5 changes:
   no

 - v4 changes:
   no

 - v3 changes:
   no

 - v2 changes:
   refine the commit message

 .../devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml      | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
index 51d6d482bbc2..fb603a20e396 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
@@ -14,8 +14,11 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx7ulp-wdt
+    oneOf:
+      - const: fsl,imx7ulp-wdt
+      - items:
+          - const: fsl,imx8ulp-wdt
+          - const: fsl,imx7ulp-wdt
 
   reg:
     maxItems: 1
-- 
2.25.1

