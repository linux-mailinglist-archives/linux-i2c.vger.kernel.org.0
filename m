Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 018304AF86B
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 18:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238240AbiBIR2L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 12:28:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238177AbiBIR2J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 12:28:09 -0500
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam08on2073.outbound.protection.outlook.com [40.107.101.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB96C05CB9F;
        Wed,  9 Feb 2022 09:28:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iArVFX41OdB65wxciC580RJ52bcfuQ4sq8qUtwVTDMNZfNuUrNeVm8WqrGGwyTT8t500uSleqyDdKoLFl986xWQKQ7pv7ybU/+S5YDvcqoNbI8X09nKk+K+mClVrwOL7YM5NkSLr0+cRgyn0UcoIztiGEFKeEczOyiL6W7Q8oUxndRBcIg0rp3vHJQqERkejt8EINwg1hW+cggxCv0urE4dKI1dzsECTf7OtQa8jUlgRpGKFbHq1enoP779EOZQIUbUsmZee1cbmailddUSi8qY01sRZKHvVbjEutHinS4mZrkNhA3/2EFpTDdxRXP3Nr43TZLIuKIVJoMB52jj7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/KrdumM6sgTU3oSHI68yIAcO9w2D+6EOObmpzWKiX4=;
 b=ch3bNzbDdsLnvSGFmBjv7RbIrijSam9dRuxqv3WTYjW+P3AoEwf1hpfsVri2Rv4A8ET3n+Dfm9UZvBXQL8ILz2e5tzXX2bBVRv2dZBZexschurbQrU6fwb5YPkiOSTbMlSKkATIjvMVdxpBJFo+tMzUeAmqEmg4Gm98hIBkNtGjMGQHQN/Mhihlh0/2MMqh7qxLt8PGN5MDs3HbU9mKZorCB9ZOI+gHxM1lpcojV1uTN5DFkFQCI5IiDZZbBLtAzITlafZkVt/z7b7xkjcBCFfVeJgTMlAy7IlCkp7yhykreMKEGknmp0w1iTbAdNKukVDILw5tvI5uBQpcegruhLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/KrdumM6sgTU3oSHI68yIAcO9w2D+6EOObmpzWKiX4=;
 b=FsN2dEW6xWVISDTroJeXOYDxydg8uwrNekl5i/zG3K6NI3b1cncc8yT+JrNSP6O2cYJNd/ou/yoPewAiZtdsMAKVpQPcNWy2klvFlBi/5KU70Nr6eCLopkgxjwee7MsqBAUbJERMD//GgcJvJS9sMxlC8gu98p9De8Risk2G75Q=
Received: from BN1PR13CA0022.namprd13.prod.outlook.com (2603:10b6:408:e2::27)
 by BYAPR12MB4616.namprd12.prod.outlook.com (2603:10b6:a03:a2::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Wed, 9 Feb
 2022 17:28:09 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::ac) by BN1PR13CA0022.outlook.office365.com
 (2603:10b6:408:e2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Wed, 9 Feb 2022 17:28:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 17:28:08 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 11:28:07 -0600
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
Subject: [PATCH v5 4/9] i2c: piix4: Move SMBus controller base address detect into function
Date:   Wed, 9 Feb 2022 11:27:12 -0600
Message-ID: <20220209172717.178813-5-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 57c2cd0f-422a-45a8-b7a3-08d9ebf18a2d
X-MS-TrafficTypeDiagnostic: BYAPR12MB4616:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB46169BBE1F961B3743BD1A95832E9@BYAPR12MB4616.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: frLEiUfBwPlTbBSVpVF3b4Do6gyAWhRr+StuXN67j4U4N1bkdQTbeQW6ObTcbUOMERnb+ziulSFABfN7JwTxygCBr+igORbMxjKl5w48NEj5YwHHgZKWgyL2aOZp27m2DxdtFTI+6+fVcyclY/SQpxj9p6gWy1qwd1zPRHrZ2vrhPVKSs9mtscjUOZ8yImqKFvzaXhzUqNTnU4uUJerS9/JqNGd4ULoqKKYi4xWEU4lGq0kmPtXd835msfBu5S9coe4oHTLSVGCFoyOsC+e98Op1ml4gC9Q3hqRs/IKQOLn8ocITrioH6JTxGF1aWk18m7eHlRsGM1b/wDC+rOM0eds7rwyoBukEz1wyrxSfNcrF0pvwQiHnnabaZlUr5vB4x6zfH0DqqdHt3dHsD6TIfEv9aastQPAkdIicrcCCvHh/NpSPMCgnXTIpvZvf5lH/unmq8nAmQMqLzsucPkJG0lpahWjj/ZesOEcWEV7l1i9r6gf/K0zttIH/jUK9Gi3ZBcdAhasdMdv+JUu+FmyudQtLHR4J6CDIohjz123x3p9yIZQ2Bhz50mBUvwV0I4buMEldM/idEtmul9eOWUKGjeiPk0s/0D9BqOZJTLqAx6Ur5KKXhqGGPD0IIGYEcLjIlY5vE548LXU/dnH33U9CGik9R6bQh4Kuv2qNIwmf0eG8J04Jz9Kih2gKahMxIVbSMd6SHS2tGGQnD4Q/L9wWtuH6r/A3MVNbFmyg+Sc6K+Y=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(1076003)(508600001)(81166007)(86362001)(356005)(16526019)(54906003)(110136005)(6666004)(186003)(336012)(426003)(316002)(7696005)(26005)(2616005)(8936002)(70206006)(70586007)(8676002)(82310400004)(2906002)(40460700003)(47076005)(5660300002)(44832011)(83380400001)(36860700001)(4326008)(36756003)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 17:28:08.6908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c2cd0f-422a-45a8-b7a3-08d9ebf18a2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4616
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move SMBus controller base address detection into function. Refactor
is in preparation for following MMIO changes.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/i2c/busses/i2c-piix4.c | 69 ++++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 25 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index cc488b1e92c3..b7998eb44027 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -282,11 +282,51 @@ static int piix4_setup(struct pci_dev *PIIX4_dev,
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
 	unsigned short piix4_smba;
-	u8 smba_en_lo, smba_en_hi, smb_en, smb_en_status, port_sel;
+	u8 smb_en, smb_en_status, port_sel;
 	u8 i2ccfg, i2ccfg_offset = 0x10;
 	int retval;
 
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

