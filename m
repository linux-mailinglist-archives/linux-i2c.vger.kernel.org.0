Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC1C3C69FF
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jul 2021 07:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233645AbhGMF5p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 01:57:45 -0400
Received: from mail-dm6nam10on2091.outbound.protection.outlook.com ([40.107.93.91]:23617
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233638AbhGMF5o (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Jul 2021 01:57:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MARE1zCIyQWqzhu7gcmSK5lDqXlz193eHG4/tmUS07bZOQQHwMhKG/fj6Zs1HyZf8r0iVOTW0PZkGRh51d6myNQZ3rHGtA65TUmZavb7YtHrh4JcP/MX9L/yPG0tidVRhJL4FBx4pn3Ew0EmymScArz4awaVXT92oA669H13Q7zt4+lxsuI2ajp2ESvOI3EMpcRGb//46V/kN2SJ+ovASQ2hdnimWv09y1wGQ3MBJ6nLUIiKiqHySrl4dbSo0N2y26UQRjIL3UBFfDWJzcW/uzlDL4IX1O0R6v7EeiQooik4cTM8RSFp1sT64QE0nieMqornkW2Cqzcduu6QZvwzOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4o2Kr0pgqInta8YQxFYmgBw5n6bKfLUYUZm5RnyyUko=;
 b=UJlgh3txXh/fkPuG2bhxBN4SeflsvWYLh3+xHhCi+Ul3E1m74OObD/dcdJKR9f7LJZQUX9wD6TQFkuUJ77Trw/8tMCUlULSqhoOq2uiXyx/hrbWxGlKk8u+NQrTzVAjRV1rQa+0cEFDPujZF8WBVCv9f0hHTeZY9b4eKxlOwE2rGoU5qP70hGzAaNmV2JWawvG6ZoPYiXuqOeA6EtcjvttIrM0Hz4imuhoBih6aLjc3F0sCWleV5fGpk4nSra2svY1vJ1LN1ttFbmNlRNuEqCyT1EnrakuZya/1dCsyNRjby1dbrFwKgNmADCX7QY4vHm8MwFh/0t53S9lH+AnQCOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4o2Kr0pgqInta8YQxFYmgBw5n6bKfLUYUZm5RnyyUko=;
 b=aQGhYYpP6xQGT15vgaqf71cfK1QXP/3jeAk5toGeR6Egtg3M5uA+Lp3qk/0vRHWu8eokRuAloykQVj1iJ+EjNcYAIr8POLpDzdYopFy+dBVw9tx7DpXOFQbEUb2zSF/7S5x3HtfjbLIjAS4VCvvwZ1PE+dmONECYjrxWRD6bB0E=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO1PR01MB6535.prod.exchangelabs.com (2603:10b6:303:d9::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19; Tue, 13 Jul 2021 05:54:51 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 05:54:51 +0000
From:   Quan Nguyen <quan@os.amperecomputing.com>
To:     Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa@kernel.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: [PATCH v4 2/3] bindings: ipmi: Add binding for SSIF BMC driver
Date:   Tue, 13 Jul 2021 12:54:24 +0700
Message-Id: <20210713055425.30636-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210713055425.30636-1-quan@os.amperecomputing.com>
References: <20210713055425.30636-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:c9::14) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by HKAPR03CA0027.apcprd03.prod.outlook.com (2603:1096:203:c9::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.10 via Frontend Transport; Tue, 13 Jul 2021 05:54:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78dabedf-cb52-4072-da51-08d945c2bafb
X-MS-TrafficTypeDiagnostic: CO1PR01MB6535:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR01MB6535ECA682061D48F6849CE6F2149@CO1PR01MB6535.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xShwvRtrctBmkNyIYLIYez49N1y+FHBJQVTtF/U91iIuGSiFDgyOaXElOLmne8EmALpQzctFwCLerZv9Vg2j4no58ginadPATPK0TQ0vF4SRcTUkmgO7hY2vZMPfPRJMm69uGa+v0ki+jl6dZR/Wed/z6ktgsaqnveU44uWR/ErDNwU/uf0mYZKqPfsP/OzrULRIFlDt6z0CXDJ7g1aqPpcoJJDxorwAs2TnBq6QGYaur5SWmVarWdczovTaZyKqU34EHscTttHB82i1xLxU8uU2NuoJ8q7Q5X5xM5+ntFe80/A+B0uNonbXO1NfUosSLw6xdtGwgBWYMVmHbtpCWP79I2y1B548PelSY+MqErxSMqgFmItf8nhq28zztL8uCQ8JSBMrH4Aj8w0eG9mz/uK17GpbWmdZpAeWmD9+90y67JtTc9PDpKgJfg7bbnSjuqgeUzRr4ZT/KqEAM1Qs7kDDCGiO3CBa9IFjdWxWE36C8AQU+rBBwMXUop2NEYEz81gSbdkL9jvi0WSlF/0FwFc64T95RahV91v9RJEEbgzH8Vx8qcU9B7b7FZTXH8BOfJe+HFIws9fJNbnv6HoyyPEyhlbng3fXtTYQkzAi7NGAcbKrn1SfjxRl5BHJmiz8HY8DNHUdZXfFEqedus7UhDOQA+UFctKd+a6osGiHpQea/SduxqQy6K5o2DDwJyVZ9mHwfvG7buEvIMHdBbzM/CxWSk6PjtZkf9z7z8ZQet6/q1+wghuuSQYOoo9NL2YsI2nedJE3pPSxCNhorbuUUxmQ8HMFZeKehICvJZTtUgVQvaebpF0Yjrbvw6YRf2Hk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR0102MB3482.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(39850400004)(346002)(956004)(8676002)(54906003)(86362001)(5660300002)(2616005)(2906002)(1076003)(7416002)(52116002)(66946007)(107886003)(478600001)(66556008)(6666004)(66476007)(6506007)(921005)(110136005)(26005)(186003)(38100700002)(316002)(4326008)(966005)(38350700002)(83380400001)(6512007)(8936002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oov2FvzF6UFc/DUDT92tFhAwkjrBGbB78jS6DNORr8wq6pBeDfvmsbi56wxq?=
 =?us-ascii?Q?1tgpMSjqVKIaWuTjoZ+MwCdozP9KMIMOWfdcFnpMz6IuTPp0aNOgftxhpdlY?=
 =?us-ascii?Q?swBcHmY6pjA3kT/unOqYgWEQnUryeQC0tKNzwRjXko0bYYUtQgHInP/qWAHZ?=
 =?us-ascii?Q?egCHIyImSTaCSmuZNMqYChzrZvNotN/nEV3w91Mo1WEfPsSs9Z8npG21V9vm?=
 =?us-ascii?Q?BaR5Q0MmrjS3bLDl4V1lmARZTjs1uqK9a1MgeKBZR5tBy1DoFXM5gxfRgsUu?=
 =?us-ascii?Q?qUlKEJxO3gNn1tqyE6EvJPCp66j4bp42cdCx40CzmaLvY2GdzMcG2RgyePr7?=
 =?us-ascii?Q?ZZhb8BePel63EJMUOUgS3IOKvHgyPICaofbteanWgdkAI8EnvBbYRFs8eaUB?=
 =?us-ascii?Q?kk8TDjbsqWh0+5gCyBYX6N9uvNPEbgO13KKtk7eKrV54QtrKysoxHjozXifO?=
 =?us-ascii?Q?h0E95p6lYi+iNwVFaQfI8m1Pb+Xhtvw5nVstaWpAf4Vu6ty+L4vQjbCWFbMl?=
 =?us-ascii?Q?XN9tAx7mV9K2m4+9GJzUXIvbvprow7ocmVmzGLv2YU/8FXLlnWQHG7sBYvVz?=
 =?us-ascii?Q?KMtYP8+E1iGAoObXRcN8W9pbrmXGV8GfQ7s2SSuZxdY2aazu9WU7A0ngeJjx?=
 =?us-ascii?Q?NDQpPIQ4m6Djzi6H9kiMvHEMtzeyQaAoA5duArGrzzm1fkxhtJpAALBnmJBE?=
 =?us-ascii?Q?cJ1kC48lZxoCLa1mrVpOSKrjrZkrktC88QynrBHDsQ73lcXDb1RmYq/AyeQy?=
 =?us-ascii?Q?PbckP5v3Diq82z05FYAFVMitzXtzWHG6JMfcVTco2FOLz/EC8NYuvy3X9+uc?=
 =?us-ascii?Q?XdAvyoJG1yaRD8xv77p4L1UxYcOCnpmwp2XaPxBXqi7DNb2fvE7DI7ZfI9NK?=
 =?us-ascii?Q?I3iDblc8QCZnJSqvsYJbjNmLa4OnLGA0fJ9ivk3EOYnH3AegN4PQmU4EHg66?=
 =?us-ascii?Q?IaMKWHLBcso1AzizJ886d93uQM9Xgh5A6FcbwvSUxmkkf9a0y/kIj0JEkrCq?=
 =?us-ascii?Q?mL5EV0q8k6woJ52T2pPPu+D5smkGqpbBe2MBoODS1F2fgX9txIbfgrJ7rVnJ?=
 =?us-ascii?Q?Elzc1/7UM6W/GocTUA1mv05c5wMN+kxSUZ3Xjb2dPVtR+CsiOiSxG5buwRRv?=
 =?us-ascii?Q?J7DfxT5SQmkybD1bRG3Jy6lc1UkD1e7845FGewEX6yKFuDSnKr4yyVEodyar?=
 =?us-ascii?Q?uKUKTkTTekHvx89rJFvXnU/T30SViYXFiCwWH3tGoFw14hv75po+bKDH6qgy?=
 =?us-ascii?Q?EGR3SLjsBW1P+ThpriYt7QrtysPhTFz8jkZGngqKrqs70vRiokw03EZY/puj?=
 =?us-ascii?Q?vpd9Wd0TqCbM4gkNhozF3Agy?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78dabedf-cb52-4072-da51-08d945c2bafb
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 05:54:51.6333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3kDD0v527jUcipDU+vsh9LZ6t6TnOlfcp+iQmUAoEWIIaYgFpxzS8N7ET8DMZ9A7H41/QIlLuzBwj3ovr7kgDHjQpePFPedSCYxMzMgaSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6535
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add device tree binding document for the SSIF BMC driver.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v4:
  + Fix warning with dt_binding_check [Rob]
  + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml [Quan]

v3:
  + Switched to use DT schema format [Rob]

v2:
  + None
 .../devicetree/bindings/ipmi/ssif-bmc.yaml    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml

diff --git a/Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml b/Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
new file mode 100644
index 000000000000..917a577c2f29
--- /dev/null
+++ b/Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ipmi/ssif-bmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SSIF IPMI BMC interface
+
+description: SSIF IPMI BMC device bindings
+
+maintainers:
+  - Quan Nguyen <quan@os.amperecomputing.com>
+
+properties:
+  compatible:
+    enum:
+      - ampere,ssif-bmc
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ssif-bmc@10 {
+            compatible = "ampere,ssif-bmc";
+            reg = <0x10>;
+        };
+    };
-- 
2.28.0

