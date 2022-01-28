Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72CC49F88E
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 12:45:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244400AbiA1LpH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 06:45:07 -0500
Received: from mail-mw2nam12on2069.outbound.protection.outlook.com ([40.107.244.69]:59744
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244361AbiA1LpG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Jan 2022 06:45:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coyS1Imvodss8A0sXWrOP/5V6Bs7aGRpw8Q3U+6sipR94YU1DKbza6PcSraSaOq735ESFMUMtBf3fe61ZO2oGhnomo9WNfmp84ZhtvTaDm9vTTVJzuqq0is7DweH8qSlEJXeqS9G9SlrCvdmj5XHYtDGzhOHqErEl4/aB1C37KdQzGMm3eTzJEHDYaAjKZQxcJTFPyvm72yvjtmyXBklayqtSOuAu5buYMKtiBrVuoOOTUGiTjQeJrk3RuOWi04nRBoxq5xZIQIFx1BL0zw1vIN+0oXmxRdmHP9IfjkK1lZmM8/6cVmZRECZTLG1vmUQdup1z9F3Gs+4kfGtSklpYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GLbKgWihjD5+WOrSEYy6jPjAmaaDcJ4cD5mFgqEwyY=;
 b=b5gdAH6OQqWmJe6v4j1EP3DLiCO3mhaCJIbEAtfcUSgwf21FRuSmWObzbyn8LERK/M1C3T2LtSeXYm9J8qTD1ijLRtfBCiE0vTCWrGKrAKpjPbPlJV4dXRwyKU4rS1+uj01cFQ+QZatS05sobv3mvmrRrDVmP1SY+IHk1gUbpMTfyII+Z/JlaU3SrHWbQ0Zx3h73ohdfaDL9cALxwK2IQe6hKlopey5nDamovzZLD7XrfmvqA/g2YgGw5UPpbJWLLtKbSIUmIlYV9ISE7a8YGk8a22W1PtaNSzzfgysm0WpQnDjvo/uQ93DffM5s2pCQTIDfwU+BVyWtF+AQMDHcqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GLbKgWihjD5+WOrSEYy6jPjAmaaDcJ4cD5mFgqEwyY=;
 b=KA9a+iZKhL2z+9917N0wWI0/YpGp1wXeVczGRgpm0iD4Tt2cX7/ihl9crYlSAxmfVAqxVU4BnkG5GwtbmUvOXDFwGqZ8Fcvk5kgw1s/ac/x7B5y/a/6AX6mCogvvIMhmFDj9OirBWG88rU3ZzI9+ar7oSHW+HkhScJ1HAzFKEP7fUqJqUAF618NjOTCIEsPRdRHUySAYIsdc1tZNYGl4I6s8v7FCrrY6NSBChqfiUD9zL9avrgQFiwWHQHNQb5n1YUOEGRp+oVYGH2nTEwqXbu3LVYCG3HLf1xjSRe1o8c7azmcbw5axFjFn1Uw8ZeeKVXY3/PvdZyGHzQseUUGhLQ==
Received: from BN0PR02CA0028.namprd02.prod.outlook.com (2603:10b6:408:e4::33)
 by DM6PR12MB5551.namprd12.prod.outlook.com (2603:10b6:5:1bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Fri, 28 Jan
 2022 11:45:05 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::58) by BN0PR02CA0028.outlook.office365.com
 (2603:10b6:408:e4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Fri, 28 Jan 2022 11:45:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 11:45:04 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Fri, 28 Jan 2022 11:45:03 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Fri, 28 Jan 2022 03:45:02 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Fri, 28 Jan 2022 03:44:58 -0800
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
Subject: [PATCH v5 1/3] device property: Add fwnode_irq_get_byname
Date:   Fri, 28 Jan 2022 17:14:25 +0530
Message-ID: <1643370267-31804-2-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643370267-31804-1-git-send-email-akhilrajeev@nvidia.com>
References: <1643370267-31804-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ef56112-9f6a-471b-797a-08d9e2539ff3
X-MS-TrafficTypeDiagnostic: DM6PR12MB5551:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB55513A31D8A25413CEC738B6C0229@DM6PR12MB5551.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gHgSkN+MZ+LP9IrUi6VwGhAtTNYUFWlCAMlXHnbo9CXFyub9oq/ocOVOr2RAFzZ0n/C8EdIwsQC5HkTMFVrvDPGls3xJa3Kyhq7B3dwEL0tMGrqLTh7omC+8tMxwasQrGq2zuBftzj35O74c5/UzQ4FmIdQzN4o+9sjkn8DKt0lE1aTcbwt3lsESU5Ig+LCR6XOA9kgVdChEB66oIbpTdBcwDADp5r89XBRdgScXNj5al9b4IRnVIhnvIqPqzB+ThGlVQQCbLJGKKTBLP2Izs6HOFpRjDIZMTJuTJeWOn04buDY4xR+vgLlovOsJRXLsjuDICKTQSSxn49r1KYKHcVHUpNEfe7VVk0qWewcdUWIsgO3J7KnWOqEOk6+AvaywQjumAxE7DqTiIcyvKQKUwIDuJbk4A4Wmc/bYc82JL+YglADD34qE5fma3lwk4GJRGc2iVMWuW89EUvyN7kDEp5vCmfZ1GGKgqwWVD1vHEZSdDfyBUYu2ZJa4UKIj9AMtD33tUYaB1ONDHd2wIsxcRckxNegk4ox7WOKYDGXMrHHuWZJz9//IN9R/9ti18gibbn8TCznXHe0S/eVCLvWzJcPrlSuQcD051Jx0Q1yn4f4UKVcFoRvivXEzGkujd6gFvrW0ci5WMOztLjUK57570LKhjQw7GQMlAu3ruP92C313MRKYMNG+JIU+x3In7ZNPbdxtG/XTQoPjiOQbP9JmwNziDhaHoxb/vyVSl/C79Q01QYtNm/eeK7wB27gKJ+1JyygcXlwyAgFuFibNrnxCjw==
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70586007)(70206006)(336012)(8936002)(82310400004)(426003)(4326008)(8676002)(356005)(40460700003)(86362001)(7416002)(5660300002)(7696005)(107886003)(36860700001)(26005)(921005)(186003)(6666004)(2906002)(2616005)(508600001)(36756003)(47076005)(81166007)(110136005)(316002)(2101003)(36900700001)(83996005)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 11:45:04.1613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef56112-9f6a-471b-797a-08d9e2539ff3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5551
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add fwnode_irq_get_byname() to get an interrupt by name from either
ACPI table or Device Tree, whichever is used for enumeration.

In the ACPI case, this allow us to use 'interrupt-names' in
_DSD which can be mapped to Interrupt() resource by index.
The implementation is similar to 'interrupt-names' in the
Device Tree.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/base/property.c  | 29 +++++++++++++++++++++++++++++
 include/linux/property.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index e6497f6..fc59e0f 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -936,6 +936,35 @@ void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index)
 EXPORT_SYMBOL(fwnode_iomap);
 
 /**
+ * fwnode_irq_get_byname - Get IRQ from a fwnode using its name
+ * @fwnode:	Pointer to the firmware node
+ * @name:	IRQ name
+ *
+ * Description:
+ * Find a match to the string @name in the 'interrupt-names' string array
+ * in _DSD for ACPI, or of_node for Device Tree. Then get the Linux IRQ
+ * number of the IRQ resource corresponding to the index of the matched
+ * string.
+ *
+ * Return:
+ * Linux IRQ number on success, or negative errno otherwise.
+ */
+int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
+{
+	int index;
+
+	if (!name)
+		return -EINVAL;
+
+	index = fwnode_property_match_string(fwnode, "interrupt-names",  name);
+	if (index < 0)
+		return index;
+
+	return fwnode_irq_get(fwnode, index);
+}
+EXPORT_SYMBOL(fwnode_irq_get_byname);
+
+/**
  * fwnode_graph_get_next_endpoint - Get next endpoint firmware node
  * @fwnode: Pointer to the parent firmware node
  * @prev: Previous endpoint node or %NULL to get the first
diff --git a/include/linux/property.h b/include/linux/property.h
index 7399a0b..95d56a5 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -121,6 +121,7 @@ struct fwnode_handle *fwnode_handle_get(struct fwnode_handle *fwnode);
 void fwnode_handle_put(struct fwnode_handle *fwnode);
 
 int fwnode_irq_get(const struct fwnode_handle *fwnode, unsigned int index);
+int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
-- 
2.7.4

