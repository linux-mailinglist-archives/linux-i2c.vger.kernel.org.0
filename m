Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03D074A3824
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 19:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355036AbiA3SmQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 13:42:16 -0500
Received: from mail-bn1nam07on2058.outbound.protection.outlook.com ([40.107.212.58]:20734
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1355085AbiA3SmN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Jan 2022 13:42:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDyqKEN1o6vpusYHgXnSFCJJas0JNh817eGRFwB6AaDIh84paNe7F+bWTiBNN4E2mQ/PqV23dclGudWzvjyqQkaNnnsfaRirxhAoIl9ow7dPvzb60CIk3wYDNx8ioLdr7u5IuNNhlUvIiQ4podoVHmK+dGH7Awq4yw4cj87tuv+Pq1gHwOEYvWVwe2qJpCzH8vyjJ0ue4CzXp6kN0qMGaTUNixSzzOoYZihohTtMGPvTqHxrkrK/BAc2rODfjfZbgTQJ8/tL2hektpGFHaO5coVLtDWR8LXYzAx7SeJpH7cgjyjKP5B2KdlD9UFqLmLUvbdNqMxjiL5hcR1vNxjANg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpVTpBG/qy065xnijxZfmolQK93glF0YL8OshJVQgmg=;
 b=hbTvk6IdmebKG8Vi7qKNhmJZgwvkTjr5M0scYW0km0hm+hUhqF2fopGML+n4V2k6wGz+T1oaf77sfp0rGAI11ft37e+lrytCPefEwSTFKa0luxPObjJMUWp4n236AMHFKdIU93jOoM5f9H5GUVVpBe7lAHj56ufIl89ufQMb0ac8VEayG7N7Qv/7rlyyGPB2/pHaDkrpo5k+80d4WFGS2BkGxYagSashukBP51pstUdRLpEX54SoMTsW7tbpYCJBgszPpUE22mv9ixDzLBE6ZFfUsBZGwfFqWGBPR9D0Vg3Tpgwh3GuOV9Et1Kl+2MYTcnmauByiVP/j95yWIJaDgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpVTpBG/qy065xnijxZfmolQK93glF0YL8OshJVQgmg=;
 b=uCNGJPvQvC4ac/dm0mo89pZ7TzN+Mx4EZobf54lOBmKkFtwOOxeIfuwjP5i/0Ssf7xZTQaF1rex6zhglGFCA5CgomY/HVxH4f7UPCJoLEFQctiNkiMRhlOZgEyYEsaZq87yRDdnxjMbyTQ4jbtHgH7VkeoJx1wVHFPBIoxXpbBU=
Received: from BN9PR03CA0247.namprd03.prod.outlook.com (2603:10b6:408:ff::12)
 by CH2PR12MB3976.namprd12.prod.outlook.com (2603:10b6:610:28::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Sun, 30 Jan
 2022 18:42:10 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::a6) by BN9PR03CA0247.outlook.office365.com
 (2603:10b6:408:ff::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18 via Frontend
 Transport; Sun, 30 Jan 2022 18:42:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Sun, 30 Jan 2022 18:42:10 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 30 Jan
 2022 12:42:09 -0600
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
Subject: [PATCH v4 3/9] i2c: piix4: Move port I/O region request/release code into functions
Date:   Sun, 30 Jan 2022 12:41:24 -0600
Message-ID: <20220130184130.176646-4-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: d452cfe6-bbd3-4a7d-764e-08d9e420395f
X-MS-TrafficTypeDiagnostic: CH2PR12MB3976:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB3976EC77F134B87E41F6E1AD83249@CH2PR12MB3976.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VB9eB9qk6pmVE4aMaIlMesxys+bVF9Vlg/Vi7IM3ziWicuQzT6SKM2Fmm2DzVcn4gqpIgDZX3sOczwwx/u0dLC0FOSegpdtzEjsj51W/ilELFSE6yVZtdT4tHZT1c6/51PHadKohTYOatfQ/z3NHqAGYtb/2L7VVUuAfIf/so/BeWJf/PMFCrHerOUYUNQiLrJ2t5MSiXBJEJC3aWQTZ5L1CbHb8Sl8/XzA11ArnuzXk03pR8CY9w1gFN+d2cppht/nhfv7KtC5z1bIWmfPKANyyMWVA9VUYQB+uFbG+ioVBf1Bsb6mbx/jbpeKLZSDjXIErh/L8CZuAet/bhPNUZjNZLJMho1ike/r0HJtqUONyt8dXw5hYVRo9G8S0GLlkBa96uF0Pfh/Oow+L0xqFq9fcEcREbMuPnfSG0MCtA+iOc8QeH98lw5UnYE+irsvAsZOxf0SRObQVSP65MT1QxeBUuf2TS1EJHrn9S1R86Gg0Kkjj9bGpVzsTRnXxvRJfG5z4hrH91ltRt+d0w//dx8dzFVi1RnbsEHD3x3UpztJc51/JYemh0VqH8L8I4IEck/mYALbyZbOpf1kIlfCQA8AW8TNo1+ycKeKyOD670gs8Lc/gEabieBXqZPSaaMYRgk0Pt0Gaj+JWO/wqifX+Qlk9GZcz808/BEeQWO1ITrcciLpGgWfp+HGoUFBeU7SCwczUcM+u+4+KLr3N4C59GyKuIkI69SKVtadMCgq+5D0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(54906003)(110136005)(5660300002)(336012)(426003)(83380400001)(6666004)(82310400004)(186003)(1076003)(26005)(81166007)(508600001)(16526019)(356005)(8676002)(8936002)(70206006)(7696005)(47076005)(70586007)(2906002)(36756003)(86362001)(316002)(36860700001)(44832011)(2616005)(4326008)(40460700003)(2101003)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 18:42:10.1654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d452cfe6-bbd3-4a7d-764e-08d9e420395f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3976
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move duplicated region request and release code into a function. Move is
in preparation for following MMIO changes.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 39 +++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 3ff68967034e..5a98970ac60a 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -165,6 +165,24 @@ struct i2c_piix4_adapdata {
 	u8 port;		/* Port number, shifted */
 };
 
+static int piix4_sb800_region_request(struct device *dev)
+{
+	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE,
+				  "sb800_piix4_smb")) {
+		dev_err(dev,
+			"SMBus base address index region 0x%x already in use.\n",
+			SB800_PIIX4_SMB_IDX);
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static void piix4_sb800_region_release(struct device *dev)
+{
+	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
+}
+
 static int piix4_setup(struct pci_dev *PIIX4_dev,
 		       const struct pci_device_id *id)
 {
@@ -270,6 +288,7 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 	unsigned short piix4_smba;
 	u8 smba_en_lo, smba_en_hi, smb_en, smb_en_status, port_sel;
 	u8 i2ccfg, i2ccfg_offset = 0x10;
+	int retval;
 
 	/* SB800 and later SMBus does not support forcing address */
 	if (force || force_addr) {
@@ -291,20 +310,16 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 	else
 		smb_en = (aux) ? 0x28 : 0x2c;
 
-	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE,
-				  "sb800_piix4_smb")) {
-		dev_err(&PIIX4_dev->dev,
-			"SMB base address index region 0x%x already in use.\n",
-			SB800_PIIX4_SMB_IDX);
-		return -EBUSY;
-	}
+	retval = piix4_sb800_region_request(&PIIX4_dev->dev);
+	if (retval)
+		return retval;
 
 	outb_p(smb_en, SB800_PIIX4_SMB_IDX);
 	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
 	outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
 	smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
 
-	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
+	piix4_sb800_region_release(&PIIX4_dev->dev);
 
 	if (!smb_en) {
 		smb_en_status = smba_en_lo & 0x10;
@@ -685,9 +700,9 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 	u8 port;
 	int retval;
 
-	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE,
-				  "sb800_piix4_smb"))
-		return -EBUSY;
+	retval = piix4_sb800_region_request(&adap->dev);
+	if (retval)
+		return retval;
 
 	/* Request the SMBUS semaphore, avoid conflicts with the IMC */
 	smbslvcnt  = inb_p(SMBSLVCNT);
@@ -762,7 +777,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		piix4_imc_wakeup();
 
 release:
-	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
+	piix4_sb800_region_release(&adap->dev);
 	return retval;
 }
 
-- 
2.30.2

