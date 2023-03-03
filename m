Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB1096A9C39
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Mar 2023 17:51:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbjCCQvc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Mar 2023 11:51:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbjCCQva (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Mar 2023 11:51:30 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A46212F02;
        Fri,  3 Mar 2023 08:51:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2oxZ+5B6dUicnycInfYS11H8FTozxPb08w40LQITK1oo3PqfKudm48GetYlniKI78EbxZ/wf05sVoZcJHzMuWDmPHlW4Rh7qWVEokf7zZSzG+0O8tIByEun9Ondy0T1ZCLLc2YnA6/1jVOJL7u1A0h49zEBPENVfTELunS1O584kRCJBXtu/q+3ItrqcPLRE/PekbECOvFTFlx6LWXyk4H2llKnPDHYEO0q7UA+l8hG0u2PBeEqJ7BtZqM+/oEM1/CPp6j3G1Y2uTVtnQEf0KpotsLJSgKV55ADWV5x6rk0MLeytLfOz6QCgvvkqotTkUbAu11w8D2zRGYW6cwx5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wE/3EFKk2bnMmTC92U3G79VnKULruBcF/KvSsbEfVM=;
 b=Bb2ouHh6RJ0mgeh8O84eqU3D/P7uI9FZ7tqxQr2+WReqx9EgeIBc13e3id1LIpdN4uyWd4+k1sKknGWlEZi+CqVgX5DzcDZygPomD+x7izzNDG78HeGUUY6i24H0U/+lN4/ar9DZAo4BOYo7r/AB2OhbbODxfILgdTNgbJHPeY4jLLdUdNCNFkWtnOao62bRaFyv8IiCu48+P65cLrIcIiqTuRcJxMiS4jP9q6cyWWf77Awi18ytcZE5L+3yC1JRzWcILcK7SDfBbBl8wo8iITYdoAtLwoHHsjnKB95i91VIa/QPRCUPjKL8uQQ8Q3dwrVWjkdVLdD/phXHdHffIUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wE/3EFKk2bnMmTC92U3G79VnKULruBcF/KvSsbEfVM=;
 b=iJvGetz+ennXg9JQzWQmi3MahipiuJBCc0ZGXbyMDBxNzUiVP5cAnSS5DtGEet/SxFkzXS89ZZMqN9vnb7jYHLtVRL3UQTx6hGgRWC9m3733rdAV9tILOphJUTJrC4trvON5ksbNK7rN0eqX5ozdbW95mW9eqvRAx9+CP5H2gqA=
Received: from MW2PR16CA0063.namprd16.prod.outlook.com (2603:10b6:907:1::40)
 by SA3PR12MB7808.namprd12.prod.outlook.com (2603:10b6:806:31b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 16:51:05 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::61) by MW2PR16CA0063.outlook.office365.com
 (2603:10b6:907:1::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.21 via Frontend
 Transport; Fri, 3 Mar 2023 16:51:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.22 via Frontend Transport; Fri, 3 Mar 2023 16:51:04 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 10:51:03 -0600
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
Subject: [PATCH v3 0/9] Export platform features from ccp driver
Date:   Fri, 3 Mar 2023 10:50:38 -0600
Message-ID: <20230303165050.2918-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT038:EE_|SA3PR12MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a512e26-62db-47d0-1132-08db1c077aa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZtTMa8ylReLjf+reKSlqN07XHxZNMsNzJviehSOAX8XAokEQlnM8oyGKmWcUNHj1IP8Mh2kZJOhetW89RQzL+BdxSSxis/BBac/u9mZ9iNx5ppcVtyMdaxIYsUO2rDe+iVEEqO1QG2MvaIRfToduAPOlppZE4J4PwKaiQtbc4/pAiZvOYnvPGw0l0s9Ng8MevwQfVv0g89kEJIPfZGDExevxTQLw5umpdxPaH5kJgCXYskYZh7SDnscLhOzspBZhwtFDT/8+APaYXI6jxkV2nPG6LUHmpoNm9SeXXJtq44zvnSZuA6vrhqq1JV87XJPa+wgYrYAVszWGfuHNRC/9VpHw0w+fynXhZPvrItTUqOQp2gN/W1Qkg75dpRbC+UMqYEcrfipNl6J48c+/Kpr0RjYKX75I3Xp49+OKKbAzKgIe5h9+cG6hBVw02LqCixfbCPKyCVD5+cEX7euy17E2WI9HL1Jpb8j3tnGbtg+d2TlVQ1O3ShuV1JQ/ARKxd9dLMi+FLC5tFPEBaidorGWVJuRjyH6EQNzr5HNvCkaXlLfrJKTdsSxGEr9aNfqJTI/FPHYQgDdSyY0v++0QWlcrvliNDVdzRh9BRzTcqkMmg/nuF1qNNfXcrpjDTk79V1BMW91U2Tld7TxTVfJG0mXVnHRINjb5itccoX56XDGRSg3q1ujGdvqb/b0MJ3tzAR8oUwrUDtBIHJ4mfPANM3D+M/8XKph4z3zYR+HrvvcM1JWpzBbF0zfE/yf20QeO3D/l
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199018)(40470700004)(46966006)(36840700001)(426003)(83380400001)(36860700001)(6666004)(47076005)(36756003)(40460700003)(82740400003)(81166007)(478600001)(5660300002)(8936002)(7416002)(921005)(40480700001)(356005)(86362001)(82310400005)(26005)(16526019)(336012)(2616005)(70586007)(1076003)(8676002)(2906002)(186003)(70206006)(7696005)(44832011)(41300700001)(4326008)(316002)(54906003)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 16:51:04.9285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a512e26-62db-47d0-1132-08db1c077aa2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7808
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

v2->v3:
 * Split new ACPI ID to own patch
 * Squash doorbell offsets into doorbell patch
 * Fix all feedback from v2 (see individual patches for details)
Mario Limonciello (9):
  crypto: ccp: Drop TEE support for IRQ handler
  crypto: ccp: Add a header for multiple drivers to use `__psp_pa`
  crypto: ccp: Move some PSP mailbox bit definitions into common header
  crypto: ccp: Add support for an interface for platform features
  crypto: ccp: Enable platform access interface on client PSP parts
  i2c: designware: Use PCI PSP driver for communication
  crypto: ccp: Add support for ringing a platform doorbell
  i2c: designware: Add doorbell support for Skyrim
  i2c: designware: Add support for AMDI0020 ACPI ID

 arch/x86/kvm/svm/sev.c                      |   1 +
 drivers/crypto/ccp/Makefile                 |   3 +-
 drivers/crypto/ccp/platform-access.c        | 218 ++++++++++++++++++++
 drivers/crypto/ccp/platform-access.h        |  35 ++++
 drivers/crypto/ccp/psp-dev.c                |  32 +--
 drivers/crypto/ccp/psp-dev.h                |  11 +-
 drivers/crypto/ccp/sev-dev.c                |  16 +-
 drivers/crypto/ccp/sev-dev.h                |   2 +-
 drivers/crypto/ccp/sp-dev.h                 |  10 +
 drivers/crypto/ccp/sp-pci.c                 |   9 +
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
 20 files changed, 438 insertions(+), 206 deletions(-)
 create mode 100644 drivers/crypto/ccp/platform-access.c
 create mode 100644 drivers/crypto/ccp/platform-access.h
 create mode 100644 include/linux/psp-platform-access.h
 create mode 100644 include/linux/psp.h

-- 
2.34.1

