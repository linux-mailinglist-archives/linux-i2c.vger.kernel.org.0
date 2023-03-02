Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4F56A89A1
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Mar 2023 20:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjCBTnL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Mar 2023 14:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjCBTnI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Mar 2023 14:43:08 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8211A642;
        Thu,  2 Mar 2023 11:43:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwBy33dks/UJtWESD8UsDyI9na4Y0lK8d078bzx7GuNMniwiok5Th9ztYkPs3z0Zv5GmmAgcZZvwEyZPc3+gFMoYg9RiF3515ow4UtSLmw/a5EUIKL/PSr8H8hoLB2YsbTQB6I8M6Q2NQ5Zde9wnxgyrRXTBhPDHhYKdZjHA+nfFUuYFgWCt77XfT1wl+Sinu8AmL78HhD3tWXebZOjKT8gh/ZRrCt7Tjdfpc2Xnh7oduz00aAbG1ktpI2dIFmFr+H580TUVpK7jLt0VMHUk9mYbuKzZfaPxQrCWhhTN8YdElUaVQJrSCV+FrVlwueKc+eR0w8dTRrM2nnLoaAQPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J36VZ3DMMcDo2sWQ0t2n2plnQveHPOZh3iCKv+UyHEE=;
 b=O16vSprEoSwvC8Kgur3m27Nf/HMmDkSvhX6zzhzNEVxT/7NXVw+mDdXJd9+XVXZJYsevfuPP5pZN5oYDHKjerAdSgad9kDVLnU+RKGamqUpRwhpvA3J2EF7fnyD1p9n1mVno2vO2a8+X5V2mvF/6hJm35w6QjhNK/K4H3FaBPUnzJXU0hrDrJmwwc1+3rSjo0SCfqL+d/iDPt5nCwC6Q2QYu9gbIdWsSdMMv3+Kd4s2GWW5jlt3t3vHd1LU2MYnp62+eXG8xa/0knSivwqYw/FsGXGdZ40AD7ijqfZbQtzWUn95i+tbk1nBFz49aIrNUwAX3lP6gIx3x4loYA6aSFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J36VZ3DMMcDo2sWQ0t2n2plnQveHPOZh3iCKv+UyHEE=;
 b=EXBaJSlzJOScquGgs/v42ZmAcbv+jpkbtat/aRuo5elUUCTwl9hfsojsGqYFUbQjIZNaTVRC37wilqfzeDxlfY9+qaSRbAEefNQRVwII9tLPDhpQSpHhO8lNTL7cup4OUnFVToTXO3UE39MbpRhfqXQQkEDW5PLDCzBlP+JaBPg=
Received: from BN9PR03CA0918.namprd03.prod.outlook.com (2603:10b6:408:107::23)
 by SA1PR12MB8142.namprd12.prod.outlook.com (2603:10b6:806:334::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Thu, 2 Mar
 2023 19:43:04 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::77) by BN9PR03CA0918.outlook.office365.com
 (2603:10b6:408:107::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19 via Frontend
 Transport; Thu, 2 Mar 2023 19:43:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.21 via Frontend Transport; Thu, 2 Mar 2023 19:43:04 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Mar
 2023 13:42:54 -0600
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     =?UTF-8?q?Jan=20D=C4=85bro=C5=9B?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        <Rijo-john.Thomas@amd.com>, <Thomas.Lendacky@amd.com>,
        <herbert@gondor.apana.org.au>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        <kvm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
CC:     Mario Limonciello <mario.limonciello@amd.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        <linux-kernel@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>
Subject: [PATCH v2 0/9] Export platform features from ccp driver
Date:   Thu, 2 Mar 2023 13:42:23 -0600
Message-ID: <20230302194235.1724-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT025:EE_|SA1PR12MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a9a9ad-858c-47bb-ba64-08db1b56572b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WfSZ7LJpcepxRnD6XZ8n5erTmBHNAgM9zFrYsluT3XXdi6Dc1640i1220FqZYNxtJLdjcNHCX5qZqsW9/PQ/nR2Pwt56m3+auiFIE/AAD70EtPNUkWZRa82bjs/HRSGf98SYe+RCknbQmaVTXD8aAQr753yB7HBH2orMIIADB1TdOgR5vdRSxl/5exCEwuzk6BDmyiY0Eq8f7Ctw9DBTwlXUe6iaaNCZ0RizwdMy52j1/PbpaSWAJqsZLNE1U3HYbQGmH6wnACJQcCdcQahmMRib8eFIfmKRrNzw5j1g6uAEtialYNMj2H61v59JE5eFcnPpts3k24gNBOwd5zAcbPX6eY12FxXgKo8XI9IGAYVjuzwis5zCtkKyq1S6QB5ePvQmhRABBlaU7QJfLnxsMEs49vsL41CTo8qFh2jqp8C2wckAbBGrm3GQaxjMZVPRSDurp2uLmmbR79/YJf1dsHeUE0+r12rkbICtZzFv4imbMrsoPUA1ObWgVDAriG1u6eqeuXGjjH0R9wpPYr4qAhbPKxju7vFLWVD6DME2WBtaQtyMm8oc60oU5Zy9A01Te1NUwjGTuAK6sAALC7nvZnppqtbojipDeBitY67yNSxkqHxtgfnvzky777KJKbErVK4UbmwJu7usJ0f9jsWP4NWcYah1O2eZ1t3TW4FC0IuFVbgg+b9njLe3ElPO7fCSN+bi7498vg1SIZJvKm3OjqNUUW0Hb1lozUfLg/dIl7XttWwpos8lLLkevEhK5UOy
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199018)(46966006)(40470700004)(36840700001)(921005)(36860700001)(4326008)(356005)(81166007)(82740400003)(7696005)(86362001)(44832011)(2906002)(7416002)(36756003)(8676002)(8936002)(70206006)(40480700001)(5660300002)(41300700001)(70586007)(26005)(478600001)(186003)(82310400005)(1076003)(2616005)(336012)(83380400001)(47076005)(16526019)(110136005)(6666004)(54906003)(316002)(426003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 19:43:04.6209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a9a9ad-858c-47bb-ba64-08db1b56572b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8142
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2c-designware-amdpsp driver communicates with a platform
features mailbox provided by the PSP.  The address used for
communication is discovered via a non-architecturally
guaranteed mechanism.

To better scale, export a feature for communication with platform
features directly from the ccp driver.

v1->v2:
 * Pick up tags
 * Fix dependencies
 * Add support for Skyrim (3 new patches in series)

Mario Limonciello (9):
  crypto: ccp: Drop TEE support for IRQ handler
  crypto: ccp: Add a header for multiple drivers to use `__psp_pa`
  crypto: ccp: Move some PSP mailbox bit definitions into common header
  crypto: ccp: Add support for an interface for platform features
  crypto: ccp: Enable platform access interface on client PSP parts
  i2c: designware: Use PCI PSP driver for communication
  crypto: ccp: Add support for ringing a platform doorbell
  i2c: designware: Add doorbell support for Skyrim
  crypto: ccp: Add doorbell register offset

 arch/x86/kvm/svm/sev.c                      |   1 +
 drivers/crypto/ccp/Makefile                 |   3 +-
 drivers/crypto/ccp/platform-access.c        | 216 ++++++++++++++++++++
 drivers/crypto/ccp/platform-access.h        |  34 +++
 drivers/crypto/ccp/psp-dev.c                |  32 +--
 drivers/crypto/ccp/psp-dev.h                |  11 +-
 drivers/crypto/ccp/sev-dev.c                |  16 +-
 drivers/crypto/ccp/sev-dev.h                |   2 +-
 drivers/crypto/ccp/sp-dev.h                 |   8 +
 drivers/crypto/ccp/sp-pci.c                 |   8 +
 drivers/crypto/ccp/tee-dev.c                |  17 +-
 drivers/i2c/busses/Kconfig                  |   2 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c  | 179 +++-------------
 drivers/i2c/busses/i2c-designware-core.h    |   1 -
 drivers/i2c/busses/i2c-designware-platdrv.c |   2 +-
 drivers/tee/amdtee/call.c                   |   2 +-
 drivers/tee/amdtee/shm_pool.c               |   2 +-
 include/linux/psp-platform-access.h         |  65 ++++++
 include/linux/psp-sev.h                     |   8 -
 include/linux/psp.h                         |  29 +++
 20 files changed, 432 insertions(+), 206 deletions(-)
 create mode 100644 drivers/crypto/ccp/platform-access.c
 create mode 100644 drivers/crypto/ccp/platform-access.h
 create mode 100644 include/linux/psp-platform-access.h
 create mode 100644 include/linux/psp.h

-- 
2.34.1

