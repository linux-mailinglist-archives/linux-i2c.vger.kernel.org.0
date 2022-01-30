Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E924A3831
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 19:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355387AbiA3SnM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 13:43:12 -0500
Received: from mail-bn8nam08on2052.outbound.protection.outlook.com ([40.107.100.52]:3424
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1355240AbiA3SnH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Jan 2022 13:43:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwFg1DXau1jH28j090WhOSe370QXJ30KPuV0Z8depCMl7pQa1GszGhi8/2DCQoIbt6OwTA0gDV9N41NTVWsA1+zYIxCiUV+80RAAJ+SE1xRgnP1ybVx/624Hf7oZlToR0xPhSGDodsZN5NKOrm6jDwy+KvjSC0MmYAyhyYKPHA7B2nbOVJLqd8Oy4jViTvG3z57ra880y7TVXUnnFAdF9j+++TyZOGLzlb5U7/SDQMxSrSfdE7NgUKMy97YJ3yrIkXhM0x0BE/jc0wdkWi2bwL5fzoGF5G49r5s1n/RzUTjHYBmhEEI5rOlrvZFxqpDyhcbWcFp9h32zEtzLjPODQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqsqqnocdATKu4oo2WhkFwRf1vE3PAO06wWTWKXuHbo=;
 b=Nk77IdIvAOiU9OcFwAkE/aCWirM4YZ0dmLhvliC+tE6cmfTyFj84KgggKiHJMXcFMNg31BwXLSuwHEmOViColrH6wLrUKG9JkbROuSibL8ZReZ65L4hc6E3BsyUIOvScjl+4dE9x8XmrziFTRxFbAMEkueVJ3ZYw3lP7ebv1PXonjubiHMc+pjS7tXQeOZf6nj+A5Cjefj6XrjUWSjIoaAYOOXSESFHFGrkEJbeP22f883kk3oRPW+84+5ux8PZVE9+hvzYR9Tj3koHBP8JpIboxH0EbhydqaEf2c9/29Yp0SoC4ckRhX4cFDo1hYc+8mLJrOZW9f9xjU+B6A5+3Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqsqqnocdATKu4oo2WhkFwRf1vE3PAO06wWTWKXuHbo=;
 b=PQktqaoo4pdO6vDlqHEquJcBN+J04pasFHAGAN4aHhBCG5yIZvVbmlyErvInukMgfbkNSxLu2rviTP4liZI+xosBvNgDgZj+MeNlg4WhY+FaGGcZXfTVQjEhBriZOhXv8yOeFrck/co2tH0Dst7CEonbwdYL/wS3R5NdD1TTYBA=
Received: from BN9PR03CA0547.namprd03.prod.outlook.com (2603:10b6:408:138::12)
 by BN6PR1201MB2547.namprd12.prod.outlook.com (2603:10b6:404:aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Sun, 30 Jan
 2022 18:43:05 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::67) by BN9PR03CA0547.outlook.office365.com
 (2603:10b6:408:138::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Sun, 30 Jan 2022 18:43:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Sun, 30 Jan 2022 18:43:05 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 30 Jan
 2022 12:43:04 -0600
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
Subject: [PATCH v4 8/9] i2c: piix4: Add EFCH MMIO support for SMBus port select
Date:   Sun, 30 Jan 2022 12:41:29 -0600
Message-ID: <20220130184130.176646-9-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 67047805-a989-4e59-8876-08d9e4205a65
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2547:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB254722FDCF28CDBE98C3F06883249@BN6PR1201MB2547.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qyrdqHZkHVFXoMBcsOb74dfvuoQmznTOOkmEMzOtg7slvHukFEcgsD58qgee8qql/Rd7KFv1ad0xUc8ZMvtZayYmt9fc7h+H05NLE3VPqlJeHiTP6+aOmvAjPeBNNY9c5cfYQSJ79vtcf+dDKxBNgJ8O0sNNnt6TBaelgYd/ibpEfsvgSY28nL1UmcE5Kas1zaNQr8/KeaMGukJWWkCfwGvcO7YzaBKh/vi3FcEp2j4KbMZCtLMLSigD7emS+bZJjVQhJFeFJyl9O782kiqSf0nCX4N5nsCQA9t75WQ0C+MMrAqR+Y8vD+lLJDSwl81Y905Dwnp+a1gMh1VgnJUx9v3WTvAxTacQilCdW89we5hT71dgx0U1/DN8dqQXky08lt373UM75zR9t8WzWnJfawRcItdcLIanVJXnOQ8Z/9NA64V2GfcpSlzl+V3b01c4+5vLCTIIpsKnvuwNY6mi5SHzihSWlZl3yGglVsyPDzFXbt96tCdkVQ9aWX6FDfy1g+Yaus2Ke+zNpavrX+E644/pY0/w3JAJEHwR/upDgFX/Zqo6MSnFeiW9o4f4Ml0vI+M/abBr7ryNh1iWLxCYKh4vQTHEGVyqkKh+fCnEA8WTzhIMN3pp5WLcsD5tFRwuxdfTZ3/ifbNy4O8zExIHmQR09a56cqRN/VwwEh8zYRHlnTNxsvI7V3I3H6Q1XckFoSr230fonr/27YsHlEBQhYzCpW2T8cYTBCWfU8akaR8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(47076005)(356005)(81166007)(86362001)(83380400001)(40460700003)(508600001)(4326008)(36860700001)(36756003)(316002)(70206006)(70586007)(110136005)(8936002)(8676002)(54906003)(6666004)(5660300002)(44832011)(82310400004)(7696005)(336012)(426003)(16526019)(2616005)(2906002)(186003)(26005)(1076003)(2101003)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 18:43:05.5700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67047805-a989-4e59-8876-08d9e4205a65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2547
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

AMD processors include registers capable of selecting between 2 SMBus
ports. Port selection is made during each user access by writing to
FCH::PM::DECODEEN[smbus0sel]. Change the driver to use MMIO during
SMBus port selection because cd6h/cd7h port I/O is not available on
later AMD processors.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index a23c0327e1f6..c5325cadaf55 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -752,10 +752,19 @@ static void piix4_imc_wakeup(void)
 	release_region(KERNCZ_IMC_IDX, 2);
 }
 
-static int piix4_sb800_port_sel(u8 port)
+static int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
 {
 	u8 smba_en_lo, val;
 
+	if (mmio_cfg->use_mmio) {
+		smba_en_lo = ioread8(mmio_cfg->addr + piix4_port_sel_sb800);
+		val = (smba_en_lo & ~piix4_port_mask_sb800) | port;
+		if (smba_en_lo != val)
+			iowrite8(val, mmio_cfg->addr + piix4_port_sel_sb800);
+
+		return (smba_en_lo & piix4_port_mask_sb800);
+	}
+
 	outb_p(piix4_port_sel_sb800, SB800_PIIX4_SMB_IDX);
 	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
 
@@ -765,6 +774,7 @@ static int piix4_sb800_port_sel(u8 port)
 
 	return (smba_en_lo & piix4_port_mask_sb800);
 }
+
 /*
  * Handles access to multiple SMBus ports on the SB800.
  * The port is selected by bits 2:1 of the smb_en register (0x2c).
@@ -841,12 +851,12 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		}
 	}
 
-	prev_port = piix4_sb800_port_sel(adapdata->port);
+	prev_port = piix4_sb800_port_sel(adapdata->port, &adapdata->mmio_cfg);
 
 	retval = piix4_access(adap, addr, flags, read_write,
 			      command, size, data);
 
-	piix4_sb800_port_sel(prev_port);
+	piix4_sb800_port_sel(prev_port, &adapdata->mmio_cfg);
 
 	/* Release the semaphore */
 	outb_p(smbslvcnt | 0x20, SMBSLVCNT);
-- 
2.30.2

