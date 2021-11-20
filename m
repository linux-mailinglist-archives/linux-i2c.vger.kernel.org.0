Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5B29457D86
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Nov 2021 12:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236832AbhKTLjX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Nov 2021 06:39:23 -0500
Received: from mail-eopbgr60081.outbound.protection.outlook.com ([40.107.6.81]:45271
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230456AbhKTLjW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 20 Nov 2021 06:39:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XlsbdTV1E/fKJnNVWh32Bz8w1Hm5HSwBrafC3GOespOGzQi8Nb3uh8IvITBCpIz8oXS7GzFQeqVUpc7iH9nYGW4O8xULq6jQPUkNq5jrIQGFYUmue+PMUEunkW6Jn2xYRjG4hUcc4GvxDjalLoaKrepbc/KCSh9rSEZSP2cvhPTS1o2l9YFFw49RHHd7WDQEao0fAU+YgDZCPmed8zgxRaj1VO6W74i/VldQDnTpRgllU8YAyod9VkaS+ej+QN3GoWlktKZFuD2m8a1noEQotco4qBVHXPQGXSyq5UJPCjbZYAs0igfz+axQUOG4FNzC9C4AH9J0//hjsButY8vJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JWIdl+MRgMJaGWlxeqKo2BbdQq8239TdUix9TLcsjE=;
 b=SnIWfs0eUmTHOzyTh1YMS4Gg9DgNoG/fdVUmvEjeXlWRJ1qU8E3q3m7laaPdXIkB8DYCSquqUjQM08kab2QdTFzqhkPkImC1Z6KZSusRttJ74w1hD5OrxK1Iq9qVE3T3lqXrRPKo/KEqLwjZ8TkhDkmL928/tA9pqPwLEw4+21s2yg6if11W/mNBZwWB8XdhVcxkxSJRNu6EWSunE/PPfyI9IJWv9p1x0NppUM51FYiFKbytva3nqB5o5urfm0T3ZAX5nJ+lSwRlnDOa5RtNkHGUpXjGXrR9uHMld/nLjnaMKzvYg+NNzn8CBvPF7ZvCKm9hcza6lXLDtYV2fhgnPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JWIdl+MRgMJaGWlxeqKo2BbdQq8239TdUix9TLcsjE=;
 b=mq8LLUjmuoXNnCRjjvGLUW1e4asjJvnNQlphvIAwxZDUOoFQ+H2s4JUEeHyLXgO+0WoxANqK2HncPasaegweZTmL2LZELt/mNmCv7L0IRxzih8c4WFsDR19WkTxETvTXWBWVqDsi80UG/ZryA/QPzzFCOzcpOiYExRHgt/g9nRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB9308.eurprd04.prod.outlook.com (2603:10a6:10:36c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Sat, 20 Nov
 2021 11:36:16 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Sat, 20 Nov 2021
 11:36:16 +0000
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
Subject: [PATCH V5 4/8] dt-bindings: timer: tpm-timer: Add imx8ulp compatible string
Date:   Sat, 20 Nov 2021 19:34:50 +0800
Message-Id: <20211120113454.785997-5-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SI2PR01CA0029.apcprd01.prod.exchangelabs.com (2603:1096:4:192::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend Transport; Sat, 20 Nov 2021 11:36:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce9cc036-78e5-4054-6ab8-08d9ac19f6a5
X-MS-TrafficTypeDiagnostic: DB9PR04MB9308:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB93080E1546F85865132229A8C99D9@DB9PR04MB9308.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TJW3yKPefFAoS88XAtpjk4nuXIeZanhYuIHE94kYcLNkuOff503sFqykKbCT0L2UU+cPG3dOZfxyx9J+C9+JdskG6Ic28BAgTPixnESB6mMxooqMna5a/AO5BSb0f9ZL09c7zsvrrK7IIvNj8QGj5+hTMlfQkDc9C+Oy5APAfMoCDtIyeFAPcsiMbm9BDmoBwKWzRBv+93n8eacqq1ZUbq0nwDr0sGOJPxx1brrLbiYnUCbWEhX3hp5EUnV+L8qwdhvLil52lioDA9j91yDmRS+D1b29G7EKiCCIfOst1oSiZfe4DqarKU0V+xfQGxri38M0l7JK6nndXFxk2b20ZVw4hJYqN04qz3nHrZivX5mPpbaRjO6r9rApwQNg7e+AuQbgrxmbXtJmSJw5jEIc5nYTMkbsaLgtsRORiH8DcAFmqsXDD+MPTnCxubNGFwTCvMF7I5uCCtioYVHXWQQBeX/4g5MjMjy/QG+1D1pduWkf+bpRzNHSzuZ44toK3HWk975paRqcUbY5C+St8OBkBrv1zvi8wNu8ewj6HDc4Zo2+XK14DtBMh5aJPZuqxz+ZoGmRoe8yk1CyqP8wDi3m+mVJz8qoxGuXFJ7JDF/SorRmVdAjEQX24o59HZJNIHqFl+/Mq4i6HUDT0iy0ySShzH24xt3GUM6cR4n/+MuiIScqpSR3NhTQ+dwlZL9jNcyuqMRYc57viKSVELfNyMEw4Zlay+5b1FF62W/3TfgLPYY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7416002)(26005)(6512007)(66556008)(2906002)(956004)(86362001)(508600001)(6666004)(6486002)(66476007)(1076003)(54906003)(38350700002)(38100700002)(52116002)(66946007)(2616005)(8676002)(8936002)(6506007)(4326008)(5660300002)(186003)(83380400001)(316002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sTwFQdGQKTyrLSpLTNmFMfg9H4y8zJhq+25gRU0yY69s4uMehrhsJGo45h0o?=
 =?us-ascii?Q?ZDssxSHIPo6+qQ5uM7nR5qzfISmrLbhAnKMe1RvHwlA4/Z/JtUDqpTOW1+NS?=
 =?us-ascii?Q?YAGMlEpdDjfDSRmvfjCm8cOZ/CNGui3I5XHpQe6i8b+SBfnZH/1SFlia9jnm?=
 =?us-ascii?Q?C24Hc2lzRCheCoJRtrRLJ5lNWvKNoZQ8sd3NiD5YB/ScS7kilYznNniq9MOp?=
 =?us-ascii?Q?4PXnWevZVAUsgvaw5LHzB1FE/kdoQ6Gb6DTE2dv3yW5i1ok0Bn6Eq6XnjCyC?=
 =?us-ascii?Q?N/Q8uCY8AgozL9srY2tL7jGEjbHSx3Bky0VEVqQu46BX43ENASeFqwDuZzKb?=
 =?us-ascii?Q?ffZZZvb1noDnspi0m2JgTlqw9wptFQeXpO9uRlcAApD+drFrQzdJq0657TCk?=
 =?us-ascii?Q?UoTkb2WkCceaF6b0G9LW6B+EwS7Ve+ONwP8xfS2QUvk1KR8jmL/7Dbj/UN03?=
 =?us-ascii?Q?DdIYiNm9wRYxduZIQnxGFCFIlopM+iWUPv4ewWF5dxULlAQS5lRhSCLERLVK?=
 =?us-ascii?Q?wFzFZryPC1xk0Jdofw3Am0JNDQhHcJZVPi4+0YyoVTrnSvfng/DC34rZIpm0?=
 =?us-ascii?Q?KxEfEw3Jhtzcn7UwVkbEHTEpBL5HhlXOnghsYxugKBiygHzV7JDnUD2IfE/U?=
 =?us-ascii?Q?BBUy5MJQOGuNSIItBaekpCG0c7eJR6JK0PmNC4qvmCL4vyJs9JXFsu/Ui6AR?=
 =?us-ascii?Q?6Ok7NdJ0GbhqUA/sxP+T8tDY5OOwb3lYUSea9Sig6YPAPIdFHUzfnCT2cPiv?=
 =?us-ascii?Q?UpV2rRgZODscgFGAtqkbExXYaRPGW3fjwqhW44sqGJWFxjC6FKkztWHdtI3k?=
 =?us-ascii?Q?2Fak4rFP4g92xGBzCPtkB9a16mWXSC+EkFi3ZG7SiKAQyRt1pzDEjeaRFzUt?=
 =?us-ascii?Q?jU50u3kGEFMsl6l4QxoAwoNKo7T8vtJbodLGCTLcn5/oX+Kh2SHq7T4dZFTU?=
 =?us-ascii?Q?shcSfnmdugjn7xLPH/hieQUVH2k5h7fOIDeFOaG+Xl/8JfrQFfsNIkDHVMCV?=
 =?us-ascii?Q?7mb6pFhZKZLQ8KRWv1Bgq/n0Hs9hd6AVf5QPXi7UA640FpdATqiuTHUW2mEt?=
 =?us-ascii?Q?JBhx1Nzj56kUaTOWejgKRupT0UMtJ3HBaOpHv90VqSQucmDvtxARJBz0r8LW?=
 =?us-ascii?Q?OtiHuKtS5G+XpLVvjlrBP+bFIo2tl89GTqAYlC55+3Vu8CGuVanLonpMNALa?=
 =?us-ascii?Q?xXx38Uoh3XFT96fbYwTl0dlSw4vcK7QW2xP2bMTIyCBZw7Rq5Qbi907P5zd8?=
 =?us-ascii?Q?k/1EvxeCLFAD9l6JrM89X5H/ByVq256M5PFnCJHUwjhwzCi7hzyNRU2qHNno?=
 =?us-ascii?Q?6r0MrCH1QYYbRNR6ReiHxeYLQ4YexPCjnQMoGTIK4OWzjbG49rV2lnES2Bf5?=
 =?us-ascii?Q?DvW6ckkGqozklCnkEkQ4GFt+Ls1z9PPpS9Mq+qtRelZQpZsvg7G36JjTiOiE?=
 =?us-ascii?Q?DFmYfm7tVwZ+CdhFk1N6JV4xfErOAs0+ThpP76uRT5a87bc3tTDuK69ixzUG?=
 =?us-ascii?Q?NKkSQqzB+ArmXsj/U5CEwo76E0G25ZbQcSAQxtDXYnG+OfKPzIpMlKtJMmVp?=
 =?us-ascii?Q?WieGYGAq2lufYCloXQ+OWEi76KSxjmoxwhLeutk+7mjfSutU+jtuurxVZs16?=
 =?us-ascii?Q?sogs+gv2D4FjoNPW9iWCkn8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9cc036-78e5-4054-6ab8-08d9ac19f6a5
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2021 11:36:16.4908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +i95qtylDQtnZ6MSxK7708G/bkvkwfY41PaHj3RQcpnvpMgvT8VsqbD/b2/yRaabNnES7DUz8LPI8HtgZzTL9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9308
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
 - v5 changes:
   no

 - v4 changes:
   no

 - v3 changes:
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

