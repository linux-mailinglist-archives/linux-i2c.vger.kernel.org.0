Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1E786257DC
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 11:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233737AbiKKKRE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 05:17:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233653AbiKKKQn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 05:16:43 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2083.outbound.protection.outlook.com [40.107.102.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E758545F;
        Fri, 11 Nov 2022 02:16:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6128LnrpZ0jcHUhK8lwyvZnwQ6JoEt8xve86GRWnZCnkCEKI++SlFNCVOOscgyrqqodcW1NorKO8/BD2A4hUKPOo5knH0DPcY3OhIJX0ztnhsMTOHeQ6jiuJdKJxsFSKlDZOGLJTdrQ788tqDudjAC52B8KIhQvbyfMFNnWvzXFOQzbASnXxyCS62kXOAb3SsP+2Lpr4HTrG8ERNPSjFWdoj6TwPGXEo04iFEflkrTAC8xcU2IoQbjjXZtP+1GSBG+RhX7XsdKTn6jbZ7E+D+wTksK9B0a/VViWypdq6NE08BHirmYlG82wvyVr0QrrD3FgYuRDhdyfz6kTVM/VLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyuhJf4hA5+wa/Xch0Rgl1g/1ZFnBQlyo1ICvJDb4yw=;
 b=DCeh8TX3NDlR9MsbrW7ATzOyTqIo+llLQfP/hKHpP3zv+KMMEVL2hqoRUCR2r9w9lONZKAeycq08FY+SKp7CCfwzJFZJcP7hA0qCbzZ2KM0ZuPnNwga76IH4UZgk8uRkBUJvXjePYQEN1audnW5SUFIbA7Nrnqu+fR8UcM29Zb2U+yl4VMHGimXwi+WSwoTQViRVU5aSmA9tQ5HnX39Ny3yvevrfIHMp0rFn5yW6DF7/BoMEA672u9oEW4Aio4mh/ge0PHtdNSFTvtGogr0hUlxfPliUKuvetoBmrPM+RIWEXibQxcPHbBg0GpB7M215S/6F1nZnaZWugOX9mG1Sjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyuhJf4hA5+wa/Xch0Rgl1g/1ZFnBQlyo1ICvJDb4yw=;
 b=OFccsrSvxSKJkh4M+VwAVWVSIMz2gPAoJl3iSVs7T+FxZgQCLGcR6xUbSiN2U58vJjY2qvtvzAPcAqSARfq684A/qGSFUpo3v4zktPlbg/8mto+saezAYmQseuJZUL9hR7vPt80GOQcQyxuWdvXSfw4WbtNjSyflFqLds79gNUURws4FnAslozPnZAme4CjHfiE5OodxupcGaCy16iXcYSG04c4Zobzj/SQRVp38Jo7U7FLUK7ARY46T9O4hu7FPljeCPOFKjeVWu+gR3CypM5RoPcRfpKz/N5bPIFjIcF9SBCRajisGSephoQ5ZQvLkE0hR9164yB/rQ4McmVkZlw==
Received: from CY5PR19CA0089.namprd19.prod.outlook.com (2603:10b6:930:83::14)
 by SA1PR12MB7442.namprd12.prod.outlook.com (2603:10b6:806:2b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 10:16:29 +0000
Received: from CY4PEPF0000B8ED.namprd05.prod.outlook.com
 (2603:10b6:930:83:cafe::98) by CY5PR19CA0089.outlook.office365.com
 (2603:10b6:930:83::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Fri, 11 Nov 2022 10:16:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000B8ED.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Fri, 11 Nov 2022 10:16:29 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 11 Nov
 2022 02:16:15 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 11 Nov
 2022 02:16:15 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Fri, 11 Nov 2022 02:16:11 -0800
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
Subject: [PATCH v2 08/13] usb: typec: ucsi_ccg: Remove ccgx,firmware-build property
Date:   Fri, 11 Nov 2022 18:15:04 +0800
Message-ID: <20221111101509.999589-9-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111101509.999589-1-waynec@nvidia.com>
References: <20221111101509.999589-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8ED:EE_|SA1PR12MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: d3cda19a-faf6-4d65-5df3-08dac3cdcca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4XSH5eV/lFp3vLzyq9DmOq6PygFB8tUcXr15f63cOyowQ/gSBnJzFPOK52W5YF/HlIED0OrNSDPA5N8wvgGKxUDQtpK2420tkCfydVFsmy2pM5vtopTUcXujMi9C+jZuO+cYG4U9be9GcE8EoQJ2zRESMujNQc/rmkTO+rgrmC1H1M8ToWOQK+dD2m/txP4G85Qj/9qKwBPnqhq8EER6bCILcQZCcTo8PByaH3i2yJfd2/al0gWE/KWeL93Zl5TKgFvZUx7EnX/IaHgaN99O3wx39KRVy8qooipmDMHqntv96qS7rWWakWbjicFVZ2iqqgfswLSciOGuUL1HaU4sy6dgPwBybXhhHRZLB7srAwG9GWsXHX5I1J8UrdD1SAh33lXLrfjJt0VYu/NFpwBQHZqbNAqL3wafAVzD7aDB3dDfW1X1eMm4EPcGuWMtSU5rZ/0+DowSCBkDB+wscZiJW6tVK0mFZQXrNzhHqXLW/mpoBaexBHclt7v88vtgD9N/gDQGKtcuXB63XDSY7XN63JfHakTPI6RzjCx9UvdlYoO30ukTnlhGy2Y1iL2Tjh6r4hkGP5pcmqQw+l5wvI9Pfy2iTsq+awwL/wz9Z4GvkvzWGtzkMzMz134Gatik10dTLIbxR/4l0RhaUpLFDgnKBRvNmMiuU9nXz0o7jKbvsM2j5cAMa7/nZ0gBZvei+cC6qlxopXniaFs8iTev4MLFSINF4KU/NDR3m39N4PGp5svymzPNF21kbgLmrK86azeElH8XO6VndIcHJ0+eAsjSN3APw9Jzrrtqvx84k2Wn/bA=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(83380400001)(8936002)(5660300002)(70206006)(70586007)(41300700001)(8676002)(7416002)(4744005)(82740400003)(4326008)(7696005)(6666004)(26005)(40480700001)(356005)(7636003)(1076003)(2616005)(921005)(47076005)(86362001)(36860700001)(2906002)(40460700003)(478600001)(36756003)(336012)(316002)(186003)(6636002)(54906003)(82310400005)(426003)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:16:29.3688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cda19a-faf6-4d65-5df3-08dac3cdcca2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7442
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove the property ccgx,firmware-build as we have added well-known
regex cypress,firmware-build.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V1 -> V2:nothing has changed
 drivers/usb/typec/ucsi/ucsi_ccg.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index e412a457bbfc..eab3012e1b01 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1359,11 +1359,6 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
 
 	/* Only fail FW flashing when FW build information is not provided */
-	status = device_property_read_u16(dev, "ccgx,firmware-build",
-					  &uc->fw_build);
-	if (status)
-		dev_err(uc->dev, "failed to get FW build information\n");
-
 	status = device_property_read_string(dev, "cypress,firmware-build",
 					  &of_fw_build);
 	if (!status) {
-- 
2.25.1

