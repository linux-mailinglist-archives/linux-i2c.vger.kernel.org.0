Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 960864AF86A
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 18:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238297AbiBIR2b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 12:28:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238261AbiBIR2U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 12:28:20 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam08on2065.outbound.protection.outlook.com [40.107.102.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659E9C05CB8A;
        Wed,  9 Feb 2022 09:28:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVEuFpbbmXgIRYsaGO5um7myHiIlTo0TBcmQbsaJ9fwnmoZEaoySX//Di42HH4bR67KkBQoqBx0SjEUlP0gjP1IJRqEDtWF+I1RfIN9axu5y8M1dUU7BUymW2qFvqa7JHF8rb3ChPN8h8qGZU4oZGwQqB5XFcdZR9+D7Ez6UhqChvZJYyxOlzO3MFzYZsjh+mD9wplBw+U+30hENWlkDxPuBbu0ZEzjVuD759K8jWdFgoY2laOX/IVekw1G6FjsJYNm1hJEYM7jf9nSO1gAQiBSPzTKja3ZD7Gt78Mp/TPCsz4cwC779hM+xqiywXr5DJXdGi3qwOFK+bwRMK/eCtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV/W6SbKahNwBk6bVt+R0q812ZjuLl+ucHlQlectlSI=;
 b=mvz9lSbS4Qt1GwjGN/Rkxw+LgSf1TkphipGSZUzPBMb4hd6cTqRpfwVr5/upLIoOgWzvI4Z3Mvg0lvsh9Yg8N8J5uQUeUprDSDsQTjyEXDA3P74D9m/dqk0fK429OvtNXZuZWRMOrH0KAntZiY59QMtI9/gM6kriS7/A8MqTmQJEmbnoCjsFUeLuiMxMrnf28GBYV0tXjBwirvRbX/14o4YrRzqO09JFy4a31ZQDpdb8LoMFj0vwHBAEKTE0uCv9IjqR9v5kACEZEnoKNHPlSjCWdbz/7PPqaLY+voxCF7roAqZmnFyy1NnBEl5k3nZopdWyThipRmfzWyrf+TSMdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV/W6SbKahNwBk6bVt+R0q812ZjuLl+ucHlQlectlSI=;
 b=kaMMxJD6jDs4pNmUluSYA4i+nn4gpCS1tOlAVZR1okfJOrBNmLGOvKeLeIDJcYe5JHzWoWHs47EC1R78C+CgnKhFDfBevJdYDVyr1HpWUxK/94ObyPUxRnpK1C8ozsbDNK0DFKLMLAQpsdd8UiP6gXYCeKdTBABJhnYrk3Ym278=
Received: from BN6PR11CA0003.namprd11.prod.outlook.com (2603:10b6:405:2::13)
 by DM6PR12MB3865.namprd12.prod.outlook.com (2603:10b6:5:1c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Wed, 9 Feb
 2022 17:28:20 +0000
Received: from BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:2:cafe::77) by BN6PR11CA0003.outlook.office365.com
 (2603:10b6:405:2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Wed, 9 Feb 2022 17:28:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT028.mail.protection.outlook.com (10.13.176.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 17:28:19 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 11:28:18 -0600
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
Subject: [PATCH v5 5/9] i2c: piix4: Move SMBus port selection into function
Date:   Wed, 9 Feb 2022 11:27:13 -0600
Message-ID: <20220209172717.178813-6-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 61c926d1-cd11-480f-3276-08d9ebf190c1
X-MS-TrafficTypeDiagnostic: DM6PR12MB3865:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3865B8BBE0D3EC127F6D6092832E9@DM6PR12MB3865.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z8lYTGKuAj6uQ76JQgXfkObtbBuoecTwYiN1Z74e5kJ49drpUqypwHhgqKDdrcj5AiPLogxurIHMoP+R4AKqUNzKuhowe+9FC1AMHmAnI/A/uTrvoTmWf5RLSFqYdj9gyQfKTyZLmDoOe3sH8mfkkLA7gnbRHYhgh534zfR+/zmUlJJnZJX2J+9XElbENcmuegiJKYWGQ4VIfEbL5JBb5OpKIvHvDxhuWbWSqqoHWa+s/L1AflL/LN+oXQXLOVCv1sy0cjI8n4xRsbIzK8z2DfShijIZeqE5dVhu8Ni2u/tpiUO1lh7ybZ/rm0mZG2bUuN8DDkggc7IqQGQbI0WEfnPEXOm/xpKL2/sVg8w8O/x0HEtlr2YS80mdCGWu1b8KDWVlY8Xzpm5te8+k254x8zvZb4cSSt2DqoHRHHA/vcywROBT+jFpkDqGPMjMDb28JZKZjfCkYlVVwivXNgA0y7pLz2JK7LpOs3Z7+fNl+QLeCefRr5LkZQgewIAYZ+CdHgTEKPr9fxzQQoBul1iXss3F+qHgqjFf/Dqrmlkq0F9vVOhOSqvU9xB4P8lgNGlzN6pw1z5T3kIqHnmffsvyfmPwpyj1PZ1Q/9oK4VLcvmOdlJU4/DDDh/lh9LgaXocSAfn7GxZNWflVmgQaMJBNyilUuXDROiEZuSbGy4INIH4jJZoyQ8YiMrrJFwzcGrh0Eu8dWJID6ZhcHfmDdKuIwNnkGmUFxHwyTB2OY8uV0Y4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(4326008)(70206006)(83380400001)(2616005)(82310400004)(356005)(508600001)(81166007)(8676002)(36756003)(336012)(426003)(6666004)(70586007)(8936002)(7696005)(44832011)(40460700003)(54906003)(1076003)(16526019)(26005)(110136005)(186003)(36860700001)(2906002)(316002)(86362001)(5660300002)(47076005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 17:28:19.7237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c926d1-cd11-480f-3276-08d9ebf190c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3865
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move port selection code into a separate function. Refactor is in
preparation for following MMIO changes.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/i2c/busses/i2c-piix4.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index b7998eb44027..f4a262a7d199 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -698,6 +698,20 @@ static void piix4_imc_wakeup(void)
 	release_region(KERNCZ_IMC_IDX, 2);
 }
 
+static int piix4_sb800_port_sel(u8 port)
+{
+	u8 smba_en_lo, val;
+
+	outb_p(piix4_port_sel_sb800, SB800_PIIX4_SMB_IDX);
+	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
+
+	val = (smba_en_lo & ~piix4_port_mask_sb800) | port;
+	if (smba_en_lo != val)
+		outb_p(val, SB800_PIIX4_SMB_IDX + 1);
+
+	return (smba_en_lo & piix4_port_mask_sb800);
+}
+
 /*
  * Handles access to multiple SMBus ports on the SB800.
  * The port is selected by bits 2:1 of the smb_en register (0x2c).
@@ -714,8 +728,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 	unsigned short piix4_smba = adapdata->smba;
 	int retries = MAX_TIMEOUT;
 	int smbslvcnt;
-	u8 smba_en_lo;
-	u8 port;
+	u8 prev_port;
 	int retval;
 
 	retval = piix4_sb800_region_request(&adap->dev);
@@ -775,18 +788,12 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
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

