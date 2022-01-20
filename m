Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE87494F7D
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 14:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238350AbiATNpk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 08:45:40 -0500
Received: from mail-mw2nam12on2072.outbound.protection.outlook.com ([40.107.244.72]:56928
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344623AbiATNpb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jan 2022 08:45:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jutFCYa/L3fT79UqmhEYiUpa4GjdtMEKs5WeeE9H4xVy1MV2Dmxr3s9wukPztc0MaKcrvP3b7/5MLUSdkvgTwzZNQ47g3dj43XzsGD6CIP4OY7JZOA+5+Zz2R0Bj9fIEEndNOxM5mID5bCOlDsTq3ojWUA98Kabftt0pkBoMC8JC2w18x282hPiWM4L2VGxsSOyhGJP0jO13yeUIm2yiCIlAh4fttmKFmxDd9eLlkBXpOhtlE6osdD1b7JZynRqH6aDzBFYuMv06Qe4ZI31RFNJkYxQW19fQMgMUY301PqscgVMg32k+0T3Js+QDqG7tSuCw6tnvm/xfkiucaflLKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OoI1OPC/ws7wVgztxSprWtJddK7zK4qQ4iqfztlA5pM=;
 b=Ncssv4kKnC3J54i/7PwspYzEBtSaW7cWiaxkM6Cpf2sf31DzHDWDfi4LwVMczW1mFZG+HAAlg8VirLikMx/iP+AgZY4bNFSt2Bx7CqKFTFntjiFnUJchdlaX29Pdz046qa2IKLGa5759d+EhNCaEsy5bisMAz7oiesjWVHitWPo1QOlPrrD9+bdBzZVy7DnT0OKPFtR9O87ucfEIWgUL/YY7rdRin58LfCPgWgYrtlSQ7kx31e1IpFXi8pTNlHkfY39ZQeKnUf7+efbb4GXx4MkijiN/KUl5DXFSfBsjGgTYV4AdTAaqQLz/MNoxT9AXvxY1mrj5dzuawKD3SBeVig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OoI1OPC/ws7wVgztxSprWtJddK7zK4qQ4iqfztlA5pM=;
 b=bE6kDc/rB75WN+Vk/4SZJ+inLlsUmyrde4VQ9VeTdGGTHwvcE2FYn51GTdviTKEgH3H+AFm8RrpISMzmQBV1rr7m2WG0edY7v/10yE40QAIZ6Lnh3lMYLBBJLMml2gQVVuQXp+2SHWtRKmlWTziMXlwfT8nXDZnvHinwJPcMSVBSVSrMPNxdHV5xdzGQzKl6N0jC0Pk4xvZTwK4wzmkPbhiRuBJ7LoMlmhT00GkE4sA0zbKozbWypQAAGHCoDA5iRC/xwzyFrOw7uE7EXTPpKMuYuHt6cwofKdVFgeE4uxNUOR8sL9i06xFrent74yF2nKs3zeMcHAnF3ic3pUYtUg==
Received: from DM5PR18CA0083.namprd18.prod.outlook.com (2603:10b6:3:3::21) by
 BYAPR12MB2997.namprd12.prod.outlook.com (2603:10b6:a03:db::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.10; Thu, 20 Jan 2022 13:45:29 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:3:cafe::e6) by DM5PR18CA0083.outlook.office365.com
 (2603:10b6:3:3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Thu, 20 Jan 2022 13:45:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Thu, 20 Jan 2022 13:45:28 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 20 Jan
 2022 13:45:25 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 20 Jan
 2022 13:45:25 +0000
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 20 Jan 2022 05:45:17 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <u.kleine-koenig@pengutronix.de>, <andy.shevchenko@gmail.com>,
        <christian.koenig@amd.com>, <digetx@gmail.com>,
        <gregkh@linuxfoundation.org>, <jonathanh@nvidia.com>,
        <ldewangan@nvidia.com>, <lenb@kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <rafael@kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v3 3/3] i2c: smbus: Use device_*() functions instead of of_*()
Date:   Thu, 20 Jan 2022 19:14:15 +0530
Message-ID: <1642686255-25951-4-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642686255-25951-1-git-send-email-akhilrajeev@nvidia.com>
References: <1642686255-25951-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12c72dca-212f-4fb4-26ce-08d9dc1b1eae
X-MS-TrafficTypeDiagnostic: BYAPR12MB2997:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB29976C8D5FCECDA7CE79D41EC05A9@BYAPR12MB2997.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9/uW1W32WtkeAsgSJuhACedTrmNAHv3UlG1QYVtI5HyOb2HYrpNLKdDQcyoPl3vEcyXUsCLQ0lX7Zxj4tBl2gDWe6aZC4B0cY+7NQzxd9pd5uAx7zMi2A7CL87ZzxNh3mak7B026O1t5/zm8RR78RuSORscOaAwZMJCA1IT9bqBWlFXDvzD8SNEDS5S/BboLl3LDqftxLQpKYiVp20LRqAKaI56HAbLSYAa4U9ksN9GRF7fA0D/JN2ZoooxlOyUjV9n1hi2TOAmnjWcTg2b3IVLngxkZyEdaym6yWE3eB542wmvHOnqoPC+3cfHtusEqK6VsxJe1HRXgekVF/fGGTEh9p8NrFPbuXsZaHpXgf7xNu6ffEr8Ny8zfqmUjgz6Us4bWl4PGr9myvjqJkrO0mmsnqaMFLyMEDIth/Xsv5bZdG+fAyyMAG1qw5rEyRWmJPaiBQqXIKkV0KKMdZrSXsmxC0zG1Ej1Ib1SoXDsfJSQvcfmzDPicro6W6GENMS6L1596heZKA5j3C3isoXdh9p9v3v+Vanb5PXV59x2Wgx6xdgsyuSUcuR1jyw//X378yuhOYm2D2h17t5Oan+O9+SwJK9h82vV9Yj+GEuCNCwab9/K3mEn4yIrEWng0tasagkVBVgKPzcn5Cj1Tghufm03tchvVG2xFA8ms/oXx4iaGb2svdVwRz3jD0j5kOEbUCDBmJD812xSMQwf0I8gkkHh1d/516JwUbDpQErc9jKiFZA0SXjbwLKjypX035D0WwU1xl3i9pME9a2x/v0qiO7WaQXpGmc0NAqqGju1ThNX9pQfEWssKQEatQ3ivQOOq/uzWxqeZIDQJAkqOq8i/qaxPWPsrdrODcvus5FxWKDM=
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(7416002)(47076005)(2616005)(426003)(7696005)(356005)(107886003)(316002)(5660300002)(4326008)(110136005)(81166007)(86362001)(70206006)(70586007)(921005)(40460700001)(2906002)(508600001)(36860700001)(8936002)(36756003)(336012)(82310400004)(8676002)(26005)(186003)(83380400001)(83996005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 13:45:28.5030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c72dca-212f-4fb4-26ce-08d9dc1b1eae
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2997
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Change of_*() functions to device_*() for firmware agnostic usage.
This allows to have the smbus_alert interrupt without any changes
in the controller drivers using the ACPI table.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/i2c-core-base.c  |  2 +-
 drivers/i2c/i2c-core-smbus.c | 10 +++++-----
 drivers/i2c/i2c-smbus.c      |  2 +-
 include/linux/i2c-smbus.h    |  6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 2c59dd7..32a4526 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1479,7 +1479,7 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 		goto out_list;
 	}
 
-	res = of_i2c_setup_smbus_alert(adap);
+	res = i2c_setup_smbus_alert(adap);
 	if (res)
 		goto out_reg;
 
diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index e5b2d14..4c24c84 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -701,13 +701,13 @@ struct i2c_client *i2c_new_smbus_alert_device(struct i2c_adapter *adapter,
 }
 EXPORT_SYMBOL_GPL(i2c_new_smbus_alert_device);
 
-#if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_OF)
-int of_i2c_setup_smbus_alert(struct i2c_adapter *adapter)
+#if IS_ENABLED(CONFIG_I2C_SMBUS)
+int i2c_setup_smbus_alert(struct i2c_adapter *adapter)
 {
 	int irq;
 
-	irq = of_property_match_string(adapter->dev.of_node, "interrupt-names",
-				       "smbus_alert");
+	irq = device_property_match_string(adapter->dev.parent, "interrupt-names",
+					   "smbus_alert");
 	if (irq == -EINVAL || irq == -ENODATA)
 		return 0;
 	else if (irq < 0)
@@ -715,5 +715,5 @@ int of_i2c_setup_smbus_alert(struct i2c_adapter *adapter)
 
 	return PTR_ERR_OR_ZERO(i2c_new_smbus_alert_device(adapter, NULL));
 }
-EXPORT_SYMBOL_GPL(of_i2c_setup_smbus_alert);
+EXPORT_SYMBOL_GPL(i2c_setup_smbus_alert);
 #endif
diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index d3d06e3..fdd6d97 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -128,7 +128,7 @@ static int smbalert_probe(struct i2c_client *ara,
 	if (setup) {
 		irq = setup->irq;
 	} else {
-		irq = of_irq_get_byname(adapter->dev.of_node, "smbus_alert");
+		irq = device_irq_get_byname(adapter->dev.parent, "smbus_alert");
 		if (irq <= 0)
 			return irq;
 	}
diff --git a/include/linux/i2c-smbus.h b/include/linux/i2c-smbus.h
index 1ef4218..95cf902 100644
--- a/include/linux/i2c-smbus.h
+++ b/include/linux/i2c-smbus.h
@@ -30,10 +30,10 @@ struct i2c_client *i2c_new_smbus_alert_device(struct i2c_adapter *adapter,
 					      struct i2c_smbus_alert_setup *setup);
 int i2c_handle_smbus_alert(struct i2c_client *ara);
 
-#if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_OF)
-int of_i2c_setup_smbus_alert(struct i2c_adapter *adap);
+#if IS_ENABLED(CONFIG_I2C_SMBUS)
+int i2c_setup_smbus_alert(struct i2c_adapter *adap);
 #else
-static inline int of_i2c_setup_smbus_alert(struct i2c_adapter *adap)
+static inline int i2c_setup_smbus_alert(struct i2c_adapter *adap)
 {
 	return 0;
 }
-- 
2.7.4

