Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD2E04A74A8
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 16:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240070AbiBBPfg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 10:35:36 -0500
Received: from mail-bn1nam07on2049.outbound.protection.outlook.com ([40.107.212.49]:13078
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345484AbiBBPff (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Feb 2022 10:35:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+Ukuf/BZW+Z1cb1z6mGAXx/qTmB/cY4inxA5OredntO7V2C65Lw28japX/XVTwiSw9fbnMGfXpu4EKkkT474T2hvYRv8ma3gSAaDyB75DE8HEfU5Uilw8R+YIB/1kNLKpIwYXKTALgrt13YOLxJ3FOagXEDCL9c51O/l04pjzUNH327hfs5cIF3pirGmISZ7kkuachHS5bXKh7O1o6y5AHUC4DIRXEiFlcHR6JDcDFHdLTaCqxBghZg17bYE1bjrfpUl3ST0zc2OTQhgVWrEvh+AOylJkXWSoOzbAiSBnZzHK0AUme915JFSPGRrMj1RP2xXQ8AJY30voaneYv1PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zy/V2yIi2a2iuizgLxJMIzfmvKFM4x0RUZOsu45DXUM=;
 b=GNiQnnDgZH+MBLfGFBQOHyI7cZjGXOKkzXBS/eYbJ01fd4GeRA6rl0YfSV1p7Nk4viXjki1on4TGYI5vFh58wSpkMCxtDp4o6LazIuufV9+LHg6JKIwk6gV2OvQNk+Qe0Tg0yQmS25951SMaYgnogcJud1Svmh/jDamVHv2SPiMSrRtaJ1OTrHfCxwCGrqQcBMdjbzD2iafl5vL616d0otlCPuGe+/q3t0R7YmH8+89Ft8MrWbVAgpWXPJIm6yZMzBK4NpWWMKUQvqRViV8VTxXDpjFwHfJtrLIBa9JQxcPbu9PId33jCC4AYcN2NxivzJS5euzIqnndVPDoRqwICw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zy/V2yIi2a2iuizgLxJMIzfmvKFM4x0RUZOsu45DXUM=;
 b=LmzRfjT9/jkfWnuFguCpl4guFl4CAvzdndBpQvUlHHc/+dLsdfmliTpydWMIXh0aC6zj+xlSl8MkssO8JPnaVgsPwz1DUIzC8Rm2MOvvzwHwUCAcjScG7cUM9dKUc425WSUXP17aF4CGqCMPHe3NuJyIyvTjyYn/uRkoGrMHQDY=
Received: from DM6PR02CA0091.namprd02.prod.outlook.com (2603:10b6:5:1f4::32)
 by CY4PR12MB1238.namprd12.prod.outlook.com (2603:10b6:903:3b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Wed, 2 Feb
 2022 15:35:32 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4::4) by DM6PR02CA0091.outlook.office365.com
 (2603:10b6:5:1f4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Wed, 2 Feb 2022 15:35:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Wed, 2 Feb 2022 15:35:31 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 2 Feb
 2022 09:35:30 -0600
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
Subject: [PATCH v5 0/4] Watchdog: sp5100_tco: Replace cd6h/cd7h port I/O accesses with MMIO accesses
Date:   Wed, 2 Feb 2022 09:35:21 -0600
Message-ID: <20220202153525.1693378-1-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a5065b2-d400-4e05-eff5-08d9e661a5e2
X-MS-TrafficTypeDiagnostic: CY4PR12MB1238:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1238D8303D46245D5EF161DF83279@CY4PR12MB1238.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8D39PUguKVqVQ6Jw99+Gri4GipYAeCrVuIk1r5K4cwYWYi5yYPWjk5sDGJPYFRt4FAlzdUfIyaNbRT3hRVQx+yh4bHA5wVer4XvNkiL9pnt8By6rZvHhVKENJDFFPKbzFIN/0JwA8tCxgjGw1hZ9a4wqRznfAultUwME6IKyE6EGmJjq9LUoAw+c/N4wy8xVx3o8x/ctElfPnbqZ0IJc7uuq9bd9xc+Uq0GZjh4ucpCdGNX8rC0aFKY/rM1rO4RwReZFj4w+DUFe970RFW35Qw52KbhFvWWo5yx/lx/QCc6LvVDI1tlfvCyZQLQ2AHZkrd3hql8P1E4+TZtxqcpz1mh81Ix20ZAaW9ISXUabFhl6UQgATwiwAASnBFSVLqKI7ag2xZX4ECw6cGXR9XVy6T6zlezIcrg+Tk3sKq2lMFBG8IaEhiAWwxbwd5BeHjJlHa7DptYHGnNYSIrgsmzdTn6Qje2NqzF1j2PVXs51f9XshsEa1RIJEehtenK9+rzoatXAQd2drciaINpG+QkeRgzZoW0E7zhF/dCDC1Wwdqr1NWt41/JoPxBvgkQGwLOwSH/Po5+vEvFMZ0KyQ4DiCAsNb68MrgjyTMKpu3ZTzARUnsMK3ppy/BKhFTtQHfnEX3hVMdIOctV2wvjQBkEkD2AdG2mbtTWjy2o08IihIPfXQ+nLAzszEvWV4Dk8kL7EyrGFwTKop5evBKqNj+sUqdltO1Ifg4trIXedVDFLQfU2g11s51uIVCwFl2mzfMJrp7GuKo5Ccs3cLvSdEvtVVGh6CE1TkkmjOj7XLdK+GBnec45NjSW5mlCj5sHROqoHuTRnxLtmbR83adLlSKRneg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36756003)(4326008)(54906003)(86362001)(44832011)(966005)(6666004)(110136005)(508600001)(316002)(5660300002)(70586007)(70206006)(8676002)(8936002)(7696005)(47076005)(426003)(82310400004)(2906002)(81166007)(40460700003)(36860700001)(1076003)(186003)(336012)(356005)(83380400001)(16526019)(2616005)(26005)(32563001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 15:35:31.8027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5065b2-d400-4e05-eff5-08d9e661a5e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1238
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This driver uses cd6h/cd7h port I/O to access the FCH::PM::DECODEEN
register during driver initialization. cd6h/cd7h port I/O is no longer
supported on later AMD processors and the recommended method to access
this register is using MMIO. This series will replace the cd6h/cd7h port
I/O with MMIO accesses during initialization.

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

This series includes patches with MMIO accesses to register
FCH::PM::DECODEEN. The same register is also accessed by the piix4_smbus
driver. Both drivers use request_mem_region_muxed() to synchronize the
accesses. request_mem_region_muxed() definition is added in parallel
piix4_smbus patchset review with review URL provided below as a dependency.

Dependency:
Link: https://lore.kernel.org/linux-i2c/20220130184130.176646-2-terry.bowman@amd.com/

Based on v5.17-rc2

Testing:
Tested on AMD family 17h and family 19h processors using:

cat  >> /dev/watchdog

Hi Jean,
Please confirm to leave your reviewed-by and tested-by.

Changes in v5:
  - Updated dev_info() in sp5100_tco_prepare_base() to use physical
    address. Patch 2. (Guenter Roeck)
  - Rebased to v5.17-rc2 (Guenter Roeck)
  
Changes in V4:
  - Change to only call devm_ioremap() once. (Guenter Roeck, Jean Delvare)
  - Remove trailing dot for consistency with the other messages.
    (Jean Delvare)
  - Update print formatting in sp5100_tco_prepare_base(). Change period to
    a comma, use '0x%x', and change return code to decimal display.
    (Jean Delvare)
  - Move dev_err() linebreak to 'dev,' in sp5100_tco_prepare_base().
    (Jean Delvare)
  - Remove unused variable. (Andy Shevchenko)
  - Remove unnecessary assignment in sp5100_tco_prepare_base().
    (Andy Shevchenko)
  - Unify comment in sp5100_tco_prepare_base().  (Andy Shevchenko)
  - Fix line break for readability in 'if' in sp5100_tco_prepare_base().
    (Andy Shevchenko)
  - Fix logic issue in 'if' in sp5100_tco_setupdevice(). Added temp
    variable val. (Terry Bowman, Jean Delvare)    
  - Change capitalized letters to lowercase in sp5100_tco_prepare_base().
    (Andy Shevchenko)
  - Add dependency note for piix4_smbus driver. (Andy Shevchenko)
  - Change "SMB" -> "SMBus". (Jean Delvare)
  - Add comment for logic in sp5100_tco_setupdevice_mmio(). (Jean Delvare)
  - Fix 2 locations of line breaks in sp5100_tco_setupdevice_mmio().
    (Jean Delvare)
  
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

Changes in V2:
   - Refactor into 4 patch series
   - Move MMIO reservation and mapping into helper functions
   - Combine mmio_addr and alternate mmio_addr base address discovery
   - Replace efch_use_mmio() with efch_mmio layout type
   
Terry Bowman (4):
  Watchdog: sp5100_tco: Move timer initialization into function
  Watchdog: sp5100_tco: Refactor MMIO base address initialization
  Watchdog: sp5100_tco: Add initialization using EFCH MMIO
  Watchdog: sp5100_tco: Enable Family 17h+ CPUs

 drivers/watchdog/sp5100_tco.c | 334 ++++++++++++++++++++++------------
 drivers/watchdog/sp5100_tco.h |   7 +
 2 files changed, 226 insertions(+), 115 deletions(-)

-- 
2.30.2

