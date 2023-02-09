Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 093C9691375
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 23:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbjBIWic (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Feb 2023 17:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjBIWic (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Feb 2023 17:38:32 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233B856EDE;
        Thu,  9 Feb 2023 14:38:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neC5cJov89mLNNSwpqs/RQo9M584zz5Hoy8m2ZsLhIEeDlB+2Lpy+zm9pMIHISGZ0ceUYLXkTwAK2iOe9yaNd89HUHm8jH8vfcQC+pvydaWVF4CV1atA9GKD3XeXzIhk86LFii//O4iGYg/ihofY80JMXifKyU5qsNgNUJPjGMhC2iaeqqqIjImSZeOAzB0VBEBjtxpMqNWqtYZF1IvkURkxrH/mjbAGxZTs5s6F9GdIzl8yYF+NeI67lNHDmGoIMQm6CZY0ubuLEJLqYtJQzyLcv+6msgQl3gmaw0rhz7WZCtWubjE7up/riK9sKoXBQS1+dJWYCzdu5J7vTcGL2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10cxf3AOQcl4E54/idE065bFMSUnOF6E4tfd704wH0o=;
 b=SlG4Tv/mrLDxK4D9rcMRDXJGmKbpUVb8zW12m/LrZz1UfEsUP2vzoioBgHIqyBwdfCtrZdn8S5I4jYAL8A/T6uXLcGcv+y0301neqYuWjbmmnvO9a+c3pt0pjozw4TRZ8GMQEh82ce9+GaFdHUIWnDENcs54iN+vc5u5DxzMPvcJq2HDhbDDjBQBy/+TwxvdaQ126wpaY5N7t6118VLfv9gropJhmyy0XzsBLCHaJmFX2U/X1vh7BwGxt8VaO0NAYjHIqFWHZtIHtvuaJDZVUydcA2r7RKiA1ud+Q1gEm7gyzU7uvWwa56ul3UR5U2mX0VQmypDPkDNMgKXof2S8pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10cxf3AOQcl4E54/idE065bFMSUnOF6E4tfd704wH0o=;
 b=B9elWmjPxrjuAPrpfkVmOxgDE2g57kJLaTzfVpIWEu7NP//ak/oeP/lckaAVapcr6xjUUwdHGvYuzRfr7mgyn0KKtYez6S+/N+tCnOoMXNxceqtDdlprdYy4pzlqvWCCjuSqQ6H+IOc9pF/NvDTU/dBVq+DtonIgbdDEX+y/w/Y=
Received: from DS7PR06CA0047.namprd06.prod.outlook.com (2603:10b6:8:54::27) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Thu, 9 Feb
 2023 22:38:29 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::57) by DS7PR06CA0047.outlook.office365.com
 (2603:10b6:8:54::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Thu, 9 Feb 2023 22:38:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.19 via Frontend Transport; Thu, 9 Feb 2023 22:38:28 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 9 Feb
 2023 16:38:27 -0600
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     =?UTF-8?q?Jan=20D=C4=85bro=C5=9B?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Thomas Rijo-john <Rijo-john.Thomas@amd.com>,
        "Lendacky Thomas" <Thomas.Lendacky@amd.com>,
        <herbert@gondor.apana.org.au>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        <kvm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        <op-tee@lists.trustedfirmware.org>
Subject: [PATCH 0/6] Export platform features from ccp driver
Date:   Thu, 9 Feb 2023 16:38:02 -0600
Message-ID: <20230209223811.4993-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT038:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eee4d7d-12e4-4562-ebca-08db0aee5d3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vfWtBKbxq1+8a4ud44IBfExgbcMQEBz8rusddVlnfa57XubF9hTjAjliDw76LFWnEifWGajZVaEOziz0MQYR02vldom3ju1J0qOzmPBDJ8Zv5ZbkKdmROMB7S4jC4W1uG7C0tL0G9s7aKXcZc30o+1tyJOQ9II1JadyzHrxu0qXLxLOwkRjABvxZcVyNau9o2E1Q1b5o4BN/EYRA2Bnca9lz3QTsE37pjPqy5ZFXGzh4V7Bzi/Y4iOdyoYqQeIYMQOzSACLMD0gl/BHZAg0oRthjp46ic0VTDu+SnY5Tm7Ps6DyR7I+WrXq36W6ioOyDRwmTT23r0WKUZbkHqLYB3zgvDNGo9Ch3kLG8poZVHW1+lQ5LbPAiRwfYZnX0Yxg2QRVZ8LTL0Ckizv7yYg9JCR9jgQ9tDpeBeOhl9fC1j5kc/jXxf/824hHkgFsPlkAXfk5GNP3M8z6UsuIox91s7bUdenimYUn+5qrlsyr9cNdBheEq/5yr48iE0w6sHGsAdbwRtCGCNRRMp+aSK2E3atK4nUApf5/oYvZ8B3Ywk3ZT8pfW6JopJ/rSq5tncXhC3RsMK7/p+K0XdV5H1ALTFXY8DC7meD9DmY8F7doeRuC5apjA5tG2RQzYzVRqXA2oEtXWMv54SLu3VVJj05oJd/jimFO6aBlm9argVgf49I31yJweAiWJtjKNSG1mJS4nQFAEa+3LLDP11N7k8Ub7sCOa/c84ecfn7OCpms+z1J2kmyjxKtCQBZqNJCzHPtax
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199018)(36840700001)(40470700004)(46966006)(426003)(26005)(1076003)(86362001)(6666004)(186003)(36756003)(16526019)(83380400001)(336012)(7696005)(47076005)(70206006)(54906003)(316002)(110136005)(70586007)(8676002)(82310400005)(41300700001)(40480700001)(8936002)(2616005)(36860700001)(4326008)(44832011)(7416002)(921005)(2906002)(40460700003)(356005)(5660300002)(81166007)(82740400003)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 22:38:28.5109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eee4d7d-12e4-4562-ebca-08db0aee5d3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945
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

Mario Limonciello (6):
  crypto: ccp: Drop TEE support for IRQ handler
  crypto: ccp: Add a header for multiple drivers to use `__psp_pa`
  crypto: ccp: Move some PSP mailbox bit definitions into common header
  crypto: ccp: Add support for an interface for platform features
  crypto: ccp: Enable platform access interface on client PSP parts
  i2c: designware: Use PCI PSP driver for communication

 arch/x86/kvm/svm/sev.c                      |   1 +
 drivers/crypto/ccp/Makefile                 |   3 +-
 drivers/crypto/ccp/platform-access.c        | 166 ++++++++++++++++++++
 drivers/crypto/ccp/platform-access.h        |  34 ++++
 drivers/crypto/ccp/psp-dev.c                |  32 ++--
 drivers/crypto/ccp/psp-dev.h                |  11 +-
 drivers/crypto/ccp/sev-dev.c                |  16 +-
 drivers/crypto/ccp/sev-dev.h                |   2 +-
 drivers/crypto/ccp/sp-dev.h                 |   7 +
 drivers/crypto/ccp/sp-pci.c                 |   7 +
 drivers/crypto/ccp/tee-dev.c                |  17 +-
 drivers/i2c/busses/Kconfig                  |   2 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c  | 149 +-----------------
 drivers/i2c/busses/i2c-designware-core.h    |   1 -
 drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
 drivers/tee/amdtee/call.c                   |   2 +-
 drivers/tee/amdtee/shm_pool.c               |   2 +-
 include/linux/psp-platform-access.h         |  50 ++++++
 include/linux/psp-sev.h                     |   8 -
 include/linux/psp.h                         |  26 +++
 20 files changed, 340 insertions(+), 197 deletions(-)
 create mode 100644 drivers/crypto/ccp/platform-access.c
 create mode 100644 drivers/crypto/ccp/platform-access.h
 create mode 100644 include/linux/psp-platform-access.h
 create mode 100644 include/linux/psp.h


base-commit: c7410b425de40e9b163eef781e1bdacf1bf2962e
-- 
2.34.1

