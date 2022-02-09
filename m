Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729D54AF85F
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 18:28:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbiBIR1r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 12:27:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238216AbiBIR1q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 12:27:46 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2062.outbound.protection.outlook.com [40.107.212.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C48C05CB82;
        Wed,  9 Feb 2022 09:27:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmkKMCA3hT3lhSgywONC6+IN8Nf8oHfhCZvbPoTjaVlF0ILl9QKcSPFa+p40GH9XkmISKxDyzSZOt1ok5fhhVTsHIPHZ3bb5yJU9Tp7yJlE8cMHzhlCNFIJ6iYxnTW5vvOmNDHsGwwD1cXIXCQcAbWyn7JnNoZDppq2ZIZJKqG8PFkT5FL0uVSRC0jGiRU7aioQUwdVsI7I09CvhkjUR/MRlB8Zv8mernjdGQ2Vg78k3AcjqR04q3OGOZ8Gg8sFZrPMj67mbk6lJUgYMIobfwfV6IRicOLO+dYqevRKCrXMZDy7C+XmWcE+/bycFNpV5ELo7KcDB8q9YbPGu7pgOJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLOLnkmGZQCDDyGQoJIGQ79bpx7EdS73MDK0d6wXNG8=;
 b=GQ3drloq3J0s5bpvziDBg+36fm3SBKrFuIoOHc1ZYkg+DJjWmbzcdxJVd6nKq5fv91XM8CNCrX80lhFIrN+ZryiOtSUofDmiSW4c1jXwPRwEOkeHFDeDLmFdLhfjXuxeXYPqzJHP9tCqQH8pHtNa6u/ccCWVGGPVkUnMFGBhLj6t0RVax4cM+aVuk6YVeDawYcrSOpBeLYnTQed0CRw0VE9+7FS3sWv7vVx1xBAwW8Y1PHdKulGsnRlpyaKneDf5yOjGzLxVLdBmCanjgrmrWGnadFFK4eIh6SKmP+Z90lHVZSpaG4PKKaz3TZRvjfBfptR67LRTDIOWVDUZAcavUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLOLnkmGZQCDDyGQoJIGQ79bpx7EdS73MDK0d6wXNG8=;
 b=wKjVg/r6Ucj6zzrdOHLRhOH6j053z5OTeKsI1My0aho0ODPiyNpwQAWWfpr9qD7UmCzGR+SGGG9P5qAXS5LSejMfrf65uCNPOxBAayrJn1b7HGUMJNBkyaxzPiDJsORckkyFimewOGmljZm5JjF69qpDikCMeuW/4xhyLzMVHa8=
Received: from BN0PR02CA0054.namprd02.prod.outlook.com (2603:10b6:408:e5::29)
 by BN8PR12MB3267.namprd12.prod.outlook.com (2603:10b6:408:9e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Wed, 9 Feb
 2022 17:27:46 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::a5) by BN0PR02CA0054.outlook.office365.com
 (2603:10b6:408:e5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 9 Feb 2022 17:27:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 17:27:46 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 11:27:45 -0600
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
Subject: [PATCH v5 2/9] i2c: piix4: Replace hardcoded memory map size with a #define
Date:   Wed, 9 Feb 2022 11:27:10 -0600
Message-ID: <20220209172717.178813-3-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3ca973a6-7a0a-45c8-a76e-08d9ebf17cdc
X-MS-TrafficTypeDiagnostic: BN8PR12MB3267:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB32678CC62AF8E3ECA282C172832E9@BN8PR12MB3267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fNE2mcBIoQYKr9dJJYiJMiQGOkI18fXmJnVkNdcx9DmH6RszhuWLlaSoDOtBMgFRkWB17730mW+uw3UjzEypNFKVltQy0jzgBqpo0eo1Xmu+AVFZB2fhqroAbFrHs07+SJEOP3zQkNVIIYlW5LqJi7ee8F/nPzQ391ddXI83UPdIRM4vvJ+1QfKuWvPknmLFhvfGwpa9WQHl7DGBDQax/cdnXjD15giTTWcYSRjQ9bQC2PonA1R+8PTqGu8dky6IkmJb04+Cseo8WCs79v4VdnCltV8/t7kNL5iGRTNtzSLozQsOkShFFr2X3Pvamf3pGl0LnbOoInXSwbDfQS+IkcbSHaH4QNZGBJrnd2mg7EyzIJoqasLRpirN2xBH9/1FI9TW4kh8VRsfpCYF27KOqxbMK5eAor75aT5lAvb+0CosdLPaSi0qJAr6PO0kRW4zB4dtHI4M/S4m4E/UzPsBY454FySW4aZDs9e5sUmm+iwGJgTdhYHwtHfNHRf4Hgb517nwVj30bjeIWbEUcq2UeBVPGkv3DtBNNOuueAyfqaKRQCiTEJfUbAuBmIOIp/hjszKWd/sC5v3/5kkPjZdNXwrvyXBV2eiANUClt6gxERWElRLJHqiVBqBRk1u+BDNoQPAhJYCWOKtD4hEmF16EUIaccaeHXbmIn2vx4InvgR6WVdLbSB8obQs5SLBDJPv+kiVU7pViwnFyhBbKTHL9O6yFpkeIN6IXnWnj2I+zloE=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70586007)(70206006)(6666004)(5660300002)(1076003)(8936002)(82310400004)(16526019)(8676002)(36756003)(7696005)(2906002)(186003)(26005)(336012)(83380400001)(40460700003)(36860700001)(4326008)(86362001)(44832011)(356005)(508600001)(316002)(47076005)(2616005)(110136005)(54906003)(81166007)(426003)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 17:27:46.3335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca973a6-7a0a-45c8-a76e-08d9ebf17cdc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3267
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Replace number constant with #define to improve readability and
maintainability.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
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

