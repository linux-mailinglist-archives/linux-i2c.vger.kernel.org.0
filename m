Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B29496C31
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jan 2022 12:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234419AbiAVLdc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jan 2022 06:33:32 -0500
Received: from mail-mw2nam12on2072.outbound.protection.outlook.com ([40.107.244.72]:35168
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234437AbiAVLdb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Jan 2022 06:33:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbQmUzG1IjWh9G+Palx4ipGABGpeCYgCh+S06xh1v3z2/neBl35NXaBRYN+e0UuZmVpvozgU9PlKOQauGHd4sBMGY+6qMwd1y0TOEttO/fvkaWOaeHYw4LKFGQnKxnV4/vxoalLeadiY7qSL81XD6rGBz2zop0juPkAuuVmJWc1R7UpHODGB4WdjdArvoUZyWd6NO5VIBRBrbOJaw7GOPwy3fPy1TRW2hAuD5mcPBhmImHUzKakCAZquJ+pXnFlfDH2RoNVc4wYxiDlNBsrSPqZztQWFNuhOvatoKJsomxuZkjXh+2FZd/zEBEEmlo9jG9RF5HBCb4zHPq8O75VnGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvR3Tzrn79Yyg1oFi2i7R0yaiEiqQw8RUH+AWsjGdQs=;
 b=m1KCLhrkhZSI6tYqxEbMz9xt7tDgt3uWZt6r9uLf+xHzg2nCWbYwrdfVg2awmGVY5/fNNn/BnnZC+pZv2wdbzejxdei9uduMqpyGHSMglrjeybyi6O3dIVpDmMM0iAZeSApC2XOvWz1KdJhiO4XwvpoddDr+StdWSFddNavSSwuUaJsrHA4LP8JuM2m3ml4sPH76U7mBe/tbFuDvbsjdBwLRy9QxWDMs91eH7syKTxdhnKuwyMt/SW1c18mlUCHITJKN0rsnG5bCMoh/4vqL39oEu+jcsBISJgbmztmQh151MkLViMQegUfSHLWVQk73f/SYNP4Mq2xgd9090e4/MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvR3Tzrn79Yyg1oFi2i7R0yaiEiqQw8RUH+AWsjGdQs=;
 b=j48CvQ8Y2vARWvomicPqgOj59wMYYhgR9m1OETFfsD3TbtVZu9WKiyfEu6yTGIlEpUigVmef4H9HiZQoxwwnB+56MMerPgcHuvpf1oAQfKjPIQK4cuMU4zvH672OzvJvXSNHRE/Rb0lHNHG6SvHfmsA4XxJz1wAalzh2fWh89FpYCBLy2bRPtruh/iQ4GrUod2kfJik7Thok6ON4A8kPUnj08AOhIqpgalWzS9LwRBLSYHvFHXNLDWrMgj9qWZzsk8dMUv6RCXwroRD1ubDs5hxUuUVMEUUsASBBr3JYHeByyhF559lDfvlf1LjN6kreu+Ta1BSwqdLhtOsf+wIt2A==
Received: from DM6PR08CA0026.namprd08.prod.outlook.com (2603:10b6:5:80::39) by
 DM6PR12MB4976.namprd12.prod.outlook.com (2603:10b6:5:1ba::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.7; Sat, 22 Jan 2022 11:33:26 +0000
Received: from DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::75) by DM6PR08CA0026.outlook.office365.com
 (2603:10b6:5:80::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12 via Frontend
 Transport; Sat, 22 Jan 2022 11:33:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT026.mail.protection.outlook.com (10.13.172.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Sat, 22 Jan 2022 11:33:25 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 22 Jan 2022 11:33:24 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Sat, 22 Jan 2022 03:33:24 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Sat, 22 Jan 2022 03:33:19 -0800
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
Subject: [PATCH v4 2/3] docs: firmware-guide: ACPI: Add named interrupt doc
Date:   Sat, 22 Jan 2022 17:02:45 +0530
Message-ID: <1642851166-27096-3-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642851166-27096-1-git-send-email-akhilrajeev@nvidia.com>
References: <1642851166-27096-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0123e401-c5e2-4a98-2aad-08d9dd9b011b
X-MS-TrafficTypeDiagnostic: DM6PR12MB4976:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4976AFC4045653549DB5B7FBC05C9@DM6PR12MB4976.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 49eUzkJ8byijPyQM1tIlvQo69gGmKix7xaOVK/uuitvVzhDh11DP90Ax7gsf6f1ZOI/fTGLxTDbvVW741IFl3UOIIFwP80PX3da1C4uKFslCw4KxYkbDL371/G/3Uas6Bn+y3fVqRGs2SCmAD4UmV0m3Yddl+wHZ3Ur/FOozH7kC4qQqQgmxVkEvFjLm4NWL/SJanNmE/zYdN047mOfbZKe+V2RdaY+xsLR0Bz3jrlQDgwrtTUqoG9makRUq2udRnwsA7cRsbK04I63loO9K1U/HAiouocyUh24aK+e01yjBcdOilWTY0rkofplycTYYvYaGaOLwwDeeBVhHYeuHSqxWNKoNra0n6IU2aMB9wwKE2VwemnRtPPdoP+MkBpt8RMYw64Kz1rrCLar9w1EdoopHPphIYwtT+xtnCw7bdSSpqhggi5xtfEFqrgqtgOGaqwqhXZ+Txyzaiboox0ZwpFFAvG6aiifDyCzij+UtyMS71EIetUkB2YIR6xJBjjNh4/9T+ehxnKTj2LMU7j57s0/rc8dd9HqRiIxjPRNSKj/ydz79DsxUDvqQhRCoiRGLH6pfBca472uE29I/UlVYozxj31/tflWNwobuWyJ14erMkRy1He9/6ZN4P622DatCqOC5VI88BoFEnIVRDxN97BGwDSfOFqbZHQiaU7TC4pKZtjIFxwsZw8Y2/NHFmgny020y64xol4yvqXRqTaTpP15E2vkM+4SOCPmYFdes+CJAkH8PFUAoq52xE7sUloox2/F0ylaTscYR4BgFC0YPN+R6Qe13X3MiII2VdOkA0By3SWNpqhy0IsjXLlMAHIPvDrUoOGdSqdN5nbEBMuWT/VUvYppTH7gHMEzElOuDz58=
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700004)(36840700001)(46966006)(83380400001)(36756003)(426003)(356005)(81166007)(2616005)(2906002)(336012)(921005)(47076005)(82310400004)(86362001)(40460700003)(36860700001)(8676002)(6666004)(110136005)(4326008)(316002)(5660300002)(107886003)(7416002)(7696005)(508600001)(70586007)(8936002)(186003)(26005)(70206006)(36900700001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2022 11:33:25.6456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0123e401-c5e2-4a98-2aad-08d9dd9b011b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4976
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a detailed example of the named interrupts in the ACPI table.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
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

