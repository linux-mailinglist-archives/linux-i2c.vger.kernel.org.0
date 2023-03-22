Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 163C26C5864
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Mar 2023 22:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbjCVVF1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Mar 2023 17:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjCVVF0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Mar 2023 17:05:26 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77167131;
        Wed, 22 Mar 2023 14:05:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=De1J6imx2ZuMprMK+BjY1a3NJUj0kOo0vlP0C8Q3PsVUH0MyNJJ/1GIuXJbqi67CbNYBz8nV1NZX/F9RiMV753QiUSaHFZ0JWXoj/1X8d1mCUmQnv8P0bPTuqsavaM2a+2h1TA/3G4+RiPeIc20zFdh82IPsFRVWk+fMdqpCQkYbcESR/jyLrhK0M9H3czvrXWuhfrZoAYEsmIagOK/Hx/6jKffEnaTPvr+thdwju+lsNwnzfkjRT3oZxEYOYwET+5j7OZ5bZiQKzRq/P4+ta787vc/crwapQ3Fl1LYCdBN6xq2QNNDXhtk/bNb7tacVWWj9fIx/FpNcQkI+Xh7iVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAvb4cFeD08q6PypqSti1GdIQ65q+8C1eF46Cz5KNd0=;
 b=QlhdDSndaXh01gPigp3r7q13NoUFtCpKr7uKrogTTk5KjjMl8mMtCS4ybVtGAF+yVgRpO7yqvAbhXcuqAl38Rvr+7zfSa3GSBk9WUlKMwswgVG4kOZhE4fYb4rB248da0tmhL9ikAkU41AktCiozlWWOP/J6vS7nHoGq2NZgkHk4ZR/DlGPsXdMxQ0WMWka5bzUBJFdUDXzG3r0K+MvCVvLN48KFIRjIk+eo9g30+LFBo2TnXVGcS7+QYiep7ez66BzM4K6tsZ1oQB0uv30WvZwgHF9OLwW5YpoWne1smpauy91zf69U56aFzMtY6kifWYn3LNPzwFqCyg9lZTmMhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAvb4cFeD08q6PypqSti1GdIQ65q+8C1eF46Cz5KNd0=;
 b=zhSFJRh4DkqnTmru1fOYEmy82uHbuYkw0C8SAKOTqZC9nGZ3YM8SriMUWSD3gPcRBXWiwnyKldJFkC7ECQiekC9SBp9wPzFeHDqFemZP64RnTR3LDov/kcat+vjvn+oqyWZTr2becAA/HxTkL0tsV3rZUBVlXW4GyCCpRwOAZA8=
Received: from DM5PR07CA0066.namprd07.prod.outlook.com (2603:10b6:4:ad::31) by
 DS7PR12MB6214.namprd12.prod.outlook.com (2603:10b6:8:96::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Wed, 22 Mar 2023 21:05:22 +0000
Received: from DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::59) by DM5PR07CA0066.outlook.office365.com
 (2603:10b6:4:ad::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Wed, 22 Mar 2023 21:05:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT026.mail.protection.outlook.com (10.13.172.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.17 via Frontend Transport; Wed, 22 Mar 2023 21:05:22 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 22 Mar
 2023 16:05:19 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     =?UTF-8?q?Jan=20D=C4=85bro=C5=9B?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        <linux-crypto@vger.kernel.org>, <linux-i2c@vger.kernel.org>
CC:     Mario Limonciello <mario.limonciello@amd.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 0/4] Use CCP driver to handle PSP I2C arbitration
Date:   Wed, 22 Mar 2023 16:02:22 -0500
Message-ID: <20230322210227.464-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT026:EE_|DS7PR12MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: c24d4eb1-cdc5-4f00-d1f5-08db2b1926c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 82fpAoCoHlWsqNWUUSsR+brTVOCH1O8hDgmYF+EpRwWPrkVFxsQXzAMU56NlPME3ZMds64QNy7UCQKwhbRUYWBq6Szlxnt0hFvivuJ2vHPfRjUb3q6Ka4IDAZ5fto8eeyBWCDhX3T+ePhcT3n+76vho0mZ1RUbFcLaS4M/+ViROVJXWTtsa/ys9aDOepO8jYOIFfUkPVRNe05M51BwLWEWqdnCsSFX2nFDxqfkapZ4XhY3naECkim3QyQoaUihrghcSrRvAtDnS5rNE5H4HA/pwBrvtjFj+SkmL+Bp8fGLC/Fa+JB74Lq5qqWC3zZlbSEGfT3wYpOR/X8R3tQS0XOKBy7PxKPlXMN7EEB5Ct06eFhARecDn22RMQmmK2w/bkmOQ4hJOsdWa8CZ6aZtjqXjbftoNuh8zPpNiIgDhpXkyu3N26fQrPBdi2e6JmJ+f+/FUdN4p6b4UhihiU3apePokYr+EP02iT3vdZdcmxIlRS10AzWXfSHqgeZ7RLtoWLLrfVa2DJfms/2EDD+nZdbz1vRYpdNdIpRJfZCoQhRhPxooLBUaKHT+fekE9c8ccUckgZvAq/mXd1XkpEVhz4ABZ54+d/TV3q4Z6SEyiMCO7ZHGGIMhXDI098NujgQ4a0nsD2HmbLCL1O4DP9BMIPEAb334DFDHedicqa1muknxZhKmRv7XM2MarkDiddrrcQuBMNK6wkFnKqGl4K4bBuajWdsWrcre68nxsmyWTrXy0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199018)(40470700004)(36840700001)(46966006)(2616005)(5660300002)(2906002)(426003)(8936002)(4744005)(44832011)(36860700001)(36756003)(81166007)(82310400005)(82740400003)(356005)(86362001)(40480700001)(336012)(47076005)(83380400001)(40460700003)(6666004)(4326008)(70206006)(8676002)(54906003)(110136005)(478600001)(186003)(316002)(7696005)(26005)(16526019)(70586007)(1076003)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 21:05:22.6689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c24d4eb1-cdc5-4f00-d1f5-08db2b1926c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6214
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

Mario Limonciello (4):
  crypto: ccp: Bump up doorbell debug messages to error
  crypto: ccp: Return doorbell status code as an argument
  i2c: designware: Use PCI PSP driver for communication
  i2c: designware: Add doorbell support for Mendocino

 drivers/crypto/ccp/platform-access.c        |  10 +-
 drivers/i2c/busses/Kconfig                  |   3 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c  | 196 +++++---------------
 drivers/i2c/busses/i2c-designware-core.h    |   1 -
 drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
 include/linux/psp-platform-access.h         |   5 +-
 6 files changed, 58 insertions(+), 158 deletions(-)


base-commit: e6af5c0c4d32a27e04a56f29aad587e03ff427f1
-- 
2.34.1

