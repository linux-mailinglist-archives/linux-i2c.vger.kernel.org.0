Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 960EB49F893
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 12:45:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244361AbiA1Lpc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 06:45:32 -0500
Received: from mail-dm6nam10on2085.outbound.protection.outlook.com ([40.107.93.85]:64129
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348163AbiA1Lpb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Jan 2022 06:45:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evMm25y6gsJyu1NeBRlE4LchYq6zDUQnUS85XgGqD14Xd9iYCkGM2l6QJ7kiDNTxu0P9DgMtTDxMSgaHJBdYcT1QYuSBZM8WFN8BcoTJgU0wDIxzkelsJUwULHoarJGN8RmXB/nHE7c0tBE4f4eh2eAKzS2Wj4oHmTXM0K6IdfDc19+FIwIAeGX5NrnhO430zw8wC0pLf4pe1pPTfblbyI9brEls5p+3YM3zxZsxW98Lx8FRhP+di2zh5WLnB2IEKpJlK8aoW0fjwxsPCEvjMWbqG3JbnVrMAqo5FDK6gREhlScVIPUsAKKGIPOY7ZdD6KZLWVynxTyiqw8y4A/PLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5vYvKR5djdhNBCA+9M2bxCJI48EQzU4z4Z4raHAYB8=;
 b=lPNwFLPyi2dkQhv66BZll9yXfdS0hLj1+RhygXiqI1AL1GFY06NyTYAHUygViRO5g/3l8Vmva7SwRvF7nkF+VPwnarU9FUneDICYT07U/the4RhIsAp+GUnMJ4CP+vKHFr0mkBYj9vAgIxyLwAv5q4pxp7FzFXXAVXjCl7MAYkZE2smkwDjUZKqiwsthGuvpcCzYRVFNN4h/mVkdGT0pRq7pJvCYBXdqGTyl+/MO0JpgiHTPEP99v8QRijQLt0NGsSayqQpwOsOmcM4UB4tryZAq78abwYeJG505LxKLeFyCwSaIpPIFXNPcSKEv58NhZDxRNITEMcv2ibUQ0lZMOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5vYvKR5djdhNBCA+9M2bxCJI48EQzU4z4Z4raHAYB8=;
 b=nhYyUT5+hPppf3/a5hUW6/90YtUTEOrK2rCUmup9QXKIvO7vfft0R8Z8E/q+wYblWSZ/ks4Apnx8B9hAhKTE8lYYiaigQN2uOkUYCauFIgNklQA+scw83BJJeTopNr410urToH5h/CBkQCNdNxgPR5orGQAXkoqLKPEd/9g5gBn7G4mkXodUYcv3Rs4r1AVcfFKQrcJ7fd/JlREO1vpF9NTko5RAYdNLbDZdLy+eK+ZUL9KZzDYo12oWANmsQc48XsDgCzOoQnt2aBwhFnA+4ighz8+5PyjdjMEMirYdhNyX95fU6fUh3Agga2E7qMj/2m5fRo27cqtfUTfWBKoN/w==
Received: from DM5PR07CA0100.namprd07.prod.outlook.com (2603:10b6:4:ae::29) by
 MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.17; Fri, 28 Jan 2022 11:45:29 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::69) by DM5PR07CA0100.outlook.office365.com
 (2603:10b6:4:ae::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Fri, 28 Jan 2022 11:45:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 11:45:28 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL101.nvidia.com (10.27.9.10) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Fri, 28 Jan 2022 11:45:26 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Fri, 28 Jan 2022 03:45:26 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Fri, 28 Jan 2022 03:45:21 -0800
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
Subject: [PATCH v5 3/3] i2c: smbus: Use device_*() functions instead of of_*()
Date:   Fri, 28 Jan 2022 17:14:27 +0530
Message-ID: <1643370267-31804-4-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643370267-31804-1-git-send-email-akhilrajeev@nvidia.com>
References: <1643370267-31804-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29e0ee5e-1636-4340-69e2-08d9e253ae65
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3613D29AB5DF7A36771B254AC0229@MN2PR12MB3613.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AkdszMIJsoo0NX+mRQtPb0XkWyJpkLXWth5dU0jAcLn+M8jpRAa35Ev/1s5IAUxnn0aYKN9dJIw30guiUYwC1vAZag1upZnnEfAnZrORPpdghEbd3zpxlLkG8X5eU9tEbAahIlu4DMmFo26kENsPOitHbwXPSVsj64vGZcS6qx7yfmYPRu72B9xM3wrb+bm6FtE4j0QZ0Is4AhdbNB0IiOrT5kSJUAbdAyiPHPjDZRy2gjb2K8kMYcOk2IHljN/mtaYPMw7iBOXoyv1ngbHEAXPxqvu0QWQudavxfLcfQAq/EutaMtNW+3zWRvXPWC25YjFycEXZ08oOt8+sDrg6JyGvaEGKnj6rBNNyjbbAA/CjNKHmNJFCBlWObVtIXr4tqsmaCgUXcTfo2mUqLzyier3Yc/FjU+a2eQ4BLO3vKg90VF7ehEST578kngfjyYJ/tirUjq7hxfZ+qAF0u53KcPKX5eYWAf6KF9fO4V0aH8w3JUPBcibZTJW9KlJHFj/6XEovNirdC67o8qi0of04PzrbHAkuaA4CCVzSpWOXcM7ji+yoYQ62tvxpkWqtPWkfzIA+rompNpSyYbCkK/J9+1mdJtlFjtv75QhTyhFrkje+ROQqwlkXLXF3NZQff5XM/92M30LVuX43TD0neEAH/yxadXj2r+ozc/RHa15gPoIERiKtHAn1xsQCBzpo/RCI3fjKaaVR4U5OltpMlaLC7l56nXxvifJW2qLhohVA287OLMi2vNSVRTS/q1UI5b7g59rSrHxZM8HgmfytdY6X9w==
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(2906002)(7696005)(40460700003)(110136005)(186003)(107886003)(26005)(508600001)(36756003)(316002)(2616005)(36860700001)(86362001)(83380400001)(426003)(336012)(70206006)(70586007)(82310400004)(4326008)(8676002)(8936002)(81166007)(47076005)(921005)(7416002)(356005)(5660300002)(2101003)(83996005)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 11:45:28.4430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e0ee5e-1636-4340-69e2-08d9e253ae65
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3613
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
 drivers/i2c/i2c-core-smbus.c | 11 ++++++-----
 drivers/i2c/i2c-smbus.c      |  5 +++--
 include/linux/i2c-smbus.h    |  6 +++---
 4 files changed, 13 insertions(+), 11 deletions(-)

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
index e5b2d14..304c2c8 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -14,6 +14,7 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/i2c-smbus.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #include "i2c-core.h"
@@ -701,13 +702,13 @@ struct i2c_client *i2c_new_smbus_alert_device(struct i2c_adapter *adapter,
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
@@ -715,5 +716,5 @@ int of_i2c_setup_smbus_alert(struct i2c_adapter *adapter)
 
 	return PTR_ERR_OR_ZERO(i2c_new_smbus_alert_device(adapter, NULL));
 }
-EXPORT_SYMBOL_GPL(of_i2c_setup_smbus_alert);
+EXPORT_SYMBOL_GPL(i2c_setup_smbus_alert);
 #endif
diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index d3d06e3..7753329 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -13,7 +13,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_irq.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 
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

