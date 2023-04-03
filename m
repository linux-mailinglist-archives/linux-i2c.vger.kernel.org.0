Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8BD66D508C
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 20:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbjDCSc5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Apr 2023 14:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233214AbjDCScr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Apr 2023 14:32:47 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2077.outbound.protection.outlook.com [40.107.100.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558EF99;
        Mon,  3 Apr 2023 11:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzSsxTnnqWLjTnEi/n0MFixEpgFqZbA2oKaaPKjucgA/hh5XWNRn9c9qUiLYDpLn1sHrSxGrFWCNQA2uddJ90iv6gQqQZrgY87x7bILoPE0dPMVVyZk6sowud0Opdbjejnm8Yj9EoxKpRLBYDWdCQNNh3d0d4BZrdOSZxOLaGcvlhIY6czFtKQJtPknHM/8bkoUaUcwVZiT9nG+Q+R1ksOnGZqqbt2/RiyLlp8ewJPXOXWJkjXUibRwuQ58QMDB8vTkFv/W9qQXhE2ovErgTAUXXIP0T86Qv/JkORrS601LDuPkz6A3xdycRGElO4Tzms384pF762huhYucgppcSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zSbtEqpkeBowd4KDrkFSML+f/SXXR+j6Pg4GuLPiUU=;
 b=lX/jGDpc56az1oPWnhi3cead4Tj849e6fxZvHNsXWZkVgk+skTp/v3TRJVRzr4GTW/DfbZCPc7V8h1FkAmf60weCrAmXlowe47JyXiIy+DogB1bqkdGfN4rv2gMHTgG+evmS6JfstXlkQERSesCV0Uw3y0JaCJ583Xjr1O6++UFmlYN8/UaHwy64a9LqPx1OMRHYZHY2hBw54+geqmhEg1diA/NQP2spjPBUVbBaYC8kM/FDeirPg+UaEpOw8T8CxiMl84rX7sYxU2xzlZnF/KxA5iQ8NdOO9bVhxGsy9q7UGM6bZYhPhaE+fmzLtnXJtTX5siaYPoExm5z2LemxQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zSbtEqpkeBowd4KDrkFSML+f/SXXR+j6Pg4GuLPiUU=;
 b=IiDkY9egH5K/lagadrL8m5ExuJE+m7XTr/umnVgT/iYCZI0ry6BzWnGLSgfFPMi2Sm3L2EjT2+ArlksigqN/DRoklAj7Jm5enF+ytPKLM7H7NcPp9KQ9t2y8hdOhgkE+mU5tUpn45AqYXSwDKnG5/QEesYOSCReLasl7GUn0VRY=
Received: from BL1PR13CA0181.namprd13.prod.outlook.com (2603:10b6:208:2be::6)
 by BN9PR12MB5068.namprd12.prod.outlook.com (2603:10b6:408:135::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 18:32:41 +0000
Received: from BL02EPF000108E9.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::3d) by BL1PR13CA0181.outlook.office365.com
 (2603:10b6:208:2be::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.26 via Frontend
 Transport; Mon, 3 Apr 2023 18:32:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108E9.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 3 Apr 2023 18:32:39 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 3 Apr
 2023 13:32:31 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, <linux-crypto@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
CC:     Held Felix <Felix.Held@amd.com>, <linux-kernel@vger.kernel.org>,
        "Mark Hasemeyer" <markhas@chromium.org>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        "Mario Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH v8 0/6] Use CCP driver to handle PSP I2C arbitration
Date:   Mon, 3 Apr 2023 13:32:09 -0500
Message-ID: <20230403183216.3493-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E9:EE_|BN9PR12MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2564c7-4218-47b1-4423-08db3471ce51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 93s4pJeGyO6n+w2FlBwwbIiRDmWyUm5fptn6ryVnQ3jW/hVxRaYE3ip14iNuha61WprrTtM+kAroA/DeSn2BB0MIqfVOkCJQiwVPxUTcpEJv9i6KHeQfSgo3XIN64gBUstCHM0g/V79v1bTK05JbWL7IJmT/O1qzN7VIBG1iS16sYCzCvMazOJDK0IPfjkeUWVAc35JbJpyoLkVJE5LavFsGOKH298laW9Cp8b4x2ysXZf/iK3bXXy26BsokmjviToszeklmPloqiFQUdkv0saZQjj4iI4o4xrjcdjLBfprvCl83K0ZOKowmez+ux68fv2VTCOOZoIsOPETXXhOxk+Usaww7GmcjAjnXcSFPNL+cJIpECMHeRoytGZGEfgfUs0oGqivAO0r8/kYlArCNJPSAbIFb6RbzQhaD+S0SFqdqUTUEigHk4sIWw1H/wFqEzYP4ER5ZhkfY6X5BHp2gQ8d9OVKzcnYMZ0jGw6FgxPu6h6KoR2ZQFuJ9rrxPqIzLlZLlrdSCZguSsjovADeyqsTQIUnRRrhi2+VFiFwyyrO2FOZqbbgYcr/s4XdS+WHagEvy3y7QGNbUB+Asd4P6onTkwyE5p9shj8qzwcji0uzLHh8PA4I8/CBxkade+HY2RTM9bXnluPR8TlHliQg21L+pSAaylhcw6aGfdQ+OZ2kKldGNfcA7Zrs2aD3PMhkVpTbib4HbLUhsqgF1VRq86qLhCWbMq5zm5AP85Pzh7R8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(47076005)(478600001)(2906002)(2616005)(40480700001)(186003)(16526019)(1076003)(6666004)(36756003)(336012)(426003)(83380400001)(7696005)(40460700003)(26005)(356005)(81166007)(86362001)(110136005)(316002)(5660300002)(41300700001)(82310400005)(8936002)(4326008)(82740400003)(8676002)(70586007)(70206006)(36860700001)(54906003)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 18:32:39.9969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2564c7-4218-47b1-4423-08db3471ce51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5068
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The CCP driver now has symbols that can be used by i2c-designware-amdpsp
to handle the communication regarding i2c arbitration with the PSP for
both Cezanne and Mendocino based designs.

Utilize those symbols.

v7->v8:
 * Pick up tags
 * Drop hunk for error message change
 * Fix kernel robot build failures

Mario Limonciello (6):
  crypto: ccp: Drop extra doorbell checks
  crypto: ccp: Bump up doorbell debug message to error
  crypto: ccp: Return doorbell status code as an argument
  crypto: ccp: Use lower 8 bytes to communicate with doorbell command
    register
  i2c: designware: Use PCI PSP driver for communication
  i2c: designware: Add doorbell support for Mendocino

 drivers/crypto/ccp/platform-access.c        |  31 +--
 drivers/i2c/busses/Kconfig                  |   5 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c  | 197 +++++---------------
 drivers/i2c/busses/i2c-designware-core.h    |   1 -
 drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
 include/linux/psp-platform-access.h         |   5 +-
 6 files changed, 62 insertions(+), 178 deletions(-)


base-commit: d6cb9ab4bfeaaa69147948e42d7cff080db82d07
-- 
2.34.1

