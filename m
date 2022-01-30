Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 873374A3871
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 20:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355811AbiA3TM6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 14:12:58 -0500
Received: from mail-dm6nam11on2082.outbound.protection.outlook.com ([40.107.223.82]:28385
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1355804AbiA3TM5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Jan 2022 14:12:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+Mvmk13sbC+7Y9e8Grb9Dyj3jdePphbTYUZvDQAcaYOKS8/2LSGM26s+vTVfG1CZ3aoRi1q/4wbyEFFXmPBaFrks8xgw4XKFNZnVlvI/BNjZaqCQK06GWwQm+/JZfb/DlaW7p81czclhdhRUWjOIszcx5y5W4PXOciWpSXMDn1aGsPKXR7tdvukcpyD9gyRVw+V4wGCkK6iXTSLtPQHzZjWkU3ZlBgpLG6y9dj/gmyxtwUZHU4tFzxZvh43qIADyKY040jEROeffPLFafYv+uHffRDDBkYeRjYPjtdq6CFk9tkYBlo7ODJNeB28bJk9UJprB55f2+NO7pdRPS4/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+zMAenqjkC48pyQNzWi49C58B3/DS110h62PQY3EuM=;
 b=g2wUMyt9+ZH3WZNtS5mjUOS3QASXZlH00kcN8OkKyEniz92GGOmm5iU5Sos2YxhPWMvGTvqvTKXg9cv/i/31o8vkecE1RI+ZnLiOFPxKx8wnRRF/Fm6xs4Fj/7t+erXv/8miQeu1AZdNQN30TRKrRKdi2BvAV+TZxnsLKvfD2AfXKc9QTy+z5nf8oaYNutBBrpieG7NBB71RNLeMLzHYypqrdHmrIPbyAcr0vyaF7gwk8Ew/DXwqNTJTMtVgXFSQw3wcHfnhE3uRzRDKKeHzBDmhjvxlAqOK1Nh3i364b4+3KVVnSHSkgoOtImiKKRwHjq9apkoiDAsPxSGqtazybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+zMAenqjkC48pyQNzWi49C58B3/DS110h62PQY3EuM=;
 b=MeuP8+E5AxpNzI+lBggVylpuzPk6g0mQeKc1f6INld5cQTeKjGb1Oh2+Ef6UmO8c9lA9Rw7zLN58RnWdB3T0dh8A7F0OQqskx4stULt+sYShjYvVNUkiRXSZjrRNDVbSOxxdi46ORB7Yu43L56cECZeX7Dx2BIWkZl3Y3mb0mAg=
Received: from DM5PR18CA0058.namprd18.prod.outlook.com (2603:10b6:3:22::20) by
 MN2PR12MB4079.namprd12.prod.outlook.com (2603:10b6:208:1d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Sun, 30 Jan
 2022 19:12:54 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:22:cafe::a3) by DM5PR18CA0058.outlook.office365.com
 (2603:10b6:3:22::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21 via Frontend
 Transport; Sun, 30 Jan 2022 19:12:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Sun, 30 Jan 2022 19:12:53 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 30 Jan
 2022 13:12:52 -0600
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
Subject: [PATCH v4 2/4] Watchdog: sp5100_tco: Refactor MMIO base address initialization
Date:   Sun, 30 Jan 2022 13:12:23 -0600
Message-ID: <20220130191225.303115-3-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220130191225.303115-1-terry.bowman@amd.com>
References: <20220130191225.303115-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 675fcf2e-208e-4654-6a40-08d9e4248450
X-MS-TrafficTypeDiagnostic: MN2PR12MB4079:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4079AA13C4C9026C1F427F9B83249@MN2PR12MB4079.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RGzRUcLgT1ApzUdRBmiyJv20ZR0l8qjv1g6iHHMBYWn1WBFHLeC8WVSHRM/Q959PSFQ0TnA4BHrz98DYRRXe/nRJrna2hBXP66Aww2FlFL96VjqmUW1K4rEDWi2rWnSJDhNT8nns1y1AEuEw7IQ9gra/IKDjFnVDjXbk+SHCPf6XiohFeHrACdKycPwLeoyr4cs5fVjLLaxATdwQyFINOX2w8mYZCUpzOc/VBLwyvmftcqQ8b9KRHVQ5J+TLJ4wJeAUqIpNQA757CuvG8gFoTc8e0S3pAZd7kZ5aPhBbHqi1wu3zLQWQfzEA+bPxSZ0qk6LSc1vfiKpbN51JwRMfCPp0e4+IJ6UnSdhEveunpZp2vAV+97NhtfuvlQGHXsOtawI/t4npQtfByviVd8gYmMh6+OsVbMBXALLuRzjjhrMT2FwEQ5EShW5q7Go6Wrl2PN6Gh2VazphMqatLYKjKANzubF8CcGpHePCPWWgOUIPts0D/EIFu2I0oPivvzE3E3JA462qXQUIoaBXVOQgz0i23qeMs/lDgNOJOWU5nFxUXK+WM9qfZ0AsdF3Wvmi7Sf7vicVz6s3ArKUSk3ILu/frfgSM3l1JIcSSSDeUrIA4PkK7lKlvQ4gXzYJV7c4qAzZxd5lKLRpAyb2v999VSVA1mZibqxdgbP/HNdutu9zj7kq+uvVBxpM2KjKVG4by/p/H8fRYivlqiEGaY5JBp/x4JdsQIE1HBASGuhjDkmbg=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(7696005)(6666004)(186003)(26005)(86362001)(336012)(426003)(508600001)(1076003)(16526019)(2616005)(81166007)(82310400004)(356005)(83380400001)(4326008)(36860700001)(47076005)(5660300002)(8676002)(316002)(70206006)(70586007)(40460700003)(36756003)(2906002)(44832011)(54906003)(110136005)(8936002)(2101003)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 19:12:53.8360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 675fcf2e-208e-4654-6a40-08d9e4248450
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4079
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Combine MMIO base address and alternate base address detection. Combine
based on layout type. This will simplify the function by eliminating
a switch case.

Move existing request/release code into functions. This currently only
supports port I/O request/release. The move into a separate function
will make it ready for adding MMIO region support.

Co-developed-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Terry Bowman <terry.bowman@amd.com>
Tested-by: Jean Delvare <jdelvare@suse.de>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/watchdog/sp5100_tco.c | 155 ++++++++++++++++++----------------
 drivers/watchdog/sp5100_tco.h |   1 +
 2 files changed, 82 insertions(+), 74 deletions(-)

diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index b365bbc9ac36..16e122d5045e 100644
--- a/drivers/watchdog/sp5100_tco.c
+++ b/drivers/watchdog/sp5100_tco.c
@@ -223,6 +223,55 @@ static u32 sp5100_tco_read_pm_reg32(u8 index)
 	return val;
 }
 
+static u32 sp5100_tco_request_region(struct device *dev,
+				     u32 mmio_addr,
+				     const char *dev_name)
+{
+	if (!devm_request_mem_region(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE,
+				     dev_name)) {
+		dev_dbg(dev, "MMIO address 0x%08x already in use\n", mmio_addr);
+		return 0;
+	}
+
+	return mmio_addr;
+}
+
+static u32 sp5100_tco_prepare_base(struct sp5100_tco *tco,
+				   u32 mmio_addr,
+				   u32 alt_mmio_addr,
+				   const char *dev_name)
+{
+	struct device *dev = tco->wdd.parent;
+
+	dev_dbg(dev, "Got 0x%08x from SBResource_MMIO register\n", mmio_addr);
+
+	if (!mmio_addr && !alt_mmio_addr)
+		return -ENODEV;
+
+	/* Check for MMIO address and alternate MMIO address conflicts */
+	if (mmio_addr)
+		mmio_addr = sp5100_tco_request_region(dev, mmio_addr, dev_name);
+
+	if (!mmio_addr && alt_mmio_addr)
+		mmio_addr = sp5100_tco_request_region(dev, alt_mmio_addr, dev_name);
+
+	if (!mmio_addr) {
+		dev_err(dev, "Failed to reserve MMIO or alternate MMIO region\n");
+		return -EBUSY;
+	}
+
+	tco->tcobase = devm_ioremap(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE);
+	if (!tco->tcobase) {
+		dev_err(dev, "MMIO address 0x%08x failed mapping\n", mmio_addr);
+		devm_release_mem_region(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE);
+		return -ENOMEM;
+	}
+
+	dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", tco->tcobase);
+
+	return 0;
+}
+
 static int sp5100_tco_timer_init(struct sp5100_tco *tco)
 {
 	struct watchdog_device *wdd = &tco->wdd;
@@ -264,6 +313,7 @@ static int sp5100_tco_setupdevice(struct device *dev,
 	struct sp5100_tco *tco = watchdog_get_drvdata(wdd);
 	const char *dev_name;
 	u32 mmio_addr = 0, val;
+	u32 alt_mmio_addr = 0;
 	int ret;
 
 	/* Request the IO ports used by this driver */
@@ -282,11 +332,32 @@ static int sp5100_tco_setupdevice(struct device *dev,
 		dev_name = SP5100_DEVNAME;
 		mmio_addr = sp5100_tco_read_pm_reg32(SP5100_PM_WATCHDOG_BASE) &
 								0xfffffff8;
+
+		/*
+		 * Secondly, find the watchdog timer MMIO address
+		 * from SBResource_MMIO register.
+		 */
+
+		/* Read SBResource_MMIO from PCI config(PCI_Reg: 9Ch) */
+		pci_read_config_dword(sp5100_tco_pci,
+				      SP5100_SB_RESOURCE_MMIO_BASE,
+				      &val);
+
+		/* Verify MMIO is enabled and using bar0 */
+		if ((val & SB800_ACPI_MMIO_MASK) == SB800_ACPI_MMIO_DECODE_EN)
+			alt_mmio_addr = (val & ~0xfff) + SB800_PM_WDT_MMIO_OFFSET;
 		break;
 	case sb800:
 		dev_name = SB800_DEVNAME;
 		mmio_addr = sp5100_tco_read_pm_reg32(SB800_PM_WATCHDOG_BASE) &
 								0xfffffff8;
+
+		/* Read SBResource_MMIO from AcpiMmioEn(PM_Reg: 24h) */
+		val = sp5100_tco_read_pm_reg32(SB800_PM_ACPI_MMIO_EN);
+
+		/* Verify MMIO is enabled and using bar0 */
+		if ((val & SB800_ACPI_MMIO_MASK) == SB800_ACPI_MMIO_DECODE_EN)
+			alt_mmio_addr = (val & ~0xfff) + SB800_PM_WDT_MMIO_OFFSET;
 		break;
 	case efch:
 		dev_name = SB800_DEVNAME;
@@ -305,87 +376,23 @@ static int sp5100_tco_setupdevice(struct device *dev,
 		val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
 		if (val & EFCH_PM_DECODEEN_WDT_TMREN)
 			mmio_addr = EFCH_PM_WDT_ADDR;
+
+		val = sp5100_tco_read_pm_reg8(EFCH_PM_ISACONTROL);
+		if (val & EFCH_PM_ISACONTROL_MMIOEN)
+			alt_mmio_addr = EFCH_PM_ACPI_MMIO_ADDR +
+				EFCH_PM_ACPI_MMIO_WDT_OFFSET;
 		break;
 	default:
 		return -ENODEV;
 	}
 
-	/* Check MMIO address conflict */
-	if (!mmio_addr ||
-	    !devm_request_mem_region(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE,
-				     dev_name)) {
-		if (mmio_addr)
-			dev_dbg(dev, "MMIO address 0x%08x already in use\n",
-				mmio_addr);
-		switch (tco->tco_reg_layout) {
-		case sp5100:
-			/*
-			 * Secondly, Find the watchdog timer MMIO address
-			 * from SBResource_MMIO register.
-			 */
-			/* Read SBResource_MMIO from PCI config(PCI_Reg: 9Ch) */
-			pci_read_config_dword(sp5100_tco_pci,
-					      SP5100_SB_RESOURCE_MMIO_BASE,
-					      &mmio_addr);
-			if ((mmio_addr & (SB800_ACPI_MMIO_DECODE_EN |
-					  SB800_ACPI_MMIO_SEL)) !=
-						  SB800_ACPI_MMIO_DECODE_EN) {
-				ret = -ENODEV;
-				goto unreg_region;
-			}
-			mmio_addr &= ~0xFFF;
-			mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
-			break;
-		case sb800:
-			/* Read SBResource_MMIO from AcpiMmioEn(PM_Reg: 24h) */
-			mmio_addr =
-				sp5100_tco_read_pm_reg32(SB800_PM_ACPI_MMIO_EN);
-			if ((mmio_addr & (SB800_ACPI_MMIO_DECODE_EN |
-					  SB800_ACPI_MMIO_SEL)) !=
-						  SB800_ACPI_MMIO_DECODE_EN) {
-				ret = -ENODEV;
-				goto unreg_region;
-			}
-			mmio_addr &= ~0xFFF;
-			mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
-			break;
-		case efch:
-			val = sp5100_tco_read_pm_reg8(EFCH_PM_ISACONTROL);
-			if (!(val & EFCH_PM_ISACONTROL_MMIOEN)) {
-				ret = -ENODEV;
-				goto unreg_region;
-			}
-			mmio_addr = EFCH_PM_ACPI_MMIO_ADDR +
-				    EFCH_PM_ACPI_MMIO_WDT_OFFSET;
-			break;
-		}
-		dev_dbg(dev, "Got 0x%08x from SBResource_MMIO register\n",
-			mmio_addr);
-		if (!devm_request_mem_region(dev, mmio_addr,
-					     SP5100_WDT_MEM_MAP_SIZE,
-					     dev_name)) {
-			dev_dbg(dev, "MMIO address 0x%08x already in use\n",
-				mmio_addr);
-			ret = -EBUSY;
-			goto unreg_region;
-		}
-	}
-
-	tco->tcobase = devm_ioremap(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE);
-	if (!tco->tcobase) {
-		dev_err(dev, "failed to get tcobase address\n");
-		ret = -ENOMEM;
-		goto unreg_region;
+	ret = sp5100_tco_prepare_base(tco, mmio_addr, alt_mmio_addr, dev_name);
+	if (!ret) {
+		/* Setup the watchdog timer */
+		tco_timer_enable(tco);
+		ret = sp5100_tco_timer_init(tco);
 	}
 
-	dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", mmio_addr);
-
-	/* Setup the watchdog timer */
-	tco_timer_enable(tco);
-
-	ret = sp5100_tco_timer_init(tco);
-
-unreg_region:
 	release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
 	return ret;
 }
diff --git a/drivers/watchdog/sp5100_tco.h b/drivers/watchdog/sp5100_tco.h
index adf015aa4126..daee872f9b71 100644
--- a/drivers/watchdog/sp5100_tco.h
+++ b/drivers/watchdog/sp5100_tco.h
@@ -58,6 +58,7 @@
 #define SB800_PM_WATCHDOG_SECOND_RES	GENMASK(1, 0)
 #define SB800_ACPI_MMIO_DECODE_EN	BIT(0)
 #define SB800_ACPI_MMIO_SEL		BIT(1)
+#define SB800_ACPI_MMIO_MASK		GENMASK(1, 0)
 
 #define SB800_PM_WDT_MMIO_OFFSET	0xB00
 
-- 
2.30.2

