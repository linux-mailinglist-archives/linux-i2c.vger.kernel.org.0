Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA0F348C5B6
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 15:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354010AbiALOO4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jan 2022 09:14:56 -0500
Received: from mail-dm6nam11on2077.outbound.protection.outlook.com ([40.107.223.77]:10240
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1354054AbiALOOy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Jan 2022 09:14:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOwNoQmaN5ENLvWQPWVwz3513FbqRiph2ZKWonZuAWVyk1Kylr2vYgrF6ANsh61/MlZy/otogwpPG06/JDlMEgbr4pAX0cH+675S2YKewG3VE1RWkKevd7QGDURF0npOwvo74OKOP+7DTUQEJvJyPzPbaAPj0WDpk6fpCUCfHSo86wujtXg5hxcm0CLJd5qG9LL6OoQFced0XJgvG/1i5hIzz9CsuXZifVqnsegmpEvIGYO9WC/5zTNLeY21D9gmdpSXSpUoiYWBnLdyB80igzMJduiaucHcBjtr3UZOjMkwbSPJWRK3hFOLVeeXO8nAhScmIDV/5Vi/s8E8pCTMPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYSJRTO8v3sfRme6LEbosz/9Z+d1dqsUHNYrS41Lh/w=;
 b=dB/+Bi2K5HGELwOdlktjdwmtNH4cRyILwpvzFKpx2BZxhLppnluNfB3EzBRIffFF+i8ZsX5qfO7bNJR3Qhzo1nsqURALwJ+5uVRlxYK/BmjrYe/iARvcybhUglFSy4sOEbFLDuOvoBHSN2Le7kVvmtyvh/jBJwZNYP9YEEhcC4BLi3fxpRzdhgVwA4awR2fCp71ZysGkbRTRaUkYaflBN/TrLDUfvtADZcktW72W/Xfr8kG1Rp27RPdTlZIa/9J57LtmHkejVXivSWg6JgVF0lMzREZKqLYHIPu8cMD2xTvaaQ6KATfHoE1yU3VwHLvoobolqNnu0oGdERL7ttHRwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYSJRTO8v3sfRme6LEbosz/9Z+d1dqsUHNYrS41Lh/w=;
 b=fyjCYyTd/PhI1t/OWwYqaacj9lO/b7dyNA5sG7ose6QLdNDYMbDKLVnLj0IbYizMYAxHhMExmby/OXl0Bmz3zwVaGsBguocacq5BB+TpgNgnTPmwbakQQfIfox9QuzLsCvTu0G1dHTJKy8kM3gMGXTDfQL3srzclaj1bkf6/6AL0L4NOJEJ0X21JlHbvP40vyrsrPXE7e6rjULR0VdF4ftg3Oh0XG81ObUPnl/V85ydtUf1m2iX8Zbu0jmD0VPEjtF1hgdQyf9p5+ueJAVcpdKWCzpJIXNUmetmx9X6saK980PFeRmgMRbt8wP+g597QrnVynfWygDco9anckLdefQ==
Received: from BN6PR16CA0005.namprd16.prod.outlook.com (2603:10b6:404:f5::15)
 by BN6PR12MB1764.namprd12.prod.outlook.com (2603:10b6:404:105::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Wed, 12 Jan
 2022 14:14:51 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f5:cafe::63) by BN6PR16CA0005.outlook.office365.com
 (2603:10b6:404:f5::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Wed, 12 Jan 2022 14:14:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4888.9 via Frontend Transport; Wed, 12 Jan 2022 14:14:51 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 12 Jan
 2022 14:14:50 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 12 Jan
 2022 06:14:50 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 12 Jan 2022 06:14:46 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <andy.shevchenko@gmail.com>, <christian.koenig@amd.com>,
        <digetx@gmail.com>, <gregkh@linuxfoundation.org>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <rafael@kernel.org>,
        <sumit.semwal@linaro.org>, <thierry.reding@gmail.com>,
        <wsa@kernel.org>, <lenb@kernel.org>, <linux-acpi@vger.kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v2 1/3] device property: Add device_irq_get_byname
Date:   Wed, 12 Jan 2022 19:44:20 +0530
Message-ID: <1641996862-26960-2-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com>
References: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be6ad309-c77d-4a8a-f51f-08d9d5d5e649
X-MS-TrafficTypeDiagnostic: BN6PR12MB1764:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1764BCBA7A41B304BE149201C0529@BN6PR12MB1764.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GC53OdbZwHeTG1pkAquLvmn/fhSbkFG3LKoJ8R4Bwd1/fREYItgS1PuV7SIRDoN/kJUDcCq+mNvPGRUUWRok6F4qByoh8TBgajapAcd4qlrscQRGXFu85VWEZRLWHN7SwPC5T7BvNmfOxhuB9QZpwm32yASTE1KPUa3sMlkW1zW0HF87CUjW2KB9eJveSyRG/1xD46tQzJ+WoWhrAkD806WmWEG8caZq/Jum2BYbAjSpRtEIn/lvJAcz/6cG4t4dvQGJf3828UiOX0ZVKTK6GgvdQspRvdv+UzsnNzlMjkOBTKGcXjTBTaj4IpG0iL6z4kspIve6bv0JWJHH+OVoCsRdWT43+XGCLtOr16Ye9E/ORBnaCJhPeXxWj0b5QCVxXptWMAckgDhfre9Cz3skhLF1vHvncUrS5FvCGyUO+i4fc0uczaqZGVy2jRIY/fUQblWjLMEi1oUMLjieGCmqxVMIxmQ9L/GL918rhfo/ZMWqePsR9DVaV2mv6TNf3R1SSNN0IAPfPt5Enam3Qbt5+bni/ULSRkhbHJH1AWBKhCZyZXaWNtQ6RJuUYbBVc8MLwS95OQfZo94+0w5hzxpEH1c0CXsK+RItGOXCzgZjilt16Ty/+IdKbP6tGnyqzcnRcPbOump+OstMNqnUxY2s7aj1wtmClfTCD9GxerPXTtKMGlHf8XFUx6ooBpy7RIuOyK3pHzyyBygDLwqWHwyasRizCMmyEnIq1fp9CVTkvRg07RbJXNkM7dkLFOZ3D+n69ULb3BLcn1QVN8adAz2KEfj8GMREqVMo7dJJWJrFrFETb4VuhvuLbPkutC/hjm1i3x2iCF54h3kMSv8mPbHfdlXtySl7B7wjgLY7/mmdBAIGFRIrKFMjPMqo17jxTHXwYsVGc5DDH1F0P9U6z0LemkYy2G2NSKniB0QeLoCCd0o=
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700002)(36840700001)(46966006)(7696005)(921005)(186003)(2616005)(70586007)(70206006)(107886003)(86362001)(110136005)(6666004)(82310400004)(40460700001)(26005)(336012)(426003)(316002)(8936002)(2906002)(47076005)(8676002)(36860700001)(81166007)(508600001)(36756003)(7416002)(4326008)(5660300002)(356005)(36900700001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 14:14:51.6274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be6ad309-c77d-4a8a-f51f-08d9d5d5e649
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1764
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
index cbe4fa2..414c316 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -920,6 +920,41 @@ int fwnode_irq_get(const struct fwnode_handle *fwnode, unsigned int index)
 EXPORT_SYMBOL(fwnode_irq_get);
 
 /**
+ * fwnode_irq_get_byname - Get IRQ from a fwnode using its name
+ * @fwnode:	Pointer to the firmware node
+ * @name:	IRQ name in interrupt-names property in fwnode
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
+ * @name:	IRQ name in interrupt-names property in fwnode
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

