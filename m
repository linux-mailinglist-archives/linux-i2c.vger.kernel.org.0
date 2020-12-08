Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0A02D22C7
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Dec 2020 06:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgLHE6V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Dec 2020 23:58:21 -0500
Received: from mail-bn8nam08on2060.outbound.protection.outlook.com ([40.107.100.60]:33313
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726112AbgLHE6V (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Dec 2020 23:58:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSPLqsGX0UzCxByamv7jUVCxA6UIsPwq+ebavztvjFBjShs4v4hheM2kIB4T+kolX3MG+XH5+H1O62BobvYM+IayxFiu5d/nMPXRPIAtMQgzYX+sTReQ+DRx9AqxsbSv+FeNGbA44l+9NQEp88pRem7MQ6CR/aO1VK+tzr/waiAQJkWuEQ1tLxgBDdafaUd23cHZVGAI2pQ50SL5NA5adOon22rLmfH+UGJPDY6OsEdQEmzWi5L8DzAZmbIlwz3a4jxCo4QSma1YTX5AfxU0ee2Q/DfCCTJE5wAj7qA9n+eTPt3l7C/ztQBRlEuUjCIIZOk9SteLWcsOFmtbh+MMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXeNfZTJwTQH4URh7Z09c8XBBl3wTwyVUsnPEBEg/I8=;
 b=BbwuzsOP/pFJ3BaL/mOskfj0SpyD+p5yhFJQrw12NP6DYxbq3e56NuuzeVvuGAKf9eqnxs4cmoe8/nspL3mnvz0Gku1uXuw0U+pjOv6yYT5nvkAClXT21XsCQyj8P+tk5gVDPDCJUCRGs7gESFhGTlhEgT6JIoHB/m0h/Bnj0Zy2dKRm08A1s6E4aIK6cfr71rOROW8Nkl5XLns3p+g5qAnna7Y619Gdb6D/HfdtMTudlInLX5wEG3ChHvLTIrGObBzbnNUjZqBl4dGsFVNX2NDJctbUBo7DhWNupvxkvx7/xiILLhWAPEbxUkrj+/SzErCav1nazRb3oJv8J9NUhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXeNfZTJwTQH4URh7Z09c8XBBl3wTwyVUsnPEBEg/I8=;
 b=U7qfDgooZx2lUpHY3g8QYb7oi0Ojm/5iMBNtiotYrj5Uw6QAOcLnR/6ic8pSNrKsmnyKAxg5T2z/3c4gtEccdgitU6Dp1Y+md1QvQChlskG5GT2ED3TMI2E8nLBsauPSFTREodYCS33eiDaCganxbnJ91kwWMViAMGJE25BpgNI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BY5PR13MB4440.namprd13.prod.outlook.com (2603:10b6:a03:1d2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7; Tue, 8 Dec
 2020 04:56:56 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%8]) with mapi id 15.20.3654.012; Tue, 8 Dec 2020
 04:56:56 +0000
From:   Yash Shah <yash.shah@sifive.com>
To:     linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     broonie@kernel.org, gregkh@linuxfoundation.org,
        aou@eecs.berkeley.edu, lee.jones@linaro.org,
        u.kleine-koenig@pengutronix.de, thierry.reding@gmail.com,
        andrew@lunn.ch, peter@korsgaard.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, robh+dt@kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, Yash Shah <yash.shah@sifive.com>
Subject: [PATCH v2 8/9] dt-bindings: riscv: Update YAML doc to support SiFive HiFive Unmatched board
Date:   Tue,  8 Dec 2020 10:25:40 +0530
Message-Id: <1607403341-57214-9-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
Content-Type: text/plain
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::27) To BY5PR13MB4453.namprd13.prod.outlook.com
 (2603:10b6:a03:1d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 04:56:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cd98e1f-097b-4b84-6196-08d89b35aff8
X-MS-TrafficTypeDiagnostic: BY5PR13MB4440:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR13MB44404EFAE4CD6B7273DEBE7182CD0@BY5PR13MB4440.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UnkfHXfjOessFa5QWD8Tvmo3RlfCTw54EOi9fJDpFh0Sh7hG3LV1/7cLkVlTyCByy3G860e+ajePASaX5MI928rYivXsaOzWKeIX8Hu7jY2/IbBqPPKCoxSw9G1WNZuPF12IU6SF1EwOumCbmThXsp/T1N3H93JWa03sDAD2t6z/1btwREvDppmf0cCA9lFPsPd42tIYVcZs4vx1+ZoJj9h+tAnC3SETC4C4QE5P1EOYo8GzwCpAgB3ms4ocrtS8QVyXzaHb9FyaDbiwv3AoYsN3TsoR7Bdsyhaopnqqa8QfT9g2Vy2BmwfExbUoyXFEkEazFDFtMrQdelkNHwsjtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR13MB4453.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(396003)(376002)(39850400004)(366004)(136003)(346002)(52116002)(83170400001)(956004)(5660300002)(4326008)(107886003)(2616005)(26005)(4744005)(2906002)(316002)(7416002)(42882007)(44832011)(6666004)(83380400001)(16526019)(6506007)(8936002)(8676002)(36756003)(478600001)(6486002)(186003)(6512007)(66946007)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EU6rP71jEmrsdIZt/tspq2mP4Xj8U45TAT1z6qWzAhdUsnIqTdDvDZvkpQt6?=
 =?us-ascii?Q?Nsi/DV7RFQ/ygKx5w3xFQRLz22khl7ut9+/GHQJyqCslMc2618snCSuXLGrQ?=
 =?us-ascii?Q?0xS2WXI7WR3Bd6iiUAsc38zyxYb9u5RYdZk3ucHlbSo65otV8YlrDwIvEyjK?=
 =?us-ascii?Q?VLP4jlO4qqzmkvMCIumZv9ZwXzGBawgw2cVeEhAMP17R7BELXLTduCQkiY4s?=
 =?us-ascii?Q?NHHcDwUnM0528keO+IthzFeRGLkcbCDmx/MKhFu4MvJ9nmG+Gw7LYDEADXj2?=
 =?us-ascii?Q?qKoe5cACxIFj1yQP0ELSJMWggO4j3K59xo43MVUAv9YaIfb2s4Ub1J9CGuSD?=
 =?us-ascii?Q?07ZYO3NgCON3zDhvnWGQ2Oeo9nibcktiBfwaSkz7FElzObuFBsroZEDQkF7u?=
 =?us-ascii?Q?ab6ANYdVAwj9O783OJLWygd7HCZZdB27844e1qWrrgtjHvLdCsMNidFk6p82?=
 =?us-ascii?Q?8tMNW5UJOqjfSFbr5Xy8XzSvihgXfmnDCRPHjHPMNLpYbNJOIzp26L7tUuMK?=
 =?us-ascii?Q?rK1388jq8/M9CxbbFSePTEep2U/tv9lwJ7ht+3gMP7AKoBunDVOPwOpY+kAb?=
 =?us-ascii?Q?KS7/uZnMLXx/36C1j2n8/7jNi6v2vue2d3zfMrdTLbC6ygMj7C3yhvwAyhSP?=
 =?us-ascii?Q?36eeEfdhJ1v+usjt3MXzMLrd//IpML8oDEXnkYhIEkGu8uQIgFVDW0sRe19X?=
 =?us-ascii?Q?8B2gG1CrRzwfKmw6KOP+E2NqT7XGLgA6/vwr7dIqQQh5BvMwuNpcvx1taqjT?=
 =?us-ascii?Q?X7HH210ob6TaeEw7flo9WAprayzNEuOOPFFFsoSCD72hcXFHWGcd9awBwQgA?=
 =?us-ascii?Q?fKLap55diZSkiRqTii1FCX9zPI+DsgDv6cLK1eqfFJuQpuT4RgGM31juLwwB?=
 =?us-ascii?Q?vVIfnFXVI4LKFygPyDipziYT1gFzWBqExK3pPajLBMqdNsRlRL0rfs/ErY7U?=
 =?us-ascii?Q?cgog13UAzNtpqnYkcN8NYc9Qpx99ICQgIwcZsw3e240S21IzS8mFJqo+NN8j?=
 =?us-ascii?Q?IVqO?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 04:56:55.9583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd98e1f-097b-4b84-6196-08d89b35aff8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y9onxORMxzVGeSJEfa3rfCocvHc/AT19xrzyKKkunnZvc/9l4UIviPBNcgY6HygDp61Wye2ns5aK7FREX+eqhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB4440
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add new compatible strings to the YAML DT binding document to support
SiFive's HiFive Unmatched board

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 Documentation/devicetree/bindings/riscv/sifive.yaml | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/sifive.yaml b/Documentation/devicetree/bindings/riscv/sifive.yaml
index 3a8647d..ee0a239 100644
--- a/Documentation/devicetree/bindings/riscv/sifive.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive.yaml
@@ -17,11 +17,18 @@ properties:
   $nodename:
     const: '/'
   compatible:
-    items:
-      - enum:
-          - sifive,hifive-unleashed-a00
-      - const: sifive,fu540-c000
-      - const: sifive,fu540
+    oneOf:
+      - items:
+          - enum:
+              - sifive,hifive-unleashed-a00
+          - const: sifive,fu540-c000
+          - const: sifive,fu540
+
+      - items:
+          - enum:
+              - sifive,hifive-unmatched-a00
+          - const: sifive,fu740-c000
+          - const: sifive,fu740
 
 additionalProperties: true
 
-- 
2.7.4

