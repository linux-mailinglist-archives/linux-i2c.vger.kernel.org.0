Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48D2F49438D
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 00:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344099AbiASXJE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 18:09:04 -0500
Received: from mail-bn8nam12on2072.outbound.protection.outlook.com ([40.107.237.72]:33504
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344103AbiASXHm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jan 2022 18:07:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiyXdYTKcTNtRVi3kHPNgW7KCGrLvYH5bOCm38B9B+Npr5pGB7DBOHPIJ9TKZNnAb5vkYJtvWgszO47chXwEPoSAXuvOuoo3SpHs+cPkH/HNk6nH/n2mlxuFt8Z5PTDo7boeucUyJSq4sYnKQVippg30U63NiwcF2mRByvcinBC4huYx6qYgoftY/kdXvfeYcl0mOWV+4C0kugYxiObJm8HMxoeCCS5E+aYoWW+6iKJ7pVrWD0IwH1F1FA7DqCCJbuMrj2/9B1h8pa4TG9IvHnlBnBe8/Y5s+z1se67XZF1v8eEOuMdYK/PFMVYA6arHAW2+I+luY3+5Mn0GB/pcwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8PUy/v9rqaPg1Vaj+sQZ9yfghBZmI/i46Mk/EX3yjA=;
 b=ieM93HzfYivzI5UqL/aTpGTTRPSimCn7MJ0tRn//uYkPJQKWIA8fgq9r5+KjOoKVeHKN/YT74I0SPnV3DrJwsCedZk1OBgqyfebgf8wWZO40TqsxQx4GtfW+1DIDEPF/KFjIaYEwPWWY6ethNoXY4u0tggM84jnLAkAN/WoyvkkPZJU51xxxhBaW9Nun8WV0rSu98qT90DmUPgqcDR7mvAPW3uljpwtdlg0H3RHzw8PDvYdypwTDx2f77okzd5YbRoC/k2tViyk0/rQXJJvv88anDkWBXcMiRKWiY7GKqYKuwYfREQq/MRdYf9kXexW/hsFnhu+YbsorPl/XsHIgsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8PUy/v9rqaPg1Vaj+sQZ9yfghBZmI/i46Mk/EX3yjA=;
 b=inar3yCRP5Qd2ijemUj1cTkZggtPUSqRmmabLyKRtps/uYXyLMORfxWd3YYUwCXa+ISFXDPK5zSbS4vOyUWBQTj5G6TURBwA6GYoW6vLD9B9iiCPA2VsjA+KaH3MJBl26DN5wNm4zk7yLqHl6HsnAmJUk4Ku1IK24KKE5fn3EsA=
Received: from DS7PR06CA0021.namprd06.prod.outlook.com (2603:10b6:8:2a::23) by
 MN2PR12MB4221.namprd12.prod.outlook.com (2603:10b6:208:1d2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 23:07:40 +0000
Received: from DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2a:cafe::2) by DS7PR06CA0021.outlook.office365.com
 (2603:10b6:8:2a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Wed, 19 Jan 2022 23:07:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT013.mail.protection.outlook.com (10.13.173.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Wed, 19 Jan 2022 23:07:39 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 17:07:38 -0600
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
Subject: [PATCH v3 6/9] i2c: piix4: Add EFCH MMIO support to region request and release
Date:   Wed, 19 Jan 2022 17:06:23 -0600
Message-ID: <20220119230626.31560-7-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220119230626.31560-1-terry.bowman@amd.com>
References: <20220119230626.31560-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97c337fe-fadd-4f4c-1b39-08d9dba07db5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4221:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB422172B73D45A58BE96CB10283599@MN2PR12MB4221.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KhcUQWAC73f4cuUp2j8pyl/hbowzbL2OQTSL8RzAjl6Yofs1/lOyQq8O9NzIahP/y5q4UzmRd3dQjFDVvLhgSq/BqxyuwDDE0IV/C+9AiG5QVy2/xpBAr6IuuWRnwUUpvIG+6Snlsj2yBYDQk4iLUnzsfgTHBHhC/Wy6WrHeRk/IF6got4ZPFcXJWMFT5OHD2Bj50LMguN1CQheDKGTri+b4qu+h2DPQuhEQvOe5h2sgFawlP1bHh4mAIHzqIoi0/WRkwsqsndxm3Pv/jZbL/FWSGRtSQDUV9I/nI9AjvbICNYM23SX5tzkmVcO5GOgj8Mje1YIV4rMFUf44zjNVm3eWudUMlZ8msQ970gpWCoGOc0QCmnMS9Io2WBR2vB+499hIC8wC+w6du1z3nyWJwfnXp13SjBeT+VdlympMhfGqYQ1kElr0GleR/eSybxjYtxzEybjk7QDjzxAFpaqhxh5c0Hs7kOT9rE3aVKf9jx324dnh7rJr16kpnDXPWyepsYL/WMPG8xzQUsXEJ8t04LL6fDY2i2UrKpynyMuvi+Aze7fuqztFeglSBjN6CQPqhwbiEbZ1mDsPXiVBcvVMRRUg3orYphKkmKOn2CKG+bSqKJ0AZzXfT0iMLeH2G8j6F7vwbSjzY3dwMhV8392fb/6gUi2FDLzV1kSda7oyIVfouOtk6kLus+0Cvc/4GHI6SxZa9ijV565+RHcximyNVGiMICdu5ZWbED1X2sKNlf0PYdCsjF7chTxkAW6zgVKbtLHTzlx5HflWx1jA5ETfo1Vr3Sr3t/FP0/ahGChWr2mT877Kw6w25oOuNifvgQ2M
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700002)(36840700001)(46966006)(426003)(6666004)(16526019)(4326008)(70586007)(81166007)(47076005)(82310400004)(110136005)(83380400001)(2906002)(26005)(86362001)(316002)(44832011)(8676002)(186003)(70206006)(1076003)(54906003)(336012)(36860700001)(8936002)(356005)(40460700001)(36756003)(508600001)(5660300002)(2616005)(7696005)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 23:07:39.9125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c337fe-fadd-4f4c-1b39-08d9dba07db5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4221
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
 drivers/i2c/busses/i2c-piix4.c | 76 +++++++++++++++++++++++++++-------
 1 file changed, 61 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 58b613b78c97..7aa6ceb27e4b 100644
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
+		res = request_muxed_mem_region(SB800_PIIX4_FCH_PM_ADDR,
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

