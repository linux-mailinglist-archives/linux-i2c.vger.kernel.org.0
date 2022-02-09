Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 792AE4AF858
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 18:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237869AbiBIR10 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 12:27:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbiBIR1Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 12:27:24 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA47AC05CB82;
        Wed,  9 Feb 2022 09:27:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHVTCQxgFmIgN9mnumtI3hzQBFzJGMS9mLArE6r6ebXCnFoWa6V426GCK1Jt4yRvDZZGW+PN6RoINDCzkGppbjBeS1Yvz5wmdTIxXw4nBFu0oId5zitNqAFAb/CpKdfCznlQ+aGJs0rXBAJyRd/zhsxUpqfTUvO2oxjM4s0tGaTt4hEeCCPQknffvLGGLNtrju1C3gm/zoE5HsQD+RFJcV5lkE6YVwdHqtkaFG9aLmuPC5DCql+vMQfFdnnzvcB8CCgWuCRFFFSNKFPkxf6AdOJpnopLbFkCLORp2Cmux8TjUBtpMnkrIOQKWuishv/eRy//Z0m+oRu7ZuSswPfYhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99aBqc4sxFoYIq6lYZ1HRC8Zdcvnv4fofpHJFaeikRU=;
 b=K24uQYzDLFiPCOwp+9LRI9HUa9MK5ROvY521F4qZl+VhJAQjr10utTq1w+A+oWb9iwiG6IMvRgtBW7NmXyxF9JJc1yVvgtEcWIyWmycb4DV235uR9KMH3XB7rlDXLz0uMQ81d3mNwl6dHM3bW9cVgfXHizWlBdeEmlfbR1bZWejda2Zzy6FW9ewyGOnvk+1aVIUWlgWOzzG2ceJ4fmy/ban4pjFaDImMBaygEhflWOUjjP3Ot6dBcTGVUnrBKhQK1nASeQWQX6yauK38IG88ojn6iXAqsTVTKdKpAIVIEy52+lLQY7/LYlpa3B6Wzw+9WbgAAEwgADPVnH0/mlLQYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99aBqc4sxFoYIq6lYZ1HRC8Zdcvnv4fofpHJFaeikRU=;
 b=JvvVYXNgxbn/g94TYlU8w/ruo4uOua0EQyZxrttF7A6CU7LMHYK+X6a5l8ptOHWaZ2l6VgdxV8W4tntqSSL5QBjdYhzYoZksz+8PlPLn+JtWQWBnglJAfdDkWWC8KBj/ctG1tvxVwgzg7kouUOGhvFaGduABSwvV1mGaWspM5js=
Received: from BN9PR03CA0363.namprd03.prod.outlook.com (2603:10b6:408:f7::8)
 by BL1PR12MB5379.namprd12.prod.outlook.com (2603:10b6:208:317::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Wed, 9 Feb
 2022 17:27:24 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::38) by BN9PR03CA0363.outlook.office365.com
 (2603:10b6:408:f7::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 9 Feb 2022 17:27:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 17:27:24 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 11:27:23 -0600
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
Subject: [PATCH v5 0/9] i2c: piix4: Replace cd6h/cd7h port I/O accesses with MMIO accesses
Date:   Wed, 9 Feb 2022 11:27:08 -0600
Message-ID: <20220209172717.178813-1-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63f7b26e-6a4b-4ecd-c33e-08d9ebf16fc5
X-MS-TrafficTypeDiagnostic: BL1PR12MB5379:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB537936C91B15289619691B68832E9@BL1PR12MB5379.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VQ4YkraRF8s38o4TWxLj/oZiFUSMk5h8Mx5sDB7yt7HPamOAbM45petRP3Jh6moE0ZZ9zVLlckzLab5y4c6piktPi/wem20YrM916r/Vcb+gfWeDA6XP2mlcfDjbMi8Uw7rve1Q5c1gc8mhjD35QT345W+Z3CrRqIQHotArLQVCWzyuCn0bdAt54/MHFTx6takJNvvhDR2+3i7aYiBAYKw9lsOn78v7OmG0yBsMU9EGreCeuLCXJ8O91rZSIUVuYUE9Hlhzfg3bqk6a5FVf4UK8rq9Azue1i+jzHTWDdah0qrG1tIZ9z5FfqkcT6JXfjm2r0voo89gPoLl/6ZZ+Jxno2xOv4V11tTZMbv53iG33C4vbi7DJm1GBCGBmJm+alWdR8HWs6UYk93qp/CtcB8oiQVtVMjpuZOfswMAnTJ8Di3+aVK8MirnXTrgT+wyX9fPEsVHWfH7afS6r6P2j0t4HISGY4CdKRvMQpB0n09nOtO8wDg8rIIgcxm6U1DaQ61Nf9QTHuiOX4axV9+C4A5JFEmShpJHpz5iF7azthAfaOjpyF56PHXApnQUbqFVdcUrUdh95m0746taAONGOrcBnCYCmRWokArBJTzWM5tIrwOojxlfOXv7blEyN3aDnT0UKwUod0oSNIxR/2ttNGTeDA+9lrfqoiCfpc7WCZLC9dXl/K2RXXhxHnifcMLtCk4znCO9XfrOZ+CzluHAWLgMrXIIlsutz1jc1yVEGjNBmULOdGMSVkt5WVQyLCUdZMupoYTR/7OSNwBFcmk4IqEfeVsqBCtm75+4BLKAzXJXAjkNx+r5wPTToqgYfcgVHW9MTKUccP4KLk30k+NDNoAw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(40460700003)(426003)(70586007)(8676002)(83380400001)(36756003)(336012)(1076003)(8936002)(70206006)(86362001)(47076005)(4326008)(16526019)(186003)(26005)(36860700001)(2616005)(5660300002)(44832011)(2906002)(508600001)(966005)(316002)(356005)(54906003)(110136005)(7696005)(6666004)(82310400004)(81166007)(32563001)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 17:27:24.3888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f7b26e-6a4b-4ecd-c33e-08d9ebf16fc5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5379
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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

Based on v5.17-rc2.

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

[1] sp5100_tco v4 patchset can be found here:
Link: https://lore.kernel.org/linux-watchdog/20220130191225.303115-1-terry.bowman@amd.com/

Changes in v5:
 - Use request/release helper function for sb800 device in
   piix4_setup_sb800(). Patch 3. (Jean Delvare)     
 - Revert 'piix4_smba' variable definition ordering back as it was in
   piix4_setup_sb800(). Patch 4. (Jean Delvare)
 - Add newline after piix4_sb800_port_sel(). Patch 5. (Jean Delvare)
 - Remove unnecessary initialization in piix4_add_adapter(). Patch 6.
   (Jean Delvare)
 - Remove unnecessary #define AMD_PCI_SMBUS_REVISION_MMIO. Patch 9.
   (Jean Delvare)
 - Add description for 0x51 constant moved in the above item. This is
   in piix4_sb800_use_mmio(). Patch 9. (Andy Shevchenko)
 - Rebase to v5.17-rc2. (Andy Shevchenko)
 - Update patch 9 description. (Terry Bowman)
 
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

 drivers/i2c/busses/i2c-piix4.c | 213 ++++++++++++++++++++++++++-------
 include/linux/ioport.h         |   2 +
 2 files changed, 169 insertions(+), 46 deletions(-)

-- 
2.30.2
