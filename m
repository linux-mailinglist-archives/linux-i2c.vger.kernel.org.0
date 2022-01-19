Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC3C494387
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 00:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344329AbiASXI4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 18:08:56 -0500
Received: from mail-dm6nam12on2044.outbound.protection.outlook.com ([40.107.243.44]:28064
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344362AbiASXHU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jan 2022 18:07:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWLZAdAwdObhwwjT0Tu9fpc0RfSSUR239Mey4vxFkUPjIBfTa6Loj/b10q95ghCbcU41BuZ1/pyHIqphz3Eb+j/QtgbQKu2dufl5kZ4Q9EK1OcxA/6MSfV5K9Q/l4pvrQKRI5d8RTtxgQ6qczbZ+f0UJ+nNORXXKIEGPb1RvMeIHeJJwpqTitfbNHMQdsUeMteaFdFj4gIicofrFTFgtXPC4sOJn6oJz5NX595dGUp0jWmdK9knaz8wDCHgMSfl1/psDihlJcvHsS+2EvIQAAKWya5s5718ylnKYmz5j6w0SGFWrmEuDXc3V4T46XMd4wO+mA8aqctN6D2sbMudDVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3YCb/ZKaewGc2SGJ9kNkwQVxDEOAP1HeHCDak9P1vE=;
 b=U6Q/hwKO3wm9Wlc5k4mD/h2PEfo7tIvv9DutbwI+4LQHBjpGuCx3y2qWEYk3xbTZMMMzrLqZEiwe7YKPv924MXn4BmW93EACIsq/4K+5cNGj+r5yQIhd3qMshGywPZZ6ddtdpwzZHYYQkQxO/k4Z7xS8C3l8jcURnMcH5CroM9Zlrzs9qXft+LSxb/isgm+K+4IegD6Ua69EIfcvONxip+soEx9xG9qFYFk2uFfFDwmm3+RLszPFbHj63VhrWCte0Ykl5ChPj5s+lbH8qh60YOceYnS63KuAO2/1+aYIQSjkWaf9uORfJizhiSFEMrnJmp3h6OR3lorNutqY6ZthFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3YCb/ZKaewGc2SGJ9kNkwQVxDEOAP1HeHCDak9P1vE=;
 b=vCXdHNnQhY71AyRE3mlz+JiP3bD51yYJ3bt+LpgBq8FzfUDk4QNar9Buq7ZVVjY4d19cg9KfRbJD2N0jbj3CjONieNF9vA9st2xIp1+CPYRBaDM1Pjs3EPlKr2sRx6Hn6rbiN60G5hDC39NA0SL3qbGlcUCdoNzKZCiGdtzo0QI=
Received: from DM6PR06CA0046.namprd06.prod.outlook.com (2603:10b6:5:54::23) by
 BN9PR12MB5323.namprd12.prod.outlook.com (2603:10b6:408:104::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 23:07:18 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::5d) by DM6PR06CA0046.outlook.office365.com
 (2603:10b6:5:54::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11 via Frontend
 Transport; Wed, 19 Jan 2022 23:07:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Wed, 19 Jan 2022 23:07:18 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 17:07:16 -0600
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
Subject: [PATCH v3 4/9] i2c: piix4: Move SMBus controller base address detect into function
Date:   Wed, 19 Jan 2022 17:06:21 -0600
Message-ID: <20220119230626.31560-5-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: c962797b-ec67-4458-9205-08d9dba070c3
X-MS-TrafficTypeDiagnostic: BN9PR12MB5323:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5323F54B88A14772A5DBBD6183599@BN9PR12MB5323.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JbisiTx1AsowY9akX40zWqU8jC+Va/RHPq+eziMCd9QQR3/K9Gd0OeGzlgC0XyX9J78XOSdI0w1LIyxsmC8QeKkjRxr9XuImfV/m085EdF7sD5m4LGYRzP0lpOHMtg3oMCfZPL/vxjJOKDBsLLMoaZvfDJ30zJArqKioWwF7XVzKrGn7rRRnkZbgciAQFy/J+/4WakgEmGslC8NR6I0vxoia8S7LMFO2LdIWx62ZpkhEiRgURgi2bYe4KDgWbzVeh+i1hsmlekVUzixn8ZC0Si+NAIJO6m0h0AhIMUgImdbvc3yOYVg9pnArglk2uhclSSWJrsvVvUVGbWeWYkoHda6fMEdBH15TtWVF0X2r3luf2SSUdGlIl/tq0r5pvva7V8GbPLgnP5NFyLVbCzyjMq7kNYb1F5YYQjKma9lbPBQekAluD6pDxP7Xdu2xL8yjsxPnSIpTBBNvg0EroG6sC/ADNan8vOA4GHEGinyEc304Acaosm9NYLk8ufo7aHkgoZ3V3XxzFalmAE9b8yWo3eljIJnfIqtjJz8LocLKfI0Q/cN8DFyB95U8s4GTYqkS1Qu5GsOlx3GOo8v7+uIo/NrRQWg3o0+OF61QhmBMzfhXvd/jdrA5daBFjigxUcbLCZt54UbEsPcMW5+oO9aXMvQ/vgzFJF0YHBi6DZL03C8IqEqoOKBSOOtx1H1Q5Ak8EBu9xIWGmuWVTE+9IlmD0UzbhOk3EBgf3AfzelWb//MWtSvOg7Vuq99dffG4IrPEAQNIyI1PRBxin4ZtHgaynLSordMdR629G1bJ7hQIzzkCCxshCS5OVX+0iT3wFmVs
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(40470700002)(36840700001)(40460700001)(82310400004)(110136005)(83380400001)(70586007)(7696005)(70206006)(2616005)(5660300002)(336012)(426003)(508600001)(316002)(86362001)(54906003)(8676002)(47076005)(1076003)(2906002)(36756003)(36860700001)(81166007)(16526019)(356005)(26005)(8936002)(44832011)(4326008)(186003)(6666004)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 23:07:18.1970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c962797b-ec67-4458-9205-08d9dba070c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5323
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move SMBus controller base address detection into function. Refactor
is in preparation for following MMIO changes.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
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

