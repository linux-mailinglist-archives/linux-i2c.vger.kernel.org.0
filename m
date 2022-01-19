Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 593C349439C
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 00:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357756AbiASXJP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 18:09:15 -0500
Received: from mail-co1nam11on2041.outbound.protection.outlook.com ([40.107.220.41]:47396
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344307AbiASXIE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jan 2022 18:08:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aT7TMuJ7vrpMaIari3WNPBFO/6gTY11N3LHWaTASs6Jgcb5T/I9qGni0evFQu6QUvhqlDWWvFOniS36GsvKTCkC3P1HEUfAuVc3p80nD0TxhLyOr8oWUqvhhg1XAMcrxoJu+PcrWJfpWKwsAy06d1ZrUGlQ+d2+owwzCu2ppnQFEEBPL/OjfsVW3EFBOeWbHbmLB/FSwjraWiKVc/Y1NTo6HjaQRapL8S38bApeahtttI35z6yCWSpaVhOGU2h5e7OjpvXVq1m7ph9atkiKP8Da9pnG1Cu0qRHj6FGOAMxJPYi5UyOnduFDXZiusGM5svPiZpzcBhLTkTieaohMC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wSpAD2KemZjot21SmFWBP8nWq5/A4vKoYw8VaZ8yFA=;
 b=dPD6YvSpXq7WcnUzqCmDgHJ5NiyOgrf8meYULBGa4sB5o2Zl+StaCvEOuycGIZiSGXyfWvZ5ksPsJ/rTQ+tnglhdG0KW6lGQt58UJ3lczf/7d8vplpf68tcLyCaiUieIAlVparn4E92dpyONSZWIp9lSmULrs4Lk74xR3k9a/ORyvMfkspaoHPaz3H/Zn9idOQ2jwFp42GbF5cx2Wff3FW7ITbgXFwFxuY7qK+rAGudeJyipXOBDE8iekz1u1xe5eXCChR/a3X/CVl7AzRju/Jokd1hY20WRutNVWeIqw3ZGGbXBeeVcAFSR+81I68WKUU5vYFewjZhRuAaxXtBDlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wSpAD2KemZjot21SmFWBP8nWq5/A4vKoYw8VaZ8yFA=;
 b=bqF2dmenjymR+gRvB/oD0Ptguqorg0hn0qgtRyjhB4SjnrRhTMFAM9PjIUekTmEHu69w3JPnqd0cqUZV+6GP2p1bIdHTuCstSfImSYGgqlA2gGgG/IaHfu9XUtX6437bee0SjMilPrHa2ck4Ut1110oFvXHHDzsdYKl2ESU5rdU=
Received: from DM6PR11CA0034.namprd11.prod.outlook.com (2603:10b6:5:190::47)
 by BY5PR12MB4147.namprd12.prod.outlook.com (2603:10b6:a03:205::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 23:08:02 +0000
Received: from DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::d) by DM6PR11CA0034.outlook.office365.com
 (2603:10b6:5:190::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Wed, 19 Jan 2022 23:08:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT009.mail.protection.outlook.com (10.13.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Wed, 19 Jan 2022 23:08:02 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 17:08:00 -0600
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
Subject: [PATCH v3 8/9] i2c: piix4: Add EFCH MMIO support for SMBus port select
Date:   Wed, 19 Jan 2022 17:06:25 -0600
Message-ID: <20220119230626.31560-9-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 20cc6cd2-4673-4f4e-ea83-08d9dba08aea
X-MS-TrafficTypeDiagnostic: BY5PR12MB4147:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4147AA9550642732B141BF0483599@BY5PR12MB4147.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4fS5XqijUU9JwPEyfsuwggNq7lQ1vmKHCsg9kcw4FDkqBrA0n7tDKkDjovb5UBJUM77Tm7ZIbZLNFKGpIUEzrEvNQCrnUT/pjfDIKhmWOGJqoBI0UkWFZSnctPO3Q35FxztMfDAXmKdrCy+yylcZ8obIuZcvYeJpcc47ANM+ChPpd4b9Rb7L9y6JIjtFlIGW7HaNzyjRjjn2b4v+y5QrAY7N3DVaplFtkBsZThZgY11Wl62/ZDGKzX0Lc4Hd04G0ClfZjf3mBIffw3I0t8VWQH2JGHl01XIGxRG2KNNbWfjmcTHgwuJ9B6ynqCoMVs97QU+zvpO5aQsqa87rjUf/bmQnqf/lMVbJgahcB9ahnC8vCO7VGADIcHI0hQHl70GoyF7t/B0WMJZ6t43boaodLWVOn79lYGuIjQeHkrxABsZmfOdiziXQ4BpqN9ezdblFQu2uDuzr4dybcMlVyxdw4K406kQZghHScYH+XEIFKrZPvf7gzMC9Bdf6Be459yDLxG3LsQeo50sYUbsei159v2qmZtDfC/OAw+Lcguj9I3LHVS26vVzHmAMjYUtJwrLLVJVdwPqJ2PQkX3boleCmOUbhExszk5lu3b9mbDp9bDGl0kRb8DY5KZT45eoHuOIS2SWXueOem1uIZqev79FK1oUYzb9FN/6D8kMxjcLafpU0VH9tEMZMLRdX5+d8MeRB7jXQLZLjy7yxOQz5jwh+WWdJXwbBmlGQzoBZabzozSqC0Ic0uSOECBh0NHKEVd0umjp58tScaMn2aQC0o9HA5biIFvOOTKeQI9j81XwA1A5JGuyumxIHUSTl69U9P++R
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(54906003)(82310400004)(8936002)(2616005)(36756003)(26005)(336012)(1076003)(83380400001)(8676002)(2906002)(6666004)(508600001)(110136005)(7696005)(81166007)(316002)(44832011)(36860700001)(426003)(40460700001)(70206006)(86362001)(5660300002)(186003)(16526019)(47076005)(4326008)(356005)(70586007)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 23:08:02.0599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20cc6cd2-4673-4f4e-ea83-08d9dba08aea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4147
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
 drivers/i2c/busses/i2c-piix4.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index b85f926451b8..1811bdc96363 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -755,19 +755,28 @@ static void piix4_imc_wakeup(void)
 	release_region(KERNCZ_IMC_IDX, 2);
 }
 
-static int piix4_sb800_port_sel(u8 port)
+static int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
 {
 	u8 smba_en_lo;
 
-	outb_p(piix4_port_sel_sb800, SB800_PIIX4_SMB_IDX);
-	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
+	if (mmio_cfg->use_mmio) {
+		smba_en_lo = ioread8(mmio_cfg->addr + piix4_port_sel_sb800);
+
+		if ((smba_en_lo & piix4_port_mask_sb800) != port)
+			iowrite8((smba_en_lo & ~piix4_port_mask_sb800) | port,
+				 mmio_cfg->addr + piix4_port_sel_sb800);
+	} else {
+		outb_p(piix4_port_sel_sb800, SB800_PIIX4_SMB_IDX);
+		smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
 
-	if ((smba_en_lo & piix4_port_mask_sb800) != port)
-		outb_p((smba_en_lo & ~piix4_port_mask_sb800) | port,
-		       SB800_PIIX4_SMB_IDX + 1);
+		if ((smba_en_lo & piix4_port_mask_sb800) != port)
+			outb_p((smba_en_lo & ~piix4_port_mask_sb800) | port,
+			       SB800_PIIX4_SMB_IDX + 1);
+	}
 
 	return (smba_en_lo & piix4_port_mask_sb800);
 }
+
 /*
  * Handles access to multiple SMBus ports on the SB800.
  * The port is selected by bits 2:1 of the smb_en register (0x2c).
@@ -844,12 +853,12 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
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

