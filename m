Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23E9E494F75
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 14:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243803AbiATNpX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 08:45:23 -0500
Received: from mail-dm6nam10on2080.outbound.protection.outlook.com ([40.107.93.80]:36287
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244616AbiATNpD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jan 2022 08:45:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Do5KuYn30UlQ+y7mVhDJ/m7LeXv9uGr7YW95v7OCWcUB1rcxJC0cTlcsmuDlWh8QyyGcmKHXwGkDpfkuebK+xY+zYe7ADHAxplgKIu4q/TRStk2cGZmQKyV9ZigdXAg7zuhyyMflZFdWYjbtKXmMET0p3eWini1OfHpLJHX9qYKx1elIhQa+HN+7g4bXuk8aZBjJ6Jc8Rj0PEUhcVzXWCnlgXIdrQCmY3lAtN37TBZsbrUeZ6I+5K5mnhLNTkT7Ri0wJPExkFTqcPDskzVhEnkadSKNMlyp/BgH9f+YLaySpNQmFV/wcvQkinmHhGLKudwYyT28EHsrKN2FZRvYa0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rroq+rsrmX/YlTjtXsPZqI++N/QU2HLd9kAmXQDrD5E=;
 b=ZndS1hAy+ZUePeT687VLKAPg3Rx3QXynHO37tqgbCiQIWtgE/J2nGfxlRMDhmbUUWXFMuR3Q2gQMRSN+f3Hqg3R7zkRvnTYmYx/TzypPLd/3dV7AC+yK7c3BQkAiPwN8WoDPdngm3F0K3Nfud6SzgG6ur6bKbmKmfg5GfHRZWegZ0QoIVnTfmntLWoEG18M3FVNiWY07bIddUqgx7/HfSi99lMLZsGBjGdowC1z7cXJSa46jzamu6Fjx3i41JQdIJgHfn1M9Siw8yafCamP1StN4ZR98zu6RfZL5qIvNFhqvqTdVydVApMinVl8z5r/4MIGDtsenYhY9dnQetTze1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rroq+rsrmX/YlTjtXsPZqI++N/QU2HLd9kAmXQDrD5E=;
 b=MwdAOXp0UibWIb9wl00tKKjHDefTpE0CSyiVq/ohiRIklMQ65w2c2CimllwwXUQn6KrsgfsG7MZHvnGixvs/nD9T7b9PBii7xdEofkcV+fVcvKO61EdXkMMpKVk81nnEGBSLsIeuI6zV1G6kTViFTCWG3xUAbcaxdFZs8xw4KtEUHCXSYcdYQsVjpnB3WxHXB11i28wFf7m5b3ckOKqhZIBA0aywxb2O1NCyzdMVLygOXQE40zemABdoN2QSvltoPlO/3nG6kAfneow+9rRreG1bTiwAIAaFMOYnp0fb29/WFFvQ+LeN8Obi2RSuHItvEMX28nGvf1x0Ttnuc+h9nA==
Received: from DS7P222CA0029.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::28) by
 BN7PR12MB2627.namprd12.prod.outlook.com (2603:10b6:408:25::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.10; Thu, 20 Jan 2022 13:45:01 +0000
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::52) by DS7P222CA0029.outlook.office365.com
 (2603:10b6:8:2e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Thu, 20 Jan 2022 13:45:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Thu, 20 Jan 2022 13:45:00 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 20 Jan
 2022 13:45:00 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 20 Jan
 2022 05:44:59 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 20 Jan 2022 05:44:51 -0800
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
Subject: [PATCH v3 1/3] device property: Add device_irq_get_byname
Date:   Thu, 20 Jan 2022 19:14:13 +0530
Message-ID: <1642686255-25951-2-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642686255-25951-1-git-send-email-akhilrajeev@nvidia.com>
References: <1642686255-25951-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca838049-da7b-48f8-38a8-08d9dc1b0e22
X-MS-TrafficTypeDiagnostic: BN7PR12MB2627:EE_
X-Microsoft-Antispam-PRVS: <BN7PR12MB2627A2BDFF984478411017EFC05A9@BN7PR12MB2627.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5HGGPfhU0CcuXd8pQ9DrKyT+obuc6zil6ugze5RkRDd5fuMTTkmTdY73ZulEUthZwXar2XLvfbNDur90J0ZIX5gs/MQWrwoDOk1RaSRNiGpuuLduIhMsf+O/Rdsrw0G2CrUPU4f4KqYVETkjMPA3DNDB4SUkwC1mvv3cS+i5buH8XYBTMhDHLfvdv4s7nikARiA1PkrJd1klyUkMrQ2py0lAbcqrWy5UTxlnU+KU8MUv+YIy6udRChEwcqGBA1luk87CX2DlN6BAY6yIfDLc7LxJvykGLW4a1jlsbznqU9w3xzm1KyxC2KCwP9jGXABFALXV129DjE9PCULnm1SW7+MdH3GNgyV2f5SB7oKQpQfXzCOfBiGt3uwwDXCZwzXsyp87rgDRoAGAcVueA2Lh3TtAeJF20PFrD+qIjJh+bcAyyj6oNxmLGtHxj5WyD1fFhUVP+OkY9z7o4Fxp+EDcS8vUCEwTPLCH710HbOCXJPLbj9PVKGkAh1e0GiBYdH7pnc303fXuNtZE5i/gsORd/FxD4bSkAf5ll0nGVGfey/YKvHw+CF5TpYH65mKm+dN+2ofOEXvgNHFsWchNnmScmEJrMZasK3iNkJQ+atfigDS0AWPKLKbNBGSyEGgaoH/P2bbKcggG482kokOgVTV3rCv5RcKx7Nhw7mhX4mM/Ok1GzXmc2JX0AWkju1wKuGIho3TvrKzqeeZ344Q3IDFLWHKE6tEcXWyl9Dox3r005mPx7tnhe5PD6I4kaDLIKPw7X0JVZTbBEJxc4FLezfBL8qIN7TnXO5ayE1RZsk+ltZXMLa3Q1OpDsq/O3pWGY3ZOGE/xHMjF9yQ50Bs/cibD+mKNfkWi4BY9AL5SGwpTkwk=
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700002)(8936002)(186003)(82310400004)(36860700001)(8676002)(316002)(336012)(47076005)(70586007)(110136005)(4326008)(921005)(26005)(6666004)(86362001)(36756003)(5660300002)(508600001)(7416002)(81166007)(356005)(7696005)(107886003)(426003)(40460700001)(2616005)(70206006)(2906002)(83996005)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 13:45:00.7737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca838049-da7b-48f8-38a8-08d9dc1b0e22
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2627
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add device_irq_get_byname() to get an interrupt by name from both the
ACPI table and the Device Tree.

This will allow to use 'interrupt-names' in _DSD which can be mapped to
Interrupt() resource by index. The implementation is similar to
'interrupt-names' in the Device Tree.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/base/property.c  | 51 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/property.h |  3 +++
 2 files changed, 54 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index e6497f6..962a645 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -936,6 +936,57 @@ void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index)
 EXPORT_SYMBOL(fwnode_iomap);
 
 /**
+ * fwnode_irq_get_byname - Get IRQ from a fwnode using its name
+ * @fwnode:	Pointer to the firmware node
+ * @name:	IRQ name
+ *
+ * Description:
+ * Find a match to the string 'name' in the 'interrupt-names' string array
+ * in _DSD for ACPI, or of_node for device tree. Then get the Linux IRQ
+ * number of the IRQ resource corresponding to the index of the matched
+ * string.
+ *
+ * Return:
+ * Linux IRQ number on success
+ * Negative errno otherwise.
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
+ * device_irq_get_byname - Get IRQ of a device using interrupt name
+ * @dev: Device to get the interrupt
+ * @name: IRQ name
+ *
+ * Description:
+ * Find a match to the string 'name' in the 'interrupt-names' string array
+ * in _DSD for ACPI, or of_node for device tree. Then get the Linux IRQ
+ * number of the IRQ resource corresponding to the index of the matched
+ * string.
+ *
+ * Return:
+ * Linux IRQ number on success
+ * Negative errno otherwise.
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
index 7399a0b..3123b75 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -121,6 +121,9 @@ struct fwnode_handle *fwnode_handle_get(struct fwnode_handle *fwnode);
 void fwnode_handle_put(struct fwnode_handle *fwnode);
 
 int fwnode_irq_get(const struct fwnode_handle *fwnode, unsigned int index);
+int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name);
+
+int device_irq_get_byname(struct device *dev, const char *name);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
-- 
2.7.4

