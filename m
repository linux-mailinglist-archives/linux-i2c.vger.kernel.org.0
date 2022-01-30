Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9684C4A381A
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 19:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354887AbiA3Slq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 13:41:46 -0500
Received: from mail-mw2nam12on2065.outbound.protection.outlook.com ([40.107.244.65]:54113
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236688AbiA3Slq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Jan 2022 13:41:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dW4QoLRmsj2kjshtRJ4Ovzwm+Osj7GwhcoZQs+er3PIgZjGOJStghsVaVPXnHkxMKtqWz40lzDUHQv82MN+9W9a50IYzDcOIPbr3WL49LW/dptFRHbeW1ZDdgFwzfpRObAaC5NHSLLbQ21eZOp8VqPNFiLal1AEi1QoHTYokaEx9orbzPn+Cpyf4SpBRYXFtdlCVPORMsL+pc8VydKlNua6nb2CYi8Ido4gIxDhh2XOvuJJ6/LpFgQi6bdQYxZ+zNBzK56LidRZFluoDSO4ym+332SYVzCAXpR4fLprVxZxZzdy51MAIEcBayYLI9ehIxKJzeoiTQMTvDBZSaaI3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMVL7rLvbl3gX5/FAQzTyJX7C95fUnAVEM7VLG4Jalg=;
 b=FJDzcIvS/NB2Ko9RNM8lsuUqRUDgoPEv/Ds5+oanlVvIpNWcArfd/KdggGkZPePk/FMagjrN3xmp8uD2hmNYK8hTN6/o/IwyVO9cVHQxkD9+ulrrCUkaMMj9KwavDmHvpnExUZxf54iXOvO7/t6Oa+EsCH//lAhQQNGE2GfcQlrazEvWm9qUUiSFStPs7foczEMnrAz2s4qSG9QCvIxPcWeGFsFC8v4LO2jUb6t0Gm6vuYz88TLyIrSjedGzbLxpPKkUUe7bi7hRlZ+WlMeyxkshoW/WcgR09p+0DX7ZhiItS7xHbmEtt6MdDyRJgUEL7vKsTr5J/WYrGQU8mglrJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMVL7rLvbl3gX5/FAQzTyJX7C95fUnAVEM7VLG4Jalg=;
 b=BNebOwABB+MYgw5xAyd9xos5YX/MzDCnCYhZCFDkyU7r8ah2ovkfNw8ERo2/L5cRDQi1mllmTi+YRy/vqRMLYtHoVaSrY93KTlZzB1YEANjolH6JfF2kcxjEgjOOTlYbdj3F8qPtrVr5v0gkB9v4YfNsZ/QeVF808Ozrz8Q6sV4=
Received: from BN6PR19CA0050.namprd19.prod.outlook.com (2603:10b6:404:e3::12)
 by BL0PR12MB4915.namprd12.prod.outlook.com (2603:10b6:208:1c9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Sun, 30 Jan
 2022 18:41:43 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:e3:cafe::f4) by BN6PR19CA0050.outlook.office365.com
 (2603:10b6:404:e3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21 via Frontend
 Transport; Sun, 30 Jan 2022 18:41:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Sun, 30 Jan 2022 18:41:43 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 30 Jan
 2022 12:41:35 -0600
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
Subject: [PATCH v4 0/9] i2c: piix4: Replace cd6h/cd7h port I/O accesses with MMIO accesses
Date:   Sun, 30 Jan 2022 12:41:21 -0600
Message-ID: <20220130184130.176646-1-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e27f8878-b7a9-4ea3-fe67-08d9e4202974
X-MS-TrafficTypeDiagnostic: BL0PR12MB4915:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB49159AF6F0455241EE62B44883249@BL0PR12MB4915.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ELJ1XyTVC82OqRL5IQrtpz7WHQeNQ4EhOHJJDqKoNesNDRwZnRthe7ShEgN/WgeIIHZYwND+69xqHPAQIWnfp55DgtoETipho/pVzxcz8koOJs7fo1co8R6PsrqQN4dt0L7VT0NML9L7Xg1A+GLmdo0JZd5qb5PrjejNiD9Gf4Yyru1V10DLT1/2nsJi+4+5O+0Ggf9W7NePrEdfhxGRpTfsDF5r2bbie5Ma1Hi3dLDxED9wzZUerw/uimk89FP9hy9NNjMCiKRsdP19jisOaf8UBeLXwxT3sa1K7bYBgJ7Rms1hHwot0PfWLFzyOHK+owT16bC7yH9yKsfyZoDr4mJaiNYkFjBuqdGjtMyVEFybb4MT7W4g3DPQK6iES1cV2qSyUhI87Jpp37gN6sR60TzInaub4ig/RV+htUHOH7A8aM7tOS+eaB+7t41qEXpmTogCO+9Z192KRkyXO0cojo/rlUswOozsMM8hRLiyzcVZgn0jtpCTydcDRCai1F7/bJ8dmy4ODnSw4q67CKl+9dlBuhsjqucEOdAH6s3UzyAvbPStdRCdiaevajFXi2Ss058o54D5Q6V2YL5iWdDXLCg4ZG4b2fD/iKaIeoKpzamPDF4Z2404ot3d8K6zTw2RgaAtlcsm1GkM0zXRw39MxnQ5i59hWi+oxAuMGaoYzSebpK1nOIJf7zVpa4oZy2OsntyMFTlxUbQG6vWMaEzVSZZQXFW6rlMaUumTN55oTJcZrv+RuJ90ObdP3R3OV9l/465mw8K1iThR0yNWF7i6jPLVNLNyp0yRxFPOsu2sb2NGSc/tc+4priSh4iAktRjofr7MMuNhgmThMfnyr3WBxw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(82310400004)(81166007)(356005)(54906003)(110136005)(2906002)(5660300002)(316002)(36860700001)(966005)(40460700003)(508600001)(44832011)(36756003)(4326008)(8676002)(70206006)(70586007)(8936002)(6666004)(26005)(7696005)(1076003)(2616005)(336012)(426003)(186003)(16526019)(47076005)(83380400001)(86362001)(32563001)(2101003)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 18:41:43.1505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e27f8878-b7a9-4ea3-fe67-08d9e4202974
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4915
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series changes the piix4_smbus driver's cd6h/cd7h port I/O accesses
to use MMIO instead. This is necessary because cd6h/cd7h port I/O may be
disabled on later AMD processors.

This series includes patches with MMIO accesses to register
FCH::PM::DECODEEN. The same register is also accessed by the sp5100_tco
driver.[1] Synchronization to the MMIO register is required in both
drivers.

The first patch creates a macro to request MMIO region using the 'muxed'
retry logic. This is used in patch 6 to synchronize accesses to EFCH MMIO.

The second patch replaces a hardcoded region size with a #define. This is
to improve maintainability and was requested from v2 review.

The third patch moves duplicated region request/release code into
functions. This locates related code into functions and reduces code line
count. This will also make adding MMIO support in patch 6 easier.

The fourth patch moves SMBus controller address detection into a function. 
This is in preparation for adding MMIO region support.

The fifth patch moves EFCH port selection into a function. This is in
preparation for adding MMIO region support.

The sixth patch adds MMIO support for region requesting/releasing and
mapping. This is necessary for using MMIO to detect SMBus controller
address, enable SMBbus controller region, and control the port select.

The seventh patch updates the SMBus controller address detection to support
using MMIO. This is necessary because the driver accesses register
FCH::PM::DECODEEN during initialization and only available using MMIO on
later AMD processors.

The eighth patch updates the SMBus port selection to support MMIO. This is
required because port selection control resides in the
FCH::PM::DECODEEN[smbus0sel] and is only accessible using MMIO on later AMD
processors.

The ninth patch enables the EFCH MMIO functionality added earlier in this
series. The SMBus controller's PCI revision ID is used to check if EFCH
MMIO is supported by HW and should be enabled in the driver.

Based on v5.16.

Testing:
  Tested on family 19h using:
    i2cdetect -y 0
    i2cdetect -y 2

  - Results using v5.16 and this pachset applied. Below
    shows the devices detected on the busses:
    
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

  Also tested using sp5100_tco submitted series listed below.[1]
  I applied the sp5100_tco v4 series and ran:
    cat  >> /dev/watchdog

[1] sp5100_tco v4 patchset is in process but not sent yet. Below is v3
    upstream review:
Link: https://lore.kernel.org/linux-watchdog/20220118202234.410555-1-terry.bowman@amd.com/

Changes in v4:
 - Changed request_muxed_mem_region() macro to request_mem_region_muxed()
   in patch 1. (Andy Shevchenko)
 - Removed unnecessary newline where possible in calls to
   request_muxed_region() in patch 2. (Terry Bowman)
 - Changed piix4_sb800_region_setup() to piix4_sb800_region_request().
   Patch 3. (Jean Delvare)
 - Reordered piix4_setup_sb800() local variables from longest name length
   to shortest name length. Patch 4. (Terry Bowman)
 - Changed piix4_sb800_region_request() and piix4_sb800_region_release() by
   adding early return() to remove 'else' improving readability. Patch 6.
   (Terry Bowman)
 - Removed iowrite32(ioread32(...), ...). Unnecessary because MMIO is
   already enabled. (Terry Bowman)
 - Refactored piix4_sb800_port_sel() to simplify the 'if' statement using
   temp variable. Patch 8. (Terry Bowman)
 - Added mmio_cfg.use_mmio assignment in piix4_add_adapter(). This is
   needed for calls to piix4_sb800_port_sel() after initialization during
   normal operation. Patch 9. (Terry Bowman)
 
Changes in v3:
 - Added request_muxed_mem_region() patch (Wolfram, Guenter)
 - Reduced To/Cc list length. (Andy)
 
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

Terry Bowman (9):
  kernel/resource: Introduce request_mem_region_muxed()
  i2c: piix4: Replace hardcoded memory map size with a #define
  i2c: piix4: Move port I/O region request/release code into functions
  i2c: piix4: Move SMBus controller base address detect into function
  i2c: piix4: Move SMBus port selection into function
  i2c: piix4: Add EFCH MMIO support to region request and release
  i2c: piix4: Add EFCH MMIO support to SMBus base address detect
  i2c: piix4: Add EFCH MMIO support for SMBus port select
  i2c: piix4: Enable EFCH MMIO for Family 17h+

 drivers/i2c/busses/i2c-piix4.c | 207 ++++++++++++++++++++++++++-------
 include/linux/ioport.h         |   2 +
 2 files changed, 164 insertions(+), 45 deletions(-)

-- 
2.30.2
