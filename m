Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD4044E311
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 09:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234652AbhKLIdj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 03:33:39 -0500
Received: from mail-eopbgr80080.outbound.protection.outlook.com ([40.107.8.80]:18318
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234622AbhKLIdh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Nov 2021 03:33:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFAXbcUEq+2dNhsvILclSHRcuT67PnhnGCP1IY7pPhEKkC1BROHscJ3dm+nLlFyMs/f5OwmzNk7bp51lMLPNdFMt2mSDQmR0mU6hrhCFfhIuzKg4Q5S2BH88ddjI6XTnVj5rVBEUXQ4qhuMoxeHzmNgDAH0rq57+So6G5Vu2OEUlq+ovTVy0xC1KYW6ab4cyCfsdTGKwmX6fxwg4blZ439pV5cEwO45GiBnb1ICnjC2F1aNC4z8yDKW5XgBEmMTlBQ746g5Gzwwbm3Q5CpcIYMh07BKy34oinzkure7nBgCTmAy0eR5jj1YpCqUxavlbLPVQaj/8+QUuTyXZgFUtSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzQzl4k5Pi02dn98ATFnOM1wCcHhOT1hgVWEf1IA+mE=;
 b=JtJkRvxOqj9G3zxHCPR5av1RrlMlmrE2zh8n62VOEdcjCMY5foLRARimDvLYxjHngU+hejyiBKzR9ztzmgMCsWygG0ySvp+M44Fi/NRgWqJ+Aq3ESW3cyMsvmO3SgbirJlnNLI3lmEF/ZxMWsao4b9ULW9BZ2gPm7iCE7zOIt5L9oycy6IWsC569Yre1TweyGjA5G1bQQbOby3XzOGGSxLMe9yq+V9QY/bgY2nsf8/mG1x+LgjWgYmWxIfuhS2Ls7hSkzRYHRvV2r3RIWi5/FAuQKcEPLHXniXOY8AlqKBoPT6ZlbalL3MOZye0D5cc/O50vC3D+glN6kPU51n6N5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzQzl4k5Pi02dn98ATFnOM1wCcHhOT1hgVWEf1IA+mE=;
 b=kv6lbZwA6y5kzKwuPBK+vV/iwQniWeMP1Yy7/DY78/PPyNT4rAnrMGcBoIOmXIZEw3qCI7YIh1+jU6xUbbZwYXqSGHF4wfN47ZWcvDqDIcUb2pZhaPcTk53+uC57gd1fbL/eNoJW2ZW+B7kDeBojhgI8MQz7Gi8gJeqxyPaJ9wk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 08:30:43 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 08:30:43 +0000
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
Subject: [PATCH V4 3/9] dt-bindings: serial: fsl-lpuart: Add imx8ulp compatible string
Date:   Fri, 12 Nov 2021 16:29:24 +0800
Message-Id: <20211112082930.3809351-4-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SI2PR01CA0013.apcprd01.prod.exchangelabs.com (2603:1096:4:191::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Fri, 12 Nov 2021 08:30:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f9e0b59-e4cc-485c-7e5d-08d9a5b6b7a2
X-MS-TrafficTypeDiagnostic: DB9PR04MB8493:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8493E4D4761BD222BB938085C9959@DB9PR04MB8493.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +VflgSSXOkBMtHiNnp9OlKGy0cf7YCvNeLUzGBf/WVmw6s9JlzNG67DQ1mu0a0Q0hAinrLeiN2kHBPxjF5IoY9yIStYilJ9OSI4W9RHtOB4sN9WvaxZIZPheZu1iRe7VXppjsxNBjccqhjIjUoDXN/CJWLPED2/61UPeO+6nqAYFB4RVittBUvRJTTWYT8hhkznH9eFrLXuCF4ivgDcdCfUbmXjwIvPx0Dug6n6rU7Igmp/fRaxhvO0SsuZZlDSSHbtnhn6p5Kd7++7uvxkDez1/SaCe50ud4aY+UOTBDGxN1f451XNJLnKIm7e30rcV46arA6nB/poVlmHXW8mU0IdixUhO+VLlVgiVyfpOw48kL9EwVtzdn5YwiKVFqh1xaqUy4sV2tIrCy0BfI+CCxRop0O9AF9r/K1lz9A14FSSvGxvOWa5oxvyFZGkF6DyYv0+ynIs+OQKOJ8yIDMY0wMPE/AkyV0pj4SVagfhgJ446HC5ojGA0wJmm5kl6EmcdIGzKk6mB/BCqz0SCO1xYsn9BSjer20LBn5N4cXwHnxI8CeVyeXE5J3Z9Y7las4WVmjU9akZM7lx9N7L9v91Tcu/nbf2T5ey6N8TqhiI4mYItq+vCPtHhvYBPyPV8rxNn3y1BxGXS0GTn93GrhxEbwYl/EUl7nq0bJnG5TxJOtZfNED+JMpGHuaSAq17SjXnCUXcKi7HHSHHK4r2wtEm3fNbWr6mGVV2KeDz/IGOBqDA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(8676002)(508600001)(186003)(6506007)(1076003)(7416002)(956004)(86362001)(54906003)(6486002)(2906002)(316002)(6512007)(4326008)(5660300002)(6666004)(66556008)(38350700002)(83380400001)(2616005)(52116002)(66946007)(66476007)(38100700002)(8936002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IKKtM9QZrAXVjuWJk0SuBHQS9a0BGPKMNh/pKF9LJGTP8r5KrzuG0Ma2cIgW?=
 =?us-ascii?Q?tycYzvClVOTmxq9vs3ntdBpvGgd2vYR8NWM4po6rWchJ9/nqAiVb8N6iH6m8?=
 =?us-ascii?Q?o4uwFYqfEFr9fcPddhBoOBXyIWsBaRNAJAUa/+LALfu5FpiSTsfPCy8XViu8?=
 =?us-ascii?Q?vUx09RYv5pbJ0Y4+juqEcJV4esSa7eencb/sfoCmgpfDmgHZDZxhTl+i0D+U?=
 =?us-ascii?Q?1v7Y+FSOz6mfXTApIusFlB2zXCA+k5JxwO9ZzU8yCvyeujEfrZGihlaZAvas?=
 =?us-ascii?Q?gJrNVSpQ8SZE2IEDmUo/90P318Ge9hs7/59u1v89gU/X02gO5gDGsL/avEoI?=
 =?us-ascii?Q?nqjCrGUx5ZeYgMPAGu+V2AuePgLlgwLRaoF3pd3gP1ZgZxgveY7UnhuxvRZs?=
 =?us-ascii?Q?nI6M5JTzhdwaSkoZMCSrQwFPXKoTF1u8alrwxdXJLmE4igeoXjrrv9cVsIIY?=
 =?us-ascii?Q?BiXYYELhFUlQwddNnbthHlBb2iMRO/ss3yM6NedIHwCz5ayXA1e9aNyMU9VU?=
 =?us-ascii?Q?Whrnm1ZDgTjSXV2dBPRfGOkOy+631Yx01EmjuXoaTTimJkzlmsNajaY+vkBp?=
 =?us-ascii?Q?Bx4EHh22Ldy2iOE6BLsee64nYAmgzFpl/p550pI65CthJiEQAGOEdRZTOC4e?=
 =?us-ascii?Q?z0T0vTErwbo8WVSUbV5i5lU2uFjaiXJCPEeR6h5Lc2p6793bQ9Afz8Pbq8J/?=
 =?us-ascii?Q?pD3cepBEqkpfY/k66K84GpwO1AiGk0Oh5aVFbOKn0PiT5AyejWjsqvItVbFm?=
 =?us-ascii?Q?3ftUCiN4gvHXV6Zfi+ZgRY/H4YyDtyymLTZWAfHIKvvMLpAeVMFRj6Ae3+Lw?=
 =?us-ascii?Q?x7XJlmWMoa/SgGEvWDT7Q5SqRJMmdzq6om/uICw86LJnzSnINdWeZ1Uk42yf?=
 =?us-ascii?Q?vFVc8Ysb+0KvYBxo1UmzBHRexOd6beHwHVUOQgVO39UOFmGM66v5TtX4pNmJ?=
 =?us-ascii?Q?vqLwrH55lpzAO9pRcZbMJIqD4zROYKDjP5/vqtOXb7WMyIwvoH8RefzvBp9F?=
 =?us-ascii?Q?bCGpiYf1RzqBQX/pZ5hCIg33qck7hOzshxvw1oihmWHk1swUBKPMZDncmujj?=
 =?us-ascii?Q?XtoUtdetmoTlNGWId7nnxTOmEH34pPVqa7VBvtmC/oRgI6+F/Igmn6epj1Ib?=
 =?us-ascii?Q?tIzwZ/m7Zz7aicb7vPItLBkUPyyNDHi4YZ+mbXKXYUH0vPv8jL6XsrgkR7eO?=
 =?us-ascii?Q?0xC+/AA82u8tCSv1iBIR7hcST/ossDe/FlWknR58Eh2QcN8xAe8DxNMsF3VM?=
 =?us-ascii?Q?2xE4jKbCYUfHAVTEumDQfC5E24FNEGTwCxdLxAM7EDee04hBTVr3ff2gPHmM?=
 =?us-ascii?Q?yvVguT8z57fI3bsZvIf6TOL2fzETNljG6jGLMUgl+U2xOEaj7ZV3xiigTMwp?=
 =?us-ascii?Q?A8rg+FC89eVHAaMXAhy1BIsB+JoRxZKjyyjDCK7be/UGUswcANeafIcK+DqA?=
 =?us-ascii?Q?8QOAQDt0SagOQDnQBPnjMoUb/8VNkbTapb55HiJM5uEsqA8D0Qf47R1gAeI4?=
 =?us-ascii?Q?sW4lAsPgSvJyBZu3Io29p/yVF0NJZj0aAaMupMP8Y0j7ysJE/rQwvXlLXXMz?=
 =?us-ascii?Q?dQslFUsDqFSzQu/ffZrNL2tf+lwTmt5XoLTKgScy1NfI0MrOv1qIhF72rWlC?=
 =?us-ascii?Q?t8Y5tBa4tzO2wvRsG+eZsWk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9e0b59-e4cc-485c-7e5d-08d9a5b6b7a2
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 08:30:43.6203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cw0z5yRqaGg2sk3/03o/O+1/dqqnxI2snW+kG0WZwXs/gm/pHSoWRNAy/HI4yg6mpPXqaZFSC9AY+LOzYlX69w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493
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

