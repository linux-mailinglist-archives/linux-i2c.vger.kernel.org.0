Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFB6340F304
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Sep 2021 09:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239023AbhIQHUC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Sep 2021 03:20:02 -0400
Received: from mail-eopbgr1300090.outbound.protection.outlook.com ([40.107.130.90]:57984
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233196AbhIQHT7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 17 Sep 2021 03:19:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cwg77Vqx8d5RKCuX26MCHhsEOjj2C2Ut0tott6aSNVGlbhNdoQx9KbRthQz8I3ZsPLQG01bAhqcmpHHMXnjwnR77ABXOJoh/jUx/9MVGWNahTSaiuahmDlpA1rXXyPPqYgtmC/Hw+Wp8yUOvkYLnmYp94ivhrO866kJUT4BWmFrYe86Vs4/tGQU/PHx0xJLbLcqfIGdLIN/wcd1tK8W61XFNQcoCUXeAi7N01dlq7le02KK3xGLdBrg1RyHypmlsJoYBIsVdmQiBTeoMw4FVvaAJLF1MZk7IioLn0sa5spKHd6pQVh84vSwqxFHxzj8eO6CQ8wHtKeh2kCJWJi+fVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=7XROD7GtQcw+z0UR7oMjA5wtkDHXqQ8i8RS/5sKzZ4I=;
 b=VTcuqveEtE1TWR0UqXb/oej9CBo3ufeCmtLqrwHpkTEhevw60PVwI2yLiNB+EaqAaQOybdiJeKpp0uP6fCwmKG5dFZZmyv6GcAwDY2yKuP7sWehhB2pie3r2sL7qwxT187iMkOr6ZLwbRO9pfdKL46yzg+VeAis+KP48ewPAT/X1xmjc3/v73GzzOX0lQrwQDTd/l40HmjJhzzFF/P+CCeW/xHGgMn4hAQHD36sFk2VxDWBve7qCXp7hcfLso8wMpsfPTD5gbcbNWGqMsDfF3tZ02gBLbPqFbCnzu81Y5TFr0Wg2rhM79vyBBxU+LXkwGFoMcLg1uzGh10ZJuzQglw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XROD7GtQcw+z0UR7oMjA5wtkDHXqQ8i8RS/5sKzZ4I=;
 b=POw0Vy0E+MkCzygadc+i6K6E+IO1NMRjqbLR+g+txf/HU+5W6JwmlpVSQaWv4YvPX16mRb1ShP40lOuWUXNKL5SuTktTQ/0Ah5biuvZlWbegrVVQv+TPneiemXytP1O9r7ssDirqchX5pjJJivuS6S/BTjJoQ2y0q2Bco+NjEG0=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3404.apcprd06.prod.outlook.com (2603:1096:100:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 07:18:36 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414%6]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 07:18:36 +0000
From:   Qing Wang <wangqing@vivo.com>
To:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Qing Wang <wangqing@vivo.com>
Subject: [PATCH] i2c: busses: switch from 'pci_' to 'dma_' API
Date:   Fri, 17 Sep 2021 00:18:29 -0700
Message-Id: <1631863109-10326-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:203:b0::29) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (218.213.202.189) by HK0PR03CA0113.apcprd03.prod.outlook.com (2603:1096:203:b0::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 07:18:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10875685-e35a-4b57-6ae0-08d979ab5d61
X-MS-TrafficTypeDiagnostic: SL2PR06MB3404:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SL2PR06MB3404B89C1A4DEDD76167EF7FBDDD9@SL2PR06MB3404.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4d7jhk1urDR3OQhNqsoxjSOUEJIBuokJ4AOdLbcblGVxqaxqkRPcPGPsBKF7j9dHiocK94Am9ddadt6a37mLbX12u9WuJpkJoWINM5yFPcMTBJLMuOb67DfLVVljSA+vNg7REnz+8SJxeh6PS9nd401NSFLQXFlw1WaWI1L825IwbKFoO9B2+A3VRr4rPNKca5Z4szn5YuliZQHnIIQei1FPIZtpP4B/fo2lqVW6y/Bve0vnv76LnZYQ+RIlXf2h+xku7cQHiZqiLjB7OtrSounLi16EtmOiX7Ns2XHKwNu3gtyAINmEVmD/JWAy4VcaVJj6fVAlmdANxUmmd9QLRD27MatTDc7oG8vK6fU/Qnj6IqgvjD3TlZ9NgGc9gq1Z3C7CyVutKpS/mfy69NTWoUMTCYDrq2yKvA0pd+yI22BB8FlLY2Mg2pLbHxQPPQEdJvW6o4jU0Q8cu5vvzSpAKk68iH3z2X8A4QdffPbkc4ydcV0MSSgug93ih4uOWnJOnKDb6LooZ3YEaXsoMKHCzEGMgpCdw/dBkqUlYIOyV+xVoWdkR7UmdFwjV57BkeRbspFLZ2K1/1E/GyTqvLMAK9rS9KdsYymUw75WQbBrXyf//ElnmSIKlpHQObOQqYQ5Bcx8/4NVpsuvw3sbfVlVifvYy8MZE509O3eyYxw/pO5NeLPPC+HOxSOIn0AnbbfQNyXUlsmVVJWgcf7EqQrtqyHkShuu0bhpisMUQ07i4NYJtLrvK/Kpn1tvTtzJ0I8ljuMEKIAxyrbvmar/tiU9wQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR06MB3082.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(346002)(366004)(136003)(38100700002)(6512007)(6666004)(38350700002)(966005)(6486002)(52116002)(8936002)(5660300002)(2906002)(6506007)(26005)(66476007)(478600001)(66556008)(83380400001)(8676002)(186003)(66946007)(4326008)(110136005)(86362001)(956004)(107886003)(2616005)(316002)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iIoUAZz1uM4BXNDHuoqRphmyUzCJSf/hNPWdek7NAM8q8W/NpBE6qca2u1zX?=
 =?us-ascii?Q?UGYjEb3j+J22Bz33wzN5cPSAEbp5ddlQf4MTaJsmzIfDnZ9OtcUGprCkjABr?=
 =?us-ascii?Q?DYdmV7/WGbjO3jsPm/XLBBZ0OGRc+Zu9Ox/4vBgVj3OmAe3rN8EzaaepGZ84?=
 =?us-ascii?Q?7KMlJG7Lg9YDyazhIwbX08BMNF85lx8J4kQZzqhvC7rB8YetnuH18ZSsroHG?=
 =?us-ascii?Q?tEwr9ZS8xrUJGBukSCfyK+hxiYue7gZKeV4r+dCkb7H3rPl+qQsO1rQY/BO7?=
 =?us-ascii?Q?lBIrgC6ktXeB2C+J1vAJ1bdUf/XMtIj7GnKVCoLKOSD0prVskAC6Eg522bEB?=
 =?us-ascii?Q?NwqFJ7VghDzlQRwTmTw9X8hwPe89AIh4QvS1lVOQ4SamMGToxNldTfngtBZN?=
 =?us-ascii?Q?o+2s9H4s7nx3rr5794yYfaKYKlxyjAhNidlLk6Yzcw/BsbVHkrB+tPnNJIwc?=
 =?us-ascii?Q?HXlJqMZN7tg4DJAhKps58L44L3Kqu3cSaFYp3BDFg9b9I9vDb/6NJerhCWg/?=
 =?us-ascii?Q?5FTNraTbKY672wGBUHn8f5BpXNz+hFJ1ICb7BDeivyxtI+vHozkPPVPoSE94?=
 =?us-ascii?Q?Wp4G8KdtlqqoKONd0a3Q9U76ZLC5A6ijBWc64tR2UG41WkHHJMGylp+bQSNH?=
 =?us-ascii?Q?2siD3X4wby7jYNGcz9yJJszNgJXElSYl34+jQgc/uLgAY5EbWDjJxeKe7yJp?=
 =?us-ascii?Q?JmWBcXTdtGbXqkM8sRzeQ/KWeulVn6fUEt+wWl2bBFXtAIvTWaHi0TpOYBgA?=
 =?us-ascii?Q?wG1IOuL0dd0OrkUYTtxCvDT1QPxIuGO1Il7GXyNzMS+KbNBN+vqacKHKi2yW?=
 =?us-ascii?Q?C1pG58C/kzUueCg/n3D5SGHPMU7vQ/dqrvXMhOnZ5T73Jgw02AK8w25fpVfq?=
 =?us-ascii?Q?2XwsQN82/O0K2QeeVQdJkQ1c4o9WhcYrr/iFi7sfh3awCVElZaLer7B0mO/y?=
 =?us-ascii?Q?lMENsQv40zSy6Q5yQUy3mtcgSt6mhz6BKoe5D6mgSs+xXaaruH4M1DmAPtjd?=
 =?us-ascii?Q?UcYaa2UivcKjxDb6+oRcCgt0JnSFGHnRD9zng9TR7TCSquyifGyxnN4U4JRJ?=
 =?us-ascii?Q?RgyguI9NAB38WcwPq5ZaYhtsJ/byJIIlu9qk63GGXFrUTaUDqza46ImxOjcs?=
 =?us-ascii?Q?4+ChY2na9kWYmBMExXBa7brP2d+cMtWBtq2F/HO5hNmZbSN+BM2rZc+/8bH3?=
 =?us-ascii?Q?SpQ6P7ukpox/LkOEWMk0boVACgJN0cJXCO2nY24iLt1+VaMhHRhNBeoyk6GG?=
 =?us-ascii?Q?1H1opeGab7sg/jsu7RxRHbgIRD/pldpqMB5atQVuaKeb50WOUIFuddlEKvo6?=
 =?us-ascii?Q?pSvu7zATxxUkghnRb4hooLUC?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10875685-e35a-4b57-6ae0-08d979ab5d61
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 07:18:36.3929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwuzPNc+QcnvV3qT9PzOPExn8yutzU+ZQFKXtDDRMLcI5Uj1ipsib6aelp0YXsad8rb7LEYxZgeV01g5DdjVuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3404
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

This type of patches has been going on for a long time, I plan to 
clean it up in the near future. If needed, see post from 
Christoph Hellwig on the kernel-janitors ML:
https://marc.info/?l=kernel-janitors&m=158745678307186&w=4

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

