Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3B541A61D
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Sep 2021 05:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238745AbhI1Dnw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Sep 2021 23:43:52 -0400
Received: from mail-eopbgr1320098.outbound.protection.outlook.com ([40.107.132.98]:6166
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238850AbhI1Dnw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 Sep 2021 23:43:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsdJWySLvpSHuSq9WxTXfiJKaPqEr2V03Iw2DsIPnZuvV81ty1WgZyTewbrEgE1eIznP52hXtJYsa3Bf9pOVrPNfSNfINO0vRK9HQOTEe4eMaLcgSLmebVXnlCTyftvkH+EgN/yWnnTTrga6rmpA/l/aoeSVkG5k4ALyoMbfy/yBfEhfpLlQSSqEH0bevbvmPCU9rJv1b3XsbTl/1mQVi+8KtHcOOZfZByFwHxG6eYeJZ1N8oWctWMlELnN/8qlpV31oDU9rLEbmrsxr7BbDVc17dyydRqEZ8gDENs93khejxKEzwdsyGlEc0R11Ya+0/R6SKEbjFdeiVtkcl/q78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Jb5/LeDxeT81ynp68jWcAYkMpA26dtKiIEZr4QAmzrc=;
 b=fdbMjcli/vIX752xXZ9aC3MjUPeezrw9K5lPq+hlHpFLMKFcZbjtHdpV9Y0Vv/8Z2USmsTC07Fu0bYhR49AAhsgY3JxZoqOJeseog/Wtf7n8S3uJBZ5Znwj4JtlzIXn+PyDfmbZJWoujAWmER9cGLP3XR61r/UlaLhqZfZYb1J21S/MtT9zRqQ70TTAy7qgdSHLocCNusjN1BMRmC1FYQvRumVW1N0NVJloCWsiDbrQ1ChrW1iClX9PNRMeNZfTeDvMS6cnwXcO0YSRUQD//Lel77s7KRBkargW0x9GRG8eVSZk/wDjRhp2OH/1f5oz/Ng8thAFjxK1bRoWYHpy3hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jb5/LeDxeT81ynp68jWcAYkMpA26dtKiIEZr4QAmzrc=;
 b=EmGvz5AkqdtTYh4B9i3pveLPNmpBvBrw8w6gmhuyYJ+bcl9oJbF9wG80JoHapJAEnwNKrQh4Gl9HaF7Y8kr+x8Ww17ZrfyOpHYWdoAZ6KXzAqejx3AEgd9r8p4HHKkEVzz+YypMKra+Kw+Q1TVNF+Lz21Ah1EwkTwjDWRhsXgrs=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 03:42:09 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414%6]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 03:42:09 +0000
From:   Qing Wang <wangqing@vivo.com>
To:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Qing Wang <wangqing@vivo.com>
Subject: [PATCH V2] i2c: busses: switch from 'pci_' to 'dma_' API
Date:   Mon, 27 Sep 2021 20:41:56 -0700
Message-Id: <1632800519-108430-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::30) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
Received: from ubuntu.localdomain (103.220.76.181) by HK0PR01CA0066.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 03:42:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83339189-25f7-4861-2a7f-08d98231f2f6
X-MS-TrafficTypeDiagnostic: SL2PR06MB3082:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SL2PR06MB30822210084C83B549B7918DBDA89@SL2PR06MB3082.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bqLYsgxi71Rn6ZQZaenJ+6KvKF70Aj4koqIKXhiVd1+GxP2KQWfZmrDXSj6jtVKVro7OUrVEdWk3uwLT9TZ8tHZmQ8hIyP0Lx4ZxGwkvN6sueQh4mBEHVsz1WtSv/kFAZ4X0bizhzSLmn890wXX8Ad9cP8DyQcA//lDGNnWR9KBMgybqyQ3p2CCti4WSbMkiOqbA/yFYpqcVXNYwLUiCFUuq6sjoFn1OKw+rVALJmNHdxmDJuPKLowc4JTF/d8GsNYUg9j5VdPs3G85K00PWZy6KeszVRf9ETUR0kM2GZVJiLSpSOw1ygI/7MgON05ZFAKN5AejHuR7mAlaW2ndpNrSYXnPn7jrtd9q6BhdsBrzahSaEpvaujR8EeVV99oSgKQKx1h+ZwXnrzPa0BxUuW8Xwr1o83SFXtHPhjMqg7i38FZTS+zoOAlVrL/ndESQybVktzQwARxVEu/bn9LrwLeSHooCJpwsa1ToZmy4EeJXq3PgBYdfEy+5oao84uS3PejHB/5frLUF4pF4bhYOG3kJ2TpDH44nqbq9Wn2Bs23zJSbIv2o2W8LrQGslQDrOzo3BEJNStWD+CD47cnQKyL2PMv9i3aeJdB+kGe3UhLx8jRsAT0CKDaSNW7LmUxgfv5AFiSW77SF63rwmA03yq8i06A7GpUas10L6RwF3Lka2YD6hY1taDdMhLcsgEvdei
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR06MB3082.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(110136005)(26005)(4326008)(107886003)(5660300002)(316002)(508600001)(2616005)(956004)(38350700002)(38100700002)(86362001)(6666004)(66946007)(6506007)(36756003)(6512007)(2906002)(83380400001)(8936002)(186003)(52116002)(6486002)(8676002)(66476007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tFJAnazXsjmnNwFkvokkYKNPmt9Q+Hqj9FX7OfcnrtqoD0LcyBE07DGekrAT?=
 =?us-ascii?Q?0YN/j/AVFlIMoiRVgUKXiqUhyxKDAD9IVlHwX3NSOJCczSIMFVA/0LFVKlww?=
 =?us-ascii?Q?83KHpnD+iex8tHzWjobgrQtWIQLf2T3/cmWZcciHFD1XaAuMUZMOt8Dwyyt7?=
 =?us-ascii?Q?3eywiBUH9ND03fdO6DD4UqASoJ/j2scG4IIjg/HRDWfIIjJjvEIyBLht5YcW?=
 =?us-ascii?Q?gBmHjKyNt1MXduXKfQO5o82Qo+wjlvBsekKFzop9G//9R9T3pg2ZIdGHPRvu?=
 =?us-ascii?Q?/TZgOUdQKQ0MAVfE1PFpQkI2q0n57uEgTVFvRQ0IHa2AxNbu/drdN5nnDKjr?=
 =?us-ascii?Q?v/mQWg5FeWWkQYU+WkQujIiOqQ7CY3YvJUkC8BfrCgrqrSgEPUtkiZ/Jksni?=
 =?us-ascii?Q?beldH8EWqpmLebDlPKQF1BSpENz8QnpAq3A0IHmukrQt/IL0RYLcnHZbDVpY?=
 =?us-ascii?Q?iYqZ/nyy/KAmD/g1WDqKPu3yUm0WNB1cnWZ2sgtYCQunDoinSwj3kqwLl9Cg?=
 =?us-ascii?Q?7s4bJgr8Nhfbx6mwAatG8WGJwOfyURMiF2qqxH7t4KAHqZOLF6oi7Vgs1RX8?=
 =?us-ascii?Q?sxXYljk+3w++DcKVkfoyRco7imHO4Zh/2KaEfO8UDfhK3kNAdINerIOJXPMP?=
 =?us-ascii?Q?9Xs3s7K4kYmOO7GdNKHJh+gEs1Dx+Grcd3yw9rHCSvBtyMHZQ01mX01PgJAf?=
 =?us-ascii?Q?ro+dO/9PzTHHMjkln5fgoM3x23S14KihkjtQ5JtGDGI+rbYxHYOMbD6/FtBX?=
 =?us-ascii?Q?MZ2MK0CDYi2kKkK22XlnIB6lmbVe1eYxJj4H9XEtmLk7em7YMJ7vBMODdVCA?=
 =?us-ascii?Q?j0pbGiCTNx4cF0dCFJeibZz2+otXmBd+e5kHR1ursm71oSrviadgibG+a3pX?=
 =?us-ascii?Q?Zvrei5z+yg4Ud6Zay46673gtcByFvJw9DaPmKSxkhJGeCg2PPTmMN7RmhuTk?=
 =?us-ascii?Q?Z7u4hPYcwyxjgMeTQ1K0I0tznhpp3yG6PBmmpC/7/noSRphpweOqWN0EQ9Gb?=
 =?us-ascii?Q?nZSj1ma2aGnS+2LBgD5dLf/6DmEYSXxXSPfBzFkcr9ItZaR5aEhPkdSUui6y?=
 =?us-ascii?Q?7ElGHK77PEqzjfCDBUKUyzB65VKZtufgTShOEZbvDtUgWQlLALwKPFYYjy6F?=
 =?us-ascii?Q?jiGLFTMDHJJadAEg6TY61OadZieri65dE6HnN4hsmQE75AaZ5LKPDO1IpmoB?=
 =?us-ascii?Q?iM9YNjqBcOW4BRM8MNeea+F5eKxeQ28sD8KGwoJUUlmEMFk166SXGBCTPvAh?=
 =?us-ascii?Q?nXQuo1CUHP4bz3Ze1Rym2/z7gXmJrJ2Bw2FM72OpudPhb3sN5dTOdSLDY6Fa?=
 =?us-ascii?Q?P7O85jKgxjXukv7JUa45taEi?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83339189-25f7-4861-2a7f-08d98231f2f6
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 03:42:09.2932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJXf5nsrNU8oewiBIiDFqXRude62G0qSHzuhFkhuLUUb4ft6yRWknQG+lpJo0BwbbEQf0GC+ihValDFaUtGJAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3082
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script below.
expression e1, e2;
@@
-    pci_set_dma_mask(e1, e2)
+    dma_set_mask(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_consistent_dma_mask(e1, e2)
+    dma_set_coherent_mask(&e1->dev, e2)

While at it, some 'dma_set_mask()/dma_set_coherent_mask()' have been
updated to a much less verbose 'dma_set_mask_and_coherent()'.

Signed-off-by: Qing Wang <wangqing@vivo.com>
---
 drivers/i2c/busses/i2c-ismt.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
index a6187cb..b497558
--- a/drivers/i2c/busses/i2c-ismt.c
+++ b/drivers/i2c/busses/i2c-ismt.c
@@ -918,11 +918,8 @@ ismt_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return -ENODEV;
 	}
 
-	if ((pci_set_dma_mask(pdev, DMA_BIT_MASK(64)) != 0) ||
-	    (pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64)) != 0)) {
-		if ((pci_set_dma_mask(pdev, DMA_BIT_MASK(32)) != 0) ||
-		    (pci_set_consistent_dma_mask(pdev,
-						 DMA_BIT_MASK(32)) != 0)) {
+	if ((dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64)) != 0) {
+		if ((dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32)) != 0) {
 			dev_err(&pdev->dev, "pci_set_dma_mask fail %p\n",
 				pdev);
 			return -ENODEV;
-- 
2.7.4

