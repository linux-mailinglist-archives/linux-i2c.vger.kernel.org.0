Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 505CC78E903
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 11:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbjHaJDR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Aug 2023 05:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232683AbjHaJDQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Aug 2023 05:03:16 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F35AE40;
        Thu, 31 Aug 2023 02:03:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9ow2kb/FV3kdHTJmMgyDOmR6xsdX4/Z0PlVxcoGimsSnzD480BhRExLOKLoQFWrP3CM99JV7umernAnoZaCgAiCBSZfyxy4ZXant8Qii2k/SL3hlxC32Of/5T+jZKg2BFCvPGCpDid7eDMlG3iRwsS+r/UrayFgh6m92vz/2XdNhHBzCdeCecmMw+eVTeLioTJkD6YE6pbzhFTYHWsPZgSg55vJgCZuqX7bpDo/XPcZ/eG+H8bUaImWk/81QRJQKHzeVbSIRY0fQJuUGAIamo6nF/ZiBN0BllxBW8VZrHcIgJSes/yVkIaXseNOY6XoRRC+MsBzmnsKmX9SNRAwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=838ZrtPkm5xzWHdu3dWRtfhriqTAusG3MGeLqzm7CgI=;
 b=bxkCrNDxAOot5jLjDQR+f8VgwxBPT+D2SW9cn+W1Fq4LT/GKD8ebKFWQdGCypiPC5Q7c39dlJj8m2xup5Tul8YOEEd7jmQ07vKucPPkvV6rM8HHgoVweVYHFlnYdukNYvvN9Wqltq4fxAWtH/GasHQcChJYNqkl6IgpylhOQ7X0nIgkEkcQC9dtGaxC/NbUSRS5pesMrlRBbgM4UKFYkUxTcCG4WiVEEMiWMGcVYz7xe1m40e4zT0pq+mDUln8glSoKhZlY+iI3VFboA9Gjcor9Q4fkH9THZL6W4f7762S58TfGgOE/HS04YhmSOiYFegZ2L4TgYi/A7NNmwjjdcsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=838ZrtPkm5xzWHdu3dWRtfhriqTAusG3MGeLqzm7CgI=;
 b=X5nVs+qslvjD/5b74abchI4brTtYBpcQaU7SuQAfA/xZEFGF5pfz8/e6jpqSe5rgvCdQhHReqaR8PZVetUDN+ViJV8XdnKChywKOylRlK2EMhZJTQy5bkor96RWPWuHIhpBbTudzCiQzPB0dStex2DeM2Vpqh2cuU/1IfgbocRU=
Received: from MW4PR02CA0004.namprd02.prod.outlook.com (2603:10b6:303:16d::19)
 by BY5PR12MB4228.namprd12.prod.outlook.com (2603:10b6:a03:20b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 09:03:08 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:303:16d:cafe::50) by MW4PR02CA0004.outlook.office365.com
 (2603:10b6:303:16d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Thu, 31 Aug 2023 09:03:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.2 via Frontend Transport; Thu, 31 Aug 2023 09:03:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 04:03:00 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 31 Aug 2023 04:02:59 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <git@amd.com>, <linux-kernel@vger.kernel.org>,
        <michal.simek@amd.com>, <andi.shyti@kernel.org>
Subject: [PATCH v2] i2c: cadence: Fix the kernel-doc warnings
Date:   Thu, 31 Aug 2023 14:32:53 +0530
Message-ID: <20230831090253.9096-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|BY5PR12MB4228:EE_
X-MS-Office365-Filtering-Correlation-Id: 8044bdb5-d2ee-446f-b571-08dbaa011829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JGqqSCGhkkI3YvZ/Aj+XxICMSdeNZBL5Fpkw1NqWYisP14u9Mxq1yOXgHT7JQMH9EnVgk3CsrbF62TJGmE5YUecTnCECd29zwgSAL8pikmN9OpcDeGhn46gZ3W0SBYwDacgJj+n+Foxm6lZu++KPUqy1qITT24CKddRsxZghkQiehUPz0mBfP3atgdLLNtAlV1UyXvNdjdT2Jiax9F4f03apP9v8x+FZ03bHxP1U09a/OySrf94kqFM/i1d9rbxiN2XwMWu6R+JMZCts4tXYqRRH05ksxC3YCihTjiB4GhmJCJgVpMXmQi+kRg1gQkkKLL3KPcA6gChb4iG4kd6nTpW28yLnDq8TukfLR6cz4UqXUczaaZWEh/jQm+jOAUM1b5FBLuKe5v6LH4gTtH3ESZJFvrwB08t8ct93y3+k759XFjlZCqQkvaMj/7sAgzB3RGxk4jhIojuq2tYtr2VZ/y/EpSeoIlwYMmq9UGadhMhR+Npo743bfGxlTVSl1XE4NDOotsWwpkY6sqILY3pE8sovknQtW2d9lNl6r+JbUGBuF5WIQqObblvIz4mHeFluvCniZKs+12HBdkM8ZxI5f4+YFe7JVyxaGxUGSzDOlyg+sl5YE/VF4GMxBe8mHG+oqJUQXlbLsM3HY4U/5k2+g9Zl1OPsDx9eWizV5qId2rZ9f5b8cYmjJIO62UfD6qpv/dwF737n2GLDCQoQA9MGI2g8jXyw3hq2U3StCFrArNSpQddaT5IkvK/Y6zOTh/b3jo3FPQUNBCu3vKFlb0pb9A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(376002)(39860400002)(82310400011)(451199024)(186009)(1800799009)(46966006)(40470700004)(36840700001)(6666004)(966005)(478600001)(83380400001)(1076003)(2616005)(426003)(336012)(26005)(2906002)(6916009)(41300700001)(54906003)(316002)(70206006)(44832011)(70586007)(5660300002)(8676002)(4326008)(8936002)(36756003)(40460700003)(40480700001)(36860700001)(47076005)(86362001)(81166007)(82740400003)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 09:03:07.8726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8044bdb5-d2ee-446f-b571-08dbaa011829
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4228
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This fixes the below warnings

drivers/i2c/busses/i2c-cadence.c:221: warning: Function parameter or
member 'rinfo' not described in 'cdns_i2c'

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308171510.bKHBcZQW-lkp@intel.com/
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
Update I2C comment

 drivers/i2c/busses/i2c-cadence.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 9849f4502570..de3f58b60dce 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -182,6 +182,7 @@ enum cdns_i2c_slave_state {
  * @reset:		Reset control for the device
  * @quirks:		flag for broken hold bit usage in r1p10
  * @ctrl_reg:		Cached value of the control register.
+ * @rinfo:		I2C GPIO recovery information
  * @ctrl_reg_diva_divb: value of fields DIV_A and DIV_B from CR register
  * @slave:		Registered slave instance.
  * @dev_mode:		I2C operating role(master/slave).
-- 
2.17.1

