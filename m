Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 488BFF7889
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2019 17:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfKKQPS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Nov 2019 11:15:18 -0500
Received: from mail-eopbgr740088.outbound.protection.outlook.com ([40.107.74.88]:42405
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726906AbfKKQPS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Nov 2019 11:15:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTT+MQpmml4e3XLlWejoG0GkQT2S5/5oOlx6sAW3WfMHNP2JuKrwkAmBABs+KGcWzz6vymX6TWjdQnvyHRr1DyaYlLNAEHtfVRsjqGSGGT/jPZl7Oikyy4zo8FhkBxlZ4BXs0/vquhlIuuYeCjrdIoOQrlqZtx5wtN6q5xDe2WuXbeq/Qnnh7zqV5HsDCqgSrffbjpCQ5sdPLzbWm70PCWtRCYao9ST1D4IfglXRgFhl1KRmNQS2ubOfmak2hfI2Lmo55sNJbZRHXo2RVbz2MYzZvofWUgFfApWgyq0wX37VGeqOsv+elJwcXOyF9ruuk2X/hC37f9RgAh189uoKZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JceQJQmuMlsibB23uBXUNdBy43kiPKtp1whcLxKZbg=;
 b=gUXNZENvHeeVGMxFzb3SyVnEQ1403Vao4G0hDzvwsZyfSZEb3fi4vEyniofZ3vzx4QjZ5Fw0jw2ndCH9febSsMSkvpeC7ACjzElobjBgSp3/7E5YT1kQhfQ50ZE753jjD7P5UwgWHy0jeupe0++QH5GjqCjHjKCcr8upN2+kR3yj40K6RlWePoc+kAqoKGdSlN3RzeMnFgOmoheFikLPgZFYH1mfEQfNICcUw6hV0+EtF+84htNwcZvKPC3vTkJNLFBF8GaJMhu8a0Eyo0VGzhtOLAztEbDKJtpt2x2P395ZCDZxrzow+voisXeWc6Tprmf6bZCkRPDv/6BcWtf4xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JceQJQmuMlsibB23uBXUNdBy43kiPKtp1whcLxKZbg=;
 b=zQ9LmirZysEA7HAojRTBedn0ki7qte2oGyUuGl9ygtp0YJ4D2Qe7gnRNg64wvfPEX25Wh7lbWcmcRfZimg4oFsEmlUTM9fc6xkFUaByCBWSHD3280/y6Oq0UFwz+nQnba0ZsakvFxzDvCySu7ogZxKgei79WFMvpQ2deUrqvSkY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Akshu.Agrawal@amd.com; 
Received: from MN2PR12MB2878.namprd12.prod.outlook.com (20.179.80.143) by
 MN2PR12MB4287.namprd12.prod.outlook.com (52.135.51.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Mon, 11 Nov 2019 16:15:15 +0000
Received: from MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::305d:cfb0:baaf:7008]) by MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::305d:cfb0:baaf:7008%4]) with mapi id 15.20.2430.023; Mon, 11 Nov 2019
 16:15:15 +0000
From:   Akshu Agrawal <akshu.agrawal@amd.com>
Cc:     akshu.agrawal@amd.com, cychiang@chromium.org, rrangel@chromium.org,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Brown <broonie@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] i2c: i2c-cros-ec-tunnel: Make the device acpi compatible
Date:   Mon, 11 Nov 2019 21:44:28 +0530
Message-Id: <20191111161431.26293-1-akshu.agrawal@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0075.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::15)
 To MN2PR12MB2878.namprd12.prod.outlook.com (2603:10b6:208:aa::15)
MIME-Version: 1.0
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 44aa10e7-6a01-4b49-905a-08d766c2560f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4287:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB428765AB7D5933C2AF8A149DF8740@MN2PR12MB4287.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:270;
X-Forefront-PRVS: 0218A015FA
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(199004)(189003)(36756003)(8676002)(54906003)(7736002)(8936002)(16586007)(316002)(305945005)(6486002)(6436002)(81156014)(25786009)(50226002)(1076003)(81166006)(44832011)(5660300002)(66556008)(4326008)(476003)(66066001)(50466002)(52116002)(2616005)(47776003)(51416003)(6506007)(386003)(486006)(186003)(6512007)(26005)(2906002)(6116002)(3846002)(7416002)(1671002)(6666004)(48376002)(14454004)(478600001)(66476007)(66946007)(86362001)(99286004)(109986005)(266003);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR12MB4287;H:MN2PR12MB2878.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +B2fNf5F2NyBgq4pGv7fptbxpuZGdkVPRRdmn/ZQX15j3WFtgzFpf3ZEI4vGAQOES2Ea92obV5+jFkjw0EnA6pHeAcE9rUJsxNCoW30pnoI0REPPrZxwL8rWcTBKC5hyk5ZV4gM4J2ZhimRavNB1rtB1YSPUnHf1MRxa78wkYxoJSpxoZ78TcZglog+PdMrYBzk7e0A6b2JskBPWRBqDQZ5j6COPIKGZ4Vofe0nLJJY8sPuPre4gEEgVHnQGfVkHWo94v36zQP2i+NtfkJTh6+fhhIkU4q2qIew1fglh7ZKJpjMUhw6jAjlYCv64H+Squ7lRZPTQq7a7O6iJPGQrNjovd7MXqK2IlVGYu1o8EfXAzAE+iByWtFbuQKZEiCb4YF6yA8GjJDVisd6ROsX6BjSUYabvuI0DfJljuN5/ezaus2cJbXy/nK1AudHJr2nd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44aa10e7-6a01-4b49-905a-08d766c2560f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2019 16:15:15.2502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szX6LSn95nwkv7P+nUvkvAYfDn21xEd1CaSNv0Gfnyd1vHimKxlNVRQSB0+mfLaIYxlek6rO2OlZ9+8kBNRjxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add ACPI entry and use device_property_read to get fw value
which is common to both dtsi and acpi.

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
---
 drivers/i2c/busses/i2c-cros-ec-tunnel.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
index c551aa96a2e3..958161c71985 100644
--- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
+++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
@@ -3,6 +3,7 @@
 //
 // Copyright (C) 2013 Google, Inc.
 
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/platform_data/cros_ec_commands.h>
@@ -240,7 +241,6 @@ static const struct i2c_algorithm ec_i2c_algorithm = {
 
 static int ec_i2c_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	struct cros_ec_device *ec = dev_get_drvdata(pdev->dev.parent);
 	struct device *dev = &pdev->dev;
 	struct ec_i2c_device *bus = NULL;
@@ -256,7 +256,7 @@ static int ec_i2c_probe(struct platform_device *pdev)
 	if (bus == NULL)
 		return -ENOMEM;
 
-	err = of_property_read_u32(np, "google,remote-bus", &remote_bus);
+	err = device_property_read_u32(dev, "google,remote-bus", &remote_bus);
 	if (err) {
 		dev_err(dev, "Couldn't read remote-bus property\n");
 		return err;
@@ -271,7 +271,7 @@ static int ec_i2c_probe(struct platform_device *pdev)
 	bus->adap.algo = &ec_i2c_algorithm;
 	bus->adap.algo_data = bus;
 	bus->adap.dev.parent = &pdev->dev;
-	bus->adap.dev.of_node = np;
+	bus->adap.dev.of_node = pdev->dev.of_node;
 	bus->adap.retries = I2C_MAX_RETRIES;
 
 	err = i2c_add_adapter(&bus->adap);
@@ -291,19 +291,24 @@ static int ec_i2c_remove(struct platform_device *dev)
 	return 0;
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id cros_ec_i2c_of_match[] = {
 	{ .compatible = "google,cros-ec-i2c-tunnel" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, cros_ec_i2c_of_match);
-#endif
+
+static const struct acpi_device_id cros_ec_i2c_tunnel_acpi_id[] = {
+	{ "GOOG001A", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, cros_ec_i2c_tunnel_acpi_id);
 
 static struct platform_driver ec_i2c_tunnel_driver = {
 	.probe = ec_i2c_probe,
 	.remove = ec_i2c_remove,
 	.driver = {
 		.name = "cros-ec-i2c-tunnel",
+		.acpi_match_table = ACPI_PTR(cros_ec_i2c_tunnel_acpi_id),
 		.of_match_table = of_match_ptr(cros_ec_i2c_of_match),
 	},
 };
-- 
2.17.1

