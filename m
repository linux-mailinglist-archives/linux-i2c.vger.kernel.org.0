Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07BD494F7A
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 14:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241078AbiATNpe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 08:45:34 -0500
Received: from mail-bn8nam12on2051.outbound.protection.outlook.com ([40.107.237.51]:19617
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242923AbiATNpT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jan 2022 08:45:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpKuKM6y6AmmsPjvHXHU6pfdIOASXnMfq4xd6mZCDv0iSnxsGRtvX8tKCToVa+AnIADHo26sKph35Z/2Vy4lyDs73XaBG9BcQ/w44jVBcZiHBg5ZzdFvn8hbrufhjC3mjLGPYz/xp06HJPMuFe35Tef5CLXToM4Z/lxBKAHq3ffaddVYMicXYEgdPcW2wueRRDojBxh2ew6wVFzGHwXov28l0URW8hNfGgWNzyug3r7T0jwr9hV8HTYkL92YqPnxUq3vG/yD8PRznUKLWP4lkXFu/XCixbl3uzobvKZhaVGmA/F7WD4BQ60HDfUv3lGKn3SnYIorswmPxO1USnf5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDFr1KZG2DKyzTQF94hEl/n3i3K9Irn3zeL0hGNEI1g=;
 b=CpgmnPHJsXImuJF57IG+gvgm9Otw4t2pV1mdH+e+yVb+Q1PwC/yQFGexAhlnRcLnBq7jjKP6ZN8MYV9mt/2iKr+SyHBOk9/TA8WE9YZ9ycXXN2anOxy/hDLnxAXRIxuJng/+pnUzvIQDj8A1C0PpwE+5wlkQENx5ac0Rw65i7YC+wJfgNPzykkVPQHB+BcFuF1UJZKb6laflCHTIgeXKq6XLYStbm1KqP/oNJfkCPruqxB2+VeEDUL10s7iY4JyJw7SEHPKYRoT46tpxSNhMPg2OubtPUQcF+DRyuoBNXLTlR+yIcSnIaobbq+rhO1WKTEFvRH7+RNsV896bm0iDoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDFr1KZG2DKyzTQF94hEl/n3i3K9Irn3zeL0hGNEI1g=;
 b=peEU7E9fjtcH+qfOfu7uV3JZKOT2PWZKoJz4eofU2wtsAPEv7UPL8gU/klwqXOqzjRVtwWpZ4elkrr/SkGYOoAgHTkbDiO+IzJgse9f72bSpkvcLSqTxt8tvP1HnCjPc15bJ/wlRXiY5pXkDCE1G29IV9QNN+G/PlA76ymLg6vA54HZo5S6jmt2tomIux3lO5Xh7O4J58UdaKVpVsEZOeevv8ULQvpMiWT9unSwfpZNrDi+YaHzE3RVroGHC7RuwMRkvDP+tiqa13D26aD0UkfJ4JsP2BfA7IBdBHHe/+Nz6UXtQ0UBjutqm/+HYWlSilbKL6y6eN5JPNZsfA+aZxQ==
Received: from BN6PR2001CA0047.namprd20.prod.outlook.com
 (2603:10b6:405:16::33) by MN2PR12MB4160.namprd12.prod.outlook.com
 (2603:10b6:208:19a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 20 Jan
 2022 13:45:17 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:16:cafe::73) by BN6PR2001CA0047.outlook.office365.com
 (2603:10b6:405:16::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10 via Frontend
 Transport; Thu, 20 Jan 2022 13:45:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Thu, 20 Jan 2022 13:45:17 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 20 Jan
 2022 13:45:13 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 20 Jan
 2022 05:45:13 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 20 Jan 2022 05:45:05 -0800
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
Subject: [PATCH v3 2/3] docs: firmware-guide: ACPI: Add named interrupt doc
Date:   Thu, 20 Jan 2022 19:14:14 +0530
Message-ID: <1642686255-25951-3-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642686255-25951-1-git-send-email-akhilrajeev@nvidia.com>
References: <1642686255-25951-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f2f489f-d783-429f-361e-08d9dc1b180c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4160:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB41604969790878493064B11EC05A9@MN2PR12MB4160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: my/sLrE01o/DUFMR4r+LGaGOw5AIK07Ml01dnOuk6Ege997vzzXFEc5hMba/JMGxBSLrWbG9FlED0DFVncpjhRFZjSZ7NBYKOo0iVnPzT/fo3vJOFNd5krd6rwZBc4vmTLXzMjhuVHnVV3oXflTfrTf6NRZNPqDtbMqEtaHGs/eLeMLPcYi1x0a88RvI1Kqlpc9qntFqbWW1DAhwOhVcr6o69jwH8ckW9jA8LwPDZSJnePvH2bXXnkAS/6wiOxUqTA+NyzYOg19u2PpXNCpczWqwspXNSnkad1SbNHRs3WRdS5HdzprhVFkn2D6B1laomqOyNR76b9s/7RMmZyvtQEcmyCNcMvfbL8nPkLKgYnqwj6DL20dk8U8DMv9rHjMPJHlF+Y1cQS2HWZYaaUtS0snfrrY+yPeR2Rkmayf6feNA+nrYTOr+EEY54KV8h7l1JcQGa6nCAVr5Z6nnZHXbAz5L/st8/pzuvg94QhJUg6hBilfK1avmuAp+o+eSYpFvNTBrtomZAq+FReWjoUNKs8ZKdkQ3f2Sn9jZUttINYuEsFLiYFd0PR/ILeDvmkTnuQ/K4O71OVcQL44lwWMf5GoAmP/URFMWe/jVhBXhpXDGzkQo+QE3WYH5uTR9QLSTNqb4YHdobAcxoW0Nb5r1qiEePDoO4nm2HZ1FZo/epiMDvF0TDZpNPTON2ll2TMaKHjrpMTLOPhx2VOI6qKZms85UZNpEARe9UttRbXp/jgKibpVWK6D43lcjyXwmKLEJzk21fP1EfanGaoQiOLa83AAW66N1CaTSlw9AO+HN+ijUYbx2/0UaSQfTG3UEW4dD8bXaB0thZCmeTJ2FquZs/JHdoFdBNexsRmAUCqY0XzZA=
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700002)(36840700001)(46966006)(40460700001)(36756003)(47076005)(8936002)(81166007)(4326008)(186003)(2616005)(86362001)(336012)(921005)(426003)(82310400004)(110136005)(508600001)(6666004)(5660300002)(316002)(83380400001)(107886003)(7696005)(70206006)(8676002)(356005)(26005)(2906002)(7416002)(36860700001)(70586007)(36900700001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 13:45:17.3754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2f489f-d783-429f-361e-08d9dc1b180c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4160
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Added details and example for named interrupts in the ACPI table.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 Documentation/firmware-guide/acpi/enumeration.rst | 38 +++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/firmware-guide/acpi/enumeration.rst b/Documentation/firmware-guide/acpi/enumeration.rst
index 74b830b2..595deba 100644
--- a/Documentation/firmware-guide/acpi/enumeration.rst
+++ b/Documentation/firmware-guide/acpi/enumeration.rst
@@ -143,6 +143,44 @@ In robust cases the client unfortunately needs to call
 acpi_dma_request_slave_chan_by_index() directly and therefore choose the
 specific FixedDMA resource by its index.
 
+Named Interrupts
+================
+
+Drivers enumerated via ACPI can have names to interrupts in the ACPI table
+which can be used to get the IRQ number in the driver.
+
+The interrupt name can be listed in _DSD as 'interrupt-names'. The names
+should be listed as an array of strings which will map to the Interrupt()
+resource in the ACPI table corresponding to its index.
+
+The table below shows an example of its usage::
+
+    Device (DEV0) {
+        ...
+        Name (_CRS, ResourceTemplate() {
+            ...
+            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) {
+                0x20,
+                0x24
+            }
+        })
+
+        Name (_DSD, Package () {
+            ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+            Package () {
+                Package () {"interrupt-names",
+                Package (2) {"default", "alert"}},
+            }
+        ...
+        })
+    }
+
+The interrupt name 'default' will correspond to 0x20 in Interrupt()
+resource and 'alert' to 0x24.
+
+The driver can call the function - device_irq_get_byname() with the device
+and interrupt name as arguments to get the corresponding IRQ number.
+
 SPI serial bus support
 ======================
 
-- 
2.7.4

