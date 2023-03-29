Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3176CF624
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Mar 2023 00:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjC2WIM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 18:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjC2WIL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 18:08:11 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::618])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4094229;
        Wed, 29 Mar 2023 15:08:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1qtCSyyHv1AVHOdiAYbyYMceA9fUYI+bYdHMlwov5w84ln5593aaJLZZqjuR+zcCAONhHXOoB/8u9JuKnqe3zepeu7uNTj3qgVZS1ES2Eeo7qoMiHJjFDguKWWJ4AgW2mE280PMkbgEiyaiLr7N+f8xQohcYzdPRTAHNObPwiWBeGMsxklDgwzDcG8SkTpGFDl0+0gbaRdTJ+1VXCXU93YXdFqWkvDAdrz3wyWt7ZpxLOCCNJOD8Pf1tKUmfOmRNuux6cpZPFZzggSn1DbVef5/ggWiDDLfpoXUsm3JynwGpvxsQ1flc+/6LYuneLan/amzvRltLo564fRhjaG9oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8xon/bf5t0RuHSZQpL5d8CofRgbT7+W1aboC5FV0RY=;
 b=YFUiL332On4nkSYgBN/5AKtPGfA9jLQG+TXrtrq0VmiLpfXZutRTMLfQ7zuEGKcY8VNISNU+/Uf8RtN3B7RLFmgX0jPGChcrl4oMfMgDVB+trpiQDsT7SZlDsIFDJOceBZG4So+XlJjvbhfK+z9D/IfSzTi/9pzWCHTarT50Ec/nNwwtLzrlvuovWfli3jVDz0m1mRC8tmACS/ER2GCENryu29cSKUqLBvm5K19o2ytKka+gT1gqPi9JDrWktzxZWimLAgI1ScmItkxiP5BT74loEorwpomhc/0OqAAPVoanzT1Xws3gpNy5EPkm3nvZTcJi8YvV4x8WbSkts3u7Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8xon/bf5t0RuHSZQpL5d8CofRgbT7+W1aboC5FV0RY=;
 b=CsAdBrPjs/pQprQ/NntJzgUAhx6Wb12s4ywBYp2VFaI8fd0WIsEE8s6tcLk+62Sv6OHxs43c0swO2+l6xevHeZvKHAhA0gC32xeP+mUak+25EqYc66aKO0zD9pax83lN06l0AX/y2OUUEcV1HwNDqhubaJmgoXfGb19MgXrIIIA=
Received: from BN0PR02CA0026.namprd02.prod.outlook.com (2603:10b6:408:e4::31)
 by IA0PR12MB8253.namprd12.prod.outlook.com (2603:10b6:208:402::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 22:08:07 +0000
Received: from BL02EPF000145BA.namprd05.prod.outlook.com
 (2603:10b6:408:e4:cafe::bf) by BN0PR02CA0026.outlook.office365.com
 (2603:10b6:408:e4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Wed, 29 Mar 2023 22:08:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000145BA.mail.protection.outlook.com (10.167.241.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.35 via Frontend Transport; Wed, 29 Mar 2023 22:08:07 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 29 Mar
 2023 17:08:05 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     =?UTF-8?q?Jan=20D=C4=85bro=C5=9B?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        <linux-crypto@vger.kernel.org>, <linux-i2c@vger.kernel.org>
CC:     Felix Held <Felix.Held@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 0/6] Use CCP driver to handle PSP I2C arbitration
Date:   Wed, 29 Mar 2023 17:07:46 -0500
Message-ID: <20230329220753.7741-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000145BA:EE_|IA0PR12MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cee4512-29bb-49ba-2aa0-08db30a21375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vCpIyGznbXGd8yMWmcf1a8VWu97NhUA0q9daWVIQsqWKptqeGksonQg4O9vJkGIKHqJm164DuKCP63dE6rcOEjJlJroVQj4unQi/c3WfU9oxlUYTcI7rZfxC6BGgMIOgNCBuyR4RgDJ0JfYscapFFRoX1bhEsrdCKkD7lXSMsKz9N+9yxX7HU58JGFu6cvJPSsQ4RTcCZJVS7Z6zsLX/gjDeF2kGclCuC/BxOozhJXsnmIryRbjdxqQBM0/B7aNxeo8hVZK1F/s4aWIKlrrdJEIeCjAaLIp/jVxbT37Pxn32vyJptgxd60fWhZFwlahRkBkXmEj58WSnfZq73+K6OIYm7nlfgj+6vLwR4NLu4QmwsjbOq1CXYbOWIvOLgu9Y/R6TXZEfbRcN0fMwukxzi3wCI0sDE2nBWxYzM72eDQ+myn4aeiYyiHb3PFucW7oXgV2ZJ0n7BT9/dMKlbBXsKDavsYalKu+hztL/tFftbeUUKRfurUPznVw7PAhUac94Rs7CUtOUFG2NAGLuQuKDywddBVbm37ylB1xkmlaWAb8C3mDeTau23LDkk8Lb9h1+T8Saj47QDRtUPWIjkfmDYrM7t59LPFNHZSDd2syvbXl9XrWGKXUOw7OmYDSVpRdMCvb9EzrPuEtwckVNbL8YvQdW8N1/JWx4WtWou19YKGoQv7V2qsaNdP04WkAWJTw+mzlU1OhJkO0lO0WNG6sqmJIg+4pxu4naq8WGhaoyROQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(40470700004)(36840700001)(46966006)(47076005)(40460700003)(5660300002)(4744005)(44832011)(2616005)(336012)(426003)(41300700001)(8936002)(54906003)(83380400001)(36860700001)(478600001)(2906002)(6666004)(26005)(1076003)(70206006)(70586007)(8676002)(316002)(4326008)(16526019)(7696005)(186003)(110136005)(40480700001)(36756003)(81166007)(356005)(86362001)(82310400005)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 22:08:07.2025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cee4512-29bb-49ba-2aa0-08db30a21375
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000145BA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8253
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


The CCP driver now has symbols that can be used by i2c-designware-amdpsp
to handle the communication regarding i2c arbitration with the PSP for
both Cezanne and Mendocino based designs.

Utilize those symbols.

Mario Limonciello (6):
  crypto: ccp: Drop extra doorbell checks
  crypto: ccp: Bump up doorbell debug message to error
  crypto: ccp: Return doorbell status code as an argument
  crypto: ccp: Use lower 8 bytes to communicate with doorbell command
    register
  i2c: designware: Use PCI PSP driver for communication
  i2c: designware: Add doorbell support for Mendocino

 drivers/crypto/ccp/platform-access.c        |  31 +--
 drivers/i2c/busses/Kconfig                  |   4 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c  | 199 +++++---------------
 drivers/i2c/busses/i2c-designware-core.h    |   1 -
 drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
 include/linux/psp-platform-access.h         |   5 +-
 6 files changed, 62 insertions(+), 179 deletions(-)


base-commit: 9117e682b8b79f7b5e2517fd28d42757d3e8b860
-- 
2.34.1

