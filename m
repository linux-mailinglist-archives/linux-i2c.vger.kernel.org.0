Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 045B449307A
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 23:13:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346275AbiARWNP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 17:13:15 -0500
Received: from mail-bn7nam10on2075.outbound.protection.outlook.com ([40.107.92.75]:18368
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234388AbiARWNJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jan 2022 17:13:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASSODMmQ5QnzleWTNinalTx/lZkKn8mMjK5BRDj/ghm2tvkVCWoKMbPPHzOOeYSXH6TOelP/W7hwxqtnf3Os1zp+yO17qeuv5hsC5njZDmagwlApXnJwJVA7dfh25/n+J/phhpdc8ltHsVUZySVP3FUxqtgvF9ppEJLcirVTLx1VLBlYm6p+4B08EY3eQnRTbC/xH53rkuFTYP4b98tj21ag1oO5WvFiSPJZWTUjbBJUqzuZEVOXxdlEEt9+qKJMlj0bNVcJkaPutFvNeg9uJ7SmjEqzvgcN4qqdCCzewevhtgOv/RC/+8CfFldjFNGwwApDPsUVL0MlMTctuVWVQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPwRuTUMdOIYd6TaU50MwAZLZb8EHndtlyNKgz9xwY4=;
 b=RJeaHUFZm/ZMVb535zolSKm6OknQdBhXhO9GrAL/KGSbYRhApaK/dKSXwAi5rJjImfV2w0z85xqOB3FnyEjH35lj/TyGnxnKHjdBml1YzFTtjeErVsB8GQFcBFvr+mqYVSE0/bsJ2Miz3GMCvViYdSiZzYEtaQ8Rj14S4FwBSkbGLaoRNlAry7HonW0ULHky11xIWScaYpmkcbi3yHLUXs0c9rH411PgMDyjJL56VPNvPdyOQyVR8BA/lbb0i0CTMtTma3H1RUq2GNZgmBQivbWCk6ooQTBCxdFJRj1N7Sqhr2pSOhXYlwvTAQxZuqo/GoNZXRf1k6A3uH+/Wl9i3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPwRuTUMdOIYd6TaU50MwAZLZb8EHndtlyNKgz9xwY4=;
 b=DMe6ForudIV/f7oAB4+lQgwC4hridMi9t8tdUowPzjsfWkq80Dm8JAvOL4hV02kB/V6+FS7YvIr1Pd+2yH9nCwcrDzrlAWQREvncLXyiWP0f2tOj8GhJq37RYUBRibtecXg5m8EseX9aEqfVOKkFFF6MV5rzm1ZbRc2M/JmQoTE=
Received: from BN6PR11CA0017.namprd11.prod.outlook.com (2603:10b6:405:2::27)
 by BN8PR12MB3250.namprd12.prod.outlook.com (2603:10b6:408:99::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Tue, 18 Jan
 2022 22:13:05 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:2:cafe::be) by BN6PR11CA0017.outlook.office365.com
 (2603:10b6:405:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Tue, 18 Jan 2022 22:13:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 22:13:05 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 16:13:04 -0600
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
Subject: [PATCH v2 6/8] i2c: piix4: Add EFCH MMIO support to SMBus base address detect
Date:   Tue, 18 Jan 2022 16:11:50 -0600
Message-ID: <20220118221152.300444-7-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6f7e6d0d-90d2-4d05-926c-08d9dacfb3a1
X-MS-TrafficTypeDiagnostic: BN8PR12MB3250:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB325001A43C7C444222AAF06083589@BN8PR12MB3250.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dslWlQXeh57zEWj5xc/JBpXjTJF/W0vov4x6Rant5o3CxmP5+0GLRfrbN59I0TwhLVPt04UBrzs8Euz95b4vWuGXEEcb2XyAblRIM6oHkJtchbS6RZUaan8EMeq4tXU7VtOui5zOG9LH2H4BiMgHdPqU18PJpWl+YcVuqbrdYQBQtZUqwHVIQF03yz0oX/DPokpNi4hBVGQxVOJa4T7K0f/NGWv5cMJBKLoiQJ7dVS0q8NXC9VDT8tS8ImzmNbOqHuVlxvZpe9NZx0+a42dLR2FCUJT85LSHuPt8hKEzN5Q2RLktQ0SiB7o6e1YcPsnhPBYgDWsSqCKnPQN1KSwg8bL1IywMj3coTXkGiTKrSPar0WXvd7RBSX1Ubd/Xtr6cshilw9IrjBB0z2IGmzTpFuTg57yuQn6CvjFa0vmzM7XTtPphq8ft708/21GQDkeXFfvOmB4OyFGvhJL/wg1rfi4Ts/Q3IyPMv48i51XAboLb+1ReZdAfDosfJTDv9vIGrvt6qBW6d0P0ldOGAXTvtREXT9Bg3zcL9q+jE4TVslUlqXfxvJvRQ64g5yzBWPIEl3kCzTMsj0u6UUDMvKIgZdQBb7nEGOUSqlduDx6/ef/XZd3cEtRlTI4ycRuKjMTeXR4rb74zQQ6oKHjmP+Ab/SgNPxHiNaLUEpC5mOCC0z8ZMBfU+l1Xfz+uEZ3KJ+c7L3TYXF7XLhR5bovxfngrxNawhF8/vlOJd9B7ILv2ii9ane/YHqosGQTvFzG8rJtdDCe983NVGjlBPUhlQgL04Kn9l2mHDvKoJjnYceNbUd5s7Farw7roeQNHdkbxg0+r
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(83380400001)(70206006)(81166007)(426003)(70586007)(356005)(2906002)(40460700001)(1076003)(86362001)(7696005)(82310400004)(54906003)(316002)(110136005)(36756003)(5660300002)(2616005)(47076005)(508600001)(186003)(44832011)(4326008)(8936002)(6666004)(26005)(336012)(16526019)(36860700001)(8676002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 22:13:05.5963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7e6d0d-90d2-4d05-926c-08d9dacfb3a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3250
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The EFCH SMBus controller's base address is determined using details in
FCH::PM::DECODEEN[smbusasfiobase] and FCH::PM::DECODEEN[smbusasfioen].
This code also writes to FCH::PM::ISACONTROL[mmioen] to enable MMIO
decoding. These register fields were accessed using cd6h/cd7h port I/O.
cd6h/cd7h port I/O is no longer available in later AMD processors.
Change base address detection to use MMIO instead of port I/O cd6h/cd7h.

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
 drivers/i2c/busses/i2c-piix4.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index ffb1367dd852..2937f3254c31 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -98,6 +98,7 @@
 #define SB800_PIIX4_PORT_IDX_MASK_KERNCZ	0x18
 #define SB800_PIIX4_PORT_IDX_SHIFT_KERNCZ	3
 
+#define SB800_PIIX4_FCH_PM_DECODEEN_MMIO        BIT(1)
 #define SB800_PIIX4_FCH_PM_ADDR                 0xFED80300
 #define SB800_PIIX4_FCH_PM_SIZE                 8
 
@@ -344,10 +345,18 @@ static int piix4_setup_sb800_smba(struct pci_dev *PIIX4_dev,
 	if (retval)
 		return retval;
 
-	outb_p(smb_en, SB800_PIIX4_SMB_IDX);
-	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
-	outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
-	smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
+	if (mmio_cfg.use_mmio) {
+		iowrite32(ioread32(mmio_cfg.addr + 4) | SB800_PIIX4_FCH_PM_DECODEEN_MMIO,
+			  mmio_cfg.addr + 4);
+
+		smba_en_lo = ioread8(mmio_cfg.addr);
+		smba_en_hi = ioread8(mmio_cfg.addr + 1);
+	} else {
+		outb_p(smb_en, SB800_PIIX4_SMB_IDX);
+		smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
+		outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
+		smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
+	}
 
 	piix4_sb800_region_release(&PIIX4_dev->dev, &mmio_cfg);
 
-- 
2.30.2

