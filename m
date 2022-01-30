Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED0A4A3820
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 19:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355000AbiA3SmC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 13:42:02 -0500
Received: from mail-mw2nam10on2053.outbound.protection.outlook.com ([40.107.94.53]:14882
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1355006AbiA3SmB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Jan 2022 13:42:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fmz1EghJxKLG1DIoX2SAXNSfN+R/kjiNUBOySfmSdoJERUmvdZq2atidGIgww1lt+fSSUhEIwscIzddK55yNTSjlZ8pIoxMpQe3EZ6gXSFmik5R1kyXvCPGodAPMjzK/mlNXbePhMJK0FIQHZYqvjSWjuc+Mk/0CCyQ0AFgWhF/GE6/CqPkCp4EOe4/KDHuW+eKxVg57yYt46kNYU2Y5b6qxiHql21/SyLMiEvTDBAb5zHWUvFEucqGfq/vBbFkr32wwkfGXCF7WIzpasfueEvqnbHwLFQae3eNUwdj+ilZ2J3ZslaHE+EKXffL9o1MTelelptPUdd/veWnUg283aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Dk20itXYKSkXBCrkUDRMnZ/etXP2JPAl0fxTsqnrM8=;
 b=EZG6sakByrE/2/fAtx62Kr5AIlgaZDdew7ye1uF3f6Go6FOuUEAEXAJVCH7UWAI4S4MrXvvfLGPgoT/irdRoyFsZlUdlMXHtfP82hGHtlueyv6qW+gEbcYrrv356wZ0HY5FzNore6UPICGYBP6pW+AhUkNoBI6OgQS3y2hmZHlvJ9gevL/i+7BXfZtmB+Ejn0ZLVLHY4d00ia3+6rnliUI82g2rTDmVBUUzV4xOlq42mc8spBAy+ZB+mJ/3UjeKEdvB8MfrfPaXENtYJerBVtNNsJkypRDoqJg83Vsa6B+CKEcymFl0xE5XsPUfTnQ9vD65Ka3RuOEa5JOxKQDa6Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Dk20itXYKSkXBCrkUDRMnZ/etXP2JPAl0fxTsqnrM8=;
 b=ZJKQ9IHadBhSsU03oK2m2QLi0veNr5NHWli4KTttRzfobQsxVGcC8HgRpR8vJOIOo3i63YXxIvkrU/WbL/kpCHGXcPt6B2oSl8/ZenIiREPhZKb60pjPpqRz7hObwoOetsOZAGYoJUUMf2fKMonTrOe54Nv9KQzaUdiXQ6C2vwI=
Received: from BN9PR03CA0295.namprd03.prod.outlook.com (2603:10b6:408:f5::30)
 by DM5PR12MB1177.namprd12.prod.outlook.com (2603:10b6:3:6d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Sun, 30 Jan
 2022 18:41:59 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f5:cafe::7c) by BN9PR03CA0295.outlook.office365.com
 (2603:10b6:408:f5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Sun, 30 Jan 2022 18:41:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Sun, 30 Jan 2022 18:41:59 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 30 Jan
 2022 12:41:57 -0600
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
Subject: [PATCH v4 2/9] i2c: piix4: Replace hardcoded memory map size with a #define
Date:   Sun, 30 Jan 2022 12:41:23 -0600
Message-ID: <20220130184130.176646-3-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: b3195738-8985-4bf4-eb22-08d9e42032c5
X-MS-TrafficTypeDiagnostic: DM5PR12MB1177:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1177F40882F6E03B46E280C683249@DM5PR12MB1177.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k0Z2i2cuEd5XaUndPed/GdQkuu/96IS/AMZR/BL7sQh2lfeSH5fbB8ZwK3dIeXxMJ9lRg0C8PUPIEqLxqdzzPbbR2y+FbUaa9AvjPTEJKCRkgY+BDHPGxGy8OrS6168QgQFHXGSLaPsNex0QOQfcjwzObQ3F2Nw8b2ltiqOhf2o4YAEVd0SBppoRPIXsFt/V1YCPAV9ta+HIoVhdM4sEzslJ9FrH1NAuloNmOineLpRT1lOH+N9UT1TyNonUmIsLrDwDsI8bWxjZwIWJ1b9jZg73vPS7qDnr5fQACAYUVO6p23lSB9KruLPvvajNH0ZLNOl94GsVgHcJUMhQeXSnCgRrHf7Cks1PMF9F0NNzTISBlcQS3h/kMmBwWuhJ4ddQmzgJPgY+NJ0ZT8HNyQVpH8rWxdM3EIToIqcR6F30yqgBkDAOZikFyqVAf1yCJOJ8RfGyucXABydoTYvZh1SokSy1d37fI0H+iWZJ+0tTwLB2VQH4uX396eGupemZCxZWwK90xrRB/ufOewUc59o+5NCihYkOM4tFOEvde7aSVjAZ5lgn42pphdQvc2+IqbjsaCfX0VvBs5aUBx4gjgRKItekTSMDejRy7MPghqq8o5g30ru90I1B3HrUyoQWvUyaAOiXRH2uHjOS8MIdWtidMUCNh57fNaqYqYy7N2ahjMmQT3X3j6iRCkC+fTi+UmhekUqjcB7+UnO3yevJxhCy7rjlTGD4KsbmnflGOMx8XF0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(54906003)(5660300002)(110136005)(426003)(336012)(6666004)(83380400001)(82310400004)(186003)(1076003)(26005)(81166007)(508600001)(16526019)(356005)(8676002)(8936002)(70206006)(7696005)(47076005)(70586007)(2906002)(36756003)(316002)(36860700001)(86362001)(44832011)(2616005)(4326008)(40460700003)(2101003)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 18:41:59.0772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3195738-8985-4bf4-eb22-08d9e42032c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1177
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Replace number constant with #define to improve readability and
maintainability.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 8c1b31ed0c42..3ff68967034e 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -77,6 +77,7 @@
 
 /* SB800 constants */
 #define SB800_PIIX4_SMB_IDX		0xcd6
+#define SB800_PIIX4_SMB_MAP_SIZE	2
 
 #define KERNCZ_IMC_IDX			0x3e
 #define KERNCZ_IMC_DATA			0x3f
@@ -290,7 +291,8 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 	else
 		smb_en = (aux) ? 0x28 : 0x2c;
 
-	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, 2, "sb800_piix4_smb")) {
+	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE,
+				  "sb800_piix4_smb")) {
 		dev_err(&PIIX4_dev->dev,
 			"SMB base address index region 0x%x already in use.\n",
 			SB800_PIIX4_SMB_IDX);
@@ -302,7 +304,7 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 	outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
 	smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
 
-	release_region(SB800_PIIX4_SMB_IDX, 2);
+	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
 
 	if (!smb_en) {
 		smb_en_status = smba_en_lo & 0x10;
@@ -371,7 +373,8 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 			piix4_port_shift_sb800 = SB800_PIIX4_PORT_IDX_SHIFT;
 		}
 	} else {
-		if (!request_muxed_region(SB800_PIIX4_SMB_IDX, 2,
+		if (!request_muxed_region(SB800_PIIX4_SMB_IDX,
+					  SB800_PIIX4_SMB_MAP_SIZE,
 					  "sb800_piix4_smb")) {
 			release_region(piix4_smba, SMBIOSIZE);
 			return -EBUSY;
@@ -384,7 +387,7 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 				       SB800_PIIX4_PORT_IDX;
 		piix4_port_mask_sb800 = SB800_PIIX4_PORT_IDX_MASK;
 		piix4_port_shift_sb800 = SB800_PIIX4_PORT_IDX_SHIFT;
-		release_region(SB800_PIIX4_SMB_IDX, 2);
+		release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
 	}
 
 	dev_info(&PIIX4_dev->dev,
@@ -682,7 +685,8 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 	u8 port;
 	int retval;
 
-	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, 2, "sb800_piix4_smb"))
+	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE,
+				  "sb800_piix4_smb"))
 		return -EBUSY;
 
 	/* Request the SMBUS semaphore, avoid conflicts with the IMC */
@@ -758,7 +762,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		piix4_imc_wakeup();
 
 release:
-	release_region(SB800_PIIX4_SMB_IDX, 2);
+	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
 	return retval;
 }
 
-- 
2.30.2

