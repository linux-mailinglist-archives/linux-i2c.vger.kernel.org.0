Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B1A4A3877
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 20:13:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiA3TNZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 14:13:25 -0500
Received: from mail-dm6nam11on2056.outbound.protection.outlook.com ([40.107.223.56]:50080
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229523AbiA3TNZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Jan 2022 14:13:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAsnMQw4hZjEI0WhKHj/p/lAmXFgbks8yMM4HqhBSeC7gU0zTmP0w0uHOS+c1ECqBOJ9SHCt4WxBXtLcTf2IiPqAPO3radID0FHAS2Vp81ghPT50LEUfjwzjGKAlW1lnYdFVVCNBiEEkolTPswwHTUPoTBux34M2vpsCdFYwQEuqynSmt/IO/lFIrHXGtZygUsm9wm96VX5wzXONVr2L9THqH6+FT8nRjLMBMNcToRISIMrXs2UgZzW6Ypi2dvgdAmikKOcvjKKbRTvvj6EvFe1Dq995CG7JSVbzvJ/bIMXdATzMJqK9M58Yge0UNbdFlm6sWGRMPip3Y9+rfR6bsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTDj/NmjaBZm5KZaYAjxO6m0ymhxBHtNrfFngxEl2k0=;
 b=PzSQhhhvOYI83mL+vPXygtyojgWJ4Igd57s4aYQwhzPIuWfmXxysvHijh74ooPFqGH9P99oJrb2xEkGIClZ3qoYtJUqW2Qug9I8c3szzz1l1tsHXr1yO/pufopm7hq7/kzwV+P7U4N+HhrWDNe/gQmTaE/shPEsAiE9HOEK+pIVU0Iz/ReKvWR5lGnE5oQJyh8O6GuKVYuNH4UDcPk98Gm9JNcewwoUufyHv6w+yc/ahtZvQrgM/SHhNEiIcdlzYY9ItZJTTB1YMQOCIGh1EPH9PZ0oRvNOdFdFl9a2aDcmMVPUTl5aG5zHsQ/nqZfD+++i3KJA3mEIrBlqeKW3N5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTDj/NmjaBZm5KZaYAjxO6m0ymhxBHtNrfFngxEl2k0=;
 b=EMA4QgW+1+8wQXiiSm/3k6P6PHTrXx9Kn9JtvL4pd/q5xTJdV3YnO1itAv85dLWIuoIoi26wo6YXuZJUoaa+B6OJhxFgDk4CMk1PlnGYCmMF2+9rEADs1ZjE3fPJ17fNnpKfB3559trwpKGJ9nDqowNZBmxMnk9fjrjPBy3MZdo=
Received: from DM5PR16CA0039.namprd16.prod.outlook.com (2603:10b6:4:15::25) by
 BN8PR12MB3185.namprd12.prod.outlook.com (2603:10b6:408:9a::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Sun, 30 Jan 2022 19:13:16 +0000
Received: from DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::f5) by DM5PR16CA0039.outlook.office365.com
 (2603:10b6:4:15::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21 via Frontend
 Transport; Sun, 30 Jan 2022 19:13:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT060.mail.protection.outlook.com (10.13.173.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Sun, 30 Jan 2022 19:13:15 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 30 Jan
 2022 13:13:14 -0600
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
Subject: [PATCH v4 4/4] Watchdog: sp5100_tco: Enable Family 17h+ CPUs
Date:   Sun, 30 Jan 2022 13:12:25 -0600
Message-ID: <20220130191225.303115-5-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: c0079ddd-71b6-45f0-a052-08d9e4249177
X-MS-TrafficTypeDiagnostic: BN8PR12MB3185:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3185004323D8EF373D1C8CE983249@BN8PR12MB3185.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FOBF1qYoeUs1MaNGC0wNmcj3EPfPPSu8TqIRKTD3LEmV9k9xn4bN/UZyXD/9mioziPSCoU5hsFevje5+lyW+xvrGhgUvqmTsVPBsnnkedz2lcmkjOIcCm82v7CKU+qwRhrdYYb1VY/HAufMCuTBv+kVW97kXmq2zkbjMEvXdLKVBC6/LSzzd6wyyqt41cib2kG0kB0r2085QFuS8ATOZ6lK36fIKR4hOkPHqcgcsTj498JFFy11U0T+YnqAtmEOOFfZiI3iG0ZZnTyNFDa2BxMkVhlKA09EyhmnyGrZcq2i5uoZxvTfqqWI72LYvL+IXNOUBRUx2yS7CG3MfZxKST9AV+4WfUadIUsRtLcds16IvVoWOXjV7npkAgzjkOIemnAsmj45JvEbC3ANRziepxhFHAK9bE8B0Trw+GYo42WcGejnsfqmL2i51N6ZLJK5yk9KXKtGhMpPIJ/qi9nWR8yOAHTEx47dim/KhJqCA06LBZ5I3Z6HbGE1ihDfEtB/H7w3vwqxTAxlW1KXtCkdXqAEJrSmz3uSC/ComaTXB6nqUv/xSbLLqVEiJq6ceyNTgjWbZM09dGnLDvT4CH3Syrv+n2KUA0pTxKqpEljTqbE3hDgmK55/tii+PcMpElCgvkLmWbSjwLC+QJJ28NQyrWZRxVvfa8ZVPN9Nz4U16un816twUNQXTXVi5xAEs/qw75Fffjelto9yfEAFH+bvyzpBvQTkRjn11XbKtA9qaFco=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(47076005)(508600001)(36860700001)(356005)(81166007)(86362001)(83380400001)(40460700003)(54906003)(110136005)(36756003)(8676002)(8936002)(70586007)(4326008)(70206006)(316002)(6666004)(44832011)(5660300002)(82310400004)(7696005)(336012)(426003)(16526019)(2616005)(2906002)(186003)(1076003)(26005)(36900700001)(2101003)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 19:13:15.9033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0079ddd-71b6-45f0-a052-08d9e4249177
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3185
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
index 1a5e76d13c3c..b25b353fdf36 100644
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

