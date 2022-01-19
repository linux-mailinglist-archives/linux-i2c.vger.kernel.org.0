Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B761E49437C
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 00:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357681AbiASXHD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 18:07:03 -0500
Received: from mail-mw2nam10on2073.outbound.protection.outlook.com ([40.107.94.73]:41696
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344356AbiASXG6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jan 2022 18:06:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWX9tCszxhMLfjMIOlQGnA+YPSLnP30cy8rBCmrqXa4M2HRq6VVMY1eoWkXnNk6LbA+QxEABEkcgW2CqJ2ByF9xui75In+hw+SteLue5I5obMQcoHfJDGLTjx1leIuhtiOQkb1BmBO9qxpdSzdsJmsyw1jJOkAYS3ARNkRshGPRZxVVQj//JuWbKhAGiEZ80pp0C/bUFVFNex2dvwkXaO2vaU/KG8OkiwSC82lK/fAvBaBbd++afjG8vpb+6OtGqzardzBGT9b4WBmQ33WJ/DKTAuwq0NbRc9Xn7+SVhoNthpKlJvWIMJwtC8BREHwCBunGTEX+uvK3FQ0eGFo9b7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuQ2jEQywtADrnzaFTSCXwUipcUyfr4RWsUJD9MuPLE=;
 b=ZqBfaWRQeaxJWw59chEDQqH9spUD9BLUbYPsxqvZpmBqEdAh6jO/GUXjGwaMjedtqNmXbRKb037OczpmIypR3tT0fIwYz/RDve/fqrF27jp8gpg64VvXJAOPI4OW2UJ7XlKhqPTSoBECj+fqopF+MlfJIkCe4wt+xexDcUm/0Dh+O7vBABcCc7rHu7VyePoWWSEFyXsqJt7J4tJF0dijAImkr39jvmYDJdSLnbBg/nyU5H6zFwrkBjLG7P4BBrWL/IJ9iOakjPeSWbkexLyu0Rz+pOCHEej11RCnz7PDolC76BH/Ve8j2LRyaT4KTR61YniDJT2u+6D5mzXMlkhuuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuQ2jEQywtADrnzaFTSCXwUipcUyfr4RWsUJD9MuPLE=;
 b=Hov3YZBZkSsLPB8N7xawKpfTGCh+7p4Ga+s/TM+ASyXwjHs39n2396ImeBm2CAC8xGPeUqm5kH5X7rn0HHdDAqbMbgnANKnZ+kmboy6n81t5B8C4YwdmqE8Ze1QVQYmNKEnGTFaGZou0eptF93Brb0f55Pb43kP92RymGI6JJHs=
Received: from DS7PR03CA0131.namprd03.prod.outlook.com (2603:10b6:5:3b4::16)
 by SN6PR12MB2781.namprd12.prod.outlook.com (2603:10b6:805:67::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Wed, 19 Jan
 2022 23:06:55 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::17) by DS7PR03CA0131.outlook.office365.com
 (2603:10b6:5:3b4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Wed, 19 Jan 2022 23:06:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Wed, 19 Jan 2022 23:06:55 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 17:06:54 -0600
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
Subject: [PATCH v3 2/9] i2c: piix4: Replace hardcoded memory map size with a #define
Date:   Wed, 19 Jan 2022 17:06:19 -0600
Message-ID: <20220119230626.31560-3-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9ceb3a3b-0a2a-49e5-731c-08d9dba06349
X-MS-TrafficTypeDiagnostic: SN6PR12MB2781:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB2781C4C3EB27778F164D6B4483599@SN6PR12MB2781.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S+Dvdaozmsqps6JvXPcOzNGytnGLs0X/thRPtJwQsJwVaJ99fEY1jUtOQXkAXHzSdieRcvTpRvuqM8HW7PkBPcMk0KopuxQ2ktTglMrwCASDaL35UGwxeu3q5AiWQBB3nTuAosguzGV3EQfsEETIHUAinW5qoEGpdDHlJO0C/H9mC2WrlCTZD9bwTlZDiETqVUxVjVRC4OhbLQE3zDHlC7JpiLu4lLI9M6tsv4OfsD+MhlAF3Txue1RZoNbRRtd/6FUikmFztL62/ayXsheJqYHRMXxFsMZxOsvQPQtb1hX2qfKUb2S23XhEcn8WUMqkjYacUPQLu7HAiBStJi+XGeDyTLqAzmPAUaxHtE2sPzHlJZNY6JyLods4BvWsheUVqIdksY4bSqIPufTIXD/nR2KGNjRZpRJcrZawKfcbp+eIIQKB8p3Q8Dt8i8WgR7ZqDDkb/ph/RqRmQkpie6UrOsvSAJNRrSwliDhiqZ5vRz7s1Y3nuEVJD2+2xsZ53UxG/VBhu9DJLsSKVIZcMilJn154mPOLimMouyJmna9SZiJcSU8tdWdB8bykG6Nxzdxu8Xl+fPh7a/RSf/4VhP2AZ9kfm/i0pEYUPzjZX08m/bnFqz/R/m7M28Xn95ksz4ZUayzJ3sw9Hj/wW1CEwLTMjhAt4uNOtmJ8sOfpc3fSKmiM4qiYFYv1ieFE5neUqYOMlath9bLwE0aeqHWsjnsFxVH10V9nxDtxvar9wsQuBldfHhU9FI/kGumb0Ptt97e7iS98jYcm+ZN5sOA3tF2jvuGPBH9zPgpBqdyUwNgLKa40jWPrm9f98yLuRMJCFPxt
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700002)(36840700001)(46966006)(54906003)(6666004)(70586007)(36756003)(70206006)(8676002)(81166007)(2616005)(426003)(1076003)(508600001)(316002)(7696005)(83380400001)(86362001)(36860700001)(47076005)(8936002)(2906002)(356005)(4326008)(16526019)(186003)(82310400004)(40460700001)(336012)(26005)(5660300002)(110136005)(44832011)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 23:06:55.5706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ceb3a3b-0a2a-49e5-731c-08d9dba06349
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2781
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Replace number constant with #define to improve readability and
maintainability.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
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

