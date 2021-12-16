Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B4B4772D5
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 14:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237357AbhLPNOe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 08:14:34 -0500
Received: from mail-mw2nam12on2053.outbound.protection.outlook.com ([40.107.244.53]:16545
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237354AbhLPNOd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Dec 2021 08:14:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5GoIGsvKSuVCpADHUIZy5oKywtAfeYU/cDtdkGfCutQgXFRr91xILttXwJ2Dar7E2ySZ5sJ6+75j3cpRK3mT5ZUHnL+47x9v27v6A4IkiAzZ7Ycxle2rh6P8g/BEN2pj1mvCdxDn39Ga9JM//5Rpmlxq1ONec5eMqQtJpCYRXNrRd04LUtL9FXlFg1K82ilc76T2GRMYjPgUtFr5yInzaYgIU2lEVVVmjlDq4pw7gsTnUDUEwfB6FhnRgBaaR3nQiNfS3RrSLjMjxXf/DX95+Ol1vji0g4+teDFK1fbEW8QYIl8NI5gUM/VFp4+3+QpPh+FN4Diw+t+DKqVJjeo5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWE0tW8jo35j2HBYSx4glzTxE/OmkUGhDXjuxovpbN8=;
 b=ORP3jqTYqhf6QkG1MChOug6iWRZ64CYcgapvETV5yB5rs/MuPkF5eue3e2eoCeIQTaHpY6PJyGlu4bjsnxDaGrJD7/0Mc76L3HNvct254H6qePgK1LYkYiv75hQG7CaTBJ60v6LSIO9AeZUicljQX57sGz394N6NiBTY6UQ6VfzTQ/ttLnR+z0KxdYRCYYo59hkwpW/eNdOQmbhOE5UeHw6md5uQLuYKGwBsoHZ1mPxVyzBamrZuI2ehf8DdGVVCcylsgFsJhfOBnCPr0KqdgN1cUE5oy75sfGkVSLolq2e8v0q30FXKV6Tz1iDHCmgLUZ984n2sihJZ8Tx0mC0h0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWE0tW8jo35j2HBYSx4glzTxE/OmkUGhDXjuxovpbN8=;
 b=WSVmWiKOg1Ks6KR8ATrkRjj+Ah8E5nAylYvcJQcy25i0Erl8lIUSypG4L2zDOFb7e/qZkXoy7cGvDuQfIPSFeQ/AxN7sj4vgQ8gw24UKiE3XwqDWBYsMUQmR741OqOwdPmT852pkVe7tIyl37PPokgFgVBvkeQq0yl+ifFTKVIH95HNbxBfXLx7AmBM6Akq5oWisaSpcKPDBP1YF2+2jzMivqXs+LBEzkCgWDStA6tOv3TWzQO1LUePSusnieC5hIGon+ZybhD4xIVb8/bzzymElZrNZ0rJHEPs8VctHj4b9ccRuaS42z+bBJJO4FZnJP1aH3Nj4J1mwNaux+5aV5Q==
Received: from BN0PR03CA0011.namprd03.prod.outlook.com (2603:10b6:408:e6::16)
 by DM5PR12MB1228.namprd12.prod.outlook.com (2603:10b6:3:74::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 13:14:32 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::2f) by BN0PR03CA0011.outlook.office365.com
 (2603:10b6:408:e6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Thu, 16 Dec 2021 13:14:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4801.14 via Frontend Transport; Thu, 16 Dec 2021 13:14:31 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Dec
 2021 13:14:30 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Dec
 2021 13:14:28 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 16 Dec 2021 13:14:24 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <wsa@kernel.org>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <gregkh@linuxfoundation.org>,
        <rafael@kernel.org>, <andy.shevchenko@gmail.com>,
        <digetx@gmail.com>, <ldewangan@nvidia.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
CC:     Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH 1/2] device property: Add device_irq_get_byname
Date:   Thu, 16 Dec 2021 18:43:21 +0530
Message-ID: <1639660402-31207-2-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639660402-31207-1-git-send-email-akhilrajeev@nvidia.com>
References: <1639660402-31207-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccd6d01e-8bc2-43d8-e51d-08d9c095ff6c
X-MS-TrafficTypeDiagnostic: DM5PR12MB1228:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB12280E18FB17282577CD1F3EC0779@DM5PR12MB1228.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YNCdlq1KZ4OA1PZdw1U4PNeDXD11PUwt2inuCbhRM5LN9HGfMmEbVcjDG3lm2aAjXKmPqyz+ZtOIEh+PPU3wXrDK9iqjc7yd6sN2DskUDxXd00/MQie4O1xJyVFKFj0YzUVb3WEJ8HY2/HJp2yl2ug3MpY/0fSsP+RAsM3JzxjlLZG1rNjOZfy6fhSkNWxo42bqtWDda3z45tN15GtpIv/IrZr7MVbpoPfB6LN1OvcIYFXpdQ9u73NgZKDiHGfajfBUG9v0C2xAHQeUh0bZT3Q27exMHc0a4FmCl5OvPFS5EOo5bBzJGRXy5JQbYFOJP4/nzQB2exkfB2atzKtQbFdjj/WKhi8zD4T1or5d1ky90zG7PgteUFnVEMQW58si1TkwKkYAPWbg7K4x2nxc1N9BY6LebPZKzy89mbQlfthKExUDeMwN3i4eJ3rbWvKBprzThXNWBPPT0Ok7k5IqTlRQBrYAML6TeXzqINA1Jaze+FVTnmTL2DtssVNKgZSQ5z8IEfqx3rjTn2StPPYlHxNkq9ovUL++RwrZMk++swJ5bJrUE3D9Q7KnPAgeoLSi7T4HIMq4B3/fhBBktg5if6VusfMdic2yM2jDRbzz/ImLpmnRKLzSsVs7OFf9+vlUGQSUmXL/6YdUzXOji20sLvcj8ZYzy+VqZsqoAnb7tJqniDqWVtCvDoXMPo6wWwjqBsc4pCiGTa85VzpXLL/t8S82Dm8PvtfFWj0zgdRQb4cy54iiNELyAfH2tFHqDH2iiwHmo4PTPagIlnPgkAFCkIGkOdH9o7I2TqA6bfmbNHmLqkZMtW+C3BHFqJLagJWb/LEKmcYMmXRxAYXqt1dap/40Ogif7e22hjuOfW0seOE8=
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(336012)(82310400004)(36860700001)(81166007)(4326008)(47076005)(6666004)(40460700001)(70206006)(70586007)(86362001)(921005)(7696005)(7416002)(110136005)(316002)(34020700004)(107886003)(26005)(2616005)(508600001)(2906002)(5660300002)(8936002)(426003)(8676002)(186003)(356005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 13:14:31.5925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd6d01e-8bc2-43d8-e51d-08d9c095ff6c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1228
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Get interrupt by name from ACPI table as well.

Add option to use 'interrupt-names' in _DSD which can map to interrupt by
index. The implementation is similar to 'interrupt-names' in devicetree.
Also add a common routine to get irq by name from devicetree and ACPI
table.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/base/property.c  | 35 +++++++++++++++++++++++++++++++++++
 include/linux/property.h |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index cbe4fa2..7acf4fc 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -920,6 +920,41 @@ int fwnode_irq_get(const struct fwnode_handle *fwnode, unsigned int index)
 EXPORT_SYMBOL(fwnode_irq_get);
 
 /**
+ * fwnode_irq_get_byname - Get IRQ from a fwnode using its name
+ * @fwnode:	Pointer to the firmware node
+ * @index:	IRQ name
+ *
+ * Returns Linux IRQ number on success, errno otherwise.
+ */
+int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
+{
+	int index;
+
+	if (unlikely(!name))
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
+ * device_irq_get_byname - Get IRQ of a device using interrupt name
+ * @dev:	Device to get the interrupt
+ * @index:	IRQ name
+ *
+ * Returns Linux IRQ number on success, errno otherwise.
+ */
+int device_irq_get_byname(struct device *dev, const char *name)
+{
+	return fwnode_irq_get_byname(dev_fwnode(dev), name);
+}
+EXPORT_SYMBOL_GPL(device_irq_get_byname);
+
+/**
  * fwnode_graph_get_next_endpoint - Get next endpoint firmware node
  * @fwnode: Pointer to the parent firmware node
  * @prev: Previous endpoint node or %NULL to get the first
diff --git a/include/linux/property.h b/include/linux/property.h
index 16f736c..bc49350 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -121,6 +121,9 @@ struct fwnode_handle *fwnode_handle_get(struct fwnode_handle *fwnode);
 void fwnode_handle_put(struct fwnode_handle *fwnode);
 
 int fwnode_irq_get(const struct fwnode_handle *fwnode, unsigned int index);
+int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name);
+
+int device_irq_get_byname(struct device *dev, const char *name);
 
 unsigned int device_get_child_node_count(struct device *dev);
 
-- 
2.7.4

