Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6804B48C5CA
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 15:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241709AbiALOPU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jan 2022 09:15:20 -0500
Received: from mail-dm6nam10on2064.outbound.protection.outlook.com ([40.107.93.64]:64608
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241509AbiALOPQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Jan 2022 09:15:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiDykrvT7cV3y0/zkuOMPx2smXG9ydPVaTZao32Too7mM/pQiWYsNPPWGUkd0ZETCs09QfRk68hukvFxG8J0c0d21Q3RNEGOw3VJhhUFjoVaMolRXWK3D05QZxh8TNBQKrGpAE9K2/whm5Pj2uNGpofM6Cko69OvpF4I2VR4Kr51pQGg8ytJ566aVITdAKbnl4Ys52+vyZfoSNCUmIo2IVoXcHfsc8ZJj65sru2jr3Subug3NIyvgC6qGL/EsbZFxS5lOGjqhNtlsra20eZxccokR/qkoRfPwA5okZ5OOBqRK6M95K5fNRC3MUkUH8wihUckN+vwYp7DPF4+tsNaBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrjofGNoyzqB6kIT9HKSx+BNth1yFI9Hm5WTlZi/ZSE=;
 b=Z29XJ7YerO+bEP2sTrpHh6tuA9ajK1LaA3LAQ2UfUt1F0I3+T5dm+7ks0PTR9KMKNOnzTQXTcOqAJxbt7hhUXbti921tpl3lG2yM8D0P6MWc+uQg09JJ8LO2dGHl8bN84dt0T7EkRC3jUakuSvTWtGxuVjE9r1pEeL4B+9punO4Myspk7654CWL0OMMkDW4jUyQGCCM0b34FpIhk4ChFhzCF+lubRk9H4S5HXWB60PnOWsgQo9uqTz+daB6RfSpJFBm6/FZqzxX8k+lvh94Pj4VQSyM9mrA3w0a3WS/E7VXp7Sez6y3P9yxoMFjwY7jjB1GhzfbqJiGJTCPzomcMOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrjofGNoyzqB6kIT9HKSx+BNth1yFI9Hm5WTlZi/ZSE=;
 b=XW0nKVZ/1dIVH7mpo3FbT9B5bSUlnOKL0NY2ctmCC1vOBtQaemNPkgEkKZji+OMyZLKra6IjFduOnt7GbP/TIMqhhOFc55ZZ94lzbte3PY7/EJcM3oJN3p9pLV54Fnqp0xbTDjhXbxXTMrT81cd3VqiLXMBtsKNRkpwvPiKRptmHMopUVsCJ8YuQ0J3V40BEamvvSi4BHATQJk6x9Gyv7cToquTmb9ty555vYOTVyJl7UYvDLMuepoLfxa8XZPMqj3Aqf+kylHeTnysvGlrLsMK2y2elRqyyknvr6IkvlEKCWi+MNtHtSrSK94aOdBo+FjeuEaMJL4FJoG5smLP+PQ==
Received: from BN6PR16CA0019.namprd16.prod.outlook.com (2603:10b6:404:f5::29)
 by BN8PR12MB3522.namprd12.prod.outlook.com (2603:10b6:408:9c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Wed, 12 Jan
 2022 14:15:13 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f5:cafe::fc) by BN6PR16CA0019.outlook.office365.com
 (2603:10b6:404:f5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Wed, 12 Jan 2022 14:15:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4888.9 via Frontend Transport; Wed, 12 Jan 2022 14:15:13 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 12 Jan
 2022 14:15:12 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 12 Jan
 2022 14:15:12 +0000
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 12 Jan 2022 06:15:08 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <andy.shevchenko@gmail.com>, <christian.koenig@amd.com>,
        <digetx@gmail.com>, <gregkh@linuxfoundation.org>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <rafael@kernel.org>,
        <sumit.semwal@linaro.org>, <thierry.reding@gmail.com>,
        <wsa@kernel.org>, <lenb@kernel.org>, <linux-acpi@vger.kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v2 3/3] i2c: smbus: Use device_*() functions instead of of_*()
Date:   Wed, 12 Jan 2022 19:44:22 +0530
Message-ID: <1641996862-26960-4-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com>
References: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaf7ab3f-7ea6-4315-6913-08d9d5d5f36b
X-MS-TrafficTypeDiagnostic: BN8PR12MB3522:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB35223FC78CA394D005DE5151C0529@BN8PR12MB3522.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WJBFXxCE1xwy5HGrxW0XB9vHGPLvljh3rwzooz1bhrDfQeBSpGs24XQvQ0wQFd9LQkPuO0Zqk9hqGmIBylg/jloP5axBdNGJkVerxJvYwj7cLilpW36PZN2ctQAiRaC+C/pu7agC2mD1e/TTYSsTdgnkpC3nkYkv2lMrtkTGdnBL/FbAVsf7HkGcKyaLDIHOXOtGj9VZPurgC6mceiTiP8GP/S4USqESu9M1UKGDbHnw0jO2p7j/V03DMDEdgRJe+4piypi+ygjE7F0VNGjj26cSsNXYxUp1XUgTKPYkWB/6WURR+5GosR3zO1pfAwrP1ccPJ2yRhrgraA3UWvl0S3y/3P9/JfcMwsMnMqEsPV2NuEM0onhrKI30zcp3sttyKsKc5TmgiiVvcznq3lbRpj4J4MlAUnrnz6te+tnw0nfzheLsm2Mymu38S40QnM33gtKJPz2AmazA0Nz1pat63LozZx0+hC2tsETPpgCUzK6R52cawZBwJ8z8Y4+yJeKD4howTXqzHAqK319zWtl1lkNLb+SORllhubjevkgl1M/QHBq5O3v7zrhqss2n5jK7e5fA0Xl1cNy1HIhOuczOFjrHvlvfbsgjD15M/38cfgdq8w79qYeZkxxU5uqXfW7oNOEWDok8OMWR2laUzmoroRR1Ihf3XdcCvbVXtum4/0+u8GBKyoWosnctDrD9KkxdL6/ME0WG33dfVTeTum4Wbva0PoUOYHXB7fPlKUH+e3yvJ4xH0wrZKib0wfd9wfq1l3sbDtcRWkXbyaR/x3UClg7qNXdlmN0f8Yg8PCLnpho1C6MlQDECjN01TI4N1+HyEoEhZ7gNrm5YXvu/O/gIkRXo5QXcsIirC/+tT0I76Nc=
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700002)(316002)(110136005)(4326008)(107886003)(86362001)(70206006)(8936002)(508600001)(5660300002)(36756003)(7696005)(36860700001)(70586007)(8676002)(2906002)(6666004)(2616005)(7416002)(336012)(26005)(40460700001)(426003)(83380400001)(356005)(47076005)(81166007)(82310400004)(186003)(921005)(36900700001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 14:15:13.6726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf7ab3f-7ea6-4315-6913-08d9d5d5f36b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3522
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Change of_*() functions to device_*() for firmware agnostic usage.
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

