Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16C3494390
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 00:09:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357678AbiASXJF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 18:09:05 -0500
Received: from mail-bn8nam12on2068.outbound.protection.outlook.com ([40.107.237.68]:12193
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344249AbiASXHy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jan 2022 18:07:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hy4ikEbDWbTmHOH2FOix1w/LqAHFSNlJd/l/c2KnqPDAAIWALvbjGTRm6FSayzggmL7n1IEy/tOR6/aix3gl24jP7Hx4t8MS07i/HGzMFy6xWTBSd7DW5bD/KFdU6rhowPZ1+mppbUY8tqwdClB9TMAA4fHrEhk7Ft8PQxwy/My3DIYWZGT6doBRdXKC87P5RXhbPIJk2f+ePcqJoycKl9ZOAJHsJBlGeGYVkfVVwW7UImfY0B6d18w4MGtErB+Kt+pLl1LXvI5BpYb36kUQAX4R1m/gkVo9e5pyeaNuNdNZvPmlDFoURI0FzqzH+9i8/unwJjxfWSvYn27Mnn6jSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSRlG5cWCdyt+uHBRhTvmTZE6AM39ZPWAV5gu9yNEqc=;
 b=anDcQZLWHIX1pgvdbt/PVSnBCjIFr5DVjVlPYSVpmPdlkwGl7B3Cbxe7osmwRgKerLeAwaiRp8bqjff6bqIlizei80JWPg0Dlavp7CZ+TUXqZSBjIC/SSCnnSQFIZIdmF0C+ARpkUpNVOPQXKXevCKbFB9ti2lh38ZbdIvDaNq9MxBC/x8W9yBysXfWQ/Rsfj/HOkRrIn7Fckwx1ipJziESqVxCQMMoEyZ44VgNmxmk0K/SRrv7dfFo5EXCtKX857+eVtGoDsHdi3kGGP5lZH6hF96MSJhQZCtMELQmj22fcGcLl114F3AN1a1oqwJh2ugqcdKM0RRdjoDgOB0rzzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSRlG5cWCdyt+uHBRhTvmTZE6AM39ZPWAV5gu9yNEqc=;
 b=LqRbOl/YitNpYvL7I+hpIXSSbQFniMnJ4lldnoRZXV4lBjdJuoe14tG8jEE4Qsl/DTEOBUrlAZTmG1NhS6Yrz1zHXvXxFNdDYTE695cBYGoMquwQQN7WqAK9McnUV0K6g7rbBqMY11Y2gjzKv81phNPv2PdFctzkPQvbAivIygg=
Received: from DM5PR06CA0090.namprd06.prod.outlook.com (2603:10b6:3:4::28) by
 BYAPR12MB3302.namprd12.prod.outlook.com (2603:10b6:a03:12f::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 19 Jan
 2022 23:07:51 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:4:cafe::d4) by DM5PR06CA0090.outlook.office365.com
 (2603:10b6:3:4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Wed, 19 Jan 2022 23:07:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Wed, 19 Jan 2022 23:07:50 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 17:07:49 -0600
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
Subject: [PATCH v3 7/9] i2c: piix4: Add EFCH MMIO support to SMBus base address detect
Date:   Wed, 19 Jan 2022 17:06:24 -0600
Message-ID: <20220119230626.31560-8-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: b2403b0e-2a30-4f20-13a4-08d9dba0844b
X-MS-TrafficTypeDiagnostic: BYAPR12MB3302:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB330298B047964EA2252B400983599@BYAPR12MB3302.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0TM0rcIcTzUj5aa9Il8nsH10ZKTrAoj/WTWWags63X5pwFR66lQy3Gx1syipIIi/uLye3VG+Bi0vRSwiB5saxVTYTcFqwyxiZoaB03XanDg1V39mo/rNpgOxeh4kahzb5C+b1fzSjPUhleJ/CKmm8dGYgrSwXqZ2i6AWYwaZh52csoLGfu1g0YHdTZEaTT8VDOp+HROeKjH3KrvRdwyL88cdRSH9q7S3mTAYREDBTqTTFmgdhNbOrz/ia5rLRKzA6p1FHniO3C5luGjFUl/sooMYkIJWWLZZGtpTHTfgesTi09314i3uEUbkoo+W2cNBKofrwid8z0b/bNB4SRF/ozkmRqlXzm6xLU4aPoOIUJ5eqLZFC25DgSZttAbQH4r2ZsTkIs/Dyq/hJwwQym7o/y/wEvMKijXaluPXLjQ4qdhjXXrOZbizspUyH62eKT0WZMKSR7yTloTO6V0ynXCGFb5fYhL0/sLC6VI0SVASxrpYeNjAiLXhUVwsIyeaLTg8PMqtDHT/1Qf/r73qfiUVEL5zPjdkXmIAKXjlCOG0Dqyq3V5YmmLIwsB84cKmh4BzKy/bkDVvVCpZ2aVf2SjK2fKmTsvY1qBiWTRsqvWSHisRfyqvKZ/0Glin/4xRx1R0t+NZe1ybnz5YtDyk0fvgARTT5ZVk1olrnETsSN3d3kumCDiBt+gja3NE9JAEsY3zilvafvQNloKhoFYFqoWx2z+I3GCrvLiTNcUBVO5tAsojtaB8S/r0y4ITvGVNM/VfSLF81XKaYYEr0CQDsVmx7ixj+9wgmDqGaJHjQVvqJxhaE2auPZOA+BakjoRar8Ip
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700002)(36840700001)(46966006)(356005)(8676002)(508600001)(5660300002)(70586007)(82310400004)(70206006)(336012)(426003)(2616005)(186003)(26005)(16526019)(83380400001)(7696005)(86362001)(40460700001)(1076003)(36860700001)(81166007)(8936002)(36756003)(4326008)(44832011)(54906003)(110136005)(2906002)(316002)(6666004)(47076005)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 23:07:50.9617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2403b0e-2a30-4f20-13a4-08d9dba0844b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3302
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
---
 drivers/i2c/busses/i2c-piix4.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 7aa6ceb27e4b..b85f926451b8 100644
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

