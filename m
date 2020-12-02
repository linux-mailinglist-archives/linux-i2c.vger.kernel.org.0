Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A94832CB640
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 09:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387786AbgLBIFy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 03:05:54 -0500
Received: from mail-bn7nam10on2068.outbound.protection.outlook.com ([40.107.92.68]:64224
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387539AbgLBIFx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 03:05:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEz5LPDCiFV/KzO00l0+0QYTZHUKR+UJsmpiS4WE+rZifJ2vcslBzg3kzSyjkYgsSaG2TExVa+GXA11I3f0vSrBaKwViYHcpiRFq8QTBheZnpr20ciYLrMvd7X4Vzr34zJeWoKWrg/5S7E04LSbj1lvZ6DqYJZS6RwtQScGliFg/x7bck18aQNEUrhjTgHpU8nvFIzcnQ8IDodni1pT6wUJeny5rLcrLfKlv3wSudTUXBbZU7DM1s5LuX524VZKMfZ3DQQpqNkupaqZdDluDYLe08bYpykVo+MIuNwwFcwnQ6ruLlzia58jz8w6rSFfcjul5Yot95Wmzfl4HzOpejA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUuopZSpuIpELtSlAn3QG/oLGT6c9pMMq2EZHybsogw=;
 b=U3kGqgxntBEJ5kw+TiO1FV5CUtqkXRfmoVGUsLs19d+7sQs085TlYE8nm3u8SHIUS/0JzIBRR+akIkgHHFcAb4OlvmwP6imkw/Id9zWR8Q+Jtc3Yy9l0PzfGFthri29HG3uHRbvP3tYwNQ0A/HEGGsp2f4WMj192kM7LehYeiwCCpUMuAlnz678h8xHKV9582RjN1dREt/0UuCLX24tJZN9dWqNW7BOAIUd58jpygiylnYJiLbJKoI0ob0GTcNbv2sFdughfseUMn8IslrjM8iWWqlPpiVgkLpMKmdSieutkjxh59edqm0Mths7RLHABAM2sr1F9AFhQfvQZ/gCvZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUuopZSpuIpELtSlAn3QG/oLGT6c9pMMq2EZHybsogw=;
 b=Y90KOZbAcqiY3vWKATXc+LINLX7Q6U9mkzZlgfopLNUbraB67PU/WU+FF9IMLe7J/dq8Od9+GRZDCKx9outkINn8Y0xKIKhgQHMEUaZffcafb/F0dk3Hr6zJFniWe3DiOctRUc3BjyD8KT4VIFFXlW+OnZz/UZenR9yYpmZ9L4M=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from CH2PR13MB4458.namprd13.prod.outlook.com (2603:10b6:610:6c::22)
 by CH2PR13MB3543.namprd13.prod.outlook.com (2603:10b6:610:2b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.6; Wed, 2 Dec
 2020 08:04:28 +0000
Received: from CH2PR13MB4458.namprd13.prod.outlook.com
 ([fe80::bdcd:2c1b:bf81:515c]) by CH2PR13MB4458.namprd13.prod.outlook.com
 ([fe80::bdcd:2c1b:bf81:515c%7]) with mapi id 15.20.3632.006; Wed, 2 Dec 2020
 08:04:28 +0000
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
        linus.walleij@linaro.org, sachin.ghadi@sifive.com,
        Yash Shah <yash.shah@sifive.com>
Subject: [PATCH 1/4] dt-bindings: riscv: Update DT binding docs to support SiFive FU740 SoC
Date:   Wed,  2 Dec 2020 13:33:53 +0530
Message-Id: <1606896236-62780-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606896236-62780-1-git-send-email-yash.shah@sifive.com>
References: <1606896236-62780-1-git-send-email-yash.shah@sifive.com>
Content-Type: text/plain
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: BMXPR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::28) To CH2PR13MB4458.namprd13.prod.outlook.com
 (2603:10b6:610:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by BMXPR01CA0018.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 08:04:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef36eaf5-70ec-42c4-7c58-08d89698e42b
X-MS-TrafficTypeDiagnostic: CH2PR13MB3543:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR13MB3543F79251536C24D39AB0A782F30@CH2PR13MB3543.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zucpgp7X9QBbPDeaL7XF4RFXAZH/NBoTtKMAXcBotSScqS2ta2lFgZbLsWvca29D15sY4acJy7DuYT/+3424eyrXJC7jBwkzsE8iDq7HgqT3T3KQL3SA1L21hDkNUTrsV2SSL1Yei/9bIbvCKA1HnycV709CsufJh4LC8OWvtkvDuF0W/TZeP7vf7NPccTkphxSGGJBRl96xp3srMvf53t7l1A0sgBUSkkNlpP708dcgG2n6D8eLBmj7MI7+HMHvxz2UkLV1IEEZtKLn8XZ0F9co3qXCublQ4OkpsWcmoMuN2A3Y8lXJQavde/R92HH80k4/QgpQf/MirkI15ItPFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR13MB4458.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(366004)(136003)(396003)(39850400004)(346002)(376002)(83170400001)(36756003)(42882007)(66476007)(316002)(66556008)(83380400001)(2906002)(4326008)(956004)(2616005)(26005)(44832011)(5660300002)(7416002)(52116002)(478600001)(107886003)(66946007)(16526019)(8936002)(6512007)(6666004)(6506007)(186003)(6486002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?W2gvtJmukPp7Xm0fFJJCBqhWE3kgBUCOhu2Ihxjdc/KYtdcN5tGoQQKwXxI9?=
 =?us-ascii?Q?OZBAkFgGFWF8w4ghjKNJvQ+P0eVNjQA2Gsoe7YgXlv1vFqCfGMImK9kWfhBa?=
 =?us-ascii?Q?pSYcHSqm7i+rz7pt5rE1LIgyvRnV8KFPpwLZeX0UWASJMm+HM2yW6KYbOewJ?=
 =?us-ascii?Q?RyACY50H5OU6YCo5QT78FPrAjKjHplYaN79jVFTZzqfzhB1gk2mjoRIEdeYm?=
 =?us-ascii?Q?qlraZbxQq2miEBM91wv1C/2Ehg5Q83MyMnlI8Mm3QMXmGgKFzUuwqhR+bT3r?=
 =?us-ascii?Q?xaHLrw0VZjDbTbcJg7wM7JQr08ibDbA8g4901nlGxx5iJzoVP/ISYLBBm/iD?=
 =?us-ascii?Q?F7NF3DvREr6YAMDc5eMviyFdoVQhA1tgXOq4vsXsNytgX8QwCuHCojB9XyOD?=
 =?us-ascii?Q?AcoZTiPMRCtd5TKCngpiS64Iexk5qoVVosxma8nc66n3TrBc9BtpOc5tPyaR?=
 =?us-ascii?Q?fHFlCJN2QnaiH0aGBODaPEI8rCAES10xueiTG3GpcYT8djOGWdad1+OrKi5M?=
 =?us-ascii?Q?CnbeUVMzGClIBpBKAYA9yIHq/TbcrXcx83jRrjOlci9trQZ2VYb375UMfLIV?=
 =?us-ascii?Q?rPmZpx5s2ZfHO7xTl61odHeEK7Lp1WLwikKMf6GIx24rtj1J49FLpfNpNlBN?=
 =?us-ascii?Q?08iPjkjZuhr42mN/Ux0Y5hj//BUBYJtQmvhPZ0dM+tGMATCLWXUTZmLwRRiT?=
 =?us-ascii?Q?S4J+wR/f0sKGnVJ+EalkLoj/YYvhJ2BfsBgkAD/a+BNT4uWKxwuCSrnD+QOq?=
 =?us-ascii?Q?wnM1EG4Z82CinTqeKUijKALPtm5K4rbxVblbfhQz8mJM1YN1s8fjt9KGkRM4?=
 =?us-ascii?Q?Uwxvcb931mVD5FcE/483lvE/TxzvkO+fcFH4WroJFe33rcyfbV4DNQwMm8BE?=
 =?us-ascii?Q?yt7ia4iXubqW+i0f9fBrfadz4yh2N6jlIE2vO9rNqsHGneyzW8bUMxpWtX6e?=
 =?us-ascii?Q?tIgMAnzYqtWWh13tEsluNVmqY93qf/bwLZ75QgheSK9b/FNpNIxhqNAaGPQD?=
 =?us-ascii?Q?tPp1?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: CH2PR13MB4458.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 08:04:27.9090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: ef36eaf5-70ec-42c4-7c58-08d89698e42b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CN0ksEpp/I4fWSR1HL5SL+unqNzA43An8K9+ri3u+fZCXBO+ZYouCGj+Vle6AT2naNkidvqTWhOQujqvkVStMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3543
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add new compatible strings to the DT binding documents to support SiFive
FU740-C000. Also, add new compatible strings in cpus.yaml to support the
E71 and U74 CPU cores ("harts") that are present on FU740-C000 SoC.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 Documentation/devicetree/bindings/gpio/sifive,gpio.yaml     |  4 +++-
 Documentation/devicetree/bindings/i2c/i2c-ocores.txt        |  6 ++++--
 Documentation/devicetree/bindings/pwm/pwm-sifive.yaml       |  9 ++++++---
 Documentation/devicetree/bindings/riscv/cpus.yaml           |  6 ++++++
 Documentation/devicetree/bindings/serial/sifive-serial.yaml |  4 +++-
 Documentation/devicetree/bindings/spi/spi-sifive.yaml       | 10 ++++++----
 6 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index a0efd8d..ab22056 100644
--- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
@@ -13,7 +13,9 @@ maintainers:
 properties:
   compatible:
     items:
-      - const: sifive,fu540-c000-gpio
+      - enum:
+          - sifive,fu540-c000-gpio
+          - sifive,fu740-c000-gpio
       - const: sifive,gpio0
 
   reg:
diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
index 6b25a80..1966b2c 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
@@ -3,9 +3,11 @@ Device tree configuration for i2c-ocores
 Required properties:
 - compatible      : "opencores,i2c-ocores"
                     "aeroflexgaisler,i2cmst"
-                    "sifive,fu540-c000-i2c", "sifive,i2c0"
+                    "sifive,<chip>-i2c", "sifive,i2c0"
                     For Opencore based I2C IP block reimplemented in
-                    FU540-C000 SoC. Please refer to sifive-blocks-ip-versioning.txt
+                    SiFive SoC. Supported compatible strings are:
+                    "sifive,fu540-c000-i2c" and "sifive,fu740-c000-i2c"
+                    Please refer to sifive-blocks-ip-versioning.txt
                     for additional details.
 - reg             : bus address start and address range size of device
 - clocks          : handle to the controller clock; see the note below.
diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
index 5ac2527..84e6691 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
@@ -25,12 +25,15 @@ description:
 properties:
   compatible:
     items:
-      - const: sifive,fu540-c000-pwm
+      - enum:
+          - sifive,fu540-c000-pwm
+          - sifive,fu740-c000-pwm
       - const: sifive,pwm0
     description:
       Should be "sifive,<chip>-pwm" and "sifive,pwm<version>". Supported
-      compatible strings are "sifive,fu540-c000-pwm" for the SiFive PWM v0
-      as integrated onto the SiFive FU540 chip, and "sifive,pwm0" for the
+      compatible strings are "sifive,fu540-c000-pwm" and
+      "sifive,fu740-c000-pwm" for the SiFive PWM v0 as integrated onto the
+      SiFive FU540 and FU740 chip respectively, and "sifive,pwm0" for the
       SiFive PWM v0 IP block with no chip integration tweaks.
       Please refer to sifive-blocks-ip-versioning.txt for details.
 
diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index c6925e0..eb6843f 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -28,11 +28,17 @@ properties:
       - items:
           - enum:
               - sifive,rocket0
+              - sifive,bullet0
               - sifive,e5
+              - sifive,e7
               - sifive,e51
+              - sifive,e71
               - sifive,u54-mc
+              - sifive,u74-mc
               - sifive,u54
+              - sifive,u74
               - sifive,u5
+              - sifive,u7
           - const: riscv
       - const: riscv    # Simulator only
     description:
diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.yaml b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
index 92283f6..3ac5c7f 100644
--- a/Documentation/devicetree/bindings/serial/sifive-serial.yaml
+++ b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
@@ -17,7 +17,9 @@ allOf:
 properties:
   compatible:
     items:
-      - const: sifive,fu540-c000-uart
+      - enum:
+          - sifive,fu540-c000-uart
+          - sifive,fu740-c000-uart
       - const: sifive,uart0
 
     description:
diff --git a/Documentation/devicetree/bindings/spi/spi-sifive.yaml b/Documentation/devicetree/bindings/spi/spi-sifive.yaml
index 56dcf1d..6e7e394 100644
--- a/Documentation/devicetree/bindings/spi/spi-sifive.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-sifive.yaml
@@ -17,15 +17,17 @@ allOf:
 properties:
   compatible:
     items:
-      - const: sifive,fu540-c000-spi
+      - enum:
+          - sifive,fu540-c000-spi
+          - sifive,fu740-c000-spi
       - const: sifive,spi0
 
     description:
       Should be "sifive,<chip>-spi" and "sifive,spi<version>".
       Supported compatible strings are -
-      "sifive,fu540-c000-spi" for the SiFive SPI v0 as integrated
-      onto the SiFive FU540 chip, and "sifive,spi0" for the SiFive
-      SPI v0 IP block with no chip integration tweaks.
+      "sifive,fu540-c000-spi" and "sifive,fu740-c000-spi" for the SiFive SPI v0
+      as integrated onto the SiFive FU540 and FU740 chip resp, and "sifive,spi0"
+      for the SiFive SPI v0 IP block with no chip integration tweaks.
       Please refer to sifive-blocks-ip-versioning.txt for details
 
       SPI RTL that corresponds to the IP block version numbers can be found here -
-- 
2.7.4

