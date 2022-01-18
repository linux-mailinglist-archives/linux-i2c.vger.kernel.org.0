Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC7349307E
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 23:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344299AbiARWNX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 17:13:23 -0500
Received: from mail-co1nam11on2073.outbound.protection.outlook.com ([40.107.220.73]:42401
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1349909AbiARWNT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jan 2022 17:13:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1vzeeKRB+bEqm66Lr8FvAVnQQgiL0PRNh34qrrX/1oRaCxs1MopcNie788K29nnSSIB7GMlM/4ZfOUUKyHIsgpy9B3ZDrL73ETaTPqK6fHoK1m5iuqSxfg2I12AZnTbF01HaIfVpEsV+baJLSeggWyEM8tO06vMu+Ha/TmJ7wnjQHcUalByX9GEXXCAZBAGQY2i7yC83IQlSCvQZ+bMj8qVxjBdh1DfWfJeHMwYQkPi7BwHzAuMG2dnA41hfrMV58tJ67SK8v/1xciT7hZH4av6utM46OlyksXqiy4ZvnCezu39vz5y0GWedtSrVLS5ilQK8ZLAPw5Zevfic7mvSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlD9/B59mwzOsdsKJ70bFcth4ckKO81uMo11he+Eqr4=;
 b=PWwqIiRDf66GWz2RAwcGXk6cjk1SGMhTRHGG9QlCctswjsZz8e5yt7fhnDREmy0k5WxKDgv0af9BjoubN/ysgdEIesLeWSHgRu4MQxhz5v0NXYpggGw3Yp62/wgD923j9McPwgDJE717pY0SF4H9SJHHjvTrEWtx2zpIyEd7i+pfKQqbvWbDid8Y6u0e1f5KQFq9USfKRZIzK1tUKDTVm+l+LePPatWfmnexdwHr0i6o4TvxORZbn4h7kTTdN00K7J42Su4D3skH4X9PkyZkRAXl3NmlOECk8ZQMnsncemAosuxlRZzWnr33JqRX0xiw78Bc6XSv0NzFPKzPE/Enww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlD9/B59mwzOsdsKJ70bFcth4ckKO81uMo11he+Eqr4=;
 b=XaCa5eY6Ea7b1plouKcVic+OE0rd+BVruumWLbvQUcZQl9sx0Gs0V1uTRP4KZi4jNx2tBdRjClroEblcDxSoH3+KTet4olnuEuM9NlpKousBA1LIe2ffGqkIL81DbicT9kYDBTWLrr8WM0txapiy4wLxaBHtixcIiVRKFxxh4yY=
Received: from BN9PR03CA0052.namprd03.prod.outlook.com (2603:10b6:408:fb::27)
 by MW3PR12MB4571.namprd12.prod.outlook.com (2603:10b6:303:5c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 18 Jan
 2022 22:13:17 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::33) by BN9PR03CA0052.outlook.office365.com
 (2603:10b6:408:fb::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Tue, 18 Jan 2022 22:13:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 22:13:16 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 16:13:15 -0600
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
Subject: [PATCH v2 7/8] i2c: piix4: Add EFCH MMIO support for SMBus port select
Date:   Tue, 18 Jan 2022 16:11:51 -0600
Message-ID: <20220118221152.300444-8-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3036f66b-bc20-4bfe-cf4f-08d9dacfba38
X-MS-TrafficTypeDiagnostic: MW3PR12MB4571:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB4571185F8334B4491D2F7F8183589@MW3PR12MB4571.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tXhd37nWy1jboA62dWTWkZR2e7cXqAiVHS/yp5h3wvYgMP9ZxBLf+Mczb9mYoobYPb9CMUjzafwZiJ3KCrBfoo+P5LTud9BR964VexIYNvzX7cyZVLXzp+F4wZ0WJPMbhFXe/Zy4OV9AF6n0MKrBFa+4J0Rd/JzxKOYCTayLzDgRiqYpaS2456lHuqyrsFoLxCN9+EkxAdVqxEcaQiblvtBX6u5ICVO24Vfybh+P8JTLq98OOwOEn0NPLTgdz4KRtJ4XAHNuJ5ZJyCBqYU5Hqgs0w9f+xSwGJv92YzwezOKbUBdKqSJB6GioAXghBIPLjQoEcMemSJYdKt7b2kl60PQL7GhU3GsjeJvWOdsCMp12ncrWDiUhffkfjTcfPvUYRUb/TmvYysiLsBunBfgkdua94C/TZIZ0477uLYFcfo1grUWwOQ7n6Ktyx61NWwcOB5lI1avJAaw24Q+jifGzd6mkJRWUo08XEWvji04ryKIW0VdTTf0IysieZLWAx89fWhj4IGn0nl3x0M4V6SoccdY0W/Hr/w77TvbGyiEsHx6dJyP2WcfOHpQbrTYryW8Eosvc8t7OziBfx/PjTbAu/e636WP/yxetWwkOSQcJOna4EbKN9Gu6pHGRFr8BDrYonX2GjqOdvTUApsPjaiWJBt6PJCboH75XKjnsbBwKLQZx58ZzLUP0X+PFsoWvEUVXj/a/gTPE9Qa3xx6ck6aRWlIW7BYKT2EhpJnzcyOi9ValiBsVja57SALSkYh4TGOlIUz0TkwJi4chvF7Cntf1EJ0e6ShiIidgZNP1hFVx2e2+04DRfzimGpehx52opmnZ
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(40470700002)(36840700001)(316002)(110136005)(2616005)(1076003)(426003)(5660300002)(7696005)(86362001)(336012)(8936002)(54906003)(8676002)(70206006)(82310400004)(40460700001)(4326008)(70586007)(356005)(2906002)(47076005)(36756003)(16526019)(508600001)(81166007)(83380400001)(44832011)(186003)(26005)(36860700001)(6666004)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 22:13:16.6537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3036f66b-bc20-4bfe-cf4f-08d9dacfba38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4571
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

AMD processors include registers capable of selecting between 2 SMBus
ports. Port selection is made during each user access by writing to
FCH::PM::DECODEEN[smbus0sel]. Change the driver to use MMIO during
SMBus port selection because cd6h/cd7h port I/O is not available on
later AMD processors.

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
 drivers/i2c/busses/i2c-piix4.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 2937f3254c31..b59d2c74abf6 100644
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

