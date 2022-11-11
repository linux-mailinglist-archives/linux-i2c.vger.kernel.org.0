Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1486E6257D0
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 11:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233701AbiKKKQu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 05:16:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233626AbiKKKQl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 05:16:41 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F5BEE35;
        Fri, 11 Nov 2022 02:16:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJMoExpW3R6kOPZkjEtxtI+or8hOe9J1snGMDhGLvpuems0D4OJSjMpDWmZ4W+42Z31MSHwk4EssS0eF3lWx7jecYgILoeKxYf8adALbZhKNCKa4eRRJftGU7sRTVj0h75R1UIa5dNbSyGk8MQGb4jKfdf6NPhobrbk5rdpm2A4u0cuG13eTlMbJAb/+4iy0JEJhROO6jcFF92DHR6NRUYvNZImTb+3oPysoc7oy5Sy3jTbhbFExXclsgY5XSXoRkbkDN2SodgA6pCXm93GNw6ZbzBr6XTJS/VjqnyYREEjtMV9WrI2vh1WQOtrODRx8EjS59CWb7hyY/P5i7Cjmnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1WFLBMcmJiMRny9OFkUHtiXOo6DomxM14rfPSsEmTQ=;
 b=Mo1FaN74mTqGXcUGvJqhxRah0J7XNTDA5Nl0lOXzrmVKhu6Iups9GMf+g6gAkrstQbCEPbaPkdZIYZqNImvxvxlEVmwKKluTl0EBCeMCV1zYUg11erddRbalBEA6sKwuKNsbJ8CMSEn08gy3ada+e4/FxT3EceLpPW5/HU+sj+QvpdSumj9UqIWAWZNN2zD8z1/cKHkMV9rAwxSdbENeDDYbAY3+2Vid0K36w/LUg5462U73HOybCq9FiViw3iO4fTfOg6maKHXJYU6hRIvnyRMcQeV21protrS6MM8Fkf88BkzpFjou/N3U3AgMHjx9Z7Ccf8I0sZl0kBmCj/T4zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1WFLBMcmJiMRny9OFkUHtiXOo6DomxM14rfPSsEmTQ=;
 b=uZqkiZUArWp7ZcV86gBVbI2AdWUpiyn9k6D7M95Ew5oLA7CAUMl6y5j/pJlPvJxe8TwAQW9h8HCMYvHkJTdOgEjDqrl1qJvWOwSWgAPcQ/CxcmVBUaql51L++39kpHdZ+Q2WKXH5rb2+hubYbXwnqqp4E8uvKbleuCHOxb1mwSy6yglP4ASQO4AOw0a6/TZawreKK60oWjgsYWAb3olBWzU+4nMSEqEFQgl0ouNRuwSlZeVz+i1zbjt9AQ/kNyL0aTrEDhWSzeH47XyizPAGKR0Qc+vy0yf0+TCEu+FXltk/OXtag9qMwSraCyNCU4iAAqBGgNlsgUD4nuf09PPN7Q==
Received: from MN2PR14CA0018.namprd14.prod.outlook.com (2603:10b6:208:23e::23)
 by DS7PR12MB6288.namprd12.prod.outlook.com (2603:10b6:8:93::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.25; Fri, 11 Nov 2022 10:16:23 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:208:23e:cafe::cf) by MN2PR14CA0018.outlook.office365.com
 (2603:10b6:208:23e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Fri, 11 Nov 2022 10:16:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Fri, 11 Nov 2022 10:16:22 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 11 Nov
 2022 02:16:03 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 11 Nov
 2022 02:16:02 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Fri, 11 Nov 2022 02:15:58 -0800
From:   Wayne Chang <waynec@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <treding@nvidia.com>,
        <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
        <heikki.krogerus@linux.intel.com>, <ajayg@nvidia.com>,
        <vkoul@kernel.org>, <p.zabel@pengutronix.de>, <balbi@kernel.org>,
        <mathias.nyman@intel.com>, <jckuo@nvidia.com>
CC:     <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <singhanc@nvidia.com>, <linux-i2c@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH v2 05/13] usb: typec: ucsi_ccg: Add OF support
Date:   Fri, 11 Nov 2022 18:15:01 +0800
Message-ID: <20221111101509.999589-6-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111101509.999589-1-waynec@nvidia.com>
References: <20221111101509.999589-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|DS7PR12MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: d7ce9eaa-4e77-420c-c73d-08dac3cdc8be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zWYWlXWM6JIOL4qmA4r+OO7bzN2vIh+76ie88yS7KdDQg94SJBW00xVf5uFbd2nZNGmZt1gzVbdVm52N2uCqzfTihtb1JvxSajKshQfEcU5qqkD9sFs/NpeXSQtqUPer3oQFuec8MxqutqttPjIe4G4g6T8v22eaVZlL7YdhnDHCAb/PmCeAclHaIXdMHCiEDCeO9W095fYHJOidk3TJWSK+CKiszUOrN4d7CJGA9CT7DtzRhhSsVzbn1SGrI3qKheLzZ8mDDlj3qEYwoPlULaLBP3FGcNzadDwwa8FAg7dtC6U6gqOlJgc5BErC0Za0QSR7VxB18BHF+FcAnU3d1O1pBbDSqta/sKgJvW2mdOmYKQ1uV0IWipVFzWd8O36lzL+pKCRL1I0rIIG4mTko1BrjgsDgeysRX421rtQcI17rd7H8F0hOLunRT5KBnEwek4H1I9Xlc/Pi/brjS/lbJVYkJ0Lo1NFwG35jNx++qyVcZ6e1CTUnfkP27mjQgNsPteFzGIHNn2YEzdyTrxl50OIhOqJS303smDPHkiYT8FIEODsA80HESArFUz+wQuQhilKa8K05/4l4CJR8kHBA+lkkAjPYUQ/z9cfAyDDzovGq+Jjq5UtxnTTZQdFLsQ+GOKzzqDsbeei8KWGHgTGLzB+1XHj2GBc4qexRctNz+yf3VkG6CqPort0RFT79TekUpBuOivhOvvr2knaKnS3EqoZwvftOlTwsxHKX0qxKSgPIfVGarcfPYvg+yNmrWYUweeO91ng+DNSE+G6KUUSOtR+fN2tZ3Lzdz5wGSirVlmY=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(40480700001)(36756003)(478600001)(26005)(2616005)(921005)(8936002)(82310400005)(82740400003)(36860700001)(86362001)(356005)(7416002)(4326008)(70586007)(186003)(426003)(47076005)(7696005)(7636003)(8676002)(336012)(41300700001)(1076003)(40460700003)(6666004)(70206006)(6636002)(2906002)(110136005)(54906003)(5660300002)(83380400001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:16:22.8129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ce9eaa-4e77-420c-c73d-08dac3cdc8be
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6288
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The change enables the device tree infrastructure support.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V1 -> V2: nothing has changed
 drivers/usb/typec/ucsi/ucsi_ccg.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 835f1c4372ba..139707a2f3d6 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -643,7 +643,7 @@ static int ccg_request_irq(struct ucsi_ccg *uc)
 {
 	unsigned long flags = IRQF_ONESHOT;
 
-	if (!has_acpi_companion(uc->dev))
+	if (!dev_fwnode(uc->dev))
 		flags |= IRQF_TRIGGER_HIGH;
 
 	return request_threaded_irq(uc->irq, NULL, ccg_irq_handler, flags, dev_name(uc->dev), uc);
@@ -1427,6 +1427,12 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 	free_irq(uc->irq, uc);
 }
 
+static const struct of_device_id ucsi_ccg_of_match_table[] = {
+		{ .compatible = "cypress,cypd4226", },
+		{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
+
 static const struct i2c_device_id ucsi_ccg_device_id[] = {
 	{"ccgx-ucsi", 0},
 	{}
@@ -1481,6 +1487,7 @@ static struct i2c_driver ucsi_ccg_driver = {
 		.pm = &ucsi_ccg_pm,
 		.dev_groups = ucsi_ccg_groups,
 		.acpi_match_table = amd_i2c_ucsi_match,
+		.of_match_table = ucsi_ccg_of_match_table,
 	},
 	.probe = ucsi_ccg_probe,
 	.remove = ucsi_ccg_remove,
-- 
2.25.1

