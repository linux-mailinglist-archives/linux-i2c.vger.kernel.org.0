Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98F594A74B6
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 16:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbiBBPgI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 10:36:08 -0500
Received: from mail-bn7nam10on2051.outbound.protection.outlook.com ([40.107.92.51]:10465
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345508AbiBBPgH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Feb 2022 10:36:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4ovpGtcHua4on9k5WIxe/TrNf2PCgpRpAfcGZroRa7rvWBRZ0wvL19hWYMEDtxFkMKMqwwV9eu3PrexBVr13uczVWGynEmCVOldQtN1wN1B9Fl9PiNgR6YGyMHRw8l1raH1Z0kyLuxCEFzyVLO5BiFePb1WOl7y2ZbN7dA4Jy+7yv1aT8RstwV48t27fDrvYsZrYj4Km2f1QGTpnZq7qx8p1VjHHaxcDVgKBB2wrryuC7qtKIgS5O+OaVcrQbM1Iw1qdoJYd1BTF4iIHQHkRpv6mHbllSZzRVWXzbxxm+k8W1I8CaptLXpv3EwJUIMEMKuiy65fxQ+Jq8P5GYuAxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwag+ixwaedXtVY4U+cBGXvd8g4i1bimRYbm4R+rvY4=;
 b=d9wBq2ztywYP+oMVd2Eg0KUvXjBJ/OqdcSzWiBgpS2FTas8juEnFD08I/8mDTWhuwx9KdPiaxmZWZR3eddL3239PEH+d5uGABW6CEFqcON3xuGPlHpjd0EBe+1fzj9Fgs+3U05EHw1cqIWd9Sby/gFE0tRJubY+OMRHDgM5L6AqeAJSaFKHM6cmHXZ4IOkLM6A1Ea/dFk+KBIhjwyi438DmKtNbyxz+/xupR3kdOGnbW8TswtbtpMQqlHwHqez3jCXBqM1uYCWRlXF4KU1b2fQsnHskye4wjDsu/rwEZwKX7abaYn/DNh1+yv3sT0iU+R75BCQ/YRTQOsE0+u8nA+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwag+ixwaedXtVY4U+cBGXvd8g4i1bimRYbm4R+rvY4=;
 b=dpI3VP3BlWK3U7iQ7RADg9CAecU4vtQK+1yjWiySry/+ypXOOPkzJgDjA4PodTcrr48wgumMqPM8kCPIYNgf1yPX8yPtptK2mDUHHh47okx1F7wIkRhbKE5QhUfzt9CMvCNRT4nTGqwH00dEbYDaSMr0/vTNNg/25SnZBVA9wxY=
Received: from BN9PR03CA0923.namprd03.prod.outlook.com (2603:10b6:408:107::28)
 by CY4PR12MB1335.namprd12.prod.outlook.com (2603:10b6:903:37::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Wed, 2 Feb
 2022 15:36:05 +0000
Received: from BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::91) by BN9PR03CA0923.outlook.office365.com
 (2603:10b6:408:107::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11 via Frontend
 Transport; Wed, 2 Feb 2022 15:36:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT063.mail.protection.outlook.com (10.13.177.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Wed, 2 Feb 2022 15:36:04 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 2 Feb
 2022 09:36:03 -0600
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
Subject: [PATCH v5 3/4] Watchdog: sp5100_tco: Add initialization using EFCH MMIO
Date:   Wed, 2 Feb 2022 09:35:24 -0600
Message-ID: <20220202153525.1693378-4-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 73514829-90a9-43b1-c70c-08d9e661b98b
X-MS-TrafficTypeDiagnostic: CY4PR12MB1335:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB133551C4686217C56D7D43A883279@CY4PR12MB1335.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JJSZ7rA0ZzAz0MY535vtv0rK7CWUY3Hp2F42rat7b5Nfu/uD9LQokwLsdr5L3IdZxPyrqZHZ0eExH5MtlP83RXFLaxRkjkKQizh2+a/M3FpGaL05DQ2zd5HfJR+SOv5SunWEhOb5Zc2hmpel1HbEsxU+nWVbvrSR97Le0UwK2R5pWd8wQ0BLjTThpb4Maj2R0aTUgQhPs0GyshyfV5yF29AbmCtiZcxGxwaBh5J4JDPw8SQyee2X6i1pKWmcscxbVp6rNJs7I5SLACzk6+N+tzdGJpQ7Z8qC69P9/BXDIa9322epgkSXO0ctWozPyHZnVWfe+8y9OQS8J/rDu5kD3gtpPg6rKuXDhLlOnQeWJn7+gJlSPe+3lUGK8Y3F/Fph6NSub/Gm4pf28SFg+qgJcD0zV5wnsau9rBwwz2Eak4S0/OInrSVO+bLt4pkrwiuSkAREHBR9nwY/ny5Fqc3UeoW/MCK1CNJtssq11fIO5UyHyWdMe3exZChhUWwrJY5+Nl+uy4KtydssWa7+kstYq7n9LSXPCuChY5s+0kHxBcz/68NywTj0CgwDAs5OSpChVkGH6CK+jcFizj5Dj5u38FwIzInaiBX2ajGT4O24f1F7x9AklvIOrgPPiwPuEaKYwkERfuaNdnEeCK/Z2X1fzoAIuB3jx2ltwNpC/jGL9+RydTb5A2qb79gopjMhgMeJqYOl84EvBjNjN/D6i/Nr3/Yhk8c1vSEPzsNwA0zeuYo=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(26005)(2616005)(2906002)(186003)(6666004)(82310400004)(47076005)(83380400001)(16526019)(5660300002)(1076003)(44832011)(7696005)(336012)(426003)(110136005)(40460700003)(70586007)(508600001)(86362001)(356005)(316002)(54906003)(70206006)(81166007)(8936002)(4326008)(36756003)(8676002)(36860700001)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 15:36:04.8016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73514829-90a9-43b1-c70c-08d9e661b98b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1335
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
index 8db7504f0aa4..e02399ea8730 100644
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

