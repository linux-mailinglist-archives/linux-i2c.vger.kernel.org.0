Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D954F494365
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 00:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343729AbiASXGl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 18:06:41 -0500
Received: from mail-dm6nam08on2087.outbound.protection.outlook.com ([40.107.102.87]:5708
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243284AbiASXGi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jan 2022 18:06:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+GJkjF5S50YP3MTfYy8E+qEP1ecZ6iGwBPvyCeUaqkwnY+zBauK8+4TWPOIqQLyFJ7mTb6iIIF8WQTKRhrJr4sgmdd5qe/aUpNH/FrPZt/0zIO+T7mQ9XNTGUT/LNN4aFuUwXSHZMcFDzAF8tobE07EkR4KmmVGroKXEQc5Yxdt/SrpQ043Ddw+VGEPuglfwG8vmCZ34yfH1k3s75vg/Ph2l/Etv3I77haSWpIZE5122C9DLf8CR6TWldwjeEhdqY1fDT6Bd9MTlLLQxhemKPLyYvMKlDetua7l/y2t2XotjWICmPIUU4lVwl+Lx7o/9XEcoOGtSdOo/+qWcCfGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqPJqNc8FZB8qnjbVMcObxCFvWCjhltMfKWNDxCZOSM=;
 b=cHtm4KI/BcEuDEZi+i01T1YJVqa5s3KyUD/2TRgtUv3EpVa2M/NWqrrCpm6zJen83dKJDkwmkWGA5f6o3uC0GTzSpR2F5SgWNtZDgrw4Co0ttq6QhbbTAbAq5Hvc80R0OkuLhFrn9CT0xE6XqfGw3oVM1VjO1sXYVBPlcXvZZNoQikhqFHqVxf7VTBcyuM4Lc9rSuehqNFvU9FGt0FGaEi+5L8qpSXLL5R782FMYIRre83S0lMy4NzPdQdadH8cQxTkcsWd/14JSEJCuCuTDSmcFdYsAE9ZSPBa8g7303rigYldfbtBMxXTac+jXNqnmigm9AcEK5z6xvz7H0z/fuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqPJqNc8FZB8qnjbVMcObxCFvWCjhltMfKWNDxCZOSM=;
 b=Tx0yBfxWArMPRdfvgW1eASvYKL6YFr56ntW0HqDiWQz7S+ysb5mY8mfsuASTfqTv3u4pnwh8BMx8XHL1zeXp9A4VLPVEQE5aVa7EdfX9R+0rALGDytS80YrRxXN2HLQKRAGLZsoIjIsGdoGllzQYPEDnsg7rFqDblX6IyhPtVPY=
Received: from DM6PR03CA0067.namprd03.prod.outlook.com (2603:10b6:5:100::44)
 by MWHPR12MB1357.namprd12.prod.outlook.com (2603:10b6:300:b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 19 Jan
 2022 23:06:33 +0000
Received: from DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::2c) by DM6PR03CA0067.outlook.office365.com
 (2603:10b6:5:100::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Wed, 19 Jan 2022 23:06:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT044.mail.protection.outlook.com (10.13.173.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Wed, 19 Jan 2022 23:06:33 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 17:06:32 -0600
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
Subject: [PATCH v3 0/9] i2c: piix4: Replace cd6h/cd7h port I/O accesses with MMIO accesses
Date:   Wed, 19 Jan 2022 17:06:17 -0600
Message-ID: <20220119230626.31560-1-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45da288f-d73d-48f6-7278-08d9dba05604
X-MS-TrafficTypeDiagnostic: MWHPR12MB1357:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1357461D15DAFC01D5FB8CBE83599@MWHPR12MB1357.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SFh4iSUca1P3rN/31tG87uwij6ISxVg3Ye2510MMI88Ze/LDXH1p539gR3gTQiWgaaQkLiQp1RNS57PssjN+YeMWZrtCZaqLCl08tR7VfgfJ2j5Eu314J18xJkKDd1/6F+qUzjgFGAtzZIr1T5QslR87NX6KO/ZRjncoGOUnzjwdNOpZGyIMu13WFuecjfz3JOmo0mz6OuQNQ0uXiSiHybaexSPohBq8BbZFmS3NbgOB8TqeH9G/09HkG16DZaK1MZRsAehUCg4+ceSk1n0ZK5BKIk8yi0NiDAq9mLHxdHa0PsGKa8LrZ/wQ9mGATxFnDr1kDDLZLRWdjhx6ZQ1d0gFeM3FiX+00kLlNnXIsmnc5Bo8zQ8UooKsUKKepljlTCE4nuyEMN3pFBXW44Z857J8j9TlLfOQ3GZhZeDM09lp8ICNoMozCXBwilyMKFWMreJARB6v1YI+iaHv6mygRAnfPvWfR3y8yJoQEw8jkO0Wdhm6qZGWqN0c/YL7XI1Im9R0L27Et4Uv/G32wB8q7zctpKm9FYIt3TudV2X/1rn5Q19oyk78WV1D1D4fm+n5T5aKKjVJeys2uXS4ArNq01F0pNbB4NH4vnCz5l70Z03WmneombIWsUvn8F8a2lJyUyJjoLVPgyftBNpDBVIGjvBcC3zqHVohq4CLkWXaEZBzV86Tsif3EFrIGsxtY0o76V/Ijg4CMMB+7idW31KCBpwdL5q1zizBLLLRDbmwXN8iXwz78EjsqHN+Rp4aXwM/ou10anm1UpHZZSorsV75jM7kjQdeZgyiLkGjys3IUJvSGSncYSwhVJSgJOKzDxZxNhNC2VJZSpqhQM6urhzxkDOcdJ3l+kpEVkYC73lC7tPbgth14RLb4Lq769aJUo6ezhtmrabJ3RF6WVr0s1yy+oJMsKNRtWQC9KIiKWpAq3bk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700002)(81166007)(54906003)(47076005)(83380400001)(5660300002)(2616005)(4326008)(1076003)(508600001)(110136005)(426003)(8676002)(2906002)(40460700001)(44832011)(336012)(7696005)(8936002)(36756003)(82310400004)(316002)(186003)(16526019)(26005)(86362001)(6666004)(966005)(70206006)(356005)(70586007)(36860700001)(32563001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 23:06:33.3236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45da288f-d73d-48f6-7278-08d9dba05604
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1357
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series changes the piix4_smbus driver's cd6h/cd7h port I/O accesses
to use MMIO instead. This is necessary because cd6h/cd7h port I/O may be
disabled on later AMD processors.

This series includes patches with MMIO accesses to registers
FCH::PM::DECODEEN and FCH::PM::ISACONTROL. The same registers are also
accessed by the sp5100_tco driver.[1] Synchronization to the MMIO
registers is required in both drivers.

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
using MMIO. This is necessary because the driver accesses registers
FCH::PM::DECODEEN and FCH::PM::ISACONTOL during initialization and they are
only available using MMIO on later AMD processors.

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
  kernel/resource: Introduce request_muxed_mem_region()
  i2c: piix4: Replace hardcoded memory map size with a #define
  i2c: piix4: Move port I/O region request/release code into functions
  i2c: piix4: Move SMBus controller base address detect into function
  i2c: piix4: Move SMBus port selection into function
  i2c: piix4: Add EFCH MMIO support to region request and release
  i2c: piix4: Add EFCH MMIO support to SMBus base address detect
  i2c: piix4: Add EFCH MMIO support for SMBus port select
  i2c: piix4: Enable EFCH MMIO for Family 17h+

 drivers/i2c/busses/i2c-piix4.c | 208 ++++++++++++++++++++++++++-------
 include/linux/ioport.h         |   2 +
 2 files changed, 165 insertions(+), 45 deletions(-)

-- 
2.30.2

