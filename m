Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA6036C3CAA
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Mar 2023 22:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbjCUV27 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Mar 2023 17:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbjCUV2s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Mar 2023 17:28:48 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 134D3584A0;
        Tue, 21 Mar 2023 14:28:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTbWcSA4EmkfMo7rx0oRfcD7DzUut4ROwrDsaIF1hRvqu8BuuVnoIdL/DiATsdPj3PgUh0rWVzV/sDnj6LBiiVr4q7N63rjqriHJ3F+8E33V5xDhOatoTOY2kHbWontRKS2NSM3Q30/8PCbhL06Ymo2whWZrGvErTdM2MdZ2zRxZ8Bwal3Jxs4eOLM0ZmTYpyq3VDokDYVOxpIe3AuuNJ6IFACCjaEpdy8MTL+OFaLbCRWhxucm8SSCsdA4JB+Q+AskJHzeTSSm1WJ2ToXfuomdQFnoanNcW5BdlceII/oD97wXtGSQPer11O461gbBU7dAkNJbNDga/a8iIJ1ECfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7IGnteuwK0jXvShx1Y611QAoqEIK8YvjVv1UGPU+18=;
 b=HrKi8S3FxdfQfAp4WSzBmMeRAsRCULujbHTByZhr/yK0ZEY0oozxdkPdfF/kxveUgI7/Fv3S0ARZ4/CAYCQu4Azps9R4T7eyT904KtsMJOlZBTMgFKOY317cnYqA6C2cqt0n2gdt30HASP/n0IridurqocwJEiEy5vM1ou5UP+WQeYegvEYjuqbtVA6ey6XRkAVDN/TBVzki8QT+Adkpjy3ZIsA/lB8RweXmRRcTbc79i5bc48l7vEtJnLcRsbffEjx5Z/GyF8Qy79BebSTVuqOWVRfUk8IgmtaTkU/eSQCCl5K4t3XWtS3tJVm7dZ2DPmZ1A04A6TLqbL+r9lUnRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=chromium.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7IGnteuwK0jXvShx1Y611QAoqEIK8YvjVv1UGPU+18=;
 b=426VAEzTAwKk/TJarV1MZAvROprGNk5vwTIwWKbWJwxeD8xuTmW57g9BywWsgz3gk3Cbsccnpi2Ztrkij1qTXC+f2jx5VXBN/vj9ub3dbJA81cPvbKz29vV97NJxQtegPdZvWI9Jol/R42TX7saA5/UlxQzrjOVyZpwHPRdtU4g=
Received: from BN9PR03CA0120.namprd03.prod.outlook.com (2603:10b6:408:fd::35)
 by IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 21:28:33 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:fd:cafe::1c) by BN9PR03CA0120.outlook.office365.com
 (2603:10b6:408:fd::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 21:28:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Tue, 21 Mar 2023 21:28:33 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 16:28:32 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Mark Hasemeyer <markhas@chromium.org>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Mika Westerberg" <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, <linux-crypto@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
CC:     Held Felix <Felix.Held@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/3] Use CCP driver to handle PSP I2C arbitration
Date:   Tue, 21 Mar 2023 16:28:18 -0500
Message-ID: <20230321212822.5714-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|IA1PR12MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b23c9e-d142-4248-1f11-08db2a53394c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +6DZl/UvC8Z9mypjwFdM0FQNYLG6WifKhDPEMHjpcKocVRxcuCJywobBojO6Y5F//WgRwhBmbvQUzXFIH++mDLiuYXSUySwCjP/CbF5Aj2lDsfhLRVL/m8soaEluquMsN9g+sko+XPolef7/5ZSdTNyxPBLrRjWRHIP9nKZvQSopDehBChbxbefygIxJiy8WRDMu0QMcxvdBv0LorosoBkIu07WFw88wm+sKB9w2w1I08XMpZGvEEW+jjH7VL5piqJ7Pod7oVJk2gS1K1XaITgUkZvyOhtu/TpXyeedvI8cbq4DXOv03mh61Z51Tl3k7d7s0+e0Au8fGwd/L4f/hPYCBsG2Oc6N1yuhGfkGalPipEUOWqZT2+9HT56sUjqh4Rhzq9/lPip9rVZcSOrFfEhFjpj9EC+i2sXFXWwCLeMJo/9+ZiNxiJGUBkXJhm+6IA469p74pIttilDZzdKyGphDelC3deh8i7PHWweYPQXN/GoOY43Ucl3BgO1fh+clR4tf8HRcGQa/T7fxt9Rz0HNZ68OhjLGErWwWoGjwxLmiyGnh81uuKMdRqzTgL3RscruwTlGAwKMNK+rwL6SOJ8K0VdsKkmT+sVuh91UtnVQyWZ5hiiufmaYWMwjM1p9H38oNAAn4sTyv/xzgCw+plWBJDet96kte6xymjOxiG8/G5SQ+Afii8sMrmhQGgfnJ44HT3Xb1VMMhTOtspXsBB89Cw6jhlT4caxhxSyXHfJtg=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(86362001)(82310400005)(40460700003)(36756003)(40480700001)(83380400001)(4326008)(316002)(70586007)(8676002)(70206006)(478600001)(54906003)(186003)(16526019)(26005)(2616005)(336012)(1076003)(110136005)(6666004)(47076005)(426003)(356005)(8936002)(7696005)(4744005)(5660300002)(41300700001)(36860700001)(2906002)(82740400003)(44832011)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 21:28:33.4530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b23c9e-d142-4248-1f11-08db2a53394c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8495
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
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

v4->v5:
 * Rebase on crypodev-2.6 with merged patches 1-5 & 7
 * Pick up tags
 * PCI dependency
 * Poll for busy
 * Make errors visible rather than debugging only.

Mario Limonciello (3):
  crypto: ccp: Bump up doorbell debug messages to error
  i2c: designware: Use PCI PSP driver for communication
  i2c: designware: Add doorbell support for Skyrim

 drivers/crypto/ccp/platform-access.c        |   7 +-
 drivers/i2c/busses/Kconfig                  |   3 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c  | 192 +++++---------------
 drivers/i2c/busses/i2c-designware-core.h    |   1 -
 drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
 include/linux/psp-platform-access.h         |   1 +
 6 files changed, 57 insertions(+), 148 deletions(-)


base-commit: e6af5c0c4d32a27e04a56f29aad587e03ff427f1
-- 
2.34.1

