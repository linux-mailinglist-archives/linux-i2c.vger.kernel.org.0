Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4459D2CB648
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 09:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387808AbgLBIF5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 03:05:57 -0500
Received: from mail-eopbgr770054.outbound.protection.outlook.com ([40.107.77.54]:53377
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387747AbgLBIFz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 03:05:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aW0JAhfL4M0nGpWE7HP12r5RrpnUYKPokHV6+3oFdehG59UMua8mUHCi3JXy2mfep0PX9W3FvepLtyBR+khywMDDFAly8KD9dXce9TzU90XlcjpLBaxgipF0UkpVmshEdzvIk2PeVrVnhzRs33Dne04hLW9tgHR5VWxcTYFFnLd8qY+KQi6n0OILE9Z9ZEN07rU4UmWOOYwptdUmU+alLWcXfnjRGe0HhSjyLWT3VUz1TYOjuH17Kg0Wn4gntkDeD50ZQWm+l0DpEbMUc/p2lc3BgYU77LoU5CPlL9kyvinDcFH4VRzFWYGgpEwR4UJ6ZOY8+YA1WOxKWFZCkcVvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXeNfZTJwTQH4URh7Z09c8XBBl3wTwyVUsnPEBEg/I8=;
 b=IMnBuOkk4CgQvmjw0bhZ0tIk5unbpiE988oyX7yVDShFUep6QLxDHgk4SA+v3KfWvrK7JlLKFBGnAMdSCY0hzh65Vhdz+0I7XwA2JoPnYoT4A/4WHmXciAcnBIoeI96t3xYHv3Ua353s3oIU5vFOpFtFGHMXwLVSPfYcupCDNiM5WfHvYqjxLfbr7wXXKyvKfKbgsQEe+9tWMwyIJCvsnS2baPSd2vVmjE2lrAF/9oPBjGRC50E94bFl2JzidIRu4K+vjuCWPeofeUGHyJfJXMDsl3Bi0wJd5AmZwlUaTjT75l5OIjrfjBCy7G7WPMhn7+ulhlnvaeMGZZGA1wovZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXeNfZTJwTQH4URh7Z09c8XBBl3wTwyVUsnPEBEg/I8=;
 b=QDLUBMzXZdWL4HCKo0gls2oWjLP7whKSDayD+Yxfb7JL5Va/dX3HLEmAQNrJWrzbDd+bdWQHRZm38QFrQKYUDBELdx7pFiXugAEiMgV+IzOiNIXRrhb0TVzcGagW3rBYF7tmo1ukdYTSauRUkypveWxVNDN/0gc5Gaf4FtbagbU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from CH2PR13MB4458.namprd13.prod.outlook.com (2603:10b6:610:6c::22)
 by CH2PR13MB3543.namprd13.prod.outlook.com (2603:10b6:610:2b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.6; Wed, 2 Dec
 2020 08:04:41 +0000
Received: from CH2PR13MB4458.namprd13.prod.outlook.com
 ([fe80::bdcd:2c1b:bf81:515c]) by CH2PR13MB4458.namprd13.prod.outlook.com
 ([fe80::bdcd:2c1b:bf81:515c%7]) with mapi id 15.20.3632.006; Wed, 2 Dec 2020
 08:04:41 +0000
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
Subject: [PATCH 3/4] dt-bindings: riscv: Update YAML doc to support SiFive HiFive Unmatched board
Date:   Wed,  2 Dec 2020 13:33:55 +0530
Message-Id: <1606896236-62780-4-git-send-email-yash.shah@sifive.com>
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
Received: from osubuntu003.open-silicon.com (159.117.144.156) by BMXPR01CA0018.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 08:04:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27cebd0c-b2bf-49e3-95c1-08d89698ec6a
X-MS-TrafficTypeDiagnostic: CH2PR13MB3543:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR13MB3543D09808E3A77B9CAD480F82F30@CH2PR13MB3543.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PKiVw+5WpYF83zn91bOgBs3PYi6StLr1l0Qorgea/TgCBjeDPFy6c1veZMYQikqsyNHMJcpU8gyB0AsRO/y5J/M/Zj07Wund4fJkX8nTI+IS6iez2/9d4/MvlVAFMQGFcgOCLIfdPjEvoDnLqPOl1YD2UpG6D68fjr3R2ga8fanPuRgUk4dbQ34aygv+FehizpBwV5Qyv64Lr5mNOnK20R9rdzfUcFLHt+phZK4imX8OCUGcLWnFGVtNw/IXuduqtMowDAuk07LdJYe49WmY60Fff9R3q8xmqT8MvSBv8BnZ/IMXAjp8bWTLY834ie+oo5tZyChVEQnvz+WMoPgTIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR13MB4458.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(366004)(136003)(396003)(39850400004)(346002)(376002)(83170400001)(36756003)(42882007)(66476007)(316002)(66556008)(83380400001)(2906002)(4326008)(956004)(2616005)(26005)(44832011)(5660300002)(7416002)(52116002)(478600001)(107886003)(66946007)(16526019)(8936002)(6512007)(6666004)(6506007)(186003)(6486002)(4744005)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BLeVorC7cRz2TZo9p7ZDPJFy/pPJj3pyqvbaKWueF5BsmLtfZ52WWHiTdg3H?=
 =?us-ascii?Q?CBPYtPtFet4/Mg6qcSeBg2RPYQQRnL35HOXBUSDiqRhKdlegJTiyUQE2Qfj1?=
 =?us-ascii?Q?ZuIehB/eSewGsD+T3e58/3TSrJIqF76RSsf5JbZycO/Y2S8VYaM2oOxczMNm?=
 =?us-ascii?Q?wBOdW7ZpcLMxSE5ixcHEYahBEc+LSlzsGZPa3kAzPOybM34hUMEBFFgP4Fu8?=
 =?us-ascii?Q?uRp5O+5Pa9Xrc6sChpnZ0hdwGQR0FCKGsDICLDmHuVptg+UwI7ik2JXmU5MU?=
 =?us-ascii?Q?eIRIdEIxDqoj+ygZpYaWuFbKugWY6xdGqLSnLG121bg6oyeuxthKIBhbGBMC?=
 =?us-ascii?Q?cKxO5LQFZ8SrQduyHUMu/kz/XbJ99D8hBFKwuwG9u7uL+Ic8Ph1XdZxyiwLD?=
 =?us-ascii?Q?tLqRxVZNxeXz+bpSW7pSg6d/ltqNCrfNO2dnhf5Cne7EVoaLHHNvBlsgNZfb?=
 =?us-ascii?Q?wu9J3Vj+RnC3zeAv3spjTeb0WHn46rcq54uhSbf46JXZeDjF2TNEDlvZADg9?=
 =?us-ascii?Q?QSjCBxbmpQ1lWrtIhQpEw9+f51owd9Ob7FOGZx4PghMJ0W4s8qeXZIlCYmCl?=
 =?us-ascii?Q?NkcZ25VDls8nxKKvtGHuoo9lkgllHLFwWMPPUIWEczym+gWetH6bPebIdU7o?=
 =?us-ascii?Q?O79ldERjFhxwbv3sJj2ta6feWHPLkbCKPtm+oHOxXEQFvM+TlD2eTlAvS2nA?=
 =?us-ascii?Q?3PHl3J3GMy4UCKizXNgGmBiGll7MpO1ZiKR42+hiG+mTmeZDkm6Lv8+5W7mf?=
 =?us-ascii?Q?xL8cqwOuIJm6fvoktWoHkjVRMUbo42wtJ1BrjeDlgutEx5LBWBeYt3Dz0nfm?=
 =?us-ascii?Q?rP9Dl4i8AVeDHL+/hA9NRSaxruxtvP29IMvBrBBwUKbHKspITf+X9nbHfQp7?=
 =?us-ascii?Q?UASdt2Hr5G0ypth5V3FbyfYlSp921ZLpXkiSP+prigV83WwBAsPBQj6oai9O?=
 =?us-ascii?Q?9kh+bqiqpC38vK2kz480gFWzWYyP3Rv+d4eAwpb5vC73iAaJmlLaLztoxGP6?=
 =?us-ascii?Q?vYYq?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: CH2PR13MB4458.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 08:04:41.7254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cebd0c-b2bf-49e3-95c1-08d89698ec6a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yh8EjmjbbkCD8iioVYA15/FZ+rO0e4mE3DSBNwl6OtBYFF2t/c7yzIpeqmlAmDQJsMGnBXxWt1nZ3sI+TyC78A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3543
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

