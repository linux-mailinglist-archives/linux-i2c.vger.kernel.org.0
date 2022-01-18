Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0779349305E
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 23:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349744AbiARWMT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 17:12:19 -0500
Received: from mail-sn1anam02on2052.outbound.protection.outlook.com ([40.107.96.52]:63630
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236714AbiARWMS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jan 2022 17:12:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MO11j4jgg2xU0K2WHI6cYWo3o1LxH/3X0aoRPF1U46R6nb6dZxAozy1OCwTm/dd1pFm7JztyuEFxkLVcpoxLJZvN4RSc2raMJMbwnyYP0fzqDbsWOAN4zF3CKGHIUxnvn7uyZnbQgMCKfITkibrRjBSgfhX1Kv3jtsVD6jgrCz4bu7GCNiuS1LQEgtj2izub2D7MvMJZ9LKJcrglOLHc6rB84SuVLMh/lyhuNB2zMjZ2KBFLFNduefKKu/jaSLx9zuem821CLv0IELHld252wxDMjQYI9ryWWh2mYv9wnkP2srxbikyJDhLBYPhJaZ670CizW971qKe2f8r0OuOUVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Wtfc54efYNA9nEnF2dYPhy1KrzguVJ5X3X2r1WYN2I=;
 b=k9KA1AmE2Qpmcqr7CzvJvSZQA2KAjqwHs8SRIBoGGzEalzXNdyazVVaXaeEhp+PvUX/ETu24gGJEnX82uN0U5F7HGmw/5/AJltpb3AFlSzuIgQs+34EFjP++dmWGoyc83RVRp1lhvL/Al/gCVccVEt2iOFUA828SMZ/uNzGJPb/QgVCU+1P32WfEp+ScCN+j2nG30xRiGuaVj1/2K7w4Mv9S5IgkugW+ckfRdIQtWrze2R8udJZW/TFNfXkSgiZUdaIGWL4pOcExD/8+if8BvL99i6Q5UmWBHEhs/OG40jxts5d5jJOnYtYySdpRweVyPAK9zC0rDj5C4aDGuHUy3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Wtfc54efYNA9nEnF2dYPhy1KrzguVJ5X3X2r1WYN2I=;
 b=JknXz+5FbLr/viO4AhjmOgfMT9pHVcHHvAOX62XH7/HOq7gEeC+wr/oD9BRxTS+dAZgw+RN0YUm9iMst3ndSSumsX+Mb3We0Y/I1gt1l3WedwVvC5IoNj2O0g2/0AmGniRglLgxWWfIKFDpHQaBZgS5pbL8GN+94WrObyA70Gq4=
Received: from BN9PR03CA0037.namprd03.prod.outlook.com (2603:10b6:408:fb::12)
 by CH2PR12MB3800.namprd12.prod.outlook.com (2603:10b6:610:2d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 22:12:15 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::bb) by BN9PR03CA0037.outlook.office365.com
 (2603:10b6:408:fb::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Tue, 18 Jan 2022 22:12:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 22:12:14 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 16:12:08 -0600
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
Subject: [PATCH v2 1/8] i2c: piix4: Replace hardcoded memory map size with a #define
Date:   Tue, 18 Jan 2022 16:11:45 -0600
Message-ID: <20220118221152.300444-2-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: b6f9a502-167c-4c77-2769-08d9dacf956e
X-MS-TrafficTypeDiagnostic: CH2PR12MB3800:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB3800D23B296BCA89F74ECA2183589@CH2PR12MB3800.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iCsYBPkek8Lcc36VIc3+PDk7+8hNYRFBIVSVyUC3lBFBC93XQQDM+NGwZDTIh3Z3JsZc6HtkL38+o2jenIF68sECbhDEgwrNxOtGvyU/S0f2PsN2Q6nHbJIWMFncAs+a/o4jM/uS1WTy29j4nQXSX62jsjEc3mNLUrRS5frzCC8jNjD6Pdfrt+KPFcJYJCa6s7UTHUiOMifhWdBXTooQ5z3GLXj5Irn+62G7cj4u6OxSgUrv2v4VeN8zXPqRE4GmuQrWy/VizqKHqLHM7kE4P2SvaBUacj1lw+KcY3+zCOS0ipDXeMXjp6mXhzgq8qTTamg1xWv3r8ZuwYbHIygG7q7bovr1BuzWEWdhQ6F7RkhN6fZyYF40I3nE178wD24I0jUr1RCdI4i/796pgvtCQlyUw145cawu6lyv3YBvAiEFxAwBk5N6SdUlrwKGGFqPPeJiCBWuMGvHDVAQOm/ysk9tpr3u6eG8maOo6r7T2Yjzkjz73aQTffESgHJJmzlTODd2TqQWh4WkyM6lYONbgv7W+QZVJEtx6540DV2xBuJBjHb0n2n5YTIwhKJOuZliNSRee88fq78m58lbLe/5/0juLX93E0n6yCj1uwzeUr95zflPZhe3vwQPF8wgtQFJf3u+wPp3w5YY1lL3OWQlsQXDj8NTA5g+C14l6Dc72b9IRZNEPZM+j4HnIFm9QUVjTEz9jhXGYeZuLaJz9iU6ks9xwERwE8D5FKU5XgaIn2cX75jFpC8sw9CkE1A59eaNq2J69f1+mA6oIb5Rs7QoFO6a6ZpnDNjYiB/EA5dET0flbmufOEOTy5x+DwvsmUY+
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700002)(36840700001)(46966006)(86362001)(356005)(7696005)(36756003)(4326008)(26005)(70206006)(70586007)(8936002)(426003)(336012)(2906002)(508600001)(8676002)(5660300002)(316002)(6666004)(186003)(16526019)(1076003)(44832011)(36860700001)(110136005)(54906003)(81166007)(47076005)(83380400001)(40460700001)(2616005)(82310400004)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 22:12:14.9433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f9a502-167c-4c77-2769-08d9dacf956e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3800
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Replace number constant with #define to improve readability and
maintainability.

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
 drivers/i2c/busses/i2c-piix4.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 8c1b31ed0c42..b88d990b013f 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -77,6 +77,7 @@
 
 /* SB800 constants */
 #define SB800_PIIX4_SMB_IDX		0xcd6
+#define SB800_PIIX4_SMB_MAP_SIZE        2
 
 #define KERNCZ_IMC_IDX			0x3e
 #define KERNCZ_IMC_DATA			0x3f
@@ -290,7 +291,9 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 	else
 		smb_en = (aux) ? 0x28 : 0x2c;
 
-	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, 2, "sb800_piix4_smb")) {
+	if (!request_muxed_region(SB800_PIIX4_SMB_IDX,
+				  SB800_PIIX4_SMB_MAP_SIZE,
+				  "sb800_piix4_smb")) {
 		dev_err(&PIIX4_dev->dev,
 			"SMB base address index region 0x%x already in use.\n",
 			SB800_PIIX4_SMB_IDX);
@@ -302,7 +305,7 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 	outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
 	smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
 
-	release_region(SB800_PIIX4_SMB_IDX, 2);
+	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
 
 	if (!smb_en) {
 		smb_en_status = smba_en_lo & 0x10;
@@ -371,7 +374,8 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 			piix4_port_shift_sb800 = SB800_PIIX4_PORT_IDX_SHIFT;
 		}
 	} else {
-		if (!request_muxed_region(SB800_PIIX4_SMB_IDX, 2,
+		if (!request_muxed_region(SB800_PIIX4_SMB_IDX,
+					  SB800_PIIX4_SMB_MAP_SIZE,
 					  "sb800_piix4_smb")) {
 			release_region(piix4_smba, SMBIOSIZE);
 			return -EBUSY;
@@ -384,7 +388,7 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 				       SB800_PIIX4_PORT_IDX;
 		piix4_port_mask_sb800 = SB800_PIIX4_PORT_IDX_MASK;
 		piix4_port_shift_sb800 = SB800_PIIX4_PORT_IDX_SHIFT;
-		release_region(SB800_PIIX4_SMB_IDX, 2);
+		release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
 	}
 
 	dev_info(&PIIX4_dev->dev,
@@ -682,7 +686,9 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 	u8 port;
 	int retval;
 
-	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, 2, "sb800_piix4_smb"))
+	if (!request_muxed_region(SB800_PIIX4_SMB_IDX,
+				  SB800_PIIX4_SMB_MAP_SIZE,
+				  "sb800_piix4_smb"))
 		return -EBUSY;
 
 	/* Request the SMBUS semaphore, avoid conflicts with the IMC */
@@ -758,7 +764,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		piix4_imc_wakeup();
 
 release:
-	release_region(SB800_PIIX4_SMB_IDX, 2);
+	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
 	return retval;
 }
 
-- 
2.30.2

