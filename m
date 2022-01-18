Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4265E492F4C
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 21:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239968AbiARUXS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 15:23:18 -0500
Received: from mail-bn8nam11on2057.outbound.protection.outlook.com ([40.107.236.57]:28768
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1349205AbiARUXS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jan 2022 15:23:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6LxbIM9gA7p35xUW5b0lJew9ZKsz7o7otTxFeeJMh/UX43NC7txxucCVGheJ6JIBt775gEgc6LOxH6KuBGoXb1CqPYAHV64uczbNsrKD8nFBM9i1Z15IzyaffaR3HMB7i6Hvt4OmFFN0ag5jwy8JpkIp+XjtkQEAg6Pag+mYbzrz3vZ/pwKoWHCduM7hUqvRHlx20b1D/PcUfFQ/35qQPlwRJmtm7YdVpgSXGCZNw+OsIQn/2d4EQo0fydGprRNhO81F7IVkFUw3cR6JKrGtFxiPBs7i6KZMhOf6uZBacE6tfQb+qtFYmY87AtEoOhTjZalfJWRB3jP00ORYI0OqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTmUlHQWt9OwKjE8b4UnMf3H2eWISzjS86dCFJlVsVM=;
 b=E3q/oMwjsuSd00qxNdf+pIMJD2rxKG0YMdQZPd9W0/IbLXCw/o8kDpstSfqwPvJftWwA+Sz3FdFukl0F+bGCmv4BwkekZEi0y6OkRhyErCVvCtAahWhyktwDlRRZSbG0Bs4oAnYY55/h9se/YBx5AMk2bPzmPoF6eQX8MP0oNgLsgR095O9zaQ5OqBNsNtQ1RkW+5zbFYqMrsvlzJ3Mbx3AVNNUoJsEZPlD/UapVcnNvehq02Y+4DOYTEztctnqun8BUA/oVwuTKR/GVbjJ25qziAzV+OMdtLR5WmIk+MyIoKDeTE1Q9gEnydHtK4iFb8QoBbIVcTxYsAXdCoNep2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTmUlHQWt9OwKjE8b4UnMf3H2eWISzjS86dCFJlVsVM=;
 b=5cSnPJvXl0cQf77A6AemINLde+A3FxfWQg8cUwWEscXNk0An0/JbvFG0DUAAcEzv0qecxU1JNdX0qc+4pe/IC51qVzeiTa3pzUuuyq3pIRM+yrW+1qADCDeWakYih+Syf6H77va7JVoNJ+iE6HrbeKu5fADi3L2ZZBkdGyXDsjs=
Received: from MWHPR21CA0052.namprd21.prod.outlook.com (2603:10b6:300:db::14)
 by DM6PR12MB2826.namprd12.prod.outlook.com (2603:10b6:5:76::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.13; Tue, 18 Jan
 2022 20:23:15 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:db:cafe::9c) by MWHPR21CA0052.outlook.office365.com
 (2603:10b6:300:db::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.3 via Frontend
 Transport; Tue, 18 Jan 2022 20:23:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Tue, 18 Jan 2022 20:23:14 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 14:23:13 -0600
From:   Terry Bowman <terry.bowman@amd.com>
To:     <terry.bowman@amd.com>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <jdelvare@suse.com>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>
CC:     <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <Nehal-bakulchandra.Shah@amd.com>, <Basavaraj.Natikar@amd.com>,
        <Shyam-sundar.S-k@amd.com>, <Mario.Limonciello@amd.com>
Subject: [PATCH v3 3/4] Watchdog: sp5100_tco: Add initialization using EFCH MMIO
Date:   Tue, 18 Jan 2022 14:22:33 -0600
Message-ID: <20220118202234.410555-4-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0eb39a66-2d47-4535-c3c0-08d9dac05b2a
X-MS-TrafficTypeDiagnostic: DM6PR12MB2826:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB282603FEBAE82F21D333BE2C83589@DM6PR12MB2826.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: APQRqSqfyoYheuqqxTG6/Xrwuzej3EnnA28jdso15GxecIZ/vKro6xa0ExGn5idjWAqW2Ydr37lgAnrl6RSimYVvcLoFhNkkn04qrE6kbc2Gw/qwX0b43VmB5fzGsSMjhnlrn7njxUC0dA8Eg7huHpGLJoSCVGec2Ggyojr3280Kdh5gr5U/DzVu3GEehsZ2wALI3kn1KxVRBgA0P9swDVFvxywP08gDR8NUi+c1+RgeVC4kFk3HJNjE9ywP3jP5nEkGHfeEOmYU68KivjQYNhFjbNSCH3naPHRFLYH9DJy+cqno42tkfHHj5dwXkJfjD+xL6k2OlhvKKEYd3QTZkg3qKEEYRmlrTqKPLJHLWlrIsMW51XSObWf1W0t/mWpWrxnjWbmu7Vqi2uMoWT0tMAkT5dj1bP16BYrAkfr88+sQfF4paV/zON5iYTQ/jA+YSzAyDYnvdaSkA94rWaTW5WFY8dMxgl3ZL5rN79WNZsKQplXyzTLlUtTNkhd+RlAUjk5FS7h9ZB2bgNjrAi/2RH4vxQ7rxvXR053MMXYpU9nD4MlqinIS6ZpQZjXqhmgPmJBybIBR/CgjQICI/VEcJN+n8OW+yYQpZssTERfLcytX7s0pV38T6bFr2JBNjKaNaiMz1SIFQElAp198jXm6LEM5BwOicICB+VKpmypT6wJfqiWCuT+IMpRvvJqarxo2dxcw4MlvUrXaiCZ1gPZtwdSG1RGz7w5xOGdfbRI9lwmtsIxiIAC+VFgX1bTVMYcOEn/oQDWFrrR385pm7c94Y/c0MJtXfm8Bt6syzolAY+WfSc5B0SjiPMkSp1kiXi0N
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(186003)(16526019)(47076005)(336012)(426003)(44832011)(26005)(2616005)(2906002)(36860700001)(82310400004)(81166007)(356005)(40460700001)(83380400001)(316002)(1076003)(70206006)(70586007)(54906003)(36756003)(110136005)(6666004)(86362001)(7696005)(8676002)(5660300002)(4326008)(8936002)(508600001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 20:23:14.2897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb39a66-2d47-4535-c3c0-08d9dac05b2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2826
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
 drivers/watchdog/sp5100_tco.c | 88 ++++++++++++++++++++++++++++++++++-
 drivers/watchdog/sp5100_tco.h |  5 ++
 2 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index 64ecebd93403..36519a992ca1 100644
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
 
@@ -318,6 +320,87 @@ static int sp5100_tco_timer_init(struct sp5100_tco *tco)
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
+
+	res = request_mem_region(EFCH_PM_ACPI_MMIO_PM_ADDR,
+				 EFCH_PM_ACPI_MMIO_PM_SIZE,
+				 "sp5100_tco");
+
+	if (!res) {
+		dev_err(dev,
+			"SMB base address memory region 0x%x already in use.\n",
+			EFCH_PM_ACPI_MMIO_PM_ADDR);
+		return -EBUSY;
+	}
+
+	addr = ioremap(EFCH_PM_ACPI_MMIO_PM_ADDR,
+		       EFCH_PM_ACPI_MMIO_PM_SIZE);
+	if (!addr) {
+		release_resource(res);
+		dev_err(dev, "SMB base address mapping failed.\n");
+		return -ENOMEM;
+	}
+
+	if (!(efch_read_pm_reg8(addr, EFCH_PM_DECODEEN) &
+	      EFCH_PM_DECODEEN_WDT_TMREN)) {
+		efch_update_pm_reg8(addr, EFCH_PM_DECODEEN,
+				    0xff,
+				    EFCH_PM_DECODEEN_WDT_TMREN);
+	}
+
+	/* Determine MMIO base address */
+	if (efch_read_pm_reg8(addr, EFCH_PM_DECODEEN) &
+	    EFCH_PM_DECODEEN_WDT_TMREN)
+		mmio_addr = EFCH_PM_WDT_ADDR;
+
+	/* Determine alternate MMIO base address */
+	if (efch_read_pm_reg8(addr, EFCH_PM_ISACONTROL) &
+	    EFCH_PM_ISACONTROL_MMIOEN)
+		alt_mmio_addr = EFCH_PM_ACPI_MMIO_ADDR +
+			EFCH_PM_ACPI_MMIO_WDT_OFFSET;
+
+	ret = sp5100_tco_prepare_base(tco, mmio_addr, alt_mmio_addr, dev_name);
+	if (!ret) {
+		tco_timer_enable_mmio(addr);
+		ret = sp5100_tco_timer_init(tco);
+	}
+
+	iounmap(addr);
+	release_resource(res);
+
+	return ret;
+}
+
 static int sp5100_tco_setupdevice(struct device *dev,
 				  struct watchdog_device *wdd)
 {
@@ -327,6 +410,9 @@ static int sp5100_tco_setupdevice(struct device *dev,
 	u32 alt_mmio_addr = 0;
 	int ret;
 
+	if (tco->tco_reg_layout == efch_mmio)
+		return sp5100_tco_setupdevice_mmio(dev, wdd);
+
 	/* Request the IO ports used by this driver */
 	if (!request_muxed_region(SP5100_IO_PM_INDEX_REG,
 				  SP5100_PM_IOPORTS_SIZE, "sp5100_tco")) {
diff --git a/drivers/watchdog/sp5100_tco.h b/drivers/watchdog/sp5100_tco.h
index adf015aa4126..2df8f8b2c55b 100644
--- a/drivers/watchdog/sp5100_tco.h
+++ b/drivers/watchdog/sp5100_tco.h
@@ -83,3 +83,8 @@
 
 #define EFCH_PM_ACPI_MMIO_ADDR		0xfed80000
 #define EFCH_PM_ACPI_MMIO_WDT_OFFSET	0x00000b00
+#define EFCH_PM_ACPI_MMIO_PM_OFFSET	0x00000300
+
+#define EFCH_PM_ACPI_MMIO_PM_ADDR	(EFCH_PM_ACPI_MMIO_ADDR +	\
+					 EFCH_PM_ACPI_MMIO_PM_OFFSET)
+#define EFCH_PM_ACPI_MMIO_PM_SIZE       8
-- 
2.30.2

