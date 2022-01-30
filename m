Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51FEC4A3875
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 20:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355784AbiA3TNJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 14:13:09 -0500
Received: from mail-bn7nam10on2076.outbound.protection.outlook.com ([40.107.92.76]:65280
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1355840AbiA3TNH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Jan 2022 14:13:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdLQgoxhdvstIOjBhHqEWyeNMp3KE+LDtoa5xEPrZuJqK968zMo+JIBBpQDkAFT5zADJenUxiWiP2i+WplxqY0r/zFZQjqAI1MLasTaerS7nOPnBsmEajACPMYCc38bcaJPvLOzVDzypJTgXXPobV2s9NgeramDfOF6zi6jD5uqvd4MXpnlra2jrFlbInxUI8K7nXE1SqooMONTRZXbsGgjvyCgiFNhwt+ZCClQzgR8kouKfe0gKeWzeh5X/lTQ/7oznmFBwrRhgS5rknY6c3m/j3E9XRLYW9mlkOx+bZY+KbletI1uBPJtqUIZg0ZwCMKCroKrYgOFvsytMA5jBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSikiT7i8hdTWF+rz+8BkWA/ntkQytBCdgRwVWQfhos=;
 b=THoSKJXk8fq+pDKG8vreLD6X56x/h2Qyn+y6eMxIjut43lwFp5kJFHj59txddfxbzS+Bf7oovGfDIpPlqYJYhVj1GedRbYvJ0in81COopUd9GzqWNw3IfseH9rOSe2Lh4sMSGZJGRQlGS6KXyh2ykX7WUgkM5mGsGLS8j0YEz3b2e1VtkHm6p+MLnmnD+fafY6W0YWuPukS8YUMjCnruBnpROHbpPS2RikpFkqW56QqDCO2m/z0YPgTTBHHuPD/MhefrzmtVtcoei/Ah9GmATvHuPbmNhfIMh5WT1EJDC6pndFm9EESjG0w4pcjjBSq4UZigB1D5zhpAgWykEybsiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSikiT7i8hdTWF+rz+8BkWA/ntkQytBCdgRwVWQfhos=;
 b=xehBz8+2E6vid/cc9gSkM6MgGTyjtPDrDx7tVi3U9/AR+zlmHQMWgd6KhgGfpuH9PorhuEjZTbR8AVAPyg55HrPr9PHFvheeTdCraBjHDOWUM4mpox61cD+KU9N08SNRDRAseeb444uYWKJIRpzEcbm6l2FSNQoarHJxga11yhE=
Received: from DM6PR08CA0028.namprd08.prod.outlook.com (2603:10b6:5:80::41) by
 MN2PR12MB3904.namprd12.prod.outlook.com (2603:10b6:208:165::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Sun, 30 Jan
 2022 19:13:05 +0000
Received: from DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::1) by DM6PR08CA0028.outlook.office365.com
 (2603:10b6:5:80::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17 via Frontend
 Transport; Sun, 30 Jan 2022 19:13:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT011.mail.protection.outlook.com (10.13.172.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Sun, 30 Jan 2022 19:13:04 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 30 Jan
 2022 13:13:03 -0600
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
Subject: [PATCH v4 3/4] Watchdog: sp5100_tco: Add initialization using EFCH MMIO
Date:   Sun, 30 Jan 2022 13:12:24 -0600
Message-ID: <20220130191225.303115-4-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: c4964644-f2f6-4fd8-3972-08d9e4248ae4
X-MS-TrafficTypeDiagnostic: MN2PR12MB3904:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3904C5F9F50E7E649327299B83249@MN2PR12MB3904.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tpNd3xT93FGA4RF0UyZvq8KPwO5RRa1Ob89WGa5sWcLI40yPM1ProEW/Ifcuk8/pN2Alrhn0oO3vfjYGXGFa7qnn13nDukbGGlqAt5yfK4+qu4at+9Xj1nQLLOlbsfQlnHLsKxglZkb+B66JBreiZBrgmbT7DaJr52vSY6wbgW4HT932INVHfEFuKHg65qavRBITQ4UKnWdlbQkDRhNjX8iDK7juvryB0HnC1LgejOyf0pJhfU1aNgsdEf4Nx99PlF4dQOa6eSfvprdUd8tsaielhFonLi6B2GZAVefZK+Elp26StqLwl4pQ4Jx3k56SsWC+Q4nVhhx7z4+gp8pbZeIpsZSDo5v0ghAfYST97T2++SAqvmq0xca0LJN+fUPCrFFWcMf8MV16MMiKHpGaNeYoo2I75kEl9dqyLREPUGpoJ5mofIwSmjTJ3Olm+TnZ+rnLvPinztbIJmKDLrbOXYsFWFop5Ie6Dnz6B3blSUkD/W/u/726oY9pK9dUjZf0MfqqWEYTdWlC4TdZWEh7/xURnUZm5po+SHWBa7KyRREfAF3zpspd2dW3DtkF2y7ASG4+iFgee+vEbK+8FBmMzx0LlAn3r2lVaA3rt0a/ppVUsMzhijHNgLe2UAG2mSOUDMv6uUthO0mPqIg0ZNnJ2odV/cGQASfn8IUQ+Bqn7Hxs2VlIJQW+d3e8SarHJP7T516j/aUHAnfcgpTsst1yqTolnGzTkqK4UqbOfWiL2cQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(426003)(336012)(26005)(81166007)(2616005)(16526019)(356005)(44832011)(5660300002)(36756003)(2906002)(1076003)(186003)(47076005)(40460700003)(4326008)(8676002)(508600001)(70586007)(82310400004)(8936002)(70206006)(86362001)(36860700001)(7696005)(316002)(6666004)(83380400001)(54906003)(110136005)(2101003)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 19:13:04.8710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4964644-f2f6-4fd8-3972-08d9e4248ae4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3904
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

cd6h/cd7h port I/O can be disabled on recent AMD hardware. Read
accesses to disabled cd6h/cd7h port I/O will return F's and written
data is dropped. It is recommended to replace the cd6h/cd7h
port I/O with MMIO.

Co-developed-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Terry Bowman <terry.bowman@amd.com>
Tested-by: Jean Delvare <jdelvare@suse.de>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/watchdog/sp5100_tco.c | 100 +++++++++++++++++++++++++++++++++-
 drivers/watchdog/sp5100_tco.h |   5 ++
 2 files changed, 104 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index 16e122d5045e..1a5e76d13c3c 100644
--- a/drivers/watchdog/sp5100_tco.c
+++ b/drivers/watchdog/sp5100_tco.c
@@ -49,7 +49,7 @@
 /* internal variables */
 
 enum tco_reg_layout {
-	sp5100, sb800, efch
+	sp5100, sb800, efch, efch_mmio
 };
 
 struct sp5100_tco {
@@ -209,6 +209,8 @@ static void tco_timer_enable(struct sp5100_tco *tco)
 					  ~EFCH_PM_WATCHDOG_DISABLE,
 					  EFCH_PM_DECODEEN_SECOND_RES);
 		break;
+	default:
+		break;
 	}
 }
 
@@ -307,6 +309,99 @@ static int sp5100_tco_timer_init(struct sp5100_tco *tco)
 	return 0;
 }
 
+static u8 efch_read_pm_reg8(void __iomem *addr, u8 index)
+{
+	return readb(addr + index);
+}
+
+static void efch_update_pm_reg8(void __iomem *addr, u8 index, u8 reset, u8 set)
+{
+	u8 val;
+
+	val = readb(addr + index);
+	val &= reset;
+	val |= set;
+	writeb(val, addr + index);
+}
+
+static void tco_timer_enable_mmio(void __iomem *addr)
+{
+	efch_update_pm_reg8(addr, EFCH_PM_DECODEEN3,
+			    ~EFCH_PM_WATCHDOG_DISABLE,
+			    EFCH_PM_DECODEEN_SECOND_RES);
+}
+
+static int sp5100_tco_setupdevice_mmio(struct device *dev,
+				       struct watchdog_device *wdd)
+{
+	struct sp5100_tco *tco = watchdog_get_drvdata(wdd);
+	const char *dev_name = SB800_DEVNAME;
+	u32 mmio_addr = 0, alt_mmio_addr = 0;
+	struct resource *res;
+	void __iomem *addr;
+	int ret;
+	u32 val;
+
+	res = request_mem_region_muxed(EFCH_PM_ACPI_MMIO_PM_ADDR,
+				       EFCH_PM_ACPI_MMIO_PM_SIZE,
+				       "sp5100_tco");
+
+	if (!res) {
+		dev_err(dev,
+			"Memory region 0x%08x already in use\n",
+			EFCH_PM_ACPI_MMIO_PM_ADDR);
+		return -EBUSY;
+	}
+
+	addr = ioremap(EFCH_PM_ACPI_MMIO_PM_ADDR, EFCH_PM_ACPI_MMIO_PM_SIZE);
+	if (!addr) {
+		dev_err(dev, "Address mapping failed\n");
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	/*
+	 * EFCH_PM_DECODEEN_WDT_TMREN is dual purpose. This bitfield
+	 * enables sp5100_tco register MMIO space decoding. The bitfield
+	 * also starts the timer operation. Enable if not already enabled.
+	 */
+	val = efch_read_pm_reg8(addr, EFCH_PM_DECODEEN);
+	if (!(val & EFCH_PM_DECODEEN_WDT_TMREN)) {
+		efch_update_pm_reg8(addr, EFCH_PM_DECODEEN, 0xff,
+				    EFCH_PM_DECODEEN_WDT_TMREN);
+	}
+
+	/* Error if the timer could not be enabled */
+	val = efch_read_pm_reg8(addr, EFCH_PM_DECODEEN);
+	if (!(val & EFCH_PM_DECODEEN_WDT_TMREN)) {
+		dev_err(dev, "Failed to enable the timer\n");
+		ret = -EFAULT;
+		goto out;
+	}
+
+	mmio_addr = EFCH_PM_WDT_ADDR;
+
+	/* Determine alternate MMIO base address */
+	val = efch_read_pm_reg8(addr, EFCH_PM_ISACONTROL);
+	if (val & EFCH_PM_ISACONTROL_MMIOEN)
+		alt_mmio_addr = EFCH_PM_ACPI_MMIO_ADDR +
+			EFCH_PM_ACPI_MMIO_WDT_OFFSET;
+
+	ret = sp5100_tco_prepare_base(tco, mmio_addr, alt_mmio_addr, dev_name);
+	if (!ret) {
+		tco_timer_enable_mmio(addr);
+		ret = sp5100_tco_timer_init(tco);
+	}
+
+out:
+	if (addr)
+		iounmap(addr);
+
+	release_resource(res);
+
+	return ret;
+}
+
 static int sp5100_tco_setupdevice(struct device *dev,
 				  struct watchdog_device *wdd)
 {
@@ -316,6 +411,9 @@ static int sp5100_tco_setupdevice(struct device *dev,
 	u32 alt_mmio_addr = 0;
 	int ret;
 
+	if (tco->tco_reg_layout == efch_mmio)
+		return sp5100_tco_setupdevice_mmio(dev, wdd);
+
 	/* Request the IO ports used by this driver */
 	if (!request_muxed_region(SP5100_IO_PM_INDEX_REG,
 				  SP5100_PM_IOPORTS_SIZE, "sp5100_tco")) {
diff --git a/drivers/watchdog/sp5100_tco.h b/drivers/watchdog/sp5100_tco.h
index daee872f9b71..8ca1b215e3ce 100644
--- a/drivers/watchdog/sp5100_tco.h
+++ b/drivers/watchdog/sp5100_tco.h
@@ -83,4 +83,9 @@
 #define EFCH_PM_ISACONTROL_MMIOEN	BIT(1)
 
 #define EFCH_PM_ACPI_MMIO_ADDR		0xfed80000
+#define EFCH_PM_ACPI_MMIO_PM_OFFSET	0x00000300
 #define EFCH_PM_ACPI_MMIO_WDT_OFFSET	0x00000b00
+
+#define EFCH_PM_ACPI_MMIO_PM_ADDR	(EFCH_PM_ACPI_MMIO_ADDR +	\
+					 EFCH_PM_ACPI_MMIO_PM_OFFSET)
+#define EFCH_PM_ACPI_MMIO_PM_SIZE	8
-- 
2.30.2

