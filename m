Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02347492F4F
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 21:23:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349190AbiARUX3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 15:23:29 -0500
Received: from mail-bn7nam10on2049.outbound.protection.outlook.com ([40.107.92.49]:55041
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239708AbiARUX2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jan 2022 15:23:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2qizqIDA18anrtePwkQdRdgk9/ARsdc/Q6GQUlQaE/6ro8dbQnGeoRiu1TEqpO3Lw2KDRS1+fBgbDjNf6rb+wSUaHJmMUEEpguacAQm8aj3xBUz1glA0QF2lnNjV1WyO2EjIa+kcq+BV2QaeX8vpedUpLG5Xw/rnivwbEuQPBNcrRYgVoxBN84QGcds87hyzS8Bab6bpEjKoDqz9M7Mc68a1IpwZreQSFeq6vxl2IWvC6KpC4jHDK/gXBLxxqM5C7dFy8tV5mIEAsEz+5an7CcAWfzVb36CMjmyp3Pl20PNGVvGawGD7bw0P5PQO49f7KSGBnCOWPgNgy/zjCIHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbIvtPC0slPnXr9HdZTmd6gK6ENtB91sMYXUzm2ay6E=;
 b=SmqWvvbI5SVSrg6pJGiXzxt2EXMJs39/vAquoRBA/wDCHvWaGD38UihOpBL8VsEATTRIGF6/GAyl9ngFBs0otuQLIISPCkEeUJ4KPvofR2SgEjjJMug0QM0y1l0uPx7VrL8KAGDJK5V3MwnTUq41sNyGrBWMdw27VZUfsXTEGX2dW5Zaa6kVhw0hrZO2oLZ8Rkv2ZnR8m517W7JwfY5ORVnprWQyNq02IeF0GvjwQ9/AATHdpdYR9MQZFtoOGOdO7h2e+kBFPnJCcxmAZA8nkfEAi8v6IZSFRrK5FmEH/qdaH/T0TgSyknq0IVLbACbbP7Mf9WNvJVJRd11zKNYBpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbIvtPC0slPnXr9HdZTmd6gK6ENtB91sMYXUzm2ay6E=;
 b=bRJIm1VKql7cqAkD8BW/vObWcSkcYMy0s49hMpEhMk37sFjW34hVahLV7GApN2NRyxc6+wNb5m8xWlScmFbbVysT1xFvYXL/yYwo5ntCfgfEr6Fl+bT9oP3BtVZBBMc6ncY5Sor5N3BPvAGvNmP/xvXxuzFJCq6PdUtm9I/ElF0=
Received: from MW2PR16CA0041.namprd16.prod.outlook.com (2603:10b6:907:1::18)
 by CY4PR12MB1429.namprd12.prod.outlook.com (2603:10b6:903:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Tue, 18 Jan
 2022 20:23:26 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::c0) by MW2PR16CA0041.outlook.office365.com
 (2603:10b6:907:1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11 via Frontend
 Transport; Tue, 18 Jan 2022 20:23:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Tue, 18 Jan 2022 20:23:25 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 14:23:24 -0600
From:   Terry Bowman <terry.bowman@amd.com>
To:     <terry.bowman@amd.com>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <jdelvare@suse.com>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>
CC:     <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <Nehal-bakulchandra.Shah@amd.com>, <Basavaraj.Natikar@amd.com>,
        <Shyam-sundar.S-k@amd.com>, <Mario.Limonciello@amd.com>
Subject: [PATCH v3 4/4] Watchdog: sp5100_tco: Enable Family 17h+ CPUs
Date:   Tue, 18 Jan 2022 14:22:34 -0600
Message-ID: <20220118202234.410555-5-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4d34794b-cda2-48a2-6324-08d9dac0619a
X-MS-TrafficTypeDiagnostic: CY4PR12MB1429:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1429F8E996DD3416DC7F046E83589@CY4PR12MB1429.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T+z/ruVCkLvSosEKIvh0P6PlrxvhblyWfqe5O1F5yjCoDsnBIMNeRYcH8xjKN+KyO8aoTZeIBDC7dnAkN8a28M7uOy4RAAw+RTdjfuAK3CrCyFWlGg6ANN3h0oyE6orDYTsnpVB3bnmFdvvOFjt4pw/llBgWBbtuIqGbygTopWK3wn1jWhYB2Uwi0WrmEFWSyCtyiKIOIVxqFEB3oPUmvvATUs0Lj/W8QH4/JX8E3ZgqhkTrXcWqY3wuI74x66iDqis26Wmu0kPXWkiOmQFkF9qyMu3+AUoa1VWZ3mMP8pL2IXGP1mtcTaqV5CnoMd4w8aw8PUmz41+LkRTBM4fvTCzFleEM1Ta7Pm59/TZ7NnMrmqN4FW5wrLyzzpNdc6eCO/fkz5nTWH5BBIq9CcMIzSD99pRVYzePoJq4kOKhzNFYRm7YrWNxRS0hYKfZFs2vvDmLKWcFTam+dIZ1Z2rMFjjzKb4M+7S1OsSkqILpJa+Z/fKLTF9jvB2sSgDcJVLfq919vF/TGj1F3or2QOOVTipSM+NY/jo/OgXcg9i/9mwBUnczsE45M4mw8yLmENa4SYXR8hnwPna20xPXj2oDyMQfxYYqOxV9UH8ZTeQMV4IhlSTALiC7WzsWJkkUwXwJMg7juaV/ftuCs5Ylnj5OxICcGAYI1iDGh410AFeGqjoCY29YE7/bJ8G/WR1Fq2eweSTWWMchUglx1F+H2aGH8gZ3Bbsg8OJn3qf1Gw8hrq7QRPM4Ib/gRXesjTe+OsjZM6/CiZ1mD2lV6/56NaI1OfnRzxvKk7i19Tl5hyCS2pYyt/VujQXGtDuHkaWE3J8X
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(40470700002)(46966006)(36860700001)(26005)(8676002)(70586007)(508600001)(86362001)(8936002)(356005)(110136005)(1076003)(81166007)(7696005)(82310400004)(2616005)(47076005)(36756003)(40460700001)(6666004)(54906003)(426003)(44832011)(2906002)(316002)(336012)(186003)(4326008)(16526019)(83380400001)(5660300002)(70206006)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 20:23:25.4001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d34794b-cda2-48a2-6324-08d9dac0619a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1429
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
 drivers/watchdog/sp5100_tco.c | 16 ++++------------
 drivers/watchdog/sp5100_tco.h |  1 +
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index 36519a992ca1..b949dcd9f780 100644
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
@@ -461,18 +465,6 @@ static int sp5100_tco_setupdevice(struct device *dev,
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
index 2df8f8b2c55b..4fac39a2f12f 100644
--- a/drivers/watchdog/sp5100_tco.h
+++ b/drivers/watchdog/sp5100_tco.h
@@ -88,3 +88,4 @@
 #define EFCH_PM_ACPI_MMIO_PM_ADDR	(EFCH_PM_ACPI_MMIO_ADDR +	\
 					 EFCH_PM_ACPI_MMIO_PM_OFFSET)
 #define EFCH_PM_ACPI_MMIO_PM_SIZE       8
+#define AMD_ZEN_SMBUS_PCI_REV           0x51
-- 
2.30.2

