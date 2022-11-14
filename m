Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34411627E12
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Nov 2022 13:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237244AbiKNMmF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Nov 2022 07:42:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237285AbiKNMl6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Nov 2022 07:41:58 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF1A324F11;
        Mon, 14 Nov 2022 04:41:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbG4vcI6+fYQLS8llk0Lr8SN92oUdJLLJWcdJ0KEDWOpzEZYeqYq1gPWtzZN/KGm18EnrP0XBW5QsmNLrCTmuSQ0X942HdM5caeZcSIUvtWzkNjgf6GNHwquxfz6V8aMBjNXbGa9lceX9b8TXm/zKTZr6J8KxZjYRDeQqpvK1og4r7Xgu3do+dQ0P2SIuOCbuLteZVfhlwmLOMYUhOFxCZypsZK1CYVEKKbguO12NMY3HNfpfEVkm7dlEc5KKtwKNaldTnDFbM7aAjIiXFtFScjsiulSdpUY331EkL23OYJx/GQ4ks1eesE2N7eEZlTrhCDg0bdV5qdvp9AlVcOcHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=407wchOupEBkulV3GatXbklaGC8/7vbFfaXacf3duDU=;
 b=Mk6hGPI9+evcNxXA30eiNExmbO4ELBafGUZuwiS85U+bbmoEjDNGCQRYe1U0bhXK6vYZ5K7wKTzukl4vGgI/28OQGkTx4TKko2/datY7l82AbAK1JLWpiX58b/KUBvlSPEi/CAaX+7Nj6nA5kqaGTwRWuDyWcQ+6ekPBpIdG9h5iGXAOcsxsk1Vk//c+ckFP3O8RrhpStAf017sSAmdVK4ce/ofMcZEjbX0h3rjc4WhTjxhC/fZww9uPISYns3XJQ1tC2W3qJoycnbAHVE3AGJ757KFQ8bHjQFnVl3qhlz1l6rIIWQY1Qx012sVzUlaLdI2/DWjbkgM1IvlPaIwUmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=407wchOupEBkulV3GatXbklaGC8/7vbFfaXacf3duDU=;
 b=L4PdkH4B2r+6UVwLXNncjLcKIeZlRLZcP/CZvlslgZd1S6W4aHcIp7g/0CqGza+/8X3flyo1Jg0WvgDU9z4UkLgk7tKC09aUmYZ4xWVVhredfo/2gh6dPVR9HrEEBUObNrIaWqpBJxoKGKN1/aW6wJ4VX7qA6fGMXMmDQHJ7xQbrPBFesMcC8t+G7pG74cEkAhLSEhE2svmErXnNn8TikxmqOkw+D0rP1xumLUIAsb1IOLyUhcrL35KlrLwwbqc8kl7JTGrMRQgctZfIFquzPGkvdhXIx6YHtQTGIXTXtz811ogFMfWj5KUYamGY22hIuirvDJdWezklXw7x+zOQfw==
Received: from BN0PR04CA0172.namprd04.prod.outlook.com (2603:10b6:408:eb::27)
 by SA1PR12MB6920.namprd12.prod.outlook.com (2603:10b6:806:258::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 12:41:36 +0000
Received: from BL02EPF0000EE3F.namprd05.prod.outlook.com
 (2603:10b6:408:eb:cafe::f6) by BN0PR04CA0172.outlook.office365.com
 (2603:10b6:408:eb::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Mon, 14 Nov 2022 12:41:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0000EE3F.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Mon, 14 Nov 2022 12:41:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 14 Nov
 2022 04:41:19 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 14 Nov
 2022 04:41:19 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Mon, 14 Nov 2022 04:41:15 -0800
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
Subject: [PATCH v3 05/13] usb: typec: ucsi_ccg: Add OF support
Date:   Mon, 14 Nov 2022 20:40:45 +0800
Message-ID: <20221114124053.1873316-6-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114124053.1873316-1-waynec@nvidia.com>
References: <20221114124053.1873316-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3F:EE_|SA1PR12MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: ba8b65a6-aa94-40f7-aaf9-08dac63d91ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RkJMMQV9R8e20RM95irTHLb1SjvNfRnR1/DuJF72/prszFhbBH8oQceKhnTtcOu7F/3VW9zunY8qWlt+yklkyUkFcJ5XakMSsyE/98iWw/aWYflMsPz7PoEbMq93Rc+wEKXSfiZxaxLRK913NQ0THGYhiPQncsgKTzeuh8vt7rpSpAiu4yBvd4KK+zNDyy8ND2dnn44j8vnYAoUTp5F3LKF2GTFvAOWYNx+TnlD56CLcnaaqMs4YkcSTmau/bqL2/EFLnNqeOKQMTcwIoPo/8d/ithMTLONzvr0xddWzM4YFfrOm0bjmtP4wKURmnLKtOFsB68s8pptm76Cg1knRB2/pM8M5eAMUnvJnRh1h5lEVTiwq7hGL27qf5+EoODtFqZN+krh5KTbF2dnt6WYzNHDRLF6BJoOV2XOIV21VjWwfGG/gE2/goES46Kmj1JGVEfnqN9HFiUXhEFZWchqqAGbyJ2wKMUa+4je5iXtlTJIk6MYdodkd7+ch18FiQZvhhjimqx1eBulkMskcHbQK7Rbt96CWIf1SWVSHRsikKyAJg6PflAZ9iRXCzWW76F4ap4BcveDxm0kU4Uui50rN7YEkz38aJoCAYo8YHzA1s/l/NfmY0hhX7FtVCTJ/ZkQrEMktWTB+XUWV2uqHEovewhtPypavVnGe2R8OdEGcTBb79fGqz+cc7Yx/krHJaCO8elZQ7jlRNVxK02fltPsJKbpodLDhRR020yquFygm7aRbHL+F48/ECchWo9WCKQ6gqa+yKIM3NxU204OPNAQRSNjPnspf0hrFjn8cb6gvw6U=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199015)(40470700004)(46966006)(36840700001)(5660300002)(36756003)(82310400005)(7416002)(2906002)(8936002)(70206006)(4326008)(8676002)(70586007)(41300700001)(110136005)(36860700001)(478600001)(316002)(6636002)(54906003)(7696005)(26005)(6666004)(40480700001)(426003)(2616005)(186003)(336012)(83380400001)(86362001)(1076003)(356005)(7636003)(40460700003)(921005)(47076005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 12:41:36.3632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8b65a6-aa94-40f7-aaf9-08dac63d91ac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6920
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
V2 -> V3:nothing has changed
V1 -> V2:nothing has changed
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

