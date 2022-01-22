Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E25496C2E
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jan 2022 12:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234368AbiAVLdV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jan 2022 06:33:21 -0500
Received: from mail-dm6nam11on2073.outbound.protection.outlook.com ([40.107.223.73]:45632
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229678AbiAVLdV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Jan 2022 06:33:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8DdXaTqsnP3TKQXdEWpF/XjILfsIM+aetOU4u0Q30gUke0nPZanyGKrDAghVWlSeojv2QiB5NGrxrtORkKJIkSip+MxfzyWujkXkwugobdgZ7T0chNbx3glXMa8DIBA4rakm8JvT93kmByRAw93mUXOIENs5+QUT55f7GSWA2YKQjV4lXfx0+zXEVmOLP/rWS5u+vjbCjy3UpBm5rhGpuVLGY8OFlxF1Qx2Zm6dcPJtAOtsC0Gan6pCkVrfip/f9LHXsvObaLBLT9TFuDkkpc8ls2S10Z6CalYk2QvepXuQq65E2HSXCM7J4CCXvaTAzQ5UdxgtDufIf5ylbcckQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrLUu9G4K7xqSwXLM/W9h8nTno9bSSBpviXglNYTcGE=;
 b=kffPjPLMR13F9a5YQXNATh/SIzCVNpvMF0gHUt1AVxIRREmMixxzgc7SOdreGnqaeG/pEJ+HrE+NTKmnNliYa8AU69yPubNEfCke8aZhBWNeuiwm4HStuo18kYqvAw/3CIlee4g+MxRrq4OABGFsM7sdF0p8SfLu2tpXUQeoCgPcv8SG81apgjLC0EnmmjyCdzqg80DAg+KHtyYkB6o+r4CVQLiU7g9fQE7+T/Ku+91LmBZ8eoQ5VCizHV5OBaw4pYh3fRGrYPQtlSg6zVhhwmusYmBgcs4SQthUGzw/3gXnncsEIoTt0/jtyamviwc1MVTe2nhe9FC8qQx+c0bEGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrLUu9G4K7xqSwXLM/W9h8nTno9bSSBpviXglNYTcGE=;
 b=FTboXZNfaHnv9uVoorbA8RFLw8Sf3ma1dKflIjnOAyuigymiFuXTg6xG0pRjjnYR0eYUHwTz3Uqp/Gx944x5xyuKIAN7NruaLWYjTiMmp4OIgWuVimgmeaYjNytvoI4AQoVQoXk3XmCnqKJ94nXTsuMmGvzoNUsTpop8hzHiDXzZlbTWIBfnpWPiaCyhBtz491xW5um6QS1fkqPGKHp3FbGwdsEWS/pD13c1mu6gL5oso4Gg5s7M+7jzIl64iAmdqzp+SU/eP6eMOU2BJ/xqpLIovaC0+j7BbQBgNfYwZFqc94Hk4DHlD+3gUZxkizcjuA9/dCiac3NKJPSfZQhPCw==
Received: from MW4PR04CA0182.namprd04.prod.outlook.com (2603:10b6:303:86::7)
 by BL1PR12MB5318.namprd12.prod.outlook.com (2603:10b6:208:31d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Sat, 22 Jan
 2022 11:33:17 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::24) by MW4PR04CA0182.outlook.office365.com
 (2603:10b6:303:86::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Sat, 22 Jan 2022 11:33:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Sat, 22 Jan 2022 11:33:16 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 22 Jan 2022 11:33:14 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Sat, 22 Jan 2022 03:33:13 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Sat, 22 Jan 2022 03:33:09 -0800
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
Subject: [PATCH v4 1/3] device property: Add fwnode_irq_get_byname
Date:   Sat, 22 Jan 2022 17:02:44 +0530
Message-ID: <1642851166-27096-2-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642851166-27096-1-git-send-email-akhilrajeev@nvidia.com>
References: <1642851166-27096-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ef31eb0-8b0b-4b61-765b-08d9dd9afb78
X-MS-TrafficTypeDiagnostic: BL1PR12MB5318:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5318FDC054411832D84E118EC05C9@BL1PR12MB5318.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /X71dCDYd+VfpcNWaob96aJzOC+VAf+8zqEkoEGxVp0UqX/Ui6AxKWm0kuO+zuZwTbO1fHymeupGa1XQsZ2jC7ABTYK+oxZ9U+29nVj1OwAan/B4vHuyWBrPEbvgmRsDR0PapSg9/7iXBs49U1fFn986XcHL39JLwKbUYpnfnJ/8nC51fSk+UyGVljPybRyPyaUCErRFPh1kGiplN0YMaeiEj9wH5sjZRR2q5PrMhfC9iOHsHlQua81Sk38j85PAUp59rmlWC6CTewWYe0HEQ8k8D5SJX/kZzuC7ytv7TKKx2wf8GO+iJbeiCGg45EoQ/hZqq77RTUS9avfI4rcB+ZOeb2o9vroX07UfuQt7D++UzeMkoLRo+RoXeSyt/8z006fDYVHK+SQ2QSifIhWDX7QL4P71RqQPL6PPDdVlT/VIkw98GuTsR5WvkSBTyuT4aRCGO5wTfeeThsFEk+jGJfVnOexRdiwGZmL8uwajH/JTk+PkCz2KA2sjd9SC9hdPlxki+onsGwKrwHcOJ4KCGOntXB1+jxYLRJ3tIiFkBE6X3FHponXC8E8dQK5VGUWBVkhlcxU5jK3EfcH8VCOz++kEBQP9DzZnGvMjEc3z3ZKN7HZ7DF6ppRqk+qrEOuvTgWsC226nZOxT8aE2tEWKp3/FMWfeauGij2IpYh5ffNzttM6sKKgIj1Ij8r8w10EiW15Qxiy2bPA3k6+H3FisiP9Ke1sfADCm8/Wwsuk0AxaP8AeEqXONNyALxP6RFx4UpJvVuFw2DBQYw2taVHFUVSL9690OjYxELjIH6j3cCaGOWxf0PSU5js9sQBGxAS16HeuByOgpaBf1I9ZGBC+MsNt8dSnPH9EPZfSkJsy3jDqAt5+ZosR9ac85FEUi2fFzYvcLsKDu8CpP1m+yftjScj2kVuWPvoV477WsG+AOnMw=
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(46966006)(40470700004)(36840700001)(107886003)(356005)(47076005)(40460700003)(336012)(2616005)(8676002)(316002)(70586007)(186003)(36756003)(426003)(5660300002)(508600001)(4326008)(921005)(36860700001)(70206006)(7416002)(7696005)(86362001)(82310400004)(110136005)(26005)(6666004)(81166007)(2906002)(8936002)(2101003)(36900700001)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2022 11:33:16.2220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef31eb0-8b0b-4b61-765b-08d9dd9afb78
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5318
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

