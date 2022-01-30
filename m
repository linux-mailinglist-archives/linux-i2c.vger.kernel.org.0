Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7554A3827
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 19:43:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243158AbiA3SnB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 13:43:01 -0500
Received: from mail-bn8nam11on2048.outbound.protection.outlook.com ([40.107.236.48]:63586
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1355322AbiA3SmY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Jan 2022 13:42:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BI+C4Gv/Pm73D6npXpoCIeJqTuxFtHj6F4Dx5MwrC6o9t5AN70dBgIqNnJrdzhMM8qEE3c5+LtLN/4iYHueQOD8oddgt70f0LrI/m2xOjuO+U3OPRqdMLn34xQr0UWSWlLdBc0ctrm1lmDhoNTn2rUW07zeOcYLa0Z7UJbA/fn48JrRbALeK7+z8+3iheDKMPeNBC7TWe6/kPWfciWz3UWhArEjYbEZu2oGHLS3AF1HnaqIK5ctPRg74yLhh4N3bZ7bTFumwi4iZF0gA7j/yEs21oTKhxR+mUJzgI36kjiqnnKcYyWd+32DLD+VzFbA+LvhiVAMOMLASxEKqsee1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlzceb784wvwVXiQ6p9qRRakEeFMzbe41uJ7F3CpsOg=;
 b=PpA6MBu7ycWLVoFS2QrIibHVydGTH7D9pdu++oFGiSFIeqxRTV+qa8IpSnrCU0pFF5aamIc7oDZ3b+FICijeDdL6jhAzRLMxbx0mv8gvPjtIJjL49QEsUa8HZmzqV1P4VD4ay2qJfL6q/mw4ZK96hpBTdDdDWfl1tLlbcYRLim4Z3zC95B1SrktHWyI3jfqnk5pFirxaMjJps4XRD7+GpSaUdBcLuoZqUT585KWeh1mYuJwwyB6Av3bAuK1OfDH7QoOAx8+6mJCRCCfyXLo3ndquewuy68bYNRzvzUWxXGyu3CRBFR1O3ajuDRMY6R1r3vxg5v9XgEyq5J7G303AKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlzceb784wvwVXiQ6p9qRRakEeFMzbe41uJ7F3CpsOg=;
 b=gP1FIhMrkYbCWoVOoq16/mmj6asCR7ZY50tsoflubXZEYzt9eNWPSj5IbGC3u5FEUnO+3fECqJd9f2b8vmHG3G9lDqXygiiY09rY2KwG9qObTFXaxbFXWeB7ObR+1lV0f+AffrvbOLmE/4MSKJVkaw/eJXLKBfiJ9N1yXcv+fuc=
Received: from BN6PR14CA0002.namprd14.prod.outlook.com (2603:10b6:404:79::12)
 by CH2PR12MB3767.namprd12.prod.outlook.com (2603:10b6:610:26::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Sun, 30 Jan
 2022 18:42:21 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:79:cafe::5e) by BN6PR14CA0002.outlook.office365.com
 (2603:10b6:404:79::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21 via Frontend
 Transport; Sun, 30 Jan 2022 18:42:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Sun, 30 Jan 2022 18:42:21 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 30 Jan
 2022 12:42:20 -0600
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
Subject: [PATCH v4 4/9] i2c: piix4: Move SMBus controller base address detect into function
Date:   Sun, 30 Jan 2022 12:41:25 -0600
Message-ID: <20220130184130.176646-5-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6e8c4655-5853-4f4c-8ee8-08d9e4203ff7
X-MS-TrafficTypeDiagnostic: CH2PR12MB3767:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB3767A9C4F8613A6ABF1822A183249@CH2PR12MB3767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M+IljGm+JCa/RlfqeIuA7cjfPct6dwtNBDstl73y1z7UBS1kSWrHdtdpyn4IAEXipVRbJToxYJsjeBksM4ADL5F2ZFJT63o0jFX5iptFXeDeCFNKqWlglzEYSpVZzVjPYWQkyA5zHsRewn/1iy1m++nq9Kvea1xfygZ/vYEGAnuz71yK0ryxyK4Dso+J0+cOkUm/5O3fxgdnMg4BO1qWIfiU/4M0Nj17H/7OurzXJFhYVN68MoxE2scP4USpBoFAz11iUCiePZS4zLBSO6PVyuHRLf8Ew505eex9Rj2tjdgX6Kap5eZCs56VbgAHnozMFTBVHirfc1D6PsHcFDXpK4KUu9P85xuWtgOHvUGz5c6l6/KTIKPJXez3/OJfZkmCnBhdg/o4ue0p2Od2y3XjNPQM1VZNt+tszAOUsBnC/OtWnmqatYrr1O45vlL3a8nKa30zL/uiEAcb2JPOOOxvQxOf5Dtkr3zF+UOoYSYn/IPiphUooc2VcO/i3ru4gHcElJiyfELqEeJpuE5dMerPN3bV7pe02RYWGSqaxnr4RRR0IqBrdscbC13RHDPlntP6p2i3v4BrNjTN3bQQ4+iG0o27jXlgfWDtiNDUHL5IL3hdxz2E+xvGtsQvBEpbgaZVPqsqZ75SF1330GE+3TdUn9I82Fg1T+tkYF6h0K9Q7eEv5Jnk6iXYaKOcDwKXcOaLa+9kDvNU8iVDvwk/lnmQdzEXoJ7zTEFJMQxyvRPV9CM=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(8676002)(4326008)(8936002)(508600001)(356005)(86362001)(70206006)(40460700003)(70586007)(81166007)(54906003)(110136005)(82310400004)(316002)(47076005)(44832011)(5660300002)(36756003)(426003)(336012)(16526019)(26005)(186003)(1076003)(2906002)(7696005)(36860700001)(83380400001)(2616005)(2101003)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 18:42:21.2285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8c4655-5853-4f4c-8ee8-08d9e4203ff7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3767
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move SMBus controller base address detection into function. Refactor
is in preparation for following MMIO changes.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 71 +++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 26 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 5a98970ac60a..eab06e9e5fdf 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -282,12 +282,52 @@ static int piix4_setup(struct pci_dev *PIIX4_dev,
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
+	retval = piix4_sb800_region_request(&PIIX4_dev->dev);
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
+	return 0;
+}
+
 static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 			     const struct pci_device_id *id, u8 aux)
 {
-	unsigned short piix4_smba;
-	u8 smba_en_lo, smba_en_hi, smb_en, smb_en_status, port_sel;
+	u8 smb_en, smb_en_status, port_sel;
 	u8 i2ccfg, i2ccfg_offset = 0x10;
+	unsigned short piix4_smba;
 	int retval;
 
 	/* SB800 and later SMBus does not support forcing address */
@@ -310,33 +350,12 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 	else
 		smb_en = (aux) ? 0x28 : 0x2c;
 
-	retval = piix4_sb800_region_request(&PIIX4_dev->dev);
+	retval = piix4_setup_sb800_smba(PIIX4_dev, smb_en, aux, &smb_en_status,
+					&piix4_smba);
+
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

