Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0972662D7B1
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Nov 2022 11:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234313AbiKQKE5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Nov 2022 05:04:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234312AbiKQKE4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Nov 2022 05:04:56 -0500
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2045.outbound.protection.outlook.com [40.107.101.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3AF52716C;
        Thu, 17 Nov 2022 02:04:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUI2Dv4yKhp1bTOCrEQbLZ4G4n2RpWET6fa81IxRTBnUBzb6s3LofrlG85P3LFudD3wOk/4eSMzG8nHqKfS5zXk9U/WBoupTouKiTyiTEeoQ2LIXc784aBHMQS5GdRAtEG2BeT96gmALQdT1cIfUvBacWjGGOh9a4+nRNlHp497yc+WfmOd86kVYSWcwnopP9gOUqzzFaur28Qq4jP4jVpemyAqB7OM990n+wC1YTJuVSIE9nx3dBagXhFXkofOHEP77RyBfr64zTYRGuhPOlPbDjfE2F/Srj+t6/ZJpBu9ghJ94Ml8Bu4Mz7gwBOwDUj0Jhw4/G/c7vleLb/w6yxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Krh+dE0NbLrcyOr7DErAaeJEcGWKgHDOujL0iwWyxM=;
 b=JZguo0g+RdBuc2sWlKjtH73JHJGnDDldq1Kf/AU6a39lBGPRsnoSNjIOazrg/a1Z2zUImfr64pkEOCvn4fwgHi0WFwbqDIyKOHmtLCufqT9lQV8tkyuWIQi/ic8JqOTClfBawPLu0NszwlTFX1nJbDSPnWoVv95/hNgUTOiTB7+rGyPx8mVoolJfSZIdtX4WbYJJiOGsJx/b/MvL3rpcDvQ4vdYH47gGUothn91ItrTOX39DDM43pYpHa3pW7lVR/vbEt+kJycPDBOQkCaLDofa/AL74altv4tnyrUJ/Zfk1/txfTqpHZGFmXsFJJyOPcGw1wXXW5Rw+9P7cbQnTpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Krh+dE0NbLrcyOr7DErAaeJEcGWKgHDOujL0iwWyxM=;
 b=H320urXJ5w6N1RzjZ/MKrdRmLxjQUgYOFRBLvn+lKHCl0Hp7fcxLXLmEmt7arQTUywibE2w68zrB5dlXrvzlALhEtSy07gDySQT2vNGoIKeoFXm4luTLprN4F0DkkoyV2JXO5z0ytOAIQj+hD6umCcX7kqRF3kCbpvO4TbMQn3PwmFZelnFJCU5TyQMrYN8PDJ+TWs628DsErizC9VsTALCyL1RAEmDq3WvqSKM9PfZ57f8txu9t2PG89jSuq/KXISh0ie7b1At1PEY7V9eW+uR0MQ7hLThCiOCV1Wuev7RsZYUo4srVbFSzd05Idcnvcgiohy2vasYRU02fuJb8oQ==
Received: from BN9PR03CA0035.namprd03.prod.outlook.com (2603:10b6:408:fb::10)
 by DM8PR12MB5446.namprd12.prod.outlook.com (2603:10b6:8:3c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 10:04:54 +0000
Received: from BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::55) by BN9PR03CA0035.outlook.office365.com
 (2603:10b6:408:fb::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Thu, 17 Nov 2022 10:04:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT005.mail.protection.outlook.com (10.13.176.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Thu, 17 Nov 2022 10:04:53 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 17 Nov
 2022 02:04:40 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 17 Nov
 2022 02:04:40 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 17 Nov 2022 02:04:36 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>, Zubair Waheed <zwaheed@nvidia.com>
Subject: [PATCH] i2c: tegra: Set ACPI node as primary fwnode
Date:   Thu, 17 Nov 2022 15:34:15 +0530
Message-ID: <20221117100415.20457-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT005:EE_|DM8PR12MB5446:EE_
X-MS-Office365-Filtering-Correlation-Id: b0f3f278-6c66-45d4-e8b5-08dac8832c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v5ZhOCdYSTKqkVVsHK4dJzGR+WH5twpBXLzniL2frIxZFR0wBl8wSxvEY0QflVoTMV9QWpELLbm589CmgtslNtNH3nPR6Ul3u7mOWlYLlylxpc27AordxU5G/k6L9Ljuib8cozojRzQ/zLWKnRMVjSJO3Bp5V8PH/jkbd/+0z3GcFEiaqdmxHkM/Vk2Y3k8rzHJ3uRacs37OSCLZ02ZIxrELCIUxs0lV9MN/ptRCS8/1I2CI9Hi9JZpZUn4jRHnJU2GZNny3B7oUKJ0lbkJa+C97QUpEcwJaOIwGLvR2tJZdulFl3AFzq1BqchAgQ2JgsbZ/k+PvG/56bgMA5Nyr1RLyNeWFavGfvAqDD3AWA9Y3zV2wTRetmr6vpPG8HEV6jLy2f5SeA9U3ndRhrDmrGXgWY5HHaODzWBs/Y5Z1GLCMvHTPaltzHCTX9H1oMq7QLPaadaI6+tzU0fASF4/kSUO01tf5nV0sCRYVHi1TCDfuDIR9VF2HCmNIuTZrV1NgpJEM1ttQgF8np3qM2m7OLKmD10W0FD+htxs66/3Lz2VmDhwjPi9aZAzxi6tIr98hEq5ducYRt9slq72IYBsUJamZ/Go0pNY49i7AYFcMJ3W31LtO4HHKvFQTvPAOhRjnj9FoZSNmtaoyRhqMttlvj9O255uTTcW+PDOibQukcGG/vIviln53tqp/tA90TWI85iojVYZmUIGcBL/jnfxijRrKJ5q/jsgzM9Awv+KgKSRMyHrdYzKaDRJWUzj8r9rER/wv2WL+2P1UndkHHwEYIA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(46966006)(40470700004)(36840700001)(186003)(4744005)(1076003)(5660300002)(336012)(40460700003)(41300700001)(110136005)(7696005)(54906003)(316002)(8936002)(36756003)(2616005)(26005)(4326008)(8676002)(70586007)(70206006)(82310400005)(36860700001)(7636003)(356005)(921005)(2906002)(82740400003)(40480700001)(47076005)(426003)(86362001)(6666004)(107886003)(478600001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 10:04:53.8870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f3f278-6c66-45d4-e8b5-08dac8832c99
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5446
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Set ACPI node as the primary fwnode of I2C adapter to allow
enumeration of child devices from the ACPI table

Signed-off-by: Zubair Waheed <zwaheed@nvidia.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 954022c04cc4..69c9ae161bbe 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1826,6 +1826,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->adapter.class = I2C_CLASS_DEPRECATED;
 	i2c_dev->adapter.algo = &tegra_i2c_algo;
 	i2c_dev->adapter.nr = pdev->id;
+	ACPI_COMPANION_SET(&i2c_dev->adapter.dev, ACPI_COMPANION(&pdev->dev));
 
 	if (i2c_dev->hw->supports_bus_clear)
 		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
-- 
2.17.1

