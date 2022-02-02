Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B11164A74AD
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 16:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345508AbiBBPgS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 10:36:18 -0500
Received: from mail-bn7nam10on2083.outbound.protection.outlook.com ([40.107.92.83]:3809
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235549AbiBBPgS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Feb 2022 10:36:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGIDOoZCsY9d7L6RHmb41KIT3sMOwEi3bUMkWxoMw4TlVlAROX/WMRHQZU6AmVqCJ2ne2aR4p7LuoQToP4ttejIzAVDSNMO6oQAiI1qMI8bzrux6tv4MjiERSZsJWdk895dn3y1lh3MVROBaxeLSIcoRWNrk/Utl5ynZ1XTubqM6lftGeRFkchKqupgeSeg2f6cXaJg34ExTlLZ+3vgDivvN+zraY8Y8A1HmSxz8P72T6/f3hMub8zToZ5EmvV65KGCmrV2qoLMXiFdG6Xo2xYYOCcAlzEG0kImHlRbzrnMdvfTbpZHkx1Z9T6GJ1Pn3UaerAJbhiuSeqhWxMXWV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3tGR+qgL3VHVP/McPMiQGJavS1w09Q2Bvyf2DuiwNU=;
 b=O+DIxiYlIYfZjALeQjOiFB5/gL0N5vxbWIuMlmGZA0BZl9bMV03C6qsRmW0qkdPTsFaq3h5hwz1m9Of3Hora4sBLGpK4Rndy/IU0E8oNfxxsL2DS9PkpiRLE0acLnE/OpMvBnE0R+gs6Wwvh+XGuTpFrNdoMn0bEKNaIVsG+pvAazDz5FinPCg4dxMy8j68VpdumN7D5nKSmTLqi3mYzM4KbHIF/t1B0DSd7R5Dpk/28kINEzAbXpZveonsS4fyRq4Bp/n5T2CYGeJHUw2TO6NMP4YKbFVayeu5ouNaAl8ggG42ck4+Y7VRG0OYgmlwyHcjfTF9uk/w3e6owhDByxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3tGR+qgL3VHVP/McPMiQGJavS1w09Q2Bvyf2DuiwNU=;
 b=MybjMVV5Nq9ZLZb0npENJphQbGjhytjY2FynQ1qRxUkgfHy8sAdtmXfZN4VYEzKD2P1JflTExyYuWHNob7YdtwhHcxI2HSwAE2Sil64jQL9Q1vbCsgWf/YTdBBuW3tcNuJi99tdiUJYBuRr4/nlV/Jf54is+vZhfMf93BZ/Q7V0=
Received: from BN6PR17CA0014.namprd17.prod.outlook.com (2603:10b6:404:65::24)
 by DM5PR12MB2422.namprd12.prod.outlook.com (2603:10b6:4:b9::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Wed, 2 Feb
 2022 15:36:16 +0000
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:65:cafe::9b) by BN6PR17CA0014.outlook.office365.com
 (2603:10b6:404:65::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 2 Feb 2022 15:36:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT056.mail.protection.outlook.com (10.13.177.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Wed, 2 Feb 2022 15:36:15 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 2 Feb
 2022 09:36:14 -0600
From:   Terry Bowman <terry.bowman@amd.com>
To:     <terry.bowman@amd.com>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <jdelvare@suse.com>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>
CC:     <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <sudheesh.mavila@amd.com>, <Nehal-bakulchandra.Shah@amd.com>,
        <Basavaraj.Natikar@amd.com>, <Shyam-sundar.S-k@amd.com>,
        <Mario.Limonciello@amd.com>
Subject: [PATCH v5 4/4] Watchdog: sp5100_tco: Enable Family 17h+ CPUs
Date:   Wed, 2 Feb 2022 09:35:25 -0600
Message-ID: <20220202153525.1693378-5-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202153525.1693378-1-terry.bowman@amd.com>
References: <20220202153525.1693378-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b977c49-03cb-47e5-c537-08d9e661c021
X-MS-TrafficTypeDiagnostic: DM5PR12MB2422:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB2422866C602D19E63B56923083279@DM5PR12MB2422.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1B4YzfU7AWm2Kt+Nwf70cvEMsm+Xj1mMYwPSixdVDYZi+QbbBanbIarzYrkX0FEo4v57SKqT+nxL+TtBxxqxiQwuAS4MGUO4CwuQT+BZguIR1qzmEBvp3cWYZvk2IhBtU1S+DYzgGoO4Z6p3zxkqE1o7NT3xzTPfd6htSsbVlJvHqYxdtGI8ng1dS5CsRAsygZ+t2Dc3BqDhoKNXMRs9h0CrGOC+ITI8atg/7i22ozzwe2v/XJV1agUZgo/QPLSFDfdLQTwIzjPkSithcEjF+JzjzH5skUgToWcnN2okfS6iZHDfozNpi1s3DpzXJfhKNL2e63Ca9e9T+4MwdOrCB6grX7WW4gw+c6G5bmT+7aCr/Ucr0dMPPMhm35wnnyM1h3TfA6VU8K1vzcT86M3xIHoygabRJAuaUKNmNDUaZJfS3rMAIGdBMQLSnC2iOMIhGFBgQRYZdXy+IxUMcwMYr4mtF74vDSoh09d8gTOMinH3uVPE+FFW33yxOuwPYba9kr9O26gOkfj4IYza4TVVM1yrYJctmo3r55eIDJuB7iU7vE1d12unHbVmWzXkAcgtAH89Vs+jgngQwWzYWv+ljcsGp8xfRUR8EV+isOcCfdGX8Tlj5WTuvdEN3QyJz8RgHN9MRw2E6VjOhnnGRfUYBli3CsK30hfEQDM22/K6qwpalZ8Rile0sqAIzH13nee/zUNXiWLnzfczLkMGC6oc1ATenj6OYj/H+I1qhX1RdlU=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(82310400004)(70586007)(86362001)(356005)(70206006)(40460700003)(36860700001)(4326008)(54906003)(8936002)(8676002)(316002)(81166007)(110136005)(336012)(1076003)(5660300002)(47076005)(26005)(44832011)(83380400001)(426003)(16526019)(2616005)(508600001)(36756003)(186003)(7696005)(6666004)(2906002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 15:36:15.8509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b977c49-03cb-47e5-c537-08d9e661c021
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2422
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver currently uses a CPU family match of 17h to determine
EFCH_PM_DECODEEN_WDT_TMREN register support. This family check will not
support future AMD CPUs and instead will require driver updates to add
support.

Remove the family 17h family check and add a check for SMBus PCI
revision ID 0x51 or greater. The MMIO access method has been available
since at least SMBus controllers using PCI revision 0x51. This revision
check will support family 17h and future AMD processors including EFCH
functionality without requiring driver changes.

Co-developed-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Terry Bowman <terry.bowman@amd.com>
Tested-by: Jean Delvare <jdelvare@suse.de>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/watchdog/sp5100_tco.c | 16 ++++------------
 drivers/watchdog/sp5100_tco.h |  1 +
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index e02399ea8730..86ffb58fbc85 100644
--- a/drivers/watchdog/sp5100_tco.c
+++ b/drivers/watchdog/sp5100_tco.c
@@ -86,6 +86,10 @@ static enum tco_reg_layout tco_reg_layout(struct pci_dev *dev)
 	    dev->device == PCI_DEVICE_ID_ATI_SBX00_SMBUS &&
 	    dev->revision < 0x40) {
 		return sp5100;
+	} else if (dev->vendor == PCI_VENDOR_ID_AMD &&
+	    sp5100_tco_pci->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS &&
+	    sp5100_tco_pci->revision >= AMD_ZEN_SMBUS_PCI_REV) {
+		return efch_mmio;
 	} else if (dev->vendor == PCI_VENDOR_ID_AMD &&
 	    ((dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS &&
 	     dev->revision >= 0x41) ||
@@ -459,18 +463,6 @@ static int sp5100_tco_setupdevice(struct device *dev,
 		break;
 	case efch:
 		dev_name = SB800_DEVNAME;
-		/*
-		 * On Family 17h devices, the EFCH_PM_DECODEEN_WDT_TMREN bit of
-		 * EFCH_PM_DECODEEN not only enables the EFCH_PM_WDT_ADDR memory
-		 * region, it also enables the watchdog itself.
-		 */
-		if (boot_cpu_data.x86 == 0x17) {
-			val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
-			if (!(val & EFCH_PM_DECODEEN_WDT_TMREN)) {
-				sp5100_tco_update_pm_reg8(EFCH_PM_DECODEEN, 0xff,
-							  EFCH_PM_DECODEEN_WDT_TMREN);
-			}
-		}
 		val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
 		if (val & EFCH_PM_DECODEEN_WDT_TMREN)
 			mmio_addr = EFCH_PM_WDT_ADDR;
diff --git a/drivers/watchdog/sp5100_tco.h b/drivers/watchdog/sp5100_tco.h
index 8ca1b215e3ce..6a0986d2c94b 100644
--- a/drivers/watchdog/sp5100_tco.h
+++ b/drivers/watchdog/sp5100_tco.h
@@ -89,3 +89,4 @@
 #define EFCH_PM_ACPI_MMIO_PM_ADDR	(EFCH_PM_ACPI_MMIO_ADDR +	\
 					 EFCH_PM_ACPI_MMIO_PM_OFFSET)
 #define EFCH_PM_ACPI_MMIO_PM_SIZE	8
+#define AMD_ZEN_SMBUS_PCI_REV		0x51
-- 
2.30.2

