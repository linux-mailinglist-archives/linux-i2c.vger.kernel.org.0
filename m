Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 318086B52AE
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Mar 2023 22:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjCJVW1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Mar 2023 16:22:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbjCJVW0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Mar 2023 16:22:26 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D3D12B3DF;
        Fri, 10 Mar 2023 13:22:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W88ueTW8sPptkz9bqzG3fug1cKivz0bweyyqNYLsWuDqVJLBa9enfADCoBnkGsS+QZUU4wpjLSMWdPxp2cRXNQG4T71HOqK5dZMoc2vhK7callgL8YMJpinhDlHI53YbzJawPpoZOzmuF2JFjgsuGMgE25LJ18cTe4YYs0L8CVWdqKYUdWyFrUCPFCQU3nEFYwvZuwlIr360Iwue12Uk3XAGF0b3Nvvx0X4BhKyhtpqHMLsudzCPfgOmdYG00zMSZLfbZL8BiR7jJ3R/d/sn2yupure1KcrJ88UKMhvzBttHvm09S5p9VWs5O7CIe+2yJWKuNVskOuznmdBG8yJlgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXQOOOkZHN/lzg9JlehClQAwocn0/y40NL28WfTopQY=;
 b=CxLwfdPMp8uLYivooBWw5ASG8EsG0rAmyqWQaOzeR0t2aDtCdpMOyQ8y1gdgqV+OnFccr9/XNdxXqgZudLHkdK3pDoHKiyUnSntOTBMsfn3KBnFLYqQqOJw4AVgIF4s2PwVIMyuY6nvNWVIaZn80ymdAGhBhRrii1AxC4TPMiqR1CxYrBCRa5t1ObyoHe0TpYkYz8jaW63j7Jwu6pqzsys6oqg7fUOlSldimbUqRpUpajLDSzotls0Hldz64bdBXKrPifKxit2BfhX8ewZOauTrrptyzeKkcM8A/H1hkakCB5tpzS3Ri4zXtxqsGm0phyZjBLLtisf8o6LnC7KGVvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXQOOOkZHN/lzg9JlehClQAwocn0/y40NL28WfTopQY=;
 b=w/0m5735MclCmCFz9jOb/B/wKUhRwIIkQBMtzjveCNn8l9UM3s46Q0CpkCHrpWWfs4f7BkhYNU63jDWecMZ4bONVTzO0/stmb5inwG4XhSstYIK/uM+4jZ4mgyPzm3oHTNTLUqhDTS7bWmUIHDlWR5moW+2gzlNH6HXVOniPi7c=
Received: from DS7PR03CA0163.namprd03.prod.outlook.com (2603:10b6:5:3b2::18)
 by PH0PR12MB8150.namprd12.prod.outlook.com (2603:10b6:510:293::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20; Fri, 10 Mar
 2023 21:22:22 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::e6) by DS7PR03CA0163.outlook.office365.com
 (2603:10b6:5:3b2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20 via Frontend
 Transport; Fri, 10 Mar 2023 21:22:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.20 via Frontend Transport; Fri, 10 Mar 2023 21:22:22 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Mar
 2023 15:22:20 -0600
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     =?UTF-8?q?Jan=20D=C4=85bro=C5=9B?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        <Rijo-john.Thomas@amd.com>, <Thomas.Lendacky@amd.com>,
        <herbert@gondor.apana.org.au>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        <kvm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
CC:     <Felix.Held@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        <linux-kernel@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>
Subject: [PATCH v4 0/8] Export platform features from ccp driver
Date:   Fri, 10 Mar 2023 15:19:43 -0600
Message-ID: <20230310211954.2490-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT021:EE_|PH0PR12MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5d29bd-42e8-48fe-aaf5-08db21ad8978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GjB+onl2UDR5p+U3VxJXsVx3nsaEAFdARNf5VPOmJksBZLCADYrR7maHmSFOpmsd65a5ULMypHYTJs427UBhSaxMupobdjGpSAVb2mdfzYXP+hf2eQhjY4TB9A9CUP13V80x5TNVnUJF+s/hhUqKkJJnGc2RnCwUtWvgonN7Qog+/l2hmuFGkVnle5E5XZf77lH8IZ2fRq38UZFpZ0bOZoiiGx/TVQe0P4nFwnCRjn3NKqO7HKbPBFVRdWbSiGtk9oBD3O0jlpVzEB6iIG9yVLhp4SBgpap67NCya7acJideTnpl9IT3m+WvS7gzBrOQAXzf8e8Xg22WuQ7T3pbjIjDuv1fPYPBqTkfJcOB0VB/r49R+XAW5SYzLrK0Fa/z8e4Y93tkRZUQF911EKxGWLdcjJ498dTxk+d6BpgjklJgnF9xqtGMhCZJWCRdXHbCFW3LNs2s5DfVpf9e3i3YD4xtFibEJ6fNQAAAHZr/Zz1z4vop0f9HLv/5Ii4zGLrNrtK3+4zrzNA7lui515Awf1lrk41PnTK59OzUxuCDEVCJ88flBL1j94fwIRXqymK/F25J8dMj6DP1mtMlzURJxTzhEHFa1aqdP2TO+5BUBsuSIOUJQgt3i3Fdcx71fUi/73CgUb5gdP6eBYnO4soFjDA0HB18vTQfOQwcMc1jBDFGtSTVct2YWnm54SPPaaPFEylewh4mEK+1jxzzakmtNfA3yGDzoenpHbGO+o3aNNPsjpYMbJirzwA8/VzN1fmHA
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199018)(40470700004)(36840700001)(46966006)(82310400005)(36860700001)(6666004)(82740400003)(83380400001)(426003)(47076005)(36756003)(478600001)(40480700001)(356005)(110136005)(54906003)(921005)(81166007)(316002)(336012)(2616005)(40460700003)(7696005)(186003)(1076003)(26005)(16526019)(7416002)(2906002)(5660300002)(44832011)(70206006)(70586007)(8936002)(8676002)(86362001)(41300700001)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 21:22:22.1565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5d29bd-42e8-48fe-aaf5-08db21ad8978
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8150
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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

v3->v4
 Drop the ACPI ID as result of confirmation with internal team.
 Future platforms should use doorbell, so will treat Cezanne as quirk
 and assume doorbell going forward.

Mario Limonciello (8):
  crypto: ccp: Drop TEE support for IRQ handler
  crypto: ccp: Add a header for multiple drivers to use `__psp_pa`
  crypto: ccp: Move some PSP mailbox bit definitions into common header
  crypto: ccp: Add support for an interface for platform features
  crypto: ccp: Enable platform access interface on client PSP parts
  i2c: designware: Use PCI PSP driver for communication
  crypto: ccp: Add support for ringing a platform doorbell
  i2c: designware: Add doorbell support for Skyrim

 arch/x86/kvm/svm/sev.c                      |   1 +
 drivers/crypto/ccp/Makefile                 |   3 +-
 drivers/crypto/ccp/platform-access.c        | 232 ++++++++++++++++++++
 drivers/crypto/ccp/platform-access.h        |  35 +++
 drivers/crypto/ccp/psp-dev.c                |  32 +--
 drivers/crypto/ccp/psp-dev.h                |  11 +-
 drivers/crypto/ccp/sev-dev.c                |  16 +-
 drivers/crypto/ccp/sev-dev.h                |   2 +-
 drivers/crypto/ccp/sp-dev.h                 |  10 +
 drivers/crypto/ccp/sp-pci.c                 |   9 +
 drivers/crypto/ccp/tee-dev.c                |  17 +-
 drivers/i2c/busses/Kconfig                  |   2 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c  | 188 ++++------------
 drivers/i2c/busses/i2c-designware-core.h    |   1 -
 drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
 drivers/tee/amdtee/call.c                   |   2 +-
 drivers/tee/amdtee/shm_pool.c               |   2 +-
 include/linux/psp-platform-access.h         |  65 ++++++
 include/linux/psp-sev.h                     |   8 -
 include/linux/psp.h                         |  29 +++
 20 files changed, 461 insertions(+), 205 deletions(-)
 create mode 100644 drivers/crypto/ccp/platform-access.c
 create mode 100644 drivers/crypto/ccp/platform-access.h
 create mode 100644 include/linux/psp-platform-access.h
 create mode 100644 include/linux/psp.h

-- 
2.34.1

