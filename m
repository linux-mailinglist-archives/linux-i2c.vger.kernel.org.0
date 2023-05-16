Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B70D7705650
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 20:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbjEPStR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 14:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjEPStP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 14:49:15 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B52E4F;
        Tue, 16 May 2023 11:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9V+oMIGoGNwxnxCkTl+o6tp4hWkwrGDvGJAOtwfAf6Xnps28RyQYpyVNQDrny56r1dVXOdQLGgBt69aUqbnvYjQFqSflx/rVHZpVpjf178HtKCG18d1NoUWzYDSyvmDJXfnKg8MEXWbv4GhQMyEwsW+xdWKHxgssQawWUpyino1cWQwcvvI6Y4iclXpOJzlbLxGh/ULhcXkZikA0WHqWVgY9MX14I1ZkChGJ0BpCp8RidfmkBbMejCfuW76g/SOrg2YRHvRavGcBv9+IyJMvOVATMlZjEEXoQaAuYfxK5o2qkkMbqs2daKz4tYW28bXn4I3p7fA8gLuQJjvouHHlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgJQGW92H9EgAFzAMCemC5nx7QQbXKO/jsvUv1+gn1E=;
 b=k27a3ogko0zlSejSj/muFo2FQW0Bel87fXWpJk1LMusMJTBT+eGzcABprzqhfllr0ir2/0KqadXiGbIeyWIFFqXorcnh9VkBoDWNexuWpPPg3BUNtSVF8Cpk82ZfFN7XayFSYRdygnqPXmb+vo4HWl7uPy60unE+JyRSpbZh097ByYl3hqREfQygMC4/e4w9fZZlkvdhygU1YkBmWFPGts43lxR074+8+aLFJ0tKQpPnEykeegkFmkq0EvABy15D78GqRDfjvCx1vxDS9At2NHNo/PCyoJBsG+2mAu9p6AGY336ZUsInxKj3IURYUIQr2KU7u978MVR2zdxXEvrHLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgJQGW92H9EgAFzAMCemC5nx7QQbXKO/jsvUv1+gn1E=;
 b=kE8GmghiCRALdm20Y02ZHRDQuPABMkHsV+79hi1rcifj82Bpkvb9IokkdfxnDruSgCFwQSzwFG9MDEMAnalTAR8GXmfKP7isAG3Ym1p0sY57vFWpjIbEw7UwoJAhL0K/WWdSNr3A3W+WZsmabnoVWLZs3XcpHiueoqq/0WK8ZX0=
Received: from BN0PR02CA0030.namprd02.prod.outlook.com (2603:10b6:408:e4::35)
 by SJ0PR12MB6736.namprd12.prod.outlook.com (2603:10b6:a03:47a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 18:49:11 +0000
Received: from BN8NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::23) by BN0PR02CA0030.outlook.office365.com
 (2603:10b6:408:e4::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.31 via Frontend
 Transport; Tue, 16 May 2023 18:49:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT108.mail.protection.outlook.com (10.13.176.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.17 via Frontend Transport; Tue, 16 May 2023 18:49:10 +0000
Received: from SITE-L-T34-2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 13:49:07 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     <heikki.krogerus@linux.intel.com>, <rafael@kernel.org>,
        <ajayg@nvidia.com>, <andriy.shevchenko@linux.intel.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <Evan.Quan@amd.com>, <Lijo.Lazar@amd.com>,
        <Sanket.Goswami@amd.com>,
        "Mario Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH 0/2] Adjust logic for power_supply_is_system_supplied()
Date:   Tue, 16 May 2023 13:25:39 -0500
Message-ID: <20230516182541.5836-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT108:EE_|SJ0PR12MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 939e87f7-0116-4298-8d60-08db563e3c6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AOhsuuI6ROzamXj1yQVZpGDRCQ5wVDjaV3QizDnMDTYogjsvCqnL1pC7FMecm7JD/0uaQpwK1wcgbbGmn8oT96KS3Ll2pmNaYRab+7BWOZ3as+GLe5+w6Nt1v5Tml7IxTHUQV6jPjhLxRS3hDOLvC0MOEd/dbgN4QF2HJbQB/2pfTKe2LILDP8Hif91IEAXacn3tb6U5YhG93n/TApyOjkZ8R8r+u/+RHtn0cCsXypMIuJm/Mmsl+X8kOYbxSO6Xg1Qj/zQmyCfryVfEysJ/e+zrkU4+4oBCdOgyjLN+PU7da4bgx6Mr9vd52R0qG65gG16NNg8ixLrAPDa2+y/dDkQjF47Vpqs2SJODTNq87K+T0vbWaaWGa+h1fWvTjYfhI+Ex51tOitgBDEep+lsTZvnHacJoEfQpO3vU8jsnoG9n1MJ96X9cKpjtXTBzB/KHTwllKwF5VVSmMKQd/JN+wsEXZxYqzVTrabC+GjEzNnyuYOLJysG16EvQ5+0fRDyZDtK8WkX9nVLnuv6fL+rcRgH4f9KukSwZSqt4ave0xYJyCry2ihTvxSKQhwbx6VrfTveQfE84iUawyl4hQB+A08bLHh2t3TkhJFHOt7ZbtwBZ6B9/i7CDalqM+cOPwviTwi6G9ItAN/tboOq5P12Rm52mDoPszqg0n04OsRI0xAW9A8ZI6hiHh3iEip/gFMtOmA/O221yBCJOrIhHeZ/9V4orAX3xOI1Ih1gQeCCap1PiyBVvfeCp3lBgXdg2BztiEodEwJGQQv0uuAoNZ7CzlC/uD7xD9q3dtKhZpy2coPQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199021)(36840700001)(40470700004)(46966006)(7696005)(86362001)(54906003)(82740400003)(16526019)(41300700001)(186003)(1076003)(4744005)(47076005)(36756003)(26005)(2906002)(8936002)(8676002)(336012)(426003)(2616005)(110136005)(44832011)(478600001)(5660300002)(6666004)(4326008)(36860700001)(83380400001)(70586007)(40480700001)(316002)(70206006)(81166007)(82310400005)(356005)(40460700003)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 18:49:10.4427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 939e87f7-0116-4298-8d60-08db563e3c6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6736
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some systems don't provide any ACPI power supplies, but drivers use
the function power_supply_is_system_supplied() to make policy decisions.

This logic works fine until a new device is added to the system that
provides a UCSI power supply. This power supply doesn't power the system
but the logic assumes it does.

This series adjusts the logic so that these power supplies are not
considered when making these policy decisions.

Mario Limonciello (2):
  power: supply: Use the scope of power supplies to tell if power is
    system supplied
  usb: typec: ucsi: Don't create power supplies for dGPUs

 drivers/i2c/busses/i2c-designware-pcidrv.c | 13 ++++++++++++-
 drivers/i2c/busses/i2c-nvidia-gpu.c        |  3 +++
 drivers/power/supply/power_supply_core.c   |  8 ++++++--
 drivers/usb/typec/ucsi/psy.c               | 14 ++++++++++++++
 4 files changed, 35 insertions(+), 3 deletions(-)

-- 
2.34.1

