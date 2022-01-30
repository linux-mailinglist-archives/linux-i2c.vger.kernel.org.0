Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39B074A3836
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 19:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347395AbiA3Snf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 13:43:35 -0500
Received: from mail-bn8nam08on2049.outbound.protection.outlook.com ([40.107.100.49]:62753
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1355240AbiA3SnW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Jan 2022 13:43:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RujLxaqX7UEejVhMO9iLrH67H8jCLwoPei7TiD7goL37GP4bXeldTww+nzA/mqnFBile/JzHfCAQxB4M8DYOJLHMosw4F2ckwQ+Kdh9wKSlaggWlI1upjkNG2QXd9ve4m+cDrP4rYqx9uCAuEEzKFLQ/NTd54dD/0DlKfx1NQPXvxwAXGgOwr6lsmtOR9K/xb9vb5OSIbndmfpWIZNgd62hGtakdPEX33tAgKOqVwIdiNYdI8pxurK6SR4zfDifSrzaESxqv14BVo++wHYeOgW1N/g5vh2psnR/nkEWeD0QaYC+WdZBfQq6ST4oBJigMnRhWfgSg1inuCPgej31sig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwjNVYOLjkNznwfFhqDbrqa6aY5Lhnesw+yLCV7E/GA=;
 b=WW2mZkH5/T0scEY1wjOVgnL43iU6dpd4G7OCih7M5XTmecGZhRi4m1CoO2zl6Y4Fhu4U8lYDBTt9nmEmn3y878+zNUclXJtEzTLToyKp3a7BnFPs64vOo2jkmLFjejooCoe8vL6aQ9KZEUJfEf5XPYq/in+nBoXCdB4/fiybFhzw+W9u2LLNYds3lnS0vaMeuETbwMAqoDRshMvxwhkRLjzJOseYIg3CUL5erMjLH1YvOvHIkGlBrqprXiQA+o+G5JmUCh1WdMl4MrkWS2Fbes4C1URq0SPDyDQNS+HW7BXchAoFw1uFZkrj3NYdTkimPeRYRxvxBA8qdtQB6aqJkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwjNVYOLjkNznwfFhqDbrqa6aY5Lhnesw+yLCV7E/GA=;
 b=MkZLsI11kx+d77tnY+Evx6vL2yGa+S4CxF4nWQNVgO1rEH32KRSzDIuDBVCYe4sEAxD180IT5gb12/BOJLgZoKoMO+bTmsYEC9Gk/g7rfdVJVLaHqt03+LmZEqNP3OGyOMx6FahwawyMc1gfQGNbDBSjsFv3WKFMXl6Cp8eVlSA=
Received: from BN6PR19CA0110.namprd19.prod.outlook.com (2603:10b6:404:a0::24)
 by MWHPR1201MB0064.namprd12.prod.outlook.com (2603:10b6:301:58::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Sun, 30 Jan
 2022 18:43:17 +0000
Received: from BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:a0:cafe::60) by BN6PR19CA0110.outlook.office365.com
 (2603:10b6:404:a0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21 via Frontend
 Transport; Sun, 30 Jan 2022 18:43:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT014.mail.protection.outlook.com (10.13.177.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Sun, 30 Jan 2022 18:43:16 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 30 Jan
 2022 12:43:15 -0600
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
Subject: [PATCH v4 9/9] i2c: piix4: Enable EFCH MMIO for Family 17h+
Date:   Sun, 30 Jan 2022 12:41:30 -0600
Message-ID: <20220130184130.176646-10-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 744a8fb3-da0e-43c1-1f30-08d9e42060fc
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0064:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB00645C368DA9B8E36E7E2A0D83249@MWHPR1201MB0064.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bo9z4QJImKDfacAik2Q8rMWygGesSq+pXrTUdFjNRJV3U1g/GCG2apYk/7KVFKfH2fvrSAjiNU1jKitO/FYB2YflLYBUJ4IpnFU41wI9JRhZZcKpDeGUOyUAa/kv0e/WudqFXrLHI4LQG9p+LQWgIRJQqKaqlUGxogoOiABTTSLldcl+f8spNFCs+mnkbmXXpE4RYyyzXLFkVGCq6wX9EL4OAsZGJDkQEtcm6Kwce6aAhV4aGJCjhaBxSRk3CKCj96Ppk0Gvlhqt+u8XWxrSpiVnavKQs5wAu6TRQXxRvI4jtJ5bMITEUIgpxjLJ/5i+4FhCwlMbDuMjtWHqFCw+CAl11eQ7WcpsPGrqCmxDEcKg3abLq0Peygty8Sdzn9eOsP7SiSkEFjF8qYjhME8Rcp8eqTGEktbv/IApt8BSlRFpP1v4z34JYAO9jsfnKc+74DvGFaiL1vPl6GiX8M7vsTJMXpT8WeOLs/9zy7SyFYF2rNkyo5o+Xi9vNniPdTCiuziMt0YSqujh3sGs/75Vq0N04MR9bJyrhepk+qfnPKcy2K9DidrytyrWqn2szcIuCDBArdYIe1SoGI2MoJsnovPmKDbh1VNn8FZ7R1IVJP/33g7sIbImNgUTpZ8Owu/KzLsKiPRdsHP0p+wBFgPZBChUcB8dvyUThqLvZs0CCcXZc65NkMHCDDkqSo7x6BWQuRnw7FEwLznlq4RzJlAMTgEBh5V05pKo33lpf2bN+I8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(54906003)(110136005)(5660300002)(336012)(426003)(83380400001)(6666004)(82310400004)(186003)(1076003)(26005)(81166007)(508600001)(16526019)(356005)(8676002)(8936002)(70206006)(7696005)(47076005)(70586007)(2906002)(36756003)(86362001)(316002)(36860700001)(44832011)(2616005)(4326008)(40460700003)(2101003)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 18:43:16.6233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 744a8fb3-da0e-43c1-1f30-08d9e42060fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0064
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enable EFCH MMIO using check for SMBus PCI revision ID value 0x51 or
greater. SMBus PCI revision ID 0x51 is first used by family 17h. This
PCI revision ID check will also enable future AMD processors with the
same EFCH SMBus controller HW.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index c5325cadaf55..6a9495d994bc 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -101,6 +101,8 @@
 #define SB800_PIIX4_FCH_PM_ADDR			0xFED80300
 #define SB800_PIIX4_FCH_PM_SIZE			8
 
+#define AMD_PCI_SMBUS_REVISION_MMIO		0x51
+
 /* insmod parameters */
 
 /* If force is set to anything different from 0, we forcibly enable the
@@ -229,6 +231,13 @@ static void piix4_sb800_region_release(struct device *dev,
 	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
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
 	retval = piix4_sb800_region_request(&PIIX4_dev->dev, &mmio_cfg);
 	if (retval)
 		return retval;
@@ -943,7 +952,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 		return -ENOMEM;
 	}
 
-	adapdata->mmio_cfg.use_mmio = 0;
+	adapdata->mmio_cfg.use_mmio = piix4_sb800_use_mmio(dev);
 	adapdata->smba = smba;
 	adapdata->sb800_main = sb800_main;
 	adapdata->port = port << piix4_port_shift_sb800;
-- 
2.30.2

