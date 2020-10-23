Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74441296B19
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Oct 2020 10:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S375948AbgJWIXw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Oct 2020 04:23:52 -0400
Received: from mail-vi1eur05on2085.outbound.protection.outlook.com ([40.107.21.85]:31553
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S375928AbgJWIXv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 23 Oct 2020 04:23:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5nttqi5UH8O1A7y9TrdN1h1JQmFXKBhAtJZOOxcnva5heu0mHrT7rUXg0TqBFkfxWwQh0JUaNg5GbhJOZutkHbWssTRJ27XOprfNG7DR4cCzitKisgvqFglkJ/i9CE3qHuI4A09y2py1AF1bpjIaQitpTrTvx9+mLJr5CaJc9kYXtOlr5L6zG4QEqhP9ot9+jPT4C7aIeVuqQGuPH8SMPIHDUnHxD+Zdd4p/3ZnhPfZiU6xjB/Y3nsCVgAyVVlRzrTTyaCpGb3bny6beJijnvzTleFuCAR0dCwKkDfZt4D61JKA+ijm0tRLMooqWpn09gTSSHJOI43GEGbVolOpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WK9FIW8Y0kLYbjRihWsgPm9JeGJlETCHYwzISFMc9A=;
 b=DUXdc82zoLIUzgTCIOWeq8usfGuW1tf3ThgX9Rd3CTlbrJLxPvKGdtpleb1dn4Lq6AXj8zO4EZBU0kObMHJXhEiUZ6VxcX+bJnf9YCR6VSfU4n/3wdj4IQsdt2DWKD1dQf0nkDPN0bi1HcmbgqV1HgIi1XzzcNAGGNJ0IZaBUCmfMRQ9BqKbCSjIgFNM0ZObLdoAkT4kuA+gF+gC/Nmc7Eh7+IRtl7nPO35WyVUsNWQqniMY5CH89aQgIZqRj6GV4e3kG7s9xhaB4rTJPv0B9F4HhPUGt/+CrvilQl5DJA4fQkEkOqA+zDs5hiJjhhmUCUMqMht8RSUOjgY7xjCiZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WK9FIW8Y0kLYbjRihWsgPm9JeGJlETCHYwzISFMc9A=;
 b=qKjza1FL/KnfDGlLNhRcCakEBaNyyWSzNblSD2Sn7wTFm9GgB8Enzg0MrsMrwPBhCYvAQ6Hj2SM/FWf9rW4VQgbldUf6sM3Y1RWhRrtyozXgWTfimrN+0tMdW9vkwgHHxEbglx9/dv4IfgBLPa6RakQA+sfTV+rDW8U7Qu3ZlQE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5465.eurprd04.prod.outlook.com (2603:10a6:10:85::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 23 Oct
 2020 08:23:46 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef%8]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 08:23:46 +0000
From:   peng.fan@nxp.com
To:     shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/2] i2c: imx: remove id_table entry
Date:   Fri, 23 Oct 2020 16:18:23 +0800
Message-Id: <1603441103-17735-2-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603441103-17735-1-git-send-email-peng.fan@nxp.com>
References: <1603441103-17735-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0148.apcprd03.prod.outlook.com
 (2603:1096:4:c8::21) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0148.apcprd03.prod.outlook.com (2603:1096:4:c8::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.6 via Frontend Transport; Fri, 23 Oct 2020 08:23:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7ef81973-f2e3-44e8-3697-08d8772cf607
X-MS-TrafficTypeDiagnostic: DB7PR04MB5465:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB54651A06DD27FB8EC322ACF7881A0@DB7PR04MB5465.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KweILz34xKFfuPjS3rh7oG2zmlBYAScDK63TZdDt+vGyKnlk/GaisH0WIezIU8gUb5aiUJd+Z8C5Ci2IzjuTvmJdxfwrFvpvwsQP3GIi9oO/3aKORuSzmmRtCM/T8kTiSQRVFcbYy3bC3imLVl+hKzUSbeExVK5Q/6WKLUmk0ssqldNTSZb8WVpuJDzbShCjgXnE3RNqf5Z0zf3Ae3OSO6baaAsSjIoUHPhf5+pfr0oZzbfBu0M5t/JRIDBr2V4WiMFBPNpQ3nXn+zPMKLgotfxNBaTV5em6W9iO9g2Pd9cuCvlNV7/Ev7cSPF4GEeMO+DmpYTtbsqJeYhWLFr1NqFsSAn1wedymkT9j3tBzUft4QEycs1YtNF+8OD0oql2c
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(6486002)(83380400001)(956004)(186003)(26005)(316002)(2616005)(478600001)(2906002)(9686003)(36756003)(16526019)(8676002)(66946007)(6512007)(6506007)(69590400008)(8936002)(52116002)(4326008)(86362001)(5660300002)(66556008)(6666004)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: /3s+51ik/2PwEbaYviBouDuH6KpSINUMVKxlTCLQdTIyaTa1+9eiukjy8gRHGYPYvzPKl0sNclJPfEp8YLfzzBxT7h0OlnPbpzlUJt6cdGWpmMxp7lD7hvT8qc9QYSIVQU5sf2BSpVChOpoTjfjVTDpr7ALSyZOL1IPvTKuRBtgOHYdzbF++CEOqjKN00NWxso497UNrxF1pwIarEKBQ6VQcUP4z0laLgYJxx3Lj3ffjvQ+dwusXsD6uQYVE4p4ulYB26ffnAdHOAPX28i0NdZpfsY2FSGe+GQdrY0Yvnn6/w+q/O282dpl+oDSr9O5Kj+1dHvnm0b/ffDL8QEbZBaIpSPPFQBPzaXeC12uCb+5l5Rhb37P1BvjXiuUukJe8wPDPnsG7tK9WQQe3IMtQ01ZIxvWz69/ZyJCqx+6nTaxe48I2dn6nF0LuUtdNroh0eg3WMBeym20sfqL92EE4xAfz0RbXYIlarmQdqokdqR3xlAy/14o+NSYIPz95rK9+zlZH1NR9ZsuQiVBuG5bH2wr2/AWce5fmkqMjdXzP98ow0HxspArF+WaLmNiBupUr2+U9GSwmLgbhTfzj2duGaXi3dO1k4/EJchZsv7jphEutHoKlGUljatyNNNPZq1IHFExcuoWACZjBwK/wjsr4vw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef81973-f2e3-44e8-3697-08d8772cf607
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2020 08:23:46.6577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udVElxd/maEx15cO8euN6TG2h3G+5O7h/H+TcaXo5T89rdQX1IyxSfGPlznAhK10/f1Kr399E6dl6t7y9M/frA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5465
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

The legacy platform device code has been removed under arch/arm/mach-imx,
so we no need id_table entry here.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/i2c/busses/i2c-imx.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ba9d639223ec..7ea36a78abb0 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -233,19 +233,6 @@ static struct imx_i2c_hwdata vf610_i2c_hwdata = {
 
 };
 
-static const struct platform_device_id imx_i2c_devtype[] = {
-	{
-		.name = "imx1-i2c",
-		.driver_data = (kernel_ulong_t)&imx1_i2c_hwdata,
-	}, {
-		.name = "imx21-i2c",
-		.driver_data = (kernel_ulong_t)&imx21_i2c_hwdata,
-	}, {
-		/* sentinel */
-	}
-};
-MODULE_DEVICE_TABLE(platform, imx_i2c_devtype);
-
 static const struct of_device_id i2c_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx1-i2c", .data = &imx1_i2c_hwdata, },
 	{ .compatible = "fsl,imx21-i2c", .data = &imx21_i2c_hwdata, },
@@ -1340,7 +1327,6 @@ static struct platform_driver i2c_imx_driver = {
 		.of_match_table = i2c_imx_dt_ids,
 		.acpi_match_table = i2c_imx_acpi_ids,
 	},
-	.id_table = imx_i2c_devtype,
 };
 
 static int __init i2c_adap_imx_init(void)
-- 
2.28.0

