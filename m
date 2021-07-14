Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 480E53C7D0E
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jul 2021 05:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237802AbhGNDma (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 23:42:30 -0400
Received: from mail-bn8nam12on2124.outbound.protection.outlook.com ([40.107.237.124]:57697
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237486AbhGNDmL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Jul 2021 23:42:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWQK8Bc+fRHXWMlxsm7BOfDpLUNqFAE8mmass7F5A5NC0YEXEPB29CrumF3GEp197+ZDZVmCpYgW0swunupZsGpu4lYoZUNDSxsrJbyPKoLJG34Km9r3FDWH6tbWtXKhNZO30cjsd2cxBcJxNMrhLUghrVXOlJg46a7ugXtizxx/9dnCIJcIIZBOkMKoVKI+NM6iRWpx5tvlOuu/Jkmto/4+4Kdy6ijJbfoyITGQ1SkCJFrwJrxW8AkDjhowEQMCkacuOWS1R+SrAHFga2mKjvFQSgWkKk/8UXmXakeJ7caAuuu2Rc91qnuAz2KUE5hSIL+UdHqI8i4k4crhhSfvIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivVXuIeNlPWIlUauHXlVoWQ2VjPlpMp8oJiaMIIMBh8=;
 b=lEBgnpneRPsf7ejqMv/nF3M9kJ9v1xoFH15JNfs9yWZ2zRPmI2W9/CdkvEYpqtufEEz+5d9xkPMGRcH68nWEvKIIEn+t06nJWrDIEbrLX0QhQ7VjzRREaTl67gB0VDU2axiUzLFIhrwNfFVuGCeKytQQvtuw3ETERhgE3lQYEAklAs6iHeYjn1aJYezbsNwRDw/7DNUHf3Fp/+YanGzlj7o2mh3HpXPMd0nCEBJ2JUjc9Oau875c/lsKDBZ1itS+VGGn6ehloVqLUtmSxatCr76DQnc/+5m8FjJYy1wwV3NmmwwcUmOrwofoiEgqMbrQAlcT5qK+gWs64QohL6bHjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivVXuIeNlPWIlUauHXlVoWQ2VjPlpMp8oJiaMIIMBh8=;
 b=H0oGQWwU6/pKjMYHe7BPS0t2/7hsNmI6LUVXRjKtVCkHx1muZx1h8iWDSAPmm20WLkbWvSvwB5sfI7lOjXI9nA2BHae9lSsBcw3d2MZww6xQFAKgrNtamhnZSloH9N2/+rgIZAC7d7QYMNDN5Kv66/IkhHmSeljQQuypFCY4wkM=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW2PR0102MB3370.prod.exchangelabs.com (2603:10b6:302:2::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.22; Wed, 14 Jul 2021 03:39:05 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 03:39:05 +0000
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
Subject: [PATCH v5 3/3] bindings: ipmi: Add binding for SSIF BMC driver
Date:   Wed, 14 Jul 2021 10:38:33 +0700
Message-Id: <20210714033833.11640-4-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210714033833.11640-1-quan@os.amperecomputing.com>
References: <20210714033833.11640-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0099.apcprd03.prod.outlook.com
 (2603:1096:203:b0::15) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by HK0PR03CA0099.apcprd03.prod.outlook.com (2603:1096:203:b0::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 03:39:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f421526e-bbc6-42c8-878b-08d94678edc8
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3370:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR0102MB33704E305CF87B21556F2B98F2139@MW2PR0102MB3370.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hN8WUCgP4V+AUSXGXUYR+TzSFRQPna0imlBOCROgusn17dXodrf+J56Pv48ZHqwYz/atY50l08jya/mCQndK3FDQWOo10aIIzxzlMs0oHv+H7ID3iY53s0V3nY1cQlQO/iCY3dguECstaBuDPRpA/eIDHspiODcydBbcyX1RTHwgv4ILj8X9F9wxCfRiOtu5UOzL0q5LOjD6ItRT8+cPfHhKk3Srnvz0isk7mDOVlgrQ6vqWYGmurpv8mXUxgKswhj84kCcGWvwY9cbLWjjdVq6dlkgpHj2v58qxAgOugSlb+3eynZ3KaFjI0cEhziJcP4CTNX9ackVfzlqylZeOdkoFt3T5aX+GbdxnnrY+X4A6GTO5yOv2VbdF06sD6wn64svyITWVyT5e8PtGwPk8NvYbDzFg+D4OYYSIDp8inp3wj8fVV5NWY0bJ162E1776fWqgwV3satpaB5li1hHoPDH04mn4CCA/9ZySH9Dh8ebyks+D/Dr3u74IdTgARLF0YSaQmyv3jhspmH4tAOHAkYjKdusaeIg6szn0jaN6awAe90jRQcEMCzDl1StZpdBY4nGXu4L2y4/H25M6njepyXGSh5oH2FGqi9vXWUmCIH9xPzapG/2iOvDVtCrON4kTUSm+TiMfwrs3+jEoZOtRcjRbCVGIB7yZpN72Pkt6HJdW0r60wrefHM5Ay7HZoYLidbDkrLRi9vw0OSq8ONYAT/FrUWkz8UxTGG8gehauFkXwx8h5Sndxf65N53qiZQDm0v8SID0tOOPr7I7CIhnQQL6w8rJinQAHOWdckfI4wH8gksLQgRyUJyV/cQVbWZCR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR0102MB3482.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(39850400004)(396003)(4326008)(38100700002)(1076003)(38350700002)(2616005)(107886003)(956004)(8936002)(8676002)(6506007)(86362001)(110136005)(52116002)(5660300002)(54906003)(2906002)(6666004)(966005)(478600001)(26005)(186003)(66946007)(83380400001)(7416002)(66556008)(66476007)(6512007)(921005)(6486002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VFsUpDJtmJyvsQjsv6Fyo9rqHfBCvRotxpVPb00QiDLlnKc+TEThfYk4yq04?=
 =?us-ascii?Q?9wv5pTsGDq3m/BnEEYfDZ6ilQiGC+8NphtmKUVqWp9F0rROxeI0jOHxy3/E6?=
 =?us-ascii?Q?fk5DIYcU6X2BRFtRAIeuuq2t/o450gG7bOm+7IeA4IwdqE+rHzjnth7FVL6h?=
 =?us-ascii?Q?Zfh3kRqvL4dyMujiPgWT3fpHsitr7YETG6x21kPHwgmkvwXARgHoSJWskboE?=
 =?us-ascii?Q?FAff/a25Ns6rlX9OpBbGnLDg9ThB5OLro+FR30p8WGezIPm+BvbsLPsstmUd?=
 =?us-ascii?Q?2chsPoP558XABZScadpj3nHEjSh5Zutk4RG0OcAF+Lh+F3jRUV5bW+6k2+km?=
 =?us-ascii?Q?ZDVQS/nZslqvg7v0Z1fUmW1JN8LVeZn7KVp+MMDoE7ysn0i/Q3qIFExRQABk?=
 =?us-ascii?Q?LNY6zaZq+NBNxXC1n9rnZjI1z4ipGMoaseK7YjE9PBOhdHAWbZgbkuDFYQiZ?=
 =?us-ascii?Q?OBVaXanWUFX7jJKPJ/P6LAYasE0eW9HBibpSoTz9bUBYvR2ECr1anhsf7D2n?=
 =?us-ascii?Q?vwv47i+sh3thLrEqJupvkaf57iSMBKPrS42meY2Nz1AOGFOBwve/jD9pGj6J?=
 =?us-ascii?Q?TE+g6gmh5UBY1E0mj14R8W82GULy7oaILjtJpmqB/j/PIHt56up54jMFofGH?=
 =?us-ascii?Q?SpU6F5RZIxAcIjWcn4qbgDs5WaPn6VN4NsZPRCMrhpUIBl6rikDZxI7vUdK1?=
 =?us-ascii?Q?SUnvA5oAYTQo6RGMrVVDwFjeScW1RCa0gqwXrFGXRW479JO4xgvR02oVuAzK?=
 =?us-ascii?Q?8+vsd471XjZ4w7Qhp3p25fZ/UGi6P+7ZDkXqhAx+QMZdAa1DzP2gqZJEqay5?=
 =?us-ascii?Q?gZloK4aRRf/aBXLrbGlKbIRLi20+ItWTqhcBOk9Z3L1P7eGN6N0jVgYKNF1R?=
 =?us-ascii?Q?PpQ3Apb057qaEeVPtzbYZjstQNFJRWnkjpGNNtAzgOhLYW4LTmws2ZzLhqRT?=
 =?us-ascii?Q?fsHnx7jc6EB3Juk8lDEwbSXUdX04g2dlNcznDZTGdlGL4iyfyRsHNKloUpoe?=
 =?us-ascii?Q?mfVkQ+0N/LMVct+NcFPkASUQH4aIxBpq2XDT7waoHAm5duOVzEFt2wSkmmHl?=
 =?us-ascii?Q?OwH0xD1umWrh+/p3wJRdpTk35KFQ3+WWx88msztxGSwS2SG8VVmkWPVHhDka?=
 =?us-ascii?Q?c0f6djvTSJAUoae/oUqmdMTdekZcsUtTySDYJsnVLYhC5UrqTQhH12Yepqt9?=
 =?us-ascii?Q?43kfjKEwRA8DYyejjdGMfmkx9S5PS5nkHShF0j+Tx6+xVY6fsCdgYe8oU0zu?=
 =?us-ascii?Q?K+gem3rgzAhiPHNyy3ziR12A07kjlkiHbz4v9W9lbIrFnqhpj3nCMAE2sVWo?=
 =?us-ascii?Q?7sPxJm8DwOyAhCp+Nps3F3Mj?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f421526e-bbc6-42c8-878b-08d94678edc8
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 03:39:05.2525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/gl18wuRBD21qY/kJqLvJPI0kYjrB2+kz8FL6KrIk67xCBv0YRKKRX+DfVDTGP0bmGkU5E70GfSwBMmQx+ckr7q1qqMrX1WW9R7rZBd8lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3370
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add device tree binding document for the SSIF BMC driver.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v5:
  + None

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

