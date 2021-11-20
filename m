Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9ED457D78
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Nov 2021 12:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236288AbhKTLjJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Nov 2021 06:39:09 -0500
Received: from mail-eopbgr60086.outbound.protection.outlook.com ([40.107.6.86]:60047
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232401AbhKTLjI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 20 Nov 2021 06:39:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egJvChJSGsf+VySosUNZqHbhOIEwWQSf1XonlJ8JNxsQnRXdUsLpJS7casfexdHWcctqwLc8QE5YrcMha7F1lZc5iulWMcEZeSEYf6IEsWo09JHEG8m30ybQwX6TFh8LeK8oZu3TtVYPxpw140KiiDwOlF+LYEVbfIv8YlFJOqCtCwAHur3sHv1Zras4me6sWajjd7FPRifxjcny3ufC20sfNw4d1qujzrnp7UZHqKEq3nvSjOBl2b2X0/+SNV62U2IxkcPlchyPVn0for7OXpAr7T13/6/FKRKShuSK+HmNWmzsFgALdPVrRsO5C8a+eLAKoXKhQJo6LhFqNEYVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljXegRcS5I0VNRbbHmk3Wyx48BuRuw0HnhEGh2/PA+U=;
 b=PAQHq3Ndb407CTjR/FGS2GT3ShmF6nWvrar8k/crF8pIjvYgggBON9ZWOhjvQMCAX4aak/gToOrvmJCLrmPFLy8fZOfKvJx8wsVLhujhQaKarnP2su0g4EWBgA8jfWiqfQqmVI+zWQAx4PJTXyA5+0JmmB8hpVVG7jKxClU8emywMUmpAMCrPZg360b4uowiW2WqLQUute4lZP15CcRY4jaPJbuZjYv6iq8b2m1TmjjiLIeHe3c2XAs01Id+a6FRVVuctgGF7Wnm4wgMhJk1Um4hkIRnPW/3eH6mMjJMgt4N3NDRD5XyioCvxFh4D8+geSI1tqcGglG9A9VD0+7F0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljXegRcS5I0VNRbbHmk3Wyx48BuRuw0HnhEGh2/PA+U=;
 b=Z1OV4OU9jWhK9E+9QyO51/eqN7HC2n3eZywI7qZjPhgm2gxTG45RhS39mUXNVVp4J4iqPwQEFXulzR7wm85pcE8xHNxIlIoRqqIztGcNWGL072MllB8zKgmWZfAHJCczxM2WuEAKHWb55DcS8tcHpam5DzjCNnor0Tx/4vappUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB9308.eurprd04.prod.outlook.com (2603:10a6:10:36c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Sat, 20 Nov
 2021 11:36:03 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Sat, 20 Nov 2021
 11:36:03 +0000
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
Subject: [PATCH V5 2/8] dt-bindings: serial: fsl-lpuart: Add imx8ulp compatible string
Date:   Sat, 20 Nov 2021 19:34:48 +0800
Message-Id: <20211120113454.785997-3-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211120113454.785997-1-peng.fan@oss.nxp.com>
References: <20211120113454.785997-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SI2PR01CA0029.apcprd01.prod.exchangelabs.com (2603:1096:4:192::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend Transport; Sat, 20 Nov 2021 11:35:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1aa04a28-2439-4d8f-9cd2-08d9ac19eeab
X-MS-TrafficTypeDiagnostic: DB9PR04MB9308:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB9308E5E1F9DA34534C004950C99D9@DB9PR04MB9308.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xp1ySwT4kbBA1OcMiZDgJS9T5CLIU+UKeVYklfOuVfU5pfrw8LFQVoYnug4rhJEct2w++brLK9iFtSjLaYFBgJEGzt6FkZFV0BLS0Dxr/etljGH8FSoDpC3OYG8Vu0kTB2UIVWs6L1BmEsSelH93LLCpiHHnrC5HGu8p3nPsiTFz6rNNqPwtpJfi+yvcQr+iq2Rhtrn1HiKDHYcK/1vqO76g4k+s9UyvC9pQuK1AxMpzhK8fYrB500GKW+cds8oRrlPgrYJqBViYyHfz2AiaJK+hzx1u9KUIOMC37tEfz8f2AOGkuKnUVFbfbbUWM4VhFZRF6H+z9fRMcxgHqlfQvgxKbF06wOWOZBAbN4Y+UCtAUyE3ZE4Cc23LsHZq1okYJbBb82FM/5LscFCnA9Os5BLLInzOqfn0GiaC0ZIT+4+RDx5x2Ao8/N/NUaKkf9caiARkWgqpotqEjtl3HlZkKUFNDfhgz3Qzqyah8hjuicE2Vxlq+gu7ku1HQMlF4qImyEzOTCrvUspEGvVSO8xaNaGw5jWtXonSERUc/BagFKVc6M/pYt/ybloHofZv0iLWu4r9XA5lhSNPMfRhA4tImXmux4ctIJUY7Y0OjG7T7SLw57hZW/UXsposnw5SZJg4Z7VfuYnGecEJTbi/4XU5n4nwYTmaElTmh85aGvXipdz7s/l28VzXVosdz8Nx/faJ/5jnpNr12x67Xu5BaC+9lo9DBbZaNNK+aYizH237akY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7416002)(26005)(6512007)(66556008)(2906002)(956004)(86362001)(508600001)(6666004)(6486002)(66476007)(1076003)(54906003)(38350700002)(38100700002)(52116002)(66946007)(2616005)(8676002)(8936002)(6506007)(4326008)(5660300002)(186003)(83380400001)(316002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7chJYUPAswQ3D+C+yhbUikkyl+fEaND0mKzFIiVAtVZn14Ea7O9PChSW8KCb?=
 =?us-ascii?Q?otDqDB1O4LHwtXWlTTRyhtK5adwj/vk9rJk2S1GH8rZxbGZLNYdkfjGbcTP2?=
 =?us-ascii?Q?uKVKNJh7+DdT0vDEuY9r9G0lfTGthZHJDueGjS5Mnq88E6BJe7DdShVhJ37H?=
 =?us-ascii?Q?v6aHcKYCy7e9Oq3u1FwGXiuF9c7YMnDZzs7MQWKlMs16O+9EAr2RhCJ4wLt+?=
 =?us-ascii?Q?wtdTm09acB6rPs4M9yB6bJqO9IioEJWep+sbCXJQXZ+kHTij5UrMXMc6CIH4?=
 =?us-ascii?Q?38n6JynL+9EupbYS6gP/LrSLWa/xHSJo/wzRmjFx5eUE6RLKLz8YEEKx2+wP?=
 =?us-ascii?Q?WY8cphV5AlAgxZWr8V9/cm/cvdHuvW78TB5dBUr3EUyWJciuTgi5HNCIMA+v?=
 =?us-ascii?Q?8sMpnBTo/lEfjk/vqfBk6vJzSsoqUX7vwyu+hCgw3g+knX9EECR/I2Ec9UZh?=
 =?us-ascii?Q?tKa2LNbuQKkzWkZtEuxZOjxmbGOqGEgF2g7X4Sy2r4qFAQwT4tAxGMBjXzFs?=
 =?us-ascii?Q?4poVsBI/COl0TQM41j6qyciwgPdW9sLoX/ZCdSZJwQtm+X7qk/zPveOzaj3G?=
 =?us-ascii?Q?O1NlJzRlX/W/mqpRPa/xWdkvjnBhRg67iryNMspNcts2usvuNSnTIh14Fma+?=
 =?us-ascii?Q?7Gh5cap3r3SE99faBJzhOPHk+j/abwYs/URE2hwSGV2C7+y1NIX3XANghdQx?=
 =?us-ascii?Q?0Kv6FN0bWL8U1Q915fGqVbrclADSfSCALRW/MnReXWaR/KgQE/B3FaefPRyq?=
 =?us-ascii?Q?mowbI2v+fckNVMGbvE3Kfv8klQjfhzo77j5rWf5i/5AbIVUf57Fg/kTzA12+?=
 =?us-ascii?Q?nKdU4IYKs3c+sNPB2Q6E/FYtG5mzOXz2q1rXamfxISFL4eG1iJIsQfu5h97b?=
 =?us-ascii?Q?VvK4UBVUxK9p/YAuBhFbXO1ptxpOxhyMCh7139lRdc8/Y32bsHZnwvQreFyZ?=
 =?us-ascii?Q?x5ReA/CYhulBtpek9kr5/ZSQu7tguFNrwKVztq+eicupzqlJYBaISpB5X4lC?=
 =?us-ascii?Q?0MHRmxao2dEsDlA8DgCctX5/wW+MONWt/3OyguyS50pMRoD7Hu3m77Re1Pr4?=
 =?us-ascii?Q?W+FENMXw0BR0JV3n+z9JmmpmdYWYSwpLY7VMQEQSAOS1s8fVm6QRIf2STrGL?=
 =?us-ascii?Q?12XUQvb1iIM4GEUW1I2gwoyyxMgUBMfMIg2DQT/SoDQcmIgjh4q2U0BxyYGQ?=
 =?us-ascii?Q?VQ9f1ApPlrrJ6yib3l+yaxdo8XfJr76yaQtGsF7kuIah2TWUdpxOfjqwrKl4?=
 =?us-ascii?Q?8N2yD4oUflI9P1i1RuVqBmCJ3UVDKFS9ogni2ZC1Yl6XoMeGDlGiUrOLifeg?=
 =?us-ascii?Q?OEhYiUwKfXCZmcg1wSRuZ6SzgJKF0Vqhkrj8qwb6HkfVPs98K3pQiYI8EiBa?=
 =?us-ascii?Q?nf0vMA3N6ya9potnZ1j+TKYhsTd2CwvBspfok9Fh27Didve1XIDaQzre1U2E?=
 =?us-ascii?Q?M8bvNV26XqeUbNx41rYi15Atv6mIDezA5G98mqE00Se336OcP1Lvduf+HuOG?=
 =?us-ascii?Q?y5B08+LvdxEwr2w/Fnt9NxyO94KB+y7hOrlio68p1YNd95QnRN6OB/EogU8o?=
 =?us-ascii?Q?ZkCq9JyNqEome42paAT5Yvhg2Y/Z2Sb1O4cCr9fJMGgvDC+yOd0U74u91w1q?=
 =?us-ascii?Q?adOSZ5lChQeGWMY55lch0XA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa04a28-2439-4d8f-9cd2-08d9ac19eeab
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2021 11:36:03.1195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQhYHda1nJhg6KP6a9SW0P6gHZZ0JVBoMa0dxzzdgYyTlz4EWW3pd3YrY6vdFws7IGW9Qd6RGHPZySxmWKx0OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9308
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jacky Bai <ping.bai@nxp.com>

The lpuart on i.MX8ULP is derived from i.MX7ULP, it uses two compatible
strings, so update the compatible string for i.MX8ULP.

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

 - v5 changes:
   no

 - v4 changes:
   no

 - v3 changes:
   no

 - v2 changes:
   refine the commit messages

 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index a90c971b4f1f..e7ac63dd1469 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -22,7 +22,9 @@ properties:
           - fsl,imx7ulp-lpuart
           - fsl,imx8qm-lpuart
       - items:
-          - const: fsl,imx8qxp-lpuart
+          - enum:
+              - fsl,imx8qxp-lpuart
+              - fsl,imx8ulp-lpuart
           - const: fsl,imx7ulp-lpuart
 
   reg:
-- 
2.25.1

