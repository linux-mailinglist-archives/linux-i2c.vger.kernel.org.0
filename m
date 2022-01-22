Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2608496C34
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jan 2022 12:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234453AbiAVLdi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jan 2022 06:33:38 -0500
Received: from mail-bn7nam10on2078.outbound.protection.outlook.com ([40.107.92.78]:2589
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234457AbiAVLdh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Jan 2022 06:33:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjKAXTfbVVD96PMW2mB2EbOyNp16U6bFV1L6oqarYhBObfnulgyhqC3hOT4YbcWjsOKfzA6NBNAjaRp2vkHGH8k4KCk2PUehlgghFVNR00s8JUyFd2kbbTVG2tHKOHezfl+HbDc5MdS85jJzbqS22LPdhmoSMjxkq2y1S9dx/Hv3JyjB28ksfW5w2Qm+LdKutkCXOFhSauumXNlqASF5lCIkhr49Z5lpdEfsKrlLuTuniAC0TOrGLPC61p3DThBtm4GoxiitBlGpoG4hSV+YnRnQu/6GfwwSQdkk9nktybjnLIOCcqdVs/SNtDjTTfk52ApRVN/ZnJGQOhJHg5G3yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11qrQckzhIflZAPjqm044Qyn1W2pRpQsw8fCA76lbIw=;
 b=BQdHTun5d88Kn/ca+piUD4+w/BoQYoHjS61KMdoawsjAd5OkRWXaEGPsSyR0mCa29qd3TyWSri3wz7SCNEptfRFYODXZjXUENmTK9Nzx51TnPCuf53Bv/vNJ8sKFSAQoNIRoYgDX0uMrG18GDsNDfclIcKi0QHier8oIwA6E2wsdUckznKhdyKEEfoCRGSYFmYdZDXYldbcARxJsXnW3OtdZcvrEIUvUN3gI/C+qDaxed10ZfwSC3puyM1Vsx1vVsnDvyBfjPmVWAIulMrnherAJPSgNe7ehAFF4RDPnpI4KZO5xPTHyd6V/I8mKWbKGDVk0RzinYkJaU7EuJIt0hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11qrQckzhIflZAPjqm044Qyn1W2pRpQsw8fCA76lbIw=;
 b=BdQqF0lev07fCKBa7HDxlDYzd6CmGtCS2T+bQ8HFJ2gfY5curPxHV9UinXdJTHYVVHgmH+kiiIS+meWeSEQkJiS2aWJW+Srh3UxvbFkRs+lgUKjJ2FO0wpeYk2dDJTTLd0ZFNRf1d8BhZtENLzpbkTsdzZ5sMbfcyk9n4J93J8136A2JXbqZCtw0uQBB92g5ulw7V5XZa2J1shpV2S98ts9/HB9dc+KtaYBIp+jzuDMgT5aiifXsS+ywFxRHtlSsxV16ewDpY8MlggGVFU6WJSlbpro89fJ9oCOV677Hu3ctmf0NVInhcqNVIRdcIGFUNXOX3EV9bMfougDyiZDADA==
Received: from CO2PR06CA0065.namprd06.prod.outlook.com (2603:10b6:104:3::23)
 by DM6PR12MB3642.namprd12.prod.outlook.com (2603:10b6:5:11f::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Sat, 22 Jan
 2022 11:33:35 +0000
Received: from CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:3:cafe::99) by CO2PR06CA0065.outlook.office365.com
 (2603:10b6:104:3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Sat, 22 Jan 2022 11:33:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT016.mail.protection.outlook.com (10.13.175.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Sat, 22 Jan 2022 11:33:34 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 22 Jan 2022 11:33:33 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Sat, 22 Jan 2022 03:33:32 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Sat, 22 Jan 2022 03:33:28 -0800
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
Subject: [PATCH v4 3/3] i2c: smbus: Use device_*() functions instead of of_*()
Date:   Sat, 22 Jan 2022 17:02:46 +0530
Message-ID: <1642851166-27096-4-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642851166-27096-1-git-send-email-akhilrajeev@nvidia.com>
References: <1642851166-27096-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 159b8330-2e91-4018-58f8-08d9dd9b0697
X-MS-TrafficTypeDiagnostic: DM6PR12MB3642:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB36421E371A023C79CB6451E5C05C9@DM6PR12MB3642.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PyjYT01/jusPqKI0Lnab9AGTZ+eLR2Xb4E/SJyTMl3kqu18WqEhmrGAk5IklUVmORRc7pPghw+h+9nS7ANtrH90zbZawZUPmQo6I+mOueByV6l1OHCBm4xbiIAUzXBxQodYYnmeMqV1TdYL7yC8UvTezGBG6U67PfksDlji9mZEQA4fCbCR6K+pLsoCg86ztcDQPwT/6J0HamZodqU8cTHsXxuFGH8lOljhkEsUs47fsp8OlebAMULRRoUCSWspz4L3y9NuXWLK2CsG3Hcp8LfUo5TN/zuusesnpP7svNnx4VV6M9dDOd/c8aTwszgNJS1l+bWb6NkV85fZ+4Z4LJRn8gVkwtlUWXB5HZl2K8Sj/DAAluva4jlpQQBxgTEzr8oh0pe07PT6c8gNg9OdoC/9oofIzTANOEYxwyGarKEd4hgqheYbu718J5FGaCoTSLtuh2nzgF3OvlmYs6DC0C1sXApp1swuknSdxfKLyp2QfX3qM9tu2UrysubBcRQqv6x2rMsZKTR/Elu1wZT7XAkQW7lhcEGRwafoYi4lDgQb6F+uTAv3dtP8wkNi6EPNkMtVsrFh6LFcYuKlYANGoc5m9wxohdleXa7aA+yPYGssrKSKmp/sMYtXy/CjDNTxFmQ7bq5qlNf/3r/FuspOpdQMlZXcuGd893bFpKWxhbdCk4PEedG0XiR3j01vWyVx4ALDjOyhRTEhQ1Sxi/qZuh+jt/em6Tc1ZzycVTZ3OE82SuBZATACgFi/nQNqwfdJ+O1zqAQErF02+DX5NNorkpKLT6HkVxhUhf03NMovQsdDXNdoqauQmOjrJIAhSkmL/BY81tdo+6TZWDJSGbI8BH9MyWrJDOMYDK+2E1YeGmuQ=
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700004)(36840700001)(46966006)(82310400004)(316002)(4326008)(336012)(5660300002)(107886003)(40460700003)(8936002)(2906002)(81166007)(356005)(26005)(508600001)(70206006)(70586007)(6666004)(110136005)(186003)(7416002)(426003)(36756003)(83380400001)(2616005)(7696005)(36860700001)(47076005)(921005)(8676002)(86362001)(83996005)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2022 11:33:34.8637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 159b8330-2e91-4018-58f8-08d9dd9b0697
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3642
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Change of_*() functions to device_*() for firmware agnostic usage.
This allows to have the smbus_alert interrupt without any changes
in the controller drivers using the ACPI table.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/i2c/i2c-core-base.c  |  2 +-
 drivers/i2c/i2c-core-smbus.c | 10 +++++-----
 drivers/i2c/i2c-smbus.c      |  3 ++-
 include/linux/i2c-smbus.h    |  6 +++---
 4 files changed, 11 insertions(+), 10 deletions(-)

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
index d3d06e3..026e2355 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -128,7 +128,8 @@ static int smbalert_probe(struct i2c_client *ara,
 	if (setup) {
 		irq = setup->irq;
 	} else {
-		irq = of_irq_get_byname(adapter->dev.of_node, "smbus_alert");
+		irq = fwnode_irq_get_byname(dev_fwnode(adapter->dev.parent),
+					    "smbus_alert");
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

