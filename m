Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D41462B41A
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Nov 2022 08:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232391AbiKPHok (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Nov 2022 02:44:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiKPHoi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Nov 2022 02:44:38 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2082.outbound.protection.outlook.com [40.107.21.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED2BD114;
        Tue, 15 Nov 2022 23:44:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fO3UoCa9b9jH4029lXtwsUhFyd0zRawTdE4TL0pnrlKN0SunPx7Q7KCAACEHtvwzzM3h6j5on2k83rx2ZZUVt6UKm4K/uiY8vlaaaVQDInoSa+a8UgT1gjFMy3zpsSq3NsYeIRZ4Lh+RGFgTYLytehq5tuD1hUnCq0Vi5vnvjwFScRrC/a6BcK7vnMUDakJ5JiBzI9JmMKublpsTRfufT3HVK+3BdDBFROEnF9gdHvjVwV1Zv4b2xhl5Ac4lp+pwvDrCTxUUN0xzJ7N1ee+2aC1A2HfTdT5urUI+YKH4YukyfdE0eLRmQ97f4cxOxXHy+zn5QtdlY+FGIYOJ8sh65Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHtlLYxsunn5U9pLs01PyFml2e9tX964KBk5M1O9Ui0=;
 b=BnXDgAct7tDhw/BPvf5cAfC0tHmgbSRBDlbPLvttm9loYV5o4VuSicew1FtBEm7/d0Ljh493vrSU056vKO609x1kPYwzKFFSBQMX196tPCvs4z8ZvCX/QqDRVtoc3qQOLv4KgeEulDvsNv3XG4vTaS28PcmNXTulokTJgaDDxyk5ADmaBPJWztUpUrxKrJXbkf2+6+E93waCaAj7EEDpc0DtBMIxi2nZMqPZCEsrzlCG+ijyS20or3kxnNxdzSa4LADkgxFwG3SnMA/WXFkcsSRYkddy6J40pfSsrQ85iw1cPOXCxlPuzhFcJG3QPxraPB1lIL9Se/CH5ueRX4zuPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHtlLYxsunn5U9pLs01PyFml2e9tX964KBk5M1O9Ui0=;
 b=jI9uMfuLN1Ph1lXxejSRPR8e08BjU3QVd5Ih2IE55sl+d0FKohpn36D5qlhWlplFXoCFfgeiX3fKZg7qNXN6M2y1v1dWrE0lkB/dKZUpOs22XNAsSiRWtzBWHorxzhTqMN/iRdKpjxKDh8Oppa5Pxp+LwfIPG6l5mGnfGT3x8Ho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from HE1PR0402MB2939.eurprd04.prod.outlook.com (2603:10a6:3:db::18)
 by PAXPR04MB8318.eurprd04.prod.outlook.com (2603:10a6:102:1c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Wed, 16 Nov
 2022 07:44:34 +0000
Received: from HE1PR0402MB2939.eurprd04.prod.outlook.com
 ([fe80::d8b1:a777:e29:7a5a]) by HE1PR0402MB2939.eurprd04.prod.outlook.com
 ([fe80::d8b1:a777:e29:7a5a%10]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 07:44:34 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     linux@rempel-privat.de
Cc:     kernel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: imx: add irqf_no_suspend flag
Date:   Wed, 16 Nov 2022 15:44:31 +0800
Message-Id: <20221116074431.513214-1-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 HE1PR0402MB2939.eurprd04.prod.outlook.com (2603:10a6:3:db::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2939:EE_|PAXPR04MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 23ea7728-6259-4fd7-d113-08dac7a66658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2gHtEA8Jl8y5WBpBWKfvJV0PhD3ySsFzXDb+lEqznyVKbCWDwgqK3YS21SFMtsIk2qZS0yIFlvDNv/Rs5W9X8DfAgNDPQN3R94/pwKsLzsIQER+Oa1+0sUG7cgrOOZuk8ArNt57Gg8y2qqNZjHNpuzgIJMfJvnPO8ThN0mJXDcBrpJ/jOyVKuqo4q4kSK9tFkg8EwBaJVMbJJbqEMujRcFydIwTzx57g1IupBB+EmtF5MX6Yd7aHggRQudSi0h8KR+Bi9a7IXeauD2sl5P+hvoFUUkcwnSS1mLk/Knyv9Ltve3TJmwt7k+M4qecfE9WEs3CPWdwNnYlVidKC7EHgEImkSjk6KPFA5NJWFceHNLMGO75NGwxNgyx/ZmKFHnxAW6ndUru+R6AnHvxxMHf5OtcS3yMJA2IQCvqTZYjxaS8qvQGPx3LY8b/PGh8tH/kkMpQ/0CLzXamAy0Rq+A8M6ZCNZCBLM5zsEXT+huoNe3lR1iU3M9hMkwmhk4otW0ZSy8tp1PN2i8z0+0T1rAP0+KggRMCAJOmUDwWDmoG1UkIbLbj10VfgWWCaniqn6RxCV8ACxPNTnTQO5Bns+hM6dguCwf0JtWkMTj0LPAGyWFVVn2+Y/JJCz7KsSmwpF0ICqeLXPb4eN26NZy786dXQrXxoiZIF3NFL2PV+vjlAiHvAR9Gh1SpQfnLya9Ddf5c885QOYk0Ds2G7mJoIsDcGBg6rqCXwwnEa60FeiO1zC1Y9y0/S2ykQKV6zds38vd2FpQhVv6agGB3uolhENV48+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB2939.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(451199015)(83380400001)(86362001)(38100700002)(38350700002)(8936002)(4744005)(2906002)(4326008)(66476007)(8676002)(41300700001)(5660300002)(66946007)(6666004)(6512007)(6506007)(52116002)(26005)(2616005)(1076003)(186003)(6916009)(316002)(478600001)(6486002)(66556008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CnZl0jlpC/XPp7vToIiYMLskpIoUZq9JhIRRE3Z1qST3I/uZH1T2sYBoPBm4?=
 =?us-ascii?Q?Q630nXVe4JER4aIE7l2lMDwSRpTg8WViWyt3vT+kT0JIFsKMTDnMIN+vMydZ?=
 =?us-ascii?Q?lD2QO/Qhx1D5gz3MsbSW0BJXYEf35zKONhkEzqt1fH0DPEq4DgVenyw0OPVV?=
 =?us-ascii?Q?B3GxkdTTOvbhZFulFjFOiOSq9UxkVnDdkOf0pK7WY5BEnsDr5nN76wB8RCkx?=
 =?us-ascii?Q?xfwEmTX9aKeMj0bi6q4kyqQy1iRhPDgVlfGpd00/czBOOrz1TkcsLoVESlTR?=
 =?us-ascii?Q?Y8TxGx5G7qMqcSYequRksTrUPOdIOnKhD2dM++Di135ByY1nyp/Mmet42L4+?=
 =?us-ascii?Q?sCKl54fZsU8mb1GY5NHGpjzBAEDM2cavsKI7S2Ki8AR0VsdMc0laY9EmcLkX?=
 =?us-ascii?Q?PN8sYoatzeQm53d5d8YSAmSHOYjHG4ODz3z/5NuhiBhn595ekZmIq5NrlPIX?=
 =?us-ascii?Q?EMDgNdPGAC3OKTxOVPdhB0OW6kpUpo2VM070c98ig1CIN3b96/9e3lAw/SvX?=
 =?us-ascii?Q?d629J1Th0lRcfQ4ixJrmijKLmew0iEXty5Ic1bAux2Da8MkZs12nuhydUqOv?=
 =?us-ascii?Q?c15J9Sa8y5wrDK7sF9ebi98g5RhH/NW+LRKD0AQHJ/jlu2sxMIn4jjEJaxfj?=
 =?us-ascii?Q?SAMk8LnDKwRH7XbJ8E2ZrEC+v/RvZsMI5DUxDWNajwrLUgql8Yvq+IgukhCK?=
 =?us-ascii?Q?FoCEDe6STyODVVbFUdMFGtI6qByevhyFtWzQvLigenwlLb4owkae2KQJzeMQ?=
 =?us-ascii?Q?pDogkDKzcEpXi3Rl94oH96p/fZ05FibC9EXMb5bXAQwHIbuHSrxPsjQSR46J?=
 =?us-ascii?Q?niOozLG8uaKM5Bi44wXppXhyWKyiSktkpLWUOt0f8V0EHz6YZb45tsQVIf9e?=
 =?us-ascii?Q?ifugaXDXkBwwjj4Vfd5K2QlZ4zgWah+nHj7ZT61BxGXcjvrwFqXfeUa8Sx8R?=
 =?us-ascii?Q?MZ4+0mArincvpmX25I77a9qqEx3/f6GPzU9U7OzZwj/hklwU0ZS7b7RpVEkj?=
 =?us-ascii?Q?wnVrn8tShcJyx8t2Xwt5JmYoQ5GHnUqOtX6FaGQzrAYJ0O7SKvLriQAgJP93?=
 =?us-ascii?Q?9r1L7/gHd8jlJ0Kq87wU87pH7HNloQsVYlkBo+vYInOjJDj8+UrDEiWaGieC?=
 =?us-ascii?Q?ssv4YlB4RwLnImD9jpl4/eVtYuOF5tmTKT3cgjY996jMH9pLtcKkUpgLzZBV?=
 =?us-ascii?Q?36nVRxtB02YJwGOyhcR9H0EN0YALcOCnvJKGlq20u8ti2VdnBQx320bsPh5Q?=
 =?us-ascii?Q?/pdrPzckOiw0c9QCzjrB+Q3QYDxsFgYQB9Vy8F1JnlUJMIGWTqMusnXs6Sxb?=
 =?us-ascii?Q?dQgauMN4XJYd56d4xFU1v2YnjFgKXba105drbAZ18fF5w5mbK9fdciY7OG6f?=
 =?us-ascii?Q?deOub8b+RhIUtX5HeqlNUYFxtOtcY9MSzJF1PUdnlk9qh4aw6tKM1SLh/zwg?=
 =?us-ascii?Q?3cqAxbEZp38H0ulOZzJNa11/LY0Vz1vIHZZIUKqvhZlI7Yfk3wKAIwZstSfm?=
 =?us-ascii?Q?6IStm1jfKmqbLhZ6iWSMDKGdvbUrH/zszeqwkaH9njaP8oJBwI2Eho1Bx09R?=
 =?us-ascii?Q?psikcPNiQ+HNOfF5OAyhhA2Juf3586WUmU5nStcS21DoWVggZHmzrfej51L8?=
 =?us-ascii?Q?2g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ea7728-6259-4fd7-d113-08dac7a66658
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB2939.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 07:44:34.5064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vcnSUmVbwEGEKQ6RB8S2XUoP+bm6sbtyp8Or74l5p+gtrYcBkMBqZnpiTJhGmZySko+vLUKRY4kNTBmD6dGr/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8318
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2c irq is masked when user starts an i2c transfer process
during noirq suspend stage. As a result, i2c transfer fails.
To solve the problem, IRQF_NO_SUSPEND is added to i2c bus.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 drivers/i2c/busses/i2c-imx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 1ce0cf7a323f..ba49b2f7a1d1 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1510,7 +1510,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		goto rpm_disable;
 
 	/* Request IRQ */
-	ret = request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
+	ret = request_threaded_irq(irq, i2c_imx_isr, NULL,
+				   IRQF_SHARED | IRQF_NO_SUSPEND,
 				   pdev->name, i2c_imx);
 	if (ret) {
 		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
-- 
2.34.1

