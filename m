Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1410C4A74AB
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 16:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345506AbiBBPf5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 10:35:57 -0500
Received: from mail-dm6nam12on2049.outbound.protection.outlook.com ([40.107.243.49]:15969
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231365AbiBBPf4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Feb 2022 10:35:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0j/GpVD8DZoMwnElXKsehVo77OQMgnBoJ//8V1iZPvF/qs5fThNTHB0sy7Evz8RSmWWtTAcYedUYjFIwFJTcrUk/nN0LSzeDz41Gnt2xuk4Ib+mkWS3hCXMkBuRFHMtS2vQiPwgJAwByRRqyve/5fXcT7/3a2BuTqd+lBrQrdUcVB6fXVxnLoklGDTtHXjhNF6r8GEU8ThgBDPx5Y9FaqOXSJFu/r8/VY5As2jxXh1RtJOQwvG4T5jdUQMVJC5ubNA3bZRR6nLyXXZpl5ndkidOODt+Zqqsgc/Al4PagDhsxsPLdpj0uqDpRv5BJK9+KwxmHZcfxEIuiQVtcORoSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIYpZ2C5/hnmub6Jg3VC+X/rT71YHEBoBKlluFtcw9c=;
 b=WHP9F+DVTC1WuIvjers7am2KAyyO8ygN8+Pat2+hb+sXoi5y44sibeKfsmpFF8ahtIauMxdxA+7tvM35rUHeeVO54Ug81sGasoL5WnVcC5HSII+j7sAKIzCG0Otfw/ouSW/oknFvIqwt0N/1Xqicv5UWhnbNhIYtL00UzwsBusONS9i3dcbdAhnYc+Paz3nEs2dYFevQkyhQFbxEgNmf/7t/lYxR09kUuN9ZHdKGS14ZQfFHrwLq3pj9+fHhCUbdkqW+B2Mtwte7+pHUt/t6bZiej5rQPFAEuafma2s/ol5Vn5K2shyXTO79b10FJNVjVrdTdPVHPy+AKrx1rIYdOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIYpZ2C5/hnmub6Jg3VC+X/rT71YHEBoBKlluFtcw9c=;
 b=zvn1VXPUvL/srAvtEjSRdnRAfo/cpnFafy6S4E9bZtoz7CBsGWdW3RXFxVez6zqJ1LdYFqDgM1IJwZ71VeRb8NMJEDXCqSj/sH2Y8sTpFDvBBZue6lEP90hXJDosN6nsbZL3jm87SpLXVgF0FUsMw3I8aBBaMt2o+vVlDoXsBQo=
Received: from BN9PR03CA0388.namprd03.prod.outlook.com (2603:10b6:408:f7::33)
 by DM5PR12MB1148.namprd12.prod.outlook.com (2603:10b6:3:74::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Wed, 2 Feb
 2022 15:35:54 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::95) by BN9PR03CA0388.outlook.office365.com
 (2603:10b6:408:f7::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 2 Feb 2022 15:35:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Wed, 2 Feb 2022 15:35:53 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 2 Feb
 2022 09:35:52 -0600
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
Subject: [PATCH v5 2/4] Watchdog: sp5100_tco: Refactor MMIO base address initialization
Date:   Wed, 2 Feb 2022 09:35:23 -0600
Message-ID: <20220202153525.1693378-3-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: b3068aa4-31f1-4682-625b-08d9e661b2ec
X-MS-TrafficTypeDiagnostic: DM5PR12MB1148:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB11480F5962B507A9AA0FF6A683279@DM5PR12MB1148.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IWtioDEKkYw7E/icfjvX9OsRIpwpomADCexFu4J4GZ5eieBDMxhIIFkdcTx8CQp/djcMR1K9PlpHsx7Gx0xgMQw8wJBRCDKFbmqa5MGPky7KR61un1AEKktOclbtQpsTXTYsOuHoP7JEEvreoIfPsDUNHEbsz+PREG04dZUBANNGHD9hMnppfvKIak83jI+W9ud0k/8nvKoxAGQFexAdB61ukeny1YCBCa0IKxx2eTaliXXVlPlL2tkzsX4BgPNxVERSCF9a83+rAu3oBkaiahLEuCIcm+i/3153VdynUjozoeiOFLXuwtUqQNTJO40AlV7AdlsBAZT8yJ0xJqCbnHtj8/l+MZiH9ostkAfkNC+NkIoIM19BwavOgJ1zcioyMLSmvlEufnXXtc6n+UabXLIUdHlGdhrJ0FFet9Kyv9BsBkFH1WtW85HswSd8acUkDFalUIuzPNg4YCFp2vGYyRsUKLF+XGu+9ftdbfZGTa+o2bPC8qndlr3OyxqGmrKBmhKAyYdJnMB5oKOerGVSsqsk4Qk0ESgk8OQHdrLIYBIymws+dx8sZtn1wjZwdjyTK1W63PS3l40qNvqNSlv0vxK1mamJBseHFQXyWdieBTxZ2Ne/r1Ef9d0Xwq+XnUnPx+L2ej/6Akrp4Z37i9mrz0mPj1m/DcefAPm9ayeQcmSx3b5mRBsrw6mmMx/q1sHlEYaNiFYdEapTqPSjTgr5QfVMQ1P64P0G/0xOXAeVhKw=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(44832011)(36756003)(356005)(5660300002)(336012)(81166007)(1076003)(2616005)(40460700003)(426003)(16526019)(186003)(26005)(2906002)(316002)(7696005)(70586007)(8936002)(4326008)(70206006)(110136005)(83380400001)(82310400004)(508600001)(86362001)(54906003)(47076005)(6666004)(36860700001)(8676002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 15:35:53.7063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3068aa4-31f1-4682-625b-08d9e661b2ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1148
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
index b365bbc9ac36..8db7504f0aa4 100644
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
+	dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", mmio_addr);
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

