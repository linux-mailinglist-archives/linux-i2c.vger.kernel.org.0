Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 576F44A382C
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 19:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355314AbiA3SnI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 13:43:08 -0500
Received: from mail-dm6nam11on2041.outbound.protection.outlook.com ([40.107.223.41]:27841
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1355421AbiA3Smq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Jan 2022 13:42:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewMUbjt++Z/mTT/iaqOyi3Z9W7cDVOnObpIxhRqzWvOxUASUmBdcLPToixJlULxM8XJGO3yMUa0J28fFMe1sq6fk1tg0CpoTxo0ann9fUYAixkb8FrXqmj7C59qwuieVafM6Lh/V6f+TxFy5BakftsR/5L+bztf+3VI3apazMqN6yx1IpD/hRwhJUgP9xOrD4XmkRhJObgc22bj65fbw8keAu7q/y5piHz8aa1lnflcf7Hwpgjld2vEczJy7eHj7IhYxWMz7LTwp+JNnQ5ZkjuxfLxpG+7yJ527cbdPJ9OE/3WHXNoYAj2flf1LUX0rd0LKqnd3rvGDMk06nblLRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhIcO2LYawnQbbJQtIDwDviGc92Hn4zI7IXf+SlefrM=;
 b=hXo5Au+JjhK+/BzZT/p1MXKt7PudKphg4e7JkXZ2D+EfK+EMXSNkINVrxILyRLfNNiwRxpGIiR3yqOocckMTmT52QbMb+sqcG1AI3D7JL21c4nmQl8MSUeYEHRHSuFbTY/gKjoc7ZdIloU/5pedr1pB3SdNxattXcIcJPFffLDygSi/jVwc4le69VV4YugeYwXJXtkva2AIuD8Amq+vfLisYIujsNw0W/VwYXFlu6UmGSXejCodLXQ6avWmWJpAaohDupSkJ9N0trsC/06+CjILbD0EXuY7mpuwza1vWih5l+dXMAQczXyEqeLzPM6kCcwlbGjpl6EoZmlXFXIfDYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhIcO2LYawnQbbJQtIDwDviGc92Hn4zI7IXf+SlefrM=;
 b=AU7a1x2JJFIr0jGY3Prmv/eYsgeroN/eDHi0koXa5IlLo7A4GERYnPCBzBgfibTEy3pVJ/xO6UF+dNGdqks/kS+cvsbc22T+Yt4pY2yYStADuAWYNluwpY/6gNpBNkROH0jwNFyNbfzIOIgMjiyxFchOA64U8WUqtfDD0rhtJvc=
Received: from BN9PR03CA0291.namprd03.prod.outlook.com (2603:10b6:408:f5::26)
 by CY4PR1201MB0023.namprd12.prod.outlook.com (2603:10b6:910:1f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Sun, 30 Jan
 2022 18:42:44 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f5:cafe::cd) by BN9PR03CA0291.outlook.office365.com
 (2603:10b6:408:f5::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Sun, 30 Jan 2022 18:42:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Sun, 30 Jan 2022 18:42:43 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 30 Jan
 2022 12:42:42 -0600
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
Subject: [PATCH v4 6/9] i2c: piix4: Add EFCH MMIO support to region request and release
Date:   Sun, 30 Jan 2022 12:41:27 -0600
Message-ID: <20220130184130.176646-7-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220130184130.176646-1-terry.bowman@amd.com>
References: <20220130184130.176646-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58f16609-7511-432a-1258-08d9e4204d2f
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0023:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB002393754EAE98AF91497F0F83249@CY4PR1201MB0023.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cfUbbL0qD3MzCu9Efz2t1yj6PQ/5SCg1tI/nk3CMiy5BO2lsOpGwWQ40QwaOfHfaKM0OWysOUkHUqQyQuIzCko26dY+FsAbbgf8HkV8csBYxVvuXxr5ngVgLBMDIxO467HxPZoQAqPi+l4VSZar6LTP1bjGcHoPbpLq05KxorjSlN7lpOVlaEthAXjpPkAdM2xFtD1V35D0+oh6qnSoraOCT+8GBfWQBzeaXDIqShbVWoQRt0wD1OzyOJDZ5fjfU0VsABXOMN7kGmw9g8TLSOeC2SN68/addUYpNnWnXZUT8XtvhkM01PJ4xtOoH1+tMjkfPnFsUbCNjZkt8sLM1NtuxH7wE3kwDltKHafXM9YRtC8YCGpQYTZ5z8RpNTzXVqmyXx5nlK9rxYuPJxEx7JJb7yKMXjJxKq+1dBBOZnrHGLR5Y1plylUkOdvIpv9hnNtT6fBav40AYjtFuaGsoTUhw12Qda45BNLkyZBk5JESqeBUB38te//i9K9r1RtQxesGRmub02qokbfFqu2gifz8/UPHmzZ3RrY0LcqEw7jqlzWA+nVYtKbMl90rUNyddzhfz6IeHoLHmUuhib5tpst/pECSgMSMqwLxxkw4kJ1XqTEsezRRTPQEb2tSh80o5vDGRfo66P0hkwmTIsLUC4fn3SJ0vHw7vihZroDdngY+8jLOQQYT/61u3h+vtN6INb9LVaxsI6T3SOqVgK0voWSsdZ3sMiUYnjFYH2JTvS5Y=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(186003)(26005)(336012)(426003)(47076005)(2616005)(4326008)(16526019)(1076003)(44832011)(5660300002)(86362001)(2906002)(70586007)(70206006)(7696005)(6666004)(8936002)(8676002)(83380400001)(508600001)(82310400004)(356005)(40460700003)(81166007)(36860700001)(316002)(54906003)(110136005)(36756003)(36900700001)(2101003)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 18:42:43.3871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f16609-7511-432a-1258-08d9e4204d2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0023
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
---
 drivers/i2c/busses/i2c-piix4.c | 61 ++++++++++++++++++++++++++++++----
 1 file changed, 55 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 32a30af5778a..7defa0c5f1f9 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -98,6 +98,9 @@
 #define SB800_PIIX4_PORT_IDX_MASK_KERNCZ	0x18
 #define SB800_PIIX4_PORT_IDX_SHIFT_KERNCZ	3
 
+#define SB800_PIIX4_FCH_PM_ADDR			0xFED80300
+#define SB800_PIIX4_FCH_PM_SIZE			8
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
 
@@ -163,10 +172,40 @@ struct i2c_piix4_adapdata {
 	bool sb800_main;
 	bool notify_imc;
 	u8 port;		/* Port number, shifted */
+	struct sb800_mmio_cfg mmio_cfg;
 };
 
-static int piix4_sb800_region_request(struct device *dev)
+static int piix4_sb800_region_request(struct device *dev,
+				      struct sb800_mmio_cfg *mmio_cfg)
 {
+	if (mmio_cfg->use_mmio) {
+		struct resource *res;
+		void __iomem *addr;
+
+		res = request_mem_region_muxed(SB800_PIIX4_FCH_PM_ADDR,
+					       SB800_PIIX4_FCH_PM_SIZE,
+					       "sb800_piix4_smb");
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
+
+		return 0;
+	}
+
 	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE,
 				  "sb800_piix4_smb")) {
 		dev_err(dev,
@@ -178,8 +217,15 @@ static int piix4_sb800_region_request(struct device *dev)
 	return 0;
 }
 
-static void piix4_sb800_region_release(struct device *dev)
+static void piix4_sb800_region_release(struct device *dev,
+				       struct sb800_mmio_cfg *mmio_cfg)
 {
+	if (mmio_cfg->use_mmio) {
+		iounmap(mmio_cfg->addr);
+		release_resource(mmio_cfg->res);
+		return;
+	}
+
 	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
 }
 
@@ -288,11 +334,13 @@ static int piix4_setup_sb800_smba(struct pci_dev *PIIX4_dev,
 				  u8 *smb_en_status,
 				  unsigned short *piix4_smba)
 {
+	struct sb800_mmio_cfg mmio_cfg;
 	u8 smba_en_lo;
 	u8 smba_en_hi;
 	int retval;
 
-	retval = piix4_sb800_region_request(&PIIX4_dev->dev);
+	mmio_cfg.use_mmio = 0;
+	retval = piix4_sb800_region_request(&PIIX4_dev->dev, &mmio_cfg);
 	if (retval)
 		return retval;
 
@@ -301,7 +349,7 @@ static int piix4_setup_sb800_smba(struct pci_dev *PIIX4_dev,
 	outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
 	smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
 
-	piix4_sb800_region_release(&PIIX4_dev->dev);
+	piix4_sb800_region_release(&PIIX4_dev->dev, &mmio_cfg);
 
 	if (!smb_en) {
 		*smb_en_status = smba_en_lo & 0x10;
@@ -731,7 +779,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 	u8 prev_port;
 	int retval;
 
-	retval = piix4_sb800_region_request(&adap->dev);
+	retval = piix4_sb800_region_request(&adap->dev, &adapdata->mmio_cfg);
 	if (retval)
 		return retval;
 
@@ -802,7 +850,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		piix4_imc_wakeup();
 
 release:
-	piix4_sb800_region_release(&adap->dev);
+	piix4_sb800_region_release(&adap->dev, &adapdata->mmio_cfg);
 	return retval;
 }
 
@@ -880,6 +928,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 		return -ENOMEM;
 	}
 
+	adapdata->mmio_cfg.use_mmio = 0;
 	adapdata->smba = smba;
 	adapdata->sb800_main = sb800_main;
 	adapdata->port = port << piix4_port_shift_sb800;
-- 
2.30.2

