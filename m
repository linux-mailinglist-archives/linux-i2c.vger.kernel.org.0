Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 973B04A386C
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 20:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235560AbiA3TMx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 14:12:53 -0500
Received: from mail-co1nam11on2050.outbound.protection.outlook.com ([40.107.220.50]:58721
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231396AbiA3TMi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Jan 2022 14:12:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhRYj8dTGPS44DgRWe+YQ+hDGXTJbRfU+eH9cpQ8GBmcIjtyeAjc/S+xKkiihz4fqS99KI3IGh8530WiR/OZZ+n5wv2GDnNtdH3wCpr/qJ55CWg+NoQ1f6ZZPEb/7Z7SIj00IYa8b6iXUZcO5+GJ4yOaxw3H4GU3OJTgLExrgS5rcv0SIyChqe/szZlXrEWcd/UMnBLzwQaz6ebpq42Y4ipnwrcygvXqXNOpTzy78zkAvYyH8In0v0bRdampZ0VEPIqEUskU9j6FNl1JFUqOaKaFUXq6pBqjaJMpD8FCEFroqztTirCXwsHI+ZmNwfO1GS30t+gaQTa83x9/qF5GCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gh1xKc9bYPm5JBv0WRbPgfUMR79YQMZXUO9+xCmjyw4=;
 b=cjVFV71JW4RdemC1SmMmF0lYle456gDA0UQERvzKTvvkhYHI0V2LL3gTIwvqbYyDWAz+7qDVKJ86szh8ICk7tVVNAzL5BKYUF27DOm14kVX8vPCcwrvQDMs0kNu8QfUHGEykDIbgHHnbPhNf1d5/gdtImPqmaSnJ38BNmbrSg5HmFVxMH49+RTc7w46xyAT5ymqS6uJ46o2wEuTrDDUWN0wyt1QZejRvE7J3RMeCk5sKa8Z5RGtkKmqlBUoKynRaHkS2xmVfrfQ1p83Lh1Bqd8IzR2EN/ZRMpt7tkmzfFFJ7Ah91rL8rzKdysY9fCUknyGojq1K6BQhtG2NQMCErRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gh1xKc9bYPm5JBv0WRbPgfUMR79YQMZXUO9+xCmjyw4=;
 b=kwy1bDS56sLXS3rvzVEAT0t+Mza10fxd6s24nESKRPTU5ZHUVqlraZlqb9WvpHnh9Y7O/SjSo5MYrWO1N/wGMHpO14QqpE4bxtZUrzJjhWZq5svIEQUbZ7d8S1VDpycCuZ9TbRq818vSui5SOF22Lg22m0Whd6PRfAc+uiyKiWw=
Received: from DS7P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::6) by
 MWHPR12MB1789.namprd12.prod.outlook.com (2603:10b6:300:112::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Sun, 30 Jan
 2022 19:12:32 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::57) by DS7P222CA0010.outlook.office365.com
 (2603:10b6:8:2e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Sun, 30 Jan 2022 19:12:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Sun, 30 Jan 2022 19:12:31 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 30 Jan
 2022 13:12:30 -0600
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
Subject: [PATCH v4 0/4] Watchdog: sp5100_tco: Replace cd6h/cd7h port I/O accesses with MMIO accesses
Date:   Sun, 30 Jan 2022 13:12:21 -0600
Message-ID: <20220130191225.303115-1-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1c3c709-fda0-4986-e418-08d9e4247731
X-MS-TrafficTypeDiagnostic: MWHPR12MB1789:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB17894D63E2986CF2691A82CC83249@MWHPR12MB1789.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OscDAQ8JWHKvrRr4r5bI0NgWbLroxIZ74aTD8Tw9kD3yFMgDiEa7miqn8NnD6/OVr7smMV6U3IWewSkQDLf8YnmyCl8t+OzorssoISASvcs2JeObjfFEwIasc0LiaG930lZXkgQIJMYZiOzoTZywRkcHGueGmEx11WTwcio4/gT8y17mB6YVXF5G1DLMmkB1nfWvIof7wPprHy23piXbe4grqJ3xAw4tMWFNoKXFfC8qdGlroRwaG1pvWlpDxX3JXcp8spZpLy2gtUBqHIHoi0OB7FAY/SJE3Ad5z4xtgCJUIArMQsNvlhF8gN9bpK8wCtXQwrYfY3ZlsEguQqC4P4XHyuDuviXahx+PvrfLadHDRk/b24nmBVrQ9mLQof1JfOvjBwwg+QNzQhc89+BN+toDZ9/sreaiHchObkqbByBX06h0iayoN8OGlnleW+99jQ9ow1t6vM5bV0C7DEbwoeSZrIumOoKlgRj5KjRHwZFd+ZwVEHCNe+VpY88P8gMiLjCWj1wQkSSMuVgrGDelkX3uID0mx6vEkeHWR11H0ujNhni/NjXod3EtUn0EqPbtXyVQU8AxL8kNzvAreBCrekxeycXYGFG4rjBmlt2J4eXVKNHb4opW8s6zdQW05ADWdNwN96aOYYMsYHSXzgjSJCLneqGgvHf1Thh4LfIO4/STZULMfbmdGz/m0nTJquVhFQ/zIdqbXnUoHWe0oQt+txtwJpaXbuG/OWlGF/YGWaFlDNAVmCu94OA3158nGSRSdnlpz1S+5yBVJc4xYoJ8CbQJNgT0xnTw1+H+S0/OIoY4EDPf69zddsU6D+0SYdIUmCh2EgrAoXJOB2Jv7J/+MA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(47076005)(7696005)(6666004)(82310400004)(36860700001)(508600001)(966005)(110136005)(426003)(336012)(26005)(1076003)(186003)(16526019)(83380400001)(86362001)(316002)(54906003)(2616005)(44832011)(81166007)(36756003)(40460700003)(356005)(5660300002)(2906002)(8676002)(8936002)(70586007)(70206006)(4326008)(32563001)(2101003)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 19:12:31.8256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c3c709-fda0-4986-e418-08d9e4247731
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1789
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

Based on v5.16

Testing:
Tested on AMD family 17h and family 19h processors using:

cat  >> /dev/watchdog

Hi Jean,
Please confirm to leave your reviewed-by and tested-by.

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

