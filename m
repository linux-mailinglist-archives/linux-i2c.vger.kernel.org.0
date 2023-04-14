Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3FBE6E25F2
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 16:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbjDNOk3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 10:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjDNOk2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 10:40:28 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7295E4ED5;
        Fri, 14 Apr 2023 07:40:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmYe/IXiQSjhMX0G/AAs4rgpK/cNUJ/xfxO/hT6JL6Q40v2S2wsfa+iIOi/rey+GjKeb9Y8PXMtgJngXqPWqlIpQ1YAU7itRXgaO8tHe1k3C6RVGL8A6jkohsMMphUw57kYSRZ+WX87E2bYeOpuTzw2878AJeE+vyI1HEZvSHEyTFvkJGr0/rILySiY/2rUQm91F/T9VNaaSh0JL8OsUWf1t19wt8WtnZsYIS9bXl67LU87H4Ip5KfGM7dGzFMg3kZiqZglEBYaZ1nqt/dReElIUyFCKEnSH+ziVfCKe9iuGZP9LgiR7SStnOJCSPGhJHmtQyYt/dI8++mUj70p/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONOVSniRBduhW96TjCCba/8MQUcS6+KmVHb0z4YH23E=;
 b=idBoMqKlQDdcTWHlhwrz20LZaTx/xzvzovqPSjNuz2P0dNEJZGFxGZe7UzngF0nPRMw7/Td5eoOeS55RkNHe2SSEpyviNOGOfna0LuC/EZ22X52gl6QmoF/kXLoaX7i8/Q1X/8xBasSjpKUJ1F+w973ZLJs01wTO5jP6k8KzLTxcewjB2Xx1ciQHjHBT3Oia7V0zDhwZcCNDbs8ePAj6sqvwPeNQH/G2zMQljO8OiRGAW1kt4xPndJ1tJY+sVSy59VyVbrJpakAmF4XsJo3fMGgJ6Cp+rOrO2bBZgNnVEk5gfeoh9BCwq29DUsobgtXTsaHdXOSSZ9e+oVIoJ8Ht/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONOVSniRBduhW96TjCCba/8MQUcS6+KmVHb0z4YH23E=;
 b=ar9x2oKoIX3NQ0JYcji5hyeXdhRWedf07GatvYfbBUXdKphlqGr3b42nQTluCL/f2h57gcfFR4n314QbT5WPgKsg9lIpEsbbu42EYdrR6/Ym/biGrTUsShzaNojOpG3OR0I5G2OcbBOH1wEU1yAgdxq3JbEVUqisLDpgGwHLie4=
Received: from BN9PR03CA0108.namprd03.prod.outlook.com (2603:10b6:408:fd::23)
 by PH7PR12MB5998.namprd12.prod.outlook.com (2603:10b6:510:1da::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Fri, 14 Apr
 2023 14:40:25 +0000
Received: from BN8NAM11FT090.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fd:cafe::5) by BN9PR03CA0108.outlook.office365.com
 (2603:10b6:408:fd::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Fri, 14 Apr 2023 14:40:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT090.mail.protection.outlook.com (10.13.177.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.33 via Frontend Transport; Fri, 14 Apr 2023 14:40:24 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 14 Apr
 2023 09:40:22 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, <linux-i2c@vger.kernel.org>
CC:     <linux-crypto@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 0/2] Use CCP driver to handle PSP I2C arbitration
Date:   Fri, 14 Apr 2023 09:40:06 -0500
Message-ID: <20230414144008.836-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT090:EE_|PH7PR12MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: 64b6ceff-74fb-473e-a24f-08db3cf62e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wwR/uNEyLHZN9wcs/UKJskLMb5mfXKfA3Iptxc4pbNTamu08zlKPRsKHiwsuBDQRoIfELhsB1TpTSzPUbpu7CGJ2uqhJctXxqNwwUog10W24g2xU8LtNRl2VtrhhNZM3EVNUffjXd1cfu7lXuDEOq1YXGFODPOLj8ezn0+B76vrFK2WjdbWanxi79qC2brxFFucfD801fzYMLhmTOny2DZ55VFcIYLfniU+IIi0TUUkLOif1TcKSivn/VWBO1U1V6diBOPLhu4Gdb38757dLD3SbM/2gDhP7qO3GlqM/Uu4iBlIiYNeE6BlYU8eXTIgTmY3Nt2ZtFmetRpq/r36LTXTJmjPxn8neIHcPBuBDyxSqOmjVtioxpJ5RtV6CLSzt0sONwWSdOo9wuw2P7osmxbcSH+gFiFzqsQtZJ9NsP0ng0mlem3KBIsdTsMyhqZFy5ubR9c9iWk9Faf/xlAkv7mEM/NLrmFbJNUwjvYVN7gSnCOXZE40P/IhI0mwrBmHbfpOLWe0CRngSr+f66wpo/v8lYmbDFM5dmDWrOAYXRkhyQotaRFuQfcvxw2ZLE9eKujcGvpotW/rd8qw+kF+LrJlewLyf9caN9LIarv9o+96KyhH7iTTSYfmFzX+zpDqPyFbaVRN/E3qYud9Lj6T3v4CPcrdXMXYMCiJBr/EBwVs7DZiufCvv7Drwsvh5Qnsfn8prLUSiuJohNX+VS5GOa/TojU9cCa4yPDyX/HZSdco=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199021)(40470700004)(36840700001)(46966006)(5660300002)(41300700001)(81166007)(356005)(8676002)(40480700001)(36860700001)(478600001)(2616005)(8936002)(82740400003)(2906002)(44832011)(4744005)(426003)(336012)(83380400001)(47076005)(82310400005)(186003)(16526019)(40460700003)(1076003)(70206006)(86362001)(70586007)(26005)(316002)(110136005)(4326008)(7696005)(54906003)(36756003)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 14:40:24.2285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b6ceff-74fb-473e-a24f-08db3cf62e7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT090.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5998
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The CCP driver now has symbols that can be used by i2c-designware-amdpsp
to handle the communication regarding i2c arbitration with the PSP for
both Cezanne and Mendocino based designs.

Utilize those symbols.

v8->v9:
 * Drop v8 patches 1-4 as they're merged now
 * Pick up tags for v8 patches 5-6
 * Repost to linux-crypto as this needs to merge through crypto tree.

Mario Limonciello (2):
  i2c: designware: Use PCI PSP driver for communication
  i2c: designware: Add doorbell support for Mendocino

 drivers/i2c/busses/Kconfig                  |   5 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c  | 197 +++++---------------
 drivers/i2c/busses/i2c-designware-core.h    |   1 -
 drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
 include/linux/psp-platform-access.h         |   1 +
 5 files changed, 53 insertions(+), 152 deletions(-)

-- 
2.34.1

