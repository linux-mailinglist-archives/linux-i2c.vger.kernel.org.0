Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB104AF877
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 18:29:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235373AbiBIR26 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 12:28:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238314AbiBIR24 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 12:28:56 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BFC9C05CB8A;
        Wed,  9 Feb 2022 09:28:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgiYl0m5btHxSa7PIeGdKiw18y0yWNi9iXyEPSrzY/Gbvuk1k0HXVtv8YHc514G1Pe4NjrMfsaQX0iNstdGiHSjpS2rcTjKp/inG/0zMkGagpZJX+6mge3VEo4bSsOVSNDWdqS0G1wEEzP9dSyUs7jc7ji6CxtPy3JT0SiYkNA3PCJJ8FwNmALXogGuFEi+jEsGhlCDFqrcCqpDKiyRn/UFw9nlTf5jVHhLTk0TR1LX1z1Tocmew39Wq4TRj+AHzREVsvrHjIryjrlwkp4SI7SQjvgaFYh5alZzZ/8xfmNSzuDaJD2M8JDotFECRO9VqDmUayu3rkmC762lnA0HALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRlYr0UbBNkv/2qxtTahTYT486tEi1zG10FLVxAf4z8=;
 b=R7fNcza+NmKUMbd9jAr+XADUgXjeYVVzMW/BQ3iT56lHGqATBzdoKElgNgiy/61l2JjtBfD3YS7kxEMxiI+2cPvhaZ7AG0xTl3UJcWWfH79p2fxDU1MBgK2MUGVhp383RPgkU0yA5Llb7Iahpx1fr7oEY0Kgf60PSXlY/uIV6ZegUE2jSYYNRG6oyeM8+c6K8KBIhhFT3kDZJAJBOP/c3ZfuhK3e3tKxkcobDdkmkG2lrNEoRj379aeDKali0/Ws8LbrDjvJSCP+PlL0X/BnGeHEN8uj8bBo7qHng0yFO0Pm0qeQF1SScbycOURDRmzEFbJIZlJ48m2PzcyVmX3oxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRlYr0UbBNkv/2qxtTahTYT486tEi1zG10FLVxAf4z8=;
 b=HilQ79JQQxKrvEO+0hNosjxhvl608fp2EaGlHcPggsCXJJ8qI1mucJ2RgAZUm9indVvFHSsgKYjjq6cDmyQ4eqq9GmNbN/5KremtLG9yd/xQApo2z8+ZsHhk03TJGw8Lix6AN5IIG90dbGHC6LoUqgQWuLoNsmOeSd0evFnuS3g=
Received: from BN9PR03CA0683.namprd03.prod.outlook.com (2603:10b6:408:10e::28)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 17:28:53 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::da) by BN9PR03CA0683.outlook.office365.com
 (2603:10b6:408:10e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Wed, 9 Feb 2022 17:28:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 17:28:53 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 11:28:51 -0600
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
Subject: [PATCH v5 8/9] i2c: piix4: Add EFCH MMIO support for SMBus port select
Date:   Wed, 9 Feb 2022 11:27:16 -0600
Message-ID: <20220209172717.178813-9-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: c220af39-d292-4f7b-911d-08d9ebf1a4a0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4125BB0EF0294B874475A8AC832E9@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EUa2SkW2Kv+nn/8xjPlfQ9T1P+wuwdJ5MgJqJdMUblvj/0JR/gZK3NjI1kEtI0AEbUv1PFMQkOg4vqhkRdnDKKM2R3jBZ5mBor5MBXtUFjGJLqWgVwjPJ3tF+XjP0RFiUBy5P/0o6OvhMnstQc6kGUBbQv8XAeEXw0s7O81qEo+keZRjfsrI2u/iKlytHIHHBIcykvoChBooXryx/mW7EEC9xXjt7nbMWXR115nkyo/J/VfG734S1rW3Fm4YRRKWDwbVgxVrtFWtx3r5rAs9Ah3/AbFZd/uquzxlEDln23qqzB7jvtmTiUoXA6CRrw0G4iseFNnb/v6Vj2vjXLw080+2J3ryt0EvPPRKazLH55cW5s4HqZLuwY175ycy1fK6Xo+s0JnYU8EbjwwkewZCezzxspgIclK5uI+/8ZT1SWhyZCUs7cX2K4xWTkQwBDj+lxyPOlydT6iZ+VLv9wCG6xUgXDkqLU6D2i7frWOuuaKGGdN4peMUA+kBVLGKIz96Txl6MS4ONYmhV+rJJ9jR7Mwk5N+ienn5urnLDCH8/xr4b0hcx7SS057b4985kUFUB9mJEDK54yMxtuiFoUCu3WjN6XhBKCcsn82KUHs99jsrS17snNaL1jtNoeMAfiLW36mMd431saxXznJXvLXT2Dq6VVePmFOUNMxXt7B0vz9EEx4+GsZ9abikagbrRkz7vGMyDI16qzmlKVz/9hqOPeqQk8FiDj+cQQBr/xq/FnU=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(336012)(86362001)(426003)(36756003)(316002)(110136005)(54906003)(83380400001)(82310400004)(40460700003)(2906002)(44832011)(6666004)(70586007)(26005)(8676002)(4326008)(356005)(8936002)(7696005)(81166007)(1076003)(16526019)(186003)(47076005)(508600001)(36860700001)(70206006)(5660300002)(2616005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 17:28:53.0486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c220af39-d292-4f7b-911d-08d9ebf1a4a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

AMD processors include registers capable of selecting between 2 SMBus
ports. Port selection is made during each user access by writing to
FCH::PM::DECODEEN[smbus0sel]. Change the driver to use MMIO during
SMBus port selection because cd6h/cd7h port I/O is not available on
later AMD processors.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/i2c/busses/i2c-piix4.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 7f312177eb27..4789fc9ad270 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -753,10 +753,19 @@ static void piix4_imc_wakeup(void)
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
 
@@ -843,12 +852,12 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
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

