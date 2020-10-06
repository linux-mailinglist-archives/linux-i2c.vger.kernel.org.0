Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 538A428513A
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Oct 2020 19:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726745AbgJFRxx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Oct 2020 13:53:53 -0400
Received: from mail-dm6nam12on2051.outbound.protection.outlook.com ([40.107.243.51]:63457
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725925AbgJFRxv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Oct 2020 13:53:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SD2KJWwjy4atR9IeDrWacZnhzXsc5uTu8mu1n9lFMopphHomwWFtmKzPf0c2l7maiNBllwLU0oWwxzMo6mkKlBnylA1nar6LX3kurCMjkfah2Hb5sKh7X8H9TnimrkM/XHTj63AnLKs0aZgyBokX768jW3dGohvZi9a+egGyxIBqZlcFJPaUrQD/VetY6FP64afKRlGrQ0iVAjqYq1nAoQ8NekFgEmAuoHvunJKfVkHYimjY33Wm785/7GoWXBt++vZrskx0vh4gxPjWUuw9Y03UQR5SzuEFbBo6LDgv+AJRVLobGowPmejFJufv+sOaRfxGx0d0xs4Um2Z6T1ZecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilcy4KDtlx40A5A1l3h/m5yIwn3HNtiHS6gHVLV+rPw=;
 b=Plfam7uAoqAhQMXj/OuwMLK05f0UEAMNowZ2n9xHDz/MRU+xpwbieK+fcQxkMElumYo/UOuUrXMMi2RMfMCCI3RjnO3XQjKsQDyEinjQz5gLIcP7j+c69zd0xu4H3aKc4d3jhKvBWUPgSiQK/kIYJ8fv3yzYsWYgs11hRO1p9fWlRHPUIfJ6TzlkLH+5doYrRY6WtB9fo67lixi24RDfq7dcX1wazHQpZqPG66dqZY+jcpG7GDcgYF67Ug5G957kkvnTrxG4YD4N2jUe8AK9MftO5KdqQJKjKDG/JI8DoO8mO78VtiiFkVxXZ3GK4476Tz8wRvczGrEkcCZN6WQGCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilcy4KDtlx40A5A1l3h/m5yIwn3HNtiHS6gHVLV+rPw=;
 b=Bry70iMZq1u7WXODl8bv7eG1hw6l2zKk2DaoLUPjNqc6mTxykvdUlbwOIa5BTrbREIBYU7NnrSRwgkYCQyjg5ZRRPCvqMpSZZFEu46qOM+YycEhza6nHd/lI/HjAQko9H7WgyTjHbV9jqnRDJ1PEfJM5v8fMciO1g2+fQKj7RnE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM6PR13MB4495.namprd13.prod.outlook.com (2603:10b6:5:20a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.13; Tue, 6 Oct
 2020 17:53:48 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876%7]) with mapi id 15.20.3455.021; Tue, 6 Oct 2020
 17:53:48 +0000
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
        peter@korsgaard.com, andrew@lunn.ch, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu,
        Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: [PATCH 1/1] i2c: ocores: fix polling mode workaround on FU540-C000 SoC
Date:   Tue,  6 Oct 2020 10:53:16 -0700
Message-Id: <1602006796-273724-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602006796-273724-1-git-send-email-sagar.kadam@sifive.com>
References: <1602006796-273724-1-git-send-email-sagar.kadam@sifive.com>
Content-Type: text/plain
X-Originating-IP: [64.62.193.194]
X-ClientProxiedBy: BYAPR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:40::21) To DM6PR13MB3451.namprd13.prod.outlook.com
 (2603:10b6:5:1c3::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gamma15.internal.sifive.com (64.62.193.194) by BYAPR04CA0008.namprd04.prod.outlook.com (2603:10b6:a03:40::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3433.35 via Frontend Transport; Tue, 6 Oct 2020 17:53:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c16a9430-ca16-4105-e1d6-08d86a20c6d7
X-MS-TrafficTypeDiagnostic: DM6PR13MB4495:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR13MB449518BE5CF12BFC446BCC19970D0@DM6PR13MB4495.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D0x+lT0weF1yLxbLE5m7i097M0Ex85eK+a9KAVhrauc+3TtmjAb2Crvj0PFzK2P1BRs4w5Y4H9eFh5s2rBJzLveX/vrJyccn8ndhMLpAjLveK8/l9u0wyMtwSg0nrDOLaly0glg07pTpehhi6xZreUIpePtvYgeEXRVNYf5xlz3AUZ2Bc6zlFGBpIXdmur/ZBMcv6EbwklVBpOVR9tzD0HitJxRO4I4B4UttnM4GOInFYhnDzyKKfEtVIdwcTgPuOenxRGAtBrtsHsImNCHy9eEecrkZbNoTXQ0JMvEZzACVh7ani8E0iMa2jMQpfFcz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR13MB3451.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39850400004)(376002)(136003)(366004)(396003)(6666004)(83170400001)(8936002)(8676002)(107886003)(5660300002)(66476007)(4326008)(66556008)(66946007)(83380400001)(36756003)(6486002)(478600001)(2906002)(2616005)(956004)(6916009)(52116002)(16526019)(186003)(42882007)(316002)(7696005)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: wLSr18GBGxv+/dXTjk2GpDNaDQrND6AxYjaQuDPWXJK0DAOfDV5tydrV+iAysTNiaSfG7xVL4zp7M5xCBJTyqYrD7VwOtGhOHF1CWgRyMg96fePmS8cq7QSSY16c0VIFgzcvbedZhtAmPK6aIqeAJbBViU9mgbHSWAsoRUbJjgTzxFsG1Drn4hF0f6UO3Jw4sGDfId3m4VnpqhMywK88TTx9+KkILQjXNykHa/9b3GnP+XvYC/CQXeEP2/LwSAY5PtmyQ8yachVrgqaWrRZCfVgP3ddI2GniSRcalWCpVkA4RyEOo3s6IS7jcj9fMWGv3xzT7+mHfg8HqjMWyMvZaiBtIDIq32GlwK2OQUot98hpjSs3mzhdoKmAWWttH5EI4kuFN4v8HP8JGPuNPCZxfVZz1X0RR1RRVG0oajFflk8HLVTd/mPCK2WLXUy/ygnzsJ1ZMh+qnDx4Pz/htNNRNJwyx4jJjCuduarxi5p0gqJFIj5FpANwh56cql7fMBXKVIqsuB6Vqcr5yk8chp4ekHHEf1JN3J3p9ZC6BWwYBsbCqL9kqquulbEKJzse0zclZiM46zRv1iJ9+03xBA7d84g/eBsQaPvvEV6wF7LlIPpLkO2VJlYLO95oow06A7o33Auv7mUvO3kKY7HRxUpQFg==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c16a9430-ca16-4105-e1d6-08d86a20c6d7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2020 17:53:48.4277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rRTonR9DYgxz51n6DBH6SLhlfUQzawvLH/clH414X1HF7suhAaehLOO2JC6PaTmeB9tCsirwHTlhQIFIQo552A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB4495
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
 drivers/i2c/busses/i2c-ocores.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index f5fc75b..4405244 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -686,17 +686,21 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 
 	init_waitqueue_head(&i2c->wait);
 
+	/*
+	 * Set OCORES_FLAG_BROKEN_IRQ to enable workaround for
+	 * FU540-C000 SoC in polling mode.
+	 * Since the SoC does have interrupt it's dt has the interrupt
+	 * defined but it should be bypassed in driver as this SoC has
+	 * a broken IRQ, hence update the master_xfer to use polling
+	 * transfers.
+	 */
+	match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
+	if (match && (long)match->data == TYPE_SIFIVE_REV0)
+		i2c->flags |= OCORES_FLAG_BROKEN_IRQ;
+
 	irq = platform_get_irq(pdev, 0);
-	if (irq == -ENXIO) {
+	if (i2c->flags == OCORES_FLAG_BROKEN_IRQ || irq == -ENXIO) {
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

