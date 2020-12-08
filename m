Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B96022D22AF
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Dec 2020 06:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbgLHE5q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Dec 2020 23:57:46 -0500
Received: from mail-bn8nam11on2062.outbound.protection.outlook.com ([40.107.236.62]:38624
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727482AbgLHE5p (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Dec 2020 23:57:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSu7An7+EZNncCUM4UXEmy6k015fCcXf4Bga8x2opiUmjtE5zAQqsmo1uzAYcSn1SykOtZDu6V/4gph4P5CvhxWT4GawXTgwNZgnGZQx7UMkok9V5ztDb8d5v3JrB4Pem6q+pw/F8SK/es8ocRa4Wu6WjcBsZ4MIPhyHBcScKp4BqCAaCnHeFOd5T34xwbh4H5fsx0Hi4y7UpM5W8eWRKxUREsFu1M2fwZYvLi7PmmCo6PSDHI7KOvc9V1rQTF7Z5JfmjusNvvgulyS6KFdcWhJhwG1frmukb3DCqz0T53pwQA2OK6nyJi8MawWcGncaG8JxRtgnvmLE+JD9kod2DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgYWRXqBgMEDCw9SV03rS27+og+9I8kVf/YXH7x1f4c=;
 b=WPZg3BiTd7rCFSoG69dqWuazH95Dy5UW763MxBxn5rYE1AY+nmwcEHrxpFKg35aplDZwGhalkDjcQbSqAdpuPjviLnODHVLqzVjJJh3luDsJ50dHnLHct2GwIMJg7mq/IIUCSTnv86zwC2MKmDmPjjEMp/35zdv+UDHmN7kx1RPbonygV+k8hkIigJgijq/McMriiLXQR2KCEZEbXYfSp1JVOYJ7CFFcxZpgJciQPT8JR7qj48HbdOJosQc+YuAmgt7dRlo7tvBKqw/ccTOkEoVGcl4QvUyX1tq+5Ebl6MDV9N3wC0d4/81q0NSIEPKi8Ny0L5T2zlD3IYkVODWPjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgYWRXqBgMEDCw9SV03rS27+og+9I8kVf/YXH7x1f4c=;
 b=TPJ/EPC1oP70bitZTTFg1E/+qUNwOhzWc94jQdhLnsl56E+OlttnYIDotq2UOs6V9VcGckaOdWnRu7wO5Zi5qZFujGKrrHA6XyWVFMie0thsfSR+e0FSdxqVrIXNjfS+dgFPnC2bPOHlylLf9VSzMSMtBYGVi4yrXj54VEgE+2w=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BY5PR13MB4440.namprd13.prod.outlook.com (2603:10b6:a03:1d2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7; Tue, 8 Dec
 2020 04:56:42 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%8]) with mapi id 15.20.3654.012; Tue, 8 Dec 2020
 04:56:42 +0000
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
Subject: [PATCH v2 6/9] dt-bindings: i2c: Update DT binding docs to support SiFive FU740 SoC
Date:   Tue,  8 Dec 2020 10:25:38 +0530
Message-Id: <1607403341-57214-7-git-send-email-yash.shah@sifive.com>
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
Received: from osubuntu003.open-silicon.com (159.117.144.156) by PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 04:56:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18b0065f-6a40-4d57-f670-08d89b35a802
X-MS-TrafficTypeDiagnostic: BY5PR13MB4440:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR13MB44403A7F05D24E6DCA01C2F582CD0@BY5PR13MB4440.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P74QYjTQx0AVIpp0dgFVqysthyMVBf1aNOINCXy7cZ9Wu6cosMr265khXCH0DCacIDo7wh0Qk77e/yPVkXqKVFAYFQjmfC7FeeP1/vUVS5tepGVU8wOqRiAApCml8RzPmD3iMSRJygmXvHDO6RxtiSayv0jUTHkCjENkOAw+5F1Mc21enTZXJOdX18pHzhRVxT83q3a5pCW9FPw3CjANQ6zj0ZutW6CDTN1RcvMZ3g3K1tA3OUXOsywawa+zJsIEtmGJUP3QayxOxgf7d2o3oJCkrloLcBBNOaah1ZSRbKAV0MW42v9Ut70w86jMKEKPksEBowDtor/9KS5EcrYQGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR13MB4453.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(396003)(376002)(39850400004)(366004)(136003)(346002)(52116002)(83170400001)(956004)(5660300002)(4326008)(107886003)(2616005)(26005)(2906002)(316002)(7416002)(42882007)(44832011)(83380400001)(16526019)(6506007)(8936002)(8676002)(36756003)(478600001)(6486002)(186003)(6512007)(66946007)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZTJrkiVd4a3VrDUecIF3bdL1eP/6VagUzc4qUrwvzUEc2kNBVii9N2dlSAgY?=
 =?us-ascii?Q?zhJ7hhVzNJovyvPuy/uZhxv/ZkiozG6o4MaGr9HvfViYJL4fU6CbStqF2zAO?=
 =?us-ascii?Q?mt4/ICUY+3tAIyDd+w9P9xocSflA0IieY2Xr5eG0gpCkwUd44Ay2GpQx5eG/?=
 =?us-ascii?Q?09SoZdMPwM69H5gn5wpW9ic9ooQg6q0JO2a3jX4tYqflY8a/wZBoLGxzJCsV?=
 =?us-ascii?Q?1zJlbeMRRzr/6fyj5L/peAlCtbpN/K6CmMyV0zWfIiGYCX0xbygB1bj6hj8G?=
 =?us-ascii?Q?9jgZnWoNFO+bVhZKMBfiECDc2drYHU0E5jhu9PnVKXALDQ7it4dt/rqY5K2P?=
 =?us-ascii?Q?cWFpalUfUqQf2GWq/yDldf81lHsM3qvOpYBByf2y/Cm4F1AOtShH3Pzuu55P?=
 =?us-ascii?Q?IWb/A+AbSdiNT0jJ1oLPpX9XkxSU0/Ex/a93CF7oW/0iLpVmg9f3ZZiXIHUC?=
 =?us-ascii?Q?vQ5ZnyuqKEIMJOiEXrhYOt4tXY2zZLvdx5BaiEwradOShOyEYWGfaQDevXTL?=
 =?us-ascii?Q?Y334Cu+gnHnbxO41Vnu1QPa5BR4ZhbRzDcJjX09xOYvfKvWNZX7BQKUhUCEv?=
 =?us-ascii?Q?xioYWPR/YvShAVX2TzWhQ29jloiEdlDq1yhH3h0pcVeTpXOS8+M9s5bAV9rz?=
 =?us-ascii?Q?iBT0d8JDVzR+ZCWTlq0XcyMknTi9J72tTgLu+b5zs3XtDylxwUUtWbFs8PuT?=
 =?us-ascii?Q?vBXy1d4fDBuF+SNeSuEkHfZQNwswsFYrlCt3hSPI0AYWFIzpxVcYSTNq63oB?=
 =?us-ascii?Q?KkkAhMqaQQ2nwp0YLQA2QYMr6QfBQr1ZZ4yYRSuiIPybWXfqZpwp12hNPX2A?=
 =?us-ascii?Q?p2Uec+Wrfqv6Ln9OSxd3wDZtPRG4UsWqa2rf2H5LJDnZLxOw4tfBtxT+4PKU?=
 =?us-ascii?Q?0Nsofn7BLLYd/CourdPjr/EGYol7cLgNNrfxZGd1ViMv0w74akb8csPFVDrJ?=
 =?us-ascii?Q?b0tYL94SBGHNTgvOT7FaO/JT9Xipp6zjUO3DIJToLdXSyrhmEHRRE7M0x67H?=
 =?us-ascii?Q?N7IM?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 04:56:42.5292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b0065f-6a40-4d57-f670-08d89b35a802
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dyPR5ZsRzA0x02e11Bq8BHx5GwHyogulrcz+vbAX6Kv3JWpyavSXABOY/CSljXTR/xXakQQcmslGS2o1LGVA4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB4440
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add new compatible strings to the DT binding documents to support SiFive
FU740-C000.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
index 6b25a80..a37c945 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
@@ -5,8 +5,12 @@ Required properties:
                     "aeroflexgaisler,i2cmst"
                     "sifive,fu540-c000-i2c", "sifive,i2c0"
                     For Opencore based I2C IP block reimplemented in
-                    FU540-C000 SoC. Please refer to sifive-blocks-ip-versioning.txt
-                    for additional details.
+                    FU540-C000 SoC.
+                    "sifive,fu740-c000-i2c", "sifive,i2c0"
+                    For Opencore based I2C IP block reimplemented in
+                    FU740-C000 SoC.
+                    Please refer to sifive-blocks-ip-versioning.txt for
+                    additional details.
 - reg             : bus address start and address range size of device
 - clocks          : handle to the controller clock; see the note below.
                     Mutually exclusive with opencores,ip-clock-frequency
-- 
2.7.4

