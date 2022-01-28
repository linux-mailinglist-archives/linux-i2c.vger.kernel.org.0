Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC29549F898
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 12:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348193AbiA1Lpi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 06:45:38 -0500
Received: from mail-bn8nam11on2067.outbound.protection.outlook.com ([40.107.236.67]:41121
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348197AbiA1Lpi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Jan 2022 06:45:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrpyFs9N+3xCLMvXP752xy/+MXFygvLHMvIEV1is0X/nVEVaY2stjf5xO7OasWaKT8SprnRrOWYn7coNsdE0m3/HicHMmlvt1lDmPZmOpYk+3GfMuc+wQ48OY9OLof8WEl5MpaYietD13XFxPH4g6R7nPt1D8TjdgjPYqvkl+ToX6QR32a1pREt2TxUUf5/HOoKbadH+FR1zLJIgUSBS7SdaIPNMAIJ9tUY80sNCzzlvHw9c/b2tHchRo8cHg8GHV1JG7xZqKCoZTx8staAJFbk+yZvdWKN49RqNMfON74u8xQF8Cj0OY/sP52pktYf0KfOj6UDAnesEXtrzAhdEcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Il1onWCe45cu/Iq5BB2lH9BExeI6PjHra8tQyzlLeho=;
 b=C5cz9Ex/dYtAajl1deG5JYuYiD51fjCkhipraNhdNFSNvTQGgSPX9RZXGEkILXsdpR4SxEzmcmnxQ4VHWHq7BlZ17gAL+6a8C7t5L2AzyircBA6exD4H5s7+prHCA6IDAq+Bq3S6Em0y8w2YMlRPHOCkLdqsZE4sOuG9qtyajW02wQSMzIwApAeW/kRpLj8tbzQ3HE5fnBRFKkQpEDuNKB1NK30/FY5C/Z84Zsr45DFhDOirprciY/5dyaZ/yBh4ZissLVKfQ2IhshYS0/HH2VztiTQwQm0I4HubQfxgdvMw0VeoYDT2Uala2DdJD1SH2YiYEEuBW+lrGaRV7VcLqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Il1onWCe45cu/Iq5BB2lH9BExeI6PjHra8tQyzlLeho=;
 b=sqN2ZoJIEvpFTgtb0IPS5G8xRtHlPE454mqnfHMwunnRuJhof8XHtPw4otMgXz6nT2B9F0BFNsi3gL+6DfNNhmEhxmylDzkzgEwBKVJUncxTxq7HFbls9yqVmHfKSp7dLphT14FLq6nhVUdGu0ZvZ+KWzizbVofcimPe9jxvs53HK1pHytcIHuDTyZ57M2d3IZY59JqA4B5hXDgXrAp4x9j+NfbWb9TOxdUZwSjPT71xCOpJ6UNu6xofFJiKkbeosbAooXDsmU+sG+b7Z4ps9bjd+FwZZRu6Ikupp7+VGlgaFMbwnNvRVIOIQ7Qwh3hJAmC6+JL9uORvGmWwLg6r/g==
Received: from DM5PR19CA0066.namprd19.prod.outlook.com (2603:10b6:3:116::28)
 by SN6PR12MB4767.namprd12.prod.outlook.com (2603:10b6:805:e5::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Fri, 28 Jan
 2022 11:45:35 +0000
Received: from DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:116:cafe::a6) by DM5PR19CA0066.outlook.office365.com
 (2603:10b6:3:116::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Fri, 28 Jan 2022 11:45:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT065.mail.protection.outlook.com (10.13.172.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 11:45:35 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Fri, 28 Jan 2022 11:45:13 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Fri, 28 Jan 2022 03:45:13 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Fri, 28 Jan 2022 03:45:08 -0800
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
Subject: [PATCH v5 2/3] docs: firmware-guide: ACPI: Add named interrupt doc
Date:   Fri, 28 Jan 2022 17:14:26 +0530
Message-ID: <1643370267-31804-3-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643370267-31804-1-git-send-email-akhilrajeev@nvidia.com>
References: <1643370267-31804-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34509184-385b-4808-9f93-08d9e253b2b9
X-MS-TrafficTypeDiagnostic: SN6PR12MB4767:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB4767D7482D40E9E7ACEA0391C0229@SN6PR12MB4767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G+T0dZePBHbNas5sz2KosCINUHVc3Xr/U/lujFyl74QzjmsUrnNRf/kz7mxRkR5pWFj3aBLBLlWwVvDvP9xoLw8YAl40Vlv93CpfMFERsihEkmbVHknHminzDnVah539ghTi+S2phBjeXPOzdrlphCK0WSp7UBnJru5GPtUhSMdhB+IvkDe0b6pYDvOtAmb0sAL7fsITFrIKMZJzmu5dZ5Z8AXRf+er9VevBggXARGhlOqBwXmAECQ0IUD68jpOtP3LefJC/Ufb4osT4KRYgb8TofGsISFOgYko1K1pKIN+bLWXyffSb4K3dD0gXrNYGbeJUcQ67B44xfJCA1MWi8gPsoNmqxaU26PkGnCgv7d1iqA1/DMfDhxVHadIK1YTIsXkzObfKR5DGQNhG+TAs8/BUmYUt8XxSan0o2xYKRslksAtYdo8EBy+JoW39jka+De+xk0U/YFHjiUUQeQxNYw+CmGlLrQ1BwWxfZ4mV0AWpjm8wR0NKyxL9uzZ+ppEBlkQrfF2MqikUDivNuX7WqckxZRJeCI8RTWSdXrg/aNAcxxQqhWFDO5GcVZfj2Q7YTzSkwzBWEd30fzawxtBJ+9FF93Dt1mDDLtVebJqvy4V5QQF0w6i6b7vMpoOBgLLLMcrtT/AV9O2eWN2TeonIRQ7yrG/d/IFp5IRK9q2rlxvPK0YL9VBli4ZlEYcye/+m8BA01D8YhYUUtjnQWD8GqWZgnmkl5rk8RITAmfl6r8uzyfJ6EbAE5Ic97INJHvtHpZTwO74Brd6o57nvELDkZUdgAf+X6ls4gygxSd8MFnHsi/lvc/Qn/BK4s0pxEgseU3z1rnrPruYDM6GQ+CkXlNRn3k4MROv67yB1UY3pecg=
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(46966006)(40470700004)(36840700001)(336012)(921005)(40460700003)(82310400004)(81166007)(107886003)(356005)(110136005)(70586007)(8676002)(70206006)(8936002)(5660300002)(47076005)(2906002)(316002)(26005)(7416002)(508600001)(83380400001)(2616005)(186003)(7696005)(4326008)(36860700001)(6666004)(36756003)(86362001)(426003)(36900700001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 11:45:35.6902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34509184-385b-4808-9f93-08d9e253b2b9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4767
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a detailed example of the named interrupts in the ACPI table.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 Documentation/firmware-guide/acpi/enumeration.rst | 39 +++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/firmware-guide/acpi/enumeration.rst b/Documentation/firmware-guide/acpi/enumeration.rst
index 74b830b2..d002256 100644
--- a/Documentation/firmware-guide/acpi/enumeration.rst
+++ b/Documentation/firmware-guide/acpi/enumeration.rst
@@ -143,6 +143,45 @@ In robust cases the client unfortunately needs to call
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
+resource and 'alert' to 0x24. Note that only the Interrupt() resource
+is mapped and not GpioInt() or similar.
+
+The driver can call the function - fwnode_irq_get_byname() with the fwnode
+and interrupt name as arguments to get the corresponding IRQ number.
+
 SPI serial bus support
 ======================
 
-- 
2.7.4

