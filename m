Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53950494383
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 00:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344415AbiASXIX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 18:08:23 -0500
Received: from mail-dm6nam12on2078.outbound.protection.outlook.com ([40.107.243.78]:35008
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1357744AbiASXHL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jan 2022 18:07:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAPK3lQUhZ6w0TFXmKc3A4cFFaFFFursJdx1TJR6XKq0LhIBs3EhQDDl8UHVLToBJ/f8S1Qi8/YFp1i5BQsV9zRLBBU+VmT+fUAyOwkoDbYQFwr9lQyR4FdC5Xk6LuIlLXyO9NYX/rYdkF+ejdx40vhO1zCBwMnWUB1E4NRVQW42diVrFrmWPXjP1VH7Sm30PkFkV8FaqYdXdFvAWi+simLg4mVZwg+/QGdPyQPg5H88AIAB0NDrVVecEv91jH3LCDsKeVn0qpYYGPLrIf857rkm3MpMyMFSxgEkLPvnWMgcQW11IuNXlB8Bky8lXUzrIkCm2y6bCd8olAIsnV4jXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05daaBYCHeVDep9kD4pl8GtZZOosFqIupaN0kKpkYS8=;
 b=mP3Rp0QAzl3L+B7chsUX7FWFJLH+a2CYuX4me4eyjRTADZXeTKU06lsZ7gfOrvCjOgFHEDONKmBjzg5QHMlTXOpn1GUBXix96udX20/Ii7nwRu85J5yXlHS7gMiqWuVWSousjbcRVj1kregh6cvog5Fh6P9sRIfn49lF/9UEU2L9Gwly4FmttyE4OnZ1zUltcKyglyEeSyW12AIYFoiIVfLXXYf4Z2w3CJrfLABTydcsXuEYgp+T/hzny/fqwIXwXw7FZVvbEEToLJ110Eic3RwDKCIQNr9zAFsjwmRR56BEJZCVhj2iuvXCIdXezaqiGtRgy73x0HXd0VARYIskyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05daaBYCHeVDep9kD4pl8GtZZOosFqIupaN0kKpkYS8=;
 b=a7qXoodNWxrqqYiRfkurT+cxaENx4Arc7Up/1G2ATv0igTsgnjnldHM/9bhMmsRFBr57SBLSb/es9ACVPbYXBoZ+FeFkILLglFAXv2fevUdBUUvQuKA9TvxwPw4wxWuKA6MtttRIfHbNg7lMuqUrc9EXcrDPIAnY3cWUSzgUD7Q=
Received: from DM6PR06CA0003.namprd06.prod.outlook.com (2603:10b6:5:120::16)
 by BY5PR12MB3716.namprd12.prod.outlook.com (2603:10b6:a03:1a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 23:07:07 +0000
Received: from DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::15) by DM6PR06CA0003.outlook.office365.com
 (2603:10b6:5:120::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Wed, 19 Jan 2022 23:07:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT012.mail.protection.outlook.com (10.13.173.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Wed, 19 Jan 2022 23:07:06 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 17:07:05 -0600
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
Subject: [PATCH v3 3/9] i2c: piix4: Move port I/O region request/release code into functions
Date:   Wed, 19 Jan 2022 17:06:20 -0600
Message-ID: <20220119230626.31560-4-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: ca766633-d22a-431e-d31c-08d9dba069de
X-MS-TrafficTypeDiagnostic: BY5PR12MB3716:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB3716EB9278950C9E1D04584083599@BY5PR12MB3716.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GmfrqvBFbPeyMKA763X3JIqEbKUDWlvb42KUQqhrfF1xIf8Bv2gbpoN53N4AV0gq/E74jyhYr+0uOkw91t5KFRq4CviqPt5v5FPFLFMwoirahH6onlEETpxWpJ/ZGq40UucB1zFG44FKCKbF5lV20j5JWAko0XalgvaFQtnIyPXJCdLLmGeSvYSpr8cF7k81aXYLrlP8P9Y0cyaBnteKn7ohyIEhSqevvTqAGFik2K0hanXNkNPhA55P6byst70caRZoLI6Dj3zeNM1QmLR4B+NhTniqz6zYeA/Voo0E2Fb8PNOcyeLC2cGqnYGVERLnd2vDEGQuLc8xm/qNGw8Bfqh38q7Cgpyw6tIxzvF9w3NQZC6PWTz/zNOiNKPWF6wyj3VcpfUq/Dv3fpzCAzUA83gxkOZdoXh1Zc9jwt4nUP0j7uCj28RxeqdaW9UqjwuHW6jU1oPe0DmMSntUvtb1MQIAfGzzuDz0mjelqIqEaOjIPnO1gKJ/j4mr6fMX6blcit0DMIPXBVrWWiDpCHTjMAAEn0AFUJ0jOII2wlExALP8CNaywudWtS0BsaQeYHonaN3ealrQ1UoblQT8tGQrxNLIxgGNtJbBLkNtYHyt/Vm6fP5l7iGtEEyQnMIpN8Jku6bTW7pW3BXQ9cyeNwB5gSaSWHenuMS3wXE/WFQwiCwR7xn2hrU8XMOQBpVd24WWB0ZrdNarTziD0qFKL3AAjHXqTUdveETeAhwnbbpWkY5mSXg6TGrYWbGuIZWz7gJR5SGdLVJaxp7AVNjRUEN9jTARoGcAd4IyG/n7CeQiGTOx/PtvbeN5Mxi33oI3FNLe
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700002)(81166007)(7696005)(508600001)(26005)(54906003)(2906002)(4326008)(40460700001)(6666004)(86362001)(82310400004)(8676002)(70586007)(316002)(336012)(426003)(1076003)(16526019)(2616005)(5660300002)(110136005)(356005)(36756003)(44832011)(70206006)(83380400001)(47076005)(186003)(8936002)(36860700001)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 23:07:06.6315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca766633-d22a-431e-d31c-08d9dba069de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3716
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move duplicated region request and release code into a function. Move is
in preparation for following MMIO changes.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
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

