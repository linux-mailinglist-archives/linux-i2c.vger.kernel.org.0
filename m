Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A87649306C
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 23:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349840AbiARWMs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 17:12:48 -0500
Received: from mail-bn8nam12on2076.outbound.protection.outlook.com ([40.107.237.76]:28033
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1349850AbiARWMl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jan 2022 17:12:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ck5/W7EIShBR9uXOLklDfSaoZO9DmEY+VBiZIt8Al+xNYZAufUNvEqZ8bNsJKRBU6ARG1UxeKErt6njNvqJ2HEwt4iuJSc5788HzasQRI39o66WHG6SouwqJqV/VxdsjXSugObGLaDemGC6fgUdiPlCOTYtqMUZzrq0QaxGthf3cbvazZDWpMyHu7qorHMpUSjlxrtbvw8mgYfGKOcML8BKff2DMPlZYcHLcnQQnZY3oGyE20nqI4aEpq6PwFtI6PJQmlkeG9CUMegj69WYbzstk/rP3CmCluOotQD+u/wyDIOcMRohriN5is+q782MmWuEv4qC2VrorrovKRnnIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45gnCz1tFKw4oAkzO76LGhBYO0bQVrx/SrnnsFYh2UM=;
 b=c1yD4Uych+VIK0IW7B1gVofPLSsy2/GS6bBtboH3wkC2THeHwE/axID6ltaQwOQKRK4ns0GENbUXjWSbg7wZQdyEFdOXkgYBS0uUjn/uG8NXtUswBKkgKImRf6OUWVBWeMTHeUhczVpryb2VGSG67gcW1NjzdzKQWjiXOskaASyMbE1yYxVuSJ1e9d+FJLtupUFmKtwoNlxyD+Lq7caJZKL6dGO7ZCc/038KrvMpPqqFUHNbIS9c23cWGkuYV+5AOtYF6NNOl0KKDYMjuEDkcMbDyHvAnE+0zXEIgvcgXvKL2c6nP5cjFe0ym30wz4ZXysj7T2EDMe3a8j0mHfPjkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45gnCz1tFKw4oAkzO76LGhBYO0bQVrx/SrnnsFYh2UM=;
 b=1hZv0eN4uurkTCNsix+DsiVoJDYFFi1yQoUx10tKGxRdDEuATggmVaLY2LIBlIPsURpa5cSwA+3+kLqW3QpzAKFXqNLT92HJt/BTQINjGdk/Pb6FVJsoCL1KU0wz453h5qM5OOaIG1BN3Q3CKzcG4FtrSNbnvervwlgqyDkAcsM=
Received: from DS7PR03CA0201.namprd03.prod.outlook.com (2603:10b6:5:3b6::26)
 by MWHPR12MB1440.namprd12.prod.outlook.com (2603:10b6:300:13::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 22:12:34 +0000
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::f7) by DS7PR03CA0201.outlook.office365.com
 (2603:10b6:5:3b6::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Tue, 18 Jan 2022 22:12:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT031.mail.protection.outlook.com (10.13.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Tue, 18 Jan 2022 22:12:34 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 16:12:30 -0600
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
Subject: [PATCH v2 3/8] i2c: piix4: Move SMBus controller base address detect into function
Date:   Tue, 18 Jan 2022 16:11:47 -0600
Message-ID: <20220118221152.300444-4-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0358e801-36aa-484c-3072-08d9dacfa0ee
X-MS-TrafficTypeDiagnostic: MWHPR12MB1440:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1440E85E5D54F5A3863D7C8D83589@MWHPR12MB1440.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GBFozH1I2vNjV3QnraoEiZj0MuoeUoVnOpTFhBKAArWaGIxn8PxiZxOx9MWeh8XR2lSEPARGtn6ULEbW0pq1Nj0/EOyRogAFeic7X7G7ZXGQvGEn520K+4nM+t3mJIxLff9f9uo8pNfwosJTlBwOIzQEWylD3sU5lbrbh94yEwchaO+c8hTU0h28UlHUrqsvpupSmcB5RvCKFUOilnzU2OyJbOMsTgNexWWJXeeJQebo1dsu1YA9je+XsAXl4lf8cpsp/ccc9DRdNPuIvnK2vO7OZx0rV4GuHgPpWOiALaYKdgR+vX8C2JvKqBrHG+RKJuGcXtyIlfbEimj7o0DhF+rDrfxxqmJQORXFC0TTNgVUeLIoHiR+0WdknBmoC97hHB0NOznxp1YMp0YipNTqZXXXAGrp+2MsdvCSHuBNkhIar3LNuSCtXmU+Xgt+vuU7FpOc0QEjM1koO2TQo4UP92bfh0dCqT0VP7TrGH1xpav2+AibP0nb125GC4egFD3KZV6qZgmrqr+AmWIHZEERfFt3rCfQGop5HKgaUcUwyrEAPI9UHE6vx/hn3PKYebwwWgCCbme23tWroV2VlC6gcjHTdiHL9EMEFuY9S9MzZ4iNB5+SLSygP0mmjyH/STy+Oddoyx7eVRSfVrtQ2wJyyYYSYxu6Rbr3WNl4ip9kI+L3+oPEKh2NV3362WRE5E01icMmMhjCl2jM7LbzgG8wwLLDR9nJNx8tMXmEbyyGDsbNUxL0Dx6BCAFCH85JTW/gpLYsUfMzXYoeJdFqp0a9TSPvkRn2UuHg0Ag/ZA3PGQZ26s2z46kPdPypwusmsxF8
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700002)(26005)(2616005)(110136005)(82310400004)(36860700001)(8676002)(47076005)(36756003)(54906003)(508600001)(6666004)(86362001)(5660300002)(40460700001)(44832011)(336012)(1076003)(83380400001)(356005)(8936002)(70206006)(7696005)(16526019)(186003)(70586007)(4326008)(316002)(81166007)(2906002)(426003)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 22:12:34.1748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0358e801-36aa-484c-3072-08d9dacfa0ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1440
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move SMBus controller base address detection into function. Refactor
is in preparation for following MMIO changes.

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
 drivers/i2c/busses/i2c-piix4.c | 68 +++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 25 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 14324e03fe24..35fcb61f4750 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -284,11 +284,51 @@ static int piix4_setup(struct pci_dev *PIIX4_dev,
 	return piix4_smba;
 }
 
+static int piix4_setup_sb800_smba(struct pci_dev *PIIX4_dev,
+				  u8 smb_en,
+				  u8 aux,
+				  u8 *smb_en_status,
+				  unsigned short *piix4_smba)
+{
+	u8 smba_en_lo;
+	u8 smba_en_hi;
+	int retval;
+
+	retval = piix4_sb800_region_setup(&PIIX4_dev->dev);
+	if (retval)
+		return retval;
+
+	outb_p(smb_en, SB800_PIIX4_SMB_IDX);
+	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
+	outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
+	smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
+
+	piix4_sb800_region_release(&PIIX4_dev->dev);
+
+	if (!smb_en) {
+		*smb_en_status = smba_en_lo & 0x10;
+		*piix4_smba = smba_en_hi << 8;
+		if (aux)
+			*piix4_smba |= 0x20;
+	} else {
+		*smb_en_status = smba_en_lo & 0x01;
+		*piix4_smba = ((smba_en_hi << 8) | smba_en_lo) & 0xffe0;
+	}
+
+	if (!*smb_en_status) {
+		dev_err(&PIIX4_dev->dev,
+			"SMBus Host Controller not enabled!\n");
+		return -ENODEV;
+	}
+
+	return retval;
+}
+
 static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 			     const struct pci_device_id *id, u8 aux)
 {
 	unsigned short piix4_smba;
-	u8 smba_en_lo, smba_en_hi, smb_en, smb_en_status, port_sel;
+	u8 smb_en, smb_en_status, port_sel;
 	u8 i2ccfg, i2ccfg_offset = 0x10;
 	int retval;
 
@@ -312,33 +352,11 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 	else
 		smb_en = (aux) ? 0x28 : 0x2c;
 
-	retval = piix4_sb800_region_setup(&PIIX4_dev->dev);
+	retval = piix4_setup_sb800_smba(PIIX4_dev, smb_en,
+					aux, &smb_en_status, &piix4_smba);
 	if (retval)
 		return retval;
 
-	outb_p(smb_en, SB800_PIIX4_SMB_IDX);
-	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
-	outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
-	smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
-
-	piix4_sb800_region_release(&PIIX4_dev->dev);
-
-	if (!smb_en) {
-		smb_en_status = smba_en_lo & 0x10;
-		piix4_smba = smba_en_hi << 8;
-		if (aux)
-			piix4_smba |= 0x20;
-	} else {
-		smb_en_status = smba_en_lo & 0x01;
-		piix4_smba = ((smba_en_hi << 8) | smba_en_lo) & 0xffe0;
-	}
-
-	if (!smb_en_status) {
-		dev_err(&PIIX4_dev->dev,
-			"SMBus Host Controller not enabled!\n");
-		return -ENODEV;
-	}
-
 	if (acpi_check_region(piix4_smba, SMBIOSIZE, piix4_driver.name))
 		return -ENODEV;
 
-- 
2.30.2

