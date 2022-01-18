Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4005A492F47
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 21:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344134AbiARUXJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 15:23:09 -0500
Received: from mail-dm6nam10on2084.outbound.protection.outlook.com ([40.107.93.84]:63841
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344128AbiARUXI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jan 2022 15:23:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGzZdxu7ZIVt8PFoSrKZOotbUwPyunoiJup7FoVlnP5POeVR1izLUs8TVVn8rZo0QCGEXwb4st5Mxieb0vJruL1yAeF/f6hPDw/mWXmgsH2NqZ7J010JOEY2GrAuUohaaxqIu9qa0wNRcwlZFm3BTjAZSIumG3y0QhRMdtWmk6oKKChZxGXbO2tAHubLgvyQFUo1d0uZepL7nypHyycvg0d0/65yl4tx7JetIiqlxk8B+dc2aC8iY2ntBWrcaduKvLmO38fs6kGk3Q/kqxaohFZTtl/cbrw3wZlLmPjgmT4lqa9r4pAzo3SWlcTyPgWtM2I6s2ws17KeiVTFG53cVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2aYsVE73z8a8p3uFFxhv7wPUUbk80t4pULiXTgteLs=;
 b=l2u20sIGhKRGAxxdWXi+KRCEWh5gL22BCs0QrE1+hwNn29e7CjVHsw24jiDMtF6zHixXjz+6uClb+/7PzFc/VqdZtHuwHysEKTzfxAay/vEPiTKOV/Amj6tnmW85poJi/YHs7gbs/MTtzYVCVqRmn0pu58PWXw7Na83yrufIjLaVM32PEBGE7nQkwTFN1SF6etOXxYf9lYWstnrbQnMnCpgnN8nK8FsOJMpndWgLUvX2G3CSfLQG6kzooe/m4M2tUQIMmGz1nBSpzRPM3VjFBGRc8fN74+joDHRLid7r54/V2mBOhTmHFORpUe9Qi6Z+Eg6B+UdJQzQRYoRwuf6CdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2aYsVE73z8a8p3uFFxhv7wPUUbk80t4pULiXTgteLs=;
 b=4YnxspsfADkRAMzn+USiiA3Duo6LfDj1ueb5O8QT4/Q8Vz3dRBtUuz66zQiQTOuSSYtuaJloJ4JVkhyxpmgQpKtGF5NXw7LJ2FKD0rPss9uOrbBGYKK+GcojCeXRa1a+uzJDPTiYW4MMkqk8ZD/5NVdbPqHP5p28joSi1ASbENQ=
Received: from MW4PR03CA0251.namprd03.prod.outlook.com (2603:10b6:303:b4::16)
 by CH2PR12MB4069.namprd12.prod.outlook.com (2603:10b6:610:ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 20:23:06 +0000
Received: from CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::66) by MW4PR03CA0251.outlook.office365.com
 (2603:10b6:303:b4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Tue, 18 Jan 2022 20:23:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT004.mail.protection.outlook.com (10.13.175.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 20:23:05 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 14:23:02 -0600
From:   Terry Bowman <terry.bowman@amd.com>
To:     <terry.bowman@amd.com>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <jdelvare@suse.com>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>
CC:     <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <Nehal-bakulchandra.Shah@amd.com>, <Basavaraj.Natikar@amd.com>,
        <Shyam-sundar.S-k@amd.com>, <Mario.Limonciello@amd.com>
Subject: [PATCH v3 2/4] Watchdog: sp5100_tco: Refactor MMIO base address initialization
Date:   Tue, 18 Jan 2022 14:22:32 -0600
Message-ID: <20220118202234.410555-3-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220118202234.410555-1-terry.bowman@amd.com>
References: <20220118202234.410555-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b13d468f-8852-461f-b7b0-08d9dac05593
X-MS-TrafficTypeDiagnostic: CH2PR12MB4069:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB40693E338FD8CE894FF9007683589@CH2PR12MB4069.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TGyDvfrOPW9TNzQev7IGmuQsyskWW98yEBtRpE6qmZcbF8QQu6oN3nZm4rWYmwiHrPLoo4O+/TeEsfBMk+q5PO/2t8ZsfhN3vE3hK0V9DO15rNv7KS+pqxyp+Hp2M4Ka1VcH3wWXBK/t3mET8NjTkAenbMDfebVbUReStkpId7GBUMvqu9luXRz8GCcy9H+teHwqtB3MlJwfbOKcyoY7rk0iYUS/5GkzP2tij89Lc+hGT/2uSCzp7a9h0RCROyssO0Gtk0cfvCnOR168Z7xA6hT9rOtPEFv1VTGrmV5VCcytB6GOffRd4amQWlbyGaiWI+636JNmIcDWVMOhgkmPBzvO8YxmO7l04gZV2KjYY9BwNGALC8Fu18IsZT6yhgNGa9ghafKqXOLgk9bdbJ55U4CDBgE1OdUse3VqlDVt92dDvN+HZzu9gfxiTn7ajAVCCPieLPoA4JxnxdcsxLKnn07+HZOtFBZbBs9lXL9oIvmAuQ7a4xxHajKuChLWuF5Sbt3/bIL1+MNB6Un+U1eDU4Lk012bZ8/iUXtPt2vmKSRki4moRDFdR0m+0Xm3wXaSXSIgiE2Q1TvkOWBT6stdAy68jqBDxEBpzwVsHjrRHtKSeoUJ4+mYOEQvSEcupjyG2qApZnGB9DqAHfxPGmAY7d7KvFLwQkYIvIsarAsc2JNLLs6oDfAl2WFYSM7xBovM47mounR5ZMclVqMTJiybNpvXZlw/Tn2CQoEkVEjGwBbeWZsxIuptmIu0YhOgHnQpUP5qXNXGOXbfAKxUSP4cq+hD3CcsDRGyMjgfofrlmkn42F+pk4NAngkZs61W6VIr
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700002)(36840700001)(46966006)(70586007)(356005)(1076003)(40460700001)(70206006)(44832011)(5660300002)(2616005)(83380400001)(316002)(54906003)(336012)(110136005)(2906002)(426003)(8936002)(8676002)(82310400004)(81166007)(36756003)(47076005)(508600001)(16526019)(26005)(186003)(7696005)(4326008)(36860700001)(6666004)(86362001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 20:23:05.2237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b13d468f-8852-461f-b7b0-08d9dac05593
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4069
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
To: Guenter Roeck <linux@roeck-us.net>
To: linux-watchdog@vger.kernel.org
To: Jean Delvare <jdelvare@suse.com>
To: linux-i2c@vger.kernel.org
To: Wolfram Sang <wsa@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Cc: linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Robert Richter <rrichter@amd.com>
Cc: Thomas Lendacky <thomas.lendacky@amd.com>
---
 drivers/watchdog/sp5100_tco.c | 168 +++++++++++++++++++---------------
 1 file changed, 95 insertions(+), 73 deletions(-)

diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index ecc273b9b17f..64ecebd93403 100644
--- a/drivers/watchdog/sp5100_tco.c
+++ b/drivers/watchdog/sp5100_tco.c
@@ -223,6 +223,66 @@ static u32 sp5100_tco_read_pm_reg32(u8 index)
 	return val;
 }
 
+static int __sp5100_tco_prepare_base(struct sp5100_tco *tco,
+				     u32 mmio_addr,
+				     const char *dev_name)
+{
+	struct device *dev = tco->wdd.parent;
+	int ret = 0;
+
+	if (!mmio_addr)
+		return -ENOMEM;
+
+	if (!devm_request_mem_region(dev, mmio_addr,
+				    SP5100_WDT_MEM_MAP_SIZE,
+				    dev_name)) {
+		dev_dbg(dev, "MMIO address 0x%08x already in use\n",
+			mmio_addr);
+		return -EBUSY;
+	}
+
+	tco->tcobase = devm_ioremap(dev, mmio_addr,
+				    SP5100_WDT_MEM_MAP_SIZE);
+	if (!tco->tcobase) {
+		dev_dbg(dev, "MMIO address 0x%08x failed mapping.\n",
+			mmio_addr);
+		devm_release_mem_region(dev, mmio_addr,
+					SP5100_WDT_MEM_MAP_SIZE);
+		return -ENOMEM;
+	}
+
+	dev_info(dev, "Using 0x%08x for watchdog MMIO address\n",
+		 mmio_addr);
+
+	return ret;
+}
+
+static int sp5100_tco_prepare_base(struct sp5100_tco *tco,
+				   u32 mmio_addr,
+				   u32 alt_mmio_addr,
+				   const char *dev_name)
+{
+	struct device *dev = tco->wdd.parent;
+	int ret = 0;
+
+	dev_dbg(dev, "Got 0x%08x from SBResource_MMIO register\n",
+		mmio_addr);
+
+	/* Check MMIO address conflict */
+	ret = __sp5100_tco_prepare_base(tco, mmio_addr, dev_name);
+
+	/* Check alternate MMIO address conflict */
+	if (ret)
+		ret = __sp5100_tco_prepare_base(tco, alt_mmio_addr,
+						dev_name);
+
+	if (ret)
+		dev_err(dev, "Failed to reserve-map MMIO (%X) and alternate MMIO (%X) regions. ret=%X",
+			mmio_addr, alt_mmio_addr, ret);
+
+	return ret;
+}
+
 static int sp5100_tco_timer_init(struct sp5100_tco *tco)
 {
 	struct watchdog_device *wdd = &tco->wdd;
@@ -264,6 +324,7 @@ static int sp5100_tco_setupdevice(struct device *dev,
 	struct sp5100_tco *tco = watchdog_get_drvdata(wdd);
 	const char *dev_name;
 	u32 mmio_addr = 0, val;
+	u32 alt_mmio_addr = 0;
 	int ret;
 
 	/* Request the IO ports used by this driver */
@@ -282,11 +343,35 @@ static int sp5100_tco_setupdevice(struct device *dev,
 		dev_name = SP5100_DEVNAME;
 		mmio_addr = sp5100_tco_read_pm_reg32(SP5100_PM_WATCHDOG_BASE) &
 								0xfffffff8;
+
+		/*
+		 * Secondly, Find the watchdog timer MMIO address
+		 * from SBResource_MMIO register.
+		 */
+		/* Read SBResource_MMIO from PCI config(PCI_Reg: 9Ch) */
+		pci_read_config_dword(sp5100_tco_pci,
+				      SP5100_SB_RESOURCE_MMIO_BASE,
+				      &alt_mmio_addr);
+		if (alt_mmio_addr & ((SB800_ACPI_MMIO_DECODE_EN |
+				      SB800_ACPI_MMIO_SEL) !=
+				     SB800_ACPI_MMIO_DECODE_EN)) {
+			alt_mmio_addr &= ~0xFFF;
+			alt_mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
+		}
 		break;
 	case sb800:
 		dev_name = SB800_DEVNAME;
 		mmio_addr = sp5100_tco_read_pm_reg32(SB800_PM_WATCHDOG_BASE) &
 								0xfffffff8;
+		/* Read SBResource_MMIO from AcpiMmioEn(PM_Reg: 24h) */
+		alt_mmio_addr =
+			sp5100_tco_read_pm_reg32(SB800_PM_ACPI_MMIO_EN);
+		if (!(alt_mmio_addr & (((SB800_ACPI_MMIO_DECODE_EN |
+				       SB800_ACPI_MMIO_SEL)) !=
+		      SB800_ACPI_MMIO_DECODE_EN))) {
+			alt_mmio_addr &= ~0xFFF;
+			alt_mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
+		}
 		break;
 	case efch:
 		dev_name = SB800_DEVNAME;
@@ -305,87 +390,24 @@ static int sp5100_tco_setupdevice(struct device *dev,
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
+	ret = sp5100_tco_prepare_base(tco, mmio_addr, alt_mmio_addr, dev_name);
+	if (!ret) {
+		/* Setup the watchdog timer */
+		tco_timer_enable(tco);
 
-	tco->tcobase = devm_ioremap(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE);
-	if (!tco->tcobase) {
-		dev_err(dev, "failed to get tcobase address\n");
-		ret = -ENOMEM;
-		goto unreg_region;
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
-- 
2.30.2

