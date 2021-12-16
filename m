Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6444772D9
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 14:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237365AbhLPNOr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 08:14:47 -0500
Received: from mail-co1nam11on2071.outbound.protection.outlook.com ([40.107.220.71]:36390
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237350AbhLPNOq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Dec 2021 08:14:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAmv8TDTxgAJQ3kl9IWT8fQEWKIkkdUtsKFBXdmbmLgD7F87IyLZjtBy+5QBRyqRNTOaFvyizA2blzuFiiPtmASSOWjVJVIiqis7JPfvXFoydwprLhcXKzT/zz7pjzKP3c2VmrK4zxLz/PeXjdoNIe1ZVU/l64Ui2LvbzsDqfYKV9cBkj1K9V0HYLMP1jFJkywMq/aCFi7cAeCwjHmcs/T9VlvacqcXRa43zAH3kkhqKOMFcWTzPXeVC2OGPHTior/yTda77R8NPHkKBYHTKW7rGi52SBY+TEOjPqQ486tmJY3x7pWL4iRWMZ/5UaMiWzVHX+D/hgxyRHVRoY2Tp8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+TmBSQuBqsuAJqzXfGABA0B+aPrMwjDPBkKxTtX/hY=;
 b=TWr3xlsdHWE4p3PmRNs1pyB1pYScdOO6sXnG4J3a/mplHqKsuZu+R/NJ1bZQW10aMM2aBCq5iyHVwCxVd5DY4dGIrjyVAVD09uG3y0ZE8fvdJelY55WAuJJmTnIrkaeGaW+31lT7jEhS6eTAY6IuekIsMvNpCcEMbLq2eRQTILp8dNVU4Ouy43rLyqCV2qLsDfN42cMSxBswV1W5TXHFk4UdlGVWImOmHoD0UezQA1Usve9VGVr+1VYzebobf4tHx4p3cHenL8xB1bZVjaWbcwX61VrNPbStzb0Szrmy1VfoIflsAJKZJVRTq8BCCvoBKO9+IIgMU57i22jzkQ0mZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+TmBSQuBqsuAJqzXfGABA0B+aPrMwjDPBkKxTtX/hY=;
 b=sEm40swkP0gRGJIjJuDRkqEdXzszabvo4OiWu6mOSLTclhXjPX9B6wv9d83shxINszlUfSrj4BDE8Zn8rlPpX0Sdrlx+nsZWPipLTNqn78gM/NKgCPrTR+A7OyEhZtPnWXYF+h7axNPqnNhgeJRFM4zqoijjd2YGNK0HCELaRW3eqlAjJPO5sEKu09JH9CvKWOs/STFA1EUr6jP4PgVr1REDn2a4elYCKKNeRfqpCEYupyyPEvGEDb+036a55PWaehjXw3d4CLues0a6w57qwAsoEwV9q5BK3/Hy8j+3t5p8N/kmuZOEiHyQFtjSGq2FAKxQi5saoYK2VzGSiN6Pqg==
Received: from DS7PR05CA0046.namprd05.prod.outlook.com (2603:10b6:8:2f::14) by
 BN8PR12MB3586.namprd12.prod.outlook.com (2603:10b6:408:47::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14; Thu, 16 Dec 2021 13:14:43 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::40) by DS7PR05CA0046.outlook.office365.com
 (2603:10b6:8:2f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.8 via Frontend
 Transport; Thu, 16 Dec 2021 13:14:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4801.14 via Frontend Transport; Thu, 16 Dec 2021 13:14:43 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Dec
 2021 13:14:41 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Dec
 2021 13:14:41 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 16 Dec 2021 13:14:37 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <wsa@kernel.org>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <gregkh@linuxfoundation.org>,
        <rafael@kernel.org>, <andy.shevchenko@gmail.com>,
        <digetx@gmail.com>, <ldewangan@nvidia.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
CC:     Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH 2/2] i2c: smbus: Use device_ functions instead of of_
Date:   Thu, 16 Dec 2021 18:43:22 +0530
Message-ID: <1639660402-31207-3-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639660402-31207-1-git-send-email-akhilrajeev@nvidia.com>
References: <1639660402-31207-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a79bea25-8ed5-4510-15e1-08d9c0960649
X-MS-TrafficTypeDiagnostic: BN8PR12MB3586:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3586F24B76305A61A1C099F2C0779@BN8PR12MB3586.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wmbrwwa1egUFfaGOpuhphMG2v7sPjeGw5NMRGgXKz9XsuZUZQnRisw2qjqIyuMYnwLO/CHxwEMuB6QCdOBw5d3MCUXRG2Q1aAllLhN7lE/eFntW7YzSlKP3qPB9ZMhmUUjL5gT5b33gTVJUaEzHkYHszCHWYUSl8qOFyXYJOF2hAhNTfrcvMyyZ76TjYcqKbgY8Eoz1IDufLLlpXmXfcYh70Z7TxWC0DG33VWmP7BpwsTr5CsIlPaqXFy3IAaBjtnra5i4wgLolaKH1y2uK7rPR8rwsWexcm36wlHvdPNpZngLowm+HSOOfULErPXIgnwToQRsCvYfsZqcfLWzhtlqi9GYzHQSOdDTA9rNlG1DwuaVBP6TjsSr2knjTh3kuPrMjg9k8eG3ab5D48UhwJrEfbK2aeQsTLH76Gg01T7Pbyj9F9SJBLyl8QIgw1yFuZKuZzKU/ejB1+zYLHyrIw0JKwUCY4kEm8DNkPeWzUhCn3bfbQVYD8//jtT+iY/Mswn4iF9zCcsYTaQ0P5ptFF2i+m5/Bmxi4MXcWjjDrOmr7Se6uqfJ+6b7edJwRUMhE0xLGNvQt6q3IuMtZnTewnCotJxIBNy5Jdkou4HMhtI7VKvsd1M6fSP2mrtROMHvWEqIQftMqxiSFxteectWWcqevQspOpe7EXGTQ8agE4b3ws4RhLyV5AHCmG7eMyQWDBna9XiyrkGbrSshM5EgjqUI2jOwakQ0WRCktzZ2BKOvCQVcqYjtvKlQqDZdcq3dHr6/jO2NpqFvkU6yUwn4yya0+ixIdlH0SOKPVpBEIo5xI9wUTsuEwqLQXAh8OSvTv0t85xa/5iTuw+BU4GtE/LPDTy3+IEQ9PIuCxSskM3Ngg=
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(186003)(34020700004)(8936002)(336012)(6666004)(82310400004)(426003)(26005)(40460700001)(86362001)(36756003)(81166007)(70586007)(7696005)(316002)(5660300002)(2906002)(4326008)(8676002)(7416002)(83380400001)(70206006)(508600001)(47076005)(107886003)(921005)(36860700001)(356005)(110136005)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 13:14:43.1466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a79bea25-8ed5-4510-15e1-08d9c0960649
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3586
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Change of_ functions to device_ for firmware agnostic usage.
This allows to have smbus_alert interrupt without any changes
in the controller drivers using ACPI table.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/i2c-core-base.c  |  2 +-
 drivers/i2c/i2c-core-smbus.c | 10 +++++-----
 drivers/i2c/i2c-smbus.c      |  2 +-
 include/linux/i2c-smbus.h    |  6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 1072a47..8e6c7a1 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1574,7 +1574,7 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
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

