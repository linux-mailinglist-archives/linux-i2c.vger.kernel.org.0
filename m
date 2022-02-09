Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 206B64AF87D
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 18:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbiBIR3H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 12:29:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238329AbiBIR3H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 12:29:07 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A958AC05CB9D;
        Wed,  9 Feb 2022 09:29:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCi1Q6xfhZGqDJY/6ArLHfr/LehDQYEhXaz6XgAlbc+kTe7ZjB7QHou5UsRm/S54rt4bokcXcEcD4XuADKzbBcq8LpZL1D4SiGBBMAas5R/PYs21/A7XJkIJF+IFF84PQ8mMk8wWSreIC8mFHhV3Y8DaLGOaHsjR5Z3Q3U2B0TkpG3JT+DHjjSLrW4oXR0fBLyb8UnGHtPtPy4PrtvDg4rtatqd7LdHnlXMO/mU+UUMCWWIyS9CJ4131zjPU/ehTcS+ggqKHA/3XqY+rybmkKHsqoVFQPuUXK8cuV74AyCGJeTzbXwGuaTGsb/qPtsHedF9PwOuHngMcsKHKYWA3og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZYrJ6CUz9M8w1LTs4Wc08HMqqviQwQQiAGIEXadI30=;
 b=TMt/unZAihjzqRMqWmraj56OHFDUUI96GjMMhnFZMMaqMuZVKnyrtcHiB2NThbSgSglfP/KSTNx/tZs5oC5iHKjhMNjkDS7BXKcrCQpiulNyht0PPY1txkulHcAjq4O0Hu8AJLsTq2bS/d1mYV/mYyN59zSmBGcBxtTFtC8GkVle3JzjCXEwpOtfv+nvzfLJd6kRgGEhE36O2DAOJdxR5ko1Byz9M7yUzkQLSnU+t082J5BmGfuWm5Cie/1qfJN49PLRpVsbowcPQ9pX5a8yL+QYZvV3U4NjbUA48CNLVrdxuBy0roHQEkk1gq36xPTyCpAiNlaNG5b4xZFsIPc18A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZYrJ6CUz9M8w1LTs4Wc08HMqqviQwQQiAGIEXadI30=;
 b=mwHYr2mt7W7TEEXBdWMgGdnpWPuM5Tq5mzHr1r+wxIpwptzgDMk2Kx6QAJNMXFatzvK+M6ul2D3anQZ6JThau4SFrTnKwprUV0dcrYAV2ctXdEHabXKVCmk7X6gjj+erwJk5pSgqasJyodfjbDcKJhUDavQwgDTYHjTrhYw4V6M=
Received: from BN9PR03CA0587.namprd03.prod.outlook.com (2603:10b6:408:10d::22)
 by MN2PR12MB2893.namprd12.prod.outlook.com (2603:10b6:208:107::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Wed, 9 Feb
 2022 17:29:04 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::f1) by BN9PR03CA0587.outlook.office365.com
 (2603:10b6:408:10d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 9 Feb 2022 17:29:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 17:29:04 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 11:29:02 -0600
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
Subject: [PATCH v5 9/9] i2c: piix4: Enable EFCH MMIO for Family 17h+
Date:   Wed, 9 Feb 2022 11:27:17 -0600
Message-ID: <20220209172717.178813-10-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 02d90a2f-4db3-4d96-4a8f-08d9ebf1ab29
X-MS-TrafficTypeDiagnostic: MN2PR12MB2893:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB28937BD44A0F9A7BF4148DDB832E9@MN2PR12MB2893.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /9P5I6g4nE5QP8dosn+kSNMwYjohHa2VhUJWuaplcgka7c6nSqUuirD2SK4cV7e1J09KMg15RF6lhuL3tAgXuLVOLZzs+WJd9pL35baZgd9V2c7Oepp2ESYMdUUl9FQhcRZ1RBKgX62MaK2mBRNf6eLbc2IG9FYme2GnZUTguFN7FODD3yzroW9TFz8rLehFTerAPwWYQBztl8cpI6klwEozonR3HPmaB8WvdzmYFMH26jfVfFytYLgvMWWNLlXWuvtIuR2THi83q6dGOYiH16rvBSb5xjgFBOXfojH28cewzo+prIRmVdrv8K2oIiMdG4AxpM9SRslfnQ37QuWvZ3BJF1Hr/dOgTeTNo9szViiGoe0s6mKJKCEVxVSiKb3BiUxlj9g9/HIqkAHjK+moWKx6QMbvAh9RLaSdkLi4XVYLkrIqgqrvuNjVYurRwG3AcEpOiKJ9hnkCQwbx30VsCrNoqMmQZhgQlHTEOakC6VYPVRArNeH2Na1z2ZSD+V7P4HuzoCo/b5ZHD9luih4hsFJ2ZA719doUHQT9Y4Jlj2pIMHojDj+jjguUuyKF5AmXf9nY4dQtjHo0cN5tXGK0r/9cQ7ySEts2BXQnKOjKXfdE9qDOF5eQprN4dhMR5MLB71RkF62OMqeDvLPNnYpiFtXlIXxqkCI5lEmu+Hx2DCJ4B10A93kplJBuxYUZsiRHersp/6hIZ4fiof4j263HK1VxiWISyaTqCAblq6Z+8D0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8936002)(508600001)(70206006)(82310400004)(316002)(4326008)(47076005)(186003)(70586007)(8676002)(81166007)(356005)(54906003)(110136005)(5660300002)(36860700001)(40460700003)(2616005)(26005)(426003)(16526019)(1076003)(86362001)(44832011)(336012)(7696005)(6666004)(83380400001)(36756003)(2906002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 17:29:04.0110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d90a2f-4db3-4d96-4a8f-08d9ebf1ab29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2893
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enable EFCH MMIO using check for SMBus PCI revision ID value 0x51 or
greater. This PCI revision ID check will enable family 17h and future
AMD processors with the same EFCH SMBus controller HW.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/i2c/busses/i2c-piix4.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 4789fc9ad270..ac8e7d60672a 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -229,6 +229,18 @@ static void piix4_sb800_region_release(struct device *dev,
 	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
 }
 
+static bool piix4_sb800_use_mmio(struct pci_dev *PIIX4_dev)
+{
+	/*
+	 * cd6h/cd7h port I/O accesses can be disabled on AMD processors
+	 * w/ SMBus PCI revision ID 0x51 or greater. MMIO is supported on
+	 * the same processors and is the recommended access method.
+	 */
+	return (PIIX4_dev->vendor == PCI_VENDOR_ID_AMD &&
+		PIIX4_dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS &&
+		PIIX4_dev->revision >= 0x51);
+}
+
 static int piix4_setup(struct pci_dev *PIIX4_dev,
 		       const struct pci_device_id *id)
 {
@@ -339,7 +351,7 @@ static int piix4_setup_sb800_smba(struct pci_dev *PIIX4_dev,
 	u8 smba_en_hi;
 	int retval;
 
-	mmio_cfg.use_mmio = 0;
+	mmio_cfg.use_mmio = piix4_sb800_use_mmio(PIIX4_dev);
 	retval = piix4_sb800_region_request(&PIIX4_dev->dev, &mmio_cfg);
 	if (retval)
 		return retval;
@@ -461,7 +473,7 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 			piix4_port_shift_sb800 = SB800_PIIX4_PORT_IDX_SHIFT;
 		}
 	} else {
-		mmio_cfg.use_mmio = 0;
+		mmio_cfg.use_mmio = piix4_sb800_use_mmio(PIIX4_dev);
 		retval = piix4_sb800_region_request(&PIIX4_dev->dev, &mmio_cfg);
 		if (retval) {
 			release_region(piix4_smba, SMBIOSIZE);
@@ -944,6 +956,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 		return -ENOMEM;
 	}
 
+	adapdata->mmio_cfg.use_mmio = piix4_sb800_use_mmio(dev);
 	adapdata->smba = smba;
 	adapdata->sb800_main = sb800_main;
 	adapdata->port = port << piix4_port_shift_sb800;
-- 
2.30.2

