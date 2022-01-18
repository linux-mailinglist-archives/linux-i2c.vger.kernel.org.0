Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68EAD49306F
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 23:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349848AbiARWMt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 17:12:49 -0500
Received: from mail-dm6nam11on2044.outbound.protection.outlook.com ([40.107.223.44]:58913
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1349755AbiARWMp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jan 2022 17:12:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0YHkjAgJlnhzeCu6ApRlnthopjrpJ0+Ar49SAgXhVO80XjR2eMiapo5yKaA0wyFhsTHhtiZ0apkvpg0DXK2RJp5s4H8oEZebwiI3c2kkUGs7ySwFDi9s/MSrAw8qjSezCHSGFvgU98SyHQPDet1qhF/lftFPR3BOzDlzfpXNndtYdsN7svJ+rmxu890KIed3l/Gohlw5xTV2Y6AkpAJ3aKRQ3fNbJxLMyROxrLS5xYSkkI7f+qVz6/hZZkIbNAVwK0PSxt4KzNfgLfVhM448un1rnE7oVn4qGl7nzq2N3HcKRsWv9SntL17O6ROs0Z/xTmvAz+Zd1LFiJIsZ82uOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DHprV6rk/9wU5uihe/1Vy4jQBWf5H38YBmCfHk8qCM=;
 b=odc542AjN8loHvX7GK6UUIhVHWHfi8b9BYJLJUXolTIF5FW32AF8FXoEK+UVE3VpM69Aao2uSJnIl0AI70q594TN4xJHwHUeBh92XUpvJcFlbJRNYXomPLNwN5RupKzUMYhwgcWXQIewFeRHCQDODvLWY0Fy6WWhJOL3PuOEHxZ1CDuEnrgdoCJ6hzDyt97ra0bI9yvIQ+NITXYczFSyZ7llw2ANseQTIxnit20x8Olk3C0DUyUKsf7CBL6dydelZmk2CzYU4wmrZgoj99mXok8rtzFNATR4zpGSsmsn4IybHCaNVNVab9AB+1AvFBzvQMfOfnmzgzNa143YSDQTuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DHprV6rk/9wU5uihe/1Vy4jQBWf5H38YBmCfHk8qCM=;
 b=jNsrE0RdwuDDRUEdYIvngn7NXNKxJf3yBXty7XtCK3GdYyAePVB/6rPVux9sg1lzUhVkI3rFHfr+pyeyKr1cRlpRd6JBEsMz7W0VRNcL4PJAQj+ukMjQCciySPNt0Z9CpoahE2cC4rgkn4nvD4C4hMCKS9C4oHYvj1Uq1tsFxic=
Received: from BN9PR03CA0855.namprd03.prod.outlook.com (2603:10b6:408:13d::20)
 by BN9PR12MB5211.namprd12.prod.outlook.com (2603:10b6:408:11c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Tue, 18 Jan
 2022 22:12:43 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13d:cafe::28) by BN9PR03CA0855.outlook.office365.com
 (2603:10b6:408:13d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Tue, 18 Jan 2022 22:12:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Tue, 18 Jan 2022 22:12:43 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 16:12:41 -0600
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
Subject: [PATCH v2 4/8] i2c: piix4: Move SMBus port selection into function
Date:   Tue, 18 Jan 2022 16:11:48 -0600
Message-ID: <20220118221152.300444-5-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 340adffd-3a9d-45e5-bf44-08d9dacfa660
X-MS-TrafficTypeDiagnostic: BN9PR12MB5211:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5211C142BEA5C854F7E73A4D83589@BN9PR12MB5211.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9vCxI9o3ylYstioHNxUpGiWOWsq9rNrTW/UruMQVaYoctpxn+7nzl852NBWJLinOBhSUdy6Da5kurdeyBdFjVshZTeeummlRnjTvcwRU/bx7lwgQAbO7/tOf51jh267d0po8GSb2XZaKIgjeWcWMCUr1Q0nJJXGzPnN8z8S2VAjA5xRl6yUF4tqxno4BhJYB13/IwHUCB2eEcizw903TYn21vPz2q03VHcA32Mksq2ZO/Rg3UazmOB5BXvVwXeFBx+NKVaianBFx7VmmQcmuXD//U2AiKd0CijpAzGk6dKo2j3JggYtUuuQUMFgE/Hfdd097WdHGaJuTOtxCm0oJkufN0LkfGqfa74kH+c8h7PVERqEGMT+g7O7aKDehhCAwZrLxF+iYwoW7SvXizLwId+zIxQrAiKfQd6N0kOClXDN20OBhWM2FlRJIk2KKoQ7O5mQwFCZUVglXw8qP/s8Rpc11FUXhrrA0ElzDJKCYEEV2hHsJjxG40LzHmYobfLoBxK5STySUI8gbvCJ5fiursXEIWVLht31R50Iu6NKd7eKG8qL4lVNbLilJFsIKDOu4Kb7FfhXnuVaU1KHtcjrCNyY1tjQDIYP9yZyiSvqN2q4ByAd/7asBXlRRbWwaF52i5BKh+v90btD6yzhic7l41/dOWgpJQvOA0zE4bLG7N5b7QMwSaLCwyu5rQTRy16qSJvKjyV2K6mB3UiuWkhk7B6qsJb5NZIW2B8uH7OkPC9mlEBZ5UeHkFODen/fAkqqwouDO4TY0OjrTTGjVc5hG8VHTmegk4aozp0T6HaExzW8b+3WIK2p6rxSIsDJukEzS
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(40470700002)(46966006)(26005)(356005)(4326008)(186003)(110136005)(16526019)(81166007)(83380400001)(2906002)(8676002)(54906003)(8936002)(316002)(86362001)(336012)(70206006)(36860700001)(7696005)(40460700001)(5660300002)(426003)(47076005)(36756003)(2616005)(508600001)(1076003)(70586007)(82310400004)(44832011)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 22:12:43.3610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 340adffd-3a9d-45e5-bf44-08d9dacfa660
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5211
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move port selection code into a separate function. Refactor is in
preparation for following MMIO changes.

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
 drivers/i2c/busses/i2c-piix4.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 35fcb61f4750..58b613b78c97 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -700,6 +700,19 @@ static void piix4_imc_wakeup(void)
 	release_region(KERNCZ_IMC_IDX, 2);
 }
 
+static int piix4_sb800_port_sel(u8 port)
+{
+	u8 smba_en_lo;
+
+	outb_p(piix4_port_sel_sb800, SB800_PIIX4_SMB_IDX);
+	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
+
+	if ((smba_en_lo & piix4_port_mask_sb800) != port)
+		outb_p((smba_en_lo & ~piix4_port_mask_sb800) | port,
+		       SB800_PIIX4_SMB_IDX + 1);
+
+	return (smba_en_lo & piix4_port_mask_sb800);
+}
 /*
  * Handles access to multiple SMBus ports on the SB800.
  * The port is selected by bits 2:1 of the smb_en register (0x2c).
@@ -716,8 +729,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 	unsigned short piix4_smba = adapdata->smba;
 	int retries = MAX_TIMEOUT;
 	int smbslvcnt;
-	u8 smba_en_lo;
-	u8 port;
+	u8 prev_port;
 	int retval;
 
 	retval = piix4_sb800_region_setup(&adap->dev);
@@ -777,18 +789,12 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		}
 	}
 
-	outb_p(piix4_port_sel_sb800, SB800_PIIX4_SMB_IDX);
-	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
-
-	port = adapdata->port;
-	if ((smba_en_lo & piix4_port_mask_sb800) != port)
-		outb_p((smba_en_lo & ~piix4_port_mask_sb800) | port,
-		       SB800_PIIX4_SMB_IDX + 1);
+	prev_port = piix4_sb800_port_sel(adapdata->port);
 
 	retval = piix4_access(adap, addr, flags, read_write,
 			      command, size, data);
 
-	outb_p(smba_en_lo, SB800_PIIX4_SMB_IDX + 1);
+	piix4_sb800_port_sel(prev_port);
 
 	/* Release the semaphore */
 	outb_p(smbslvcnt | 0x20, SMBSLVCNT);
-- 
2.30.2

