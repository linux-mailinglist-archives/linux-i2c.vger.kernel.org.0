Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 405D649306A
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 23:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349810AbiARWMr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 17:12:47 -0500
Received: from mail-mw2nam10on2065.outbound.protection.outlook.com ([40.107.94.65]:60416
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1349848AbiARWMl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jan 2022 17:12:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjHXaXPEnbk4YaqJiJsCl62RU6titlG5wS+ZfC1+nfmvmNIZtIzAufBfGy7EUnZeoq3xvlvi0naSOjfokTeTZTuf0Er/4e75VVB87EHviuhtpwggPp11Qem1/EMwccr0oInWHTPdIHhwgOzunLYYaWEuo0EaCao4StJ0mMLOauYl5jp8sVNCqLGGBIkoRGFhUm4ZgNrEiul9cb6MfEbNfLqSZkynf4ADhPCXjHSx7NhNTVhIssT6CQ4iyj4sKW3jt/V65ZoPfGI4MsWMryYAB7KNxBLbRc0jDE9PRUJWjjP905W0vMLU6SxpLWHXmLGxFuwGsmGuGhIf4saN8Uo4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OS2wCj0KYmXcLOPHawEAsrAWeKsmDxnwKK9h6LA10e8=;
 b=d0rcGSJcpsCjGZxEtp/V6HTI2oo96zL2X5B2MmQPcxUM7ejPXiVEU5hF/dFtM7EsQAmi85N/dr3zbPhKlc+SLMHd/S9Y500GUcizHG3Va+57/GmtARgwHZi2coS2IqHfEKgbBrJcuW2Oe5WGJDJunh+QRmwGsn8GIjy9UgneSMpThmrfB/y7jIvPD4OlKftHoxIj8XRIlJ5wtrxtn6f68sVZuUzr7uoTCP9Ks7LKaRs5W4gfg9zMRDArtBc3sydfzzNZxmQ9a4uR9RZD6fbOXHcKOqlkBFbjZOd+hIieN8MBOHGcP1+zzpFAv9qNK+JMZYo7FxKCipDerNu1nnL0Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OS2wCj0KYmXcLOPHawEAsrAWeKsmDxnwKK9h6LA10e8=;
 b=2Snpo5jh0G+9JGDNHfdwLcaau8fHhJrpOowACc/8e6lG/8S2XPNev2s+Lb8AVyc9iPdsOXMxLzNNX5sK5Oyz8YFEre9gCkoqcgJhi272C1RkaqIqwN7uyI/PqetStI4Uf19vuAdORsxdch9H6lQZgq5kVdZZv50SNeDTIe1pkWQ=
Received: from DS7PR03CA0195.namprd03.prod.outlook.com (2603:10b6:5:3b6::20)
 by DM6PR12MB4619.namprd12.prod.outlook.com (2603:10b6:5:7c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 18 Jan
 2022 22:12:00 +0000
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::ab) by DS7PR03CA0195.outlook.office365.com
 (2603:10b6:5:3b6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Tue, 18 Jan 2022 22:12:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT031.mail.protection.outlook.com (10.13.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Tue, 18 Jan 2022 22:12:00 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 16:11:57 -0600
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
Subject: [PATCH v2 0/8] i2c: piix4: Replace cd6h/cd7h port I/O accesses with MMIO accesses
Date:   Tue, 18 Jan 2022 16:11:44 -0600
Message-ID: <20220118221152.300444-1-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3442dbb-44e6-4e3d-874a-08d9dacf8cd5
X-MS-TrafficTypeDiagnostic: DM6PR12MB4619:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB46199BD17189678C6FBA18CA83589@DM6PR12MB4619.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RybrXqB/2uN1Kd4wqe1Ys8hfzB7QlPeSzNs24hvdCLQys7+sRxJAWj1VKt/ZzrLSwk2L9PS2cp353a4w4OEk1Q40kQCq86HI7W12ZIj05xFHS4RJmre+YLL/ZGi3w65MTsu1bsxFhUSelQ+MN4Y/TuSMxECGTXenkGZz8sC7yTTKB7aT0GvnjHOjzFbMEfZ5RJ1kFTSqYOqfntJz3UD0g7ytVhdO264OV9BdEYUfrhjPu7i3oCQen8rDJIP/W5CEPNbm3FeOD5lleFhSyrOfkTFOLFmGiGZV5dZmHXiqqXQda2dsps6eR2IsKIIqJv6QwD6SzX//DQP7RHLPqmCKhcJp6oG6Ck08izIZoiFt2AwjD0mu3/D1yOFz5Spy3wAIT+loVLx5x2zpsLS80lLNpj3A6XOe/ITq//lQV6fgv154ulUphjCQjHu8DL2TH4HSQ0DCfkbL9xfzAwbPxWzGBYDRSy9YhRs071q6CG81EJhDcD3s8XsikSqANUCSKS2lcrp4DMOdeWnuTD7y6jMd4/uBXYHEtP3KaAJ1krS/NtpK+ruJoV2jvWMFa0ab2juBXUm7BRq7Wiohrb4y0NYeVrsABdKqiXlioqMXuu+yIyqaU0HI2GBuQ9D590P2W6/ocEvJwKywFey5Wv2S6foPyu+ByMHfIkMtA0XaaPCJ7PV5W50SsfcCWKHN/qxomG5PZjPjWw18GK6bvB37l94qA4vkWIJL/Mr1YQwU7EzKxA+FUccqHArDJGPP/yWi5cROFBx/RecVEmH2fVgR996HbwdJ95RbnK0fF4sn2ObbfWLbwEgc09Di0uhado/DnfhCuuwmnbU30BUOOTkeh2q+ydx9nunCABMofpLocI3pFXbOZ4PLrhkbGTKYlu5Ao05/cjoY9wKNzw2PCXLDx/lIcL86XCPYmfi+fKVk1YRUJB4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700002)(47076005)(110136005)(7696005)(83380400001)(54906003)(316002)(336012)(356005)(81166007)(186003)(2906002)(36860700001)(16526019)(508600001)(5660300002)(8676002)(36756003)(40460700001)(8936002)(6666004)(26005)(86362001)(70586007)(70206006)(2616005)(966005)(4326008)(426003)(44832011)(82310400004)(1076003)(32563001)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 22:12:00.4587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3442dbb-44e6-4e3d-874a-08d9dacf8cd5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4619
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series changes the piix4_smbus driver's cd6h/cd7h port I/O accesses
to use MMIO instead. This is necessary because cd6h/cd7h port I/O may be
disabled on later AMD processors.

The first patch replaces a hardcoded region size with a #define. This is
to improve maintainability and was requested from v2 review.

The second patch moves duplicated region request/release code into
functions. This locates related code into functions and reduces code line
count. This will also make adding MMIO support in patch 5 easier.

The third patch moves SMBus controller address detection into a function. 
This is in preparation for adding MMIO region support.

The fourth patch moves EFCH port selection into a function. This is in
preparation for adding MMIO region support.

The fifth patch adds MMIO support for region requesting/releasing and
mapping. This is necessary for using MMIO to detect SMBus controller
address, enable SMBbus controller region, and control the port select.

The sixth patch updates the SMBus controller address detection to support
using MMIO. This is necessary because the driver accesses registers
FCH::PM::DECODEEN and FCH::PM::ISACONTOL during detection and they are
only available using MMIO on later AMD processors.

The seventh patch updates the SMBus port selection to support MMIO. This is
required because port selection control resides in the
FCH::PM::DECODEEN[smbus0sel] and is only accessible using MMIO on later AMD
processors.

The eighth patch enables the EFCH MMIO functionality added earlier in this
series. The SMBus controller's PCI revision ID is used to check if EFCH
MMIO is supported by HW and should be enabled in the driver.

Based on v5.16.

Important:
This series includes patches with MMIO accesses to registers
FCH::PM::DECODEEN and FCH::PM::ISACONTROL. The same registers are also
accessed by the sp5100_tco driver.[1]  The registers are currently accessed
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

The piix4_smbus driver or the sp5100_tco driver can potentially fail until
the muxed mem synchronization series is present in the tree. The potential
for failure is not likely because the sp5100_tco driver only accesses the
FCH::PM::DECODEEN and FCH::PM::ISACONTROL registers during driver
initialization.

Testing:
  Tested on family 19h using:
    i2cdetect -y 0
    i2cdetect -y 1
    i2cdetect -y 2

  - Results using v5.16 and this series applied:
    # i2cdetect -y 0 
         0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
    00:                         -- -- -- -- -- -- -- -- 
    10: 10 11 -- -- -- -- -- -- 18 -- -- -- -- -- -- -- 
    20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    30: 30 -- -- -- -- 35 36 -- -- -- -- -- -- -- -- -- 
    40: -- -- -- -- -- -- -- -- -- -- 4a -- -- -- -- -- 
    50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    70: -- -- -- 73 -- -- -- --                         
    # i2cdetect -y 1
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
    00:                         -- -- -- -- -- -- -- -- 
    10: 10 11 -- -- -- -- -- -- 18 -- -- -- -- -- -- -- 
    20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    30: 30 -- -- -- -- 35 36 -- -- -- -- -- -- -- -- -- 
    40: -- -- -- -- -- -- -- -- -- -- 4a -- -- -- -- -- 
    50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    70: -- -- -- 73 -- -- -- --                         
    # i2cdetect -y 2
         0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
    00:                         -- -- -- -- -- -- -- -- 
    10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    40: -- -- -- -- -- -- -- -- -- -- -- -- 4c -- -- -- 
    50: -- 51 -- -- 54 -- -- -- -- -- -- -- -- -- -- -- 
    60: 60 -- -- 63 -- -- 66 -- -- -- -- 6b -- -- 6e -- 
    70: 70 71 72 73 74 75 -- 77
    
  - Results using v5.16 (w/o this series applied):
    # i2cdetect -y 0
         0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
    00:                         -- -- -- -- -- -- -- -- 
    10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    70: -- -- -- -- -- -- -- --                         
    # i2cdetect -y 1
         0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
    00:                         -- -- -- -- -- -- -- -- 
    10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    70: -- -- -- -- -- -- -- --                         
    # i2cdetect -y 2
         0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
    00:                         -- -- -- -- -- -- -- -- 
    10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    70: -- -- -- -- -- -- -- --

  Also tested using sp5100_tco submitted series listed below.[1]
  I applied the sp5100_tco v3 series and ran:
    cat  >> /dev/watchdog

[1] sp5100_tco v3 upstream review:
Link: https://lore.kernel.org/linux-watchdog/20220118202234.410555-1-terry.bowman@amd.com/

Changes in v2:
 - Split single patch. (Jean Delvare)
 - Replace constant 2 with SB800_PIIX4_SMB_MAP_SIZE where appropriate.
   (Jean Delvare)
 - Shorten SB800_PIIX4_FCH_PM_DECODEEN_MMIO_EN name length to
   SB800_PIIX4_FCH_PM_DECODEEN_MMIO. (Jean Delvare)
 - Change AMD_PCI_SMBUS_REVISION_MMIO from 0x59 to 0x51. (Terry Bowman)
 - Change piix4_sb800_region_setup() to piix4_sb800_region_request().
   (Jean Delvare)
 - Change 'SMB' text in  logging to 'SMBus' (Jean Delvare)
 - Remove unnecessary NULL assignment in piix4_sb800_region_release().
   (Jean Delvare)
 - Move 'u8' variable definitions to single line. (Jean Delvare)
 - Hardcode piix4_setup_sb800_smba() return value to 0 since it is always
   0. (Jean Delvare)

Terry Bowman (8):
  i2c: piix4: Replace hardcoded memory map size with a #define
  i2c: piix4: Move port I/O region request/release code into functions
  i2c: piix4: Move SMBus controller base address detect into function
  i2c: piix4: Move SMBus port selection into function
  i2c: piix4: Add EFCH MMIO support to region request and release
  i2c: piix4: Add EFCH MMIO support to SMBus base address detect
  i2c: piix4: Add EFCH MMIO support for SMBus port select
  i2c: piix4: Enable EFCH MMIO for Family 17h+

 drivers/i2c/busses/i2c-piix4.c | 208 ++++++++++++++++++++++++++-------
 1 file changed, 163 insertions(+), 45 deletions(-)

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

-- 
2.30.2

