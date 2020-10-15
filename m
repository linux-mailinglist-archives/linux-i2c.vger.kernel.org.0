Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2750B28F469
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Oct 2020 16:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730846AbgJOOIs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Oct 2020 10:08:48 -0400
Received: from mail-co1nam11on2076.outbound.protection.outlook.com ([40.107.220.76]:36868
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730801AbgJOOIp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Oct 2020 10:08:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuhCO+pvIoRcZNjJ8VjnOlXCIuuQEQD8bGu5Ew+vdp/Tk3oVk6/BjryPSQmgndg9uNs4eysdqtlQadjshb4iApgQf/L9sSEMarES8GJRnnjf+sw3klP8VjoushTA1qzFGjkAkKO2nrc8/pULrv4RscGZ/QLrlSNRD8uoMj2JM84IqIDRSXjSZFw+hWa2bxTgUnrPlubBrMxOsxccfvITdMj7DtPPObACrmXScId1PEeTGAZ10cSYKcCn58xucM3kU2o7AFunShAfTdCDq/sOFHjce/JXuoeuCf1Cmd+9TR9bKOtb5eLKCJJ7Kn1k5Q17XleiiseC4iihd6emasw6LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLAiAcLFf/dYCOHCTMyVXRiKfcxCWF1jf/3HCZ8fcm8=;
 b=HEXkaw2+ekw5SXJswBd6CatdsFx1Q5XwuhBYKUbzCZL+wHnU1CZISxjdamIGKuIRZRpctxq2+APMLVATcU6nSQYLmsq4/K6wzLkViF6JyWuXRSAftB0H8BCqdd0FNooisCvWvxfIgx+wcgV6AsbdE1nViY7bUR6+QYrzvmGkKytU4+BaOX/tDkpbHzpLsw/xp1TX0YupC+SYz8m1PaczrDHx7UOXkVEt32TgnMrTHtcZ5k0sDSotkPZAkI7h3HBkqqPnxepuJRGwjncrtiNrCrGM5XRZQqIW+EI0PGBmVbC6HftTBMg0GlTaS/BJzPG3TiNsGfogdEA8H9v5F+SXPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLAiAcLFf/dYCOHCTMyVXRiKfcxCWF1jf/3HCZ8fcm8=;
 b=ovQi+cLnl8OsVt1IF5o87wbCA8dlla9/uIqNUDZqYIUYRQ6aJ7Qdgiwx2gb+nEGPYn+4V57AcAXErejyFnvKvoqrV0ouk7Naf29O9j2V2JS+mEdjZdE2gQSTo9TC1OyLLFgcBZtWU90K+Ys840bCag7u8YGj4baFr9tOxVlT+yQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM6PR13MB4067.namprd13.prod.outlook.com (2603:10b6:5:2a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.11; Thu, 15 Oct
 2020 14:08:40 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f49f:d6d6:4c97:e5d5]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f49f:d6d6:4c97:e5d5%7]) with mapi id 15.20.3477.019; Thu, 15 Oct 2020
 14:08:40 +0000
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
        peter@korsgaard.com, andrew@lunn.ch, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu,
        Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: [PATCH v3 1/1] i2c: ocores: fix polling mode workaround on FU540-C000 SoC
Date:   Thu, 15 Oct 2020 07:08:27 -0700
Message-Id: <1602770907-61852-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602770907-61852-1-git-send-email-sagar.kadam@sifive.com>
References: <1602770907-61852-1-git-send-email-sagar.kadam@sifive.com>
Content-Type: text/plain
X-Originating-IP: [64.62.193.194]
X-ClientProxiedBy: BYAPR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:74::46) To DM6PR13MB3451.namprd13.prod.outlook.com
 (2603:10b6:5:1c3::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gamma15.internal.sifive.com (64.62.193.194) by BYAPR05CA0069.namprd05.prod.outlook.com (2603:10b6:a03:74::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3477.13 via Frontend Transport; Thu, 15 Oct 2020 14:08:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: caf7d239-b84f-4e89-6a1a-08d87113d144
X-MS-TrafficTypeDiagnostic: DM6PR13MB4067:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR13MB4067735D44447E2FB2E937BF97020@DM6PR13MB4067.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CGRrBQ021PvAbEnoo5K/zWgDQTqR+892QykxyvENmNT09Cc++xKTGKouiLIzqsT1Mx4mX2AXFHkOGfmQVJ48IJxg4JGNIB06JqC4/8zGWzAEL631H+cy4LXmlfWfwEfwUbw5DNVAG67saJBRJu5hqZmppFhC8D3cGjwlxhBzBzCDRLZXgHG8flv/S7hSn4BiP7+gNo94RERtl1ah1dKGGuyLp6sDBCXbW6hyM4hlRB9kZ/uJ1LtBc42tMlCIjPhNfnwi22pj/272qOUBhfsLVcjFI2gLg7Qh5mHm82mhbcYUQL3gXMManLqUN1W5GwKa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR13MB3451.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(366004)(396003)(346002)(376002)(136003)(36756003)(16526019)(5660300002)(83380400001)(83170400001)(2906002)(316002)(6486002)(107886003)(26005)(186003)(52116002)(8676002)(7696005)(956004)(66946007)(2616005)(66476007)(66556008)(6666004)(8936002)(6916009)(4326008)(478600001)(42882007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: xEUXK9uh7HiJ8mi7DTnY0gngay11cr8JyMddUmR1wt5iqwjLRjRxP9e5n5Vc88sog4cwvchMCtyljXWAvZEPs6GuB/lJtlpSXtuOLZmEu5nY8gKKFwt1t1jmKYeTXV5r7aznNTmfenJay9VK+X41QYCmSgZwMFPrVm+UXHWxD1vNelr/WYORJohIqjvk5E6sK4XJQ34UzVvBw+B4j/EtPLueXq7VXUyPVU13kZAAIecS4fEyV3VK9iMPvgMJuAuJQmj7OaBTUdzwkKH3ZJTfTnaBbk5Tct1DjYnNzoIdysxEYRonIL2sNW714xrerL70bLo4GPNfUGI9g3n9qFWRZlJN/btavJGXqCCUarbv5qhV9fDuI2j+HXqDzvTag7zrCmPa848IdQD+O5G6rCD0Ba4J4VsCoqlxv7VWBsgGVJ40gkjPO121qyJOq4b8yzeIedudU0iWyhIg7mmB+tkL+RAqDVIXRYxIjDY683RkhqUTnA0E0nmlGbPPYXJOkgFSjUnQ6Aj32z90r6yq1utclatYCpZOfkG+A3NppjxsV77OoM0RZIEAqATz/QgqBkIqchDNcPf32qYoZrpsNDl19iYTOHaXjhsrxOnDuO1KZIuHV6tKxFwBlbsxVZaI5b7tf45986fWNOrPNZtqIgwyxQ==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf7d239-b84f-4e89-6a1a-08d87113d144
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 14:08:40.3653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bOQ8PtLIBIIgqmMGEPXxVz9N5hIBx++PuT6DuCTVPUFeu8bJj2RI2lfxIoxfK9GCkp/f6SkQulDLTeUAAsfBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB4067
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
index f5fc75b..1dab02d 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -686,17 +686,21 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 
 	init_waitqueue_head(&i2c->wait);
 
+	/*
+	 * Set OCORES_FLAG_BROKEN_IRQ to enable workaround for
+	 * FU540-C000 SoC in polling mode.
+	 * Since the SoC does have interrupt its dt has the interrupt
+	 * defined but it should be bypassed in driver as this SoC has
+	 * a broken IRQ, hence update the master_xfer to use polling
+	 * transfers.
+	 */
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "sifive,fu540-c000-i2c"))
+		i2c->flags |= OCORES_FLAG_BROKEN_IRQ;
+
 	irq = platform_get_irq(pdev, 0);
-	if (irq == -ENXIO) {
+	if (i2c->flags & OCORES_FLAG_BROKEN_IRQ || irq == -ENXIO) {
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

