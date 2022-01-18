Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEBEE492F41
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 21:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245093AbiARUWp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 15:22:45 -0500
Received: from mail-bn7nam10on2084.outbound.protection.outlook.com ([40.107.92.84]:44449
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233125AbiARUWo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jan 2022 15:22:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vbbx4qKnDA3hdA+XbWSHXHuPbA3g00Yj2trOhb4Ya1HgfLOcIQ/VfsQ/4EFOd56UYj3253KZCwzeW46Uma5WS0r4/sWuX+ozTXD8UIGQnf0rYdE/U77KaZFldvJE5ri4bQkH0ICbKvkazi5qNKdziP4vOTDL/YYavMGPoSNGbMJ1uYkJ7YmUt9LQuUz9h5cGqfAAynTUixm8/V6HUkHtXCTvX9+fAn99ayHqQ0bB/ZdHnBBf3WaRBIq5qBAQy7qV10aeN7lZDEXbMTSMp+CyMOYqh2T0Vyqv9b0NP2oozsLn5qi46kfNWMxSyePtBy8sL6vOAS/s8coE7/unJPUejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/qMMHGP9SGWT1MLSvdGh3D98BCJ+DM+gg45Q8oI6S0=;
 b=G1ZF5iZHqrTYYTo69Ah+rrzDpNjqEQenA7cU9mBIhfdIiuzYIeKDsRe+UMtk5w7Ldm4DBnxyFAgUkPVSnYnGUBpQoJPnWsfcX6s8/ehQDBFoiAx2ckM7qdlRluy7I1zL+7EvfzXUiya6SpPvSonGuUTBcb2XndtKG9HUqslruHRVHIU6iyIay99OYsTSMENNlPGhuxDu7kpniGZ8GDeTD8hbt3wPJTn5Y4A7Q3fqj70HzM0PEu9RqkhpVPNLwRpXfxytvQdUzs80//ki4tJrOj6cPYPXvZiIgFfE7Yeub9Z413jQHiK+/zW8ffmViO1KafDF1t+m0L7zdlr1VhZbFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/qMMHGP9SGWT1MLSvdGh3D98BCJ+DM+gg45Q8oI6S0=;
 b=gCKee4mmz4zA5hwyeGsaenExvvDDTo3x3vUJyr2kTkKP/vIHMg03qk085AWf65R1sN00zCPZ0kTA9z+ehVUnPmwUe2Bn4BkBS5gd6S2Kff8Mq5pI7Tj+T6sNXMKmOoeJuixf7LuKIPlvJJktMku3zwbGGSF3DPgJRAvVv8JqeVM=
Received: from MW4PR03CA0100.namprd03.prod.outlook.com (2603:10b6:303:b7::15)
 by BN8PR12MB3218.namprd12.prod.outlook.com (2603:10b6:408:6b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 20:22:42 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::50) by MW4PR03CA0100.outlook.office365.com
 (2603:10b6:303:b7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Tue, 18 Jan 2022 20:22:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 20:22:41 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 14:22:39 -0600
From:   Terry Bowman <terry.bowman@amd.com>
To:     <terry.bowman@amd.com>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <jdelvare@suse.com>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>
CC:     <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <Nehal-bakulchandra.Shah@amd.com>, <Basavaraj.Natikar@amd.com>,
        <Shyam-sundar.S-k@amd.com>, <Mario.Limonciello@amd.com>
Subject: [PATCH v3 0/4] Watchdog: sp5100_tco: Replace cd6h/cd7h port I/O accesses with MMIO accesses
Date:   Tue, 18 Jan 2022 14:22:30 -0600
Message-ID: <20220118202234.410555-1-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d40a751-c142-4c48-6b24-08d9dac04768
X-MS-TrafficTypeDiagnostic: BN8PR12MB3218:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3218712DE9A8CFE59118378F83589@BN8PR12MB3218.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hQP5B943ofzh/jKW0c4R9qd+jfwy3RDe2bBY02vFh6O+jBMv/bkbz7kV/PdmraWdLnUeWpMMMhR/cggow2Rkw/aUHIHUPK6zNHNA1etEhAo8mEkqDrcVwt8C4XlAW9ETJvhT5TZ0dTJ8p2Lb234h9A472g1CHQJ3aCi3CvchO8ojhjC/3uySbos1J7ZAVTR16jMqZb3Td54D6pLH7lnmYHCsD89xjPqPmMp95FWdKKmU5qMmRDlgG5khmdM18Q0OB5YMLIA370Ny65sl/4yYxSTtQkS7vBkXaXlMO8msfYxA//hXgEyabV55dqFj7rs2lTiK4M7tQplJBj4wlNE8SqbxurKv6KUEqzyxWDKks32tTQ9BnabSjFRXrTRB6YAIUc6rutJx6HlJ/Bqdj6hLHOZzLF5M+LoIthd8ImfOmAR1OzyH1rJL2BaFt8OpbKCeWx64GvSzRGJhlSSdwfRssHnpsz/JQHytQq2HyEyHH1E+3KApMOoMor8I/r6gdLCZB+VaMRqMRvphQ1zrcmpE2/ToV+dv05cRiwJF+bf+JDwW4FUP8iNuZ94p9dQNZB6WUSCAqVrgAP01CvtVHX4rM/oc4/L/OVL3mfBsfZ8VHWJWiqABfEDt/vVa4MJSUvRJdJ9GFj2bsbNjfdxwODE6T9jo9yqPeD1e3cZvnP8w3ID+kPI5r1DLmNNuXoJI84Ik0/ZkGzHTFk17sff2HWtlOuElCrNcLH5taS2lgbSVMdpszsASaNI03vxTzagUFXoofTLU0xQ9vH+sHTGzihTAcFfa6M39oz7cm9cexIJTR6xBDPoYvrrDKlK1fY2Mls1zf0rmlbcYr8Xqd/TSvrbGqnjWh+RsBgOvQygFTq3CSlM/Y3wQ3CIl+kxVmvzLuT2BOvtinooRyZJmnrmWqo2HDu1E5BvtDwfZWhOhhlHIie4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700002)(36756003)(82310400004)(36860700001)(54906003)(2906002)(426003)(8936002)(26005)(336012)(5660300002)(47076005)(40460700001)(8676002)(508600001)(1076003)(6666004)(356005)(83380400001)(81166007)(7696005)(316002)(110136005)(70206006)(70586007)(966005)(44832011)(186003)(2616005)(16526019)(4326008)(86362001)(32563001)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 20:22:41.4518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d40a751-c142-4c48-6b24-08d9dac04768
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3218
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This driver uses cd6h/cd7h port I/O to access the FCH::PM::DECODEEN and
FCH::PM::ISACONTROL registers during driver initialization. cd6h/cd7h port
I/O is no longer supported on later AMD processors and the recommended
method to access these registers is using MMIO. This series will replace
the cd6h/cd7h port I/O with MMIO accesses during initialization.

The first patch refactors watchdog timer initialization into a separate
function. This is needed to add support for new device layouts without
adding complexity.

The second patch moves region request/release into new functions. The
request/release functions provide a location for adding MMIO region
support.

The third patch introduces EFCH initialization using MMIO. This is
required because the registers are no longer accessible using cd6h/cd7h
port I/O.

The fourth patch adds SMBus controller PCI ID check to enable EFCH MMIO
initialization. This eliminates the need for driver updates to support
future processors supporting the same EFCH functionality.

Important:
This series includes patches with MMIO accesses to registers
FCH::PM::DECODEEN and FCH::PM::ISACONTROL. The same registers are also
accessed by the piix4_smbus driver. The registers are currently accessed
indirectly through cd6h/cd7h port I/O and both drivers use
request_muxed_region() to synchronize the accesses. It should be noted the
request_muxed_region() uses a wait queue to sleep and retry taking
exclusive access if the port I/O region is busy.

This series uses request_mem_region() to synchronize accesses to the MMIO
registers mentioned above. request_mem_region() is missing the retry
logic in the case the resource is busy. As a result, request_mem_region()
will fail immediately if the resource is busy. The 'muxed' variant is
needed here but request_muxed_mem_region() is not defined to use.  I will
follow up with another patch series to define the
request_muxed_mem_region() and use in both drivers.

The piix4_smbus driver or the sp5100_tco driver can potentialy fail until
the muxed mem synchronization series is present in the tree. The potential
for failure is not likely because the sp5100_tco driver only accesses the
FCH::PM::DECODEEN and FCH::PM::ISACONTROL registers during driver
initialization.

Link: https://lore.kernel.org/all/20210715221828.244536-1-Terry.Bowman@amd.com/#t

Based on v5.16

Testing:
Tested on AMD family 17h and family 19h processors using:

cat  >> /dev/watchdog

Changes in V3:
  - Remove 'addr' and 'res' variables from struct sp5100_tco.
    (Guenter Roeck)
  - Pass address directly to efch_read_pm_reg8() and
    efch_update_pm_reg8(). (Guenter Roeck)
  - Reword patch descriptions. (Terry Bowman)
  - Change #define AMD_ZEN_SMBUS_PCI_REV value from 0x59 to 0x51. This was
    determined after investigating programmers manual and testing.
    (Robert Richter)
  - Refactor efch_* functions() (Robert Richter)
  - Remove trailing whitespace in patch. (Guenter Roeck)

Terry Bowman (4):
  Watchdog: sp5100_tco: Move timer initialization into function
  Watchdog: sp5100_tco: Refactor MMIO base address initialization
  Watchdog: sp5100_tco: Add initialization using EFCH MMIO
  Watchdog: sp5100_tco: Enable Family 17h+ CPUs

 drivers/watchdog/sp5100_tco.c | 335 ++++++++++++++++++++++------------
 drivers/watchdog/sp5100_tco.h |   6 +
 2 files changed, 227 insertions(+), 114 deletions(-)

--
2.30.2

