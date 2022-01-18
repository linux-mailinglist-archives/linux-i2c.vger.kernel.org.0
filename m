Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B801493066
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 23:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349760AbiARWMd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 17:12:33 -0500
Received: from mail-co1nam11on2046.outbound.protection.outlook.com ([40.107.220.46]:35947
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236714AbiARWM2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jan 2022 17:12:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MA23vk64KfN845Z3paTzF40KpYlX41+m5dkb0TjjimQ6cklfze7RxMKrkuidrFBY9Cgzi1tO5rzzYPZVrZmniyi5/EFpvOMnap5u/afmw2P3kVy9kHPpOJ4uTVuIWtlZOY5d+kIzCK1gO2kLK1k6E0il7MWooQfUddNHoSlS+ucHPSsj2sWweGHH/sy0V62+8TUDoX6sVups/37aPRAzk+MTpJuqOH+ePoJdX2d8hjNuHf+3uaebjLEZZnBIIu0qgOzhgoLgtFF6LzBlvTTfACkJr19uJF1c+FIGno5VcCQ/EzbZQqey/+QDWk22hknLXV0VQF7IfoD45RWqO2ngtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVfZ7d8Ux/jadxdYvaRc3FTfw23PWDvbFj80PL37e4c=;
 b=GpL3BSnY+lnbIR97SWDvQlAcSCuYmyK0KIhSm+n240jDDLx7bvdPz5+q3+nHpo2ZW/xJU+TsU1WhlMEUK4fPjeHDHUIPoi0grro0Fr5lgixxk08XSsddAvVaOmMKrfVVwl5RlGv/FKyWDVQFnsUxrPmV8cGM7P/qm2qHVvnlHO6jyYayScSabYa/DBn/2cDG1e2gxvBsEwo8THGwEIHensChoLMfaWUurBGRReN3LOf6Su18sZUZ3Bd+tsFBep13BfP4Lv+q8iIGu9TZMaUc/fqWpZYxQSBX+OGNVNBEwjvTIi0NzTZlAlXGP+MFbheCitqYhAcXE+Lyji09allkjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVfZ7d8Ux/jadxdYvaRc3FTfw23PWDvbFj80PL37e4c=;
 b=bzE2CjERHCh5AXckZmO6IGzBaZY1Pc7aYRQ01R0uRMoCYcKMiyIgsvuSBEeNQXk/QVPqeBkr0IDXAwEiNLza+evQCP5S3BWyR8H8U/gJ5KL3Inl+BjjfMoGJFV0Mk5uUN5YvXCvUZn8TUJBeCwajELc+oXs6s8kZ9mr6cJDzfEw=
Received: from BN6PR17CA0036.namprd17.prod.outlook.com (2603:10b6:405:75::25)
 by MN2PR12MB4301.namprd12.prod.outlook.com (2603:10b6:208:1d4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 18 Jan
 2022 22:12:25 +0000
Received: from BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::4d) by BN6PR17CA0036.outlook.office365.com
 (2603:10b6:405:75::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11 via Frontend
 Transport; Tue, 18 Jan 2022 22:12:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT061.mail.protection.outlook.com (10.13.177.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Tue, 18 Jan 2022 22:12:24 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 16:12:19 -0600
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
Subject: [PATCH v2 2/8] i2c: piix4: Move port I/O region request/release code into functions
Date:   Tue, 18 Jan 2022 16:11:46 -0600
Message-ID: <20220118221152.300444-3-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0cb20d7b-ef55-4be6-55c3-08d9dacf9b5f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4301:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB43013F2AAB143DEDA338090A83589@MN2PR12MB4301.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e79KM0OItckz31V0UMFtSVEDhgm6+b+0EyALiUEnmbjzbUn7yMI81khEJ2bsuwtqSVxmgecLw+gqV7Kq7UuNX3R9NUBA0o/gTrYVmvGjJpn/SjrebyqpTufKwiflMWmg5f9vwgj24q6ak1uB8/6ULayS5wKKjlMnKNjlAhi0JsJ0cKrF3UQAMfzlbZoyhWC/wwIw46r4EmvHXb0miVqmtJEQPHoNf9Ri7NxjvDM4XLDyuDgltVSuI4mhNaNEg/EymqSVjEp2UfbS9fjNoWPusqqyEt9km82/0U0FIz3lvn4ZI7KfjoG0OhJ2JrYUN5ziB3q3bTNHrZ5uMdrou0LHfxQx+PYsSUYf02+JItB6VHsgp5PFHaav1iTNy0jK7bOqY51BK5UsI3FtZxi+aw1DEi2faJkptF/VTrZXXNS4Y+X/DWKua039QzB4I6qblfzvew0RlIEZECns0wJOWXsRApAfqr/38EkWTgS6NnrUXy2VNCFlLORHr0gnA5kvBcG89Llaad8f94IXgASlQemH5efA2R3xthqpLiireAhViLubQwqrDf1kV6UUryA0D5FpdUepYD0KMbisPK+2bJ2v2EOaVWbDmHobQ1USnG9rJf6e76MyQUYu0a6KWKk9rRAMT97m/rX/R85Td5wn1LxetExfD15DHQp0udNAeoRjbCzLd8aFN0OsLBL3VW8RZ4D5MAVwIEKY2WkmkmdSnKgvMlDYmRvms71nPSyCabVxp5gA11GrwQ7eOEEgy6WjQzbjFTvOei5m1VHDjSBl5Gq18FBrkE/30H9DrrZbidTszyb0yMR4OGODCdwb89ZWLmI2
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(40470700002)(46966006)(7696005)(86362001)(426003)(47076005)(70586007)(54906003)(5660300002)(1076003)(16526019)(508600001)(83380400001)(186003)(36756003)(36860700001)(356005)(70206006)(26005)(2616005)(82310400004)(2906002)(81166007)(336012)(110136005)(4326008)(40460700001)(8676002)(6666004)(8936002)(44832011)(316002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 22:12:24.8968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb20d7b-ef55-4be6-55c3-08d9dacf9b5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4301
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move duplicated region request and release code into a function. Move is
in preparation for following MMIO changes.

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
 drivers/i2c/busses/i2c-piix4.c | 43 +++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index b88d990b013f..14324e03fe24 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -165,6 +165,26 @@ struct i2c_piix4_adapdata {
 	u8 port;		/* Port number, shifted */
 };
 
+static int piix4_sb800_region_setup(struct device *dev)
+{
+	if (!request_muxed_region(SB800_PIIX4_SMB_IDX,
+				  SB800_PIIX4_SMB_MAP_SIZE,
+				  "sb800_piix4_smb")) {
+		dev_err(dev,
+			"SMB base address index region 0x%x already in use.\n",
+			SB800_PIIX4_SMB_IDX);
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static void piix4_sb800_region_release(struct device *dev)
+{
+	release_region(SB800_PIIX4_SMB_IDX,
+		       SB800_PIIX4_SMB_MAP_SIZE);
+}
+
 static int piix4_setup(struct pci_dev *PIIX4_dev,
 		       const struct pci_device_id *id)
 {
@@ -270,6 +290,7 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 	unsigned short piix4_smba;
 	u8 smba_en_lo, smba_en_hi, smb_en, smb_en_status, port_sel;
 	u8 i2ccfg, i2ccfg_offset = 0x10;
+	int retval;
 
 	/* SB800 and later SMBus does not support forcing address */
 	if (force || force_addr) {
@@ -291,21 +312,16 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 	else
 		smb_en = (aux) ? 0x28 : 0x2c;
 
-	if (!request_muxed_region(SB800_PIIX4_SMB_IDX,
-				  SB800_PIIX4_SMB_MAP_SIZE,
-				  "sb800_piix4_smb")) {
-		dev_err(&PIIX4_dev->dev,
-			"SMB base address index region 0x%x already in use.\n",
-			SB800_PIIX4_SMB_IDX);
-		return -EBUSY;
-	}
+	retval = piix4_sb800_region_setup(&PIIX4_dev->dev);
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
@@ -686,10 +702,9 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 	u8 port;
 	int retval;
 
-	if (!request_muxed_region(SB800_PIIX4_SMB_IDX,
-				  SB800_PIIX4_SMB_MAP_SIZE,
-				  "sb800_piix4_smb"))
-		return -EBUSY;
+	retval = piix4_sb800_region_setup(&adap->dev);
+	if (retval)
+		return retval;
 
 	/* Request the SMBUS semaphore, avoid conflicts with the IMC */
 	smbslvcnt  = inb_p(SMBSLVCNT);
@@ -764,7 +779,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		piix4_imc_wakeup();
 
 release:
-	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
+	piix4_sb800_region_release(&adap->dev);
 	return retval;
 }
 
-- 
2.30.2

