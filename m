Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC963493073
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 23:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349858AbiARWM7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 17:12:59 -0500
Received: from mail-dm6nam08on2047.outbound.protection.outlook.com ([40.107.102.47]:10046
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1349879AbiARWM5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jan 2022 17:12:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DorTFth/jMCtzOZdd0JGfHHtF5hAXYy0akU5uBUirpzKY01rNJIdMzHPrLPAjNil1uCTqAPsm6pmeB+MPpvtToxoMd0D89nLZKr1NVSnTrkresxa+PFRFIKOt40ZA4cxkAzQQti61hEQjbsMeVNt1bMM3sctujvZR6r/G/nTgLGKb3LB/CSfar+S0PC8Ztg+25w2eUgzuQ7Fx1Vd88mPcE00XEmN+Fga7yRQfV3s/Z3SEjUbuEuIE+qX6SHUZbqNUML5vasbcC40lEiRi21rwQrGFtEYIdHnLs0+zuRZ9AwnboLs765SKqCuYtMNMthPCMxb5BrML8u3XcPIX7GweA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPgtwqX+LPB3P6hOmy6wodB5OmG9L9Mkt+cGk4zPQK4=;
 b=kX442TPHmi/A3kOKO60jogBVFnbUQC+S+h0d/KdOV1jysOr5K4u6jplH9Jj4gQK/3jxeCFnfI10kwWc1ZtFz0sICVProqHq2YSWNZ7V8NJYm1BLsobJsMrjnnNfUNqEmGymkz8IpeJMnZK2Ozh9IGpcR8zmcf3e+Wzw1EgpidzXt2GSHSyBqI5wIlG5ErLMW9CrFlCWy8r7M/iP5g2AFRRWd0J22ucJxqj9jm7SF/4fO5EjRRvBaVRdn3lT75k5KAip0ptTrGP5HmpWHuU2x6KDBjd/e8O2aWBixbjnolXSC1DFFGD1Ese9YoYMc4pqQSjz0z4neB7cLDqoqU1fT8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPgtwqX+LPB3P6hOmy6wodB5OmG9L9Mkt+cGk4zPQK4=;
 b=IP+rXgp/gd43dw9FiLCpq34VZEwWQYy+NA4lGH8P+zddraHeJQjXVFxb5G7uHF1rPmNr87MxCrS27aif6RHnq4lBIsCwBJPs1D/iqvziT5e7xx1GU29ivO8zruuFvmJybu0KzlGowhufTA1ze1N/RLWxIcTlvrq+Oh1gJ1aWi4o=
Received: from BN9PR03CA0250.namprd03.prod.outlook.com (2603:10b6:408:ff::15)
 by MN2PR12MB2862.namprd12.prod.outlook.com (2603:10b6:208:a9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 18 Jan
 2022 22:12:54 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::9d) by BN9PR03CA0250.outlook.office365.com
 (2603:10b6:408:ff::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Tue, 18 Jan 2022 22:12:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Tue, 18 Jan 2022 22:12:54 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 16:12:53 -0600
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
Subject: [PATCH v2 5/8] i2c: piix4: Add EFCH MMIO support to region request and release
Date:   Tue, 18 Jan 2022 16:11:49 -0600
Message-ID: <20220118221152.300444-6-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220118221152.300444-1-terry.bowman@amd.com>
References: <20220118221152.300444-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81212426-764e-429f-d226-08d9dacfacf1
X-MS-TrafficTypeDiagnostic: MN2PR12MB2862:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB28629B84F161F36ECD5BC73D83589@MN2PR12MB2862.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H7cpP+zb/dlEpxx/mA6Abu2DYfqbPwqAnv1oh1b/0TkgmMn469gY52MGjRx9UlX4GJEjB/3n4XRVmEQfPAz+79yw15FMnQ5Es6ZW2nkGOGS9x5fVwStIv3u5+voomowqrt39r+/vccT341fIA6b+ht6L3CktaxcGqgv5FNb6QUdSKeFU0iu6u+Bip/piC3AsS4xF8/t/zK/LcRsqbkTfbc+Ja+us38p0gca7adVt3Vv2jCPbHQ1L7S8PrO4/RitlZ+u4wppH6pKGBZPGbvZ0nW4fpEJCNuHSPAhiiKHxj2dP/0VC+/G25GivPZcfVNRtSz1uKWd0gxns0g6kVLkiMzSfOz1v/zKkiPxRK1cq/+AH7i37MIJT9NQTQdkvr8Lxl42dwRJuu8jRmWAdriv9Q72GiGp8W/xUD3dSZYnNaIlRd69fmTv9JIjTDc5JKtdVLr/xJumj2L/b2MTTk6NbVEHOv6gFsHosSi34quqXRAFsD5uGg5bMEmvWfZo+1zon7tZBiCXhJq3Ja1+Ss7BdRxjZh19ff+jug1kI2odQRE6V1NwL++XwfYsfhvxdV1uqdWs09/iq2Y54aFYffSwVjtFnYnUH2fole3NF27wr2Ho/SSoL8jgvv4a6w5dKa6do3glF3gLDpDuaXijby1wzJSyQltmsyPw5WhDAyxHh8Z05LTCUhfW9vyEmRxe71LtvY4ezpNRExfvY0EujS19XvjDj7Wo5AKYlQmDg6qVslZt5cx4RRGYCEsfPx2aU20iQywvkJtxVWUeNAyYQAk/AXhO2OCDjof9uTJC8iXLb06AZZSSUrps/TibdWVpC6Rnj
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700002)(70206006)(16526019)(4326008)(54906003)(336012)(26005)(40460700001)(44832011)(426003)(86362001)(82310400004)(6666004)(186003)(110136005)(316002)(2616005)(70586007)(1076003)(5660300002)(36860700001)(356005)(508600001)(81166007)(83380400001)(7696005)(2906002)(36756003)(8676002)(8936002)(47076005)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 22:12:54.3937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81212426-764e-429f-d226-08d9dacfacf1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2862
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

EFCH cd6h/cd7h port I/O may no longer be available on later AMD
processors and it is recommended to use MMIO instead. Update the
request and release functions to support MMIO.

MMIO request/release and mmapping require details during cleanup.
Add a MMIO configuration structure containing resource and vaddress
details for mapping the region, accessing the region, and releasing
the region.

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
 drivers/i2c/busses/i2c-piix4.c | 76 +++++++++++++++++++++++++++-------
 1 file changed, 61 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 58b613b78c97..ffb1367dd852 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -98,6 +98,9 @@
 #define SB800_PIIX4_PORT_IDX_MASK_KERNCZ	0x18
 #define SB800_PIIX4_PORT_IDX_SHIFT_KERNCZ	3
 
+#define SB800_PIIX4_FCH_PM_ADDR                 0xFED80300
+#define SB800_PIIX4_FCH_PM_SIZE                 8
+
 /* insmod parameters */
 
 /* If force is set to anything different from 0, we forcibly enable the
@@ -156,6 +159,12 @@ static const char *piix4_main_port_names_sb800[PIIX4_MAX_ADAPTERS] = {
 };
 static const char *piix4_aux_port_name_sb800 = " port 1";
 
+struct sb800_mmio_cfg {
+	void __iomem *addr;
+	struct resource *res;
+	bool use_mmio;
+};
+
 struct i2c_piix4_adapdata {
 	unsigned short smba;
 
@@ -163,26 +172,60 @@ struct i2c_piix4_adapdata {
 	bool sb800_main;
 	bool notify_imc;
 	u8 port;		/* Port number, shifted */
+	struct sb800_mmio_cfg mmio_cfg;
 };
 
-static int piix4_sb800_region_setup(struct device *dev)
+static int piix4_sb800_region_setup(struct device *dev,
+				    struct sb800_mmio_cfg *mmio_cfg)
 {
-	if (!request_muxed_region(SB800_PIIX4_SMB_IDX,
-				  SB800_PIIX4_SMB_MAP_SIZE,
-				  "sb800_piix4_smb")) {
-		dev_err(dev,
-			"SMB base address index region 0x%x already in use.\n",
-			SB800_PIIX4_SMB_IDX);
-		return -EBUSY;
+	if (mmio_cfg->use_mmio) {
+		struct resource *res;
+		void __iomem *addr;
+
+		res = request_mem_region(SB800_PIIX4_FCH_PM_ADDR,
+					 SB800_PIIX4_FCH_PM_SIZE,
+					 "sb800_piix4_smb");
+		if (!res) {
+			dev_err(dev,
+				"SMBus base address memory region 0x%x already in use.\n",
+				SB800_PIIX4_FCH_PM_ADDR);
+			return -EBUSY;
+		}
+
+		addr = ioremap(SB800_PIIX4_FCH_PM_ADDR,
+			       SB800_PIIX4_FCH_PM_SIZE);
+		if (!addr) {
+			release_resource(res);
+			dev_err(dev, "SMBus base address mapping failed.\n");
+			return -ENOMEM;
+		}
+
+		mmio_cfg->res = res;
+		mmio_cfg->addr = addr;
+	} else {
+		if (!request_muxed_region(SB800_PIIX4_SMB_IDX,
+					  SB800_PIIX4_SMB_MAP_SIZE,
+					  "sb800_piix4_smb")) {
+			dev_err(dev,
+				"SMBus base address index region 0x%x already in use.\n",
+				SB800_PIIX4_SMB_IDX);
+			return -EBUSY;
+		}
 	}
 
 	return 0;
 }
 
-static void piix4_sb800_region_release(struct device *dev)
+static void piix4_sb800_region_release(struct device *dev,
+				       struct sb800_mmio_cfg *mmio_cfg)
 {
-	release_region(SB800_PIIX4_SMB_IDX,
-		       SB800_PIIX4_SMB_MAP_SIZE);
+	if (mmio_cfg->use_mmio) {
+		iounmap(mmio_cfg->addr);
+		release_resource(mmio_cfg->res);
+	} else {
+		release_region(SB800_PIIX4_SMB_IDX,
+			       SB800_PIIX4_SMB_MAP_SIZE);
+	}
 }
 
 static int piix4_setup(struct pci_dev *PIIX4_dev,
@@ -290,11 +333,14 @@ static int piix4_setup_sb800_smba(struct pci_dev *PIIX4_dev,
 				  u8 *smb_en_status,
 				  unsigned short *piix4_smba)
 {
+	struct sb800_mmio_cfg mmio_cfg;
 	u8 smba_en_lo;
 	u8 smba_en_hi;
 	int retval;
 
-	retval = piix4_sb800_region_setup(&PIIX4_dev->dev);
+	mmio_cfg.use_mmio = 0;
+
+	retval = piix4_sb800_region_setup(&PIIX4_dev->dev, &mmio_cfg);
 	if (retval)
 		return retval;
 
@@ -303,7 +349,7 @@ static int piix4_setup_sb800_smba(struct pci_dev *PIIX4_dev,
 	outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
 	smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
 
-	piix4_sb800_region_release(&PIIX4_dev->dev);
+	piix4_sb800_region_release(&PIIX4_dev->dev, &mmio_cfg);
 
 	if (!smb_en) {
 		*smb_en_status = smba_en_lo & 0x10;
@@ -732,7 +778,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 	u8 prev_port;
 	int retval;
 
-	retval = piix4_sb800_region_setup(&adap->dev);
+	retval = piix4_sb800_region_setup(&adap->dev, &adapdata->mmio_cfg);
 	if (retval)
 		return retval;
 
@@ -803,7 +849,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		piix4_imc_wakeup();
 
 release:
-	piix4_sb800_region_release(&adap->dev);
+	piix4_sb800_region_release(&adap->dev, &adapdata->mmio_cfg);
 	return retval;
 }
 
-- 
2.30.2

