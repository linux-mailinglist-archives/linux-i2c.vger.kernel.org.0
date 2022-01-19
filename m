Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18AB449438B
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 00:09:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232148AbiASXI7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 18:08:59 -0500
Received: from mail-bn7nam10on2060.outbound.protection.outlook.com ([40.107.92.60]:37761
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239264AbiASXHe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jan 2022 18:07:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/DrTtoIC4YkNDNFgFCPiIjHwYi1VdMiYg1hEPmUaKISB1f245ZVSx34SRi0MVF1pq//WyyHOgsxDhwPStzz3lp5hsIVKDEALGuCbSsKdh/3NkIWarn4HprCrwmqvcvkK6axt3WrlYWTy4L1PeTnE9tJJbXS030jrPZM5FOfdiI8GfeXJeyT4e973s/OVk/SEWP+yniMeVV5xOn3lssSfSsZiP1rcKrdI36kURzgEXWA+3BbR+58CEZjR+CWpdtFgUaFPq5AwJq7C+xeOcleUxVXAJqFc476p2TozuyxrU4w/pJuitYIEyfmkfKIRF9MPzMoEHi5Q7EV35W2AVP8xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqqBXJ73X1ZtC5+djf9hrRAsC6ZFF9ipSvfG6k/DpbA=;
 b=ba0cmiuLzz2Me9NaTy8V1w95adXCBBvzpitOS32qdlrhLqeEEn24/brCpKOJK/eWBX6K5ryq5XMFSHMo3WY6802JiVfn54DBG59oFJUIBjeCnLi5XNBqemC3Z+vtM72nA13+5XssIAYjd1vwHdttJU8xEEbw9PKdXek7MPooN8sWbWilSlmkEwr4f2XBDiSB/vKA7qpPxZqQdFjfFzUiNDBgjsLmDoCv73Io2G5gjmgjBlIbtm0sye55+yHXSOzoIweswiwuiDrA8R2QYF7q0AUGAWV3dIl9ocVTzPFFYm0ARbjIXs6ZB7oWuEg5mUL6q/KKEjPzA9glvxOIDQabdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqqBXJ73X1ZtC5+djf9hrRAsC6ZFF9ipSvfG6k/DpbA=;
 b=bNLPrH0emWk87pWeyS/0aJDc1GwpKa8l/qeXHChkM6WTXZRH/wXDPxkpQe+sJ9mzMTsOvj6cOyGCpDSb75671EkgC/JjZP4mqHhpGMDYl+hX9HiR2l9G3GZNDFQbwLjHzKDwHPx6hs9sMnPslEd+yKQHim7Vrx6KSyb8JykOXr8=
Received: from DM5PR16CA0018.namprd16.prod.outlook.com (2603:10b6:3:c0::28) by
 MWHPR12MB1663.namprd12.prod.outlook.com (2603:10b6:301:e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.12; Wed, 19 Jan 2022 23:07:29 +0000
Received: from DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:c0:cafe::b5) by DM5PR16CA0018.outlook.office365.com
 (2603:10b6:3:c0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Wed, 19 Jan 2022 23:07:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT022.mail.protection.outlook.com (10.13.172.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Wed, 19 Jan 2022 23:07:28 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 17:07:27 -0600
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
Subject: [PATCH v3 5/9] i2c: piix4: Move SMBus port selection into function
Date:   Wed, 19 Jan 2022 17:06:22 -0600
Message-ID: <20220119230626.31560-6-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1c0e6590-a4eb-48f3-5f9e-08d9dba0771c
X-MS-TrafficTypeDiagnostic: MWHPR12MB1663:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1663216827055C45C9C9F5F083599@MWHPR12MB1663.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NUTAl2bS2edLPdczGt4353mqH/hLRet53wnG9zp4TrejITlaFLX7Mvuk3sdMHBN9q1LEClu0nzII0/jk/cEgyI6reRyXAwFuImy2XCaJt21h3zRQR0XJxe0mEsi7ofFQtfrCChPs395CQZfZILpTjctazAe80R9OJ2g5OkhmVJtAvLTuMNo5zGqAWJAL1/XSGJWYxwXjsEJNOi0WoDC6aIT8WyPvMAXH98ij0jWDsamokMGVePXXvHGrU07mkbmPN0mDbHVIxjt7K+NoMviCYJMmsdL0epvoS9AwDrKREOiv8iTdBgHrun8AczjleBVZL8fBY/g2IAhZgygcYBt3PBSANuszzBtn+q28wQZcwSSBYlqwD3NszC/SDic7MW3CZfPaHYfOitaCtArBIjGHOj+6wO64iiUc4qRwVQ2mnrHmcW4/DaZERhDIkX4dV3+/Yg5d/vRJo9/iOsCWH13vKN8sSD+ceOt+aJc3Vi8k/X4Ssi6PVcbmavRjpJgC9r0huaqyQX8F26av2jpYA0D04VEBZoEHDu/rao9Vy0kILtQs7owBr88XBfku/JK/MRFSvfCuOCh5oVMivaeRxzXf4u6xoV/fDlNGq9FWbjhR8DWuFShZPkEXfbWWwqSWDmFVal7omkimlNxmgINrDK1sXo7eIYAPXYd7kQ0pYWS0hOeXuXXG+McNj1w2e1fqSk4icXb8NSiR1oB/wgu5j76low0meZIsiDdxlgjOWmE27L35iTupA8cbKmR+DKN0fZ/611ucQ8m0DHOUvQJfOYfJVqSc0iS8wBHRzlRGsdky5zjF1gyb9Kb9oi9Ny3wQNxgD
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(40470700002)(36840700001)(336012)(16526019)(508600001)(110136005)(316002)(36860700001)(70586007)(70206006)(54906003)(8676002)(4326008)(186003)(1076003)(40460700001)(2906002)(6666004)(81166007)(82310400004)(8936002)(44832011)(86362001)(426003)(2616005)(5660300002)(83380400001)(356005)(36756003)(47076005)(7696005)(26005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 23:07:28.7515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0e6590-a4eb-48f3-5f9e-08d9dba0771c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1663
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move port selection code into a separate function. Refactor is in
preparation for following MMIO changes.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
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

