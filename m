Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56633571472
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jul 2022 10:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiGLIZs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 12 Jul 2022 04:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiGLIZr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jul 2022 04:25:47 -0400
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2440B41995
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jul 2022 01:25:45 -0700 (PDT)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01lp2043.outbound.protection.outlook.com [104.47.22.43]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-gDOZxx4wNyuizk0boo1RaA-2; Tue, 12 Jul 2022 10:24:37 +0200
X-MC-Unique: gDOZxx4wNyuizk0boo1RaA-2
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR0P278MB0330.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:36::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.17; Tue, 12 Jul 2022 08:24:36 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3d:ca30:8c24:1a95]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3d:ca30:8c24:1a95%7]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 08:24:36 +0000
From:   Francesco Dolcini <francesco.dolcini@toradex.com>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
CC:     Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1] i2c: imx: Retry transfer on transient failure
Date:   Tue, 12 Jul 2022 10:24:15 +0200
Message-ID: <20220712082415.319738-1-francesco.dolcini@toradex.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MR1P264CA0056.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::20) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05267eb9-f123-4bdb-3d55-08da63dff4a5
X-MS-TrafficTypeDiagnostic: ZR0P278MB0330:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: aphjOBfc1rByGyJ+ni1zQvRI5HDq+uYXjCCXIaSfYGC+78r5a4HoajEabKi1pVZdFKt/bqj/ZplVJQb6a/4AjORYN6fLF+dGEdwL8ec/iMPE6cEQaV9Hn8rbji/bAS/EjbUs2lqGgrFY3K526P0wKUWUQ6vt4Xhmo3l+LMMSsBytk08hElsW5ii6bD1q1zpk62VfDHCjCaE+XAyuG/A6tBWG49IGfxA+9hMoTCDCrXTkY+cRkoCW/PKKe6byjOhn89U2o+ZDVEGftGUU7oLnJTlkjmy5GmvNWISyuwnrS8pwNdmEcnMvWBERYDxOqH1LdCDLZ2iHiwWkWbM/z4YwzqLBO16nwherU6/izq0A2mSjk0IdDWMAJ5loPJK4OgLOi/Y8nDl6CM53D349nKPZbKeW5X7pbK0M1KUlog8TW7OmHwXrmz9FqmkeivB8t2TFJ3uCn27jKrLoGGaiIS5vS76vydTrdu4cS4yCpczhQiy/O1lvy0G+yXxRzylLtlGaumYG/uZX7M6wGJs5SN/9Do7gNHGhoQdiWWZ4I6E01l1pkguErGVp6L1lGOXYadU9pIB86SZGu1K00BWS+7E7bjMA9DrNV/2QwtmhO+UbSQPx9Msuke1rEWuQMd8pw003GM35mnB0YVYSnrVDY5HeoV1jhazf6r8f/zeXTeI0mKXetfSHYQYcbtufh0eKQ/yccjk10SCS0KjEVafcNV52NWappueLYHrsasVgYuzcvjK9bMbdeR4/eQRNxGQfE+fsvMQ4Gi5GRfU3Fl9nAOxWxxlcAgaUzN/IYVUS0kZZ56HltkXE0Uf7ZZ050lHes6SO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39840400004)(376002)(346002)(396003)(8936002)(5660300002)(107886003)(6506007)(41300700001)(44832011)(83380400001)(2906002)(2616005)(36756003)(478600001)(110136005)(54906003)(6486002)(6512007)(66946007)(4326008)(66556008)(8676002)(1076003)(38350700002)(52116002)(186003)(26005)(86362001)(66476007)(316002)(6666004)(38100700002);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oDegMirg9zMJtbIYhbED23gpS9rocF8Vg50saxKxN1JzdCrE6388MTNjPQiX?=
 =?us-ascii?Q?s0otNKrfOMsq6Y8rv9m4TioJnJNUJhQ282fIMVJW0e22W/AhV+9yve1Sxzxo?=
 =?us-ascii?Q?xW7jB9ohxaZcQw1n5qx++tRGAWDvxN8Nt1qAgdR5H9q0SgsBMKiJ0Dx65p4o?=
 =?us-ascii?Q?1yTSIH5uD/+l2zLReT3KblwpPEAhBKZYbUn7uNyrWj0DRgB4q6iN+WwHi48y?=
 =?us-ascii?Q?Z39w4ReJLPdJyfx7fNRL1w80ay8X62nFcNkUH0JzwLvWAU/LiLR/rb6jgrZt?=
 =?us-ascii?Q?esp3dY0rvcz6CSk8NvlGkr+d61Z3aOX1LuDBkXT0SJzGen5jmG7+Q4EyoIdo?=
 =?us-ascii?Q?Mf2UhhUQ1iKO7bSvpt/uDT6typtU60v822GTJqhiipWvFCP2N0x0DBL3B2au?=
 =?us-ascii?Q?aRAMynU6GniniEiC6lX5ch1/idPOR+hQDtlgDRr7fktZ6DSSphDa4DqaVUUx?=
 =?us-ascii?Q?h4pFZwTj3+nnRzYJCjCUl1sI8UnMCn8lQ0YavEkovhAA+qh469Z97mlcVMmD?=
 =?us-ascii?Q?+yUMrujqBJRQNeKXUsVNBShQUXB3nBGL9O1MHgJfPhnBareRpUJpA2zogUES?=
 =?us-ascii?Q?xLVfCa8buA1QBaV9rROgsBJhL6c9AUiR3ONm5Mg0cbENvnyi95oHigVvlzMi?=
 =?us-ascii?Q?z+l505ULeYfhE9PPXc1+sRlzsW4B/Es+8mx4nNKrYVujaT0/8pJxVhRxfc0/?=
 =?us-ascii?Q?B4Jc7emiP7DLqaKcnhDrePdqXa54fXTaG+dAr8lhXLb8jHou22dkafvDEgMF?=
 =?us-ascii?Q?fN0+qF/vrp3m2To8nELkF32VNMUz9gT2t0b08Lo3KtTarUwZ5v/xHeveo8ks?=
 =?us-ascii?Q?1aHmWOBEa9IP/3cNHwPAfa7ijUtgrEH2bIKHWlhBorCR0dmgYdZH8ID9nkFC?=
 =?us-ascii?Q?WnmZRuWay6LKuhspVmYnIP0tdV7EI3/YP/yEY26BTqD9U3/Fi4IfIaYdmk1M?=
 =?us-ascii?Q?PW5NuSEQouXUufQp4+Eb70igpehaU77Nw1TYw5zX0ImmpOyUn0LLvM8G8xvV?=
 =?us-ascii?Q?B0JCAGEclMYybrKlRjGtCBKOXwjBK3/s/LiSM79hNOvFnMc+vxEZ8B+Ppeuk?=
 =?us-ascii?Q?pwWJCAQ/VOMrgmZLYJiOVjXl0rN6kxn8rt3Ad+qq7/b51Vb5GTyEQgZhZ/jK?=
 =?us-ascii?Q?sXr23/eihbGFmq62jsuYUtSWI74Bq54BzAV9PtuX7FKpV+du4MO8JRcyY243?=
 =?us-ascii?Q?PqFJoD5j8RTb07TA4ZnIR9I9qT2mhyx709VOJhbMgMZwFUjCPO+IFT6Pe3hz?=
 =?us-ascii?Q?8eOFJy3u5NnZpQ/fdv2tg0LE4memglqLqd5BBFFSRpMF9YsakzXHySejJBmK?=
 =?us-ascii?Q?WismeIn5KgNdIK2WNW/ugD9jLkKDRTFzEMwkNry+X4kEfrJ3fljlzbl3fg2B?=
 =?us-ascii?Q?YFmuo7Nv8NlqgY5xPT/XJPIkvcWvXcWW+Bl/w6alw4Y9OdJfTAynUkRh6roL?=
 =?us-ascii?Q?og6Z6GRyZnMpaYQMPdaKLSEjJ36YATTsmyLCIHPvEFRGP1LoXXnxW4cHSsHc?=
 =?us-ascii?Q?3E2hItI/C8YkJZrYVGzxOn2duTz/Thu7vdB8vpCgjBLXu/S54wZ2z9fY7Kkz?=
 =?us-ascii?Q?Cug3pD+RaX251vEIOEmQsSGaAvHb0BndCVjQzNMsDrlMo3Pf/V0mGalC8Ii9?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05267eb9-f123-4bdb-3d55-08da63dff4a5
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 08:24:36.0454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUc5lER+PmpgbEXyuVHdOqpP3atu9M3VUwINy9qQN1NXY0EjshyVxumpyy+6iQJpf9ZA0olZratNYT7X5IgM/9JDQCNWfpbxiUDDWjSjGrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0330
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CDE13A77 smtp.mailfrom=francesco.dolcini@toradex.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset=WINDOWS-1252
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

Set the i2c_adapter retries field to a sensible value. This allows
the i2c core to retry master_xfer()/master_xfer_atomic() when it
returns -EAGAIN. Currently the i2c-imx driver returns -EAGAIN only
on Tx arbitration failure (I2SR_IAL).

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/i2c/busses/i2c-imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index e9e2db68b9fb..26738e713c94 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -54,6 +54,7 @@
 #define DRIVER_NAME "imx-i2c"
 
 #define I2C_IMX_CHECK_DELAY 30000 /* Time to check for bus idle, in NS */
+#define I2C_IMX_MAX_RETRIES 3     /* Retries on arbitration loss */
 
 /*
  * Enable DMA if transfer byte size is bigger than this threshold.
@@ -1477,6 +1478,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	i2c_imx->adapter.dev.parent	= &pdev->dev;
 	i2c_imx->adapter.nr		= pdev->id;
 	i2c_imx->adapter.dev.of_node	= pdev->dev.of_node;
+	i2c_imx->adapter.retries	= I2C_IMX_MAX_RETRIES;
 	i2c_imx->base			= base;
 	ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
 
-- 
2.25.1

