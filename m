Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 109312D22B4
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Dec 2020 06:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgLHE5u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Dec 2020 23:57:50 -0500
Received: from mail-mw2nam10on2078.outbound.protection.outlook.com ([40.107.94.78]:21740
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726112AbgLHE5u (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Dec 2020 23:57:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUPe1TS79ItImTVNP6GDplLL6WwkBM5kyL9YVOCLi7NQOe8kA8oTc+oiK6tFfEfm32wQWc9s2103jOkBzPC4Sz88wg6rBFwUEoXyZQzkBoNMBmUMOlrsL3MILWgQSojylj0BTlAJmLEbxGcOUOGV5Orpg/+1JTFlV+uyH3SCKdtbImck5QhXr0kerDDvuzvrEugx0pQZwTQ87Dal5rMhE3y3gB4nVRezYt4ak61buHkuYNCg5XsvRg/FT2G+jIImbs00kaC9sYi/1UwBcQQl9JPhEqnS0WASPYDV+6S2PJen/GHxtVyhO3Cj+P7Xoq3fwKMmHdFq4h1i2av3F6oLOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GI4Hp+SYriXjz1S4U3IUyCYdhdTMfntPQWW9NoN6NsY=;
 b=Pda7cuRskplXESewmNEgoyQMLEhfv5778QxQ/l37e8OfLOmD46JhCzB7vA95Ai0QlClbOGJ3Bf01MAQ/ZTNjrs9CQFRAh51zgNZpn6rNE/mJtr3M1nFihK2vYlec4nnoexmFASqfiHI24QW2JI/vU06GcaSqWkothcqo2M17yubLL02jR6k1xjBQXIextTgY81Cx/OZq76xPUCe/B/8tpfxyTw7fCTZzXpsyI+dK09DIa/MjvZiR855zc4bF6lERW1P0Sk+07oneCKnwVfAwPJYm7QTAtP8ExLuwXamhmsnCqLvdps6kB+aug/7pu7pVo2KqWx3gFsDGWbmHWi8WRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GI4Hp+SYriXjz1S4U3IUyCYdhdTMfntPQWW9NoN6NsY=;
 b=tAo8MG50HisTQVuE+884iCgTsHvDZEWn1m8TijrJecsELsd64aI7e1UW3S12XVJbipHxoa40UNBfDsM49Q4FLJoBZpFzxl6FTQREpIKX0jume8NJBb2G2sK7uT34MRO++vstZcD1+0OSAR3EvZTw8aY3Crhu1Omz46qccoHhV+s=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BY5PR13MB3745.namprd13.prod.outlook.com (2603:10b6:a03:22e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7; Tue, 8 Dec
 2020 04:56:22 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%8]) with mapi id 15.20.3654.012; Tue, 8 Dec 2020
 04:56:22 +0000
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
Subject: [PATCH v2 3/9] dt-bindings: pwm: Update DT binding docs to support SiFive FU740 SoC
Date:   Tue,  8 Dec 2020 10:25:35 +0530
Message-Id: <1607403341-57214-4-git-send-email-yash.shah@sifive.com>
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
Received: from osubuntu003.open-silicon.com (159.117.144.156) by PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 04:56:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afb66d2b-e3a0-4a0d-3bfc-08d89b359bed
X-MS-TrafficTypeDiagnostic: BY5PR13MB3745:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR13MB374571A9060CCF682105298B82CD0@BY5PR13MB3745.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m3ChsUj9Ued9GsL7Llnk6n51e3oNaaiIHLJXpDa2Pcsmc2+3hwV5skEeQnwz4DxbKgAh/D8ec/GuoyjidaynB4wJRiu1d/RcuMqKKhgzQmT1IZ146VHX+mm5xR4VF9G4bep0rnmFZW2+kYIwKQnI06/eqAy2hy+Ex/c4UbqD13kuPywcRW90N4eBxA/dK1ygFM9i2F0SRDfBR9PdofJnFfUJHbU8zpEvPpl6WDfksEPvV3u2boGskBrYslaW165Ok/1+xbd1pj8t+hEm9QKPCmRWLmNxfrrT6zuaxwU0C7VpOIUpmoDcu+zttKCLEvdVI0KVaihYNjwm4FUW40l1KA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR13MB4453.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(366004)(376002)(396003)(39850400004)(136003)(346002)(4326008)(6666004)(6506007)(956004)(16526019)(66556008)(66476007)(7416002)(42882007)(2616005)(6486002)(26005)(478600001)(186003)(316002)(44832011)(36756003)(8936002)(83380400001)(66946007)(6512007)(107886003)(5660300002)(83170400001)(2906002)(52116002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rdmSluNixmon9tGLXaEKCUw1TCj9XlXzEEmlwn8jFPjta0QxuONiEv4LlF49?=
 =?us-ascii?Q?TKv+Vvs/wPL/LJ5kcsLohtSTT/Pr2EWrjIDGbkfS4EKxMoufuDCAkPrKkhsY?=
 =?us-ascii?Q?ycXUAsu8dtHN/oQ3Qk2XiYiNDvpwyklHatNgg+Jr/IBRnP+yKQvCycMCrSZy?=
 =?us-ascii?Q?6UZDxGcuwpSFWdezR7xWEMjPVlDpaKqjIWu6+SNc9/WKfvTIw47y4yrWHURa?=
 =?us-ascii?Q?p+bI7QSQyrLoHyo8RonI91U2VpnW33lJYvZmhcHM9Y4Dy69gv0dMAtLM8W/D?=
 =?us-ascii?Q?75jwR76n4nPaeo3wIuotLEtq6wBVx5+eYJRpzGWdr0ROXIeTujDjr9M5Odhl?=
 =?us-ascii?Q?e1LFdu23hn1ObqtvmTO/0jZ123J2Nx5wr80QM4tqvPHzBnKdKUCLwECoD7DU?=
 =?us-ascii?Q?WRvz66nz5FQ22rGbE8fW+TqdsNe1LT79z9QjLL4s1iUvZI07q3fODkAEP2uD?=
 =?us-ascii?Q?we/GicbREevLRpttRgYBZZQH8R8zka4dgLQ8CR9auH8E9NmbNm1yu566pcH/?=
 =?us-ascii?Q?vXCJCXr6Na9zcswQxJ/PLRScj6V13JGBFP2jR7j2mCzh2hDxoqR6EHyAw5Wa?=
 =?us-ascii?Q?+VHihDj+81iMCaCzrH2C+/5vclWFd8i4iKn0uJIZA9Io9RZdsopnOj95O595?=
 =?us-ascii?Q?wL+M/KlMwjZvtUI0x8JhMtdp32AD0NDeevtfziThr/5FK060z7CuLsVSnwhm?=
 =?us-ascii?Q?VZ7fpuyuZaZCsheqOHlDzJu4WkxTNWZtNxml5t9PYEKyFm4VWfNi2fUOrMvj?=
 =?us-ascii?Q?rR677Ol0DDcFfzDdYTT11szQc/qF7Qa6SdaeZOByL+UeB5cdwBxBcN+6mRQ5?=
 =?us-ascii?Q?nQ/zD5ehNnYSeI+7laLgx5rtkTDsxlaUhTLZ6P6FDlolzyXmM87obqDDswak?=
 =?us-ascii?Q?ywVy2xAAtkICVm72GYKFbI+AmatVHU+jkOKEqI9supsVCnxefIOMOa+fvKIB?=
 =?us-ascii?Q?NBdctFS08i0bpQgj8l+yk0E6/1G9JXj8MqXvKOvMfU5nzYi3+XoCkLiFQZuv?=
 =?us-ascii?Q?Cfwf?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 04:56:22.2611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: afb66d2b-e3a0-4a0d-3bfc-08d89b359bed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhaIEuIwH/qSWeKkwzKVOA0GXaceUUUt7LTYtJKzflPPB//FOnAI4rcrMA9tLA7MnEhABxCEqNj4MPENA6zRig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB3745
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add new compatible strings to the DT binding documents to support SiFive
FU740-C000.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 Documentation/devicetree/bindings/pwm/pwm-sifive.yaml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

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
 
-- 
2.7.4

