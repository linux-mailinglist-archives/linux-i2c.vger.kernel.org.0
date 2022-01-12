Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2783948C5C2
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 15:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354042AbiALOPI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jan 2022 09:15:08 -0500
Received: from mail-dm6nam12on2058.outbound.protection.outlook.com ([40.107.243.58]:29301
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1354068AbiALOPH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Jan 2022 09:15:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHkMl+YyY/34m5VdRPvIEAvu6kMjYHtxo/uny+ixr7CaDS6Hj4zwbg7ps0lZo8kTMBeY4rTiCjtO+C2fUKyK7AxPaKypHNRyvvjozt9XDWuz3rt8vD3TiOIk6wpneqXhjskkPZv5e5pqUK0ws4NRfoxBTWf9dJ5PI97wixTIZQiLn9uyYh70fTPeAo2P4MjYI3od20fu/RmBwWcNMPC9y0g/1ThBqz+tceCFNs16Utt5kjTI4eO3obEVkF07bYfTXV2JUhErwvEoPJF+45JWM78B7PTNfTk3AclKZgl4QMl0Kk3ucfS4Gl6FZ10jDNWfKAjsP/L/26sNLf74jMPNkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mi6A724na9xjHiGhNnbFWd2LYQzLM5H8jWqHYMX/dV4=;
 b=JRHI5p9AX8hw3+zulUfIyeyob/HVlBairJdqVEpLuMK0xbBtzfXJGwwxLcgvYtvbEc5+ZPH4ElCssvu7AVlytM8ThlpsSqZQwXf1yxaaxGHese4c5C1fMDJumZ7+Z2O/xr6Qej0b4suDZ2lICu85k8vmUH60lxKHPdbpfQ2yq4gKhH4FulT0ATMK00dRRVF/azuatwP/uEcgXJlT8gyl4I51G7mtXf/+0YW1QpHTd5hQT7JiX0cO0P99nl6Q+gRrGImVAy4L7pZzvuAmosfwI5Ty3aA+RfJqv1G0Mba/r+IzsFspi6xsiNEosXsDuvFSNz/b4X6VFDe9GslRSKYyIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mi6A724na9xjHiGhNnbFWd2LYQzLM5H8jWqHYMX/dV4=;
 b=C4gjJl1HMKiYorGm3sJRZUCmz9ThfT1JjDcfzdARxGft8K1wbCBaJ2cxWCJKTVcqj92LBBJ00tXc6QV5r2xwdDVRPcV9fAbGfWm0Su70qODrwCYUoBi/Ug47ODlSqFhv8aI7L9d5W2WQNVCWQeL08n02o4UualwUQZgKHJcaMCJshDUcK7l5Mzrjor8Lw16f3GagXnyJaRc1FCB48YVtETThlGm8mmMfRdMokrJLG/8+8z1u+LZblmZj0GR6p6qtx9I/x3/jZmcqLWKEYx2JOk9E+2/7uLQ3EXbLTA8Wq7bTtPVDeGw500R4gb9u0Co6XsWTHcc6B1lHdtxycsxuhQ==
Received: from BN9PR03CA0727.namprd03.prod.outlook.com (2603:10b6:408:110::12)
 by DM5PR1201MB2554.namprd12.prod.outlook.com (2603:10b6:3:ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 14:15:04 +0000
Received: from BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::c5) by BN9PR03CA0727.outlook.office365.com
 (2603:10b6:408:110::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9 via Frontend
 Transport; Wed, 12 Jan 2022 14:15:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT033.mail.protection.outlook.com (10.13.177.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4888.9 via Frontend Transport; Wed, 12 Jan 2022 14:15:04 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 12 Jan
 2022 14:15:03 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 12 Jan
 2022 06:15:02 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 12 Jan 2022 06:14:58 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <andy.shevchenko@gmail.com>, <christian.koenig@amd.com>,
        <digetx@gmail.com>, <gregkh@linuxfoundation.org>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <rafael@kernel.org>,
        <sumit.semwal@linaro.org>, <thierry.reding@gmail.com>,
        <wsa@kernel.org>, <lenb@kernel.org>, <linux-acpi@vger.kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v2 2/3] docs: firmware-guide: ACPI: Add named interrupt doc
Date:   Wed, 12 Jan 2022 19:44:21 +0530
Message-ID: <1641996862-26960-3-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com>
References: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93495c88-7866-4e8f-7d2d-08d9d5d5edba
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2554:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB25540AC1BF35FA9992A3095EC0529@DM5PR1201MB2554.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L2e04kYsUEOrg80ty5cj9/L0aF+2OEZx/1kezUv7BQ7t+ZhrYqTQcVov092T94TNrLBnuubNW4savC4ehcRgAD8oPoOTmRo4EVy+xYDIR0hpRbNgaH3p+u6q/9Lilx5uOVdPfRrcAzww1cy5YltEk5xZygnoonGd3Ubq1V+mguYJD87l1RqMfkUTyiD4wk7r0tZxHZzczgFW95xzfAPz57AjAhL1VXGUIXp3e03AerxIFlmMkGrKFjG4u4qUgDuHY/CJCCYPR+HPvIMVpBRWQJVJY3NBR3njGix0j3dZqtjznH5Gvtw3olEXz9QI1u5HP4ZVKy7Qw6zRuoklL3gMgiZiGZkJetB64B3X4yMhFhZaQyEpblGXOkUi2esY4TD1kaNjF8i3wrpnkT8PLTvB18TvpU/QJVol82wbSCo8BdB79ByqwFacdFLhQV2yQWbDcLK/Xcdr3TBrhWTNw/4RHInXMfRTHheyHB/TgGBt4tem98QYqLppEJkJA2oTA2Ei3BcIQgdqxvQM1Vg+HDG9aymmhhinJ0lGvtYmGluIiaPJydyASDZtRaK4VP43+f1z2qkJjlS5DyhrP/MnTEp2bQsllFGVqDPrlAiDak+U+INEIXTVBOF2fFpxpR7SvXeo6Zlk0YoyJU1jpc8AVylu5P1Oo3YpZSpTu38cS3Mi7+FpbIP2xoQW+T223+pbBq3HNO7Yq72fIi25tSojRxVbbud2SIW4A+lQ8H9YTVoFIip4gFvZ8zPQEOLM+nKBkI7mHozV8ygmjQNKR7znyBELHXUPXsdBdEb77iabMQDmqdyj3vqJF63gs0gOY3PTavoUlrsam4fE+RbS7bM0ZoJsiG4HeHzyPDQ3LBn0bAenCTY=
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700002)(36840700001)(46966006)(81166007)(356005)(4326008)(2616005)(107886003)(70586007)(82310400004)(508600001)(70206006)(2906002)(47076005)(40460700001)(36756003)(110136005)(36860700001)(921005)(86362001)(7416002)(83380400001)(8676002)(186003)(5660300002)(6666004)(336012)(26005)(7696005)(8936002)(316002)(426003)(83996005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 14:15:04.1089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93495c88-7866-4e8f-7d2d-08d9d5d5edba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2554
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Added details and example for named interrupts in the ACPI Table

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 Documentation/firmware-guide/acpi/enumeration.rst | 38 +++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/firmware-guide/acpi/enumeration.rst b/Documentation/firmware-guide/acpi/enumeration.rst
index 74b830b2..30ae41c 100644
--- a/Documentation/firmware-guide/acpi/enumeration.rst
+++ b/Documentation/firmware-guide/acpi/enumeration.rst
@@ -143,6 +143,44 @@ In robust cases the client unfortunately needs to call
 acpi_dma_request_slave_chan_by_index() directly and therefore choose the
 specific FixedDMA resource by its index.
 
+Named Interrupts
+================
+
+Drivers with ACPI node can have names to interrupts in ACPI table which
+can be used to get the irq number in the driver.
+
+The interrupt name can be listed in _DSD as 'interrupt-names'. The names
+should be listed as an array of strings which will map to the Interrupt
+property in ACPI table corresponding to its index.
+
+The table below shows an example of its usage::
+
+	Device (DEV0) {
+		...
+		Name (_CRS, ResourceTemplate() {
+			...
+			Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) {
+				0x20,
+				0x24
+			}
+		})
+
+		Name (_DSD, Package () {
+			ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+			Package () {
+				Package () {"interrupt-names",
+					Package (2) {"default", "alert"}},
+			}
+			...
+		})
+	}
+
+The interrupt name 'default' will correspond to 0x20 in Interrupt property
+and 'alert' to 0x24.
+
+The driver can call the function - device_irq_get_byname with the device
+and interrupt name as arguments to get the corresponding irq number.
+
 SPI serial bus support
 ======================
 
-- 
2.7.4

