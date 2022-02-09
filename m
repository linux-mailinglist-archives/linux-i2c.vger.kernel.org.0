Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00AD14AF873
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 18:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238259AbiBIR2p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 12:28:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238303AbiBIR2b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 12:28:31 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam08on2089.outbound.protection.outlook.com [40.107.100.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607F2C05CBB5;
        Wed,  9 Feb 2022 09:28:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hh36XH8I7NsNYLEfj158MuWbRfhUG6s5lLzQLqCNkjoK3s1zrNtzottFWWL0iZEPTZfZq/Y5bBtQ8FCzSy/pn0vWBStaQndrP5sS3L8iq8kywbPrEZox2kcscsEkWRLgIh8pxhYzP2BgwAQVMF8XQj/Ev58wNqw3AkR7WJWVbpc0qIQpqxSC3EHq/KqncbtjIHTXYhVmalN/B2FiYqoYIVC6pJ++H2CKTi8V8m8hazQgnjqHw5LGo+Ga4sUjWTv265MDu8NkRhfd/8AQi0G/n1aXgJ9Ee3cIvf3GSd3AY2oCTeIfenKWUbJc7dWuJ5UL46g3Wn0ppDQCrUXWbk6OgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0X9vGqP/k9Pvz4ZGBkvAU/1ASTotMUP8Q0p+g9Gouj4=;
 b=Ju7s+yjhTUWw7sbO/snPlP/y7g5crMammMpfWga+5/uPJnEm9Irdaqjldupom0VvTwGVj6ltg3uH59kaPt5PT/73nicV7pqOekt6BWYUv+kHnw6zKag3FYJ06ec65CjbYGX8gwFIF8v+9pTs3hkagXcCO243W15HiSQRyPGuyi8EPgYnNu+XCglJaw6t/pUHfuD0I4Gj7Nxcu5f2kqFVXZMErFgb8tfiiFnzWqG4VRCZuKmculjp2S8VTmKayVTDfkRp0L7znkL1ERuLNLmU8/1tTTXCc7nyChkPOR8lX6M44VtDMaKfZXVJPhK3iejtJDcglPEMW/zuVOjZc+JDHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0X9vGqP/k9Pvz4ZGBkvAU/1ASTotMUP8Q0p+g9Gouj4=;
 b=FFRmtL5DfE6uzRxKDcPu3QvPrjjjU26T+3vj6rLmSpxzhpezo9qtfbJJdqCQSUW0gM30Fvo0TisNpw2VwkI+rN4QuWWWdoZ6Jm/B43b12e+8EvQcGR8D/G6e7nW+7Lod4yefsY3eAvcNkYGy9g0ZV15Qrtp4mN8p/hoYDxCqEdY=
Received: from BN9P222CA0027.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::32)
 by PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Wed, 9 Feb
 2022 17:28:31 +0000
Received: from BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::cb) by BN9P222CA0027.outlook.office365.com
 (2603:10b6:408:10c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 9 Feb 2022 17:28:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT052.mail.protection.outlook.com (10.13.177.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 17:28:30 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 11:28:29 -0600
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
Subject: [PATCH v5 6/9] i2c: piix4: Add EFCH MMIO support to region request and release
Date:   Wed, 9 Feb 2022 11:27:14 -0600
Message-ID: <20220209172717.178813-7-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209172717.178813-1-terry.bowman@amd.com>
References: <20220209172717.178813-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0dbf829-dbf9-4cf8-3447-08d9ebf19754
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB60005C55902E4C577226838B832E9@PH7PR12MB6000.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YuULBMglJTTKlfu8PFMr4vGXIIRJzhqispqdAj9JqtbMZVbyCNqmzl4EzWwkP5JqmXPGrNeSuD9cu+5S3T5XV833PBOiI9sNZCa6Kg3nyIE05h+6WRB6NSh34QiWkpnGbfWRIegXV3FSnHHpeI2WyqA9idW4eUrLe8fWhzVkDyBlppH6qVqQogbiek8m/4KZUB855WNQaVavTxkxB/Lyu55nftHK7yRinM7bBdYyFp0H6eolUbGYuv5rUpBGlF5D89uLINP56CQUeI98cNljJ74RSkhaiTIyb2gmVCbhjwhAGseqmYsgfQ3e0mei1LtLu61/RnOBCiCv8XE+2ah16rYz+hE7hnV5wiEhZ6YFKseW4BVVS/RsG/NJyhyp1Ys/CdFqIPqEsPPWFyO02/xtbq680FrpQTDQu7B0TPzJEWcTiBZhRrQoL9n6CqRADZjL83KsmiSsN1TUyzLN2YYHogFsizteXAbU5btF7RLsc7soaV5tUoSLjnFXWv2/DD3YeOllIfqJW5IqZhhnE7MWhGdOFN1c4/gAeF1piJ+3JLTAabxp+ds43EpOHQkFrzid7Lmo8CwD/xPIBz89Mdp7k0bBlrL9rn0FwmsWvOjPFsieL4F0ywy8olrgwpjluQpiEFVtBk0GoQMq1ZBkP09jzwp6Dm7zQFTBrAf8sNjcQLXXVwnJJ5P4omjY/j/Y+B6gMh+z5ldOIqXMN5yYfUllKeSpWwDHtuuZyYiynAVzm1E=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(186003)(47076005)(26005)(1076003)(2616005)(8936002)(36860700001)(8676002)(2906002)(336012)(426003)(4326008)(16526019)(82310400004)(70586007)(83380400001)(70206006)(86362001)(81166007)(44832011)(356005)(5660300002)(316002)(508600001)(110136005)(36756003)(40460700003)(7696005)(6666004)(54906003)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 17:28:30.7378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0dbf829-dbf9-4cf8-3447-08d9ebf19754
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6000
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/i2c/busses/i2c-piix4.c | 68 +++++++++++++++++++++++++++++-----
 1 file changed, 59 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index f4a262a7d199..d06998f7b031 100644
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
@@ -328,6 +376,7 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 	unsigned short piix4_smba;
 	u8 smb_en, smb_en_status, port_sel;
 	u8 i2ccfg, i2ccfg_offset = 0x10;
+	struct sb800_mmio_cfg mmio_cfg;
 	int retval;
 
 	/* SB800 and later SMBus does not support forcing address */
@@ -407,8 +456,9 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 			piix4_port_shift_sb800 = SB800_PIIX4_PORT_IDX_SHIFT;
 		}
 	} else {
-		retval = piix4_sb800_region_request(&PIIX4_dev->dev);
-		if (retval)
+		mmio_cfg.use_mmio = 0;
+		retval = piix4_sb800_region_request(&PIIX4_dev->dev, &mmio_cfg);
+		if (retval) {
 			release_region(piix4_smba, SMBIOSIZE);
 			return retval;
 		}
@@ -420,7 +470,7 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 				       SB800_PIIX4_PORT_IDX;
 		piix4_port_mask_sb800 = SB800_PIIX4_PORT_IDX_MASK;
 		piix4_port_shift_sb800 = SB800_PIIX4_PORT_IDX_SHIFT;
-		piix4_sb800_region_release(&PIIX4_dev->dev);
+		piix4_sb800_region_release(&PIIX4_dev->dev, &mmio_cfg);
 	}
 
 	dev_info(&PIIX4_dev->dev,
@@ -731,7 +781,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 	u8 prev_port;
 	int retval;
 
-	retval = piix4_sb800_region_request(&adap->dev);
+	retval = piix4_sb800_region_request(&adap->dev, &adapdata->mmio_cfg);
 	if (retval)
 		return retval;
 
@@ -802,7 +852,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		piix4_imc_wakeup();
 
 release:
-	piix4_sb800_region_release(&adap->dev);
+	piix4_sb800_region_release(&adap->dev, &adapdata->mmio_cfg);
 	return retval;
 }
 
-- 
2.30.2

