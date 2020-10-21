Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9464294F0E
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Oct 2020 16:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443611AbgJUOu3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Oct 2020 10:50:29 -0400
Received: from mail-eopbgr760083.outbound.protection.outlook.com ([40.107.76.83]:40190
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2443348AbgJUOu2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 21 Oct 2020 10:50:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuevKARKtZVUUjpDbm4xdtieex/sb0vmqpor/nmrj4R9z91fmIM0mHs6CHlMYSraqJi7ou8/TOpA7vVlzdq/vAUSU+qaMoIGhWvz7ZnAvHmakUlOjgE2pZJXH9CMFS8iUEMqZ/xjVkT9ihRYDaMOWUTf6xL7Zn33IreNsTLm1Tl542mQfjYNGxC6yovkP/3DCv4rbsYfSoA/0RL1r93tCuxGTpz94AQdC9BlGdYDi1/CiXzMMi7hvLiPqNHdCUWhCD9jEDaWrHQJJ4QCmcfMoDqwryWO/piZPAF+Ok3+Qwk9Fx3uXNV2quxd2c4m7yJA8mwdELzBF/8IFuOZrV9NaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLDl72pxeDbuq2rzrfTDFCpgTH6hWyj9J+3c7mUzFd4=;
 b=fl8H7/ZoEllIxMkcKyyGq4A6GEBp3I8byNWvU5qhkjKjQC7Ek1c7gsv9dyHzjK55qze7pQIHpNj+qjSO1krSPbM2PrUZTqT2OK0ScjAw0CEWekBN+WdN6e7ifA6rPemRbtSyT1cxnxVlhgEuayCsgSYYwLuKlF75RBZpmdmcPSKxRzJpVx1m8AbL9hz9uOPqUqJvr0HLYFP9AycXAINGpTwZBmdzlds/H5DutR0vOlW2E4ceo237vG0Zhmkj64e95FYHDuKRHLFwVxkcSBdXDisDUllbi7Qv5A2dGUyGqJkexf1zZfjoNBnAeQG4sFDOIKCmmjBANLk6dQ2QOXSjXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLDl72pxeDbuq2rzrfTDFCpgTH6hWyj9J+3c7mUzFd4=;
 b=s+ZTN1qy7bm+d05lHHxf54byp1LWGPME/uW0k4zw/HsM0BQSDXl58JnN1XBe7Gfg3tCu0Se6gZMS/7NdHJC3VI8dDH4U9j2lVa7iYkKLpt7PY5k/1H3lQGP6eES2C7AZfvcPptQqHnyknOSuyDD4oAelQHhhQD/RI6m8odRGTkM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM5PR13MB1244.namprd13.prod.outlook.com (2603:10b6:3:2e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.8; Wed, 21 Oct
 2020 14:50:26 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f49f:d6d6:4c97:e5d5]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f49f:d6d6:4c97:e5d5%7]) with mapi id 15.20.3499.017; Wed, 21 Oct 2020
 14:50:26 +0000
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
        peter@korsgaard.com, andrew@lunn.ch, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu,
        Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: [PATCH v4 1/1] i2c: ocores: fix polling mode workaround on FU540-C000 SoC
Date:   Wed, 21 Oct 2020 07:50:14 -0700
Message-Id: <1603291814-240377-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603291814-240377-1-git-send-email-sagar.kadam@sifive.com>
References: <1603291814-240377-1-git-send-email-sagar.kadam@sifive.com>
Content-Type: text/plain
X-Originating-IP: [64.62.193.194]
X-ClientProxiedBy: BYAPR21CA0008.namprd21.prod.outlook.com
 (2603:10b6:a03:114::18) To DM6PR13MB3451.namprd13.prod.outlook.com
 (2603:10b6:5:1c3::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gamma15.internal.sifive.com (64.62.193.194) by BYAPR21CA0008.namprd21.prod.outlook.com (2603:10b6:a03:114::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.17 via Frontend Transport; Wed, 21 Oct 2020 14:50:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7271fa4d-42c8-46c5-a3c8-08d875d0a524
X-MS-TrafficTypeDiagnostic: DM5PR13MB1244:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR13MB124452FF48A2A2FB6F3A0544971C0@DM5PR13MB1244.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uAVgOlT/UjwHC0QFJN2HXo4f4Eyd0l2crJCa0aAv159S/SfEBD7L85WYBnf1TUT15aO0nM4PKv3ToGCW4Q8UEtbYVe+YLCr7bdDngch+Kxrrg9Xo98+J06d5rOM+vL6YDOAIp0azPuk6DB04HlH/T2c9uMKjE4ZQoziR0sQ+X7G80LKlSt7fQNJZ7AdPU1IOIFM8feYCDDR7DQcKLCdNlac7faj6LdrfxyqHgU9LX8LvPEm/JCg2IkX4nvCRi12WOvz0k9j9E5ZmwU3m3l55228m7Y8YTeW+V7A0/eG199UaC/zrRoG4x+FEmUmHYj27
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR13MB3451.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(39840400004)(136003)(396003)(346002)(83170400001)(66556008)(66476007)(5660300002)(66946007)(83380400001)(6916009)(4326008)(186003)(16526019)(107886003)(6666004)(26005)(8676002)(36756003)(478600001)(52116002)(6486002)(2616005)(7696005)(316002)(8936002)(956004)(42882007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: kHXfT95BQiZZEqBSEcyU0JweuIVzKLu0tEeuOZ2oqopAAdaaHGeH0CYmpuz29AOGInwTkebzTQlo9ijuJhKwvQbdoXwUDJrARDHKW7qn0WS3TUhVWyTmL8QfnHExZq5VjMpsE2QmmQMtwoQW9snVMObl9YuS4wAd99l72BAED2o/oVQNFBTh+40aSQBN2pbVgNRYJ7ojeLcqlHEzUq3aPtT04G4epkN8Zm6jZU7QDyNMy+tSf8QS0JTWFldJMjh5CMVcMXNVNEZoblk5OuUr040vnXRy7QxlKyC6HLA34/CN2k1Bcgh/Jgk75Ewr/XhSVxFcKeVpenieljKfPPcuKxFlWIHs3GC2wFsNJ3zJDmDzqCkyhxa5N2z8+CUsDCnAgOZ1ejrmdpVbaTG6Z0e1TFlH1Bkn9xh8PA8M82Pw/fCpk/4ZmPAizRlKvi6jCUTOZ3hVVwP0q+TDJRogoLwMULh6nIfm8d9DRiGZEB6vSyB7GTIZaxyePQEgMDpiVsU3UBprT/VMVn8dttQOo3g6Vz42HEAQC4ohTWMEplTkRZJZ8A6hRXE2LL/1IlTydDSSfdKvrxP6gLMYjrcjUjmopYEdZlDL78m+8NbXootPFVxZEm4cam8KhH2WDWfZB001Ikyat6aNOFgrJJPtPdwAVQ==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7271fa4d-42c8-46c5-a3c8-08d875d0a524
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 14:50:25.8763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6k0wbpnAOVBX7seGmH74hvL5h5WLXH7id9sCJlrVvPKTJZMnlhpoWH4hM8qbGaE/PEJb9IVyqupHg+6hclCgJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1244
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The FU540-C000 has a broken IRQ and support was added earlier
so that it will operate in polling mode, but seems to work only
in case interrupts property is missing from the i2c0 dt-node.
This should not be the case and the driver should handle polling
mode with the interrupt property present in i2c0 node of the
device tree.
So check if it's the FU540-C000 soc and enable polling mode master
xfers, as the IRQ for this chip is broken.

Fixes commit c45d4ba86731 ("i2c: ocores: add polling mode workaround
for Sifive FU540-C000 SoC")

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/i2c/busses/i2c-ocores.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index f5fc75b..a97cbaa 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -83,7 +83,6 @@ struct ocores_i2c {
 
 #define TYPE_OCORES		0
 #define TYPE_GRLIB		1
-#define TYPE_SIFIVE_REV0	2
 
 #define OCORES_FLAG_BROKEN_IRQ BIT(1) /* Broken IRQ for FU540-C000 SoC */
 
@@ -476,11 +475,9 @@ static const struct of_device_id ocores_i2c_match[] = {
 	},
 	{
 		.compatible = "sifive,fu540-c000-i2c",
-		.data = (void *)TYPE_SIFIVE_REV0,
 	},
 	{
 		.compatible = "sifive,i2c0",
-		.data = (void *)TYPE_SIFIVE_REV0,
 	},
 	{},
 };
@@ -606,7 +603,6 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 {
 	struct ocores_i2c *i2c;
 	struct ocores_i2c_platform_data *pdata;
-	const struct of_device_id *match;
 	struct resource *res;
 	int irq;
 	int ret;
@@ -687,16 +683,19 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 	init_waitqueue_head(&i2c->wait);
 
 	irq = platform_get_irq(pdev, 0);
+	/*
+	 * Since the SoC does have an interrupt, its DT has an interrupt
+	 * property - But this should be bypassed as the IRQ logic in this
+	 * SoC is broken.
+	 */
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "sifive,fu540-c000-i2c")) {
+		i2c->flags |= OCORES_FLAG_BROKEN_IRQ;
+		irq = -ENXIO;
+	}
+
 	if (irq == -ENXIO) {
 		ocores_algorithm.master_xfer = ocores_xfer_polling;
-
-		/*
-		 * Set in OCORES_FLAG_BROKEN_IRQ to enable workaround for
-		 * FU540-C000 SoC in polling mode.
-		 */
-		match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
-		if (match && (long)match->data == TYPE_SIFIVE_REV0)
-			i2c->flags |= OCORES_FLAG_BROKEN_IRQ;
 	} else {
 		if (irq < 0)
 			return irq;
-- 
2.7.4

