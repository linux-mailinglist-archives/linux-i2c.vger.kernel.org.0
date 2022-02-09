Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 697054AF874
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 18:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbiBIR2q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 12:28:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238289AbiBIR2n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 12:28:43 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48BBFC050CC9;
        Wed,  9 Feb 2022 09:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEVA3uhbn1QVeP3xjYsbLHbQkOG2sVvxK4n4uG5DeheFCIilf/pjjEFwod/T7FcT+qdhH3y6lckj8kGmMbLid/bJxqB/GJgSzMXpfCdDUXVvAR6zhWNhzBVPu2Z4SG1kb6Nd7bVzVs8FsqvQVFdpT5Ii1t3MmVWZ713YVUZrl8xK6b/D9s7DeVQa0sZknGohjzkyzwREfS4hTXxfZT1Hb7VYy1p7y0YjB6N/ULb3k0e6Q85Toq4od2Sfy4aRKCExZZZ2H8oifFLEqjUvUedCj0OPcAycjBoVrc/BdcTu7KOMo5lakPayi8Xd9M65GgQ0c7zGIBFHrBtINFCVhqhYCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcHTNvXdp1HWM2HEbKsB9/8THIMq8XhGgNOtpNC37J4=;
 b=akgsfktcepMdJ7kk50HxQETrEqnteCLN0RsusQAkM1PDVJrCnrGicde9scJq5bm9AgDpMi8QSr9z7kjvJ8jCMYc65q1s0v8oOjBm1e+UlprAGVvnKGguTPPpzj6aP5SU1LT8ikG1HAlRwWr/M5B/eplN2xV1FFGMSIbRywax1mT60eV39TfOurjLuC495v9qLzxGV5IezSb1/Ix8jigEb0TMCBLWJp/s6zu8jGY1TZyJwmsU+NROy81kHFQKfIsiUwraYROy0tHUo0pVenGiQaRd0+RhomUH9Va60U7SgsvJAkpt03DOxy4V0x6b2lCztuHL840NUOm5BN7NMJL5Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcHTNvXdp1HWM2HEbKsB9/8THIMq8XhGgNOtpNC37J4=;
 b=WXiXqI2E5FSpqeHwIaBRgjKvnt2BHEL+RJDE5b7dirShn4ztTr56jEewVAPMnuTzQQveekPv2IUAFXqfWWL0lL7WJSblgFf5jf1qlEFcl8y94HeX+85Ctw/CMMg0mMw7Ood26/2YJRyNl9HX5VIKHSQbU2XpZO2T8XRyYmEImec=
Received: from BN6PR2001CA0029.namprd20.prod.outlook.com
 (2603:10b6:405:16::15) by LV2PR12MB5965.namprd12.prod.outlook.com
 (2603:10b6:408:172::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Wed, 9 Feb
 2022 17:28:42 +0000
Received: from BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:16:cafe::e8) by BN6PR2001CA0029.outlook.office365.com
 (2603:10b6:405:16::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Wed, 9 Feb 2022 17:28:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT051.mail.protection.outlook.com (10.13.177.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 17:28:42 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 11:28:40 -0600
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
Subject: [PATCH v5 7/9] i2c: piix4: Add EFCH MMIO support to SMBus base address detect
Date:   Wed, 9 Feb 2022 11:27:15 -0600
Message-ID: <20220209172717.178813-8-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: defbd57e-5cf4-404c-6812-08d9ebf19e44
X-MS-TrafficTypeDiagnostic: LV2PR12MB5965:EE_
X-Microsoft-Antispam-PRVS: <LV2PR12MB5965C48115069B7276BAF55D832E9@LV2PR12MB5965.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UX/yh9CgCJZdLLB7scuMykC5gR8jPSLm5CIclgQpT2Pu3j84P5RVkR4sJ/76ZpMH1lhlgYeZykpGcH6h1KXNtP5q0biKyq6ZyMILYRhbnuU/b0FKFgqZic8vP2sXTCl7ST1SCmFM/DCFHCS2ZVGKSZtRjPVNk7tXzrt66FfgdFhEoUi6RUcIIr3Jd9HzE5hXeDsvJ3y3bchD8rj9isyRjX2juYUOhYhdThXKf1kduFRY3YCC9HEvOVkCEVTyYXh8Weqn1ov7Qkp+xS0lq7c5xwZdebKrK/wQx6L2BcxqEgaJOz+4s9BxhsLa+KPqOth0wlGe6Hz1BOreOZHrA7B6uU19ehMtc85Srg7c8yvE3TvywSkRYLVR5nhPK6N/EgRxQU8xBA+n8JOG63fVeHwv4sLExAnR7VY7hIxoarKwHYMRb/mSgYER9+vPRAEpgZ5HBFELnpZzo21Xz6DPWr9WoPEtljBvpj/CZHKyRbqkcth5sfhWSuompLQRsowBZwZ5InjX4EFCxHpdvFrUNWbVlFDFzUvlpymbuISvzmgnY9z6LqZy9hgF77/0UAx6KKA+m8Z+ryUj5O3WRjqkFoEFGbeqGT4FWwM8aCpNS4oCqzo++6J2MzCNBVCBzk2rQwbtgRIDARwd0C4M2RHaiJ5JIIqZPUpK5sWcdX0flb+8eXvHujwC4iQG9kh/TVbf8hk/QW7rtjv7My3hGcT9PVW6LkrJ4v5yCgjokLUKvr1PEW4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(86362001)(36860700001)(2616005)(5660300002)(70586007)(40460700003)(16526019)(7696005)(44832011)(70206006)(36756003)(110136005)(8936002)(4326008)(356005)(1076003)(82310400004)(336012)(81166007)(426003)(26005)(47076005)(316002)(2906002)(8676002)(6666004)(508600001)(186003)(54906003)(83380400001)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 17:28:42.3939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: defbd57e-5cf4-404c-6812-08d9ebf19e44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5965
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The EFCH SMBus controller's base address is determined using details in
FCH::PM::DECODEEN[smbusasfiobase] and FCH::PM::DECODEEN[smbusasfioen].These
register fields were accessed using cd6h/cd7h port I/O. cd6h/cd7h port I/O
is no longer available in later AMD processors. Change base address
detection to use MMIO instead of port I/O cd6h/cd7h.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/i2c/busses/i2c-piix4.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index d06998f7b031..7f312177eb27 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -344,10 +344,15 @@ static int piix4_setup_sb800_smba(struct pci_dev *PIIX4_dev,
 	if (retval)
 		return retval;
 
-	outb_p(smb_en, SB800_PIIX4_SMB_IDX);
-	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
-	outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
-	smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
+	if (mmio_cfg.use_mmio) {
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

