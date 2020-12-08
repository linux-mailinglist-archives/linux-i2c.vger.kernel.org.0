Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD37C2D22A4
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Dec 2020 06:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgLHE5g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Dec 2020 23:57:36 -0500
Received: from mail-mw2nam10on2049.outbound.protection.outlook.com ([40.107.94.49]:57825
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726112AbgLHE5g (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Dec 2020 23:57:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpdnbhmNDjoqQezXpR79IAdSyNDa6OgK+Y7ViAtbKo9CPPQY2BF9Qh8R1tSC8rXwvyG6hxYWJhvnOmd8nJJQWH1G7XnXGMQIODR8bxLyOAKKnSAFlVaQ9/XDlIlkMSdIpdFcdvhWDojfxCZlFvCX3mTd9a54zQZMWBSGKf1b1bj+vLAlAFepoKE7xclbpZdFlYwdxhCiS2n2momGGfZBSEvrVx8ldnDiSHrVH5h5ZVrTUULWe/vfXteW/qQhGO+f2FBnEf2+11mUP4+DZqKM/oY5mxqvzU3mlpNSa3zVtT3MIYx0p5/FF6kOVwAhjRC4b7HZ303OFO6REl0EuNUntw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YT8eLUmpuBXxA3i6Z4k9G8dZ6vYdUAkZ022dEjqo2qE=;
 b=E8luRmEUgaUJ82qFYR9GRUTousf5rOtvojLulgKNQcazLNIxGHFNwddygzlajLcRRT/Dxk9mecskJ9ZuzeNsyiobVaKSV0dS1/fSsuH9Mp48ju4qE5uxJzZ9N+mPKEQJcS3ar0ieBWEgpbNuKIDHXADL+oXeZUsi+9WICT2nS4lTdnMf4GLPt0GpZWcnt3Yx0Dh7IRYYIsEFe03KbaYhb/vBxeW3q/HT2AfgshxvAa6hIk0ylxAWaLn5h+m9BxSqQWXhqzVZEMIW0F16sBPvHjRBOZ2HShSDd8d0Tt+S50CKHM7TgZpZlnyex1rYk8yjw12W3fa0Fr4xQm0NNSJ5eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YT8eLUmpuBXxA3i6Z4k9G8dZ6vYdUAkZ022dEjqo2qE=;
 b=P3iLOh7sA+shjNizb2A2U85+LhUCqk0B9Yis3zpoQhCu3gGLwJgFbP316fqijyravhIY7UhilMFSofPlaX+87I2r6L18FgsmaB1W4pvpi5p2sACCZqJYLPGU5m/SX2M6XAS+hPbAi66WQc/ZH9uwt8IF83CYjOqr1uLlWgoP+lo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BY5PR13MB3745.namprd13.prod.outlook.com (2603:10b6:a03:22e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7; Tue, 8 Dec
 2020 04:56:09 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%8]) with mapi id 15.20.3654.012; Tue, 8 Dec 2020
 04:56:09 +0000
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
Subject: [PATCH v2 1/9] dt-bindings: riscv: Update DT binding docs to support SiFive FU740 SoC
Date:   Tue,  8 Dec 2020 10:25:33 +0530
Message-Id: <1607403341-57214-2-git-send-email-yash.shah@sifive.com>
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
Received: from osubuntu003.open-silicon.com (159.117.144.156) by PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 04:56:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22037d76-f026-4bb3-9436-08d89b359410
X-MS-TrafficTypeDiagnostic: BY5PR13MB3745:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR13MB3745F49C25E5286C6AF1EECA82CD0@BY5PR13MB3745.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FXsDnO4Em7uLDSZv9R9uma84dDVMvUwO9m913ZO5SPW/gvpMWyAO9q/QDPBzcKkuZ86g8sixK+t5r+WAYiJUfhoAjZB7vEJnaEbIsk76T9KR90UFFHP51zuznq3wBXaB38bJaFhsxf81TtjM9f0e3jgv/dKTLK6Rt068x38FI2q8CQrtu+rhL92ugperkgBc2DoaNzJz5+awB3+odfiVmEUd4MnGdeuPNTMm/aVmE5r5vrR2UE4s9DW8WqZiqFHIKjAisQycynCbz4Z2/LsufymfdCsjvVjMOfS4xN76LqlXd332M52ffaO0WYLrzZfp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR13MB4453.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(366004)(376002)(396003)(39840400004)(136003)(346002)(4326008)(6666004)(6506007)(956004)(16526019)(66556008)(66476007)(7416002)(42882007)(2616005)(6486002)(4744005)(26005)(478600001)(186003)(316002)(44832011)(36756003)(8936002)(66946007)(6512007)(107886003)(5660300002)(83170400001)(2906002)(52116002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZpkPyUVYbX0FFcVUSakNlZuVvIy0gQ8n0WTwKIuWdX8X8PeU6t3Vb5wY0365?=
 =?us-ascii?Q?UV6H3KQtJFD9GhQyqxLZHuhq5T+fgIinRSQPOv9DIUElVZDWtz8wA/+DDDQk?=
 =?us-ascii?Q?CKR2zJXTwJAUiRIvs3ba+Pw2sSHLHgFAqXHxv8oy4JysLS0//X0m6rWnyeyR?=
 =?us-ascii?Q?QSI8UDy3AgYlFEFC3eODtNtZaQzBSO3h6Qkq4uuCnyou8H3pd78uAs0u93O/?=
 =?us-ascii?Q?ZnmQ2brt9DW37TPqFwbAJDf8pfal31S10TTtKPop1X6wGUkcBus/x6NedP7Z?=
 =?us-ascii?Q?FtRpmuyY9eTaEceotdE8T2/HMwChYo+/4ponQv44a1f+0EOuNhf0XHj3Z6ro?=
 =?us-ascii?Q?biJmQpfwSClCdla/Uq9R1JJU6EnPSUw/pXJVxPoV/ZsJCSrhyJEZ7HTE34xW?=
 =?us-ascii?Q?oSkxgbyEvdOWvGnVyV3kt/BcoByUNjhF02r9KchDgKyN1QaN5vRH0of8/iJl?=
 =?us-ascii?Q?uz8f3Efac5cg5W7trUpQxknZFy4yYHnO7/75RtACKr3pgO50Tm88UjgDaFHY?=
 =?us-ascii?Q?geTZcH3Fd/DvioGikYwgQrgqy0BZOBmUVYUFtG9FhaBLlkHcPrPH9id9DJBB?=
 =?us-ascii?Q?a1s/LPKTXQ+U4tDQK4Hi2n+xnJa3nwuliGibfKUpzWGOzqi3OIkblWzqRoil?=
 =?us-ascii?Q?7odIPJ69ILdmIkhrEVdYrvhOLGo6d1VMwHPBj7yUhcHVobUq2bONk5CVDGaG?=
 =?us-ascii?Q?Y9vYlwPObMztVVFUo5y+IrXBLZ55cEnF4HrTSD0uqxWTLIyypMxlhtdISB0Q?=
 =?us-ascii?Q?5JKcN2xEsJmAy/M17v1W/mbTIF4NWogQjBZWfN42FeFDtyePMqcDel+UoeUU?=
 =?us-ascii?Q?6+o62ae4eJrl3eG36XtwjBnfLyPk4cKmE9labWMOeMwVY0L9UxPmAs9pjdzR?=
 =?us-ascii?Q?o6FZkhOCEmXZGFozy4ChAkutE9fXjwaiS+pKGifKqcCx97UBI4Kijt5lyO4w?=
 =?us-ascii?Q?dQjd63E6Jrz2AQNWgWq+lXFCCi8lOGG4VaCi/4FVqBMDH61HVPeaqZTs89/S?=
 =?us-ascii?Q?2+29?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 04:56:09.1108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: 22037d76-f026-4bb3-9436-08d89b359410
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGrUb+vnO6HdWuYfbVZlT2wEPK2ssj22AyQ02gF7Ekp1AAMKlkW3wQ+/Ovsizagx1tYClFW9qK1cxbrwZYgODQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB3745
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add new compatible strings in cpus.yaml to support the E71 and U74 CPU
cores ("harts") that are present on FU740-C000 SoC.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

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
-- 
2.7.4

