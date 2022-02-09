Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF8E4AF864
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 18:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238159AbiBIR17 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 12:27:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238113AbiBIR16 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 12:27:58 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2068.outbound.protection.outlook.com [40.107.212.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C21C05CB87;
        Wed,  9 Feb 2022 09:28:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhAaqxDVofudT7opzL3vdOvhLGbjUw8U1O5cTJdzImcWPEqmz0niYtAV8H57Xz9HIsZgfOLQ0kG7QEIAOpT81bb0jXiuNg4kV7MsCOyaRNle6stgqq3OAq0NTPzlO7EfvpSoJ1HA/lJMhEIpnLADb5zGsZj3TLu9/57x4ekIqDJXPzhFa8fcAeNnvaLK+xZEu5W9BPH7+J1DuD9udX7EzVJdHKTuGOCq4iQJA49oEhiLgi8W71wNB1gYPaC9bb0y0hVVgc3qK8bVvJxuuSoSAUSVk9wGuJA28xPEbzqkqqKN0DUFBJUp/1G+s662gvY5bPLRaZU+dLVz5UmBg340/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVN1fSaPHMHmN5ElK8evG9b+0aU6JalIZPJOQd2ff1o=;
 b=fozu3aag/2P5VXRkm6qU7zB2q0pWzHGDBSh4iiITzWPpjetRyJMyhg6AyIBFjID7nxp0b5bSNw8pZCntR0i0JSI0OcwNKycouZXRlR6C6/A7N8AFhOTH4LCOBSKD1PS3deKmhdrCEnrpTL2e3Eb7GBS0K4eSECRdnRu7jXqGKvmOaRH7a0QBZGeRDXeX4bifXvfz5tYA3n+fcw/kkHsqfTo8zYEazqFVgDJ1j9Y6zxiUPJNtLVvFjix1DnOvmOZnY7bxz4F97ZRnu51oX3+DSNxBdR/k5qfqWLSPJiwtRp1aj9LelgK/2oIwwXhaKVW1ROW/TXsDcgHTl48dXDIwVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVN1fSaPHMHmN5ElK8evG9b+0aU6JalIZPJOQd2ff1o=;
 b=SPwk6CNWNlYOwdJLuoEq5FV+DyK7BnctP/EaaLyQB8igtthAmDvcIYFwmCLYclPnCOhAuLu+9gOxCrf53lalZUZZY8Rrtbsu0A3HS3jIYzdX4q4qVxLbIO1nxuoL9xomiu8wI4MWTvNze6u0Rf3BiF334V/MzXbR4Na9gec4F7E=
Received: from BN9PR03CA0532.namprd03.prod.outlook.com (2603:10b6:408:131::27)
 by BYAPR12MB4773.namprd12.prod.outlook.com (2603:10b6:a03:109::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 17:27:58 +0000
Received: from BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::5f) by BN9PR03CA0532.outlook.office365.com
 (2603:10b6:408:131::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 9 Feb 2022 17:27:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT006.mail.protection.outlook.com (10.13.177.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 17:27:57 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 11:27:56 -0600
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
Subject: [PATCH v5 3/9] i2c: piix4: Move port I/O region request/release code into functions
Date:   Wed, 9 Feb 2022 11:27:11 -0600
Message-ID: <20220209172717.178813-4-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2e193998-de87-4845-2c7c-08d9ebf1839c
X-MS-TrafficTypeDiagnostic: BYAPR12MB4773:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB4773D051EA7D09DAED8D8B5D832E9@BYAPR12MB4773.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1HqDoWSSlIDA02C8uYnb/S9eauoeVhHmUZluA+ymOaWdebEA6HgBP2b9uvTL7IBHSkWkFmgEHYRJ4FgNMAf/gw6XjePNOJRtSfS8D8CIImCgaJOi9EB10RgXx/vBRqJSfUyOeGZiRLqEiY3i50dbyTheUSvuCPQx5uXoRRR3Q3qF+0oKiA/KSjY3P8Ml7tkYYbf90eDB3jecGrj4zub8AtXt7isBduNO5LzzZyhiqqmoy9vvCm9h2sQFN8kFQkD/o85tJymE82LxGw6uWluajBZmCXeOQMEaGEmTMkORU+8e1MxPpuE7q5SUlVuN7Kw57fDqj0DqHAFQzQIezxedZyVaVv8PsTSUH7rK+lPFGVdo3q2cDToyrYQ7ZrPiG1xr1RkF4HTGMxRaQDrrrv6KjN+tRw0NAwMnMNtyW5xZ56C+CzfRtgMX4pfz+Io/A2TS2nsRWpI1tv7vP8IKFd+V1fSuaRarQV0TPszwnj5qjcIB0FZAfvaUQDkOowpBThvW1MpqGczCR5brI3B/SFTTGDsXY75wPOrmkJOWeCPpFhNExl83UOAIOfqooJsgQxROKmbAuyAxCs9RBEjqwaMNdn3s4YZ1PRDlpt4EQVlDiTP+GFH4Y8FbMCX5uklZQ5Lo9Efy/YvOUkKX79sbfHn1hhm8l5aMDCiQhpqVWLO4xW7gmvl42gMK2KQbTdfurqwuk1lk/CfrqmEqa1ZR0pltQULffdxFxhj1Q3MAKLCnPPg=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(4326008)(2616005)(508600001)(70206006)(82310400004)(6666004)(54906003)(110136005)(70586007)(316002)(8676002)(8936002)(5660300002)(44832011)(2906002)(7696005)(426003)(36860700001)(26005)(1076003)(186003)(16526019)(336012)(36756003)(81166007)(40460700003)(86362001)(356005)(47076005)(83380400001)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 17:27:57.6706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e193998-de87-4845-2c7c-08d9ebf1839c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4773
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move duplicated region request and release code into a function. Move is
in preparation for following MMIO changes.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/i2c/busses/i2c-piix4.c | 48 ++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 3ff68967034e..cc488b1e92c3 100644
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
@@ -373,11 +388,10 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 			piix4_port_shift_sb800 = SB800_PIIX4_PORT_IDX_SHIFT;
 		}
 	} else {
-		if (!request_muxed_region(SB800_PIIX4_SMB_IDX,
-					  SB800_PIIX4_SMB_MAP_SIZE,
-					  "sb800_piix4_smb")) {
+		retval = piix4_sb800_region_request(&PIIX4_dev->dev);
+		if (retval)
 			release_region(piix4_smba, SMBIOSIZE);
-			return -EBUSY;
+			return retval;
 		}
 
 		outb_p(SB800_PIIX4_PORT_IDX_SEL, SB800_PIIX4_SMB_IDX);
@@ -387,7 +401,7 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 				       SB800_PIIX4_PORT_IDX;
 		piix4_port_mask_sb800 = SB800_PIIX4_PORT_IDX_MASK;
 		piix4_port_shift_sb800 = SB800_PIIX4_PORT_IDX_SHIFT;
-		release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
+		piix4_sb800_region_release(&PIIX4_dev->dev);
 	}
 
 	dev_info(&PIIX4_dev->dev,
@@ -685,9 +699,9 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
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
@@ -762,7 +776,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		piix4_imc_wakeup();
 
 release:
-	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
+	piix4_sb800_region_release(&adap->dev);
 	return retval;
 }
 
-- 
2.30.2

