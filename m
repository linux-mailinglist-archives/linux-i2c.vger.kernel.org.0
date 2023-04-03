Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9FC6D5091
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 20:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233282AbjDCSc7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Apr 2023 14:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233226AbjDCSct (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Apr 2023 14:32:49 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9508C270F;
        Mon,  3 Apr 2023 11:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1zqCduz4WlpLoK0o3pcTWppmoqxxZiQAp99kDcOvD7OgjiYlm0NRkpJm0uSKI+b+2zgOIaC7l4AXsUnO+xrm8OVvqSDbSBgiKfbUfZi7lLKiSkEp5NjbyReaoQG7RzS/89gBdTeaqDp8VcdLDSv4LO0Smkfw3UeG7l14zuTHbJObNiUW09nUxiEZeT1ThAQLUBRAZDnPI7gzVLODK2QkY3/r4VxjNAQRKs0zfYSUHo1ubiTLNQ/9LoPEeMLlNXbPm8tN8HFQ1X95Tw9hW20o/2flaGY6jqPZkekdr5R7pyKVEYl2TzemA+fapsNG9dWkezRYEZ3mR7NRPUCPHNFVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATpuEFcUgIFn5/ieuusPA4zt5QZhLXuduUQD0LNxC00=;
 b=EhJ4lS+yBsCrf/1VROEtCLq+vf+1YLy7kbsoDCeVM8X2jJ5jv/B6Dpm6KlEq+e47GLtym6zlVj/8+zQ7BtaF2R2cd9Cg8WnF6uvGdBdOQ62SIc5Tjr3zAkuz4HvXaTAcAXRi13hQUvCYQUWTSGoF4a9Sue6TvmwfDP7soo32Qnh7ToGDHYKAK1Hq7JU9oagpB6CfgCLw86O/FGeoxKoMcqRj0ttk7vVlW5QkL+YZhcHGLQPXuwMV0XHy0pDDylwCT7vfpriM/sIPQeFQqqp5VB9j4VK9HI80MBGi5dFrByYl05zQYia7gkeXm+rtzpdRzlslF9oh5Nz7ttVpXCJORw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATpuEFcUgIFn5/ieuusPA4zt5QZhLXuduUQD0LNxC00=;
 b=Tzt43kGguH3pxNKVqkVNzpLS9b84q1kXV/rNelQI116yeYSZGw8mDy+7SryWWh7c2HqrZNxyTLq20KSL4+6VzyiYZajP9nUz/0tbBxswolYGi3dfpCaAoFANCWGopXpnUKTC5UWE+yr9e0KUXOyCpeF81zsa81PCt4rgIRXpLHM=
Received: from BL1PR13CA0200.namprd13.prod.outlook.com (2603:10b6:208:2be::25)
 by IA0PR12MB8838.namprd12.prod.outlook.com (2603:10b6:208:483::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 18:32:42 +0000
Received: from BL02EPF000108E9.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::be) by BL1PR13CA0200.outlook.office365.com
 (2603:10b6:208:2be::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.26 via Frontend
 Transport; Mon, 3 Apr 2023 18:32:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108E9.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 3 Apr 2023 18:32:41 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 3 Apr
 2023 13:32:32 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        John Allen <john.allen@amd.com>
CC:     Held Felix <Felix.Held@amd.com>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, Mark Hasemeyer <markhas@chromium.org>,
        "Grzegorz Bernacki" <gjb@semihalf.com>,
        =?UTF-8?q?Jan=20D=C4=85bro=C5=9B?= <jsd@semihalf.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        "David S. Miller" <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
Subject: [PATCH v8 1/6] crypto: ccp: Drop extra doorbell checks
Date:   Mon, 3 Apr 2023 13:32:10 -0500
Message-ID: <20230403183216.3493-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230403183216.3493-1-mario.limonciello@amd.com>
References: <20230403183216.3493-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E9:EE_|IA0PR12MB8838:EE_
X-MS-Office365-Filtering-Correlation-Id: ac15c867-b862-4a5d-9c08-08db3471cf4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5UQ6Bi5UfytDMt8pAjhyFYe+DlVHb8chJIyfTQTlegTDV5GMvx+IZg4asojidEbVFffFkz2RGqcz7BZeAQfcybR23nNhLdgkY1BVVafjwYDHPRL00zjEXM8d2CmFAg9cxN3i4Z6XBn+4hZ2fNOUMO+jHcCTo/vNBKAPEdKsGrq7UAPBYaGEe8/17FoALvEof5YGX7CH7W41Lf4lKMuEhCm9hFOyovRN3UA4M5q5ZF67x+LXV+VM4aRGsNh+WnZdLY4yFJoAVh4qgyUBA3cXTYdAvye+dU/JRL92bluBM5O11ktftFcVC9lmCUmfmNLRnCYyE2O45desdxfJzGR077ihYkmG1zvd3r5jpeTTNXIWIMbV8pWJ6srMpMZFuo5Zl1AwBZwl/53aPzuUIkTM07lMHCywGAe+1mL3Bo5BqZtS3mVlavvsz7xBxI9eBPJrIciu/NEwW5Q3TrxfHVw7hsL2zv3v0HSz+B//Hc+UViqmMmwzy+YrZQL+TUWbqo1odZjkVm2CaXKYHdbtMGQnGatwO7KC8jCfjelUJFLoNqHcyPNmBIWg9jCi6AaGqkcoxzx6s0ZiWvpXNEO9gJ9aIYc+UqtXFzbOHj/tqsXa3Q+fz63DuBnX/vJ8kmgVw7u7ZGXE+XGksaptaFrX1WUIwJOq+4it8dsGTArNmoMbFqNoZjEUKmdB0GR3CiO/WT0c20VO+ggbEJaoigSlUBEAzKtvJLhWxEARMCQYeyz9dgII=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199021)(40470700004)(46966006)(36840700001)(2906002)(44832011)(81166007)(356005)(5660300002)(82740400003)(70206006)(8936002)(70586007)(41300700001)(36860700001)(4326008)(8676002)(36756003)(1076003)(40460700003)(110136005)(54906003)(316002)(47076005)(2616005)(6636002)(83380400001)(82310400005)(336012)(426003)(86362001)(16526019)(478600001)(186003)(26005)(6666004)(40480700001)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 18:32:41.6375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac15c867-b862-4a5d-9c08-08db3471cf4b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8838
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The doorbell register set used for I2C arbitration is dedicated for this
purpose and there is no need to utilize other safety checks the platform
access register set uses.

Suggested-by: Mark Hasemeyer <markhas@chromium.org>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Mark Hasemeyer <markhas@chromium.org>
Tested-by: Mark Hasemeyer <markhas@chromium.org>
---
 drivers/crypto/ccp/platform-access.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/crypto/ccp/platform-access.c b/drivers/crypto/ccp/platform-access.c
index b51fb1196932..1ad3a0a512b1 100644
--- a/drivers/crypto/ccp/platform-access.c
+++ b/drivers/crypto/ccp/platform-access.c
@@ -20,14 +20,6 @@
 
 #define PSP_CMD_TIMEOUT_US	(500 * USEC_PER_MSEC)
 
-/* Doorbell shouldn't be ringing */
-static int check_doorbell(u32 __iomem *doorbell)
-{
-	u32 tmp;
-
-	return readl_poll_timeout(doorbell, tmp, tmp != 0, 0, PSP_CMD_TIMEOUT_US);
-}
-
 /* Recovery field should be equal 0 to start sending commands */
 static int check_recovery(u32 __iomem *cmd)
 {
@@ -156,18 +148,6 @@ int psp_ring_platform_doorbell(int msg)
 
 	mutex_lock(&pa_dev->doorbell_mutex);
 
-	if (check_doorbell(button)) {
-		dev_dbg(psp->dev, "doorbell is not ready\n");
-		ret = -EBUSY;
-		goto unlock;
-	}
-
-	if (check_recovery(cmd)) {
-		dev_dbg(psp->dev, "doorbell command in recovery\n");
-		ret = -EBUSY;
-		goto unlock;
-	}
-
 	if (wait_cmd(cmd)) {
 		dev_dbg(psp->dev, "doorbell command not done processing\n");
 		ret = -EBUSY;
-- 
2.34.1

