Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B935049439A
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 00:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344376AbiASXJO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 18:09:14 -0500
Received: from mail-sn1anam02on2054.outbound.protection.outlook.com ([40.107.96.54]:64271
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232865AbiASXIP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jan 2022 18:08:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOb+uZmL2i5tJiHTOFKvWmjqvkRgMkoA8iA+/wOMbp1jNcb8BDPCpwTxUryCRaYu57NpcnjP9+8VZ4TTzRGS01XOJL6AGzIV79HWHL4tM1kw2Mbr93vnNfeet7d6mOL9t37v+ZuQ4aUynt2cZ5H2J5RObfmqUPVowuNcZk6r/ZFml9pHNUzthCNmB2d1myHl4zSLrcxFuG94nOkKoLz8+7fNKfFG4+LOzTGeAB8hZysuONvnBU4xDLa6FFBQFZpNbalaW13pLc0ZzCkWfhVCtN4IGKsq+XNb7t6yNqycGX7OxAqqmnSTL3iE1qU9IO4FSeUaajTDileHSrRfc/WNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsRledZkWF016DMmfUKUcthuwsLpudmvU6uBOV0lS6Y=;
 b=kCwclwgsHSYJlf7UX6P1ADcIxrj3c+W6zz9IQfUScUexu0IGVBgX2mGMOxRhTxr2AusiHSEAyGT/u1vyDKBAmIrgov+BSRBHsf3SGV7pZTMeQ1g/YiKjOA5Mht23tCGdk6isi759NxnHvICUwuZGP9K0ZarAoAjJbJlbqxqr1mjPHigeN2tlzY+QdwfEAwDI+ukbguRuXDlc/ipFxK18JQmzFdBsAzhHdrBlzUSJw07/pGO0aTtpKceg5GVUQDOF0xBiG6rKm5gCoyrZJsqFKLERl7jTk3B7IEk6wRNf2lnq8N6bMFf0nMR27abP8ovWsKEnXKa9Iskaaid7hOSeVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsRledZkWF016DMmfUKUcthuwsLpudmvU6uBOV0lS6Y=;
 b=juezkeo2j60uQk/mWKVm34gZ0NO6yRJxlIkpMGDlLh4RU5gWViBsCBvKXcZjRYy6NgF42jmwmQ9za8Sldk2DzKQrVHGkmvlrIM6DH5qGGPf7SNcM/xXLTdk72Vy3dSHoVaijBUR7oUAI66QTPNWkCPvpwkFKtcDpa17tg2Fl6Yc=
Received: from DM5PR2201CA0003.namprd22.prod.outlook.com (2603:10b6:4:14::13)
 by BL1PR12MB5304.namprd12.prod.outlook.com (2603:10b6:208:314::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Wed, 19 Jan
 2022 23:08:13 +0000
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:14:cafe::da) by DM5PR2201CA0003.outlook.office365.com
 (2603:10b6:4:14::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Wed, 19 Jan 2022 23:08:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT059.mail.protection.outlook.com (10.13.172.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Wed, 19 Jan 2022 23:08:13 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 17:08:11 -0600
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
Subject: [PATCH v3 9/9] i2c: piix4: Enable EFCH MMIO for Family 17h+
Date:   Wed, 19 Jan 2022 17:06:26 -0600
Message-ID: <20220119230626.31560-10-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 63a6f346-4a5c-4c09-c96f-08d9dba09194
X-MS-TrafficTypeDiagnostic: BL1PR12MB5304:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB530472B52CAB55DB7F4D47B183599@BL1PR12MB5304.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RD6xB0seqVqrq7oZQ5C9215nlw8Gkg6iSR71Ku+rC/iS/YsgWhyY4X/SMnzWHlx63fxxNINchyJKR+tBtkt0GvF7f8XXkg4UO/WqWURw1tcoW77uqx/fC3o4kSLZ/ggetbG8pVJISwhED5bFES8M/SUs2jIePNVCLRHeTma77vID4tZnd0e64LA/zJOzlq2maRv46tMzNfBRA2rKxklp6r+5XTyBba3MMJklzUfe2Dk+2JkM1G8s8hldHORM/U9MD3e9H2LwLDSue2DTVKSFfREACwW2YKGbOg6hMejJZ7l66TDQ2hRcQ5Kx46gx22OBMNnP8VOEOEd/YMrdrWxNdw/96sVXA5d3GefoAF8UGKnco61JSRxXMFtrGxWX0iBWK77qpJhRpakv5sssLT0JyLSOMoWCnWQEQy6vVonrOF5ZTB3yZjFtohA9DKVOcARkUjutmHNaphU0/D67bRHuwPNGnv5I2rBZ6xLDBYyBmOqe95RVViDNYETS18nxXZZh6gWmyYjrqx83h7CBWTMp89R0ShrE8/c2bOU6wCppznb5D1BPCg2koPUpZFzPjEimdJd47LOkmJt3MOXJAr5Q+rlTv7mdFb4vEcp2Q8qd5uklftty1vx51fGLsASuxaSLFhaRy8xBLoKBNcGfAfJObXEtqP6ogPqIPdLa/4x2xN0D1baaI2dMqpeAwfxeR0utaxM3FrQFtYyYaNUT0WNKQAfR6lMPU52km0p5lUFcDWPIDM4VuNgPWPRtnaaiblSgHP6ZQgFvIw8i6qJQx7rhXvH/pKAT1csdYi5m81yPVqa0HYBKqgPEA5OiBq7tazc4
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(40470700002)(46966006)(316002)(356005)(47076005)(5660300002)(2616005)(36756003)(83380400001)(81166007)(426003)(54906003)(36860700001)(110136005)(508600001)(44832011)(186003)(16526019)(2906002)(1076003)(336012)(4326008)(86362001)(7696005)(8676002)(40460700001)(82310400004)(70206006)(70586007)(26005)(8936002)(6666004)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 23:08:13.2552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a6f346-4a5c-4c09-c96f-08d9dba09194
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5304
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enable EFCH MMIO using check for SMBus PCI revision ID value 0x51 or
greater. SMBus PCI revision ID 0x51 is first used by family 17h. This
PCI revision ID check will also enable future AMD processors with the
same EFCH SMBus controller HW.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 1811bdc96363..1e8061c46a89 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -102,6 +102,8 @@
 #define SB800_PIIX4_FCH_PM_ADDR                 0xFED80300
 #define SB800_PIIX4_FCH_PM_SIZE                 8
 
+#define AMD_PCI_SMBUS_REVISION_MMIO             0x51
+
 /* insmod parameters */
 
 /* If force is set to anything different from 0, we forcibly enable the
@@ -229,6 +231,13 @@ static void piix4_sb800_region_release(struct device *dev,
 	}
 }
 
+static bool piix4_sb800_use_mmio(struct pci_dev *PIIX4_dev)
+{
+	return (PIIX4_dev->vendor == PCI_VENDOR_ID_AMD &&
+		PIIX4_dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS &&
+		PIIX4_dev->revision >= AMD_PCI_SMBUS_REVISION_MMIO);
+}
+
 static int piix4_setup(struct pci_dev *PIIX4_dev,
 		       const struct pci_device_id *id)
 {
@@ -339,7 +348,7 @@ static int piix4_setup_sb800_smba(struct pci_dev *PIIX4_dev,
 	u8 smba_en_hi;
 	int retval;
 
-	mmio_cfg.use_mmio = 0;
+	mmio_cfg.use_mmio = piix4_sb800_use_mmio(PIIX4_dev);
 
 	retval = piix4_sb800_region_setup(&PIIX4_dev->dev, &mmio_cfg);
 	if (retval)
-- 
2.30.2

